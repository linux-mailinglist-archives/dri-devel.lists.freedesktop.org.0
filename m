Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D80F09F1D62
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 09:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B6010E483;
	Sat, 14 Dec 2024 08:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="fe8LyBJM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 96CE910E483
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2024 08:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=y3ZkP
 xUzR2VD4Y0/GAz4pJw3ZeN9dk2bkowzq9Pg2C8=; b=fe8LyBJM7pJX2eccZwLgi
 gu0twd2XWrklkku7aPqNxciC5DdbConuc8KewMGUpx6mhWN6YtQ4nQcpewx6omtg
 l3++U8MiC/xUR3RiMVQrSr1pzLvggRQNd+WmcgCofzOABBqEPtVGHI6qoRPT0fdR
 QAXPKY3bi7I6FIwOMDlBkM=
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzsmtp3 (Coremail) with SMTP id PigvCgBntMtZP11n2bFXFg--.10343S2;
 Sat, 14 Dec 2024 16:18:36 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, s.hauer@pengutronix.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
 detlev.casanova@collabora.com, Andy Yan <andy.yan@rock-chips.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Subject: [PATCH v6 11/16] drm/rockchip: vop2: Introduce vop hardware version
Date: Sat, 14 Dec 2024 16:18:30 +0800
Message-ID: <20241214081831.3330714-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241214081719.3330518-1-andyshrk@163.com>
References: <20241214081719.3330518-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgBntMtZP11n2bFXFg--.10343S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Xry3tF47Cry8WF4fWF1xXwb_yoWxKFyfpF
 W7Aay5WrWxGa1qgw4kAay3ZF43twn2yay7JanrGw13t343KryDGan0qF1ayFZ8tr92kr4j
 yFn7ArW5WF47tr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jFSoXUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gi1XmddMGzr1wAAsr
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

From: Andy Yan <andy.yan@rock-chips.com>

There is a version number hardcoded in the VOP VERSION_INFO
register, and the version number increments sequentially based
on the production order of the SOC.

So using this version number to distinguish different VOP features
will simplify the code.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Tested-by: Michael Riesch <michael.riesch@wolfvision.net> # on RK3568
Tested-by: Detlev Casanova <detlev.casanova@collabora.com>

---

Changes in v6:
- Add a blank line after hardware version check code

Changes in v3:
- Add comments for why we should treat rk3566 with special care.
- Add hardware version check

Changes in v2:
- Introduce vop hardware version

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 26 ++++++++++++++------
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 11 +++++++++
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c |  3 +++
 3 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index fded1e931c9a..c87c98a8fb3a 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -354,7 +354,7 @@ static bool vop2_output_uv_swap(u32 bus_format, u32 output_mode)
 
 static bool vop2_output_rg_swap(struct vop2 *vop2, u32 bus_format)
 {
-	if (vop2->data->soc_id == 3588) {
+	if (vop2->version == VOP_VERSION_RK3588) {
 		if (bus_format == MEDIA_BUS_FMT_YUV8_1X24 ||
 		    bus_format == MEDIA_BUS_FMT_YUV10_1X30)
 			return true;
@@ -407,7 +407,7 @@ static bool rockchip_vop2_mod_supported(struct drm_plane *plane, u32 format,
 	if (modifier == DRM_FORMAT_MOD_INVALID)
 		return false;
 
-	if (vop2->data->soc_id == 3568 || vop2->data->soc_id == 3566) {
+	if (vop2->version == VOP_VERSION_RK3568) {
 		if (vop2_cluster_window(win)) {
 			if (modifier == DRM_FORMAT_MOD_LINEAR) {
 				drm_dbg_kms(vop2->drm,
@@ -418,7 +418,7 @@ static bool rockchip_vop2_mod_supported(struct drm_plane *plane, u32 format,
 	}
 
 	if (format == DRM_FORMAT_XRGB2101010 || format == DRM_FORMAT_XBGR2101010) {
-		if (vop2->data->soc_id == 3588) {
+		if (vop2->version == VOP_VERSION_RK3588) {
 			if (!rockchip_afbc(plane, modifier)) {
 				drm_dbg_kms(vop2->drm, "Only support 32 bpp format with afbc\n");
 				return false;
@@ -817,6 +817,7 @@ static void rk3588_vop2_power_domain_enable_all(struct vop2 *vop2)
 static void vop2_enable(struct vop2 *vop2)
 {
 	int ret;
+	u32 version;
 
 	ret = pm_runtime_resume_and_get(vop2->dev);
 	if (ret < 0) {
@@ -836,10 +837,20 @@ static void vop2_enable(struct vop2 *vop2)
 		return;
 	}
 
+	version = vop2_readl(vop2, RK3568_VERSION_INFO);
+	if (version != vop2->version) {
+		drm_err(vop2->drm, "Hardware version(0x%08x) mismatch\n", version);
+		return;
+	}
+
+	/*
+	 * rk3566 share the same vop version with rk3568, so
+	 * wen need to use soc_id for identification here.
+	 */
 	if (vop2->data->soc_id == 3566)
 		vop2_writel(vop2, RK3568_OTP_WIN_EN, 1);
 
-	if (vop2->data->soc_id == 3588)
+	if (vop2->version == VOP_VERSION_RK3588)
 		rk3588_vop2_power_domain_enable_all(vop2);
 
 	vop2_writel(vop2, RK3568_REG_CFG_DONE, RK3568_REG_CFG_DONE__GLB_CFG_DONE_EN);
@@ -920,7 +931,7 @@ static void vop2_vp_dsp_lut_update_enable(struct vop2_video_port *vp)
 
 static inline bool vop2_supports_seamless_gamma_lut_update(struct vop2 *vop2)
 {
-	return (vop2->data->soc_id != 3566 && vop2->data->soc_id != 3568);
+	return vop2->version != VOP_VERSION_RK3568;
 }
 
 static bool vop2_gamma_lut_in_use(struct vop2 *vop2, struct vop2_video_port *vp)
@@ -1259,7 +1270,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		&fb->format->format,
 		afbc_en ? "AFBC" : "", &yrgb_mst);
 
-	if (vop2->data->soc_id > 3568) {
+	if (vop2->version > VOP_VERSION_RK3568) {
 		vop2_win_write(win, VOP2_WIN_AXI_BUS_ID, win->data->axi_bus_id);
 		vop2_win_write(win, VOP2_WIN_AXI_YRGB_R_ID, win->data->axi_yrgb_r_id);
 		vop2_win_write(win, VOP2_WIN_AXI_UV_R_ID, win->data->axi_uv_r_id);
@@ -1319,7 +1330,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		 * this bit is gating disable, we should write 1 to
 		 * disable gating when enable afbc.
 		 */
-		if (vop2->data->soc_id == 3566 || vop2->data->soc_id == 3568)
+		if (vop2->version == VOP_VERSION_RK3568)
 			vop2_win_write(win, VOP2_WIN_AFBC_AUTO_GATING_EN, 0);
 		else
 			vop2_win_write(win, VOP2_WIN_AFBC_AUTO_GATING_EN, 1);
@@ -2523,6 +2534,7 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 	vop2->dev = dev;
 	vop2->data = vop2_data;
 	vop2->ops = vop2_data->ops;
+	vop2->version = vop2_data->version;
 	vop2->drm = drm;
 
 	dev_set_drvdata(dev, vop2);
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index af3cd92e6815..21464d107bd3 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -13,6 +13,15 @@
 #include "rockchip_drm_drv.h"
 #include "rockchip_drm_vop.h"
 
+#define VOP2_VERSION(major, minor, build)	((major) << 24 | (minor) << 16 | (build))
+
+/* The new SOC VOP version is bigger than the old */
+#define VOP_VERSION_RK3568	VOP2_VERSION(0x40, 0x15, 0x8023)
+#define VOP_VERSION_RK3588	VOP2_VERSION(0x40, 0x17, 0x6786)
+#define VOP_VERSION_RK3528	VOP2_VERSION(0x50, 0x17, 0x1263)
+#define VOP_VERSION_RK3562	VOP2_VERSION(0x50, 0x17, 0x4350)
+#define VOP_VERSION_RK3576	VOP2_VERSION(0x50, 0x19, 0x9765)
+
 #define VOP2_VP_FEATURE_OUTPUT_10BIT        BIT(0)
 
 #define VOP2_FEATURE_HAS_SYS_GRF	BIT(0)
@@ -242,6 +251,7 @@ struct vop2_ops {
 struct vop2_data {
 	u8 nr_vps;
 	u64 feature;
+	u32 version;
 	const struct vop2_ops *ops;
 	const struct vop2_win_data *win;
 	const struct vop2_video_port_data *vp;
@@ -259,6 +269,7 @@ struct vop2_data {
 };
 
 struct vop2 {
+	u32 version;
 	struct device *dev;
 	struct drm_device *drm;
 	struct vop2_video_port vps[ROCKCHIP_MAX_CRTC];
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 01336ef2482a..e311af7e3a1a 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -1627,6 +1627,7 @@ static const struct vop2_ops rk3588_vop_ops = {
 };
 
 static const struct vop2_data rk3566_vop = {
+	.version = VOP_VERSION_RK3568,
 	.feature = VOP2_FEATURE_HAS_SYS_GRF,
 	.nr_vps = 3,
 	.max_input = { 4096, 2304 },
@@ -1645,6 +1646,7 @@ static const struct vop2_data rk3566_vop = {
 };
 
 static const struct vop2_data rk3568_vop = {
+	.version = VOP_VERSION_RK3568,
 	.feature = VOP2_FEATURE_HAS_SYS_GRF,
 	.nr_vps = 3,
 	.max_input = { 4096, 2304 },
@@ -1663,6 +1665,7 @@ static const struct vop2_data rk3568_vop = {
 };
 
 static const struct vop2_data rk3588_vop = {
+	.version = VOP_VERSION_RK3588,
 	.feature = VOP2_FEATURE_HAS_SYS_GRF | VOP2_FEATURE_HAS_VO1_GRF |
 		   VOP2_FEATURE_HAS_VOP_GRF | VOP2_FEATURE_HAS_SYS_PMU,
 	.nr_vps = 4,
-- 
2.34.1

