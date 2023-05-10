Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0056FE776
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 00:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9296710E570;
	Wed, 10 May 2023 22:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6EC110E162;
 Wed, 10 May 2023 22:46:29 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34AMQboi007985; Wed, 10 May 2023 22:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=weugBt5i3NtWDKQnZTSxEm7d9EAlHRCublVnTqj0WaU=;
 b=F/jseu57zsLyDS5WAJd8hsfCL6atIFFhj3BHsuLajk8tUNTVnM8rW72puEw5mlT2QQMS
 yiOstAPyz7NkTcJABOkEwywhq44s28R/07qSgjrx0SbpFBHSKZ1ZXfxRDHSHrY8UUKw4
 dyr2eU1EfUjgnsK/Rq1Pjl61Iw3UG15u9bMytP6KCaKdHNNNvAYIDZ5KNIyydh8+DR1H
 UoLD7B2Aq5HQR4fZNxYMRQb5WjScPGs7IIwG8lmJuBSQRTUGC3E/uSWLmpU7ATwamA5b
 xjuoUDrdeXA5cQFPK8Bsz4Sb2kSAkZ5dJ7coTUBSDipfYyVy/SFfEzwsriVWQETJAdO3 lg== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qgett0n8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 22:46:28 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34AMkQbr002522
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 22:46:26 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 10 May 2023 15:46:26 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 10 May 2023 15:45:55 -0700
Subject: [PATCH v8 4/8] drm/msm: Add MSM-specific DSC helper methods
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v8-4-2c9b2bb1209c@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v8-0-2c9b2bb1209c@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v8-0-2c9b2bb1209c@quicinc.com>
To: <freedreno@lists.freedesktop.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683758785; l=4228;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=qJVxitfbkHbdvMld2FiuuIDJNiOh2OKt8bd0OjQL9iQ=;
 b=I28c5Btu6VmTIaB5HNs2yXTSmCSPoJOGdf9GafNX3GeVeAPsz7kDDFSYen1Ir4hjUVrcHaKlC
 Wz5Jcau6BjTCwT5FOfuuJUSTfz4XJQVN/aHIO/EVGl/GQubzSvd3X+f
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: kvxMvtX1q78exqN6151fdR3TfpXjobSQ
X-Proofpoint-GUID: kvxMvtX1q78exqN6151fdR3TfpXjobSQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=561
 priorityscore=1501 bulkscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305100188
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/Makefile         |  1 +
 drivers/gpu/drm/msm/msm_dsc_helper.c | 26 ++++++++++++++
 drivers/gpu/drm/msm/msm_dsc_helper.h | 69 ++++++++++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 7274c41228ed..b814fc80e2d5 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -94,6 +94,7 @@ msm-y += \
 	msm_atomic_tracepoints.o \
 	msm_debugfs.o \
 	msm_drv.o \
+	msm_dsc_helper.o \
 	msm_fb.o \
 	msm_fence.o \
 	msm_gem.o \
diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.c b/drivers/gpu/drm/msm/msm_dsc_helper.c
new file mode 100644
index 000000000000..094decad9aea
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_dsc_helper.c
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
+ */
+
+#include <linux/kernel.h>
+#include <drm/drm_fixed.h>
+
+#include "msm_dsc_helper.h"
+
+s64 msm_dsc_get_bytes_per_slice(struct drm_dsc_config *dsc)
+{
+	return drm_fixp_from_fraction(dsc->slice_width * msm_dsc_get_bpp_int(dsc), 8);
+}
+
+u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int intf_width)
+{
+	u32 bytes_per_slice;
+	s64 bytes_per_slice_fp;
+	int slice_per_intf = msm_dsc_get_slice_per_intf(dsc, intf_width);
+
+	bytes_per_slice_fp = msm_dsc_get_bytes_per_slice(dsc);
+	bytes_per_slice = drm_fixp2int_ceil(bytes_per_slice_fp);
+
+	return bytes_per_slice * slice_per_intf;
+}
diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h b/drivers/gpu/drm/msm/msm_dsc_helper.h
new file mode 100644
index 000000000000..ed88905c15e5
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
@@ -0,0 +1,69 @@
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
+	return dsc->slice_count * dsc->slice_width;
+}
+
+/**
+ * msm_dsc_get_bytes_per_slice() - get size of each slice for dsc
+ * @dsc: Pointer to drm dsc config struct
+ * Returns: s31.32 fixed point value representing bytes per slice
+ */
+s64 msm_dsc_get_bytes_per_slice(struct drm_dsc_config *dsc);
+
+/**
+ * msm_dsc_get_bytes_per_intf() - get total bytes per interface
+ * @dsc: Pointer to drm dsc config struct
+ * @intf_width: interface width
+ * Returns: u32 value representing bytes per interface
+ */
+u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int intf_width);
+
+#endif /* MSM_DSC_HELPER_H_ */

-- 
2.40.1

