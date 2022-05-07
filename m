Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEC551E2DC
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 03:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2218410EFFD;
	Sat,  7 May 2022 01:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C5010EFE4
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 01:00:25 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id bq30so15168734lfb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 18:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Xjc3Hv9IBU6m3GG1D4xZiH521v6YGheJpIE5cEUwCc=;
 b=GDWtw3xVkiQsPE896Dksj7FISU8ExonameA1uJYu9hhAgeu1/IaT3rar1Rv1+YMVRL
 CKx+Y0qwXML3jZETvMkah8JzHZzPsuCYjtY1Uvl0YNKbgVaV3vd4D1F/YwttixV357rp
 FhnM2rzUKgUvgQ0NbizsU1gAW+JR8mxx/8YjC+51pG7tY9HcbnmJILeiJbm18diG7O/Y
 akZ4cTWg0YnSt1wa+d6fZBlsFJ4qT9pibtcf6Rp04NYgHzctnEVW0xwaUBaW4ijgBDmn
 WH9Xtzoj+o0eLkpgZh9unm9atOh68rL6U8cms7xGuEsjWeYP8IF3IjbY6k5it5sE+AOL
 1VCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Xjc3Hv9IBU6m3GG1D4xZiH521v6YGheJpIE5cEUwCc=;
 b=P22LYimMElxb2ei3q+TH6loj3CHbVzxg2T6qxdcsHkwVSAPqHVCFFXufKQDREGrWAj
 U+buaI1U5xUrtCPBsdnPoNS0rRYVbhD7U+72oR0gb2zExuZwdC5gjMlSafN3ZbzQY/Wz
 LbMisYek0E2sPhrSUIPRlN2tKu2UZ+cuL//EUiPq0ncQM9hpD7ksWb+7/QXyXTBONSM5
 ljNmRZwTlHwX82k22kDoaZ/HkOlfxhpjJ4LAoIhFLGYMcWSm9RtL51vJ6YKaUYDmWrkp
 Q5pDIhYgLsGQ4NZWnyfHoAAS40nPCan1I5BP6Jy1MWUKlwuGT+XpKqU61StmWsCoklO4
 dz3g==
X-Gm-Message-State: AOAM530yvQV4fQgYX1HDEgcFQNj+f5Dl644Q/59WhRXlwEzuW97/f+L1
 7QtibWP63uetqDR4d+5d9b+5vg==
X-Google-Smtp-Source: ABdhPJwMs9XNRlJ0IKsyFD7+8w243rXrvj/NOkWs1o4eVYx7Gxnkmbq7t0Xu7JYhoz70MI01S4nXaQ==
X-Received: by 2002:a05:6512:c01:b0:448:6aec:65c5 with SMTP id
 z1-20020a0565120c0100b004486aec65c5mr4405142lfu.193.1651885223281; 
 Fri, 06 May 2022 18:00:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056512118f00b0047255d2110csm882907lfr.59.2022.05.06.18.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 18:00:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 2/2] drm/msm: push IRQ setup into individual drivers
Date: Sat,  7 May 2022 04:00:21 +0300
Message-Id: <20220507010021.1667700-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220507010021.1667700-1-dmitry.baryshkov@linaro.org>
References: <20220507010021.1667700-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Afther the commit f026e431cf86 ("drm/msm: Convert to Linux IRQ
interfaces") converted MSM DRM driver to handle IRQs on it's own (rather
than using the DRM IRQ mid-layer), there is little point in keeping
irq wrapper in the msm_drv.c which just call into individual drivers.
Push respective code into the mdp4/mdp5/dpu drivers and drop
irq_preinstall/irq_postinstall/irq msm_kms funcs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  | 13 +---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 28 ++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  7 +++
 drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c      | 30 ++++++++-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |  4 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h      |  4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c      | 30 ++++++++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |  4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h      |  4 +-
 drivers/gpu/drm/msm/msm_drv.c                 | 62 +++----------------
 drivers/gpu/drm/msm/msm_kms.h                 |  4 +-
 12 files changed, 105 insertions(+), 91 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
index b5b6e7031fb9..c6938b1f1870 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
@@ -8,13 +8,6 @@
 #include "dpu_kms.h"
 #include "dpu_hw_interrupts.h"
 
-/**
- * dpu_core_irq_preinstall - perform pre-installation of core IRQ handler
- * @kms:		MSM KMS handle
- * @return:		none
- */
-void dpu_core_irq_preinstall(struct msm_kms *kms);
-
 /**
  * dpu_core_irq_uninstall - uninstall core IRQ handler
  * @kms:		MSM KMS handle
@@ -23,11 +16,11 @@ void dpu_core_irq_preinstall(struct msm_kms *kms);
 void dpu_core_irq_uninstall(struct msm_kms *kms);
 
 /**
- * dpu_core_irq - core IRQ handler
+ * dpu_core_irq_install - install core IRQ handler
  * @kms:		MSM KMS handle
- * @return:		interrupt handling status
+ * @return:		non-zero in case of an error
  */
-irqreturn_t dpu_core_irq(struct msm_kms *kms);
+int dpu_core_irq_install(struct msm_kms *kms);
 
 /**
  * dpu_core_irq_read - IRQ helper function for reading IRQ status
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index d6498e45dc2c..fa4f99034a08 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -164,8 +164,9 @@ static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
 	dpu_kms->hw_intr->irq_tbl[irq_idx].cb(dpu_kms->hw_intr->irq_tbl[irq_idx].arg, irq_idx);
 }
 
-irqreturn_t dpu_core_irq(struct msm_kms *kms)
+static irqreturn_t dpu_irq(int irq, void *arg)
 {
+	struct msm_kms *kms = arg;
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
 	struct dpu_hw_intr *intr = dpu_kms->hw_intr;
 	int reg_idx;
@@ -541,7 +542,7 @@ void dpu_debugfs_core_irq_init(struct dpu_kms *dpu_kms,
 }
 #endif
 
-void dpu_core_irq_preinstall(struct msm_kms *kms)
+static void dpu_core_irq_preinstall(struct msm_kms *kms)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
 	int i;
@@ -570,5 +571,28 @@ void dpu_core_irq_uninstall(struct msm_kms *kms)
 
 	dpu_clear_irqs(dpu_kms);
 	dpu_disable_all_irqs(dpu_kms);
+	if (kms->irq_requested)
+		free_irq(kms->irq, kms);
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
+
+int dpu_core_irq_install(struct msm_kms *kms)
+{
+	int ret;
+
+	dpu_core_irq_preinstall(kms);
+
+	ret = request_irq(kms->irq, dpu_irq, 0, "dpu", kms);
+	if (ret)
+		return ret;
+
+	kms->irq_requested = true;
+
+	ret = dpu_irq_postinstall(kms);
+	if (ret) {
+		free_irq(kms->irq, kms);
+		return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 2b9d931474e0..494978da7785 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -884,7 +884,7 @@ static void dpu_kms_destroy(struct msm_kms *kms)
 		pm_runtime_disable(&dpu_kms->pdev->dev);
 }
 
-static int dpu_irq_postinstall(struct msm_kms *kms)
+int dpu_irq_postinstall(struct msm_kms *kms)
 {
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
@@ -960,10 +960,8 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 
 static const struct msm_kms_funcs kms_funcs = {
 	.hw_init         = dpu_kms_hw_init,
-	.irq_preinstall  = dpu_core_irq_preinstall,
-	.irq_postinstall = dpu_irq_postinstall,
+	.irq_install     = dpu_core_irq_install,
 	.irq_uninstall   = dpu_core_irq_uninstall,
-	.irq             = dpu_core_irq,
 	.enable_commit   = dpu_kms_enable_commit,
 	.disable_commit  = dpu_kms_disable_commit,
 	.vsync_time      = dpu_kms_vsync_time,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 832a0769f2e7..559184c64045 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -204,4 +204,11 @@ void dpu_disable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
  */
 u64 dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name);
 
+/**
+ * dpu_irq_postinstall - perform post-installation of core IRQ handler
+ * @kms:               MSM KMS handle
+ * @return:            non-zero in case of error
+ */
+int dpu_irq_postinstall(struct msm_kms *kms);
+
 #endif /* __dpu_kms_H__ */
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
index 4d49f3ba6a96..87675c162eea 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
@@ -32,7 +32,7 @@ static void mdp4_irq_error_handler(struct mdp_irq *irq, uint32_t irqstatus)
 	}
 }
 
-void mdp4_irq_preinstall(struct msm_kms *kms)
+static void mdp4_irq_preinstall(struct msm_kms *kms)
 {
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
 	mdp4_enable(mdp4_kms);
@@ -41,7 +41,7 @@ void mdp4_irq_preinstall(struct msm_kms *kms)
 	mdp4_disable(mdp4_kms);
 }
 
-int mdp4_irq_postinstall(struct msm_kms *kms)
+static int mdp4_irq_postinstall(struct msm_kms *kms)
 {
 	struct mdp_kms *mdp_kms = to_mdp_kms(kms);
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(mdp_kms);
@@ -62,10 +62,13 @@ void mdp4_irq_uninstall(struct msm_kms *kms)
 	mdp4_enable(mdp4_kms);
 	mdp4_write(mdp4_kms, REG_MDP4_INTR_ENABLE, 0x00000000);
 	mdp4_disable(mdp4_kms);
+	if (kms->irq_requested)
+		free_irq(kms->irq, kms);
 }
 
-irqreturn_t mdp4_irq(struct msm_kms *kms)
+static irqreturn_t mdp4_irq(int irq, void *arg)
 {
+	struct msm_kms *kms = arg;
 	struct mdp_kms *mdp_kms = to_mdp_kms(kms);
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(mdp_kms);
 	struct drm_device *dev = mdp4_kms->dev;
@@ -88,6 +91,27 @@ irqreturn_t mdp4_irq(struct msm_kms *kms)
 	return IRQ_HANDLED;
 }
 
+int mdp4_irq_install(struct msm_kms *kms)
+{
+	int ret;
+
+	mdp4_irq_preinstall(kms);
+
+	ret = request_irq(kms->irq, mdp4_irq, 0, "mdp4", kms);
+	if (ret)
+		return ret;
+
+	kms->irq_requested = true;
+
+	ret = mdp4_irq_postinstall(kms);
+	if (ret) {
+		free_irq(kms->irq, kms);
+		return ret;
+	}
+
+	return 0;
+}
+
 int mdp4_enable_vblank(struct msm_kms *kms, struct drm_crtc *crtc)
 {
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index fb48c8c19ec3..b7aced272af9 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -148,10 +148,8 @@ static void mdp4_destroy(struct msm_kms *kms)
 static const struct mdp_kms_funcs kms_funcs = {
 	.base = {
 		.hw_init         = mdp4_hw_init,
-		.irq_preinstall  = mdp4_irq_preinstall,
-		.irq_postinstall = mdp4_irq_postinstall,
+		.irq_install     = mdp4_irq_install,
 		.irq_uninstall   = mdp4_irq_uninstall,
-		.irq             = mdp4_irq,
 		.enable_vblank   = mdp4_enable_vblank,
 		.disable_vblank  = mdp4_disable_vblank,
 		.enable_commit   = mdp4_enable_commit,
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index e8ee92ab7956..b24a63872232 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -157,10 +157,8 @@ int mdp4_enable(struct mdp4_kms *mdp4_kms);
 
 void mdp4_set_irqmask(struct mdp_kms *mdp_kms, uint32_t irqmask,
 		uint32_t old_irqmask);
-void mdp4_irq_preinstall(struct msm_kms *kms);
-int mdp4_irq_postinstall(struct msm_kms *kms);
+int mdp4_irq_install(struct msm_kms *kms);
 void mdp4_irq_uninstall(struct msm_kms *kms);
-irqreturn_t mdp4_irq(struct msm_kms *kms);
 int mdp4_enable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
 void mdp4_disable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
index 9b4c8d92ff32..d573ff29d5a4 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
@@ -36,7 +36,7 @@ static void mdp5_irq_error_handler(struct mdp_irq *irq, uint32_t irqstatus)
 	}
 }
 
-void mdp5_irq_preinstall(struct msm_kms *kms)
+static void mdp5_irq_preinstall(struct msm_kms *kms)
 {
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
 	struct device *dev = &mdp5_kms->pdev->dev;
@@ -47,7 +47,7 @@ void mdp5_irq_preinstall(struct msm_kms *kms)
 	pm_runtime_put_sync(dev);
 }
 
-int mdp5_irq_postinstall(struct msm_kms *kms)
+static int mdp5_irq_postinstall(struct msm_kms *kms)
 {
 	struct mdp_kms *mdp_kms = to_mdp_kms(kms);
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(mdp_kms);
@@ -74,11 +74,14 @@ void mdp5_irq_uninstall(struct msm_kms *kms)
 
 	pm_runtime_get_sync(dev);
 	mdp5_write(mdp5_kms, REG_MDP5_INTR_EN, 0x00000000);
+	if (kms->irq_requested)
+		free_irq(kms->irq, kms);
 	pm_runtime_put_sync(dev);
 }
 
-irqreturn_t mdp5_irq(struct msm_kms *kms)
+static irqreturn_t mdp5_irq(int irq, void *arg)
 {
+	struct msm_kms *kms = arg;
 	struct mdp_kms *mdp_kms = to_mdp_kms(kms);
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(mdp_kms);
 	struct drm_device *dev = mdp5_kms->dev;
@@ -101,6 +104,27 @@ irqreturn_t mdp5_irq(struct msm_kms *kms)
 	return IRQ_HANDLED;
 }
 
+int mdp5_irq_install(struct msm_kms *kms)
+{
+	int ret;
+
+	mdp5_irq_preinstall(kms);
+
+	ret = request_irq(kms->irq, mdp5_irq, 0, "mdp5", kms);
+	if (ret)
+		return ret;
+
+	kms->irq_requested = true;
+
+	ret = mdp5_irq_postinstall(kms);
+	if (ret) {
+		free_irq(kms->irq, kms);
+		return ret;
+	}
+
+	return 0;
+}
+
 int mdp5_enable_vblank(struct msm_kms *kms, struct drm_crtc *crtc)
 {
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 3d5621a68f85..18cf0ff4da6c 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -262,10 +262,8 @@ static int mdp5_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 static const struct mdp_kms_funcs kms_funcs = {
 	.base = {
 		.hw_init         = mdp5_hw_init,
-		.irq_preinstall  = mdp5_irq_preinstall,
-		.irq_postinstall = mdp5_irq_postinstall,
+		.irq_install     = mdp5_irq_install,
 		.irq_uninstall   = mdp5_irq_uninstall,
-		.irq             = mdp5_irq,
 		.enable_vblank   = mdp5_enable_vblank,
 		.disable_vblank  = mdp5_disable_vblank,
 		.flush_commit    = mdp5_flush_commit,
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
index 29bf11f08601..630b5f812f24 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
@@ -263,10 +263,8 @@ static inline uint32_t lm2ppdone(struct mdp5_hw_mixer *mixer)
 
 void mdp5_set_irqmask(struct mdp_kms *mdp_kms, uint32_t irqmask,
 		uint32_t old_irqmask);
-void mdp5_irq_preinstall(struct msm_kms *kms);
-int mdp5_irq_postinstall(struct msm_kms *kms);
+int mdp5_irq_install(struct msm_kms *kms);
 void mdp5_irq_uninstall(struct msm_kms *kms);
-irqreturn_t mdp5_irq(struct msm_kms *kms);
 int mdp5_enable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
 void mdp5_disable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
 int mdp5_irq_domain_init(struct mdp5_kms *mdp5_kms);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 44485363f37a..d2fbe54fec4d 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -77,64 +77,15 @@ static bool modeset = true;
 MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
 module_param(modeset, bool, 0600);
 
-static irqreturn_t msm_irq(int irq, void *arg)
-{
-	struct drm_device *dev = arg;
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-
-	BUG_ON(!kms);
-
-	return kms->funcs->irq(kms);
-}
-
-static void msm_irq_preinstall(struct drm_device *dev)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-
-	BUG_ON(!kms);
-
-	kms->funcs->irq_preinstall(kms);
-}
-
-static int msm_irq_postinstall(struct drm_device *dev)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-
-	BUG_ON(!kms);
-
-	if (kms->funcs->irq_postinstall)
-		return kms->funcs->irq_postinstall(kms);
-
-	return 0;
-}
-
 static int msm_irq_install(struct drm_device *dev, unsigned int irq)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
-	int ret;
-
-	if (irq == IRQ_NOTCONNECTED)
-		return -ENOTCONN;
-
-	msm_irq_preinstall(dev);
-
-	ret = request_irq(irq, msm_irq, 0, dev->driver->name, dev);
-	if (ret)
-		return ret;
-
-	kms->irq_requested = true;
 
-	ret = msm_irq_postinstall(dev);
-	if (ret) {
-		free_irq(irq, dev);
-		return ret;
-	}
+	if (!kms->funcs->irq_install)
+		return -EINVAL;
 
-	return 0;
+	return kms->funcs->irq_install(kms);
 }
 
 static void msm_irq_uninstall(struct drm_device *dev)
@@ -143,8 +94,6 @@ static void msm_irq_uninstall(struct drm_device *dev)
 	struct msm_kms *kms = priv->kms;
 
 	kms->funcs->irq_uninstall(kms);
-	if (kms->irq_requested)
-		free_irq(kms->irq, dev);
 }
 
 struct msm_vblank_work {
@@ -450,6 +399,11 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	}
 
 	if (kms) {
+		if (kms->irq == IRQ_NOTCONNECTED) {
+			ret = -ENOTCONN;
+			goto err_msm_uninit;
+		}
+
 		pm_runtime_get_sync(dev);
 		ret = msm_irq_install(ddev, kms->irq);
 		pm_runtime_put_sync(dev);
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index f8ed7588928c..71d497a8fb8b 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -24,10 +24,8 @@ struct msm_kms_funcs {
 	/* hw initialization: */
 	int (*hw_init)(struct msm_kms *kms);
 	/* irq handling: */
-	void (*irq_preinstall)(struct msm_kms *kms);
-	int (*irq_postinstall)(struct msm_kms *kms);
+	int (*irq_install)(struct msm_kms *kms);
 	void (*irq_uninstall)(struct msm_kms *kms);
-	irqreturn_t (*irq)(struct msm_kms *kms);
 	int (*enable_vblank)(struct msm_kms *kms, struct drm_crtc *crtc);
 	void (*disable_vblank)(struct msm_kms *kms, struct drm_crtc *crtc);
 
-- 
2.35.1

