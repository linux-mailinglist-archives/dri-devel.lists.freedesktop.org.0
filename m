Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237A235B7A3
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 02:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6578489FEC;
	Mon, 12 Apr 2021 00:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C6F89FC8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 00:10:01 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id z13so1453027lfd.9
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Apr 2021 17:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QgvxnRu+j4gXCZCjt1fllMdrn3vENuYxFg0JcJrQcyA=;
 b=sh0t2Mwac8OmH9s/MYZoGQu7gi8NUOeY5U2+034qlAi05azYr0bXGT1O5PEXAW+fCg
 Pegb4FDrlNlC0KzZiJUzhuqSHJrFgdveDArb/QNPHPrkBmi7R/JqSxYzk1OtwOa8hCO7
 Of2Dh7qy8MDkBXLtuNVUD3u15iuSIRXvJ/BLc9T+yvr84E8PPl9R07PjnZwwUS225yXa
 9/fsLsRdGwt3B1RsbSkwKOSlC9wvhKkzL83dmucuoHM/1nz+WLv0A3okav6QTHDQ9DhK
 HULWLiQHWnfrLMCHpPNnz0YIyaYsQwsiGTSbIKh3830xs7IKClU+9P6Z/PLr544/77k3
 6Dyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QgvxnRu+j4gXCZCjt1fllMdrn3vENuYxFg0JcJrQcyA=;
 b=KFATQEW0h5wYsSiYTbfcLY5GQgkaUzcl2aUf1Tk5yNveaD2i27tpyDv8ShSoJQUcoS
 UfW18PTc19SJ3FRvqjEmPryoJZy47IMRNnUYL3N/ByWDI0wHHpDjMdAfsfX3cLDNHszI
 PTYFcc1WKBRYA6hvoODI6MkIK+49DhbrTYmjXAoXbW993j+j8++9yEbFAJIHWCE59dZO
 hU5qy9R9Gdb308WirPKMK70vTPjnT4OF6jRtSe+75dYdAXY0iv5mp9gz9H9cwD1tELBn
 8+WUatXIAMcQmoZDvzDQiH24foHQVCMioXvuItvk54d0w8vMNxZl+V3407jEEp7oK7Ug
 7y6g==
X-Gm-Message-State: AOAM532K+YHPUKb/OU6BWrd7Tw4Jbh4U4v0MdTKDsDj1xWU36WLKalgE
 5KMruAgfrNL3KNQisS9Q3jxgbg==
X-Google-Smtp-Source: ABdhPJxLWakIUY1j7UxmKtpr9Sziu3XvJfZDADT2N5/m4r0WWYwnR8e8Fk3PdggFQUY8yUNo8Da1YQ==
X-Received: by 2002:ac2:5548:: with SMTP id l8mr1173323lfk.431.1618186200056; 
 Sun, 11 Apr 2021 17:10:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s22sm2307212ljd.28.2021.04.11.17.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 17:09:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v1 3/3] drm/msm/dpu: simplify interrupt managing
Date: Mon, 12 Apr 2021 03:09:54 +0300
Message-Id: <20210412000954.2049141-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210412000954.2049141-1-dmitry.baryshkov@linaro.org>
References: <20210412000954.2049141-1-dmitry.baryshkov@linaro.org>
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c  |   10 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 1151 +++--------------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |    4 +-
 3 files changed, 196 insertions(+), 969 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
index fd11a2aeab6c..4e2ad03df903 100644
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
index 8bd22e060437..2cb6800047c3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -32,142 +32,142 @@
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
-#define DPU_INTR_INTF_5_UNDERRUN BIT(22)
-#define DPU_INTR_INTF_0_VSYNC BIT(25)
-#define DPU_INTR_INTF_1_VSYNC BIT(27)
-#define DPU_INTR_INTF_2_VSYNC BIT(29)
-#define DPU_INTR_INTF_3_VSYNC BIT(31)
-#define DPU_INTR_INTF_5_VSYNC BIT(23)
+#define DPU_INTR_INTF_0_UNDERRUN	24
+#define DPU_INTR_INTF_1_UNDERRUN	26
+#define DPU_INTR_INTF_2_UNDERRUN	28
+#define DPU_INTR_INTF_3_UNDERRUN	30
+#define DPU_INTR_INTF_5_UNDERRUN	22
+#define DPU_INTR_INTF_0_VSYNC	25
+#define DPU_INTR_INTF_1_VSYNC	27
+#define DPU_INTR_INTF_2_VSYNC	29
+#define DPU_INTR_INTF_3_VSYNC	31
+#define DPU_INTR_INTF_5_VSYNC	23
 
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
@@ -184,13 +184,13 @@ struct dpu_intr_reg {
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
 
@@ -265,6 +265,10 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
 	},
 };
 
+#define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
+#define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
+#define DPU_IRQ_MASK(irq_idx)	(BIT(irq_idx % 32))
+
 /*
  * struct dpu_irq_type - IRQ mapping table use for lookup an irq_idx in this
  *			 table that have a matching interface type and
@@ -328,59 +332,20 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 	{ DPU_IRQ_TYPE_INTF_VSYNC, INTF_2, DPU_INTR_INTF_2_VSYNC, 0},
 	{ DPU_IRQ_TYPE_INTF_UNDER_RUN, INTF_3, DPU_INTR_INTF_3_UNDERRUN, 0},
 	{ DPU_IRQ_TYPE_INTF_VSYNC, INTF_3, DPU_INTR_INTF_3_VSYNC, 0},
-	/* irq_idx:32-33 */
+	/* irq_idx: 22,23, changed for sc7x80 */
 	{ DPU_IRQ_TYPE_INTF_UNDER_RUN, INTF_5, DPU_INTR_INTF_5_UNDERRUN, 0},
 	{ DPU_IRQ_TYPE_INTF_VSYNC, INTF_5, DPU_INTR_INTF_5_VSYNC, 0},
-	/* irq_idx:34-63 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 0},
-	/* BEGIN MAP_RANGE: 64-95, INTR2 */
-	/* irq_idx: 64-67 */
+	/* BEGIN MAP_RANGE: 32-63, INTR2 */
+	/* irq_idx: 32-35 */
 	{ DPU_IRQ_TYPE_PING_PONG_AUTO_REF, PINGPONG_S0,
 		DPU_INTR_PING_PONG_S0_AUTOREFRESH_DONE, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	/* irq_idx: 68-71 */
+	/* irq_idx: 36-39 */
 	{ DPU_IRQ_TYPE_PING_PONG_WR_PTR, PINGPONG_S0,
 		DPU_INTR_PING_PONG_S0_WR_PTR, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	/* irq_idx: 72 */
+	/* irq_idx: 40 */
 	{ DPU_IRQ_TYPE_PING_PONG_RD_PTR, PINGPONG_S0,
 		DPU_INTR_PING_PONG_S0_RD_PTR, 1},
-	/* irq_idx: 73-77 */
+	/* irq_idx: 41-45 */
 	{ DPU_IRQ_TYPE_CTL_START, CTL_0,
 		DPU_INTR_CTL_0_START, 1},
 	{ DPU_IRQ_TYPE_CTL_START, CTL_1,
@@ -391,10 +356,10 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_CTL_3_START, 1},
 	{ DPU_IRQ_TYPE_CTL_START, CTL_4,
 		DPU_INTR_CTL_4_START, 1},
-	/* irq_idx: 78-79 */
+	/* irq_idx: 46-47 */
 	{ DPU_IRQ_TYPE_CWB_OVERFLOW, CWB_2, DPU_INTR_CWB_2_OVERFLOW, 1},
 	{ DPU_IRQ_TYPE_CWB_OVERFLOW, CWB_3, DPU_INTR_CWB_3_OVERFLOW, 1},
-	/* irq_idx: 80-83 */
+	/* irq_idx: 48-51 */
 	{ DPU_IRQ_TYPE_PING_PONG_TEAR_CHECK, PINGPONG_0,
 		DPU_INTR_PING_PONG_0_TEAR_DETECTED, 1},
 	{ DPU_IRQ_TYPE_PING_PONG_TEAR_CHECK, PINGPONG_1,
@@ -403,13 +368,10 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_PING_PONG_2_TEAR_DETECTED, 1},
 	{ DPU_IRQ_TYPE_PING_PONG_TEAR_CHECK, PINGPONG_3,
 		DPU_INTR_PING_PONG_3_TEAR_DETECTED, 1},
-	/* irq_idx: 84-87 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
+	/* irq_idx: 52-55 */
 	{ DPU_IRQ_TYPE_PING_PONG_TEAR_CHECK, PINGPONG_S0,
 		DPU_INTR_PING_PONG_S0_TEAR_DETECTED, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	/* irq_idx: 88-91 */
+	/* irq_idx: 56-59 */
 	{ DPU_IRQ_TYPE_PING_PONG_TE_CHECK, PINGPONG_0,
 		DPU_INTR_PING_PONG_0_TE_DETECTED, 1},
 	{ DPU_IRQ_TYPE_PING_PONG_TE_CHECK, PINGPONG_1,
@@ -418,129 +380,42 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_PING_PONG_2_TE_DETECTED, 1},
 	{ DPU_IRQ_TYPE_PING_PONG_TE_CHECK, PINGPONG_3,
 		DPU_INTR_PING_PONG_3_TE_DETECTED, 1},
-	/* irq_idx: 92-95 */
+	/* irq_idx: 60-63 */
 	{ DPU_IRQ_TYPE_PING_PONG_TE_CHECK, PINGPONG_S0,
 		DPU_INTR_PING_PONG_S0_TE_DETECTED, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	/* irq_idx: 96-127 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 1},
-	/* BEGIN MAP_RANGE: 128-159 HIST */
-	/* irq_idx: 128-131 */
+	/* BEGIN MAP_RANGE: 64-95 HIST */
+	/* irq_idx: 64-67 */
 	{ DPU_IRQ_TYPE_HIST_VIG_DONE, SSPP_VIG0, DPU_INTR_HIST_VIG_0_DONE, 2},
 	{ DPU_IRQ_TYPE_HIST_VIG_RSTSEQ, SSPP_VIG0,
 		DPU_INTR_HIST_VIG_0_RSTSEQ_DONE, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	/* irq_idx: 132-135 */
+	/* irq_idx: 68-71 */
 	{ DPU_IRQ_TYPE_HIST_VIG_DONE, SSPP_VIG1, DPU_INTR_HIST_VIG_1_DONE, 2},
 	{ DPU_IRQ_TYPE_HIST_VIG_RSTSEQ, SSPP_VIG1,
 		DPU_INTR_HIST_VIG_1_RSTSEQ_DONE, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	/* irq_idx: 136-139 */
+	/* irq_idx: 72-75 */
 	{ DPU_IRQ_TYPE_HIST_VIG_DONE, SSPP_VIG2, DPU_INTR_HIST_VIG_2_DONE, 2},
 	{ DPU_IRQ_TYPE_HIST_VIG_RSTSEQ, SSPP_VIG2,
 		DPU_INTR_HIST_VIG_2_RSTSEQ_DONE, 2},
 	{ DPU_IRQ_TYPE_HIST_VIG_DONE, SSPP_VIG3, DPU_INTR_HIST_VIG_3_DONE, 2},
 	{ DPU_IRQ_TYPE_HIST_VIG_RSTSEQ, SSPP_VIG3,
 		DPU_INTR_HIST_VIG_3_RSTSEQ_DONE, 2},
-	/* irq_idx: 140-143 */
+	/* irq_idx: 76-79 */
 	{ DPU_IRQ_TYPE_HIST_DSPP_DONE, DSPP_0, DPU_INTR_HIST_DSPP_0_DONE, 2},
 	{ DPU_IRQ_TYPE_HIST_DSPP_RSTSEQ, DSPP_0,
 		DPU_INTR_HIST_DSPP_0_RSTSEQ_DONE, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	/* irq_idx: 144-147 */
+	/* irq_idx: 80-83 */
 	{ DPU_IRQ_TYPE_HIST_DSPP_DONE, DSPP_1, DPU_INTR_HIST_DSPP_1_DONE, 2},
 	{ DPU_IRQ_TYPE_HIST_DSPP_RSTSEQ, DSPP_1,
 		DPU_INTR_HIST_DSPP_1_RSTSEQ_DONE, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	/* irq_idx: 148-151 */
+	/* irq_idx: 84-87 */
 	{ DPU_IRQ_TYPE_HIST_DSPP_DONE, DSPP_2, DPU_INTR_HIST_DSPP_2_DONE, 2},
 	{ DPU_IRQ_TYPE_HIST_DSPP_RSTSEQ, DSPP_2,
 		DPU_INTR_HIST_DSPP_2_RSTSEQ_DONE, 2},
 	{ DPU_IRQ_TYPE_HIST_DSPP_DONE, DSPP_3, DPU_INTR_HIST_DSPP_3_DONE, 2},
 	{ DPU_IRQ_TYPE_HIST_DSPP_RSTSEQ, DSPP_3,
 		DPU_INTR_HIST_DSPP_3_RSTSEQ_DONE, 2},
-	/* irq_idx: 152-155 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	/* irq_idx: 156-159 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	/* irq_idx: 160-191 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 2},
-	/* BEGIN MAP_RANGE: 192-255 INTF_0_INTR */
-	/* irq_idx: 192-195 */
+	/* BEGIN MAP_RANGE: 96-127 INTF_0_INTR */
+	/* irq_idx: 96-99 */
 	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_0,
 		DPU_INTR_VIDEO_INTO_STATIC, 3},
 	{ DPU_IRQ_TYPE_SFI_VIDEO_OUT, INTF_0,
@@ -549,7 +424,7 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_0_INTO_STATIC, 3},
 	{ DPU_IRQ_TYPE_SFI_CMD_0_OUT, INTF_0,
 		DPU_INTR_DSICMD_0_OUTOF_STATIC, 3},
-	/* irq_idx: 196-199 */
+	/* irq_idx: 100-103 */
 	{ DPU_IRQ_TYPE_SFI_CMD_1_IN, INTF_0,
 		DPU_INTR_DSICMD_1_INTO_STATIC, 3},
 	{ DPU_IRQ_TYPE_SFI_CMD_1_OUT, INTF_0,
@@ -558,71 +433,10 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_2_INTO_STATIC, 3},
 	{ DPU_IRQ_TYPE_SFI_CMD_2_OUT, INTF_0,
 		DPU_INTR_DSICMD_2_OUTOF_STATIC, 3},
-	/* irq_idx: 200-203 */
+	/* irq_idx: 104-107 */
 	{ DPU_IRQ_TYPE_PROG_LINE, INTF_0, DPU_INTR_PROG_LINE, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	/* irq_idx: 204-207 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	/* irq_idx: 208-211 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	/* irq_idx: 212-215 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	/* irq_idx: 216-219 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	/* irq_idx: 220-223 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	/* irq_idx: 224-255 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 3},
-	/* BEGIN MAP_RANGE: 256-319 INTF_1_INTR */
-	/* irq_idx: 256-259 */
+	/* BEGIN MAP_RANGE: 128-159 INTF_1_INTR */
+	/* irq_idx: 128-131 */
 	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_1,
 		DPU_INTR_VIDEO_INTO_STATIC, 4},
 	{ DPU_IRQ_TYPE_SFI_VIDEO_OUT, INTF_1,
@@ -631,7 +445,7 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_0_INTO_STATIC, 4},
 	{ DPU_IRQ_TYPE_SFI_CMD_0_OUT, INTF_1,
 		DPU_INTR_DSICMD_0_OUTOF_STATIC, 4},
-	/* irq_idx: 260-263 */
+	/* irq_idx: 132-135 */
 	{ DPU_IRQ_TYPE_SFI_CMD_1_IN, INTF_1,
 		DPU_INTR_DSICMD_1_INTO_STATIC, 4},
 	{ DPU_IRQ_TYPE_SFI_CMD_1_OUT, INTF_1,
@@ -640,71 +454,10 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_2_INTO_STATIC, 4},
 	{ DPU_IRQ_TYPE_SFI_CMD_2_OUT, INTF_1,
 		DPU_INTR_DSICMD_2_OUTOF_STATIC, 4},
-	/* irq_idx: 264-267 */
+	/* irq_idx: 136-139 */
 	{ DPU_IRQ_TYPE_PROG_LINE, INTF_1, DPU_INTR_PROG_LINE, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	/* irq_idx: 268-271 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	/* irq_idx: 272-275 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	/* irq_idx: 276-279 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	/* irq_idx: 280-283 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	/* irq_idx: 284-287 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	/* irq_idx: 288-319 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 4},
-	/* BEGIN MAP_RANGE: 320-383 INTF_2_INTR */
-	/* irq_idx: 320-323 */
+	/* BEGIN MAP_RANGE: 160-191 INTF_2_INTR */
+	/* irq_idx: 160-163 */
 	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_2,
 		DPU_INTR_VIDEO_INTO_STATIC, 5},
 	{ DPU_IRQ_TYPE_SFI_VIDEO_OUT, INTF_2,
@@ -713,7 +466,7 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_0_INTO_STATIC, 5},
 	{ DPU_IRQ_TYPE_SFI_CMD_0_OUT, INTF_2,
 		DPU_INTR_DSICMD_0_OUTOF_STATIC, 5},
-	/* irq_idx: 324-327 */
+	/* irq_idx: 164-167 */
 	{ DPU_IRQ_TYPE_SFI_CMD_1_IN, INTF_2,
 		DPU_INTR_DSICMD_1_INTO_STATIC, 5},
 	{ DPU_IRQ_TYPE_SFI_CMD_1_OUT, INTF_2,
@@ -722,71 +475,10 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_2_INTO_STATIC, 5},
 	{ DPU_IRQ_TYPE_SFI_CMD_2_OUT, INTF_2,
 		DPU_INTR_DSICMD_2_OUTOF_STATIC, 5},
-	/* irq_idx: 328-331 */
+	/* irq_idx: 168-171 */
 	{ DPU_IRQ_TYPE_PROG_LINE, INTF_2, DPU_INTR_PROG_LINE, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	/* irq_idx: 332-335 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	/* irq_idx: 336-339 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	/* irq_idx: 340-343 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	/* irq_idx: 344-347 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	/* irq_idx: 348-351 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	/* irq_idx: 352-383 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 5},
-	/* BEGIN MAP_RANGE: 384-447 INTF_3_INTR */
-	/* irq_idx: 384-387 */
+	/* BEGIN MAP_RANGE: 192-223 INTF_3_INTR */
+	/* irq_idx: 192-195 */
 	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_3,
 		DPU_INTR_VIDEO_INTO_STATIC, 6},
 	{ DPU_IRQ_TYPE_SFI_VIDEO_OUT, INTF_3,
@@ -795,7 +487,7 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_0_INTO_STATIC, 6},
 	{ DPU_IRQ_TYPE_SFI_CMD_0_OUT, INTF_3,
 		DPU_INTR_DSICMD_0_OUTOF_STATIC, 6},
-	/* irq_idx: 388-391 */
+	/* irq_idx: 196-199 */
 	{ DPU_IRQ_TYPE_SFI_CMD_1_IN, INTF_3,
 		DPU_INTR_DSICMD_1_INTO_STATIC, 6},
 	{ DPU_IRQ_TYPE_SFI_CMD_1_OUT, INTF_3,
@@ -804,71 +496,10 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_2_INTO_STATIC, 6},
 	{ DPU_IRQ_TYPE_SFI_CMD_2_OUT, INTF_3,
 		DPU_INTR_DSICMD_2_OUTOF_STATIC, 6},
-	/* irq_idx: 392-395 */
+	/* irq_idx: 200-203 */
 	{ DPU_IRQ_TYPE_PROG_LINE, INTF_3, DPU_INTR_PROG_LINE, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	/* irq_idx: 396-399 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	/* irq_idx: 400-403 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	/* irq_idx: 404-407 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	/* irq_idx: 408-411 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	/* irq_idx: 412-415 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	/* irq_idx: 416-447*/
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 6},
-	/* BEGIN MAP_RANGE: 448-511 INTF_4_INTR */
-	/* irq_idx: 448-451 */
+	/* BEGIN MAP_RANGE: 224-255 INTF_4_INTR */
+	/* irq_idx: 224-227 */
 	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_4,
 		DPU_INTR_VIDEO_INTO_STATIC, 7},
 	{ DPU_IRQ_TYPE_SFI_VIDEO_OUT, INTF_4,
@@ -877,7 +508,7 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_0_INTO_STATIC, 7},
 	{ DPU_IRQ_TYPE_SFI_CMD_0_OUT, INTF_4,
 		DPU_INTR_DSICMD_0_OUTOF_STATIC, 7},
-	/* irq_idx: 452-455 */
+	/* irq_idx: 228-231 */
 	{ DPU_IRQ_TYPE_SFI_CMD_1_IN, INTF_4,
 		DPU_INTR_DSICMD_1_INTO_STATIC, 7},
 	{ DPU_IRQ_TYPE_SFI_CMD_1_OUT, INTF_4,
@@ -886,219 +517,16 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_2_INTO_STATIC, 7},
 	{ DPU_IRQ_TYPE_SFI_CMD_2_OUT, INTF_4,
 		DPU_INTR_DSICMD_2_OUTOF_STATIC, 7},
-	/* irq_idx: 456-459 */
+	/* irq_idx: 232-235 */
 	{ DPU_IRQ_TYPE_PROG_LINE, INTF_4, DPU_INTR_PROG_LINE, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	/* irq_idx: 460-463 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	/* irq_idx: 464-467 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	/* irq_idx: 468-471 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	/* irq_idx: 472-475 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	/* irq_idx: 476-479 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	/* irq_idx: 480-511 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 7},
-	/* BEGIN MAP_RANGE: 512-575 AD4_0_INTR */
-	/* irq_idx: 512-515 */
+	/* BEGIN MAP_RANGE: 256-287 AD4_0_INTR */
+	/* irq_idx: 256-259 */
 	{ DPU_IRQ_TYPE_AD4_BL_DONE, DSPP_0, DPU_INTR_BACKLIGHT_UPDATED, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	/* irq_idx: 516-519 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	/* irq_idx: 520-523 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	/* irq_idx: 524-527 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	/* irq_idx: 528-531 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	/* irq_idx: 532-535 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	/* irq_idx: 536-539 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	/* irq_idx: 540-543 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	/* irq_idx: 544-575*/
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 8},
-	/* BEGIN MAP_RANGE: 576-639 AD4_1_INTR */
-	/* irq_idx: 576-579 */
+	/* BEGIN MAP_RANGE: 288-319 AD4_1_INTR */
+	/* irq_idx: 288-291 */
 	{ DPU_IRQ_TYPE_AD4_BL_DONE, DSPP_1, DPU_INTR_BACKLIGHT_UPDATED, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	/* irq_idx: 580-583 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	/* irq_idx: 584-587 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	/* irq_idx: 588-591 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	/* irq_idx: 592-595 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	/* irq_idx: 596-599 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	/* irq_idx: 600-603 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	/* irq_idx: 604-607 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	/* irq_idx: 608-639 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 9},
-	/* BEGIN MAP_RANGE: 640-703 INTF_0_SC7280_INTR */
-	/* irq_idx: 640-643 */
+	/* BEGIN MAP_RANGE: 320-351 INTF_0_SC7280_INTR */
+	/* irq_idx: 320-323 */
 	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_0,
 		DPU_INTR_VIDEO_INTO_STATIC, 10},
 	{ DPU_IRQ_TYPE_SFI_VIDEO_OUT, INTF_0,
@@ -1107,7 +535,7 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_0_INTO_STATIC, 10},
 	{ DPU_IRQ_TYPE_SFI_CMD_0_OUT, INTF_0,
 		DPU_INTR_DSICMD_0_OUTOF_STATIC, 10},
-	/* irq_idx: 644-647 */
+	/* irq_idx: 324-327 */
 	{ DPU_IRQ_TYPE_SFI_CMD_1_IN, INTF_0,
 		DPU_INTR_DSICMD_1_INTO_STATIC, 10},
 	{ DPU_IRQ_TYPE_SFI_CMD_1_OUT, INTF_0,
@@ -1116,71 +544,10 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_2_INTO_STATIC, 10},
 	{ DPU_IRQ_TYPE_SFI_CMD_2_OUT, INTF_0,
 		DPU_INTR_DSICMD_2_OUTOF_STATIC, 10},
-	/* irq_idx: 648-651 */
+	/* irq_idx: 328-331 */
 	{ DPU_IRQ_TYPE_PROG_LINE, INTF_0, DPU_INTR_PROG_LINE, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	/* irq_idx: 652-655 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	/* irq_idx: 656-659 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	/* irq_idx: 660-663 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	/* irq_idx: 664-667 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	/* irq_idx: 668-671 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	/* irq_idx: 672-703 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 10},
-	/* BEGIN MAP_RANGE: 704-767 INTF_1_SC7280_INTR */
-	/* irq_idx: 704-707 */
+	/* BEGIN MAP_RANGE: 352-383 INTF_1_SC7280_INTR */
+	/* irq_idx: 352-355 */
 	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_1,
 		DPU_INTR_VIDEO_INTO_STATIC, 11},
 	{ DPU_IRQ_TYPE_SFI_VIDEO_OUT, INTF_1,
@@ -1189,7 +556,7 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_0_INTO_STATIC, 11},
 	{ DPU_IRQ_TYPE_SFI_CMD_0_OUT, INTF_1,
 		DPU_INTR_DSICMD_0_OUTOF_STATIC, 11},
-	/* irq_idx: 708-711 */
+	/* irq_idx: 356-359 */
 	{ DPU_IRQ_TYPE_SFI_CMD_1_IN, INTF_1,
 		DPU_INTR_DSICMD_1_INTO_STATIC, 11},
 	{ DPU_IRQ_TYPE_SFI_CMD_1_OUT, INTF_1,
@@ -1198,71 +565,10 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_2_INTO_STATIC, 11},
 	{ DPU_IRQ_TYPE_SFI_CMD_2_OUT, INTF_1,
 		DPU_INTR_DSICMD_2_OUTOF_STATIC, 11},
-	/* irq_idx: 712-715 */
+	/* irq_idx: 360-363 */
 	{ DPU_IRQ_TYPE_PROG_LINE, INTF_1, DPU_INTR_PROG_LINE, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	/* irq_idx: 716-719 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	/* irq_idx: 720-723 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	/* irq_idx: 724-727 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	/* irq_idx: 728-731 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	/* irq_idx: 732-735 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	/* irq_idx: 736-767 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 11},
-	/* BEGIN MAP_RANGE: 768-831 INTF_5_SC7280_INTR */
-	/* irq_idx: 768-771 */
+	/* BEGIN MAP_RANGE: 384-415 INTF_5_SC7280_INTR */
+	/* irq_idx: 384-387 */
 	{ DPU_IRQ_TYPE_SFI_VIDEO_IN, INTF_5,
 		DPU_INTR_VIDEO_INTO_STATIC, 12},
 	{ DPU_IRQ_TYPE_SFI_VIDEO_OUT, INTF_5,
@@ -1271,7 +577,7 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_0_INTO_STATIC, 12},
 	{ DPU_IRQ_TYPE_SFI_CMD_0_OUT, INTF_5,
 		DPU_INTR_DSICMD_0_OUTOF_STATIC, 12},
-	/* irq_idx: 772-775 */
+	/* irq_idx: 388-391 */
 	{ DPU_IRQ_TYPE_SFI_CMD_1_IN, INTF_5,
 		DPU_INTR_DSICMD_1_INTO_STATIC, 12},
 	{ DPU_IRQ_TYPE_SFI_CMD_1_OUT, INTF_5,
@@ -1280,69 +586,8 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 		DPU_INTR_DSICMD_2_INTO_STATIC, 12},
 	{ DPU_IRQ_TYPE_SFI_CMD_2_OUT, INTF_5,
 		DPU_INTR_DSICMD_2_OUTOF_STATIC, 12},
-	/* irq_idx: 776-779 */
+	/* irq_idx: 392-395 */
 	{ DPU_IRQ_TYPE_PROG_LINE, INTF_5, DPU_INTR_PROG_LINE, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	/* irq_idx: 780-783 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	/* irq_idx: 784-787 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	/* irq_idx: 788-791 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	/* irq_idx: 792-795 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	/* irq_idx: 796-799 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	/* irq_idx: 800-831 */
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
-	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
 };
 
 static int dpu_hw_intr_irqidx_lookup(struct dpu_hw_intr *intr,
@@ -1354,7 +599,7 @@ static int dpu_hw_intr_irqidx_lookup(struct dpu_hw_intr *intr,
 		if (intr_type == dpu_irq_map[i].intr_type &&
 			instance_idx == dpu_irq_map[i].instance_idx &&
 			!(intr->obsolete_irq & BIT(dpu_irq_map[i].intr_type)))
-			return i;
+			return DPU_IRQ_IDX(dpu_irq_map[i].reg_idx, dpu_irq_map[i].irq_offset);
 	}
 
 	pr_debug("IRQ lookup fail!! intr_type=%d, instance_idx=%d\n",
@@ -1370,9 +615,8 @@ static void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr *intr,
 	if (!intr)
 		return;
 
-	reg_idx = dpu_irq_map[irq_idx].reg_idx;
-	DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
-			dpu_irq_map[irq_idx].irq_mask);
+	reg_idx = DPU_IRQ_REG(irq_idx);
+	DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off, DPU_IRQ_MASK(irq_idx));
 
 	/* ensure register writes go through */
 	wmb();
@@ -1384,10 +628,9 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
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
@@ -1400,15 +643,7 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 	 */
 	spin_lock_irqsave(&intr->irq_lock, irq_flags);
 	for (reg_idx = 0; reg_idx < ARRAY_SIZE(dpu_intr_set); reg_idx++) {
-		/*
-		 * Each Interrupt register has a range of 64 indexes, and
-		 * that is static for dpu_irq_map.
-		 */
-		start_idx = reg_idx * 64;
-		end_idx = start_idx + 64;
-
-		if (!test_bit(reg_idx, &intr->irq_mask) ||
-			start_idx >= ARRAY_SIZE(dpu_irq_map))
+		if (!test_bit(reg_idx, &intr->irq_mask))
 			continue;
 
 		/* Read interrupt status */
@@ -1425,37 +660,33 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
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
-				(dpu_irq_map[irq_idx].reg_idx == reg_idx) &&
-				!(intr->obsolete_irq &
-				BIT(dpu_irq_map[irq_idx].intr_type))) {
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
@@ -1469,32 +700,30 @@ static int dpu_hw_intr_enable_irq(struct dpu_hw_intr *intr, int irq_idx)
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
 
@@ -1505,8 +734,8 @@ static int dpu_hw_intr_enable_irq(struct dpu_hw_intr *intr, int irq_idx)
 	}
 	spin_unlock_irqrestore(&intr->irq_lock, irq_flags);
 
-	pr_debug("%s MASK:0x%.8x, CACHE-MASK:0x%.8x\n", dbgstr,
-			irq->irq_mask, cache_irq_mask);
+	pr_debug("%s MASK:0x%.8lx, CACHE-MASK:0x%.8x\n", dbgstr,
+			DPU_IRQ_MASK(irq_idx), cache_irq_mask);
 
 	return 0;
 }
@@ -1515,33 +744,31 @@ static int dpu_hw_intr_disable_irq_nolock(struct dpu_hw_intr *intr, int irq_idx)
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
@@ -1549,8 +776,8 @@ static int dpu_hw_intr_disable_irq_nolock(struct dpu_hw_intr *intr, int irq_idx)
 		intr->cache_irq_mask[reg_idx] = cache_irq_mask;
 	}
 
-	pr_debug("%s MASK:0x%.8x, CACHE-MASK:0x%.8x\n", dbgstr,
-			irq->irq_mask, cache_irq_mask);
+	pr_debug("%s MASK:0x%.8lx, CACHE-MASK:0x%.8x\n", dbgstr,
+			DPU_IRQ_MASK(irq_idx), cache_irq_mask);
 
 	return 0;
 }
@@ -1562,7 +789,7 @@ static int dpu_hw_intr_disable_irq(struct dpu_hw_intr *intr, int irq_idx)
 	if (!intr)
 		return -EINVAL;
 
-	if (irq_idx < 0 || irq_idx >= ARRAY_SIZE(dpu_irq_map)) {
+	if (irq_idx < 0 || irq_idx >= intr->total_irqs) {
 		pr_err("invalid IRQ index: [%d]\n", irq_idx);
 		return -EINVAL;
 	}
@@ -1622,17 +849,17 @@ static u32 dpu_hw_intr_get_interrupt_status(struct dpu_hw_intr *intr,
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
@@ -1679,7 +906,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 	__intr_offset(m, addr, &intr->hw);
 	__setup_intr_ops(&intr->ops);
 
-	intr->irq_idx_tbl_size = ARRAY_SIZE(dpu_irq_map);
+	intr->total_irqs = ARRAY_SIZE(dpu_intr_set) * 32;
 
 	intr->cache_irq_mask = kcalloc(ARRAY_SIZE(dpu_intr_set), sizeof(u32),
 			GFP_KERNEL);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 5bade5637ecc..74abd11ab357 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -161,7 +161,7 @@ struct dpu_hw_intr_ops {
  * @ops:              function pointer mapping for IRQ handling
  * @cache_irq_mask:   array of IRQ enable masks reg storage created during init
  * @save_irq_status:  array of IRQ status reg storage created during init
- * @irq_idx_tbl_size: total number of irq_idx mapped in the hw_interrupts
+ * @total_irqs: total number of irq_idx mapped in the hw_interrupts
  * @irq_lock:         spinlock for accessing IRQ resources
  * @obsolete_irq:      irq types that are obsolete for a particular target
  */
@@ -170,7 +170,7 @@ struct dpu_hw_intr {
 	struct dpu_hw_intr_ops ops;
 	u32 *cache_irq_mask;
 	u32 *save_irq_status;
-	u32 irq_idx_tbl_size;
+	u32 total_irqs;
 	spinlock_t irq_lock;
 	unsigned long irq_mask;
 	unsigned long obsolete_irq;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
