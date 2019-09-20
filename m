Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE5AB8AF4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 08:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C23A6EA7A;
	Fri, 20 Sep 2019 06:18:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872C36EA7A
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 06:18:03 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F6FA207FC;
 Fri, 20 Sep 2019 06:18:01 +0000 (UTC)
Date: Fri, 20 Sep 2019 08:18:00 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Roman Stratiienko <roman.stratiienko@globallogic.com>
Subject: Re: [PATCH] drm/sun4i: Use vi plane as primary
Message-ID: <20190920061800.65sm6jth2afatsvl@gilmour>
References: <20190919123703.8545-1-roman.stratiienko@globallogic.com>
 <20190919171754.x6lq73cctnqsjr4v@gilmour>
 <104595190.vWb6g8xIPX@jernej-laptop>
 <CAODwZ7sPG+_YvnLBU11uYaNpDFthLOkcYXsd=ZQtM+88+cPi9A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAODwZ7sPG+_YvnLBU11uYaNpDFthLOkcYXsd=ZQtM+88+cPi9A@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568960282;
 bh=e2hNmqSZJCH/Q0fAgiT3xYgideDTi8tg3iV8O1/wANk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mWmVWP9+tSHhxq49vGb0S8n+iG4TpXtGHwiklAduxT4Sm1No1kl2dPhKxyjp33P5a
 Ph9Uqzcjs6AYhiyDi0tOpqjmqHglk1Tm29f0dFmnwFSIHZdmyZoG3MqdUNSR9DpXEs
 +Eoszmv5t8BYa+ROzg4dkarxkQKi9BzCgRxSjn4s=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1887475512=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1887475512==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p55jde6mff27vfkr"
Content-Disposition: inline


--p55jde6mff27vfkr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Sep 19, 2019 at 11:03:26PM +0300, Roman Stratiienko wrote:
> Actually, I beleive this is True solution, and current one is wrong.  Let
> me explain why.
>
> De2. 0 was designed to match Android hwcomposer hal requirements IMO.
> You can easily agree with this conclusion by comparing Composer HAL and
> De2. 0 hardware manuals.
>
> I faced at least 4 issues when try to run Android using the mainline kernel
> sun8i mixer implementation. Current one, missing pixel formats (my previous
> patch), missing plane alpha and rotation properties. I plan to fix it and
> also send appropriate solution to the upstream.
>
> To achieve optimal UI performance Android requires at least 4 ui layers to
> make screen composition. Current patch enables 4th plane usable.

Note that you can also get 4 UI planes by enabling more than one UI
layer per channel. You wouldn't be able to use alpha between each
plane of a given channel, but we can use a similar trick than what we
did for the pipes in the sun4i backend.

Maxime

--p55jde6mff27vfkr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXYRvGAAKCRDj7w1vZxhR
xVsqAQCxwRn470B2REaVhb6qgjk9gRnJgE2i6CEATPRGAMcSHQD/d3HgVsQHduOw
gSks8IiI1O6jB8IS0OoGeSFJiwoMqAY=
=JHY0
-----END PGP SIGNATURE-----

--p55jde6mff27vfkr--

--===============1887475512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1887475512==--
