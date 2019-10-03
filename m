Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D468C9D78
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 13:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40806E121;
	Thu,  3 Oct 2019 11:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A93D6E121
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 11:38:07 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8E93F20830;
 Thu,  3 Oct 2019 11:38:06 +0000 (UTC)
Date: Thu, 3 Oct 2019 13:38:02 +0200
From: Maxime Ripard <mripard@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: sun8i-ui/vi: Fix layer zpos change/atomic modesetting
Message-ID: <20191003113802.tyecgkb6r3piin35@gilmour>
References: <20190914220337.646719-1-megous@megous.com>
 <20190918141734.kerdbbaynwutrxf6@gilmour>
 <20190918152309.j2dbu63jaru6jn2t@core.my.home>
 <20190918201617.5gwzmshoxbcxbmrx@gilmour>
 <20190919122058.fhpuafogdq7oir2d@core.my.home>
 <20190919131244.35hmnp7jizegltp7@core.my.home>
 <20190920151142.ijistzhtcaenehx6@gilmour>
 <20190924124054.743s3tlw5qirghxo@core.my.home>
MIME-Version: 1.0
In-Reply-To: <20190924124054.743s3tlw5qirghxo@core.my.home>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570102687;
 bh=4BaUv651uQ8A7KlN2UxSjzCEumhRHP+vUl19072tLI8=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=nTaLbUPMGOxcWPoKWtstPj+OruWKIfX93yH6RGADcTxhI5wQ85xfK/fVRrj8m6y7q
 hXFjL7W1SMVlG0jC5ejWaO0yRl1inFT8RYTkii0f2OUOOUr4DS5ez+YtvbWSUrTJtg
 Ao0jTFijs0cQpJVFHqTco2iFODavLl5PspmMpfYg=
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
Content-Type: multipart/mixed; boundary="===============1090369559=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1090369559==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qi2vxuuefrx4z36d"
Content-Disposition: inline


--qi2vxuuefrx4z36d
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2019 at 02:40:54PM +0200, Ond=C5=99ej Jirman wrote:
> > >  On first run of the X server, only the black screen and the layer
> > >  containing the cursor is visible. Switching to console and back
> > >  corrects the situation.
> > >
> > >  I have dumped registers, and found out this:
> > >
> > >  (In both cases there are two enabled planes, plane 1 with zpos 0 and
> > >  plane 3 with zpos 1).
> > >
> > >  1) First Xorg run:
> > >
> > >    0x01101000 : 00000201
> > >    0x01101080 : 00000030
> > >
> > >    BLD_FILL_COLOR_CTL: (aka SUN8I_MIXER_BLEND_PIPE_CTL)
> > >      P1_EN
> > >
> > >    BLD_CH_RTCTL: (aka SUN8I_MIXER_BLEND_ROUTE)
> > >      P0_RTCTL channel0
> > >      P1_RTCTL channel3
> > >
> > >  2) After switch to console and back to Xorg:
> > >
> > >  0x01101000 : 00000301
> > >  0x01101080 : 00000031
> > >
> > >    BLD_FILL_COLOR_CTL:
> > >      P1_EN and P0_EN
> > >
> > >    BLD_CH_RTCTL:
> > >      P0_RTCTL channel1
> > >      P1_RTCTL channel3
> > >
> > >  What happens is that sun8i_ui_layer_enable() function may disable
> > >  blending pipes even if it is no longer assigned to its layer, because
> > >  of incorrect state/zpos tracking in the driver.
> > >
> > >  In particular, layer 1 is configured to zpos 0 and thus uses pipe 0.
> > >  When layer 3 is enabled by X server, sun8i_ui_layer_enable() will get
> > >  called with old_zpos=3D0 zpos=3D1, which will lead to disabling of p=
ipe 0.
> > >
> > >  In general this issue can happen to any layer during enable or zpos
> > >  changes on multiple layers at once.
> > >
> > >  To correct this we now pass previous enabled/disabled state of the
> > >  layer, and pass real previous zpos of the layer to
> > >  sun8i_ui_layer_enable() and rework the sun8i_ui_layer_enable() funct=
ion
> > >  to react to the state changes correctly. In order to not complicate
> > >  the atomic_disable callback with all of the above changes, we simply
> > >  remove it and implement all the chanes as part of atomic_update, whi=
ch
> > >  also reduces the code duplication.
> >
> > I'm not even sure why we need that old state. Can't we just reset
> > completely the whole thing and do the configuration all over again?
>
> That would be nice from a dev standpoint if we can get a complete state f=
or all
> planes at once from DRM core, but how? DRM helper gives callbacks
> for updating individual planes with prev and new state. These individual =
layer
> change notifications don't map nicely to how pipes are represented in the=
 mixer
> registers.

You have a pointer to the full DRM state in the state field, so you
have that option.

The other option is just to clear everything in atomic_begin, update
each plane in atomic_update, and then trigger the readout of the new
register values in atomic_commit.

> > That description just looks to me like the reset is not done properly,
> > and now we have to deal with the fallouts later on.
>
> What in particular?

Having to care about the old state? If the reset was done properly, we
wouldn't have to care.

> > >  To make this all work, initial zpos positions of all layers need to =
be
> > >  restored to initial values on reset.
> >
> > And this also fixes a whole other bunch of issues, and can be made
> > very trivially in a separate patch.
>
> Maybe reset should also reset registers?

The reset callback actually does the opposite, it resets a DRM
state. If anything, we want to initialize the state in reset by
reading the registers, not the opposite.

Maxime

--qi2vxuuefrx4z36d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZXdmgAKCRDj7w1vZxhR
xZ0SAP9NyoDFPOTub71RtJfUPVLhTn7deMGFbh2/a7biQpr1RAD6AhwUbhme1G5A
xfIQ66SC7OUFD/mJXwo8tYUSbsuHAQs=
=2+bD
-----END PGP SIGNATURE-----

--qi2vxuuefrx4z36d--

--===============1090369559==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1090369559==--
