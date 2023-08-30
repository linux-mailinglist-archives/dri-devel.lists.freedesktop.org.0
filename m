Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF7A78E2BF
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 00:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA2C10E617;
	Wed, 30 Aug 2023 22:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E14F10E61D;
 Wed, 30 Aug 2023 22:50:13 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37UMgkfs021325; Wed, 30 Aug 2023 22:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=LwUXOZ86t3mtqN7Bql5xuPXnatyskBy/0BZ34ZWb2DY=;
 b=KhiguIrgSXmceNUOAEHEHI5lIi5Zsk407k8nUXNA/dOZ9E5fOhtLCmWpl20Q3yIdcOBx
 bvdI9chlapVvZm2E1JOXLt1RxHNfdoZZODHFU0i4NcvcXJ06qKMU6Nx8OExRYYSNKCPs
 JqQRUPA/2007ijynqZGgh/7xojxogPRmS+AccbjTuXZEd5oNGOg3kCOD+6b0EW3ChO4U
 44oMUZClLynLk+fbwoVD7sTXDx2elNJNM3YbItaMpLLNBfSm2ZTZ+hv4BHEWCXHP8LBE
 92P/DjQtML2Vn4qpd/nmNbjYhqnN3QQDncN2FCmLS4vg0VpPrkQBpDYuj3RkKpUJ4ioH Ow== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3st0tassv7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 22:50:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37UMo2IW027564
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Aug 2023 22:50:02 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 30 Aug 2023 15:50:02 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
Subject: [PATCH 10/16] drm/msm/dpu: add support to disable CDM block during
 encoder cleanup
Date: Wed, 30 Aug 2023 15:49:03 -0700
Message-ID: <20230830224910.8091-11-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: dBtwUJZs5GSzNt2p6qH1K8e44kOJxy3N
X-Proofpoint-ORIG-GUID: dBtwUJZs5GSzNt2p6qH1K8e44kOJxy3N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-30_18,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxlogscore=744
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308300207
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_khsieh@quicinc.com,
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation of setting up CDM block, add the logic to disable it
properly during encoder cleanup.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 8 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 582680804016..1b1e07292a9e 100644
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
@@ -2097,6 +2098,13 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 					phys_enc->hw_pp->merge_3d->idx);
 	}
 
+	if (phys_enc->hw_cdm && phys_enc->hw_cdm->ops.bind_pingpong_blk && phys_enc->hw_pp) {
+		phys_enc->hw_cdm->ops.bind_pingpong_blk(phys_enc->hw_cdm,
+							false, phys_enc->hw_pp->idx);
+		if (phys_enc->hw_ctl->ops.update_pending_flush_cdm)
+			phys_enc->hw_ctl->ops.update_pending_flush_cdm(phys_enc->hw_ctl);
+	}
+
 	if (dpu_enc->dsc) {
 		dpu_encoder_unprep_dsc(dpu_enc);
 		dpu_enc->dsc = NULL;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 24dbc28be4f8..510c1c41ddbc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -150,6 +150,7 @@ enum dpu_intr_idx {
  * @hw_pp:		Hardware interface to the ping pong registers
  * @hw_intf:		Hardware interface to the intf registers
  * @hw_wb:		Hardware interface to the wb registers
+ * @hw_cdm:		Hardware interface to the CDM registers
  * @dpu_kms:		Pointer to the dpu_kms top level
  * @cached_mode:	DRM mode cached at mode_set time, acted on in enable
  * @enabled:		Whether the encoder has enabled and running a mode
@@ -178,6 +179,7 @@ struct dpu_encoder_phys {
 	struct dpu_hw_pingpong *hw_pp;
 	struct dpu_hw_intf *hw_intf;
 	struct dpu_hw_wb *hw_wb;
+	struct dpu_hw_cdm *hw_cdm;
 	struct dpu_kms *dpu_kms;
 	struct drm_display_mode cached_mode;
 	enum dpu_enc_split_role split_role;
-- 
2.40.1

