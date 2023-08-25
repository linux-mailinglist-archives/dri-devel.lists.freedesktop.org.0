Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE08788554
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 13:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC8210E12C;
	Fri, 25 Aug 2023 11:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB3B10E12C
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 11:03:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AEACC648D2;
 Fri, 25 Aug 2023 11:03:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F1BC433C8;
 Fri, 25 Aug 2023 11:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692961410;
 bh=PlBzCJRe8m65lt6EVWU83U+40jTlJi63qn6ZecOweZ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NSgBYasTx1ZoO2TlIe5UVLBtr21lPZSAhlDLEjbnRW2RyK5r8CtV+P5cMgCVg+69o
 2q0VGFXaTbZGss0/1u4CHsj8Lqryy0W++3BGJU5V9aeFiXrkY7YQZJzJlx416MhKpw
 ZZ1nBKIbfNuZ503/ic6w9IERhRIAio1nUVY/eV1l/n0r8tDpxA05K9wbuvr/EL2q2x
 6FyAi1CYZ9vmCK8ViwNO82FKdeeqjgUNdg2sZ8Vd2Zri3X6GZCmp10RmKuI2m6wpQH
 eTq7gBdn8KwxL66XGwOc5TaHXRteKYmbqzN/vqaymHDw8U2IG5yeJiKAakqHkuSYiV
 ITJss2Xl21Vzw==
Date: Fri, 25 Aug 2023 13:03:27 +0200
From: Maxime Ripard <mripard@kernel.org>
To: e.orlova@ispras.ru
Subject: Re: [QUESTION] drm/crtc: precondition for drm_crtc_init_with_planes()
Message-ID: <u366i76e3qhh3ra5oxrtngjtm2u5lterkekcz6y2jkndhuxzli@diujon4h7qwb>
References: <a830685d8b10a00cfe0a86db1ee9fb13@ispras.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dd5jtdgzjs64ofvs"
Content-Disposition: inline
In-Reply-To: <a830685d8b10a00cfe0a86db1ee9fb13@ispras.ru>
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
Cc: lvc-project@linuxtesting.org, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dd5jtdgzjs64ofvs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 01:18:46PM +0300, e.orlova@ispras.ru wrote:
> Documentation for drm_crtc_init_with_planes() in
> drivers/gpu/drm/drm_crtc.c states: =ABThe crtc structure should not be
> allocated with devm_kzalloc()=BB.
>=20
> However, in drivers/gpu/drm/stm/ltdc.c
> the 2nd argument of the function drm_crtc_init_with_planes()
> is a structure allocated with devm_kzalloc()
>=20
> Also, in
> drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> drivers/gpu/drm/logicvc/logicvc_crtc.c
> drivers/gpu/drm/meson/meson_crtc.c
> drivers/gpu/drm/mxsfb/lcdif_kms.c
> drivers/gpu/drm/mxsfb/mxsfb_kms.c
> drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> drivers/gpu/drm/sun4i/sun4i_crtc.c
> drivers/gpu/drm/tegra/dc.c
> drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> the 2nd argument of the function drm_crtc_init_with_planes()
> is a field of the structure allocated with devm_kzalloc()
>=20
> Is it correct or can it lead to any problems?

It can lead to use-after-free issues, that's why there's that comment :)

Maxime

--dd5jtdgzjs64ofvs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZOiKfwAKCRDj7w1vZxhR
xVg5AP9VzNEiKZOgh4Ize9Wh5DKiSx1eSPouvE8JTEP/WJsy+QEA1C5l5XrIknkg
Dp1X3M5uO0U25bmLkDl1x7lgHcKMBQE=
=sPcz
-----END PGP SIGNATURE-----

--dd5jtdgzjs64ofvs--
