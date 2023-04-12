Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 592D46E0281
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 01:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4998010E9EE;
	Wed, 12 Apr 2023 23:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D38C10E9DE;
 Wed, 12 Apr 2023 23:25:23 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33CNKEDF030355; Wed, 12 Apr 2023 23:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=/dIvniiEBQQPc9upm6WJ2HFrJLaCCf1j5AfxhyyF6F8=;
 b=d3v1xLugx6wZEhQtMCTO/R3SZsY8WZOXQ2wiB7mfj36PB2Wgdk5PyuCB0JbB+86E3tFk
 y00StwI37N3tZXzErDlqM0DdEimjffpZdeGwWOhcIDM2RqJy/Q2cvhHO9u1ed/QSd8Ha
 R+qSdEJeKvzX7pbfE+Eulg06L4naj3wESlN6zn9L+Oq9GKTv5v+xZw7ELUIX5wIvyl0p
 HLlgFO2groXpvlYX0624MX6oosfEYV1QZQf/A55DQlaTY4ifYpSw3euUqNg/qu8+RLvY
 EozU33SB8vJHLmHNybTRXrUnMzkPDfFmRqhSSjV+OCq6hYhuQozCu4DljYhgj5glFt2/ /Q== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pwj7wjkxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Apr 2023 23:25:21 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33CNPKoI007987
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Apr 2023 23:25:20 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 12 Apr 2023 16:25:20 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 12 Apr 2023 16:25:16 -0700
Subject: [PATCH v6 2/7] drm/msm: Add MSM-specific DSC helper methods
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v6-2-cb7f59f0f7fb@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v6-0-cb7f59f0f7fb@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v6-0-cb7f59f0f7fb@quicinc.com>
To: <freedreno@lists.freedesktop.org>
X-Mailer: b4 0.13-dev-00303
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681341919; l=6499;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=Acfj2f30e8zSmvBBPBlg4r0b/7Cqbt6u+bcuEKnezeM=;
 b=7NvTD6bizyvIH//UmrAb9VmfT7iE2qMlq8sXeYSAb9i0IDhfCPiPGnuQfKeNUrvTgH1WAq7mi
 xld6BGSpJ7mAnR7YVvhUEOfLb9dK8KmZ6t1A0xCk+0PLzKFmIY/j2Bf
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _0Tjgq4ig9gzPhFruEhoItmTiksqH7_7
X-Proofpoint-ORIG-GUID: _0Tjgq4ig9gzPhFruEhoItmTiksqH7_7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_12,2023-04-12_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=630 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304120197
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
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce MSM-specific DSC helper methods, as some calculations are
common between DP and DSC.

Changes in v2:
- Moved files up to msm/ directory
- Dropped get_comp_ratio() helper
- Used drm_int2fixp() to convert to integers to fp
- Style changes to improve readability
- Dropped unused bpp variable in msm_dsc_get_dce_bytes_per_line()
- Changed msm_dsc_get_slice_per_intf() to a static inline method
- Dropped last division step of msm_dsc_get_pclk_per_line() and changed
  method name accordingly
- Changed DSC_BPP macro to drm_dsc_get_bpp_int() helper method
- Fixed some math issues caused by passing in incorrect types to
  drm_fixed methods in get_bytes_per_soft_slice()

Changes in v3:
- Dropped src_bpp parameter from all methods -- src_bpp can be
  calculated as dsc->bits_per_component * 3
- Dropped intf_width parameter from get_bytes_per_soft_slice()
- Moved dsc->bits_per_component to numerator calculation in
  get_bytes_per_soft_slice()
- Renamed msm_dsc_get_uncompressed_pclk_per_line to
  *_get_uncompressed_pclk_per_intf()
- Removed dsc->slice_width check from
  msm_dsc_get_uncompressed_pclk_per_intf()
- Made get_bytes_per_soft_slice() a public method (this will be called
  later to help calculate DP pclk params)
- Added documentation in comments
- Moved extra_eol_bytes math out of msm_dsc_get_eol_byte_num() and
  renamed msm_dsc_get_eol_byte_num to *_get_bytes_per_intf.

Changes in v4:
- Changed msm_dsc_get_uncompressed_pclk_per_intf to
  msm_dsc_get_pclk_per_intf

Changes in v5:
- Added extra line at end of msm_dsc_helper.h
- Simplified msm_dsc_get_bytes_per_soft_slice() math
- Simplified and inlined msm_dsc_get_pclk_per_intf() math
- Removed unused headers

Changes in v6:
- Documented return value for all helper functions
- Fixed dependency issue caused by drm_fixed.h being included before
  linux/kernel.h

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/Makefile         |  1 +
 drivers/gpu/drm/msm/msm_dsc_helper.c | 26 ++++++++++++
 drivers/gpu/drm/msm/msm_dsc_helper.h | 81 ++++++++++++++++++++++++++++++++++++
 3 files changed, 108 insertions(+)

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
index 000000000000..29feb3e3b5a4
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
+s64 msm_dsc_get_bytes_per_soft_slice(struct drm_dsc_config *dsc)
+{
+	return drm_fixp_from_fraction(dsc->slice_width * msm_dsc_get_bpp_int(dsc), 8);
+}
+
+u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int intf_width)
+{
+	u32 bytes_per_soft_slice;
+	s64 bytes_per_soft_slice_fp;
+	int slice_per_intf = msm_dsc_get_slice_per_intf(dsc, intf_width);
+
+	bytes_per_soft_slice_fp = msm_dsc_get_bytes_per_soft_slice(dsc);
+	bytes_per_soft_slice = drm_fixp2int_ceil(bytes_per_soft_slice_fp);
+
+	return bytes_per_soft_slice * slice_per_intf;
+}
diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h b/drivers/gpu/drm/msm/msm_dsc_helper.h
new file mode 100644
index 000000000000..ee4f31d11b1c
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
@@ -0,0 +1,81 @@
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
+ * msm_dsc_get_bpp_int - get bits per pixel integer value
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
+ * msm_dsc_get_slice_per_intf - get number of slices per interface
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
+ * msm_dsc_get_dce_bytes_per_line - get bytes per line to help calculate data width
+ *	when configuring the timing engine
+ * @dsc: Pointer to drm dsc config struct
+ * @intf_width: interface width
+ * Returns: u32 value representing the bytes per line
+ */
+static inline u32 msm_dsc_get_dce_bytes_per_line(struct drm_dsc_config *dsc, int intf_width)
+{
+	return DIV_ROUND_UP(msm_dsc_get_bpp_int(dsc) * intf_width, 8);
+}
+
+/**
+ * msm_dsc_get_pclk_per_intf - Calculate pclk per interface.
+ * @dsc: Pointer to drm dsc config struct
+ * Returns: Integer value representing pclk per interface
+ *
+ * Note: This value will then be passed along to DSI and DP for some more
+ * calculations. This is because DSI and DP divide the pclk_per_intf value
+ * by different values depending on if widebus is enabled.
+ */
+static inline int msm_dsc_get_pclk_per_intf(struct drm_dsc_config *dsc)
+{
+	return DIV_ROUND_UP(dsc->slice_width * dsc->slice_count * msm_dsc_get_bpp_int(dsc), 8);
+}
+
+/**
+ * msm_dsc_get_bytes_per_soft_slice - get size of each soft slice for dsc
+ * @dsc: Pointer to drm dsc config struct
+ * Returns: s31.32 fixed point value representing bytes per soft slice
+ */
+s64 msm_dsc_get_bytes_per_soft_slice(struct drm_dsc_config *dsc);
+
+/**
+ * msm_dsc_get_bytes_per_intf - get total bytes per interface
+ * @dsc: Pointer to drm dsc config struct
+ * @intf_width: interface width
+ * Returns: u32 value representing bytes per interface
+ */
+u32 msm_dsc_get_bytes_per_intf(struct drm_dsc_config *dsc, int intf_width);
+
+#endif /* MSM_DSC_HELPER_H_ */

-- 
2.40.0

