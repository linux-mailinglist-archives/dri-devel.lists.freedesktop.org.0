Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5241FBF5BDF
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 12:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E1B10E2EE;
	Tue, 21 Oct 2025 10:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="TGUFXqDR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9383A10E2EC
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 10:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761041969;
 bh=y/xlBmCmud/5CWpIujKGb7vl0OQ2W7IHrhHnGXT37Ek=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=TGUFXqDRSCsxPLa4XyRqdMDeh3Fh17vn1mJqvDSwrNR0XHN1RRcg3X7seVsrywUVB
 Jw57bObsYYG9fyvwKf+lWZmhFZH0ymbABmeticfeZR31rR9+FV153ZmUtUPoJ+AhkB
 mPLy+EC4M9wzM1w3vmr8vxRPCLqpHSFpG8K7at9FRwLic1oI3QLc6YSjVqKv4mSEMM
 iY9eD0dfJw2NV6hFyh/kRUSOCJRp1tyAB9y+BVSChgCRvFgFqKOk7XqUFDkj5ViqVI
 RjT9zHGzsEczhgd1sW7xUmEHf9mFxaK6TpfkX5uRuiVBv27FuRFm0+pwkaTdmRdABV
 hbXu2BNhAoFyg==
Received: from localhost (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 1BB4417E131B;
 Tue, 21 Oct 2025 12:19:29 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 21 Oct 2025 13:19:14 +0300
Subject: [PATCH v3 1/5] drm/rockchip: vop2: Check bpc before switching DCLK
 source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-rk3588-10bpc-v3-1-3d3eed00a6db@collabora.com>
References: <20251021-rk3588-10bpc-v3-0-3d3eed00a6db@collabora.com>
In-Reply-To: <20251021-rk3588-10bpc-v3-0-3d3eed00a6db@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>
X-Mailer: b4 0.14.3
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

When making use of the HDMI PHY PLL as a VOP2 DCLK source, it's output
rate does normally match the mode clock.  But this is only applicable
for default color depth of 8 bpc.  For higher depths, the output clock
is further divided by the hardware according to the formula:

  output rate = PHY PLL rate * 8 / bpc

Hence there is no need for VOP2 to compensate for bpc when adjusting
DCLK, but it is required to do so when computing its maximum operating
frequency.

Take color depth into consideration before deciding to switch DCLK
source.

Reviewed-by: Daniel Stone <daniels@collabora.com>
Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 58 +++++++++++++++-------------
 1 file changed, 32 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 284c8a048034..54176298a53b 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -101,7 +101,7 @@ enum vop2_afbc_format {
 	VOP2_AFBC_FMT_INVALID = -1,
 };
 
-#define VOP2_MAX_DCLK_RATE		600000000
+#define VOP2_MAX_DCLK_RATE		600000000UL
 
 /*
  * bus-format types.
@@ -1742,36 +1742,42 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 	 * Switch to HDMI PHY PLL as DCLK source for display modes up
 	 * to 4K@60Hz, if available, otherwise keep using the system CRU.
 	 */
-	if ((vop2->pll_hdmiphy0 || vop2->pll_hdmiphy1) && clock <= VOP2_MAX_DCLK_RATE) {
-		drm_for_each_encoder_mask(encoder, crtc->dev, crtc_state->encoder_mask) {
-			struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
-
-			if (rkencoder->crtc_endpoint_id == ROCKCHIP_VOP2_EP_HDMI0) {
-				if (!vop2->pll_hdmiphy0)
+	if (vop2->pll_hdmiphy0 || vop2->pll_hdmiphy1) {
+		unsigned long max_dclk = DIV_ROUND_CLOSEST_ULL(VOP2_MAX_DCLK_RATE * 8,
+							       vcstate->output_bpc);
+		if (clock <= max_dclk) {
+			drm_for_each_encoder_mask(encoder, crtc->dev, crtc_state->encoder_mask) {
+				struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
+
+				if (rkencoder->crtc_endpoint_id == ROCKCHIP_VOP2_EP_HDMI0) {
+					if (!vop2->pll_hdmiphy0)
+						break;
+
+					if (!vp->dclk_src)
+						vp->dclk_src = clk_get_parent(vp->dclk);
+
+					ret = clk_set_parent(vp->dclk, vop2->pll_hdmiphy0);
+					if (ret < 0)
+						drm_warn(vop2->drm,
+							 "Could not switch to HDMI0 PHY PLL: %d\n",
+							 ret);
 					break;
+				}
 
-				if (!vp->dclk_src)
-					vp->dclk_src = clk_get_parent(vp->dclk);
+				if (rkencoder->crtc_endpoint_id == ROCKCHIP_VOP2_EP_HDMI1) {
+					if (!vop2->pll_hdmiphy1)
+						break;
 
-				ret = clk_set_parent(vp->dclk, vop2->pll_hdmiphy0);
-				if (ret < 0)
-					drm_warn(vop2->drm,
-						 "Could not switch to HDMI0 PHY PLL: %d\n", ret);
-				break;
-			}
+					if (!vp->dclk_src)
+						vp->dclk_src = clk_get_parent(vp->dclk);
 
-			if (rkencoder->crtc_endpoint_id == ROCKCHIP_VOP2_EP_HDMI1) {
-				if (!vop2->pll_hdmiphy1)
+					ret = clk_set_parent(vp->dclk, vop2->pll_hdmiphy1);
+					if (ret < 0)
+						drm_warn(vop2->drm,
+							 "Could not switch to HDMI1 PHY PLL: %d\n",
+							 ret);
 					break;
-
-				if (!vp->dclk_src)
-					vp->dclk_src = clk_get_parent(vp->dclk);
-
-				ret = clk_set_parent(vp->dclk, vop2->pll_hdmiphy1);
-				if (ret < 0)
-					drm_warn(vop2->drm,
-						 "Could not switch to HDMI1 PHY PLL: %d\n", ret);
-				break;
+				}
 			}
 		}
 	}

-- 
2.51.0

