Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BDD80FB13
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 00:11:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB01310E0DF;
	Tue, 12 Dec 2023 23:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E722710E0D4;
 Tue, 12 Dec 2023 23:11:17 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BCMbDsR029500; Tue, 12 Dec 2023 23:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=E6m17XM6rzh9JSS4LpbxsZmohNAB+cKdD2v5ZfA43GI=; b=G0
 osZGtxM6vE4e4BZWB6qZiO5yvFRsBS7u/OZXjLqeS4UChVAjzQv1HkWLZxoEohxN
 y3DV4fzq3vGxrZ1HfZNoxgyD3VMQdZSsXAElZlJV3C+bCNq5OO8hMXMac8nJCWXa
 YhPwL1fzNoAIIRvy3GWmK4Ld7MO21EImD/wJwS96lejF+L20sgpYUhv4wHvRKqS8
 Np9FIJDSxzv4jL2RVbp7uZR6z4pEQ9kqnJX2MqU+9/NzBCH1q8KEf0Ws455R5fRb
 yFF3jwliKxhLT4XSMG/ZXMQLniTD94AJ/JbLC1EBVMkXPx6Ungnh9pvaaLKIJMdl
 D6udCZ2+RFdzlBpBDnyg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uxnf71q11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 23:11:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BCNBDPj031428
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 23:11:13 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 12 Dec 2023 15:11:13 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v4 1/1] drm/msm/dpu: Add mutex lock in control vblank irq
Date: Tue, 12 Dec 2023 15:10:58 -0800
Message-ID: <20231212231101.9240-2-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212231101.9240-1-quic_parellan@quicinc.com>
References: <20231212231101.9240-1-quic_parellan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: mOGE4QOG-W7c0txvti90bsruVmlpURiE
X-Proofpoint-GUID: mOGE4QOG-W7c0txvti90bsruVmlpURiE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312120181
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
Cc: marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, quic_bjorande@quicinc.com, seanpaul@chromium.org,
 steev@kali.org, quic_jesszhan@quicinc.com, dmitry.baryshkov@linaro.org,
 Paloma Arellano <quic_parellan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a mutex lock to control vblank irq to synchronize vblank
enable/disable operations happening from different threads to prevent
race conditions while registering/unregistering the vblank irq callback.

v4: -Removed vblank_ctl_lock from dpu_encoder_virt, so it is only a
    parameter of dpu_encoder_phys.
    -Switch from atomic refcnt to a simple int counter as mutex has
    now been added
v3: Mistakenly did not change wording in last version. It is done now.
v2: Slightly changed wording of commit message

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  1 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 ++-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 32 ++++++++++++------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 33 ++++++++++++-------
 4 files changed, 47 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1cf7ff6caff4e..73bd4c086a46f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2497,7 +2497,6 @@ void dpu_encoder_phys_init(struct dpu_encoder_phys *phys_enc,
 	phys_enc->enc_spinlock = p->enc_spinlock;
 	phys_enc->enable_state = DPU_ENC_DISABLED;
 
-	atomic_set(&phys_enc->vblank_refcount, 0);
 	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
 	atomic_set(&phys_enc->pending_ctlstart_cnt, 0);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 6f04c3d56e77c..96bda57b69596 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -155,6 +155,7 @@ enum dpu_intr_idx {
  * @hw_wb:		Hardware interface to the wb registers
  * @dpu_kms:		Pointer to the dpu_kms top level
  * @cached_mode:	DRM mode cached at mode_set time, acted on in enable
+ * @vblank_ctl_lock:	Vblank ctl mutex lock to protect vblank_refcount
  * @enabled:		Whether the encoder has enabled and running a mode
  * @split_role:		Role to play in a split-panel configuration
  * @intf_mode:		Interface mode
@@ -183,11 +184,12 @@ struct dpu_encoder_phys {
 	struct dpu_hw_wb *hw_wb;
 	struct dpu_kms *dpu_kms;
 	struct drm_display_mode cached_mode;
+	struct mutex vblank_ctl_lock;
 	enum dpu_enc_split_role split_role;
 	enum dpu_intf_mode intf_mode;
 	spinlock_t *enc_spinlock;
 	enum dpu_enc_enable_state enable_state;
-	atomic_t vblank_refcount;
+	int vblank_refcount;
 	atomic_t vsync_cnt;
 	atomic_t underrun_cnt;
 	atomic_t pending_ctlstart_cnt;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index be185fe69793b..2d788c5e26a83 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -244,7 +244,8 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
 		return -EINVAL;
 	}
 
-	refcount = atomic_read(&phys_enc->vblank_refcount);
+	mutex_lock(&phys_enc->vblank_ctl_lock);
+	refcount = phys_enc->vblank_refcount;
 
 	/* Slave encoders don't report vblank */
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
@@ -260,16 +261,24 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
 		      phys_enc->hw_pp->idx - PINGPONG_0,
 		      enable ? "true" : "false", refcount);
 
-	if (enable && atomic_inc_return(&phys_enc->vblank_refcount) == 1)
-		ret = dpu_core_irq_register_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_RDPTR],
-				dpu_encoder_phys_cmd_te_rd_ptr_irq,
-				phys_enc);
-	else if (!enable && atomic_dec_return(&phys_enc->vblank_refcount) == 0)
-		ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_RDPTR]);
+	if (enable) {
+		if (phys_enc->vblank_refcount == 0)
+			ret = dpu_core_irq_register_callback(phys_enc->dpu_kms,
+					phys_enc->irq[INTR_IDX_RDPTR],
+					dpu_encoder_phys_cmd_te_rd_ptr_irq,
+					phys_enc);
+		if (!ret)
+			phys_enc->vblank_refcount++;
+	} else if (!enable) {
+		if (phys_enc->vblank_refcount == 1)
+			ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
+					phys_enc->irq[INTR_IDX_RDPTR]);
+		if (!ret)
+			phys_enc->vblank_refcount--;
+	}
 
 end:
+	mutex_unlock(&phys_enc->vblank_ctl_lock);
 	if (ret) {
 		DRM_ERROR("vblank irq err id:%u pp:%d ret:%d, enable %s/%d\n",
 			  DRMID(phys_enc->parent),
@@ -285,7 +294,7 @@ static void dpu_encoder_phys_cmd_irq_control(struct dpu_encoder_phys *phys_enc,
 {
 	trace_dpu_enc_phys_cmd_irq_ctrl(DRMID(phys_enc->parent),
 			phys_enc->hw_pp->idx - PINGPONG_0,
-			enable, atomic_read(&phys_enc->vblank_refcount));
+			enable, phys_enc->vblank_refcount);
 
 	if (enable) {
 		dpu_core_irq_register_callback(phys_enc->dpu_kms,
@@ -763,6 +772,9 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 
 	dpu_encoder_phys_init(phys_enc, p);
 
+	mutex_init(&phys_enc->vblank_ctl_lock);
+	phys_enc->vblank_refcount = 0;
+
 	dpu_encoder_phys_cmd_init_ops(&phys_enc->ops);
 	phys_enc->intf_mode = INTF_MODE_CMD;
 	cmd_enc->stream_sel = 0;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index a01fda7118835..eeb0acf9665e8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -364,7 +364,8 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
 	int ret = 0;
 	int refcount;
 
-	refcount = atomic_read(&phys_enc->vblank_refcount);
+	mutex_lock(&phys_enc->vblank_ctl_lock);
+	refcount = phys_enc->vblank_refcount;
 
 	/* Slave encoders don't report vblank */
 	if (!dpu_encoder_phys_vid_is_master(phys_enc))
@@ -377,18 +378,26 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
 	}
 
 	DRM_DEBUG_VBL("id:%u enable=%d/%d\n", DRMID(phys_enc->parent), enable,
-		      atomic_read(&phys_enc->vblank_refcount));
+		      refcount);
 
-	if (enable && atomic_inc_return(&phys_enc->vblank_refcount) == 1)
-		ret = dpu_core_irq_register_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_VSYNC],
-				dpu_encoder_phys_vid_vblank_irq,
-				phys_enc);
-	else if (!enable && atomic_dec_return(&phys_enc->vblank_refcount) == 0)
-		ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_VSYNC]);
+	if (enable) {
+		if (phys_enc->vblank_refcount == 0)
+			ret = dpu_core_irq_register_callback(phys_enc->dpu_kms,
+					phys_enc->irq[INTR_IDX_VSYNC],
+					dpu_encoder_phys_vid_vblank_irq,
+					phys_enc);
+		if (!ret)
+			phys_enc->vblank_refcount++;
+	} else if (!enable) {
+		if (phys_enc->vblank_refcount == 1)
+			ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
+					phys_enc->irq[INTR_IDX_VSYNC]);
+		if (!ret)
+			phys_enc->vblank_refcount--;
+	}
 
 end:
+	mutex_unlock(&phys_enc->vblank_ctl_lock);
 	if (ret) {
 		DRM_ERROR("failed: id:%u intf:%d ret:%d enable:%d refcnt:%d\n",
 			  DRMID(phys_enc->parent),
@@ -618,7 +627,7 @@ static void dpu_encoder_phys_vid_irq_control(struct dpu_encoder_phys *phys_enc,
 	trace_dpu_enc_phys_vid_irq_ctrl(DRMID(phys_enc->parent),
 			    phys_enc->hw_intf->idx - INTF_0,
 			    enable,
-			    atomic_read(&phys_enc->vblank_refcount));
+			   phys_enc->vblank_refcount);
 
 	if (enable) {
 		ret = dpu_encoder_phys_vid_control_vblank_irq(phys_enc, true);
@@ -713,6 +722,8 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
 	DPU_DEBUG_VIDENC(phys_enc, "\n");
 
 	dpu_encoder_phys_init(phys_enc, p);
+	mutex_init(&phys_enc->vblank_ctl_lock);
+	phys_enc->vblank_refcount = 0;
 
 	dpu_encoder_phys_vid_init_ops(&phys_enc->ops);
 	phys_enc->intf_mode = INTF_MODE_VIDEO;
-- 
2.39.2

