Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E16B526D46
	for <lists+dri-devel@lfdr.de>; Sat, 14 May 2022 01:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0164210E29C;
	Fri, 13 May 2022 23:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31BC10E29C;
 Fri, 13 May 2022 23:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652482816; x=1684018816;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zd4akutACWhnRdecwaK8kXBPem3f2j12QTdIA0rZnI8=;
 b=eGuP5Ifizp4Xv70V00Zyv5SJ1CSJAbEmW5//H7xEkujpwktaVBsOhQ5A
 D7IK1IjXWobfNdO2w8yWMJUm1WlEqtOfR8idtouJriqW3yfVZm9Ogx4LE
 J31bkeIURYJNTqCLp1mdexD5i91+fBX6b65jBpB+EUTDVGSlEUAwQNcz2 Y=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 13 May 2022 16:00:14 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 16:00:14 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 13 May 2022 16:00:13 -0700
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 13 May 2022 16:00:13 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH] drm/msm/dpu: limit writeback modes according to max_linewidth
Date: Fri, 13 May 2022 15:59:59 -0700
Message-ID: <20220513225959.19004-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Writeback modes were being added according to mode_config.max_width
but this is assigned to double of max_mixer_width.

For compositors/clients using a single SSPP, this will fail
the dpu_plane's atomic check as it checks for max_linewidth.

Limit writeback modes according to max_linewidth to allow
even compositors/clients which use only a single SSPP to
use writeback.

Fixes: 77b001acdcfeb ("drm/msm/dpu: add the writeback connector layer")
Reported-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 7620ffe55779..399115e4e217 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -8,8 +8,10 @@
 static int dpu_wb_conn_get_modes(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 
-	return drm_add_modes_noedid(connector, dev->mode_config.max_width,
+	return drm_add_modes_noedid(connector, dpu_kms->catalog->caps->max_linewidth,
 			dev->mode_config.max_height);
 }
 
-- 
2.35.1

