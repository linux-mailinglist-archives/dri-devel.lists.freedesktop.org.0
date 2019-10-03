Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02931C9F41
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 15:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D777F6E9C5;
	Thu,  3 Oct 2019 13:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 379A16E9C5
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 13:19:19 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9305F20862;
 Thu,  3 Oct 2019 13:19:18 +0000 (UTC)
Date: Thu, 3 Oct 2019 15:19:16 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [linux-sunxi] [PATCH 1/3] Revert "drm/sun4i: dsi: Change the
 start delay calculation"
Message-ID: <20191003131916.4bm22krapo5tz6oz@gilmour>
References: <20191001080253.6135-1-icenowy@aosc.io>
 <20191001080253.6135-2-icenowy@aosc.io>
 <CAMty3ZCjrM4MajJLyLwt-31mNnfVWghwatogtwVOvCt4gY0LZA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMty3ZCjrM4MajJLyLwt-31mNnfVWghwatogtwVOvCt4gY0LZA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570108759;
 bh=LZnYEhmvbSaW3Ofpm6bbGneZMRXJOF36LsLe7rVKsiE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b4NIq8WYP5JaZDLiCwCQTigNR4O6wgBuNSMj1dwMDtbDVOQj/iC0ui6TY73gL+SiS
 PhJWqYe90ubpY+i3nRet3oc7jB9RCXLLWy8xTzrW+N/EubHZtIg9CAxNkl3mtTMVFc
 lKEUIxFvgExGZqaLKkuZSvOyUEbVr7jMnXC/Pf9M=
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
Cc: David Airlie <airlied@linux.ie>, linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============0461520447=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0461520447==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gpjy7vewgc4imexw"
Content-Disposition: inline


--gpjy7vewgc4imexw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 03, 2019 at 12:38:43PM +0530, Jagan Teki wrote:
> On Tue, Oct 1, 2019 at 1:33 PM Icenowy Zheng <icenowy@aosc.io> wrote:
> >
> > This reverts commit da676c6aa6413d59ab0a80c97bbc273025e640b2.
> >
> > The original commit adds a start parameter to the calculation of the
> > start delay according to some old BSP versions from Allwinner. However,
> > there're two ways to add this delay -- add it in DSI controller or add
> > it in the TCON. Add it in both controllers won't work.
> >
> > The code before this commit is picked from new versions of BSP kernel,
> > which has a comment for the 1 that says "put start_delay to tcon". By
> > checking the sun4i_tcon0_mode_set_cpu() in sun4i_tcon driver, it has
> > already added this delay, so we shouldn't repeat to add the delay in DSI
> > controller, otherwise the timing won't match.
>
> Thanks for this change. look like this is proper reason for adding +
> 1. also adding bsp code links here might help for future reference.
>
> Otherwise,
>
> Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>

The commit log was better in this one. I ended up merging this one,
with your R-b.

Maxime

--gpjy7vewgc4imexw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZX1VAAKCRDj7w1vZxhR
xUuoAP4y5oTqiRELKb7+eBaUuQzrM0UnEaEFGgPGo3tNepr5MAD+JZ+yULsZi7ib
qWa9lYn9gfhY+hQfA+wQQBdXJWRJxgk=
=K3FM
-----END PGP SIGNATURE-----

--gpjy7vewgc4imexw--

--===============0461520447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0461520447==--
