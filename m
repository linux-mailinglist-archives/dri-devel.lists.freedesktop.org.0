Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0128073FE
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 16:53:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E7A710E121;
	Wed,  6 Dec 2023 15:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70FB710E121;
 Wed,  6 Dec 2023 15:53:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 622EBB82273;
 Wed,  6 Dec 2023 15:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB05EC433C7;
 Wed,  6 Dec 2023 15:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701877979;
 bh=LdilzxE/iMOghbtMhroel8TLLoUeNyWvQxNjGLcFQxg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dG5FbRPSZTX+0u3Y6Tl4ST0ST4XjGLuLGnV8NDPUGcjjdXR1vB7ltYsTv6+JTFnjb
 2rv7QSw7YD256UtGdWjFPApgCXAb/JL5wE6iI6jqR2uCOctjhoGm+8oZCLsfdDyCFN
 LuEJVRwETo05SyZIO2mhrQ8HypUU/fJk767jVPoAMFfcqMpSOMeSL42PQ7HpaRwDHA
 HNkQUllBDW34XJRWu5OeNsu5XTo+qH4Xg6MDYfVaa/j5Zw2COXLt921pggFUHRnQRv
 dLgtwHe/tpQJaxCtyvmXnmoj1mGb/7OgtgaMiqJaCTjbVAwLUOSSf0HkEIjqRenDe6
 aObhphsc5zi0Q==
Date: Wed, 6 Dec 2023 16:52:56 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RESEND v2 1/3] drm/encoder: register per-encoder debugfs
 dir
Message-ID: <mibvyyc7kbzoorax4a2bycwhtqu2nzdjtdvzmhj6znbg5kpsxu@jayfluamjtmy>
References: <20231203115315.1306124-1-dmitry.baryshkov@linaro.org>
 <20231203115315.1306124-2-dmitry.baryshkov@linaro.org>
 <9ecab61b-1e79-464b-b3e2-ff3af8aee537@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ydee35nk74wgmf4h"
Content-Disposition: inline
In-Reply-To: <9ecab61b-1e79-464b-b3e2-ff3af8aee537@sirena.org.uk>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ydee35nk74wgmf4h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Tue, Dec 05, 2023 at 04:13:41PM +0000, Mark Brown wrote:
> On Sun, Dec 03, 2023 at 02:53:13PM +0300, Dmitry Baryshkov wrote:
>=20
> > Each of connectors and CRTCs used by the DRM device provides debugfs
> > directory, which is used by several standard debugfs files and can
> > further be extended by the driver. Add such generic debugfs directories
> > for encoder.
>=20
> Today's -next fails to boot an imx_v6_v7_defconfig on at least the UDOO
> dual and quad platforms, based on i.MX6DL and i.MX6Q respectively.
> multi_v7_defconfig looks fine on the same boards, it's just the i.MX
> specific config that's failing.  Nothing else in my CI appears impacted.
> We get a NULL pointer defererence while bringing up the display
> subsystem:
>=20
> [    1.392715] imx-drm display-subsystem: bound imx-ipuv3-crtc.7 (ops 0xc=
0f9a490)
> [    1.400013] imx-drm display-subsystem: bound 120000.hdmi (ops 0xc0f9af=
80)
> [    1.407193] 8<--- cut here ---
> [    1.410256] Unable to handle kernel NULL pointer dereference at virtua=
l address 00000010 when read
>=20
> ...
>=20
> [    1.891882]  drm_debugfs_encoder_add from drm_encoder_register_all+0x2=
0/0x60
> [    1.898954]  drm_encoder_register_all from drm_modeset_register_all+0x=
34/0x70
> [    1.906116]  drm_modeset_register_all from drm_dev_register+0x140/0x288
> [    1.912765]  drm_dev_register from imx_drm_bind+0xd0/0x128
> [    1.918284]  imx_drm_bind from try_to_bring_up_aggregate_device+0x164/=
0x1c4
> [    1.925275]  try_to_bring_up_aggregate_device from __component_add+0x9=
0/0x13c
>=20
> Full log at:
>=20
>    https://lava.sirena.org.uk/scheduler/job/308781
>=20
> A bisect identfied this patch (in -next as caf525ed45b4960b4) as being
> the commit that introduced the issue, bisect log below.  I've not done
> any other investigation but the commit does seem plausibly related to
> the backtrace in the oops.

I think it's the same issue than the one fixed by:
https://lore.kernel.org/all/20231205130631.3456986-1-m.szyprowski@samsung.c=
om/

Maxime

--ydee35nk74wgmf4h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXCY2AAKCRDj7w1vZxhR
xXkhAQDYVsqvq/B7gQ5Gfle74Y/omCL44y/CEojB/xSWNBy8eAD/UL8LRTRWsR8d
vDESXJ/WbtFvOf5mQYeJ9MmC1GARHgg=
=LSR5
-----END PGP SIGNATURE-----

--ydee35nk74wgmf4h--
