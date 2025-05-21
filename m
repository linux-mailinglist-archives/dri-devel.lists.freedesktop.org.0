Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1023ABE8F7
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 03:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FC810E5C6;
	Wed, 21 May 2025 01:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2244D10E5A3;
 Wed, 21 May 2025 01:21:36 +0000 (UTC)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L0VDx9014151;
 Wed, 21 May 2025 01:21:29 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com
 [147.11.82.252])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfx0ka6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 21 May 2025 01:21:29 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 20 May 2025 18:21:10 -0700
Received: from pek-lpg-core1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 20 May 2025 18:21:05 -0700
From: <jianqi.ren.cn@windriver.com>
To: <gregkh@linuxfoundation.org>, <stable@vger.kernel.org>
CC: <patches@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <jianqi.ren.cn@windriver.com>, <robdclark@gmail.com>,
 <quic_abhinavk@quicinc.com>, <dmitry.baryshkov@linaro.org>,
 <sean@poorly.run>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <sashal@kernel.org>, <quic_vpolimer@quicinc.com>,
 <quic_jesszhan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <quic_kalyant@quicinc.com>
Subject: [PATCH 6.1.y v2 2/2] drm/msm/dpu: move dpu_encoder's connector
 assignment to atomic_enable()
Date: Wed, 21 May 2025 09:21:23 +0800
Message-ID: <20250521012123.1977793-1-jianqi.ren.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=ObSYDgTY c=1 sm=1 tr=0 ts=682d2a99 cx=c_pps
 a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=t7CeM3EgAAAA:8
 a=Il65ExNKTjwmHhc7HzsA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDAxMSBTYWx0ZWRfX2iVILvKWn5IQ
 9jKTYADda3XzJTTlmc5FWJ/utr0h6TWpMbcqM+17kuqrW96sgV4/P/Ayi/p6WZLaA2K6Pf5oAka
 uMrQF70UoNROIymqV8OM0YND5WLP/4HQyc2DQQpCyUpvlwz8dGU4rL/JEn+lNyIneRpnTtgC9Eg
 6ill9T8r2agg1n0mcRN+TD5D6lBLzcqB15y91ezU7W7cRa9Pxk9hj1aoQV/6OFhhDmsE8x2hs3D
 d6MrZoLe1Goy1gJF+cJ36j4hq3V/GjWpE5EY6zbb8WBfgvX6+aniUTN2KK9Z+T9e+Ar2D50EdA0
 T5kNWzW3ChgcLoSJaozowM34KsAVdVtNrdn95VM2A7wd4iq2TcgnL2a02cEpychLCQunVpsHBdv
 W+qbODwNgYc0Trc5YfxWDIrtWUy0+uNCfiddCla6qXbI3PusSCgPszrlC9hTgjgnPoAkSniT
X-Proofpoint-GUID: CvB6XweGdALzlTS_J06AkR2aQF6OlC55
X-Proofpoint-ORIG-GUID: CvB6XweGdALzlTS_J06AkR2aQF6OlC55
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505210011
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

[ Upstream commit aedf02e46eb549dac8db4821a6b9f0c6bf6e3990 ]

For cases where the crtc's connectors_changed was set without enable/active
getting toggled , there is an atomic_enable() call followed by an
atomic_disable() but without an atomic_mode_set().

This results in a NULL ptr access for the dpu_encoder_get_drm_fmt() call in
the atomic_enable() as the dpu_encoder's connector was cleared in the
atomic_disable() but not re-assigned as there was no atomic_mode_set() call.

Fix the NULL ptr access by moving the assignment for atomic_enable() and also
use drm_atomic_get_new_connector_for_encoder() to get the connector from
the atomic_state.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/59
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # SM8350-HDK
Patchwork: https://patchwork.freedesktop.org/patch/606729/
Link: https://lore.kernel.org/r/20240731191723.3050932-1-quic_abhinavk@quicinc.com
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
[Minor conflict resolved due to code context change.]
Signed-off-by: Jianqi Ren <jianqi.ren.cn@windriver.com>
Signed-off-by: He Zhe <zhe.he@windriver.com>
---
Verified the build test
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index c7fcd617b48c..94f352253c74 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1101,8 +1101,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 
 	cstate->num_mixers = num_lm;
 
-	dpu_enc->connector = conn_state->connector;
-
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
@@ -1192,6 +1190,9 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 
 	mutex_lock(&dpu_enc->enc_lock);
+
+	dpu_enc->connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
+
 	cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
 
 	trace_dpu_enc_enable(DRMID(drm_enc), cur_mode->hdisplay,
-- 
2.34.1

