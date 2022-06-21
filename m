Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF02C552DE1
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 11:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC096112735;
	Tue, 21 Jun 2022 09:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6265F112735;
 Tue, 21 Jun 2022 09:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655802407; x=1687338407;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=K61hZq+5YAjJeBhqEVmDHQoYLRAUk2L5vlwYe0VhwEA=;
 b=wPDSBB2K0xnIJgCSdX+4rnFsJXtQoMP4Tkpw57Fe7hIlsWyclnee2SVk
 uFRC2irU9FVNWjyqiHTMXXAhYSo/Qvwqw7Vo0tBHZPymkVnpXnfUvnceV
 SH1khh2LVAatOfSfeJk5YUNNIFZlTIgSZ6iPDc3uQ8847zIR3vthe/voz 8=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 21 Jun 2022 02:06:47 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 21 Jun 2022 02:06:46 -0700
X-QCInternal: smtphost
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
 by ironmsg02-blr.qualcomm.com with ESMTP; 21 Jun 2022 14:36:30 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id 2CFC741B2; Tue, 21 Jun 2022 02:06:29 -0700 (PDT)
From: Kalyan Thota <quic_kalyant@quicinc.com>
To: y@qualcomm.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [v1 1/2] drm/msm/disp/dpu1: add dspp support for sc7280
Date: Tue, 21 Jun 2022 02:06:26 -0700
Message-Id: <1655802387-15275-1-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <y>
References: <y>
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, dianders@chromium.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_vpolimer@quicinc.com, dmitry.baryshkov@linaro.org, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add destination side post processing hw block support in sc7280.

This hwblock enablement is necessary to support color features
like CT Matix (Ex: Night Light feature)

Change-Id: Iba7d5e1693b06cede2891f5b998466070a77c6ef
Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index a4fe77c..021eb2f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -928,7 +928,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 
 static const struct dpu_lm_cfg sc7280_lm[] = {
 	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SC7180_MASK,
-		&sc7180_lm_sblk, PINGPONG_0, 0, 0),
+		&sc7180_lm_sblk, PINGPONG_0, 0, DSPP_0),
 	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SC7180_MASK,
 		&sc7180_lm_sblk, PINGPONG_2, LM_3, 0),
 	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SC7180_MASK,
@@ -1792,6 +1792,8 @@ static void sc7280_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.ctl = sc7280_ctl,
 		.sspp_count = ARRAY_SIZE(sc7280_sspp),
 		.sspp = sc7280_sspp,
+		.dspp_count = ARRAY_SIZE(sc7180_dspp),
+		.dspp = sc7180_dspp,
 		.mixer_count = ARRAY_SIZE(sc7280_lm),
 		.mixer = sc7280_lm,
 		.pingpong_count = ARRAY_SIZE(sc7280_pp),
-- 
2.7.4

