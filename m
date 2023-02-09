Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D02691087
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 19:45:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3373C10E275;
	Thu,  9 Feb 2023 18:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0852610E275;
 Thu,  9 Feb 2023 18:44:57 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 319E5Z4c002746; Thu, 9 Feb 2023 18:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=dWTQC1ZAQn5kRIKTN57Ctf5z2ElAH7znQrSthfZZGNY=;
 b=Mkr59b2JNHQ2lPUVzhI3pmui2RRDEA6jRzW4XO/4jRtvh9GX5XBjUKdmXlIUco8+u9qg
 e2/UNcW9nmVi7AkZVUIYXikPNc1WP2/NLzzY+pRYWCHjEg5QwGJ2rDuVYUflNnm7Xgio
 EEi4s4VvN98134SXxik+BHgvsfy3mxTYQy+15L7mbKt8wCBA7MhZrUJQ40M0iuMqW7Jy
 app53yopqMea8gC1nSqeSaIi+7tOQI1zVg6U5CFCZ4VoQs7zpkes4bFtRF2ce/GbSlES
 Fkg7TtRDTsIdnfnNT2sPyLH/LhP0h+RxjawLo5uBmHvib64TuH4JfSN8OcsyvXvMYAUg 0Q== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nmb8juy47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 18:44:54 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 319IirUK028218
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 9 Feb 2023 18:44:53 GMT
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 9 Feb 2023 10:44:53 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [RFC PATCH v2 1/4] drm/msm/dpu: Move TE setup to prepare_for_kickoff()
Date: Thu, 9 Feb 2023 10:44:23 -0800
Message-ID: <20230209184426.4437-2-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209184426.4437-1-quic_jesszhan@quicinc.com>
References: <20230209184426.4437-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: vAXNSdLkgGoirMop4GzYIXooxVf44ZPg
X-Proofpoint-GUID: vAXNSdLkgGoirMop4GzYIXooxVf44ZPg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_15,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302090176
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
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 marijn.suijten@somainline.org, dmitry.baryshkov@linaro.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, DPU will enable TE during prepare_commit(). However, this
will cause issues when trying to read/write to register in
get_autorefresh_config(), because the core clock rates aren't set at
that time.

This used to work because phys_enc->hw_pp is only initialized in mode
set [1], so the first prepare_commit() will return before any register
read/write as hw_pp would be NULL.

However, when we try to implement support for INTF TE, we will run into
the clock issue described above as hw_intf will *not* be NULL on the
first prepare_commit(). This is because the initialization of
dpu_enc->hw_intf has been moved to dpu_encoder_setup() [2].

To avoid this issue, let's enable TE during prepare_for_kickoff()
instead as the core clock rates are guaranteed to be set then.

Depends on: "Implement tearcheck support on INTF block" [3]

[1] https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L1109
[2] https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L2339
[3] https://patchwork.freedesktop.org/series/112332/

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 78 ++++++++++---------
 1 file changed, 43 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index cb05036f2916..561406d92a1a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -583,39 +583,6 @@ static void dpu_encoder_phys_cmd_destroy(struct dpu_encoder_phys *phys_enc)
 	kfree(cmd_enc);
 }
 
-static void dpu_encoder_phys_cmd_prepare_for_kickoff(
-		struct dpu_encoder_phys *phys_enc)
-{
-	struct dpu_encoder_phys_cmd *cmd_enc =
-			to_dpu_encoder_phys_cmd(phys_enc);
-	int ret;
-
-	if (!phys_enc->hw_pp) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	}
-	DRM_DEBUG_KMS("id:%u pp:%d pending_cnt:%d\n", DRMID(phys_enc->parent),
-		      phys_enc->hw_pp->idx - PINGPONG_0,
-		      atomic_read(&phys_enc->pending_kickoff_cnt));
-
-	/*
-	 * Mark kickoff request as outstanding. If there are more than one,
-	 * outstanding, then we have to wait for the previous one to complete
-	 */
-	ret = _dpu_encoder_phys_cmd_wait_for_idle(phys_enc);
-	if (ret) {
-		/* force pending_kickoff_cnt 0 to discard failed kickoff */
-		atomic_set(&phys_enc->pending_kickoff_cnt, 0);
-		DRM_ERROR("failed wait_for_idle: id:%u ret:%d pp:%d\n",
-			  DRMID(phys_enc->parent), ret,
-			  phys_enc->hw_pp->idx - PINGPONG_0);
-	}
-
-	DPU_DEBUG_CMDENC(cmd_enc, "pp:%d pending_cnt %d\n",
-			phys_enc->hw_pp->idx - PINGPONG_0,
-			atomic_read(&phys_enc->pending_kickoff_cnt));
-}
-
 static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -641,8 +608,7 @@ static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
 	return false;
 }
 
-static void dpu_encoder_phys_cmd_prepare_commit(
-		struct dpu_encoder_phys *phys_enc)
+static void dpu_encoder_phys_cmd_enable_te(struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_encoder_phys_cmd *cmd_enc =
 		to_dpu_encoder_phys_cmd(phys_enc);
@@ -700,6 +666,48 @@ static void dpu_encoder_phys_cmd_prepare_commit(
 			 "disabled autorefresh\n");
 }
 
+static void dpu_encoder_phys_cmd_prepare_for_kickoff(
+		struct dpu_encoder_phys *phys_enc)
+{
+	struct dpu_encoder_phys_cmd *cmd_enc =
+			to_dpu_encoder_phys_cmd(phys_enc);
+	int ret;
+
+	if (!phys_enc->hw_pp) {
+		DPU_ERROR("invalid encoder\n");
+		return;
+	}
+
+
+	DRM_DEBUG_KMS("id:%u pp:%d pending_cnt:%d\n", DRMID(phys_enc->parent),
+		      phys_enc->hw_pp->idx - PINGPONG_0,
+		      atomic_read(&phys_enc->pending_kickoff_cnt));
+
+	/*
+	 * Mark kickoff request as outstanding. If there are more than one,
+	 * outstanding, then we have to wait for the previous one to complete
+	 */
+	ret = _dpu_encoder_phys_cmd_wait_for_idle(phys_enc);
+	if (ret) {
+		/* force pending_kickoff_cnt 0 to discard failed kickoff */
+		atomic_set(&phys_enc->pending_kickoff_cnt, 0);
+		DRM_ERROR("failed wait_for_idle: id:%u ret:%d pp:%d\n",
+			  DRMID(phys_enc->parent), ret,
+			  phys_enc->hw_pp->idx - PINGPONG_0);
+	}
+
+	dpu_encoder_phys_cmd_enable_te(phys_enc);
+
+	DPU_DEBUG_CMDENC(cmd_enc, "pp:%d pending_cnt %d\n",
+			phys_enc->hw_pp->idx - PINGPONG_0,
+			atomic_read(&phys_enc->pending_kickoff_cnt));
+}
+
+static void dpu_encoder_phys_cmd_prepare_commit(
+		struct dpu_encoder_phys *phys_enc)
+{
+}
+
 static int _dpu_encoder_phys_cmd_wait_for_ctl_start(
 		struct dpu_encoder_phys *phys_enc)
 {
-- 
2.39.1

