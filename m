Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EC19F5B60
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 01:28:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABED410E084;
	Wed, 18 Dec 2024 00:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="CZlFSf/n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D7D10E084;
 Wed, 18 Dec 2024 00:28:26 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHIJua9013414;
 Wed, 18 Dec 2024 00:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 k7k8mes5yRRlpNBEP7IJ8UGnzSSiNPkLMMVxc3mv8wY=; b=CZlFSf/n9BHljKvq
 KeyDsUyrFem0DpFT+xrM82lHPV7RrUltZv3nK71wqHOodDmthxsEi9CcWtnZSS7S
 xpL+cReloTnha7W3uwW727wWiIvjS+upG09OxRnJuISOlWsJmJEIRW/fGsr8Tx7z
 4BROcbCu9+q2pUCC+VbM2DFPiEgBaBTGB+dwUmHrVQRfAIIrYvSmvG9IgmmV9Ogr
 uYde/TeMOBIUmTgu4YUNHqKMzB5b9QCdkAyjP2NlgaZjFE0ATg+zsav/ScCLAEJQ
 FTpFwc8qyiCB7K7+oLDCCJ0ziNJT5OG7ux+UDTFk3T4uZd9O2HKWkW4ytrPbWLmi
 qp7DMg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kefxgpe0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2024 00:28:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BI0SM07032542
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2024 00:28:22 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 16:28:22 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 17 Dec 2024 16:27:53 -0800
Subject: [PATCH v2 1/5] drm/msm: register a fault handler for display mmu
 faults
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241217-abhinavk-smmu-fault-handler-v2-1-451377666cad@quicinc.com>
References: <20241217-abhinavk-smmu-fault-handler-v2-0-451377666cad@quicinc.com>
In-Reply-To: <20241217-abhinavk-smmu-fault-handler-v2-0-451377666cad@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734481701; l=1752;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=ifcZn0k66J0EOjrxa290NN1+zLmQPksCvDyffR0jPWw=;
 b=uHoC2sqU7Tt8b9hMGGRaLsPh9dJO5frboQ2jPFuqBtCeTJBZ2XSkco8LZ7afzbx1QgXvGHLV+
 TwZPvbiAFxFBbbRlpHCyYpzZrTajrjbiET/USiRxj+4mkUDPXn53YSw
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: T4w_VNUBWFJMvPST0bO_AoTlAJO4-8-y
X-Proofpoint-ORIG-GUID: T4w_VNUBWFJMvPST0bO_AoTlAJO4-8-y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180001
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

In preparation to register a iommu fault handler for display
related modules, register a fault handler for the backing
mmu object of msm_kms.

Currently, the fault handler only captures the display snapshot
but we can expand this later if more information needs to be
added to debug display mmu faults.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index f3326d09bdbce19d40d0b48549c330c2b836476f..cf5f15b9cd16a23e9bea820cfc096caa0d7da175 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -164,12 +164,23 @@ void msm_crtc_disable_vblank(struct drm_crtc *crtc)
 	vblank_ctrl_queue_work(priv, crtc, false);
 }
 
+static int msm_kms_fault_handler(void *arg, unsigned long iova, int flags, void *data)
+{
+	struct msm_kms *kms = arg;
+
+	msm_disp_snapshot_state(kms->dev);
+
+	return -ENOSYS;
+}
+
 struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
 {
 	struct msm_gem_address_space *aspace;
 	struct msm_mmu *mmu;
 	struct device *mdp_dev = dev->dev;
 	struct device *mdss_dev = mdp_dev->parent;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_kms *kms = priv->kms;
 	struct device *iommu_dev;
 
 	/*
@@ -197,6 +208,8 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
 		mmu->funcs->destroy(mmu);
 	}
 
+	msm_mmu_set_fault_handler(aspace->mmu, kms, msm_kms_fault_handler);
+
 	return aspace;
 }
 

-- 
2.34.1

