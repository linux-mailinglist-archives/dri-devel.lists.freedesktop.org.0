Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEB59F3F38
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 01:43:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C6710E819;
	Tue, 17 Dec 2024 00:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ecXWMOi+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8546010E807;
 Tue, 17 Dec 2024 00:43:39 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGKLrET029533;
 Tue, 17 Dec 2024 00:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lOn8CLpkj/idtjcbpkEtpwdGc/LeBL+ggTcM9C7fkk0=; b=ecXWMOi+3g+e7ni8
 xDLF3Gj93bN1xUM6x5lP++tc0sxK7DvKT8RQx4sGSC529gG4Q10oUuzeyLHviCA6
 3j8YZ4W2rPQbw951CriyTiU1J5xKHOsFz41dgjwVGGikC0kS6NJUpL7x5vvs3cue
 1Hsn76UEoAT+tq3dL1bXpdOKZXR9C+MvcPDgyPuimrgl9nIVilQd3bgL8AK1DafC
 ksHocXCrQEQ8fMkf8n91Vr5lpA2TgoyCB5WkBxlCSks3TKIGZtBE3eSdQw3oxXEE
 BJ6OIhB0e2Q2NECMSw/ENfDw1GHSa7DUgtypAL3Xign7PVcrCFposjeCN19nY7Q/
 8LKbxA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ju61rf5g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2024 00:43:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH0hVgr028904
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2024 00:43:31 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 16 Dec 2024 16:43:31 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Mon, 16 Dec 2024 16:43:34 -0800
Subject: [PATCH v4 23/25] drm/msm/dpu: Skip trigger flush and start for CWB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241216-concurrent-wb-v4-23-fe220297a7f0@quicinc.com>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
In-Reply-To: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
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
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734396205; l=2387;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=ZPgbLYpMgLZSOqFqh4ddP29M+IuHTOTTkPLJEr/xT6s=;
 b=HA/4XDKU6EdJrHB8x9zsFJmfRGaZwzfvRuxx49hWqqbwxXaanBo4weuGWhaRTaQ1XyRP5bscS
 hV7degT+17bB1DjezIaJBGdEyrMVlut7dGOUIde76pAc50MARwjF6EI
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: RpOcy9ls9Bsn8-cSseB19ohrUkDQE5bE
X-Proofpoint-ORIG-GUID: RpOcy9ls9Bsn8-cSseB19ohrUkDQE5bE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 adultscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412170004
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

For concurrent writeback, the real time encoder is responsible for
trigger flush and trigger start. Return early for trigger start and
trigger flush for the concurrent writeback encoders.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 905a4a096c00a6bd0700eea6d908da03d8b3c89d..f21be3bf19958834a735d797170f80424b8407f7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1607,6 +1607,7 @@ static void dpu_encoder_off_work(struct work_struct *work)
 static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
 		struct dpu_encoder_phys *phys, uint32_t extra_flush_bits)
 {
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
 	struct dpu_hw_ctl *ctl;
 	int pending_kickoff_cnt;
 	u32 ret = UINT_MAX;
@@ -1624,6 +1625,15 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
 
 	pending_kickoff_cnt = dpu_encoder_phys_inc_pending(phys);
 
+	/* Return early if encoder is writeback and in clone mode */
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_VIRTUAL &&
+	    dpu_enc->cwb_mask) {
+		DPU_DEBUG("encoder %d skip flush for concurrent writeback encoder\n",
+				DRMID(drm_enc));
+		return;
+	}
+
+
 	if (extra_flush_bits && ctl->ops.update_pending_flush)
 		ctl->ops.update_pending_flush(ctl, extra_flush_bits);
 
@@ -1646,6 +1656,8 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
  */
 static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
 {
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys->parent);
+
 	if (!phys) {
 		DPU_ERROR("invalid argument(s)\n");
 		return;
@@ -1656,6 +1668,12 @@ static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
 		return;
 	}
 
+	if (phys->parent->encoder_type == DRM_MODE_ENCODER_VIRTUAL &&
+	    dpu_enc->cwb_mask) {
+		DPU_DEBUG("encoder %d CWB enabled, skipping\n", DRMID(phys->parent));
+		return;
+	}
+
 	if (phys->ops.trigger_start && phys->enable_state != DPU_ENC_DISABLED)
 		phys->ops.trigger_start(phys);
 }

-- 
2.34.1

