Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 522E59D6636
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 00:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE4810E434;
	Fri, 22 Nov 2024 23:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="pz+qUQ9o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7BD10E31F;
 Fri, 22 Nov 2024 23:09:31 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AMHVGQf015521;
 Fri, 22 Nov 2024 23:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=WiMlvrwkPosfBz2ctCmK2s
 nOyJ8A+EyYdYrryfeNcEI=; b=pz+qUQ9o0cbnMCszL2VYgXzUKPDJomFUg5t6li
 lzROxzFsHX+w7Ao9tjL/RhkyEL6egC9FdgwwnFTrJWA03o4sTOy16tuBT/XHWYtj
 oWFgq0Zyds/VOgi+aInZrnX/D9/E7MYt6Fqfju5YpRjdBCCYF41V/dS0cy27tSVf
 mKxgTT4vWd1HJHV1/ui+OkRnSNaSYJX8J/qPYAaU8KT5QT8AKbo0bHDqXVhMfjYd
 z73/k+sF0JZdu6FukOPboCQmfHVeCe8nJYjum6w+r/dWC0r+uc9NxnVO5Vo8cXbs
 5b55d8y06Ris4GAuFA21ND06uK4o92jq/7lt4WkCzOsguU+g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4320y9nhd6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Nov 2024 23:09:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AMN9RlM025232
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Nov 2024 23:09:27 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 22 Nov 2024 15:09:26 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 22 Nov 2024 15:09:10 -0800
Subject: [PATCH] drm/msm/dpu: Add VBIF to DPU snapshot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241122-vbif-snapshot-v1-1-6e8fedd16fdf@quicinc.com>
X-B4-Tracking: v=1; b=H4sIABUPQWcC/x3MQQqAIBBA0avIrBNSo6KrRAuzsWaj4oQE0t2Tl
 m/xfwXGTMiwiAoZCzHF0KA6Ae6y4URJRzPoXg9KaS3LTl5ysImveMt9nMzsj8lY56E1KaOn5/+
 t2/t+ZW9+Q18AAAA=
X-Change-ID: 20241122-vbif-snapshot-b6738fd73acf
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732316966; l=1222;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=TJOLdSpE1fHET9ApFeylxGcqytAo8E17FRHaAgSGC40=;
 b=Iizvuq/vZQmlQPiypKszQNU+lN/yHM7hbto87+25xTZtAHzuTMU65pKQazOpyAPcKKxT5FSnV
 mPemYxkt6ABCBiqe6kdtqRt6osXDm/kVs6Gmt+JP8NgyYMPvm9+gTmT
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Q695kx613nNHlAvXGyWyEbtsvLBl0AP8
X-Proofpoint-ORIG-GUID: Q695kx613nNHlAvXGyWyEbtsvLBl0AP8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=915 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1011
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220196
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

Add VBIF registers to the DPU snapshot to help with debugging.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ca4847b2b73876c59dedff1e3ec4188ea70860a7..df90b080be5a1a07bea76bad4f282d80cc0e4397 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1024,6 +1024,14 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 		msm_disp_snapshot_add_block(disp_state, cat->cdm->len,
 					    dpu_kms->mmio + cat->cdm->base, cat->cdm->name);
 
+	for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
+		const struct dpu_vbif_cfg *vbif = &dpu_kms->catalog->vbif[i];
+
+		msm_disp_snapshot_add_block(disp_state, vbif->len,
+					    dpu_kms->vbif[vbif->id] + vbif->base,
+					    vbif->name);
+	}
+
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
 

---
base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
change-id: 20241122-vbif-snapshot-b6738fd73acf

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

