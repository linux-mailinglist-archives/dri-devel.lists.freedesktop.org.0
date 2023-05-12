Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D03EC70114C
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 23:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1AE810E2D3;
	Fri, 12 May 2023 21:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FAC10E2C4;
 Fri, 12 May 2023 21:32:27 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34CL2hrE006716; Fri, 12 May 2023 21:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=gi6QRgj67cqEgbppypPdlETLz7m3GiClc2YEp7Ak0HY=;
 b=CUDEQe2ZB2XU7qLsCC1QIuZTiMIsBv/rt2U+lLGCHVcR0sfQaOk6oHC0NL8Gskgn6/QB
 pUN1VExa9aec0QN+NY2FJWzS0KlrgkfyzgGvrscloURozDcIsyMiznJun+IzfVwq2IAa
 1RO+JJga2bRJeWy58ifyZeob+8nSO3FlpBWxEuvRp6yIhxqyjS2EI8aalSHlvmnjYoET
 BrdQAhTeAjE7Qurlcd9NZf024hUWRkGr7hGXz+ZfR3JI86grsfG0i0UERbrZQfQoTo5C
 wiBcSTvasFXwzVpyHKeDonhbgqRR/hXVm4sVj/HrhFpbElcrNHz4TdNT6UpWa/HQk10P 5Q== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qhdf429yp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:32:24 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34CLWN6a021685
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 21:32:23 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 12 May 2023 14:32:23 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 12 May 2023 14:32:14 -0700
Subject: [PATCH v10 4/8] drm/msm: Add MSM-specific DSC helper methods
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v10-4-4cb21168c227@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v10-0-4cb21168c227@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v10-0-4cb21168c227@quicinc.com>
To: <freedreno@lists.freedesktop.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683927142; l=2581;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=DylmFREry9+46IRAdbhk5Je+h9U5BC7HS5Nr/046JHo=;
 b=ABE3TIgsWnOQBVJ1sqJbn1aEv9Krq6OoXYMKhkXn4EYk7HY1b6QqsSjR2HWuntSR1icbRmvMU
 48gD3D49AXrBP8lK3HvRHpLL+NXea20w4dVFq5ilpRdSoDaQC+OHEKe
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: W8JggnfIa-RQ04gG20PLqFYZai_6Zqjj
X-Proofpoint-ORIG-GUID: W8JggnfIa-RQ04gG20PLqFYZai_6Zqjj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_14,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=568
 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305120181
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce MSM-specific DSC helper methods, as some calculations are
common between DP and DSC.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/msm_dsc_helper.h | 65 ++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h b/drivers/gpu/drm/msm/msm_dsc_helper.h
new file mode 100644
index 000000000000..0d2a097b428d
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
+ */
+
+#ifndef MSM_DSC_HELPER_H_
+#define MSM_DSC_HELPER_H_
+
+#include <linux/bug.h>
+#include <linux/math.h>
+#include <drm/display/drm_dsc_helper.h>
+
+/*
+ * Helper methods for MSM specific DSC calculations that are common between timing engine,
+ * DSI, and DP.
+ */
+
+/**
+ * msm_dsc_get_bpp_int() - get bits per pixel integer value
+ * @dsc: Pointer to drm dsc config struct
+ * Returns: BPP integer value
+ */
+static inline int msm_dsc_get_bpp_int(struct drm_dsc_config *dsc)
+{
+	WARN_ON_ONCE(dsc->bits_per_pixel & 0xf);
+	return dsc->bits_per_pixel >> 4;
+}
+
+/**
+ * msm_dsc_get_slice_per_intf() - get number of slices per interface
+ * @dsc: Pointer to drm dsc config struct
+ * @intf_width: interface width
+ * Returns: Integer representing the slice per interface
+ */
+static inline int msm_dsc_get_slice_per_intf(struct drm_dsc_config *dsc, int intf_width)
+{
+	return DIV_ROUND_UP(intf_width, dsc->slice_width);
+}
+
+/**
+ * msm_dsc_get_bytes_per_line() - Calculate bytes per line
+ * @dsc: Pointer to drm dsc config struct
+ * Returns: Integer value representing pclk per interface
+ *
+ * Note: This value will then be passed along to DSI and DP for some more
+ * calculations. This is because DSI and DP divide the pclk_per_intf value
+ * by different values depending on if widebus is enabled.
+ */
+static inline int msm_dsc_get_bytes_per_line(struct drm_dsc_config *dsc)
+{
+	return dsc->slice_count * dsc->slice_chunk_size;
+}
+
+/**
+ * msm_dsc_get_bytes_per_intf() - get total bytes per interface
+ * @dsc: Pointer to drm dsc config struct
+ * @intf_width: interface width
+ * Returns: u32 value representing bytes per interface
+ */
+static inline u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int intf_width)
+{
+	return dsc->slice_chunk_size * msm_dsc_get_slice_per_intf(dsc, intf_width);
+}
+
+#endif /* MSM_DSC_HELPER_H_ */

-- 
2.40.1

