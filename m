Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA153B8032F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC15210E86F;
	Wed, 17 Sep 2025 14:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hWYoLutd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF7510E86D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:47:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C28F64377E;
 Wed, 17 Sep 2025 14:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A97CC4CEE7;
 Wed, 17 Sep 2025 14:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758120424;
 bh=HLj2DGv7X+3GgN4bhH26Lcv2FafvzGSa38moFQKbr3M=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=hWYoLutdpGzJBRy9cqdChREz709dZkL1RbSG2YPcvN5weUO/BDqAHtTCjlsu1I839
 zZDFTe4lwW6IEFv6K8H6FLWVo8HZwV3Ef4Fw5la7zLa4kkwKkzmLQ8BsOHgIYIEMpg
 wTNSPuAgNd8Pirv29Px4MZfBHJuPZ5CDXVyqLXvEXMLFCKLFE66uz4LKqQ4lbWIir+
 v08HtM/CXtykRz/9jY1698zvoNV6n19WVrcqnOIWN1js8xBfdvPP1qkC4Fx/yLVV2N
 vBWKaOAQCQzGUCUWHCXklaDzSVDcIDVeKJAXh73ecsoDQ9Uoh3i6Qt9J+lX9EpHw6h
 x5SseSxHElXHQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:46:00 +0200
Subject: [PATCH v4 19/39] drm/imx-ipuv3: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-19-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1604; i=mripard@kernel.org;
 h=from:subject:message-id; bh=HLj2DGv7X+3GgN4bhH26Lcv2FafvzGSa38moFQKbr3M=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTi5fwbk231kgIulA4zbtoItBJfnynpx3jnOmB0yZ9
 cvSLyCvYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEyk8QFjrYCozfv1f35Lv//x
 KWnRwpcRdd92Jub2iPsrrJtc/c9G9MHerXXMpXe4epzig52ypgctYqxP3mSy7bRgnJii+NJcvc6
 HWRHn4tXXljCqbHp4akbepFDRkkslD6Wbtn3WXThZdprIxCUA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The imx-ipuv3 atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index 704c549750f950c3f0ce5d6c6f637d9d7b53fb69..df19560e41b4f5b0dce97ae03947abeaf99e0883 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -384,12 +384,11 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
 
 	if (WARN_ON(!new_state->crtc))
 		return -EINVAL;
 
 	crtc_state =
-		drm_atomic_get_existing_crtc_state(state,
-						   new_state->crtc);
+		drm_atomic_get_new_crtc_state(state, new_state->crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	ret = drm_atomic_helper_check_plane_state(new_state, crtc_state,
 						  DRM_PLANE_NO_SCALING,

-- 
2.50.1

