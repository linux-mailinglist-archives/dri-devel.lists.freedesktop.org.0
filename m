Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6684A812034
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 21:52:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39ED10E828;
	Wed, 13 Dec 2023 20:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3CE10E82F;
 Wed, 13 Dec 2023 20:51:55 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BDJCC6i021782; Wed, 13 Dec 2023 20:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=qcppdkim1; bh=WexptdYsrcF9TuG7Cwu3QV5UxBWgin8LZ431/UxzycE
 =; b=BzWrHLUmXcFRjgm9SyDmAg6j+/avLa9cvnqdQuFf1Btw74/MIShzvT7X1Xy
 +Pq9ds++4O7nRQl8A87+Ui2vcgCq81Nk1/6nRMnJ97Tn1mf+q/UXv4XLzvHxh9QQ
 0qr+KcyL2pWJMm+jFvMTBgxL4Yio96nRhF7xl58dXhSpEPVQzKM2a5Ys419r0kpr
 33ET2OaS1EpeGWmmcFvoKx9oIYvrG3Bz8kSUEmwr6I5alVODr1RORE4EfQ4fV9PF
 q926l+LOweZMfucYZsKHkU4DavClcuFJpM7q0hkwQcFBlw8u7y0uV2mgNvM3l3i2
 bOM7kuh8sMyPQ1VnrcBzeoDRLzw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uy4kjjbrw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 20:51:53 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BDKpqsM021832
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 20:51:52 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 13 Dec 2023 12:51:51 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 13 Dec 2023 12:51:27 -0800
Subject: [PATCH v2 1/2] drm/msm/dpu: Set input_sel bit for INTF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231213-encoder-fixup-v2-1-b11a4ad35e5e@quicinc.com>
References: <20231213-encoder-fixup-v2-0-b11a4ad35e5e@quicinc.com>
In-Reply-To: <20231213-encoder-fixup-v2-0-b11a4ad35e5e@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-53db1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702500711; l=3508;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=QGjTUNvTz0uEpTC7Qq1ojR1ZECUVsiYc8/OVHbzHCAQ=;
 b=fGZsHBYFyWRcjHDsOuu5X2cJ61lDiwly3LnexheeQ8ckJKcn3niUreEkqFSPfpTw9MhpLs7sp
 3+poyqLq1r4CfV9ILc1FJKcQfXY6aons3kAAN63udnm1YRqNIlLQo/e
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Jtwf1BHKCvtU5linyQG1ZSGymbqc8IEL
X-Proofpoint-ORIG-GUID: Jtwf1BHKCvtU5linyQG1ZSGymbqc8IEL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130147
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

Set the input_sel bit for encoders as it was missed in the initial
implementation.

Reported-by: Rob Clark <robdclark@gmail.com>
Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/39
Fixes: 91143873a05d ("drm/msm/dpu: Add MISR register support for interface")
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 10 ++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  3 ++-
 4 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 0b6a0a7dcc39..226133af7840 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -322,7 +322,7 @@ static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
 
 static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf, bool enable, u32 frame_count)
 {
-	dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, enable, frame_count);
+	dpu_hw_setup_misr(&intf->hw, INTF_MISR_CTRL, enable, frame_count, 0x1);
 }
 
 static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 *misr_value)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 25af52ab602f..bbc9756ecde9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -85,7 +85,7 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
 
 static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx, bool enable, u32 frame_count)
 {
-	dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, enable, frame_count);
+	dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, enable, frame_count, 0x0);
 }
 
 static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index 0b05061e3e62..87716a60332e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -477,7 +477,8 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
 
 void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
 		u32 misr_ctrl_offset,
-		bool enable, u32 frame_count)
+		bool enable, u32 frame_count,
+		u32 input_sel)
 {
 	u32 config = 0;
 
@@ -487,8 +488,13 @@ void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
 	wmb();
 
 	if (enable) {
+		/*
+		 * note: Aside from encoders, input_sel should be
+		 * set to 0x0 by default
+		 */
 		config = (frame_count & MISR_FRAME_COUNT_MASK) |
-			MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK;
+			MISR_CTRL_ENABLE | MISR_CTRL_FREE_RUN_MASK |
+			((input_sel & 0xF) << 24);
 
 		DPU_REG_WRITE(c, misr_ctrl_offset, config);
 	} else {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index fe083b2e5696..761056be272b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -357,7 +357,8 @@ void _dpu_hw_setup_qos_lut(struct dpu_hw_blk_reg_map *c, u32 offset,
 void dpu_hw_setup_misr(struct dpu_hw_blk_reg_map *c,
 		u32 misr_ctrl_offset,
 		bool enable,
-		u32 frame_count);
+		u32 frame_count,
+		u32 input_sel);
 
 int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
 		u32 misr_ctrl_offset,

-- 
2.43.0

