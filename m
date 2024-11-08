Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7029C251D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 19:52:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296F410E28E;
	Fri,  8 Nov 2024 18:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hV6unLtf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E300510E28E
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 18:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1731091950;
 bh=zzcz+Stq2T7s9D0cmgD0YFLHantSHMsqXWl51R2tUCg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hV6unLtfPWrM3YOLJ3wA7SThBaEEZQUBcI+28bEdF449hvRESbGdf/cxhSau/LDXj
 U4PLuKGLJi5AVpr2RzIVKRlSMF68j4cN7NaM+WbdP3aoeW+M3fT51wYXmMJ/oYCCaI
 OK0XQVfsVTlxDKS9QvhttqVeJTs20de7AdeynuA3pIQW/a1b1JAdSRFXGWT2/0fMUe
 YjYiQxqZPToVWZwZhkp4BZLmYf4cWVpG8rG4O7yTjvKwQGRvo9mklMhmg2IuSnUYnh
 VI8Ce4h/bSmBDVLl6xy3wjQ/YaiAks+iw2PzP+ztCv0poNFa02+85OBI84EudGSQQ9
 aYrqnvPfdSGZg==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: detlev)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C1CE817E376C;
 Fri,  8 Nov 2024 19:52:27 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stubner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Alexey Charkov <alchark@gmail.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v3 1/3] vop2: Add clock resets support
Date: Fri,  8 Nov 2024 13:50:39 -0500
Message-ID: <20241108185212.198603-2-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108185212.198603-1-detlev.casanova@collabora.com>
References: <20241108185212.198603-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

At the end of initialization, each VP clock needs to be reset before
they can be used.

Failing to do so can put the VOP in an undefined state where the
generated HDMI signal is either lost or not matching the selected mode.

This issue can be reproduced by switching modes multiple times.
Depending on the setup, after about 10 mode switches, the signal will be
lost and the value in register 0x890 (VSYNCWIDTH + VFRONT) will take the value
`0x0000018c`.
That makes VSYNCWIDTH=0, which is wrong.

Adding the clock resets after the VOP configuration fixes the issue.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 9873172e3fd3..6122eb18e6c9 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -17,6 +17,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <linux/swab.h>
 
 #include <drm/drm.h>
@@ -157,6 +158,7 @@ struct vop2_win {
 struct vop2_video_port {
 	struct drm_crtc crtc;
 	struct vop2 *vop2;
+	struct reset_control *dclk_rst;
 	struct clk *dclk;
 	unsigned int id;
 	const struct vop2_video_port_data *data;
@@ -1917,6 +1919,26 @@ static int us_to_vertical_line(struct drm_display_mode *mode, int us)
 	return us * mode->clock / mode->htotal / 1000;
 }
 
+static int vop2_clk_reset(struct vop2_video_port *vp)
+{
+	struct reset_control *rstc = vp->dclk_rst;
+	struct vop2 *vop2 = vp->vop2;
+	int ret;
+
+	if (!rstc)
+		return 0;
+
+	ret = reset_control_assert(rstc);
+	if (ret < 0)
+		drm_warn(vop2->drm, "failed to assert reset\n");
+	udelay(10);
+	ret = reset_control_deassert(rstc);
+	if (ret < 0)
+		drm_warn(vop2->drm, "failed to deassert reset\n");
+
+	return ret;
+}
+
 static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 				    struct drm_atomic_state *state)
 {
@@ -2057,6 +2079,8 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
 
+	vop2_clk_reset(vp);
+
 	drm_crtc_vblank_on(crtc);
 
 	vop2_unlock(vop2);
@@ -2708,6 +2732,12 @@ static int vop2_create_crtcs(struct vop2 *vop2)
 		vp->data = vp_data;
 
 		snprintf(dclk_name, sizeof(dclk_name), "dclk_vp%d", vp->id);
+		vp->dclk_rst = devm_reset_control_get_optional(vop2->dev, dclk_name);
+		if (IS_ERR(vp->dclk_rst)) {
+		        drm_err(vop2->drm, "failed to get %s reset\n", dclk_name);
+		        return PTR_ERR(vp->dclk_rst);
+		}
+
 		vp->dclk = devm_clk_get(vop2->dev, dclk_name);
 		if (IS_ERR(vp->dclk)) {
 			drm_err(vop2->drm, "failed to get %s\n", dclk_name);
-- 
2.47.0

