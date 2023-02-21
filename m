Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0378D69E7C0
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 19:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C74A10E33E;
	Tue, 21 Feb 2023 18:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0496410E15D;
 Tue, 21 Feb 2023 18:43:20 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31LI9N0T006794; Tue, 21 Feb 2023 18:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=Dm3k1FRHqY4zWpvLaQyKp11Li7njpYkPisuj9g+pO24=;
 b=HX3MfquCVQ6zEdad5iDt5uwP5xw66Nu1J0x4xAJlHWGH9PhFnK11rzHkRODvVdbv1Xpw
 hnSkFeDEReCFgpXtbJGgoI+AURb78jqyX52CIE/YUB7GE2ViMbC5/zuOCnFRE9829LxY
 60F2FRuYin3h/bSdf+o0ZapO9eT3pYl0zj9zPfTRYue4dwIH+aLnXwm8BI3z0xvWWhzr
 DQkmKShFH1haKxlR92ZwFWU1OLFkStZeuah/7OKbP4kPWfpgYO/WZMpKg6aCxZw4JOcT
 ldI8waRm1t1lWmv18YMbOlJ8NjM+mXNcv0faD27DYlhujf+0KKbjQ8EicMK3Uda/dnAm Cg== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ntpw9rcvh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Feb 2023 18:43:18 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31LIhHWZ016174
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Feb 2023 18:43:17 GMT
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Tue, 21 Feb 2023 10:43:17 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v4 1/4] drm/msm/dpu: Move TE setup to prepare_for_kickoff()
Date: Tue, 21 Feb 2023 10:42:53 -0800
Message-ID: <20230221184256.1436-2-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221184256.1436-1-quic_jesszhan@quicinc.com>
References: <20230221184256.1436-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: F01eKfLBWpH8jbcmhP7Z13H_oUJfvuAO
X-Proofpoint-GUID: F01eKfLBWpH8jbcmhP7Z13H_oUJfvuAO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_11,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302210159
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
will cause a crash and reboot to sahara when trying to read/write to
register in get_autorefresh_config(), because the core clock rates
aren't set at that time.

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

Changes in V3:
- Added function prototypes
- Reordered function definitions to make change more legible
- Removed prepare_commit() function from dpu_encoder_phys_cmd

Changes in V4:
- Reworded commit message to be more specific
- Removed dpu_encoder_phys_cmd_is_ongoing_pptx() prototype

[1] https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L1109
[2] https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L2339
[3] https://patchwork.freedesktop.org/series/112332/

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index cb05036f2916..98958c75864a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -40,6 +40,8 @@
 
 #define DPU_ENC_MAX_POLL_TIMEOUT_US	2000
 
+static void dpu_encoder_phys_cmd_enable_te(struct dpu_encoder_phys *phys_enc);
+
 static bool dpu_encoder_phys_cmd_is_master(struct dpu_encoder_phys *phys_enc)
 {
 	return (phys_enc->split_role != ENC_ROLE_SLAVE);
@@ -611,6 +613,8 @@ static void dpu_encoder_phys_cmd_prepare_for_kickoff(
 			  phys_enc->hw_pp->idx - PINGPONG_0);
 	}
 
+	dpu_encoder_phys_cmd_enable_te(phys_enc);
+
 	DPU_DEBUG_CMDENC(cmd_enc, "pp:%d pending_cnt %d\n",
 			phys_enc->hw_pp->idx - PINGPONG_0,
 			atomic_read(&phys_enc->pending_kickoff_cnt));
@@ -641,8 +645,7 @@ static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
 	return false;
 }
 
-static void dpu_encoder_phys_cmd_prepare_commit(
-		struct dpu_encoder_phys *phys_enc)
+static void dpu_encoder_phys_cmd_enable_te(struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_encoder_phys_cmd *cmd_enc =
 		to_dpu_encoder_phys_cmd(phys_enc);
@@ -799,7 +802,6 @@ static void dpu_encoder_phys_cmd_trigger_start(
 static void dpu_encoder_phys_cmd_init_ops(
 		struct dpu_encoder_phys_ops *ops)
 {
-	ops->prepare_commit = dpu_encoder_phys_cmd_prepare_commit;
 	ops->is_master = dpu_encoder_phys_cmd_is_master;
 	ops->atomic_mode_set = dpu_encoder_phys_cmd_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_cmd_enable;
-- 
2.39.2

