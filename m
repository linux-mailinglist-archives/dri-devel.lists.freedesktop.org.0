Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 568178501F5
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 02:53:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101C91120DD;
	Sat, 10 Feb 2024 01:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="a9MjRpVY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A2A10FD64;
 Sat, 10 Feb 2024 01:52:49 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41A1d5rc026742; Sat, 10 Feb 2024 01:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=nr0AL24UQf6YqPBk11iT76lqaEDyY8NJ4EBGUeYByqk=; b=a9
 MjRpVYtOu0O+AObypAfJTjUDI/fU7Uq1D/HWw+De0RwzLx/rk5AYMtUVZMFVznHS
 aAu/i3gzsXhPMVHIlT3BUiaOCOe5pRaMQgJfkM7NUPsFveAT40+ftD3Gyfn2YSFP
 5E7tq7uBFIZk7Z+hm52w7OKNVgOlu7dZNEc96lZWV5ewn1a/wJ/TD3ucvK4jYk4w
 Vx1ClPPJxUO3M3AlV5oOMqaVQOoJcFKuZ02BtHrJOZZ1TfvLWIIfDXxlTJaUc4on
 mimKoPlUX/Ejn6OWGHw0OiDq4KY/c4C71Fw+J2BFHfGVygRSgevtx0+rymE6ZZTT
 bjGu3P6nNcyCKpwr2M+A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w5u4brfbx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Feb 2024 01:52:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41A1qkQH029111
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Feb 2024 01:52:46 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 9 Feb 2024 17:52:45 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
 <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
 <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v2 12/19] drm/msm/dp: move parity calculation to dp_utils
Date: Fri, 9 Feb 2024 17:52:03 -0800
Message-ID: <20240210015223.24670-13-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240210015223.24670-1-quic_parellan@quicinc.com>
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: AfDy6RnsbbVGqJl8m-3YQaGEAKd3e6CV
X-Proofpoint-GUID: AfDy6RnsbbVGqJl8m-3YQaGEAKd3e6CV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-10_02,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402100013
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

Parity calculation is necessary for VSC SDP implementation. Therefore
create new files dp_utils.c and dp_utils.h and move the parity
calculating functions here. This ensures that they are usable by SDP
programming in both dp_catalog.c and dp_audio.c

Changes in v2:
	- Create new files dp_utils.c and dp_utils.h
	- Move the parity calculation to these new files instead of
	  having them in dp_catalog.c and dp_catalog.h

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 drivers/gpu/drm/msm/Makefile      |   3 +-
 drivers/gpu/drm/msm/dp/dp_audio.c | 101 +++++-------------------------
 drivers/gpu/drm/msm/dp/dp_utils.c |  71 +++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_utils.h |  22 +++++++
 4 files changed, 110 insertions(+), 87 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_utils.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_utils.h

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index b1173128b5b97..998b155e4a979 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -129,7 +129,8 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_panel.o \
 	dp/dp_parser.o \
 	dp/dp_power.o \
-	dp/dp_audio.o
+	dp/dp_audio.o \
+	dp/dp_utils.o
 
 msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
 
diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 4a2e479723a85..7634e4b742084 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -15,13 +15,7 @@
 #include "dp_audio.h"
 #include "dp_panel.h"
 #include "dp_display.h"
-
-#define HEADER_BYTE_2_BIT	 0
-#define PARITY_BYTE_2_BIT	 8
-#define HEADER_BYTE_1_BIT	16
-#define PARITY_BYTE_1_BIT	24
-#define HEADER_BYTE_3_BIT	16
-#define PARITY_BYTE_3_BIT	24
+#include "dp_utils.h"
 
 struct dp_audio_private {
 	struct platform_device *audio_pdev;
@@ -36,71 +30,6 @@ struct dp_audio_private {
 	struct dp_audio dp_audio;
 };
 
-static u8 dp_audio_get_g0_value(u8 data)
-{
-	u8 c[4];
-	u8 g[4];
-	u8 ret_data = 0;
-	u8 i;
-
-	for (i = 0; i < 4; i++)
-		c[i] = (data >> i) & 0x01;
-
-	g[0] = c[3];
-	g[1] = c[0] ^ c[3];
-	g[2] = c[1];
-	g[3] = c[2];
-
-	for (i = 0; i < 4; i++)
-		ret_data = ((g[i] & 0x01) << i) | ret_data;
-
-	return ret_data;
-}
-
-static u8 dp_audio_get_g1_value(u8 data)
-{
-	u8 c[4];
-	u8 g[4];
-	u8 ret_data = 0;
-	u8 i;
-
-	for (i = 0; i < 4; i++)
-		c[i] = (data >> i) & 0x01;
-
-	g[0] = c[0] ^ c[3];
-	g[1] = c[0] ^ c[1] ^ c[3];
-	g[2] = c[1] ^ c[2];
-	g[3] = c[2] ^ c[3];
-
-	for (i = 0; i < 4; i++)
-		ret_data = ((g[i] & 0x01) << i) | ret_data;
-
-	return ret_data;
-}
-
-static u8 dp_audio_calculate_parity(u32 data)
-{
-	u8 x0 = 0;
-	u8 x1 = 0;
-	u8 ci = 0;
-	u8 iData = 0;
-	u8 i = 0;
-	u8 parity_byte;
-	u8 num_byte = (data & 0xFF00) > 0 ? 8 : 2;
-
-	for (i = 0; i < num_byte; i++) {
-		iData = (data >> i*4) & 0xF;
-
-		ci = iData ^ x1;
-		x1 = x0 ^ dp_audio_get_g1_value(ci);
-		x0 = dp_audio_get_g0_value(ci);
-	}
-
-	parity_byte = x1 | (x0 << 4);
-
-	return parity_byte;
-}
-
 static u32 dp_audio_get_header(struct dp_catalog *catalog,
 		enum dp_catalog_audio_sdp_type sdp,
 		enum dp_catalog_audio_header_type header)
@@ -134,7 +63,7 @@ static void dp_audio_stream_sdp(struct dp_audio_private *audio)
 			DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_1);
 
 	new_value = 0x02;
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_1_BIT)
 			| (parity_byte << PARITY_BYTE_1_BIT));
 	drm_dbg_dp(audio->drm_dev,
@@ -147,7 +76,7 @@ static void dp_audio_stream_sdp(struct dp_audio_private *audio)
 	value = dp_audio_get_header(catalog,
 			DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_2);
 	new_value = value;
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_2_BIT)
 			| (parity_byte << PARITY_BYTE_2_BIT));
 	drm_dbg_dp(audio->drm_dev,
@@ -162,7 +91,7 @@ static void dp_audio_stream_sdp(struct dp_audio_private *audio)
 			DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_3);
 
 	new_value = audio->channels - 1;
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_3_BIT)
 			| (parity_byte << PARITY_BYTE_3_BIT));
 	drm_dbg_dp(audio->drm_dev,
@@ -184,7 +113,7 @@ static void dp_audio_timestamp_sdp(struct dp_audio_private *audio)
 			DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_1);
 
 	new_value = 0x1;
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_1_BIT)
 			| (parity_byte << PARITY_BYTE_1_BIT));
 	drm_dbg_dp(audio->drm_dev,
@@ -198,7 +127,7 @@ static void dp_audio_timestamp_sdp(struct dp_audio_private *audio)
 			DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_2);
 
 	new_value = 0x17;
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_2_BIT)
 			| (parity_byte << PARITY_BYTE_2_BIT));
 	drm_dbg_dp(audio->drm_dev,
@@ -212,7 +141,7 @@ static void dp_audio_timestamp_sdp(struct dp_audio_private *audio)
 			DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_3);
 
 	new_value = (0x0 | (0x11 << 2));
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_3_BIT)
 			| (parity_byte << PARITY_BYTE_3_BIT));
 	drm_dbg_dp(audio->drm_dev,
@@ -233,7 +162,7 @@ static void dp_audio_infoframe_sdp(struct dp_audio_private *audio)
 			DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_1);
 
 	new_value = 0x84;
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_1_BIT)
 			| (parity_byte << PARITY_BYTE_1_BIT));
 	drm_dbg_dp(audio->drm_dev,
@@ -247,7 +176,7 @@ static void dp_audio_infoframe_sdp(struct dp_audio_private *audio)
 			DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_2);
 
 	new_value = 0x1b;
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_2_BIT)
 			| (parity_byte << PARITY_BYTE_2_BIT));
 	drm_dbg_dp(audio->drm_dev,
@@ -261,7 +190,7 @@ static void dp_audio_infoframe_sdp(struct dp_audio_private *audio)
 			DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_3);
 
 	new_value = (0x0 | (0x11 << 2));
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_3_BIT)
 			| (parity_byte << PARITY_BYTE_3_BIT));
 	drm_dbg_dp(audio->drm_dev,
@@ -282,7 +211,7 @@ static void dp_audio_copy_management_sdp(struct dp_audio_private *audio)
 			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_1);
 
 	new_value = 0x05;
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_1_BIT)
 			| (parity_byte << PARITY_BYTE_1_BIT));
 	drm_dbg_dp(audio->drm_dev,
@@ -296,7 +225,7 @@ static void dp_audio_copy_management_sdp(struct dp_audio_private *audio)
 			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_2);
 
 	new_value = 0x0F;
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_2_BIT)
 			| (parity_byte << PARITY_BYTE_2_BIT));
 	drm_dbg_dp(audio->drm_dev,
@@ -310,7 +239,7 @@ static void dp_audio_copy_management_sdp(struct dp_audio_private *audio)
 			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_3);
 
 	new_value = 0x0;
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_3_BIT)
 			| (parity_byte << PARITY_BYTE_3_BIT));
 	drm_dbg_dp(audio->drm_dev,
@@ -331,7 +260,7 @@ static void dp_audio_isrc_sdp(struct dp_audio_private *audio)
 			DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_1);
 
 	new_value = 0x06;
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_1_BIT)
 			| (parity_byte << PARITY_BYTE_1_BIT));
 	drm_dbg_dp(audio->drm_dev,
@@ -345,7 +274,7 @@ static void dp_audio_isrc_sdp(struct dp_audio_private *audio)
 			DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_2);
 
 	new_value = 0x0F;
-	parity_byte = dp_audio_calculate_parity(new_value);
+	parity_byte = dp_utils_calculate_parity(new_value);
 	value |= ((new_value << HEADER_BYTE_2_BIT)
 			| (parity_byte << PARITY_BYTE_2_BIT));
 	drm_dbg_dp(audio->drm_dev,
diff --git a/drivers/gpu/drm/msm/dp/dp_utils.c b/drivers/gpu/drm/msm/dp/dp_utils.c
new file mode 100644
index 0000000000000..176d839906cec
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_utils.c
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2024, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/types.h>
+
+u8 dp_utils_get_g0_value(u8 data)
+{
+	u8 c[4];
+	u8 g[4];
+	u8 ret_data = 0;
+	u8 i;
+
+	for (i = 0; i < 4; i++)
+		c[i] = (data >> i) & 0x01;
+
+	g[0] = c[3];
+	g[1] = c[0] ^ c[3];
+	g[2] = c[1];
+	g[3] = c[2];
+
+	for (i = 0; i < 4; i++)
+		ret_data = ((g[i] & 0x01) << i) | ret_data;
+
+	return ret_data;
+}
+
+u8 dp_utils_get_g1_value(u8 data)
+{
+	u8 c[4];
+	u8 g[4];
+	u8 ret_data = 0;
+	u8 i;
+
+	for (i = 0; i < 4; i++)
+		c[i] = (data >> i) & 0x01;
+
+	g[0] = c[0] ^ c[3];
+	g[1] = c[0] ^ c[1] ^ c[3];
+	g[2] = c[1] ^ c[2];
+	g[3] = c[2] ^ c[3];
+
+	for (i = 0; i < 4; i++)
+		ret_data = ((g[i] & 0x01) << i) | ret_data;
+
+	return ret_data;
+}
+
+u8 dp_utils_calculate_parity(u32 data)
+{
+	u8 x0 = 0;
+	u8 x1 = 0;
+	u8 ci = 0;
+	u8 iData = 0;
+	u8 i = 0;
+	u8 parity_byte;
+	u8 num_byte = (data & 0xFF00) > 0 ? 8 : 2;
+
+	for (i = 0; i < num_byte; i++) {
+		iData = (data >> i * 4) & 0xF;
+
+		ci = iData ^ x1;
+		x1 = x0 ^ dp_utils_get_g1_value(ci);
+		x0 = dp_utils_get_g0_value(ci);
+	}
+
+	parity_byte = x1 | (x0 << 4);
+
+	return parity_byte;
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_utils.h b/drivers/gpu/drm/msm/dp/dp_utils.h
new file mode 100644
index 0000000000000..c062e29d07898
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_utils.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2024, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DP_UTILS_H_
+#define _DP_UTILS_H_
+
+#define HEADER_BYTE_0_BIT	 0
+#define PARITY_BYTE_0_BIT	 8
+#define HEADER_BYTE_2_BIT	 0
+#define PARITY_BYTE_2_BIT	 8
+#define HEADER_BYTE_1_BIT	16
+#define PARITY_BYTE_1_BIT	24
+#define HEADER_BYTE_3_BIT	16
+#define PARITY_BYTE_3_BIT	24
+
+u8 dp_utils_get_g0_value(u8 data);
+u8 dp_utils_get_g1_value(u8 data);
+u8 dp_utils_calculate_parity(u32 data);
+
+#endif /* _DP_UTILS_H_ */
-- 
2.39.2

