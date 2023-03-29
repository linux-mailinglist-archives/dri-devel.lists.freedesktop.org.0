Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB826CF6DF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 01:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458F310E18A;
	Wed, 29 Mar 2023 23:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890CD10E1BA;
 Wed, 29 Mar 2023 23:19:27 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32THDVOo006128; Wed, 29 Mar 2023 23:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=j15usScBQESYMAtRZ+Li6e+o6ZJ5/XWE60NMK2JN7kg=;
 b=QAbeXSVtsZXd0KCl8pPD2vrOTXylzu9wUPdEMjO/5SDJ/Yk+XHysnGwB06VKnLYfJnZl
 FymrAPEDClnCILfQhfHjzLvc0NJW23f3fzY+ltzsxeyG6v/9eoPM5exDXhlig/RWK26Q
 awHQNYdnqZsX4fkfyE5upTZRmCBaUNNni2Hd2c8izQSeOvzwQJwlFMvuU6rYf+PUv+Op
 9lgV+I2WsX0zmDrCLRe9cWSOeKEJ7mTSuDlzT6Qrf6UzXTyr9Sl8sDHIZvmywXXrkz5H
 Vguc79F9e4Fu/9KuJxajKUllrzC/d7x99RjrBP7e8Jb86t/VaIKaMWcKzG9ZR+1CpfK0 TQ== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pmq959bve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Mar 2023 23:19:25 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32TNJOR7020011
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Mar 2023 23:19:24 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 29 Mar 2023 16:19:24 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 29 Mar 2023 16:18:47 -0700
Subject: [PATCH RFC 2/5] drm/msm: Add MSM-specific DSC helper methods
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v1-2-f3e479f59b6d@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
To: <freedreno@lists.freedesktop.org>
X-Mailer: b4 0.13-dev-00303
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680131963; l=4509;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=F7DeXx14VaJNxs0fW4oVoxv7B5m8Awn++2HoKAaMagA=;
 b=1xxeNYDEYrvFd4ADKbDA91VsrkIw0ApkUG59spQt28qP1tV3ogeaLMI09FPzegzo2MYGWOkNu
 nCUZtR3hN/NCFwwnQLkLuWsW7S5rLS4BefS48PRlVGzZRcUZHaftbNK
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _keyx5imFAkjea-UAoWoLx6kFk1j2hMD
X-Proofpoint-ORIG-GUID: _keyx5imFAkjea-UAoWoLx6kFk1j2hMD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_14,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=614 adultscore=0 spamscore=0
 impostorscore=0 phishscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303290174
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

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/Makefile              |  1 +
 drivers/gpu/drm/msm/disp/msm_dsc_helper.c | 74 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/msm_dsc_helper.h | 28 ++++++++++++
 3 files changed, 103 insertions(+)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 7274c41228ed..897a5b1c88f6 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -90,6 +90,7 @@ msm-y += \
 	disp/mdp_kms.o \
 	disp/msm_disp_snapshot.o \
 	disp/msm_disp_snapshot_util.o \
+	disp/msm_dsc_helper.o \
 	msm_atomic.o \
 	msm_atomic_tracepoints.o \
 	msm_debugfs.o \
diff --git a/drivers/gpu/drm/msm/disp/msm_dsc_helper.c b/drivers/gpu/drm/msm/disp/msm_dsc_helper.c
new file mode 100644
index 000000000000..ec15c0d829e8
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/msm_dsc_helper.c
@@ -0,0 +1,74 @@
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
+static int get_comp_ratio(struct drm_dsc_config *dsc, u32 src_bpp)
+{
+	return mult_frac(100, src_bpp, DSC_BPP(*dsc));
+}
+
+static s64 get_bytes_per_soft_slice(struct drm_dsc_config *dsc, int intf_width, int comp_ratio)
+{
+	s64 comp_ratio_fp, num_bits_fp;
+	s64 numerator_fp, denominator_fp;
+
+	comp_ratio_fp = drm_fixp_from_fraction(comp_ratio, 100);
+	num_bits_fp = drm_fixp_from_fraction(8, 1);
+
+	numerator_fp = drm_fixp_from_fraction(dsc->slice_width * dsc->bits_per_component * 3, 1);
+	denominator_fp = drm_fixp_mul(comp_ratio_fp, num_bits_fp);
+
+	return drm_fixp_div(numerator_fp, denominator_fp);
+}
+
+u32 msm_dsc_get_eol_byte_num(struct drm_dsc_config *dsc, int intf_width, u32 src_bpp)
+{
+	u32 bytes_per_ss, extra_eol_bytes, bytes_per_intf;
+	s64 bytes_per_ss_fp;
+	int slice_per_intf = msm_dsc_get_slice_per_intf(dsc, intf_width);
+	int comp_ratio = get_comp_ratio(dsc, src_bpp);
+
+	bytes_per_ss_fp = get_bytes_per_soft_slice(dsc, intf_width, comp_ratio);
+	bytes_per_ss = drm_fixp2int_ceil(bytes_per_ss_fp);
+
+	bytes_per_intf = bytes_per_ss * slice_per_intf;
+	extra_eol_bytes = bytes_per_intf % 3;
+	if (extra_eol_bytes != 0)
+		extra_eol_bytes = 3 - extra_eol_bytes;
+
+	return extra_eol_bytes;
+}
+
+u32 msm_dsc_get_dce_bytes_per_line(struct drm_dsc_config *dsc, int intf_width)
+{
+	u32 bpp;
+	u32 dce_bytes_per_line;
+
+	bpp = DSC_BPP(*dsc);
+	dce_bytes_per_line = DIV_ROUND_UP(dsc->bits_per_pixel * intf_width, 8);
+
+	return dce_bytes_per_line;
+}
+
+int msm_dsc_get_pclk_per_line(struct drm_dsc_config *dsc, int intf_width, u32 src_bpp)
+{
+	s64 data_width;
+	int comp_ratio = get_comp_ratio(dsc, src_bpp);
+
+	if (!dsc->slice_width || (intf_width < dsc->slice_width))
+		return -EINVAL;
+
+	data_width = get_bytes_per_soft_slice(dsc, intf_width, comp_ratio);
+	data_width = drm_fixp_mul(dsc->slice_count, data_width);
+	data_width = drm_fixp_from_fraction(data_width, 3);
+
+	return drm_fixp2int_ceil(data_width);
+}
diff --git a/drivers/gpu/drm/msm/disp/msm_dsc_helper.h b/drivers/gpu/drm/msm/disp/msm_dsc_helper.h
new file mode 100644
index 000000000000..308069b2b5a4
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/msm_dsc_helper.h
@@ -0,0 +1,28 @@
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
+#define MSM_DSC_SLICE_PER_PKT 1
+#define DSC_BPP(config) ((config).bits_per_pixel >> 4)
+
+static inline int msm_dsc_get_slice_per_intf(struct drm_dsc_config *dsc, int intf_width)
+{
+	return DIV_ROUND_UP(intf_width, dsc->slice_width);
+}
+
+u32 msm_dsc_get_eol_byte_num(struct drm_dsc_config *dsc, int intf_width, u32 src_bpp);
+u32 msm_dsc_get_dce_bytes_per_line(struct drm_dsc_config *dsc, int intf_width);
+int msm_dsc_get_pclk_per_line(struct drm_dsc_config *dsc, int intf_width, u32 src_bpp);
+#endif /* MSM_DSC_HELPER_H_ */

-- 
2.39.2

