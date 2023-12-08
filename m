Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D422A809B6D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 06:07:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87CD610EA00;
	Fri,  8 Dec 2023 05:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A004F10E9EE;
 Fri,  8 Dec 2023 05:07:23 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B84nvpY030731; Fri, 8 Dec 2023 05:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=edMATInw/JVSytLa6L6eueG5DQjzdWWf+I0i7QMoCss=;
 b=pCsWFNu4UC5pajjkithAWCIqJIqYpKRfSZRU/lpUTLzjTbn0NpXcUwovzZkyVsqF0pBj
 hm0SfDxCyqHKnzG/6OsnhW6/EGG+iqUX+B24CMiexs5Kb5lE1wZXH6Gyk1RnuUStM1d7
 U2bvd0+Y3TwQUsJPNVkmSUEWhBqKwPwaps7km/CA1b4oaoCM5UGjMlYNS0xsn/CSqKSQ
 J+xz+lYxdxuJH+hshjUm2RB7HjoJekPcGL0noHIidEfPsuHLnGb05LBgSJpCqVUUjgVI
 iZ3eq52X9/bvj4SH1TEOWtnoEdoeMFZtxQXLYsLamV3mUq60C79IY9Hq+2/XHtrzHPla XQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uuuu4r2ta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Dec 2023 05:07:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B857JYG021928
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 8 Dec 2023 05:07:19 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 7 Dec 2023 21:07:18 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
Subject: [PATCH v2 11/16] drm/msm/dpu: add support to disable CDM block during
 encoder cleanup
Date: Thu, 7 Dec 2023 21:06:36 -0800
Message-ID: <20231208050641.32582-12-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: QZs7rNM3vHGOghpIjA9Tv-TgDWC5bZBz
X-Proofpoint-ORIG-GUID: QZs7rNM3vHGOghpIjA9Tv-TgDWC5bZBz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 phishscore=0 mlxlogscore=707 adultscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2312080038
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
Cc: quic_jesszhan@quicinc.com, quic_parellan@quicinc.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation of setting up CDM block, add the logic to disable it
properly during encoder cleanup.

changes in v2:
	- call update_pending_flush_cdm even when bind_pingpong_blk
	  is not present

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 10 ++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index aa1a1646b322..862912727925 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -26,6 +26,7 @@
 #include "dpu_hw_dspp.h"
 #include "dpu_hw_dsc.h"
 #include "dpu_hw_merge3d.h"
+#include "dpu_hw_cdm.h"
 #include "dpu_formats.h"
 #include "dpu_encoder_phys.h"
 #include "dpu_crtc.h"
@@ -2050,6 +2051,15 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 					phys_enc->hw_pp->merge_3d->idx);
 	}
 
+	if (phys_enc->hw_cdm) {
+		if (phys_enc->hw_cdm->ops.bind_pingpong_blk && phys_enc->hw_pp)
+			phys_enc->hw_cdm->ops.bind_pingpong_blk(phys_enc->hw_cdm,
+								false, phys_enc->hw_pp->idx);
+		if (phys_enc->hw_ctl->ops.update_pending_flush_cdm)
+			phys_enc->hw_ctl->ops.update_pending_flush_cdm(phys_enc->hw_ctl,
+								       phys_enc->hw_cdm->idx);
+	}
+
 	if (dpu_enc->dsc) {
 		dpu_encoder_unprep_dsc(dpu_enc);
 		dpu_enc->dsc = NULL;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index b6b48e2c63ef..410f6225789c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -151,6 +151,7 @@ enum dpu_intr_idx {
  * @hw_pp:		Hardware interface to the ping pong registers
  * @hw_intf:		Hardware interface to the intf registers
  * @hw_wb:		Hardware interface to the wb registers
+ * @hw_cdm:		Hardware interface to the CDM registers
  * @dpu_kms:		Pointer to the dpu_kms top level
  * @cached_mode:	DRM mode cached at mode_set time, acted on in enable
  * @enabled:		Whether the encoder has enabled and running a mode
@@ -179,6 +180,7 @@ struct dpu_encoder_phys {
 	struct dpu_hw_pingpong *hw_pp;
 	struct dpu_hw_intf *hw_intf;
 	struct dpu_hw_wb *hw_wb;
+	struct dpu_hw_cdm *hw_cdm;
 	struct dpu_kms *dpu_kms;
 	struct drm_display_mode cached_mode;
 	enum dpu_enc_split_role split_role;
-- 
2.40.1

