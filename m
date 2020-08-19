Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D0A249C0B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1916E02C;
	Wed, 19 Aug 2020 11:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8827889C19
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:21 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 28ACF2078D;
 Wed, 19 Aug 2020 11:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837581;
 bh=NPewrDTOQbIKmWxXXrLEDvEG+pl4mWNIoi6RAjja1/s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LDFKXpid8S8rDjXPJRzuawn0UghvyY07/CGHDrTode5w1EVMLyvEjEpzs6jkIVr9k
 XNUCIfwBP1mN6tMdvxgmRsgNBZmcphF0jTjLp9tky3DAG2EVTPWXOT2GvQ7boI384/
 z6Cj/20fL/GBvI/6vMKYxlaCTCoeoU0Rgc0o9+1I=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXr-00Eua2-6K; Wed, 19 Aug 2020 13:46:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 03/49] staging: hikey9xx/gpu: solve tearing issue of display
Date: Wed, 19 Aug 2020 13:45:31 +0200
Message-Id: <5a1a1acbf05e0d9aa44795e668c16f972006e40f.1597833138.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597833138.git.mchehab+huawei@kernel.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: devel@driverdev.osuosl.org, Liwei Cai <cailiwei@hisilicon.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Chen Feng <puck.chen@hisilicon.com>,
 Wanchun Zheng <zhengwanchun@hisilicon.com>, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, mauro.chehab@huawei.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Liwei Cai <cailiwei@hisilicon.com>

The use of synchronization mechanisms to deal with the display of
buffer, to solve the problem of display tearing.

Signed-off-by: Wanchun Zheng <zhengwanchun@hisilicon.com>
Signed-off-by: Liwei Cai <cailiwei@hisilicon.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/hikey9xx/gpu/dw_drm_dsi.c     |  3 +-
 drivers/staging/hikey9xx/gpu/kirin_drm_dss.c  |  4 +-
 .../hikey9xx/gpu/kirin_drm_overlay_utils.c    | 90 ++++++++-----------
 3 files changed, 41 insertions(+), 56 deletions(-)

diff --git a/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c b/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c
index 9871b375416b..db408beb33ec 100644
--- a/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c
+++ b/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c
@@ -35,7 +35,6 @@
 
 #define DTS_COMP_DSI_NAME "hisilicon,hi3660-dsi"
 
-#define MAX_TX_ESC_CLK		10
 #define ROUND(x, y)		((x) / (y) + \
 				((x) % (y) * 10 / (y) >= 5 ? 1 : 0))
 #define ROUND1(x, y)	((x) / (y) + ((x) % (y)  ? 1 : 0))
@@ -1237,7 +1236,7 @@ static int dsi_host_init(struct device *dev, struct dw_dsi *dsi)
 	host->dev = dev;
 	host->ops = &dsi_host_ops;
 
-	mipi->max_tx_esc_clk = 10;
+	mipi->max_tx_esc_clk = 10 * 1000000UL;
 	mipi->vc = 0;
 	mipi->color_mode = DSI_24BITS_1;
 	mipi->clk_post_adjust = 120;
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c b/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c
index c47d860f4697..62ac1a0648cc 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c
@@ -167,8 +167,8 @@ static int dss_power_up(struct dss_crtc *acrtc)
 	dss_inner_clk_common_enable(acrtc);
 	dpe_interrupt_mask(acrtc);
 	dpe_interrupt_clear(acrtc);
-	dpe_irq_enable(acrtc);
-	dpe_interrupt_unmask(acrtc);
+	//dpe_irq_enable(acrtc);
+	//dpe_interrupt_unmask(acrtc);
 
 	ctx->power_on = true;
 	return 0;
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c b/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c
index 095335eba16d..917e1a7d7bdf 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c
@@ -30,6 +30,7 @@
 
 
 #define DSS_CHN_MAX_DEFINE (DSS_COPYBIT_MAX)
+#define TIME_OUT  (16)
 
 static int mid_array[DSS_CHN_MAX_DEFINE] = {0xb, 0xa, 0x9, 0x8, 0x7, 0x6, 0x5, 0x4, 0x2, 0x1, 0x3, 0x0};
 
@@ -1064,6 +1065,38 @@ void hisi_dss_unflow_handler(struct dss_hw_ctx *ctx, bool unmask)
 	outp32(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INT_MSK, tmp);
 }
 
+void hisi_dss_wait_for_complete(struct dss_hw_ctx *ctx, bool need_clear)
+{
+	void __iomem *dss_base;
+	u32 tmp = 0;
+	u32 isr_s2 = 0;
+
+	if (!ctx) {
+		DRM_ERROR("ctx is NULL!\n");
+		return;
+	}
+
+	dss_base = ctx->base;
+
+	do {
+		isr_s2 = inp32(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INTS);
+		if (isr_s2 & BIT_VACTIVE0_END) {
+			DRM_DEBUG("hisi_dss_wait_for_complete exit! temp = %d\n", tmp);
+			if (need_clear)
+				outp32(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INTS, BIT_VACTIVE0_END);
+			break;
+		} else {
+			msleep(1);
+			tmp++;
+		}
+	} while (tmp < TIME_OUT);
+
+	if (tmp == TIME_OUT) {
+		isr_s2 = inp32(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INTS);
+		DRM_INFO("wait vactive0_end timeout: isr_s2 = 0x%x\n", isr_s2);
+	}
+}
+#if 0
 static int hisi_vactive0_start_config(struct dss_hw_ctx *ctx)
 {
 	int ret = 0;
@@ -1094,6 +1127,7 @@ static int hisi_vactive0_start_config(struct dss_hw_ctx *ctx)
 
 	return ret;
 }
+#endif
 
 void hisi_fb_pan_display(struct drm_plane *plane)
 {
@@ -1109,9 +1143,6 @@ void hisi_fb_pan_display(struct drm_plane *plane)
 	struct kirin_drm_private *priv = plane->dev->dev_private;
 	struct kirin_fbdev *fbdev = to_kirin_fbdev(priv->fbdev);
 
-	ktime_t prepare_timestamp;
-	u64 vsync_timediff;
-
 	bool afbcd = false;
 	bool mmu_enable = true;
 	dss_rect_ltrb_t rect;
@@ -1164,26 +1195,7 @@ void hisi_fb_pan_display(struct drm_plane *plane)
 	vbp = mode->vtotal - mode->vsync_end;
 	vsw = mode->vsync_end - mode->vsync_start;
 
-	vsync_timediff = (uint64_t)(mode->hdisplay + hbp + hfp + hsw) *
-		(mode->vdisplay + vbp + vfp + vsw) *
-		1000000000UL / (adj_mode->clock * 1000);
-
-	prepare_timestamp = ktime_get();
-
-	if ((ktime_to_ns(prepare_timestamp) > ktime_to_ns(ctx->vsync_timestamp)) &&
-		(ktime_to_ns(prepare_timestamp) - ktime_to_ns(ctx->vsync_timestamp) < (vsync_timediff - 2000000)) &&
-		(ktime_to_ns(ctx->vsync_timestamp_prev) != ktime_to_ns(ctx->vsync_timestamp))) {
-		DRM_DEBUG("vsync_timediff=%llu, timestamp_diff=%llu!\n",
-			vsync_timediff, ktime_to_ns(prepare_timestamp) - ktime_to_ns(ctx->vsync_timestamp));
-	} else {
-		DRM_DEBUG("vsync_timediff=%llu.\n", vsync_timediff);
-
-		if (hisi_vactive0_start_config(ctx) != 0) {
-			DRM_ERROR("hisi_vactive0_start_config failed!\n");
-			return;
-		}
-	}
-	ctx->vsync_timestamp_prev = ctx->vsync_timestamp;
+	hisi_dss_wait_for_complete(ctx, true);
 
 	hisi_dss_mctl_mutex_lock(ctx);
 	hisi_dss_aif_ch_config(ctx, chn_idx);
@@ -1198,9 +1210,8 @@ void hisi_fb_pan_display(struct drm_plane *plane)
 	hisi_dss_mctl_sys_config(ctx, chn_idx);
 	hisi_dss_mctl_mutex_unlock(ctx);
 
-	hisi_dss_unflow_handler(ctx, true);
-
 	enable_ldi(acrtc);
+	hisi_dss_wait_for_complete(ctx, false);
 }
 
 void hisi_dss_online_play(struct drm_plane *plane, drm_dss_layer_t *layer)
@@ -1213,9 +1224,6 @@ void hisi_dss_online_play(struct drm_plane *plane, drm_dss_layer_t *layer)
 	struct dss_crtc *acrtc = aplane->acrtc;
 	struct dss_hw_ctx *ctx = acrtc->ctx;
 
-	ktime_t prepare_timestamp;
-	u64 vsync_timediff;
-
 	bool afbcd = false;
 	bool mmu_enable = true;
 	dss_rect_ltrb_t rect;
@@ -1249,28 +1257,7 @@ void hisi_dss_online_play(struct drm_plane *plane, drm_dss_layer_t *layer)
 	vfp = mode->vsync_start - mode->vdisplay;
 	vbp = mode->vtotal - mode->vsync_end;
 	vsw = mode->vsync_end - mode->vsync_start;
-
-	vsync_timediff = (uint64_t)(mode->hdisplay + hbp + hfp + hsw) *
-		(mode->vdisplay + vbp + vfp + vsw) *
-		1000000000UL / (adj_mode->clock * 1000);
-
-	prepare_timestamp = ktime_get();
-
-	if ((ktime_to_ns(prepare_timestamp) > ktime_to_ns(ctx->vsync_timestamp)) &&
-		(ktime_to_ns(prepare_timestamp) - ktime_to_ns(ctx->vsync_timestamp) < (vsync_timediff - 2000000)) &&
-		(ktime_to_ns(ctx->vsync_timestamp_prev) != ktime_to_ns(ctx->vsync_timestamp))) {
-		DRM_DEBUG("vsync_timediff=%llu, timestamp_diff=%llu!\n",
-			vsync_timediff, ktime_to_ns(prepare_timestamp) - ktime_to_ns(ctx->vsync_timestamp));
-	} else {
-		DRM_DEBUG("vsync_timediff=%llu.\n", vsync_timediff);
-
-		if (hisi_vactive0_start_config(ctx) != 0) {
-			DRM_ERROR("hisi_vactive0_start_config failed!\n");
-			return;
-		}
-	}
-
-	ctx->vsync_timestamp_prev = ctx->vsync_timestamp;
+	hisi_dss_wait_for_complete(ctx, true);
 
 	hisi_dss_mctl_mutex_lock(ctx);
 	hisi_dss_aif_ch_config(ctx, chn_idx);
@@ -1285,7 +1272,6 @@ void hisi_dss_online_play(struct drm_plane *plane, drm_dss_layer_t *layer)
 	hisi_dss_mctl_sys_config(ctx, chn_idx);
 	hisi_dss_mctl_mutex_unlock(ctx);
 
-	hisi_dss_unflow_handler(ctx, true);
-
 	enable_ldi(acrtc);
+	hisi_dss_wait_for_complete(ctx, false);
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
