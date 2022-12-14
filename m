Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D41564C6B2
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 11:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460C410E3BB;
	Wed, 14 Dec 2022 10:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F6610E3BB;
 Wed, 14 Dec 2022 10:07:24 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BE3ds40016487; Wed, 14 Dec 2022 10:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=k4lXKQ3WiCattyHrDJJe9uuAcHx0zRtRDkvAnxjvIOA=;
 b=OLfyLXdddnI2P+vWCVnRy0uFbW9GL1VA+UVzW0DTwMzVp3VU9CQ6WjDtZ66hP5vTiTom
 2xP1D1cV8/KkjY/+08BKEYKKcEHUhSVM2tgFkRX52FjVvWwhv5WvSLou5qvjb/Czhj3C
 6nTxody8luUFtLkdXFdGufBQFqeSflJxT0ly/dzbheOU+MbAlwu/oyAf/ayhHPP0ahII
 r00EwERiGpXJFgwxTtTZf5Zjcx1Ect+VrcoBsuK0R3lUU7lpcUcGm2IpaPBk2bM/hWxa
 xmmgCVFnyMapErjDxa/gxrq0mn9M2bzp0VCopQtED1H+9qCM7gczCUWaoCFs0g+E0ViI 9A== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mf6re8prh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Dec 2022 10:07:22 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BEA7LC3016725
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Dec 2022 10:07:21 GMT
Received: from vpolimer-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 14 Dec 2022 02:07:16 -0800
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v9 12/15] drm/msm/disp/dpu: get timing engine status from intf
 status register
Date: Wed, 14 Dec 2022 15:35:49 +0530
Message-ID: <1671012352-1825-13-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1671012352-1825-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1671012352-1825-1-git-send-email-quic_vpolimer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: YzHRMtPSBWn_zLWdwqGtiG5QNORLQGY9
X-Proofpoint-ORIG-GUID: YzHRMtPSBWn_zLWdwqGtiG5QNORLQGY9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-14_04,2022-12-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212140079
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com,
 quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, quic_khsieh@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, swboyd@chromium.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Recommended way of reading the interface timing gen status is via
status register. Timing gen status register will give a reliable status
of the interface especially during ON/OFF transitions. This support was
added from DPU version 5.0.0.

Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 12 +++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    |  8 +++++++-
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 2196e20..0e410cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -77,7 +77,8 @@
 
 #define INTF_SC7180_MASK BIT(DPU_INTF_INPUT_CTRL) | BIT(DPU_INTF_TE)
 
-#define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
+#define INTF_SC7280_MASK \
+	(INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN) | BIT(DPU_INTF_STATUS_SUPPORTED))
 
 #define IRQ_SDM845_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
 			 BIT(MDP_SSPP_TOP0_INTR2) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 3b645d5..b16b428 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -204,17 +204,19 @@ enum {
 
 /**
  * INTF sub-blocks
- * @DPU_INTF_INPUT_CTRL         Supports the setting of pp block from which
- *                              pixel data arrives to this INTF
- * @DPU_INTF_TE                 INTF block has TE configuration support
- * @DPU_DATA_HCTL_EN            Allows data to be transferred at different rate
-                                than video timing
+ * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
+ *                                  pixel data arrives to this INTF
+ * @DPU_INTF_TE                     INTF block has TE configuration support
+ * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
+ *                                  than video timing
+ * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
  * @DPU_INTF_MAX
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
 	DPU_INTF_TE,
 	DPU_DATA_HCTL_EN,
+	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 7ce66bf..84ee2ef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -62,6 +62,7 @@
 #define   INTF_LINE_COUNT               0x0B0
 
 #define   INTF_MUX                      0x25C
+#define   INTF_STATUS                   0x26C
 
 #define INTF_CFG_ACTIVE_H_EN	BIT(29)
 #define INTF_CFG_ACTIVE_V_EN	BIT(30)
@@ -297,8 +298,13 @@ static void dpu_hw_intf_get_status(
 		struct intf_status *s)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
+	unsigned long cap = intf->cap->features;
+
+	if (cap & BIT(DPU_INTF_STATUS_SUPPORTED))
+		s->is_en = DPU_REG_READ(c, INTF_STATUS) & BIT(0);
+	else
+		s->is_en = DPU_REG_READ(c, INTF_TIMING_ENGINE_EN);
 
-	s->is_en = DPU_REG_READ(c, INTF_TIMING_ENGINE_EN);
 	s->is_prog_fetch_en = !!(DPU_REG_READ(c, INTF_CONFIG) & BIT(31));
 	if (s->is_en) {
 		s->frame_count = DPU_REG_READ(c, INTF_FRAME_COUNT);
-- 
2.7.4

