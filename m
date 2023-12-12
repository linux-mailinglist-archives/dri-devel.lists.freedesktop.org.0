Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3123E80E007
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 01:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AF010E548;
	Tue, 12 Dec 2023 00:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE67A10E546;
 Tue, 12 Dec 2023 00:23:07 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BBNqe6l009475; Tue, 12 Dec 2023 00:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=gUw5YkCTiGSqEG0/w1m9bd75gcSbNeBMhjksx/TyE4I=; b=DM
 +By77LrusxIYJa94qd1qkIfnbIpvWyvcxuDMUwo/AB9BXCWqZ9p7ECrkdoAghb+d
 VSZ79//RpezVDZa0Y9zOH7ToXBJkiY0YMa2E22ALzZUwBz0mPOQIzD4w12u1yz71
 RV94mKhx3EbX9+XnFwUC/51WH0B5N32jiLz/a/dNfbjb5tqqNWsjgdCuvB9lMk6B
 PmxvX2yQayW9evBFUcIFcQ7J/gdMAgJM82lsEBfaC0UbFrIEWcklHT2nUMbzo8rM
 KldI6+dgdTyW4co8Ncd/6IlglmKP//yK7Em22+RhNVMQ5cm23D5zJw3QlrU7SBvP
 B+u4/wioK0eE5Rv7nSIg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uvney4t9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 00:23:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BC0N3bd007281
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 00:23:03 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 11 Dec 2023 16:23:02 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
Subject: [PATCH v3 04/15] drm/msm/dpu: move csc matrices to dpu_hw_util
Date: Mon, 11 Dec 2023 16:22:34 -0800
Message-ID: <20231212002245.23715-5-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231212002245.23715-1-quic_abhinavk@quicinc.com>
References: <20231212002245.23715-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 72CUQ_ftQnBxeYtzyaBQByleeYFgRk77
X-Proofpoint-ORIG-GUID: 72CUQ_ftQnBxeYtzyaBQByleeYFgRk77
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=998 mlxscore=0 phishscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312120001
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
Cc: quic_jesszhan@quicinc.com, seanpaul@chromium.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the type and usage of CSC matrices is spanning across DPU
lets introduce a helper to the dpu_hw_util to return the CSC
corresponding to the request type. This will help to add more
supported CSC types such as the RGB to YUV one which is used in
the case of CDM.

changes in v3:
	- drop the extra wrapper and export the matrices directly

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 30 ++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 31 +--------------------
 2 files changed, 31 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index fe083b2e5696..aa50005042d1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -19,6 +19,36 @@
 #define MISR_CTRL_STATUS_CLEAR          BIT(10)
 #define MISR_CTRL_FREE_RUN_MASK         BIT(31)
 
+static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
+	{
+		/* S15.16 format */
+		0x00012A00, 0x00000000, 0x00019880,
+		0x00012A00, 0xFFFF9B80, 0xFFFF3000,
+		0x00012A00, 0x00020480, 0x00000000,
+	},
+	/* signed bias */
+	{ 0xfff0, 0xff80, 0xff80,},
+	{ 0x0, 0x0, 0x0,},
+	/* unsigned clamp */
+	{ 0x10, 0xeb, 0x10, 0xf0, 0x10, 0xf0,},
+	{ 0x00, 0xff, 0x00, 0xff, 0x00, 0xff,},
+};
+
+static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
+	{
+		/* S15.16 format */
+		0x00012A00, 0x00000000, 0x00019880,
+		0x00012A00, 0xFFFF9B80, 0xFFFF3000,
+		0x00012A00, 0x00020480, 0x00000000,
+	},
+	/* signed bias */
+	{ 0xffc0, 0xfe00, 0xfe00,},
+	{ 0x0, 0x0, 0x0,},
+	/* unsigned clamp */
+	{ 0x40, 0x3ac, 0x40, 0x3c0, 0x40, 0x3c0,},
+	{ 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
+};
+
 /*
  * This is the common struct maintained by each sub block
  * for mapping the register offsets in this block to the
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3235ab132540..ff975ad51145 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -21,6 +21,7 @@
 #include "dpu_kms.h"
 #include "dpu_formats.h"
 #include "dpu_hw_sspp.h"
+#include "dpu_hw_util.h"
 #include "dpu_trace.h"
 #include "dpu_crtc.h"
 #include "dpu_vbif.h"
@@ -508,36 +509,6 @@ static void _dpu_plane_setup_pixel_ext(struct dpu_hw_scaler3_cfg *scale_cfg,
 	}
 }
 
-static const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L = {
-	{
-		/* S15.16 format */
-		0x00012A00, 0x00000000, 0x00019880,
-		0x00012A00, 0xFFFF9B80, 0xFFFF3000,
-		0x00012A00, 0x00020480, 0x00000000,
-	},
-	/* signed bias */
-	{ 0xfff0, 0xff80, 0xff80,},
-	{ 0x0, 0x0, 0x0,},
-	/* unsigned clamp */
-	{ 0x10, 0xeb, 0x10, 0xf0, 0x10, 0xf0,},
-	{ 0x00, 0xff, 0x00, 0xff, 0x00, 0xff,},
-};
-
-static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
-	{
-		/* S15.16 format */
-		0x00012A00, 0x00000000, 0x00019880,
-		0x00012A00, 0xFFFF9B80, 0xFFFF3000,
-		0x00012A00, 0x00020480, 0x00000000,
-		},
-	/* signed bias */
-	{ 0xffc0, 0xfe00, 0xfe00,},
-	{ 0x0, 0x0, 0x0,},
-	/* unsigned clamp */
-	{ 0x40, 0x3ac, 0x40, 0x3c0, 0x40, 0x3c0,},
-	{ 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
-};
-
 static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_sw_pipe *pipe,
 						    const struct dpu_format *fmt)
 {
-- 
2.40.1

