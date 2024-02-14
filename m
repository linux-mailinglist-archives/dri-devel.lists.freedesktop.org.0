Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6F585515F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 19:04:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78C810E926;
	Wed, 14 Feb 2024 18:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ePJ7VR9l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 810EF10E861;
 Wed, 14 Feb 2024 18:04:18 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41EHdYAk007498; Wed, 14 Feb 2024 18:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=d6mgIKOVGge+IcRr3W9nSAY1tAEM0Jbh2UNineQFnj0=; b=eP
 J7VR9l2pVA/OmEmTsOrbOeZFhnPPG3Twqwkm/Lt1KJZfPN3uE2A+HUrnALsWTh40
 GWObrskCJWPzTPnwkqrB+Ueaj9TFrDnIicHdDJuvaFZqw43yp6hI3y72+n2ToCi8
 fOK67V3OQum8aLy6woPppkXuS0+Y6uu6JrcS152UadKO43kpc01btcgpDy2z36Eg
 gGkuru2S7tEIqM4dRxk4dbJ+t+pXlh+aTPD2TKLbx5+3eamjl2T7T4hbbwHYEemc
 uRkAX/2GdMDqtuwtJ3zGdmaI16ntvR9UY0rr3cn9LaRUwk05XqVUDB1FW4lkYQ88
 koMjG6UjaJ1iODymuMyg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w8ennabut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Feb 2024 18:04:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41EI4EFQ009382
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Feb 2024 18:04:14 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 14 Feb 2024 10:04:13 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Kuogee Hsieh <quic_khsieh@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
 <quic_jesszhan@quicinc.com>, <marijn.suijten@somainline.org>,
 <neil.armstrong@linaro.org>, Paloma Arellano <quic_parellan@quicinc.com>
Subject: [PATCH v3 14/19] drm/msm/dpu: add support of new peripheral flush
 mechanism
Date: Wed, 14 Feb 2024 10:03:36 -0800
Message-ID: <20240214180347.1399-15-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240214180347.1399-1-quic_parellan@quicinc.com>
References: <20240214180347.1399-1-quic_parellan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: fjcHkEreplMZEkvbZmjzqQc6WBGhK-BK
X-Proofpoint-ORIG-GUID: fjcHkEreplMZEkvbZmjzqQc6WBGhK-BK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_10,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=298
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402140141
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

From: Kuogee Hsieh <quic_khsieh@quicinc.com>

Introduce a peripheral flushing mechanism to decouple peripheral
metadata flushing from timing engine related flush.

Changes in v2:
	- Fixed some misalignment issues

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 17 +++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h | 10 ++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index e76565c3e6a43..a06f69d0b257d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -39,6 +39,7 @@
 #define   CTL_WB_FLUSH                  0x108
 #define   CTL_INTF_FLUSH                0x110
 #define   CTL_CDM_FLUSH                0x114
+#define   CTL_PERIPH_FLUSH              0x128
 #define   CTL_INTF_MASTER               0x134
 #define   CTL_DSPP_n_FLUSH(n)           ((0x13C) + ((n) * 4))
 
@@ -49,6 +50,7 @@
 #define  MERGE_3D_IDX   23
 #define  DSC_IDX        22
 #define CDM_IDX         26
+#define  PERIPH_IDX     30
 #define  INTF_IDX       31
 #define WB_IDX          16
 #define  DSPP_IDX       29  /* From DPU hw rev 7.x.x */
@@ -151,6 +153,10 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
 				ctx->pending_dspp_flush_mask[dspp - DSPP_0]);
 		}
 
+	if (ctx->pending_flush_mask & BIT(PERIPH_IDX))
+		DPU_REG_WRITE(&ctx->hw, CTL_PERIPH_FLUSH,
+			      ctx->pending_periph_flush_mask);
+
 	if (ctx->pending_flush_mask & BIT(DSC_IDX))
 		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH,
 			      ctx->pending_dsc_flush_mask);
@@ -311,6 +317,13 @@ static void dpu_hw_ctl_update_pending_flush_intf_v1(struct dpu_hw_ctl *ctx,
 	ctx->pending_flush_mask |= BIT(INTF_IDX);
 }
 
+static void dpu_hw_ctl_update_pending_flush_periph_v1(struct dpu_hw_ctl *ctx,
+						      enum dpu_intf intf)
+{
+	ctx->pending_periph_flush_mask |= BIT(intf - INTF_0);
+	ctx->pending_flush_mask |= BIT(PERIPH_IDX);
+}
+
 static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
 		enum dpu_merge_3d merge_3d)
 {
@@ -680,6 +693,10 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 		ops->reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
 		ops->update_pending_flush_intf =
 			dpu_hw_ctl_update_pending_flush_intf_v1;
+
+		ops->update_pending_flush_periph =
+			dpu_hw_ctl_update_pending_flush_periph_v1;
+
 		ops->update_pending_flush_merge_3d =
 			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
 		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index ff85b5ee0acf8..ef56280bea932 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -122,6 +122,15 @@ struct dpu_hw_ctl_ops {
 	void (*update_pending_flush_intf)(struct dpu_hw_ctl *ctx,
 		enum dpu_intf blk);
 
+	/**
+	 * OR in the given flushbits to the cached pending_(periph_)flush_mask
+	 * No effect on hardware
+	 * @ctx       : ctl path ctx pointer
+	 * @blk       : interface block index
+	 */
+	void (*update_pending_flush_periph)(struct dpu_hw_ctl *ctx,
+					    enum dpu_intf blk);
+
 	/**
 	 * OR in the given flushbits to the cached pending_(merge_3d_)flush_mask
 	 * No effect on hardware
@@ -264,6 +273,7 @@ struct dpu_hw_ctl {
 	u32 pending_flush_mask;
 	u32 pending_intf_flush_mask;
 	u32 pending_wb_flush_mask;
+	u32 pending_periph_flush_mask;
 	u32 pending_merge_3d_flush_mask;
 	u32 pending_dspp_flush_mask[DSPP_MAX - DSPP_0];
 	u32 pending_dsc_flush_mask;
-- 
2.39.2

