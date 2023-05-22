Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FE670CB08
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 22:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152A610E383;
	Mon, 22 May 2023 20:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A2610E28C;
 Mon, 22 May 2023 20:30:43 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34MIQilu022042; Mon, 22 May 2023 20:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=/aqVzZY0IFwIx51HTpdTgFu062ANanD2Cfw0BgY/do0=;
 b=gucXd9f8EZ0ZTlP1abvRZbsDwROekci1ER9wUK8oRCwlHiJWGh3QsE99qsO/CU/t7IRZ
 eduatbC0qUpnZZMvT8CNxrNKDdCUDXCbLO1keKEhzyxNv/rI20P813kKGXS4Q8ZcB5Of
 5XoNw/TZJldaUDk78Ros03kj1701/IN43bpsO6uQSwEoCpGId1ez4K9eJsH/pozd4353
 8+Q9FKuyM3OHY8fVM1DwMtoBdfvx4kfkhRy9h/6Cv4USZsvG5HdmG1Oqc1pW+uV/kzZP
 NBbSLO6xVQPtFI6mZ241928oNQ7G9beKY5Ubzr+x76vUKi4PeXs5CmjHq+nQ+iGVz0L/ Eg== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qraasrq5n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 20:30:41 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34MKUeQX010425
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 20:30:40 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 22 May 2023 13:30:39 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Mon, 22 May 2023 13:30:23 -0700
Subject: [PATCH v4 4/5] drm/msm/dpu: Set DATA_COMPRESS for command mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230405-add-dsc-support-v4-4-15daf84f8dcb@quicinc.com>
References: <20230405-add-dsc-support-v4-0-15daf84f8dcb@quicinc.com>
In-Reply-To: <20230405-add-dsc-support-v4-0-15daf84f8dcb@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684787438; l=3530;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=v5BaRvxjpsFqDUR6zArMEGwcN5kOCsmIV/ZOG6SDhVs=;
 b=uRJX2jJVpjMLY/aKEEjySsu4cKZkpqxc2jZLbIaihhQhUaiStgXrbbg/HM5z88RS2xu6JV+sC
 0jnmZuWsXOJCmQ70tPZsFgCr8JfWTZlJuzt0DccsIDswRLrBg7dUKYL
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: OQL6UyqsRKrjXjHyEH6dRDhIeIA01BGG
X-Proofpoint-ORIG-GUID: OQL6UyqsRKrjXjHyEH6dRDhIeIA01BGG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_14,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305220173
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a DPU INTF op to set DATA_COMPRESS register if the
DPU_INTF_DATA_COMPRESS feature is enabled. This bit needs to be set in
order for DSC v1.2 to work.

Note: For now, this op is called for command mode encoders only. Changes to
set DATA_COMPRESS for video mode encoders will be posted along with DSC
v1.2 support for DP.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  3 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 13 +++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          |  2 ++
 3 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index d8ed85a238af..1a4c20f02312 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -68,6 +68,9 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
 				phys_enc->hw_intf,
 				true,
 				phys_enc->hw_pp->idx);
+
+	if (phys_enc->hw_intf->ops.enable_compression)
+		phys_enc->hw_intf->ops.enable_compression(phys_enc->hw_intf);
 }
 
 static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 6485500eedb8..a462c6780e6e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -91,6 +91,7 @@
 
 #define INTF_CFG2_DATABUS_WIDEN	BIT(0)
 #define INTF_CFG2_DATA_HCTL_EN	BIT(4)
+#define INTF_CFG2_DCE_DATA_COMPRESS     BIT(12)
 
 static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 		const struct intf_timing_params *p,
@@ -522,6 +523,15 @@ static void dpu_hw_intf_disable_autorefresh(struct dpu_hw_intf *intf,
 
 }
 
+static void dpu_hw_intf_enable_compression(struct dpu_hw_intf *ctx)
+{
+	u32 intf_cfg2 = DPU_REG_READ(&ctx->hw, INTF_CONFIG2);
+
+	intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
+
+	DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2);
+}
+
 static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
 		unsigned long cap)
 {
@@ -542,6 +552,9 @@ static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
 		ops->vsync_sel = dpu_hw_intf_vsync_sel;
 		ops->disable_autorefresh = dpu_hw_intf_disable_autorefresh;
 	}
+
+	if (cap & BIT(DPU_INTF_DATA_COMPRESS))
+		ops->enable_compression = dpu_hw_intf_enable_compression;
 }
 
 struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 73b0885918f8..72fe907729f1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -70,6 +70,7 @@ struct intf_status {
  * @get_autorefresh:            Retrieve autorefresh config from hardware
  *                              Return: 0 on success, -ETIMEDOUT on timeout
  * @vsync_sel:                  Select vsync signal for tear-effect configuration
+ * @enable_compression:         Enable data compression
  */
 struct dpu_hw_intf_ops {
 	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
@@ -107,6 +108,7 @@ struct dpu_hw_intf_ops {
 	 * Disable autorefresh if enabled
 	 */
 	void (*disable_autorefresh)(struct dpu_hw_intf *intf, uint32_t encoder_id, u16 vdisplay);
+	void (*enable_compression)(struct dpu_hw_intf *intf);
 };
 
 struct dpu_hw_intf {

-- 
2.40.1

