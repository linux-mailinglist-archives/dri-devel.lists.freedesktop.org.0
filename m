Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A2A54EA1D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 21:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F8111A540;
	Thu, 16 Jun 2022 19:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0CF11A53D;
 Thu, 16 Jun 2022 19:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655407615; x=1686943615;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=eq8EszL+PHtaEuv/f0qST7/2EOFmLubMZ6h6d7Aw3vI=;
 b=fL+WUhrL9Aure74PXhaMdAOy9l6zylbeik2qp5ilzBPJY4D98q75Epwx
 iBXwrpgex3Ta99/rE8G/bB/v/hkL2vvIJiPSe1Nn74vlmJzWP1/Fnl9tt
 2xwfM6BnVymmucHnequdv5k6foEotvdAXVHKlAzztdHPW1wxtv/DO/5Jv Q=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 16 Jun 2022 12:26:55 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 12:26:55 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 16 Jun 2022 12:26:54 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 16 Jun 2022 12:26:54 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH] drm/msm/dpu: limit wb modes based on max_mixer_width
Date: Thu, 16 Jun 2022 12:26:46 -0700
Message-ID: <1655407606-21760-1-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
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

As explained in [1], using max_linewidth to limit the modes
does not seem to remove 4K modes on chipsets such as
sm8250 where the max_linewidth actually supports 4k.

This would have been alright if dual SSPP support was
present but otherwise fails the per SSPP bandwidth check.

The ideal way to implement this would be to filter out
the modes which will exceed the bandwidth check by computing
it.

But this would be an exhaustive solution till we have
dual SSPP support.

Let's instead use max_mixer_width to limit the modes.

max_mixer_width still remains 2560 on sm8250 so even if
the max_linewidth is 4096, the only way 4k modes could have
been supported is to have source split enabled on the SSPP.

Since source split support is not enabled yet in DPU driver,
enforce max_mixer_width as the upper limit on the modes.

[1] https://patchwork.freedesktop.org/patch/489662/

Fixes: e67dcecda06f ("drm/msm/dpu: limit writeback modes according to max_linewidth")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 399115e4e217..2fd787079f9b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -11,7 +11,14 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 
-	return drm_add_modes_noedid(connector, dpu_kms->catalog->caps->max_linewidth,
+	/*
+	 * We should ideally be limiting the modes only to the maxlinewidth but
+	 * on some chipsets this will allow even 4k modes to be added which will
+	 * fail the per SSPP bandwidth checks. So, till we have dual-SSPP support
+	 * and source split support added lets limit the modes based on max_mixer_width
+	 * as 4K modes can then be supported.
+	 */
+	return drm_add_modes_noedid(connector, dpu_kms->catalog->caps->max_mixer_width,
 			dev->mode_config.max_height);
 }
 
-- 
2.7.4

