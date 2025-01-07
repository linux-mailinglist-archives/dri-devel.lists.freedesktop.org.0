Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AFFA043FC
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 16:16:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C74310E715;
	Tue,  7 Jan 2025 15:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C/6xljy6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FF210E71C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 15:16:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 65BA75C5F26;
 Tue,  7 Jan 2025 15:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D789CC4CEDD;
 Tue,  7 Jan 2025 15:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736262988;
 bh=WWqX2wcTO6X5JJoV2eYtL+Wpug0FITuQLb5dI71dpkw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C/6xljy6o+BgNViTGbVOKBiQE4Io0fv5KZq0db6QkorelbLqpywQxkDBg1Yc8aGX6
 KJrtzu1ibpjijfvvK6kBg2Sv3hSk7HaWFoLkMHDec/+/pJWzIdqYH9MSyF86poP1QX
 TCRYBBgvC0pu0FlPJOOIxlb/KngOUUGQe11dXl3tcKELoZavk2/J0sDDU1UbGYHx2C
 7/8Swdg6A2IGQHgsCiAZzKeMOAEZwi/185LLjNjvLR71qORb4iYlr8vEn0g8Ijbb9z
 P3FoboFgrX045jM1I8hFE/fZaDMiVmRpwnN8zi6E/FPGQ+vmrsC5aXkmu1jARIyUhE
 lRgvJUndMXrng==
Date: Tue, 7 Jan 2025 16:16:25 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/connector: hdmi: Handle NULL display mode in state
 check helper
Message-ID: <20250107-dangerous-shapeless-bandicoot-dc74dd@houat>
References: <20250107-hdmi-conn-null-mode-v1-1-fff4be46d106@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="tedy5755xr6wbhum"
Content-Disposition: inline
In-Reply-To: <20250107-hdmi-conn-null-mode-v1-1-fff4be46d106@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--tedy5755xr6wbhum
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/connector: hdmi: Handle NULL display mode in state
 check helper
MIME-Version: 1.0

On Tue, Jan 07, 2025 at 02:00:35AM +0200, Cristian Ciocaltea wrote:
> drm_atomic_helper_connector_hdmi_check() helper makes use of
> connector_state_get_mode() to obtain a drm_display_mode pointer, but it
> doesn't validate it, which may lead to a NULL pointer dereference in
> some cases, i.e. unloading a DRM module:
>=20
> [ 1002.910414] Unable to handle kernel NULL pointer dereference at virtua=
l address 0000000000000000
> [...]
> [ 1002.923833] Hardware name: Radxa ROCK 5B (DT)
> [ 1002.924819] pc : drm_match_cea_mode+0x30/0x280 [drm]
> [ 1002.925318] lr : hdmi_try_format_bpc+0x7c/0x580 [drm_display_helper]
> [...]
> [ 1002.932411] Call trace:
> [ 1002.932626]  drm_match_cea_mode+0x30/0x280 [drm] (P)
> [ 1002.933120]  hdmi_try_format_bpc+0x7c/0x580 [drm_display_helper]
> [ 1002.933662]  drm_atomic_helper_connector_hdmi_check+0x10c/0x478 [drm_d=
isplay_helper]
> [ 1002.934355]  drm_bridge_connector_atomic_check+0x20/0x40 [drm_display_=
helper]
> [ 1002.934993]  drm_atomic_helper_check_modeset+0x698/0xd28 [drm_kms_help=
er]
> [ 1002.935607]  drm_atomic_helper_check+0x28/0xb8 [drm_kms_helper]
> [ 1002.936143]  drm_atomic_check_only+0x794/0x988 [drm]
> [ 1002.936635]  drm_atomic_commit+0x60/0xe0 [drm]
> [ 1002.937082]  drm_atomic_helper_disable_all+0x184/0x218 [drm_kms_helper]
> [ 1002.937678]  drm_atomic_helper_shutdown+0x90/0x150 [drm_kms_helper]
> [ 1002.938243]  rockchip_drm_unbind+0x38/0x80 [rockchipdrm]
> [ 1002.938720]  component_master_del+0xac/0xf8
> [ 1002.939089]  rockchip_drm_platform_remove+0x34/0x78 [rockchipdrm]
> [...]
>=20
> Add the missing NULL check before passing the mode pointer further.
>=20
> Fixes: f035f4097f1e ("drm/connector: hdmi: Calculate TMDS character rate")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Looks good to me, but we need to provide a test for that case too

Maxime

--tedy5755xr6wbhum
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ31FSAAKCRAnX84Zoj2+
dlYFAYCjsLmbv0V0+cXlzVeP9rD2fZBvYyZi5GuUoDjMnUQJAW8OopPLdcXfpnDI
guuqHvkBgKW5wMC+xAcoe5E3bWicxyxZz4BB23NrZXy/bW1cUrOU+gtzxOgf1EM5
BgJcj9cwuw==
=i1YG
-----END PGP SIGNATURE-----

--tedy5755xr6wbhum--
