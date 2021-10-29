Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9550043FD25
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 15:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6FD898B6;
	Fri, 29 Oct 2021 13:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4036E10B;
 Fri, 29 Oct 2021 12:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635510639; x=1667046639;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=WX6+oirQgO/61V41wJZp+jdW5MNtOfx/cOe7FPtKI0k=;
 b=zDFW9/fFpmYvkUo6vBj7r1pCvtIjCfC7Ei/doZ0osEFt9eHOYoeHruJn
 X3+Veg+x7Bo/4U2Y2XpL0UDzBIGXxGV46AooKf3bnMNy7jVg06NTeud8v
 /MEs5SzaZKsfQTTxhImqG1PCuv/SkfyFbJFDg6es6kZlxGdu/fE8gAnpb A=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 29 Oct 2021 05:30:38 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 29 Oct 2021 05:30:36 -0700
X-QCInternal: smtphost
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
 by ironmsg01-blr.qualcomm.com with ESMTP; 29 Oct 2021 18:00:22 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id E01DE4D8B; Fri, 29 Oct 2021 05:30:21 -0700 (PDT)
From: Kalyan Thota <quic_kalyant@quicinc.com>
To: y@qualcomm.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, dianders@chromium.org, mkrishn@codeaurora.org,
 swboyd@chromium.org, abhinavk@codeaurora.org
Subject: [v2] drm/msm/disp/dpu1: set default group ID for CTL.
Date: Fri, 29 Oct 2021 05:30:19 -0700
Message-Id: <1635510619-6715-1-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <y>
References: <y>
X-Mailman-Approved-At: Fri, 29 Oct 2021 13:10:12 +0000
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

New required programming in CTL for SC7280. Group ID informs
HW of which VM owns that CTL. Force this group ID to
default/disabled until virtualization support is enabled in SW.

Changes in v1:
 - Fix documentation and add descritpion for the change (Stephen)

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 8 ++++++++
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index ce6f32a..283605c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -45,7 +45,7 @@
 	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE))
+	(BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG))
 
 #define MERGE_3D_SM8150_MASK (0)
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4ade44b..31af04a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -179,13 +179,16 @@ enum {
 
 /**
  * CTL sub-blocks
- * @DPU_CTL_SPLIT_DISPLAY       CTL supports video mode split display
+ * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
+ * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
+ * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
  * @DPU_CTL_MAX
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
 	DPU_CTL_ACTIVE_CFG,
 	DPU_CTL_FETCH_ACTIVE,
+	DPU_CTL_VM_CFG,
 	DPU_CTL_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 64740ddb..02da9ec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -36,6 +36,7 @@
 #define  MERGE_3D_IDX   23
 #define  INTF_IDX       31
 #define CTL_INVALID_BIT                 0xffff
+#define CTL_DEFAULT_GROUP_ID		0xf
 
 static const u32 fetch_tbl[SSPP_MAX] = {CTL_INVALID_BIT, 16, 17, 18, 19,
 	CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, 0,
@@ -498,6 +499,13 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	u32 intf_active = 0;
 	u32 mode_sel = 0;
 
+	/* CTL_TOP[31:28] carries group_id to collate CTL paths
+	 * per VM. Explicitly disable it until VM support is
+	 * added in SW. Power on reset value is not disable.
+	 */
+	if ((test_bit(DPU_CTL_VM_CFG, &ctx->caps->features)))
+		mode_sel = CTL_DEFAULT_GROUP_ID  << 28;
+
 	if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
 		mode_sel |= BIT(17);
 
-- 
2.7.4

