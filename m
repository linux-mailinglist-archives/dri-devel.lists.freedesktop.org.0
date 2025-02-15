Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87758A36A36
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 01:56:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BD210E4A0;
	Sat, 15 Feb 2025 00:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pjmbm3Wg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5281C10E119
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 00:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739580955;
 bh=g4ZiNjBB56+mnqDk9Mu4uIOUw/V5PSViIE9EHg+P5Ss=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=pjmbm3Wg1oS7pYIFqz84AP0iP/Y3H9SiuKck4O7M+cykW0FWNskBKIlbXeSKER3MP
 cLDu5/Ujwfub5TR9NVnxISKz3jzh7/GbLmCQCEqycPR9r3QIqM2WDDg9Xk1GhCNJxa
 VRRWQi8cPmMMjz7fIMtEUc6a5gmKQ7R+XEbKYd4a9v7HVZafF00FwMcL0r2iLLxojg
 lf1RCv+55HHXjOCQfX48N8H4jYqccOV1xJFDv851ZalDN20ueVfQPG1QHZdDnwP0Gv
 EvvL64pqURZVMLbfcnK9nCpIPciz0gCHtu0qVI4pV8lBuAaMdy5so2lObCo13JG05c
 xDq86Gt4yNfJg==
Received: from localhost (144.232.221.87.dynamic.jazztel.es [87.221.232.144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id C4D1D17E0E95;
 Sat, 15 Feb 2025 01:55:54 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 15 Feb 2025 02:55:37 +0200
Subject: [PATCH 1/4] drm/rockchip: vop2: Improve display modes handling on
 RK3588 HDMI1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250215-vop2-hdmi1-disp-modes-v1-1-81962a7151d6@collabora.com>
References: <20250215-vop2-hdmi1-disp-modes-v1-0-81962a7151d6@collabora.com>
In-Reply-To: <20250215-vop2-hdmi1-disp-modes-v1-0-81962a7151d6@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
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

The RK3588 specific implementation is currently quite limited in terms
of handling the full range of display modes supported by the connected
screens, e.g. 2560x1440@75Hz, 2048x1152@60Hz, 1024x768@60Hz are just a
few of them.

Additionally, it doesn't cope well with non-integer refresh rates like
59.94, 29.97, 23.98, etc.

Make use of HDMI1 PHY PLL as a more accurate DCLK source to handle
all display modes up to 4K@60Hz.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index afc946ead87091373605e59dbca281a9e91bea57..f1700b2fabf0b0d000cf3c9cf5f06ca791b87499 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -216,6 +216,7 @@ struct vop2 {
 	struct clk *aclk;
 	struct clk *pclk;
 	struct clk *pll_hdmiphy0;
+	struct clk *pll_hdmiphy1;
 
 	/* optional internal rgb encoder */
 	struct rockchip_rgb *rgb;
@@ -2270,11 +2271,14 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 	 * Switch to HDMI PHY PLL as DCLK source for display modes up
 	 * to 4K@60Hz, if available, otherwise keep using the system CRU.
 	 */
-	if (vop2->pll_hdmiphy0 && clock <= VOP2_MAX_DCLK_RATE) {
+	if ((vop2->pll_hdmiphy0 || vop2->pll_hdmiphy1) && clock <= VOP2_MAX_DCLK_RATE) {
 		drm_for_each_encoder_mask(encoder, crtc->dev, crtc_state->encoder_mask) {
 			struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
 
 			if (rkencoder->crtc_endpoint_id == ROCKCHIP_VOP2_EP_HDMI0) {
+				if (!vop2->pll_hdmiphy0)
+					break;
+
 				if (!vp->dclk_src)
 					vp->dclk_src = clk_get_parent(vp->dclk);
 
@@ -2284,6 +2288,20 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 						 "Could not switch to HDMI0 PHY PLL: %d\n", ret);
 				break;
 			}
+
+			if (rkencoder->crtc_endpoint_id == ROCKCHIP_VOP2_EP_HDMI1) {
+				if (!vop2->pll_hdmiphy1)
+					break;
+
+				if (!vp->dclk_src)
+					vp->dclk_src = clk_get_parent(vp->dclk);
+
+				ret = clk_set_parent(vp->dclk, vop2->pll_hdmiphy1);
+				if (ret < 0)
+					drm_warn(vop2->drm,
+						 "Could not switch to HDMI1 PHY PLL: %d\n", ret);
+				break;
+			}
 		}
 	}
 
@@ -3733,6 +3751,12 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(vop2->pll_hdmiphy0);
 	}
 
+	vop2->pll_hdmiphy1 = devm_clk_get_optional(vop2->dev, "pll_hdmiphy1");
+	if (IS_ERR(vop2->pll_hdmiphy1)) {
+		drm_err(vop2->drm, "failed to get pll_hdmiphy1\n");
+		return PTR_ERR(vop2->pll_hdmiphy1);
+	}
+
 	vop2->irq = platform_get_irq(pdev, 0);
 	if (vop2->irq < 0) {
 		drm_err(vop2->drm, "cannot find irq for vop2\n");

-- 
2.48.1

