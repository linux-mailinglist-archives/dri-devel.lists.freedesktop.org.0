Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A45A144DE0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E032C6F420;
	Wed, 22 Jan 2020 08:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DBE6F427
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 08:46:20 +0000 (UTC)
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 412962465A;
 Wed, 22 Jan 2020 08:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579682780;
 bh=AepTZQnS41aFGnPgtfnFssNsH20gZiJLcFaGD27PRV0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lKE/jqr5coHc/wWfyg1XVzfBMwoTN0AhXWs9DT60kBanKLjyBiFKr2fllB1806A74
 +Rr8FQ5616OSPdnCwWeNrWpuI1lXV/wnZDKg0ZJtiGrakIj12v0wYeNSe7WEiV7AHQ
 6vIdT8z4Tfao3vHQoSBrDVNtmR0OUVIwCurppQHU=
Date: Wed, 22 Jan 2020 09:46:17 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/2] drm: sun4i: hdmi: Add support for sun4i HDMI
 encoder audio
Message-ID: <20200122084617.s2n4dqhwanmaxuch@gilmour.lan>
References: <20200120123326.30743-1-stefan@olimex.com>
 <20200120123326.30743-3-stefan@olimex.com>
 <20200121182905.pxs72ojqx5fz2gi3@gilmour.lan>
 <20200121182937.2ak72e4eklk4za2u@gilmour.lan>
 <20200121183247.GL4656@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20200121183247.GL4656@sirena.org.uk>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Stefan Mavrodiev <stefan@olimex.com>, David Airlie <airlied@linux.ie>,
 linux-sunxi@googlegroups.com, Vinod Koul <vkoul@kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============0413707980=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0413707980==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eo44jwmgblwjtd3w"
Content-Disposition: inline


--eo44jwmgblwjtd3w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 21, 2020 at 06:32:47PM +0000, Mark Brown wrote:
> On Tue, Jan 21, 2020 at 07:29:37PM +0100, Maxime Ripard wrote:
>
> > > Mark, our issue here is that we have a driver tied to a device that is
> > > an HDMI encoder. Obviously, we'll want to register into DRM, which is
> > > what we were doing so far, with the usual case where at remove /
> > > unbind time, in order to free the resources, we just retrieve our
> > > pointer to our private structure using the device's drvdata.
>
> > > Now, snd_soc_register_card also sets that pointer to the card we try
> > > to register, which is problematic. It seems that it's used to handle
> > > suspend / resume automatically, which in this case would be also not
> > > really fit for us (or rather, we would need to do more that just
> > > suspend the audio part).
>
> There's a drvdata field in the snd_soc_card for cases like this - would
> that work for you?

Ah, right, we could just retrieve the snd_soc_card in the unbind, and
the retrieve our structure that way. That's pretty simple :)

Stefan, I guess this is the easiest solution, we should just make sure
that there's a comment to explain why we retrieve snd_soc_card in the
unbind, since it's somewhat unusual.

Thanks!
Maxime

--eo44jwmgblwjtd3w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXigL2QAKCRDj7w1vZxhR
xWq1AP43hh7O1drKmKw4LWDcFL1e3jFnbiNLxBGwUtUAsT8hwwEA505uGh0lTCPZ
1dpI8BQYcJ5Zzjp9JGkU9Pm1KCyZMQA=
=vZhm
-----END PGP SIGNATURE-----

--eo44jwmgblwjtd3w--

--===============0413707980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0413707980==--
