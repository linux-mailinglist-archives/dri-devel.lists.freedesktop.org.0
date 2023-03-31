Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BA36D2828
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 20:50:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E6510E538;
	Fri, 31 Mar 2023 18:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7D310E427;
 Fri, 31 Mar 2023 18:49:45 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32VEMHkq019613; Fri, 31 Mar 2023 18:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=/EsyZ1e7/PWP+HeLMFXD1pWwmNHbmV3kVone6pN5zRU=;
 b=RYSF1jJbf488yNtKQuCMtQYq5qEyjh7jKsTh4HJQeQ9GDdGpW6B3o8Bd7pQonn0UVriJ
 j9wkDN2rUwcl+z/Du1H9m+Kl1q2w7iYoFCBSaBR5zNs6WUuBMsbSH033y0XwphmHjmR7
 Y+UWa8WOuKXPrhKx5FMmNmkGc+vi/sn8Rxk48NyC/Rg+ZAKF8mr34fAqgnGDvB+WxeKP
 itLfNV3KOKmnGmHil4YSzcik1rvCIlNSQpZTHJpuVIVD/3uoubdr5+UBX0w1iCQ949Xa
 494AAYjjPjNC20l6rLnh2HDMtZhuivWIM4ZsTqY+SXPuVvNivwm8K29/T/LyXOGoqGdS Ew== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pp178gww9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 18:49:42 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32VInfbc029984
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Mar 2023 18:49:41 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 31 Mar 2023 11:49:41 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 31 Mar 2023 11:49:17 -0700
Subject: [PATCH RFC v2 2/6] drm/msm: Add MSM-specific DSC helper methods
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v2-2-3c13ced536b2@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com>
To: <freedreno@lists.freedesktop.org>
X-Mailer: b4 0.13-dev-00303
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680288580; l=4962;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=u/YixmQK3cVCkpt4fFiytcJvq3Fb87XL/+9SAtOjvaA=;
 b=jtKzpkzgo8DcvEIaAIp8TDb8MnEu5lnugolVtAkQovuL0kD1V5gGuAggj6kF5ReNM5/NfWMuZ
 6oz9P1MCmrLBXePWdZsjO7tQvCgZKtKJ/uSA9+1X5ijVoMUZ3m3ji+0
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: fTrA3zMxilo4yLJuhCFGXV3dFt127ncN
X-Proofpoint-ORIG-GUID: fTrA3zMxilo4yLJuhCFGXV3dFt127ncN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_07,2023-03-31_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=559 impostorscore=0 adultscore=0 mlxscore=0 spamscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303310151
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

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/Makefile         |  1 +
 drivers/gpu/drm/msm/msm_dsc_helper.c | 53 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_dsc_helper.h | 42 ++++++++++++++++++++++++++++
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
index 000000000000..60b73e17e6eb
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_dsc_helper.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
+ */
+
+#include <linux/kernel.h>
+#include <linux/errno.h>
+#include <drm/drm_fixed.h>
+
+#include "msm_drv.h"
+#include "msm_dsc_helper.h"
+
+static s64 get_bytes_per_soft_slice(struct drm_dsc_config *dsc, int intf_width, u32 src_bpp)
+{
+	int bpp = msm_dsc_get_bpp_int(dsc);
+	s64 numerator_fp, denominator_fp;
+	s64 comp_ratio_fp = drm_fixp_from_fraction(src_bpp, bpp);
+
+	numerator_fp = drm_int2fixp(dsc->slice_width * 3);
+	denominator_fp = drm_fixp_from_fraction(comp_ratio_fp * 8, drm_int2fixp(bpp));
+
+	return drm_fixp_div(numerator_fp, denominator_fp);
+}
+
+u32 msm_dsc_get_eol_byte_num(struct drm_dsc_config *dsc, int intf_width, u32 src_bpp)
+{
+	u32 bytes_per_soft_slice, extra_eol_bytes, bytes_per_intf;
+	s64 bytes_per_soft_slice_fp;
+	int slice_per_intf = msm_dsc_get_slice_per_intf(dsc, intf_width);
+
+	bytes_per_soft_slice_fp = get_bytes_per_soft_slice(dsc, intf_width, src_bpp);
+	bytes_per_soft_slice = drm_fixp2int_ceil(bytes_per_soft_slice_fp);
+
+	bytes_per_intf = bytes_per_soft_slice * slice_per_intf;
+	extra_eol_bytes = bytes_per_intf % 3;
+	if (extra_eol_bytes != 0)
+		extra_eol_bytes = 3 - extra_eol_bytes;
+
+	return extra_eol_bytes;
+}
+
+int msm_dsc_get_uncompressed_pclk_per_line(struct drm_dsc_config *dsc, int intf_width, u32 src_bpp)
+{
+	s64 data_width;
+
+	if (!dsc->slice_width || (intf_width < dsc->slice_width))
+		return -EINVAL;
+
+	data_width = drm_fixp_mul(dsc->slice_count,
+			get_bytes_per_soft_slice(dsc, intf_width, src_bpp));
+
+	return drm_fixp2int_ceil(data_width);
+}
diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h b/drivers/gpu/drm/msm/msm_dsc_helper.h
new file mode 100644
index 000000000000..743cd324b7d9
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
+ */
+
+#ifndef MSM_DSC_HELPER_H_
+#define MSM_DSC_HELPER_H_
+
+#include <drm/display/drm_dsc_helper.h>
+#include <drm/drm_modes.h>
+
+/*
+ * Helper methods for MSM specific DSC calculations that are common between timing engine,
+ * DSI, and DP.
+ */
+
+static inline int msm_dsc_get_bpp_int(struct drm_dsc_config *dsc)
+{
+	WARN_ON_ONCE(dsc->bits_per_pixel & 0xf);
+	return dsc->bits_per_pixel >> 4;
+}
+
+static inline int msm_dsc_get_slice_per_intf(struct drm_dsc_config *dsc, int intf_width)
+{
+	return DIV_ROUND_UP(intf_width, dsc->slice_width);
+}
+
+static inline u32 msm_dsc_get_dce_bytes_per_line(struct drm_dsc_config *dsc, int intf_width)
+{
+	return DIV_ROUND_UP(msm_dsc_get_bpp_int(dsc) * intf_width, 8);
+}
+
+u32 msm_dsc_get_eol_byte_num(struct drm_dsc_config *dsc, int intf_width, u32 src_bpp);
+u32 msm_dsc_get_dce_bytes_per_line(struct drm_dsc_config *dsc, int intf_width);
+
+/* Calculate uncompressed pclk per line. This value will then be passed along to
+ * DSI and DP to calculate pclk_per_line. This is because DSI and DP divide the
+ * uncompressed pclk_per_line by different values depending on if widebus is enabled.
+ */
+int msm_dsc_get_uncompressed_pclk_per_line(struct drm_dsc_config *dsc,
+		int intf_width, u32 src_bpp);
+#endif /* MSM_DSC_HELPER_H_ */

-- 
2.39.2

