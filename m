Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F0CA4CAF8
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 19:28:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DFE10E0D1;
	Mon,  3 Mar 2025 18:28:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="nYlOwgyz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F8C10E0D1;
 Mon,  3 Mar 2025 18:28:09 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523B17Gj000958;
 Mon, 3 Mar 2025 18:28:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=mWBUAND2jMvUI68h8cXcib
 OJmnxxc14QYWwE2utG2JY=; b=nYlOwgyzzHZtx2jIzlcHfITsArrrGWfN3kDJ2t
 WPoxeyXkl8TQ4gaHhdYOewV0ch/S3a69vGHk92R2uuZG/zLhBGV6WliQX9wPFljE
 tFAhwVrzeCKZVXHkVudlDEPc4sFQo0Yj4Yx+EzR5+7a5JUaWnGwHTHjVbPOOS7bW
 5j2Sqt7/0VTCN6dk8Ojf7QsxwNd4wqTwwubm2XCuNUyWAdj4ONqH/MpraW7+iLeB
 2DjUtvSDSJf/ioqM14KVYCY2u5jLbX4cQLi4tnuwRO80EVH1PmzJZMmqSAfMWA2L
 4Lo9zb6FyFjYQ2J9GgGv4bjxwxar1XyVH/IGDkd5Fd972Z7Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453t95wsva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Mar 2025 18:28:07 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 523IS6EM006933
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 3 Mar 2025 18:28:06 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Mar 2025 10:28:05 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Mon, 3 Mar 2025 10:28:00 -0800
Subject: [PATCH RFC] drm/msm/dpu: Force modeset if new CTLs have been reserved
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250303-force-modeset-hw-ctl-v1-1-9cbf6d4fbf8e@quicinc.com>
X-B4-Tracking: v=1; b=H4sIALD0xWcC/21PyWrDMBD9FaNzBdLI2nwt9AN6LTloGdWC2E5lx
 WkJ+fcqaQiF9jS8mbfNmaxYMq5k6M6k4JbXvMwN8KeOhNHN70hzbJgAA8kADE1LCUinJeKKlY4
 nGuqeRgbeMAfe94E06aFgyp832zfy+vJMdj/Lgh/HFlHvl0fC0DX/ngMAjWWiMZf69cgwhmnrI
 2iHatiA/K52E7ZizNJ4ONIgkgvapKC4vlMProbxxkzeoNPeog5GJnd1lMYGJSXnzAgDDoRk7P8
 AzlurOmJpY3V+j9Rr7TkKbrVOw8b/qnqmuKFhmcOxFJwrPXlqdVQgjE5WwrCpq8i7FRtrmnIdO
 qMU9sLbXvpkTTLYfo/J9RKDs5Cs4Ek4JoDsLpdvv8X1kbwBAAA=
X-Change-ID: 20250228-force-modeset-hw-ctl-d02b80a2bb4c
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-f0f05
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741026485; l=6237;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=rTv0ijG4Y1jg8aOqfg1mevw98KDyQ3ZbLmXyHct+QcM=;
 b=/AoYFcIzBi1s8fDLKXYokxW3oiO45xaz61z7I/CT+KWZL6btUS9MQuO6wJUCxUECMh7wqLwwQ
 PkxYIxyOUTCCsA7eb2BcCZ/+WHRkfDD0KtmJqJQW5JI6ZgFR7SslPzK
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 0E42vUDQHO_gYKbLxyznwv8ZLb1_5t1p
X-Proofpoint-GUID: 0E42vUDQHO_gYKbLxyznwv8ZLb1_5t1p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_09,2025-03-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030141
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

If new CTLs are reserved by CRTC but atomic_enable() is skipped, the
encoders will configure the stale CTL instead of the newly reserved one.

Avoid this by setting mode_changed to true if new CTLs have been
reserved by CRTC.

Note: This patch only adds tracking for the CTL reservation, but eventually
all HW blocks used by encoders (i.e. DSC, PINGPONG, CWB) should have a
similar check to avoid the same issue.

Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Closes: https://lists.freedesktop.org/archives/freedreno/2025-February/036719.html
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 13 +++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  1 +
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 4073d821158c0..a1a8be8f5ab9f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1406,19 +1406,32 @@ int dpu_crtc_check_mode_changed(struct drm_crtc_state *old_crtc_state,
 	struct drm_crtc *crtc = new_crtc_state->crtc;
 	bool clone_mode_enabled = drm_crtc_in_clone_mode(old_crtc_state);
 	bool clone_mode_requested = drm_crtc_in_clone_mode(new_crtc_state);
+	struct dpu_crtc_state *cstate = to_dpu_crtc_state(new_crtc_state);
+	uint32_t enc_ctl_mask = 0;
+	uint32_t crtc_ctl_mask = 0;
+	struct dpu_crtc_mixer *m;
 
 	DRM_DEBUG_ATOMIC("%d\n", crtc->base.id);
 
+	for (int i = 0; i < cstate->num_mixers; i++) {
+		m = &cstate->mixers[i];
+		crtc_ctl_mask |= BIT(m->lm_ctl->idx - CTL_0);
+	}
+
 	/* there might be cases where encoder needs a modeset too */
 	drm_for_each_encoder_mask(drm_enc, crtc->dev, new_crtc_state->encoder_mask) {
 		if (dpu_encoder_needs_modeset(drm_enc, new_crtc_state->state))
 			new_crtc_state->mode_changed = true;
+		enc_ctl_mask |= dpu_encoder_get_ctls(drm_enc);
 	}
 
 	if ((clone_mode_requested && !clone_mode_enabled) ||
 	    (!clone_mode_requested && clone_mode_enabled))
 		new_crtc_state->mode_changed = true;
 
+	if (crtc_ctl_mask != enc_ctl_mask)
+		new_crtc_state->mode_changed = true;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index a61598710acda..2f3101caeba91 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -188,6 +188,7 @@ struct dpu_encoder_virt {
 
 	unsigned int dsc_mask;
 	unsigned int cwb_mask;
+	unsigned int ctl_mask;
 
 	bool intfs_swapped;
 
@@ -707,6 +708,13 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
 	}
 }
 
+uint32_t dpu_encoder_get_ctls(struct drm_encoder *drm_enc)
+{
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
+
+	return dpu_enc->ctl_mask;
+}
+
 bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_state *state)
 {
 	struct drm_connector *connector;
@@ -1155,6 +1163,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	bool is_cwb_encoder;
 	unsigned int dsc_mask = 0;
 	unsigned int cwb_mask = 0;
+	unsigned int ctl_mask = 0;
 	int i;
 
 	if (!drm_enc) {
@@ -1245,11 +1254,14 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 				"no ctl block assigned at idx: %d\n", i);
 			return;
 		}
+		ctl_mask |= BIT(phys->hw_ctl->idx - CTL_0);
 
 		phys->cached_mode = crtc_state->adjusted_mode;
 		if (phys->ops.atomic_mode_set)
 			phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
 	}
+
+	dpu_enc->ctl_mask = ctl_mask;
 }
 
 static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index ca1ca2e51d7ea..70b03743dc346 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -91,6 +91,7 @@ bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_st
 
 void dpu_encoder_prepare_wb_job(struct drm_encoder *drm_enc,
 		struct drm_writeback_job *job);
+uint32_t dpu_encoder_get_ctls(struct drm_encoder *drm_enc);
 
 void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
 		struct drm_writeback_job *job);

---
base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
change-id: 20250228-force-modeset-hw-ctl-d02b80a2bb4c
prerequisite-change-id: 20241222-drm-dirty-modeset-88079bd27ae6:v2
prerequisite-patch-id: 0c61aabfcd13651203f476985380cbf4d3c299e6
prerequisite-patch-id: c6026f08011c288fd301676e9fa6f46d0cc1dab7
prerequisite-patch-id: b0cb06d5c88791d6e4755d879ced0d5050aa3cbf
prerequisite-patch-id: fd72ddde9dba0df053113bc505c213961a9760da
prerequisite-change-id: 20250209-dpu-c3fac78fc617:v2
prerequisite-patch-id: c84d2b4b06be06384968429085d1e8ebae23a583
prerequisite-patch-id: fb8ea7b9e7c85fabd27589c6551108382a235002
prerequisite-change-id: 20250211-dither-disable-b77b1e31977f:v1
prerequisite-patch-id: 079e04296212b4b83d51394b5a9b5eea6870d98a
prerequisite-change-id: 20240618-concurrent-wb-97d62387f952:v6
prerequisite-patch-id: b52034179741dc182aea9411fd446e270fdc69d1
prerequisite-patch-id: bc472765a7d5214691f3d92696cc8b0119f3252e
prerequisite-patch-id: c959bc480e96b04297ebaf30fea3a68bbac69da6
prerequisite-patch-id: f7db8449b241a41faac357d9257f8c7cb16503ec
prerequisite-patch-id: 7beb73131d0ab100f266fcd3c1f67c818a3263f4
prerequisite-patch-id: c08cbb5cf4e67e308afd61fdad6684b89429d3b6
prerequisite-patch-id: a4e343143b8fbe98ae4aa068cc459c750105eb9d
prerequisite-patch-id: 1d09edcf12ef7e7ab43547eefacae5b604b698e9
prerequisite-patch-id: 0008f9802bfd3c5877267666cceb7608203e5830
prerequisite-patch-id: 49402eb767c97915faf2378c5f5d05ced2dcfdac
prerequisite-patch-id: 522be2a6b5fe4e3a2d609526bb1539f9bc6f828f
prerequisite-patch-id: 031da00d0fffd522f74d682a551362f3ecda0c71
prerequisite-patch-id: 9454cec22231a8f3f01c33d52a5df3e26dd88287
prerequisite-patch-id: 7edbeaace3549332e581bee3183a76b0e4d18163

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

