Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACA56FE7B4
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 00:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6B810E57A;
	Wed, 10 May 2023 22:55:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDCF510E505;
 Wed, 10 May 2023 22:55:06 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34AMbLLZ012037; Wed, 10 May 2023 22:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=wG+as9Xgw2fFv6Qn9n2jZ1f9sBz5/YL+VdtPjpESmLU=;
 b=ZaOZKPbH1yMzI9dPS774p+UUGJ6B3RT4gvtNyH6BkyWaYuGA4XayRhK+ojb7qFRQlwA7
 3YxdYm12a2Xrd2fuClxN69cEGcLU6N5gRtgtS6fQB/qmnS31JDxjsIO5bfzqk8B42iEd
 iF8jdXf0vR/qaFBXgmXzn7fYgt/Z3z1xpIC2I0kkft4jnU9jYrnaOWA2j12Pk10M8Axc
 fCG7QgENl1K3UH0lGKiy/V2USgDakaCOHtGFGmI2v4lbwGbNzigcIuSO9yU82ZSAV484
 5IIro579t5kxofKHz6KIeWUGmXs7UXdaImDCbH0DMyeCEIZ+HR3eF3lDcOvG/WrW2I/A /Q== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qg6u0hrh1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 22:55:04 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34AMt34B025209
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 22:55:03 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 10 May 2023 15:55:03 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 10 May 2023 15:54:44 -0700
Subject: [PATCH v9 4/8] drm/msm: Add MSM-specific DSC helper methods
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v9-4-87daeaec2c0a@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v9-0-87daeaec2c0a@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v9-0-87daeaec2c0a@quicinc.com>
To: <freedreno@lists.freedesktop.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683759301; l=4172;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=/6ZjMacy8jnzvxbS8yIIIpJbjJM3nTe6c1TmQ0SOLII=;
 b=FrjKZINgV3vjCTCDqepNqpZBadjHZEUf+yu8KllDNlTh5bV+jBbLn0uciPtftq7OTam6TN5z6
 +5DtS99zWSUA0HplDtegSdmZKODNPskSxcQTSiCCGN2DlAJT04Wkg07
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: LBSnBIiv2Wcba5gxZm15-7o7Sb2CoYjw
X-Proofpoint-ORIG-GUID: LBSnBIiv2Wcba5gxZm15-7o7Sb2CoYjw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=608 clxscore=1015 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305100190
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
index 000000000000..ba4c57df9f66
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
+	return dsc->slice_count * dsc->slice_chunk_size;
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

