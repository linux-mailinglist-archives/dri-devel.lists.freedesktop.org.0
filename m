Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 767A750AA4E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 22:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA7E10E09D;
	Thu, 21 Apr 2022 20:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B614310E010;
 Thu, 21 Apr 2022 20:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650574157; x=1682110157;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=jWukVpjGuKfJyRxi75npaHo+vuhyoC3Fp43OKlEJmfw=;
 b=TXp4sY1iHiL+72p4ft3uukk1grUwhFHzkCH5TUZtqMhI6GgfbC/wkx9C
 4dHfVaPwnMeh2G+IK087FahojD9v4tVD+yx2Yz+q2qJF7YPXwmkneW0c3
 CqZKzEDV/3YE0f37VZI57poo4phZphsODCyf1G9K3A4NIRvjYeVW5hlRX k=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 21 Apr 2022 13:49:17 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:49:17 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 21 Apr 2022 13:48:44 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 21 Apr 2022 13:48:44 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [RFC 2/4] drm/msm/dpu: start using wb_idx in dpu_encoder_phys_wb
Date: Thu, 21 Apr 2022 13:48:30 -0700
Message-ID: <1650574112-25294-3-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650574112-25294-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1650574112-25294-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: markyacoub@chromium.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert all the usages of intf_idx to wb_idx in
dpu_encoder_phys_wb.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 563ca08..cb5c7da 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -250,7 +250,7 @@ static int dpu_encoder_phys_wb_atomic_check(
 	const struct drm_display_mode *mode;
 
 	DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
-			phys_enc->intf_idx, mode->name, mode->hdisplay, mode->vdisplay);
+			phys_enc->wb_idx, mode->name, mode->hdisplay, mode->vdisplay);
 
 	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
 		return 0;
@@ -584,7 +584,7 @@ static void dpu_encoder_phys_wb_disable(struct dpu_encoder_phys *phys_enc)
  */
 static void dpu_encoder_phys_wb_destroy(struct dpu_encoder_phys *phys_enc)
 {
-	DPU_DEBUG("[wb:%d]\n", phys_enc->intf_idx - INTF_0);
+	DPU_DEBUG("[wb:%d]\n", phys_enc->wb_idx - WB_0);
 
 	if (!phys_enc)
 		return;
@@ -730,7 +730,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
 
 	phys_enc = &wb_enc->base;
 	phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
-	phys_enc->intf_idx = p->intf_idx;
+	phys_enc->wb_idx = p->wb_idx;
 
 	dpu_encoder_phys_wb_init_ops(&phys_enc->ops);
 	phys_enc->parent = p->parent;
@@ -738,7 +738,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
 	phys_enc->dpu_kms = p->dpu_kms;
 	phys_enc->split_role = p->split_role;
 	phys_enc->intf_mode = INTF_MODE_WB_LINE;
-	phys_enc->intf_idx = p->intf_idx;
+	phys_enc->wb_idx = p->wb_idx;
 	phys_enc->enc_spinlock = p->enc_spinlock;
 
 	atomic_set(&wb_enc->wbirq_refcount, 0);
@@ -754,7 +754,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
 	phys_enc->enable_state = DPU_ENC_DISABLED;
 
 	DPU_DEBUG("Created dpu_encoder_phys for wb %d\n",
-			phys_enc->intf_idx);
+			phys_enc->wb_idx);
 
 	return phys_enc;
 
-- 
2.7.4

