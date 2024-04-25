Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D0A8B292C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 21:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7365611A851;
	Thu, 25 Apr 2024 19:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623D511A84F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 19:55:15 +0000 (UTC)
Received: from i53875b01.versanet.de ([83.135.91.1] helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1s05BY-0005vK-29; Thu, 25 Apr 2024 21:55:12 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@theobroma-systems.com, hjc@rock-chips.com,
 andy.yan@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 2/2] drm/rockchip: vop2: configure layers for vp3 on rk3588
Date: Thu, 25 Apr 2024 21:55:06 +0200
Message-Id: <20240425195506.2935955-3-heiko@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240425195506.2935955-1-heiko@sntech.de>
References: <20240425195506.2935955-1-heiko@sntech.de>
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The rk3588 VOP2 has 4 video-ports, yet the driver currently only
configures the first 3, as used on the rk3568.

Add another block to configure the vp3 as well, if applicable.

Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 12 ++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 523880a4e8e74..1a327a9ed7ee4 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2303,6 +2303,7 @@ static void vop2_setup_alpha(struct vop2_video_port *vp)
 static void vop2_setup_layer_mixer(struct vop2_video_port *vp)
 {
 	struct vop2 *vop2 = vp->vop2;
+	const struct vop2_data *vop2_data = vop2->data;
 	struct drm_plane *plane;
 	u32 layer_sel = 0;
 	u32 port_sel;
@@ -2344,6 +2345,17 @@ static void vop2_setup_layer_mixer(struct vop2_video_port *vp)
 	else
 		port_sel |= FIELD_PREP(RK3568_OVL_PORT_SET__PORT2_MUX, 8);
 
+	/* configure vp3 */
+	if (vop2_data->soc_id == 3588) {
+		struct vop2_video_port *vp3 = &vop2->vps[3];
+
+		if (vp3->nlayers)
+			port_sel |= FIELD_PREP(RK3588_OVL_PORT_SET__PORT3_MUX,
+				(vp3->nlayers + vp2->nlayers + vp1->nlayers + vp0->nlayers - 1));
+		else
+			port_sel |= FIELD_PREP(RK3588_OVL_PORT_SET__PORT3_MUX, 8);
+	}
+
 	layer_sel = vop2_readl(vop2, RK3568_OVL_LAYER_SEL);
 
 	ofs = 0;
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index 615a16196aff6..f46fb795414e1 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -489,6 +489,7 @@ enum dst_factor_mode {
 #define RK3588_OVL_PORT_SEL__CLUSTER2			GENMASK(21, 20)
 #define RK3568_OVL_PORT_SEL__CLUSTER1			GENMASK(19, 18)
 #define RK3568_OVL_PORT_SEL__CLUSTER0			GENMASK(17, 16)
+#define RK3588_OVL_PORT_SET__PORT3_MUX			GENMASK(15, 12)
 #define RK3568_OVL_PORT_SET__PORT2_MUX			GENMASK(11, 8)
 #define RK3568_OVL_PORT_SET__PORT1_MUX			GENMASK(7, 4)
 #define RK3568_OVL_PORT_SET__PORT0_MUX			GENMASK(3, 0)
-- 
2.39.2

