Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6463A216C0
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 04:21:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4C510E745;
	Wed, 29 Jan 2025 03:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="UmLoqLiu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4860A10E73E;
 Wed, 29 Jan 2025 03:21:24 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T2hB1v028472;
 Wed, 29 Jan 2025 03:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xYO2iA09aVAv2klwSBy3BTWslYMJoan0NhNKvvfdCqM=; b=UmLoqLiuPn8r92hU
 PbSFormt6xRsdyrfIxTB+nALDmok7QJmdoDaT/UUMaXKX2/uZoabOMNMnt2KbXa5
 bfE7UVQ7UJDbjhkfm9I5yyFb2ZWeWtI6vj6/MiK1ku9mVzRUb5hyyW/ym69D1zQR
 WJgR7h9tZo+WYuHw1GOkg7j0/PSQkoDXb1VBnykAwTB5hi+JsH65MKLMtztHP/TD
 f15qbNanlgahvfyPO92OLaOcAmF9LH3+0MEfAn0ustZFVEkzOebfesTl5sEbKoDi
 sjceXgpZ6vbZeWAZOq80hzxFXyCO6PTCCOkcEbnabMTfIqUhjrU/yyQhi7MU8M6Z
 Y6Ietw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44f5mrgqbt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2025 03:21:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50T3L7Nx012901
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2025 03:21:07 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 Jan 2025 19:21:06 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 28 Jan 2025 19:20:37 -0800
Subject: [PATCH v5 05/14] drm/msm/dpu: Require modeset if clone mode status
 changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250128-concurrent-wb-v5-5-6464ca5360df@quicinc.com>
References: <20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com>
In-Reply-To: <20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738120865; l=3689;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=ZBBkvgZCWJ1A02/soBMbIj9fDedeAgiGfzS0tqzTmJA=;
 b=W+LRlzwH8+me0ZOG9csTedX1sV7KqjlLTr41Buxq5Udnows0z5sSbNZWKrUnSK8pew+lBZUzo
 rK2tf/Z9DyUBfZ/sn2X74TKwHisZNGDBREOkrADN1QLy84CpSOkMb30
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: G3H1xNfvowc1zNy0ighgFH0EY8zw6S8e
X-Proofpoint-ORIG-GUID: G3H1xNfvowc1zNy0ighgFH0EY8zw6S8e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501290026
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

If the clone mode enabled status is changing, a modeset needs to happen
so that the resources can be reassigned

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 17 ++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h |  3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  5 +++--
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 3449a7066e084eaeeb713d21d53f3d8e877cc30e..cfb19be0547788aa9a3b78fd0abb0513b8c9bb47 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1358,19 +1358,26 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc,
  *
  * Check if the changes in the object properties demand full mode set.
  */
-int dpu_crtc_check_mode_changed(struct drm_crtc_state *crtc_state)
+int dpu_crtc_check_mode_changed(struct drm_crtc_state *old_crtc_state,
+				struct drm_crtc_state *new_crtc_state)
 {
 	struct drm_encoder *drm_enc;
-	struct drm_crtc *crtc = crtc_state->crtc;
+	struct drm_crtc *crtc = new_crtc_state->crtc;
+	bool clone_mode_enabled = drm_crtc_in_clone_mode(old_crtc_state);
+	bool clone_mode_requested = drm_crtc_in_clone_mode(new_crtc_state);
 
 	DRM_DEBUG_ATOMIC("%d\n", crtc->base.id);
 
 	/* there might be cases where encoder needs a modeset too */
-	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
-		if (dpu_encoder_needs_modeset(drm_enc, crtc_state->state))
-			crtc_state->mode_changed = true;
+	drm_for_each_encoder_mask(drm_enc, crtc->dev, new_crtc_state->encoder_mask) {
+		if (dpu_encoder_needs_modeset(drm_enc, new_crtc_state->state))
+			new_crtc_state->mode_changed = true;
 	}
 
+	if ((clone_mode_requested && !clone_mode_enabled) ||
+	    (!clone_mode_requested && clone_mode_enabled))
+		new_crtc_state->mode_changed = true;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 51a3b5fc879a1c83836601d717757dd1e801f884..94392b9b924546f96e738ae20920cf9afd568e6b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -239,7 +239,8 @@ static inline int dpu_crtc_frame_pending(struct drm_crtc *crtc)
 	return crtc ? atomic_read(&to_dpu_crtc(crtc)->frame_pending) : -EINVAL;
 }
 
-int dpu_crtc_check_mode_changed(struct drm_crtc_state *crtc_state);
+int dpu_crtc_check_mode_changed(struct drm_crtc_state *old_crtc_state,
+				struct drm_crtc_state *new_crtc_state);
 
 int dpu_crtc_vblank(struct drm_crtc *crtc, bool en);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index c6b3b2e147b4c61ec93db4a9f01d5a288d2b9eb2..423af6f8251cb9c7c07f5a9878c8abc717d947a4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -449,11 +449,12 @@ static void dpu_kms_disable_commit(struct msm_kms *kms)
 static int dpu_kms_check_mode_changed(struct msm_kms *kms, struct drm_atomic_state *state)
 {
 	struct drm_crtc_state *new_crtc_state;
+	struct drm_crtc_state *old_crtc_state;
 	struct drm_crtc *crtc;
 	int i;
 
-	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
-		dpu_crtc_check_mode_changed(new_crtc_state);
+	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i)
+		dpu_crtc_check_mode_changed(old_crtc_state, new_crtc_state);
 
 	return 0;
 }

-- 
2.34.1

