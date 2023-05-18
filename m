Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A7470774D
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 03:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C770010E4C9;
	Thu, 18 May 2023 01:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2583A10E4C5;
 Thu, 18 May 2023 01:14:46 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34I0jw8O024394; Thu, 18 May 2023 01:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=+L7wFG4Tzz69JJQ1JN4Mpt8Xo3z5UGBNWsMSJa1prMc=;
 b=jU/y5aePjp5xjW08gLN5/U4Kzdl+YSB2qm/g3ZPdCYfe1sg+F6v3plk4nMSL7B8e65+l
 BCb1Z9gVgupzV0Ix+AO0zLAyTJk1yROxFmE4CJxX/f5BGzP4F0c1NR+thZVYYFTs+pr6
 iz561AyL1isqFRjZ0YPkKRqtsKkj+u8WU8RCt0Wk5zylsNoHPixCm7au8gq7ao5X58hZ
 z5DreSo7w9RNN/IN/BUg8idSOiestUCGBqYU0zEZ3rUcMWDVW5wNd5XgdjCzSb6ExmBE
 Xltr3yCSg9m5pn4ohgdQzz9S5xMSRvFF5lBN9i9ZDm5Hv/dEWOjiAGczxvZpJ7vlUJEU bw== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qn8d2g4y9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 May 2023 01:14:44 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34I1EeZ6003088
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 May 2023 01:14:40 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 17 May 2023 18:14:39 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 17 May 2023 18:14:31 -0700
Subject: [PATCH v13 5/9] drm/msm: Add MSM-specific DSC helper methods
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230329-rfc-msm-dsc-helper-v13-5-d7581e7becec@quicinc.com>
References: <20230329-rfc-msm-dsc-helper-v13-0-d7581e7becec@quicinc.com>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v13-0-d7581e7becec@quicinc.com>
To: <freedreno@lists.freedesktop.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684372478; l=1855;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=lycV0MMWOtBXx+TtD6K4/nyr/SKxJPC9IHcAguagUkI=;
 b=r3KT0TRgcB72cb1iUifG1ckOXXy3LzbzjFG2WU6vCwqGljLGvDIctwnhfwW2ANue9iEAZv9DG
 HDlC032+wIjAUF/VqrkjAwZYzgYtgNlT9jvDHXRDB8kctJEX1hHNo5D
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 9whZXBDioU2id3drjbprW135arCmQ92m
X-Proofpoint-GUID: 9whZXBDioU2id3drjbprW135arCmQ92m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_04,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 malwarescore=0 mlxlogscore=621 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305180005
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
 drivers/gpu/drm/msm/msm_dsc_helper.h | 38 ++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_dsc_helper.h b/drivers/gpu/drm/msm/msm_dsc_helper.h
new file mode 100644
index 000000000000..b9049fe1e279
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_dsc_helper.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved
+ *
+ * Helper methods for MSM-specific DSC calculations that are common between timing engine,
+ * DSI, and DP.
+ */
+
+#ifndef MSM_DSC_HELPER_H_
+#define MSM_DSC_HELPER_H_
+
+#include <linux/math.h>
+#include <drm/display/drm_dsc_helper.h>
+
+/**
+ * msm_dsc_get_slices_per_intf() - calculate number of slices per interface
+ * @dsc: Pointer to drm dsc config struct
+ * @intf_width: interface width in pixels
+ * Returns: Integer representing the number of slices for the given interface
+ */
+static inline u32 msm_dsc_get_slices_per_intf(const struct drm_dsc_config *dsc, u32 intf_width)
+{
+	return DIV_ROUND_UP(intf_width, dsc->slice_width);
+}
+
+/**
+ * msm_dsc_get_bytes_per_line() - calculate bytes per line
+ * @dsc: Pointer to drm dsc config struct
+ * Returns: Integer value representing bytes per line. DSI and DP need
+ *          to perform further calculations to turn this into pclk_per_intf,
+ *          such as dividing by different values depending on if widebus is enabled.
+ */
+static inline u32 msm_dsc_get_bytes_per_line(const struct drm_dsc_config *dsc)
+{
+	return dsc->slice_count * dsc->slice_chunk_size;
+}
+
+#endif /* MSM_DSC_HELPER_H_ */

-- 
2.40.1

