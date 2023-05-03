Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAF76F4E7C
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 03:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C1110E190;
	Wed,  3 May 2023 01:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952C410E181;
 Wed,  3 May 2023 01:19:40 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 342Nr23H011168; Wed, 3 May 2023 01:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=Dlmi8ttPHa718tsyDxsZ9LTXyy4isTwomG9XccKgjh4=;
 b=a0EF+q6ghnEW2wqzDOk74pvUJ+yyf67C0aOITj9PNvuqWEPHrbDXYl09S+7YTVlFVJTd
 Nq49EGESycgawNWrPYEC+x9h0HVM/68WUjRkmv2FSdgFESC2/gajTY5ANa+G6ZPgkOYB
 v3aomaf8l9GnzcnYQQJ4NjC66FnOMWT6F7cE2bo/vod/zJcRjOPNbskMKNYQFdf5BLh6
 Rtvwq2HhVDCz45nbSlKZJ+sFmW4navSyoevfXR2aydu6fnQb61mxBdKNzdmGmTdas55h
 xvKSMUWS5nyq3Xzu2rGCEUqBuqeltbqrQG1dCHX8KxAoVIKn56o4ouNRQb+DsaPO4it7 uA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qawcba8tp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 01:19:38 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3431Jb2w031354
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 May 2023 01:19:37 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 2 May 2023 18:19:37 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 2 May 2023 18:19:15 -0700
Subject: [PATCH 4/4] drm/msm/dpu: Enable compression for command mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230405-add-dsc-support-v1-4-6bc6f03ae735@quicinc.com>
References: <20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com>
In-Reply-To: <20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683076776; l=3059;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=1DC1vTomN+IXwi1E2dJXxXSzLYYrRpXHpSX0sGbldnM=;
 b=Axt9D/WCcOGuDEy3U0pLwgGzdTpCAa7OSRnnksppvSDf6HxuC2AWQOCffZBtJc0sUgWadZbHH
 ym/MK2rPNYUBfWgTfRpnKFXcqSdHXjY0MO+gS7I81XLdBhUznDiBstN
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Id7_C3Ad-e5NQfNqn12_x1B9fTFvyWY-
X-Proofpoint-ORIG-GUID: Id7_C3Ad-e5NQfNqn12_x1B9fTFvyWY-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_14,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=893 impostorscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305030009
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

Add a dpu_hw_intf op to enable data compression.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 7 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 2 ++
 3 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 74470d068622..4321a1aba17f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -72,6 +72,10 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
 				phys_enc->hw_intf,
 				true,
 				phys_enc->hw_pp->idx);
+
+	if (phys_enc->dpu_kms->catalog->caps->has_data_compress &&
+			phys_enc->hw_intf->ops.enable_compression)
+		phys_enc->hw_intf->ops.enable_compression(phys_enc->hw_intf);
 }
 
 static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 671048a78801..4ce7ffdd7a05 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -64,10 +64,16 @@
 
 #define INTF_CFG2_DATABUS_WIDEN	BIT(0)
 #define INTF_CFG2_DATA_HCTL_EN	BIT(4)
+#define INTF_CFG2_DCE_DATA_COMPRESS	BIT(12)
 
 #define INTF_MISR_CTRL			0x180
 #define INTF_MISR_SIGNATURE		0x184
 
+static inline void dpu_hw_intf_enable_compression(struct dpu_hw_intf *ctx)
+{
+	DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, INTF_CFG2_DCE_DATA_COMPRESS);
+}
+
 static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 		const struct intf_timing_params *p,
 		const struct dpu_format *fmt)
@@ -325,6 +331,7 @@ static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
 		ops->bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
 	ops->setup_misr = dpu_hw_intf_setup_misr;
 	ops->collect_misr = dpu_hw_intf_collect_misr;
+	ops->enable_compression = dpu_hw_intf_enable_compression;
 }
 
 struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 102c4f0e812b..99528c735368 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -60,6 +60,7 @@ struct intf_status {
  *                     feed pixels to this interface
  * @setup_misr: enable/disable MISR
  * @collect_misr: read MISR signature
+ * @enable_compression: Enable data compression
  */
 struct dpu_hw_intf_ops {
 	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
@@ -82,6 +83,7 @@ struct dpu_hw_intf_ops {
 			const enum dpu_pingpong pp);
 	void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32 frame_count);
 	int (*collect_misr)(struct dpu_hw_intf *intf, u32 *misr_value);
+	void (*enable_compression)(struct dpu_hw_intf *intf);
 };
 
 struct dpu_hw_intf {

-- 
2.40.1

