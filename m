Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8085C35A979
	for <lists+dri-devel@lfdr.de>; Sat, 10 Apr 2021 02:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29B56EC65;
	Sat, 10 Apr 2021 00:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8306EC61
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Apr 2021 00:14:35 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id j18so12349998lfg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 17:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Le77Cd2VF11ksyVdC1Y0N5xSaWpL8CRDhi2c+7SXjWU=;
 b=YR+tUsSX0vaJgyZ6UiMUrQi0vk27LTDLvCYGpNrCg2i6JBKTD0RPRt41CQL58zN80r
 M2cHqXtEu46H0xt5uh0Q0UTHHDHRofrEzcMog6mY/K73pzx+jY7WG5PEbnRtwLS2OM5O
 y6CFzmZwtBAv1SsmCucZosYyySD6GdzPQ+o4wtqRHkCOI8DrbWKeXu5t87O6t3LS8lsQ
 9swel2OhmT7zypKw+QzotOzBm6P3CXB+0G5fFVYX9pKR1qQ81aMdxMX9cJyiQdgKEskT
 63WKMDbwbGk0CEfT6ZY0ckyVEWhLpa/KKlWbwbM2a7J1J4wBkNKUvJ8YaIr2Qzj5gcL+
 1wBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Le77Cd2VF11ksyVdC1Y0N5xSaWpL8CRDhi2c+7SXjWU=;
 b=eK1pz+MsV8jGFQZoOzfQC5M4S9qAEoc00siLBU+cau73qGLBpWTsoYIGMPqSMBTXFm
 ala9sYKAH4hL/jT6wu9NP06GRiV4thMv1HUFb5Xcv+5zRBfuBJQJpU9jrNMU75kiqWJl
 aGnmoLrosEToAb91M8yFtjtxvT7q4iFDptLzDPbe+Y4E9VPr/Vmm3AeBfDwBJB8IQUI/
 rO0jR+Z30UUX8sUFewkJrxGGP9BY0i0tQl8uKb6rVYtziQ3fthZ+98emV1VUv/t4Kudz
 uXNoHZLg+pFNpnuYJinsuxvfWjqclBujDOTlV8ePPicG2HE8bm5vE4qZyxJi3Fl5uW4W
 U1Og==
X-Gm-Message-State: AOAM531j0B5UAvPoKFkkfAkDoLvGEgi1qHCl6VcG+TswPU5OX8Q3BFA6
 y1A7i5zpbhCFJ5f/DYoji3Bq7A==
X-Google-Smtp-Source: ABdhPJzhwFD+af7E7ZhzO7ZnBexT2d0BigOPB4ujA9Ma/KfvfYxozgyMyP2lcgATdf5m0VdIcDiECA==
X-Received: by 2002:ac2:41d4:: with SMTP id d20mr11249195lfi.213.1618013673520; 
 Fri, 09 Apr 2021 17:14:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a17sm323360lfg.20.2021.04.09.17.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 17:14:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [RFC 3/3] drm/msm/dpu: simplify interrupt managing
Date: Sat, 10 Apr 2021 03:14:30 +0300
Message-Id: <20210410001430.1732450-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210410001430.1732450-1-dmitry.baryshkov@linaro.org>
References: <20210410001430.1732450-1-dmitry.baryshkov@linaro.org>
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change huge lookup table to contain just sensible entries. IRQ index is
now not an index in the table, but just register id (multiplied by 32,
the amount of IRQs in the register) plus offset in the register. This
allows us to remove all the "reserved" entries from dpu_irq_map. The
table is now only used for lookups, individual functions calculate
register and mask using the irq_idx.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c  |  10 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 535 +++++-------------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |   4 +-
 3 files changed, 141 insertions(+), 408 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
index dadb4103b0eb..bc93eb55b8f9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
@@ -70,7 +70,7 @@ static int _dpu_core_irq_enable(struct dpu_kms *dpu_kms, int irq_idx)
 		return -EINVAL;
 	}
 
-	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->irq_idx_tbl_size) {
+	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
 		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
@@ -133,7 +133,7 @@ static int _dpu_core_irq_disable(struct dpu_kms *dpu_kms, int irq_idx)
 		return -EINVAL;
 	}
 
-	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->irq_idx_tbl_size) {
+	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
 		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
@@ -208,7 +208,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 		return -EINVAL;
 	}
 
-	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->irq_idx_tbl_size) {
+	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
 		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
@@ -243,7 +243,7 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx,
 		return -EINVAL;
 	}
 
-	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->irq_idx_tbl_size) {
+	if (irq_idx < 0 || irq_idx >= dpu_kms->hw_intr->total_irqs) {
 		DPU_ERROR("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
@@ -328,7 +328,7 @@ void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
 	spin_lock_init(&dpu_kms->irq_obj.cb_lock);
 
 	/* Create irq callbacks for all possible irq_idx */
-	dpu_kms->irq_obj.total_irqs = dpu_kms->hw_intr->irq_idx_tbl_size;
+	dpu_kms->irq_obj.total_irqs = dpu_kms->hw_intr->total_irqs;
 	dpu_kms->irq_obj.irq_cb_tbl = kcalloc(dpu_kms->irq_obj.total_irqs,
 			sizeof(struct list_head), GFP_KERNEL);
 	dpu_kms->irq_obj.enable_counts = kcalloc(dpu_kms->irq_obj.total_irqs,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 3d48ad69c901..09e1d3182611 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -29,140 +29,140 @@
 /**
  * WB interrupt status bit definitions
  */
-#define DPU_INTR_WB_0_DONE BIT(0)
-#define DPU_INTR_WB_1_DONE BIT(1)
-#define DPU_INTR_WB_2_DONE BIT(4)
+#define DPU_INTR_WB_0_DONE	0
+#define DPU_INTR_WB_1_DONE	1
+#define DPU_INTR_WB_2_DONE	4
 
 /**
  * WDOG timer interrupt status bit definitions
  */
-#define DPU_INTR_WD_TIMER_0_DONE BIT(2)
-#define DPU_INTR_WD_TIMER_1_DONE BIT(3)
-#define DPU_INTR_WD_TIMER_2_DONE BIT(5)
-#define DPU_INTR_WD_TIMER_3_DONE BIT(6)
-#define DPU_INTR_WD_TIMER_4_DONE BIT(7)
+#define DPU_INTR_WD_TIMER_0_DONE	2
+#define DPU_INTR_WD_TIMER_1_DONE	3
+#define DPU_INTR_WD_TIMER_2_DONE	5
+#define DPU_INTR_WD_TIMER_3_DONE	6
+#define DPU_INTR_WD_TIMER_4_DONE	7
 
 /**
  * Pingpong interrupt status bit definitions
  */
-#define DPU_INTR_PING_PONG_0_DONE BIT(8)
-#define DPU_INTR_PING_PONG_1_DONE BIT(9)
-#define DPU_INTR_PING_PONG_2_DONE BIT(10)
-#define DPU_INTR_PING_PONG_3_DONE BIT(11)
-#define DPU_INTR_PING_PONG_0_RD_PTR BIT(12)
-#define DPU_INTR_PING_PONG_1_RD_PTR BIT(13)
-#define DPU_INTR_PING_PONG_2_RD_PTR BIT(14)
-#define DPU_INTR_PING_PONG_3_RD_PTR BIT(15)
-#define DPU_INTR_PING_PONG_0_WR_PTR BIT(16)
-#define DPU_INTR_PING_PONG_1_WR_PTR BIT(17)
-#define DPU_INTR_PING_PONG_2_WR_PTR BIT(18)
-#define DPU_INTR_PING_PONG_3_WR_PTR BIT(19)
-#define DPU_INTR_PING_PONG_0_AUTOREFRESH_DONE BIT(20)
-#define DPU_INTR_PING_PONG_1_AUTOREFRESH_DONE BIT(21)
-#define DPU_INTR_PING_PONG_2_AUTOREFRESH_DONE BIT(22)
-#define DPU_INTR_PING_PONG_3_AUTOREFRESH_DONE BIT(23)
+#define DPU_INTR_PING_PONG_0_DONE	8
+#define DPU_INTR_PING_PONG_1_DONE	9
+#define DPU_INTR_PING_PONG_2_DONE	10
+#define DPU_INTR_PING_PONG_3_DONE	11
+#define DPU_INTR_PING_PONG_0_RD_PTR	12
+#define DPU_INTR_PING_PONG_1_RD_PTR	13
+#define DPU_INTR_PING_PONG_2_RD_PTR	14
+#define DPU_INTR_PING_PONG_3_RD_PTR	15
+#define DPU_INTR_PING_PONG_0_WR_PTR	16
+#define DPU_INTR_PING_PONG_1_WR_PTR	17
+#define DPU_INTR_PING_PONG_2_WR_PTR	18
+#define DPU_INTR_PING_PONG_3_WR_PTR	19
+#define DPU_INTR_PING_PONG_0_AUTOREFRESH_DONE	20
+#define DPU_INTR_PING_PONG_1_AUTOREFRESH_DONE	21
+#define DPU_INTR_PING_PONG_2_AUTOREFRESH_DONE	22
+#define DPU_INTR_PING_PONG_3_AUTOREFRESH_DONE	23
 
 /**
  * Interface interrupt status bit definitions
  */
-#define DPU_INTR_INTF_0_UNDERRUN BIT(24)
-#define DPU_INTR_INTF_1_UNDERRUN BIT(26)
-#define DPU_INTR_INTF_2_UNDERRUN BIT(28)
-#define DPU_INTR_INTF_3_UNDERRUN BIT(30)
-#define DPU_INTR_INTF_0_VSYNC BIT(25)
-#define DPU_INTR_INTF_1_VSYNC BIT(27)
-#define DPU_INTR_INTF_2_VSYNC BIT(29)
-#define DPU_INTR_INTF_3_VSYNC BIT(31)
+#define DPU_INTR_INTF_0_UNDERRUN	24
+#define DPU_INTR_INTF_1_UNDERRUN	26
+#define DPU_INTR_INTF_2_UNDERRUN	28
+#define DPU_INTR_INTF_3_UNDERRUN	30
+#define DPU_INTR_INTF_0_VSYNC	25
+#define DPU_INTR_INTF_1_VSYNC	27
+#define DPU_INTR_INTF_2_VSYNC	29
+#define DPU_INTR_INTF_3_VSYNC	31
 
 /**
  * Pingpong Secondary interrupt status bit definitions
  */
-#define DPU_INTR_PING_PONG_S0_AUTOREFRESH_DONE BIT(0)
-#define DPU_INTR_PING_PONG_S0_WR_PTR BIT(4)
-#define DPU_INTR_PING_PONG_S0_RD_PTR BIT(8)
-#define DPU_INTR_PING_PONG_S0_TEAR_DETECTED BIT(22)
-#define DPU_INTR_PING_PONG_S0_TE_DETECTED BIT(28)
+#define DPU_INTR_PING_PONG_S0_AUTOREFRESH_DONE	0
+#define DPU_INTR_PING_PONG_S0_WR_PTR	4
+#define DPU_INTR_PING_PONG_S0_RD_PTR	8
+#define DPU_INTR_PING_PONG_S0_TEAR_DETECTED	22
+#define DPU_INTR_PING_PONG_S0_TE_DETECTED	28
 
 /**
  * Pingpong TEAR detection interrupt status bit definitions
  */
-#define DPU_INTR_PING_PONG_0_TEAR_DETECTED BIT(16)
-#define DPU_INTR_PING_PONG_1_TEAR_DETECTED BIT(17)
-#define DPU_INTR_PING_PONG_2_TEAR_DETECTED BIT(18)
-#define DPU_INTR_PING_PONG_3_TEAR_DETECTED BIT(19)
+#define DPU_INTR_PING_PONG_0_TEAR_DETECTED	16
+#define DPU_INTR_PING_PONG_1_TEAR_DETECTED	17
+#define DPU_INTR_PING_PONG_2_TEAR_DETECTED	18
+#define DPU_INTR_PING_PONG_3_TEAR_DETECTED	19
 
 /**
  * Pingpong TE detection interrupt status bit definitions
  */
-#define DPU_INTR_PING_PONG_0_TE_DETECTED BIT(24)
-#define DPU_INTR_PING_PONG_1_TE_DETECTED BIT(25)
-#define DPU_INTR_PING_PONG_2_TE_DETECTED BIT(26)
-#define DPU_INTR_PING_PONG_3_TE_DETECTED BIT(27)
+#define DPU_INTR_PING_PONG_0_TE_DETECTED	24
+#define DPU_INTR_PING_PONG_1_TE_DETECTED	25
+#define DPU_INTR_PING_PONG_2_TE_DETECTED	26
+#define DPU_INTR_PING_PONG_3_TE_DETECTED	27
 
 /**
  * Ctl start interrupt status bit definitions
  */
-#define DPU_INTR_CTL_0_START BIT(9)
-#define DPU_INTR_CTL_1_START BIT(10)
-#define DPU_INTR_CTL_2_START BIT(11)
-#define DPU_INTR_CTL_3_START BIT(12)
-#define DPU_INTR_CTL_4_START BIT(13)
+#define DPU_INTR_CTL_0_START	9
+#define DPU_INTR_CTL_1_START	10
+#define DPU_INTR_CTL_2_START	11
+#define DPU_INTR_CTL_3_START	12
+#define DPU_INTR_CTL_4_START	13
 
 /**
  * Concurrent WB overflow interrupt status bit definitions
  */
-#define DPU_INTR_CWB_2_OVERFLOW BIT(14)
-#define DPU_INTR_CWB_3_OVERFLOW BIT(15)
+#define DPU_INTR_CWB_2_OVERFLOW	14
+#define DPU_INTR_CWB_3_OVERFLOW	15
 
 /**
  * Histogram VIG done interrupt status bit definitions
  */
-#define DPU_INTR_HIST_VIG_0_DONE BIT(0)
-#define DPU_INTR_HIST_VIG_1_DONE BIT(4)
-#define DPU_INTR_HIST_VIG_2_DONE BIT(8)
-#define DPU_INTR_HIST_VIG_3_DONE BIT(10)
+#define DPU_INTR_HIST_VIG_0_DONE	0
+#define DPU_INTR_HIST_VIG_1_DONE	4
+#define DPU_INTR_HIST_VIG_2_DONE	8
+#define DPU_INTR_HIST_VIG_3_DONE	10
 
 /**
  * Histogram VIG reset Sequence done interrupt status bit definitions
  */
-#define DPU_INTR_HIST_VIG_0_RSTSEQ_DONE BIT(1)
-#define DPU_INTR_HIST_VIG_1_RSTSEQ_DONE BIT(5)
-#define DPU_INTR_HIST_VIG_2_RSTSEQ_DONE BIT(9)
-#define DPU_INTR_HIST_VIG_3_RSTSEQ_DONE BIT(11)
+#define DPU_INTR_HIST_VIG_0_RSTSEQ_DONE	1
+#define DPU_INTR_HIST_VIG_1_RSTSEQ_DONE	5
+#define DPU_INTR_HIST_VIG_2_RSTSEQ_DONE	9
+#define DPU_INTR_HIST_VIG_3_RSTSEQ_DONE	11
 
 /**
  * Histogram DSPP done interrupt status bit definitions
  */
-#define DPU_INTR_HIST_DSPP_0_DONE BIT(12)
-#define DPU_INTR_HIST_DSPP_1_DONE BIT(16)
-#define DPU_INTR_HIST_DSPP_2_DONE BIT(20)
-#define DPU_INTR_HIST_DSPP_3_DONE BIT(22)
+#define DPU_INTR_HIST_DSPP_0_DONE	12
+#define DPU_INTR_HIST_DSPP_1_DONE	16
+#define DPU_INTR_HIST_DSPP_2_DONE	20
+#define DPU_INTR_HIST_DSPP_3_DONE	22
 
 /**
  * Histogram DSPP reset Sequence done interrupt status bit definitions
  */
-#define DPU_INTR_HIST_DSPP_0_RSTSEQ_DONE BIT(13)
-#define DPU_INTR_HIST_DSPP_1_RSTSEQ_DONE BIT(17)
-#define DPU_INTR_HIST_DSPP_2_RSTSEQ_DONE BIT(21)
-#define DPU_INTR_HIST_DSPP_3_RSTSEQ_DONE BIT(23)
+#define DPU_INTR_HIST_DSPP_0_RSTSEQ_DONE	13
+#define DPU_INTR_HIST_DSPP_1_RSTSEQ_DONE	17
+#define DPU_INTR_HIST_DSPP_2_RSTSEQ_DONE	21
+#define DPU_INTR_HIST_DSPP_3_RSTSEQ_DONE	23
 
 /**
  * INTF interrupt status bit definitions
  */
-#define DPU_INTR_VIDEO_INTO_STATIC BIT(0)
-#define DPU_INTR_VIDEO_OUTOF_STATIC BIT(1)
-#define DPU_INTR_DSICMD_0_INTO_STATIC BIT(2)
-#define DPU_INTR_DSICMD_0_OUTOF_STATIC BIT(3)
-#define DPU_INTR_DSICMD_1_INTO_STATIC BIT(4)
-#define DPU_INTR_DSICMD_1_OUTOF_STATIC BIT(5)
-#define DPU_INTR_DSICMD_2_INTO_STATIC BIT(6)
-#define DPU_INTR_DSICMD_2_OUTOF_STATIC BIT(7)
-#define DPU_INTR_PROG_LINE BIT(8)
+#define DPU_INTR_VIDEO_INTO_STATIC	0
+#define DPU_INTR_VIDEO_OUTOF_STATIC	1
+#define DPU_INTR_DSICMD_0_INTO_STATIC	2
+#define DPU_INTR_DSICMD_0_OUTOF_STATIC	3
+#define DPU_INTR_DSICMD_1_INTO_STATIC	4
+#define DPU_INTR_DSICMD_1_OUTOF_STATIC	5
+#define DPU_INTR_DSICMD_2_INTO_STATIC	6
+#define DPU_INTR_DSICMD_2_OUTOF_STATIC	7
+#define DPU_INTR_PROG_LINE		8
 
 /**
  * AD4 interrupt status bit definitions
  */
-#define DPU_INTR_BACKLIGHT_UPDATED BIT(0)
+#define DPU_INTR_BACKLIGHT_UPDATED	0
 /**
  * struct dpu_intr_reg - array of DPU register sets
  * @clr_off:	offset to CLEAR reg
@@ -179,13 +179,13 @@ struct dpu_intr_reg {
  * struct dpu_irq_type - maps each irq with i/f
  * @intr_type:		type of interrupt listed in dpu_intr_type
  * @instance_idx:	instance index of the associated HW block in DPU
- * @irq_mask:		corresponding bit in the interrupt status reg
+ * @irq_offset:		corresponding bit in the interrupt status reg
  * @reg_idx:		which reg set to use
  */
 struct dpu_irq_type {
 	u32 intr_type;
 	u32 instance_idx;
-	u32 irq_mask;
+	u32 irq_offset;
 	u32 reg_idx;
 };
 
@@ -245,6 +245,10 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
 	}
 };
 
+#define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
+#define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
+#define DPU_IRQ_MASK(irq_idx)	(BIT(irq_idx % 32))
+
 /*
  * struct dpu_irq_type - IRQ mapping table use for lookup an irq_idx in this
  *			 table that have a matching interface type and
@@ -308,20 +312,13 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 	{ DPU_IRQ_TYPE_INTF_VSYNC, INTF_2, DPU_INTR_INTF_2_VSYNC, 0},
 	{ DPU_IRQ_TYPE_INTF_UNDER_RUN, INTF_3, DPU_INTR_INTF_3_UNDERRUN, 0},
 	{ DPU_IRQ_TYPE_INTF_VSYNC, INTF_3, DPU_INTR_INTF_3_VSYNC, 0},
-
-	/* BEGIN MAP_RANGE: 32-64, INTR2 */
+	/* BEGIN MAP_RANGE: 32-63, INTR2 */
 	/* irq_idx: 32-35 */
 	{ DPU_IRQ_TYPE_PING_PONG_AUTO_REF, PINGPONG_S0,
 		DPU_INTR_PING_PONG_S0_AUTOREFRESH_DONE, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
 	/* irq_idx: 36-39 */
 	{ DPU_IRQ_TYPE_PING_PONG_WR_PTR, PINGPONG_S0,
 		DPU_INTR_PING_PONG_S0_WR_PTR, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
 	/* irq_idx: 40 */
 	{ DPU_IRQ_TYPE_PING_PONG_RD_PTR, PINGPONG_S0,
 		DPU_INTR_PING_PONG_S0_RD_PTR, 1},
@@ -349,11 +346,8 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 	{ DPU_IRQ_TYPE_PING_PONG_TEAR_CHECK, PINGPONG_3,
 		DPU_INTR_PING_PONG_3_TEAR_DETECTED, 1},
 	/* irq_idx: 52-55 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
 	{ DPU_IRQ_TYPE_PING_PONG_TEAR_CHECK, PINGPONG_S0,
 		DPU_INTR_PING_PONG_S0_TEAR_DETECTED, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
 	/* irq_idx: 56-59 */
 	{ DPU_IRQ_TYPE_PING_PONG_TE_CHECK, PINGPONG_0,
 		DPU_INTR_PING_PONG_0_TE_DETECTED, 1},
@@ -366,23 +360,15 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 	/* irq_idx: 60-63 */
 	{ DPU_IRQ_TYPE_PING_PONG_TE_CHECK, PINGPONG_S0,
 		DPU_INTR_PING_PONG_S0_TE_DETECTED, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-
 	/* BEGIN MAP_RANGE: 64-95 HIST */
 	/* irq_idx: 64-67 */
 	{ DPU_IRQ_TYPE_HIST_VIG_DONE, SSPP_VIG0, DPU_INTR_HIST_VIG_0_DONE, 2},
 	{ DPU_IRQ_TYPE_HIST_VIG_RSTSEQ, SSPP_VIG0,
 		DPU_INTR_HIST_VIG_0_RSTSEQ_DONE, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
 	/* irq_idx: 68-71 */
 	{ DPU_IRQ_TYPE_HIST_VIG_DONE, SSPP_VIG1, DPU_INTR_HIST_VIG_1_DONE, 2},
 	{ DPU_IRQ_TYPE_HIST_VIG_RSTSEQ, SSPP_VIG1,
 		DPU_INTR_HIST_VIG_1_RSTSEQ_DONE, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
 	/* irq_idx: 72-75 */
 	{ DPU_IRQ_TYPE_HIST_VIG_DONE, SSPP_VIG2, DPU_INTR_HIST_VIG_2_DONE, 2},
 	{ DPU_IRQ_TYPE_HIST_VIG_RSTSEQ, SSPP_VIG2,
@@ -394,14 +380,10 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 	{ DPU_IRQ_TYPE_HIST_DSPP_DONE, DSPP_0, DPU_INTR_HIST_DSPP_0_DONE, 2},
 	{ DPU_IRQ_TYPE_HIST_DSPP_RSTSEQ, DSPP_0,
 		DPU_INTR_HIST_DSPP_0_RSTSEQ_DONE, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
 	/* irq_idx: 80-83 */
 	{ DPU_IRQ_TYPE_HIST_DSPP_DONE, DSPP_1, DPU_INTR_HIST_DSPP_1_DONE, 2},
 	{ DPU_IRQ_TYPE_HIST_DSPP_RSTSEQ, DSPP_1,
 		DPU_INTR_HIST_DSPP_1_RSTSEQ_DONE, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
 	/* irq_idx: 84-87 */
 	{ DPU_IRQ_TYPE_HIST_DSPP_DONE, DSPP_2, DPU_INTR_HIST_DSPP_2_DONE, 2},
 	{ DPU_IRQ_TYPE_HIST_DSPP_RSTSEQ, DSPP_2,
@@ -409,17 +391,6 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 	{ DPU_IRQ_TYPE_HIST_DSPP_DONE, DSPP_3, DPU_INTR_HIST_DSPP_3_DONE, 2},
 	{ DPU_IRQ_TYPE_HIST_DSPP_RSTSEQ, DSPP_3,
 		DPU_INTR_HIST_DSPP_3_RSTSEQ_DONE, 2},
-	/* irq_idx: 88-91 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	/* irq_idx: 92-95 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-
 	/* BEGIN MAP_RANGE: 96-127 INTF_0_INTR */
 	/* irq_idx: 96-99 */
 	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_0,
@@ -441,35 +412,6 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_2_OUTOF_STATIC, 3},
 	/* irq_idx: 104-107 */
 	{ DPU_IRQ_TYPE_PROG_LINE, INTF_0, DPU_INTR_PROG_LINE, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	/* irq_idx: 108-111 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	/* irq_idx: 112-115 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	/* irq_idx: 116-119 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	/* irq_idx: 120-123 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	/* irq_idx: 124-127 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-
 	/* BEGIN MAP_RANGE: 128-159 INTF_1_INTR */
 	/* irq_idx: 128-131 */
 	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_1,
@@ -491,35 +433,6 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_2_OUTOF_STATIC, 4},
 	/* irq_idx: 136-139 */
 	{ DPU_IRQ_TYPE_PROG_LINE, INTF_1, DPU_INTR_PROG_LINE, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	/* irq_idx: 140-143 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	/* irq_idx: 144-147 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	/* irq_idx: 148-151 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	/* irq_idx: 152-155 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	/* irq_idx: 156-159 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-
 	/* BEGIN MAP_RANGE: 160-191 INTF_2_INTR */
 	/* irq_idx: 160-163 */
 	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_2,
@@ -541,35 +454,6 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_2_OUTOF_STATIC, 5},
 	/* irq_idx: 168-171 */
 	{ DPU_IRQ_TYPE_PROG_LINE, INTF_2, DPU_INTR_PROG_LINE, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	/* irq_idx: 172-175 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	/* irq_idx: 176-179 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	/* irq_idx: 180-183 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	/* irq_idx: 184-187 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	/* irq_idx: 188-191 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-
 	/* BEGIN MAP_RANGE: 192-223 INTF_3_INTR */
 	/* irq_idx: 192-195 */
 	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_3,
@@ -591,35 +475,6 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_2_OUTOF_STATIC, 6},
 	/* irq_idx: 200-203 */
 	{ DPU_IRQ_TYPE_PROG_LINE, INTF_3, DPU_INTR_PROG_LINE, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	/* irq_idx: 204-207 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	/* irq_idx: 208-211 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	/* irq_idx: 212-215 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	/* irq_idx: 216-219 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	/* irq_idx: 220-223 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-
 	/* BEGIN MAP_RANGE: 224-255 INTF_4_INTR */
 	/* irq_idx: 224-227 */
 	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_4,
@@ -641,118 +496,12 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_2_OUTOF_STATIC, 7},
 	/* irq_idx: 232-235 */
 	{ DPU_IRQ_TYPE_PROG_LINE, INTF_4, DPU_INTR_PROG_LINE, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	/* irq_idx: 236-239 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	/* irq_idx: 240-243 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	/* irq_idx: 244-247 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	/* irq_idx: 248-251 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	/* irq_idx: 252-255 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-
 	/* BEGIN MAP_RANGE: 256-287 AD4_0_INTR */
 	/* irq_idx: 256-259 */
 	{ DPU_IRQ_TYPE_AD4_BL_DONE, DSPP_0, DPU_INTR_BACKLIGHT_UPDATED, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	/* irq_idx: 260-263 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	/* irq_idx: 264-267 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	/* irq_idx: 268-271 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	/* irq_idx: 272-275 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	/* irq_idx: 276-279 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	/* irq_idx: 280-283 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	/* irq_idx: 284-287 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-
 	/* BEGIN MAP_RANGE: 288-319 AD4_1_INTR */
 	/* irq_idx: 288-291 */
 	{ DPU_IRQ_TYPE_AD4_BL_DONE, DSPP_1, DPU_INTR_BACKLIGHT_UPDATED, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	/* irq_idx: 292-295 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	/* irq_idx: 296-299 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	/* irq_idx: 300-303 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	/* irq_idx: 304-307 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	/* irq_idx: 308-311 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	/* irq_idx: 312-315 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	/* irq_idx: 315-319 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
 };
 
 static int dpu_hw_intr_irqidx_lookup(enum dpu_intr_type intr_type,
@@ -763,7 +512,7 @@ static int dpu_hw_intr_irqidx_lookup(enum dpu_intr_type intr_type,
 	for (i = 0; i < ARRAY_SIZE(dpu_irq_map); i++) {
 		if (intr_type == dpu_irq_map[i].intr_type &&
 			instance_idx == dpu_irq_map[i].instance_idx)
-			return i;
+			return DPU_IRQ_IDX(dpu_irq_map[i].reg_idx, dpu_irq_map[i].irq_offset);
 	}
 
 	pr_debug("IRQ lookup fail!! intr_type=%d, instance_idx=%d\n",
@@ -779,9 +528,8 @@ static void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr *intr,
 	if (!intr)
 		return;
 
-	reg_idx = dpu_irq_map[irq_idx].reg_idx;
-	DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
-			dpu_irq_map[irq_idx].irq_mask);
+	reg_idx = DPU_IRQ_REG(irq_idx);
+	DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off, DPU_IRQ_MASK(irq_idx));
 
 	/* ensure register writes go through */
 	wmb();
@@ -793,10 +541,9 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 {
 	int reg_idx;
 	int irq_idx;
-	int start_idx;
-	int end_idx;
 	u32 irq_status;
 	u32 enable_mask;
+	int bit;
 	unsigned long irq_flags;
 
 	if (!intr)
@@ -809,15 +556,7 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 	 */
 	spin_lock_irqsave(&intr->irq_lock, irq_flags);
 	for (reg_idx = 0; reg_idx < ARRAY_SIZE(dpu_intr_set); reg_idx++) {
-		/*
-		 * Each Interrupt register has a range of 32 indexes, and
-		 * that is static for dpu_irq_map.
-		 */
-		start_idx = reg_idx * 32;
-		end_idx = start_idx + 32;
-
-		if (!test_bit(reg_idx, &intr->irq_mask) ||
-			start_idx >= ARRAY_SIZE(dpu_irq_map))
+		if (!test_bit(reg_idx, &intr->irq_mask))
 			continue;
 
 		/* Read interrupt status */
@@ -834,35 +573,33 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 		/* Finally update IRQ status based on enable mask */
 		irq_status &= enable_mask;
 
+		if (!irq_status)
+			continue;
+
 		/*
-		 * Search through matching intr status from irq map.
-		 * start_idx and end_idx defined the search range in
-		 * the dpu_irq_map.
+		 * Search through matching intr status.
 		 */
-		for (irq_idx = start_idx;
-				(irq_idx < end_idx) && irq_status;
-				irq_idx++)
-			if ((irq_status & dpu_irq_map[irq_idx].irq_mask) &&
-				(dpu_irq_map[irq_idx].reg_idx == reg_idx)) {
-				/*
-				 * Once a match on irq mask, perform a callback
-				 * to the given cbfunc. cbfunc will take care
-				 * the interrupt status clearing. If cbfunc is
-				 * not provided, then the interrupt clearing
-				 * is here.
-				 */
-				if (cbfunc)
-					cbfunc(arg, irq_idx);
-
-				dpu_hw_intr_clear_intr_status_nolock(intr, irq_idx);
-
-				/*
-				 * When callback finish, clear the irq_status
-				 * with the matching mask. Once irq_status
-				 * is all cleared, the search can be stopped.
-				 */
-				irq_status &= ~dpu_irq_map[irq_idx].irq_mask;
-			}
+		while ((bit = ffs(irq_status)) != 0) {
+			irq_idx = DPU_IRQ_IDX(reg_idx, bit - 1);
+			/*
+			 * Once a match on irq mask, perform a callback
+			 * to the given cbfunc. cbfunc will take care
+			 * the interrupt status clearing. If cbfunc is
+			 * not provided, then the interrupt clearing
+			 * is here.
+			 */
+			if (cbfunc)
+				cbfunc(arg, irq_idx);
+
+			dpu_hw_intr_clear_intr_status_nolock(intr, irq_idx);
+
+			/*
+			 * When callback finish, clear the irq_status
+			 * with the matching mask. Once irq_status
+			 * is all cleared, the search can be stopped.
+			 */
+			irq_status &= ~BIT(bit - 1);
+		}
 	}
 
 	/* ensure register writes go through */
@@ -876,32 +613,30 @@ static int dpu_hw_intr_enable_irq(struct dpu_hw_intr *intr, int irq_idx)
 	int reg_idx;
 	unsigned long irq_flags;
 	const struct dpu_intr_reg *reg;
-	const struct dpu_irq_type *irq;
 	const char *dbgstr = NULL;
 	uint32_t cache_irq_mask;
 
 	if (!intr)
 		return -EINVAL;
 
-	if (irq_idx < 0 || irq_idx >= ARRAY_SIZE(dpu_irq_map)) {
+	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
 		pr_err("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
 
-	irq = &dpu_irq_map[irq_idx];
-	reg_idx = irq->reg_idx;
+	reg_idx = DPU_IRQ_REG(irq_idx);
 	reg = &dpu_intr_set[reg_idx];
 
 	spin_lock_irqsave(&intr->irq_lock, irq_flags);
 	cache_irq_mask = intr->cache_irq_mask[reg_idx];
-	if (cache_irq_mask & irq->irq_mask) {
+	if (cache_irq_mask & DPU_IRQ_MASK(irq_idx)) {
 		dbgstr = "DPU IRQ already set:";
 	} else {
 		dbgstr = "DPU IRQ enabled:";
 
-		cache_irq_mask |= irq->irq_mask;
+		cache_irq_mask |= DPU_IRQ_MASK(irq_idx);
 		/* Cleaning any pending interrupt */
-		DPU_REG_WRITE(&intr->hw, reg->clr_off, irq->irq_mask);
+		DPU_REG_WRITE(&intr->hw, reg->clr_off, DPU_IRQ_MASK(irq_idx));
 		/* Enabling interrupts with the new mask */
 		DPU_REG_WRITE(&intr->hw, reg->en_off, cache_irq_mask);
 
@@ -912,8 +647,8 @@ static int dpu_hw_intr_enable_irq(struct dpu_hw_intr *intr, int irq_idx)
 	}
 	spin_unlock_irqrestore(&intr->irq_lock, irq_flags);
 
-	pr_debug("%s MASK:0x%.8x, CACHE-MASK:0x%.8x\n", dbgstr,
-			irq->irq_mask, cache_irq_mask);
+	pr_debug("%s MASK:0x%.8lx, CACHE-MASK:0x%.8x\n", dbgstr,
+			DPU_IRQ_MASK(irq_idx), cache_irq_mask);
 
 	return 0;
 }
@@ -922,33 +657,31 @@ static int dpu_hw_intr_disable_irq_nolock(struct dpu_hw_intr *intr, int irq_idx)
 {
 	int reg_idx;
 	const struct dpu_intr_reg *reg;
-	const struct dpu_irq_type *irq;
 	const char *dbgstr = NULL;
 	uint32_t cache_irq_mask;
 
 	if (!intr)
 		return -EINVAL;
 
-	if (irq_idx < 0 || irq_idx >= ARRAY_SIZE(dpu_irq_map)) {
+	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
 		pr_err("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
 
-	irq = &dpu_irq_map[irq_idx];
-	reg_idx = irq->reg_idx;
+	reg_idx = DPU_IRQ_REG(irq_idx);
 	reg = &dpu_intr_set[reg_idx];
 
 	cache_irq_mask = intr->cache_irq_mask[reg_idx];
-	if ((cache_irq_mask & irq->irq_mask) == 0) {
+	if ((cache_irq_mask & DPU_IRQ_MASK(irq_idx)) == 0) {
 		dbgstr = "DPU IRQ is already cleared:";
 	} else {
 		dbgstr = "DPU IRQ mask disable:";
 
-		cache_irq_mask &= ~irq->irq_mask;
+		cache_irq_mask &= ~DPU_IRQ_MASK(irq_idx);
 		/* Disable interrupts based on the new mask */
 		DPU_REG_WRITE(&intr->hw, reg->en_off, cache_irq_mask);
 		/* Cleaning any pending interrupt */
-		DPU_REG_WRITE(&intr->hw, reg->clr_off, irq->irq_mask);
+		DPU_REG_WRITE(&intr->hw, reg->clr_off, DPU_IRQ_MASK(irq_idx));
 
 		/* ensure register write goes through */
 		wmb();
@@ -956,8 +689,8 @@ static int dpu_hw_intr_disable_irq_nolock(struct dpu_hw_intr *intr, int irq_idx)
 		intr->cache_irq_mask[reg_idx] = cache_irq_mask;
 	}
 
-	pr_debug("%s MASK:0x%.8x, CACHE-MASK:0x%.8x\n", dbgstr,
-			irq->irq_mask, cache_irq_mask);
+	pr_debug("%s MASK:0x%.8lx, CACHE-MASK:0x%.8x\n", dbgstr,
+			DPU_IRQ_MASK(irq_idx), cache_irq_mask);
 
 	return 0;
 }
@@ -969,7 +702,7 @@ static int dpu_hw_intr_disable_irq(struct dpu_hw_intr *intr, int irq_idx)
 	if (!intr)
 		return -EINVAL;
 
-	if (irq_idx < 0 || irq_idx >= ARRAY_SIZE(dpu_irq_map)) {
+	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
 		pr_err("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
@@ -1029,17 +762,17 @@ static u32 dpu_hw_intr_get_interrupt_status(struct dpu_hw_intr *intr,
 	if (!intr)
 		return 0;
 
-	if (irq_idx >= ARRAY_SIZE(dpu_irq_map) || irq_idx < 0) {
+	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
 		pr_err("invalid IRQ index: [%d]\n", irq_idx);
 		return 0;
 	}
 
 	spin_lock_irqsave(&intr->irq_lock, irq_flags);
 
-	reg_idx = dpu_irq_map[irq_idx].reg_idx;
+	reg_idx = DPU_IRQ_REG(irq_idx);
 	intr_status = DPU_REG_READ(&intr->hw,
 			dpu_intr_set[reg_idx].status_off) &
-					dpu_irq_map[irq_idx].irq_mask;
+		DPU_IRQ_MASK(irq_idx);
 	if (intr_status && clear)
 		DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
 				intr_status);
@@ -1086,7 +819,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 	__intr_offset(m, addr, &intr->hw);
 	__setup_intr_ops(&intr->ops);
 
-	intr->irq_idx_tbl_size = ARRAY_SIZE(dpu_irq_map);
+	intr->total_irqs = ARRAY_SIZE(dpu_intr_set) * 32;
 
 	intr->cache_irq_mask = kcalloc(ARRAY_SIZE(dpu_intr_set), sizeof(u32),
 			GFP_KERNEL);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 8d005687b265..044c85d3c511 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -160,7 +160,7 @@ struct dpu_hw_intr_ops {
  * @ops:              function pointer mapping for IRQ handling
  * @cache_irq_mask:   array of IRQ enable masks reg storage created during init
  * @save_irq_status:  array of IRQ status reg storage created during init
- * @irq_idx_tbl_size: total number of irq_idx mapped in the hw_interrupts
+ * @total_irqs: total number of irq_idx mapped in the hw_interrupts
  * @irq_lock:         spinlock for accessing IRQ resources
  */
 struct dpu_hw_intr {
@@ -168,7 +168,7 @@ struct dpu_hw_intr {
 	struct dpu_hw_intr_ops ops;
 	u32 *cache_irq_mask;
 	u32 *save_irq_status;
-	u32 irq_idx_tbl_size;
+	u32 total_irqs;
 	spinlock_t irq_lock;
 	unsigned long irq_mask;
 };
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
