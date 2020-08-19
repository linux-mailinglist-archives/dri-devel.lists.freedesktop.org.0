Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F151249C13
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6876E05A;
	Wed, 19 Aug 2020 11:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CE689C19
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:21 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3330F207BB;
 Wed, 19 Aug 2020 11:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837581;
 bh=DCWLKCwZjS1SXuA6hU5j6msFXhg+lD/MJEczJod+cDk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0EiQ6RSR+sEmF7BqkCIlCaUb1aizT+O9Gb+BcU4EPPu4xHUnFm6pwc2fQHSYrzq9b
 eN4QfqBFzlfjm/pILGrY3eOBnxElxjkzJEGSSPaKwkx1QcOUlrSD4NHW/RTVHcakCc
 ksSrWj/Q3Rqa9Inz0MLWewNcDkyZTQhTggG3xo8c=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXr-00Eua4-7U; Wed, 19 Aug 2020 13:46:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 04/49] staging: hikey9xx/gpu: resolve the performance issue by
 interrupt mechanism
Date: Wed, 19 Aug 2020 13:45:32 +0200
Message-Id: <44b04aeafc7ae414f2a4b51f46f6524ec6babd5e.1597833138.git.mchehab+huawei@kernel.org>
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

There is an error at wait for vactive end flags, waiting
vactive flag in 1ms maybe too rough, but it's not good to
control the waiting grain size, there is no way to get the
waiting unit, so the interrupt mechanism is the best way to
solve this problem.

Each frame would report hardware interrupt, implement the interrupt
service to get vactive end interrupt, and fb_post return to tell
gpu render next framebuffer.

Signed-off-by: Wanchun Zheng <zhengwanchun@hisilicon.com>
Signed-off-by: Liwei Cai <cailiwei@hisilicon.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/hikey9xx/gpu/kirin_dpe_reg.h  |  4 +-
 .../hikey9xx/gpu/kirin_drm_dpe_utils.c        |  3 +-
 drivers/staging/hikey9xx/gpu/kirin_drm_dss.c  | 14 ++---
 .../hikey9xx/gpu/kirin_drm_overlay_utils.c    | 56 ++++---------------
 4 files changed, 20 insertions(+), 57 deletions(-)

diff --git a/drivers/staging/hikey9xx/gpu/kirin_dpe_reg.h b/drivers/staging/hikey9xx/gpu/kirin_dpe_reg.h
index 9fad9ef942bd..adaa71f6dcd5 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_dpe_reg.h
+++ b/drivers/staging/hikey9xx/gpu/kirin_dpe_reg.h
@@ -2948,8 +2948,8 @@ struct dss_hw_ctx {
 	bool power_on;
 	int irq;
 
-	wait_queue_head_t vactive0_start_wq;
-	u32 vactive0_start_flag;
+	wait_queue_head_t vactive0_end_wq;
+	u32 vactive0_end_flag;
 	ktime_t vsync_timestamp;
 	ktime_t vsync_timestamp_prev;
 
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.c b/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.c
index 2d6809b72b42..2a13bbd772b7 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.c
@@ -554,8 +554,7 @@ void dpe_interrupt_unmask(struct dss_crtc *acrtc)
 	outp32(dss_base + GLB_CPU_PDP_INT_MSK, unmask);
 
 	unmask = ~0;
-	unmask &= ~(BIT_VSYNC | BIT_VACTIVE0_START
-		| BIT_VACTIVE0_END | BIT_FRM_END | BIT_LDI_UNFLOW);
+	unmask &= ~(BIT_VSYNC | BIT_VACTIVE0_END | BIT_LDI_UNFLOW);
 
 	outp32(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INT_MSK, unmask);
 }
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c b/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c
index 62ac1a0648cc..64d0b1979bf5 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c
@@ -167,8 +167,8 @@ static int dss_power_up(struct dss_crtc *acrtc)
 	dss_inner_clk_common_enable(acrtc);
 	dpe_interrupt_mask(acrtc);
 	dpe_interrupt_clear(acrtc);
-	//dpe_irq_enable(acrtc);
-	//dpe_interrupt_unmask(acrtc);
+	dpe_irq_enable(acrtc);
+	dpe_interrupt_unmask(acrtc);
 
 	ctx->power_on = true;
 	return 0;
@@ -237,9 +237,9 @@ static irqreturn_t dss_irq_handler(int irq, void *data)
 	isr_s2 &= ~(inp32(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INT_MSK));
 	isr_s2_dpp &= ~(inp32(dss_base + DSS_DPP_OFFSET + DPP_INT_MSK));
 
-	if (isr_s2 & BIT_VACTIVE0_START) {
-		ctx->vactive0_start_flag++;
-		wake_up_interruptible_all(&ctx->vactive0_start_wq);
+	if (isr_s2 & BIT_VACTIVE0_END) {
+		ctx->vactive0_end_flag++;
+		wake_up_interruptible_all(&ctx->vactive0_end_wq);
 	}
 
 	if (isr_s2 & BIT_VSYNC) {
@@ -637,8 +637,8 @@ static int dss_drm_init(struct drm_device *dev)
 	ctx->screen_size = 0;
 	ctx->smem_start = 0;
 
-	ctx->vactive0_start_flag = 0;
-	init_waitqueue_head(&ctx->vactive0_start_wq);
+	ctx->vactive0_end_flag = 0;
+	init_waitqueue_head(&ctx->vactive0_end_wq);
 
 	/*
 	 * plane init
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c b/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c
index 917e1a7d7bdf..28778b15512a 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c
@@ -30,8 +30,6 @@
 
 
 #define DSS_CHN_MAX_DEFINE (DSS_COPYBIT_MAX)
-#define TIME_OUT  (16)
-
 static int mid_array[DSS_CHN_MAX_DEFINE] = {0xb, 0xa, 0x9, 0x8, 0x7, 0x6, 0x5, 0x4, 0x2, 0x1, 0x3, 0x0};
 
 /*
@@ -1065,49 +1063,17 @@ void hisi_dss_unflow_handler(struct dss_hw_ctx *ctx, bool unmask)
 	outp32(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INT_MSK, tmp);
 }
 
-void hisi_dss_wait_for_complete(struct dss_hw_ctx *ctx, bool need_clear)
-{
-	void __iomem *dss_base;
-	u32 tmp = 0;
-	u32 isr_s2 = 0;
-
-	if (!ctx) {
-		DRM_ERROR("ctx is NULL!\n");
-		return;
-	}
-
-	dss_base = ctx->base;
-
-	do {
-		isr_s2 = inp32(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INTS);
-		if (isr_s2 & BIT_VACTIVE0_END) {
-			DRM_DEBUG("hisi_dss_wait_for_complete exit! temp = %d\n", tmp);
-			if (need_clear)
-				outp32(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INTS, BIT_VACTIVE0_END);
-			break;
-		} else {
-			msleep(1);
-			tmp++;
-		}
-	} while (tmp < TIME_OUT);
-
-	if (tmp == TIME_OUT) {
-		isr_s2 = inp32(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INTS);
-		DRM_INFO("wait vactive0_end timeout: isr_s2 = 0x%x\n", isr_s2);
-	}
-}
-#if 0
-static int hisi_vactive0_start_config(struct dss_hw_ctx *ctx)
+static int hisi_dss_wait_for_complete(struct dss_hw_ctx *ctx)
 {
 	int ret = 0;
 	u32 times = 0;
-	u32 prev_vactive0_start = 0;
+	u32 prev_vactive0_end = 0;
 
-	prev_vactive0_start = ctx->vactive0_start_flag;
+	prev_vactive0_end = ctx->vactive0_end_flag;
 
 REDO:
-	ret = wait_event_interruptible_timeout(ctx->vactive0_start_wq,
-		(prev_vactive0_start != ctx->vactive0_start_flag),
+	ret = wait_event_interruptible_timeout(ctx->vactive0_end_wq,
+		(prev_vactive0_end != ctx->vactive0_end_flag),
 		msecs_to_jiffies(300));
 	if (ret == -ERESTARTSYS) {
 		if (times < 50) {
@@ -1118,7 +1084,7 @@ static int hisi_vactive0_start_config(struct dss_hw_ctx *ctx)
 	}
 
 	if (ret <= 0) {
-		DRM_ERROR("wait_for vactive0_start_flag timeout! ret=%d.\n", ret);
+		DRM_ERROR("wait_for vactive0_end_flag timeout! ret=%d.\n", ret);
 
 		ret = -ETIMEDOUT;
 	} else {
@@ -1127,7 +1093,6 @@ static int hisi_vactive0_start_config(struct dss_hw_ctx *ctx)
 
 	return ret;
 }
-#endif
 
 void hisi_fb_pan_display(struct drm_plane *plane)
 {
@@ -1195,8 +1160,6 @@ void hisi_fb_pan_display(struct drm_plane *plane)
 	vbp = mode->vtotal - mode->vsync_end;
 	vsw = mode->vsync_end - mode->vsync_start;
 
-	hisi_dss_wait_for_complete(ctx, true);
-
 	hisi_dss_mctl_mutex_lock(ctx);
 	hisi_dss_aif_ch_config(ctx, chn_idx);
 	hisi_dss_mif_config(ctx, chn_idx, mmu_enable);
@@ -1209,9 +1172,10 @@ void hisi_fb_pan_display(struct drm_plane *plane)
 	hisi_dss_mctl_ov_config(ctx, chn_idx);
 	hisi_dss_mctl_sys_config(ctx, chn_idx);
 	hisi_dss_mctl_mutex_unlock(ctx);
+	hisi_dss_unflow_handler(ctx, true);
 
 	enable_ldi(acrtc);
-	hisi_dss_wait_for_complete(ctx, false);
+	hisi_dss_wait_for_complete(ctx);
 }
 
 void hisi_dss_online_play(struct drm_plane *plane, drm_dss_layer_t *layer)
@@ -1257,7 +1221,6 @@ void hisi_dss_online_play(struct drm_plane *plane, drm_dss_layer_t *layer)
 	vfp = mode->vsync_start - mode->vdisplay;
 	vbp = mode->vtotal - mode->vsync_end;
 	vsw = mode->vsync_end - mode->vsync_start;
-	hisi_dss_wait_for_complete(ctx, true);
 
 	hisi_dss_mctl_mutex_lock(ctx);
 	hisi_dss_aif_ch_config(ctx, chn_idx);
@@ -1271,7 +1234,8 @@ void hisi_dss_online_play(struct drm_plane *plane, drm_dss_layer_t *layer)
 	hisi_dss_mctl_ov_config(ctx, chn_idx);
 	hisi_dss_mctl_sys_config(ctx, chn_idx);
 	hisi_dss_mctl_mutex_unlock(ctx);
+	hisi_dss_unflow_handler(ctx, true);
 
 	enable_ldi(acrtc);
-	hisi_dss_wait_for_complete(ctx, false);
+	hisi_dss_wait_for_complete(ctx);
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
