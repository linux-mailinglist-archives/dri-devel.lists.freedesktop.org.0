Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 589FD3629B9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 22:57:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB8E6ECEB;
	Fri, 16 Apr 2021 20:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC896ECE4
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 20:57:45 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1618606665; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=qy+sjoe0B5WK+1VFYRK/7gbkTVgpSnoIKgHJbU/MPpg=;
 b=IoHX86Jv57SwgKJqkvNCb0QXJ8v43WXm6m8xyQdDOwl6y+vD9xOA5cUBd/cVXT5F5o1fUbbQ
 C7OEJ6GcOymLgWWQFc6FSEoAIlvgoRRfD6EBuOEzgdjlyn6LbtysquAD9O7Eo7lY0QoureLm
 EuFXJA3nRG09KfbQEgcCYZQM24U=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6079fa47f34440a9d4f5b600 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Apr 2021 20:57:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 01B43C43465; Fri, 16 Apr 2021 20:57:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4C811C43461;
 Fri, 16 Apr 2021 20:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4C811C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 5/7] drm/msm/disp/dpu1: add API to take DPU register
 snapshot
Date: Fri, 16 Apr 2021 13:57:23 -0700
Message-Id: <1618606645-19695-6-git-send-email-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618606645-19695-1-git-send-email-abhinavk@codeaurora.org>
References: <1618606645-19695-1-git-send-email-abhinavk@codeaurora.org>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 swboyd@chromium.org, khsieh@codeaurora.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an API to take a snapshot of DPU controller registers. This API
will be used by the msm_disp_snapshot module to capture the DPU
snapshot.

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 50 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_kms.h           |  4 +++
 2 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 88e9cc3..ead2478 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -19,6 +19,7 @@
 #include "msm_drv.h"
 #include "msm_mmu.h"
 #include "msm_gem.h"
+#include "disp/msm_disp_snapshot.h"
 
 #include "dpu_kms.h"
 #include "dpu_core_irq.h"
@@ -798,6 +799,54 @@ static void dpu_irq_uninstall(struct msm_kms *kms)
 	dpu_core_irq_uninstall(dpu_kms);
 }
 
+static void dpu_kms_mdp_snapshot(struct msm_kms *kms)
+{
+	int i;
+	struct dpu_kms *dpu_kms;
+	struct dpu_mdss_cfg *cat;
+	struct dpu_hw_mdp *top;
+	struct msm_disp_state *disp_state;
+
+	disp_state = kms->disp_state;
+
+	dpu_kms = to_dpu_kms(kms);
+
+	cat = dpu_kms->catalog;
+	top = dpu_kms->hw_mdp;
+
+	pm_runtime_get_sync(&dpu_kms->pdev->dev);
+
+	/* dump CTL sub-blocks HW regs info */
+	for (i = 0; i < cat->ctl_count; i++)
+		msm_disp_snapshot_add_block(disp_state, cat->ctl[i].len,
+				dpu_kms->mmio + cat->ctl[i].base, "ctl_%d", i);
+
+	/* dump DSPP sub-blocks HW regs info */
+	for (i = 0; i < cat->dspp_count; i++)
+		msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len,
+				dpu_kms->mmio + cat->dspp[i].base, "dspp_%d", i);
+
+	/* dump INTF sub-blocks HW regs info */
+	for (i = 0; i < cat->intf_count; i++)
+		msm_disp_snapshot_add_block(disp_state, cat->intf[i].len,
+				dpu_kms->mmio + cat->intf[i].base, "intf_%d", i);
+
+	/* dump PP sub-blocks HW regs info */
+	for (i = 0; i < cat->pingpong_count; i++)
+		msm_disp_snapshot_add_block(disp_state, cat->pingpong[i].len,
+				dpu_kms->mmio + cat->pingpong[i].base, "pingpong_%d", i);
+
+	/* dump SSPP sub-blocks HW regs info */
+	for (i = 0; i < cat->sspp_count; i++)
+		msm_disp_snapshot_add_block(disp_state, cat->sspp[i].len,
+				dpu_kms->mmio + cat->sspp[i].base, "sspp_%d", i);
+
+	msm_disp_snapshot_add_block(disp_state, top->hw.length,
+			dpu_kms->mmio + top->hw.blk_off, "top");
+
+	pm_runtime_put_sync(&dpu_kms->pdev->dev);
+}
+
 static const struct msm_kms_funcs kms_funcs = {
 	.hw_init         = dpu_kms_hw_init,
 	.irq_preinstall  = dpu_irq_preinstall,
@@ -818,6 +867,7 @@ static const struct msm_kms_funcs kms_funcs = {
 	.round_pixclk    = dpu_kms_round_pixclk,
 	.destroy         = dpu_kms_destroy,
 	.set_encoder_mode = _dpu_kms_set_encoder_mode,
+	.snapshot        = dpu_kms_mdp_snapshot,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init    = dpu_kms_debugfs_init,
 #endif
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index d84bfda..b31fdad 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -122,6 +122,10 @@ struct msm_kms_funcs {
 				 bool cmd_mode);
 	/* cleanup: */
 	void (*destroy)(struct msm_kms *kms);
+
+	/* snapshot: */
+	void (*snapshot)(struct msm_kms *kms);
+
 #ifdef CONFIG_DEBUG_FS
 	/* debugfs: */
 	int (*debugfs_init)(struct msm_kms *kms, struct drm_minor *minor);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
