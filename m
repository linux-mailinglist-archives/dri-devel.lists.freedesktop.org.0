Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBE078488A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 19:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BCDC10E3BD;
	Tue, 22 Aug 2023 17:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAF610E3BF;
 Tue, 22 Aug 2023 17:42:49 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37MHA45e019536; Tue, 22 Aug 2023 17:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=ROLjx21pZ4yzxE8kH/lL6ZDmlasqSbvZPKJTXiLPiVI=;
 b=W/p0oUovgcwF+gmCU4ZlRm5VgmhgVKPHmrImhqZWzunJwEERo+p5qmraf4vhGy9eCBa9
 G9LjFa57UYBJMLFYKp955EQWkKhy8c/7zDb0F97kEeOczFpZAvYEgAu3jjcV4dnwWla9
 4SiyFku518mKPo03sqx21iKdgS3BhPAp0DM4mXwGstY0kCq5YeGOEXMaHkFV5Ibl1MmF
 N3jnS8rQzIOIoe+gUpPPaPOR4m9/KliG3TeMOqfsjavHBnkkKxwaccrEc7uJF5HTXRXE
 5yGZqpzc5FvCa9xlrXiC20ZnmzqdpRu0V8aww+qu6HYCfugnY8rDIy6N7O7nEZ0s/Bzi Hg== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3smwvdrqyr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Aug 2023 17:42:46 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37MHgjwW015666
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Aug 2023 17:42:45 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 22 Aug 2023 10:42:45 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 22 Aug 2023 10:42:04 -0700
Subject: [PATCH v4 1/4] drm/msm/dpu: Move setting of dpu_enc::wide_bus_en
 to atomic enable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230822-add-widebus-support-v4-1-9dc86083d6ea@quicinc.com>
References: <20230822-add-widebus-support-v4-0-9dc86083d6ea@quicinc.com>
In-Reply-To: <20230822-add-widebus-support-v4-0-9dc86083d6ea@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-83828
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692726164; l=1954;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=/PBJA7kwjge1PoLCLWXqa21mCJe78rIkcmm/SsHn08o=;
 b=+rYgkpU3lpW0pe7eZO+qqbxHT4vd2fvayDpPBHS62mxcZ76/iGpAQLlfaQvZhNJ0jLIP+Y5uh
 UdC2Pp8U12pD+dvo3mHoVjH+p8cehDnHESJGF2V9OKJsC9QLSS337vR
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: UXPWS9grS216yIQzdCxyYXgetRlgl0LJ
X-Proofpoint-ORIG-GUID: UXPWS9grS216yIQzdCxyYXgetRlgl0LJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-22_15,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308220140
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the setting of dpu_enc::wide_bus_en to
dpu_encoder_virt_atomic_enable() so that it mirrors how dpu_enc::dsc
is being set.

Since wide bus for DSI is related to DSC, having it mirror how DSC
is set in DPU will also make it easier to accommodate for the possibility
of DSC for DSI being set during runtime in the future.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d34e684a4178..3dcd37c48aac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1194,11 +1194,18 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	int ret = 0;
 	struct drm_display_mode *cur_mode = NULL;
+	struct msm_drm_private *priv = drm_enc->dev->dev_private;
+	struct msm_display_info *disp_info;
 
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	disp_info = &dpu_enc->disp_info;
 
 	dpu_enc->dsc = dpu_encoder_get_dsc_config(drm_enc);
 
+	if (disp_info->intf_type == INTF_DP)
+		dpu_enc->wide_bus_en = msm_dp_wide_bus_available(
+				priv->dp[disp_info->h_tile_instance[0]]);
+
 	mutex_lock(&dpu_enc->enc_lock);
 	cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
 
@@ -2383,10 +2390,6 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 	timer_setup(&dpu_enc->frame_done_timer,
 			dpu_encoder_frame_done_timeout, 0);
 
-	if (disp_info->intf_type == INTF_DP)
-		dpu_enc->wide_bus_en = msm_dp_wide_bus_available(
-				priv->dp[disp_info->h_tile_instance[0]]);
-
 	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
 			dpu_encoder_off_work);
 	dpu_enc->idle_timeout = IDLE_TIMEOUT;

-- 
2.42.0

