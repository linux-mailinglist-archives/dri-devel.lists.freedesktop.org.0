Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9E5678499
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 19:25:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0E110E532;
	Mon, 23 Jan 2023 18:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44D110E530;
 Mon, 23 Jan 2023 18:24:54 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30NIISl6011275; Mon, 23 Jan 2023 18:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=y+RfEs0k8NwyXKD0GxAMIya7VYmGo8VrBVACPQrby80=;
 b=GXtgvqukS52Hh9XYRSwpveAVylbpDkCtNmShjq55LCRgtC1pzR42KLy3ALMGJtZJXOn4
 13q8vw0OERcmTq13WM73NsDJAX2WR477rP2aRaxf2FREYtWSzByaADnxAchW/cN7LcYn
 /sr29OLy4azqZtOIKOAk8kmMc+Typz99Y8XJtrKF2+qSplSlPyJ0KMV/ofocWQZC7dS9
 /Ws+O4x8Bt5M3c+XeoVAeQ2/mvOyjRySP7LQVLhlcE4Fqip4SVxBYGjlgFQ2T27Wq02X
 FA8Rq0R0ZdPZiFshNODwg+1TcEnEGxDLy6zBP5DxgQIyT8FdHuA9zDuBNVs6GreUr6qF zw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n89frbjqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 18:24:49 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30NIOlZH032120
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 18:24:47 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 23 Jan 2023 10:24:47 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v1 01/14] drm/msm/dp: add dpcd read of both dsc and fec
 capability
Date: Mon, 23 Jan 2023 10:24:21 -0800
Message-ID: <1674498274-6010-2-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: -eDpfJdhO9VPU8vI9xmsNbUYFChoYIny
X-Proofpoint-GUID: -eDpfJdhO9VPU8vI9xmsNbUYFChoYIny
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301230176
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

FEC is pre-requirement of DSC. Therefore FEC has to be enabled
before DSC enabled. This patch add functions to read sink's DSC
and FEC related DPCD and decode them and set enable flags
accordingly.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 91 ++++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_panel.h | 20 ++++++++-
 2 files changed, 109 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 1800d89..5078247 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -1,14 +1,18 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2012-2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023. Qualcomm Innovation Center, Inc. All rights reserved
  */
 
 #include "dp_panel.h"
 
+#include <drm/drm_fixed.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_print.h>
 
+#define DSC_TGT_BPP 8
+
 struct dp_panel_private {
 	struct device *dev;
 	struct drm_device *drm_dev;
@@ -68,6 +72,9 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
 		goto end;
 	}
 
+	print_hex_dump_debug("[drm-dp] SINK DPCD: ",
+		DUMP_PREFIX_NONE, 8, 1, dp_panel->dpcd, rlen, false);
+
 	link_info->revision = dpcd[DP_DPCD_REV];
 	major = (link_info->revision >> 4) & 0x0f;
 	minor = link_info->revision & 0x0f;
@@ -154,6 +161,83 @@ static int dp_panel_update_modes(struct drm_connector *connector,
 	return rc;
 }
 
+static void dp_panel_decode_dsc_dpcd(struct dp_panel *dp_panel)
+{
+	if (dp_panel->dsc_dpcd[0]) {
+		dp_panel->sink_dsc_caps.dsc_capable = true;
+		dp_panel->sink_dsc_caps.version = dp_panel->dsc_dpcd[1];
+		dp_panel->sink_dsc_caps.block_pred_en =
+				dp_panel->dsc_dpcd[6] ? true : false;
+		dp_panel->sink_dsc_caps.color_depth =
+				dp_panel->dsc_dpcd[10];
+
+		if (dp_panel->sink_dsc_caps.version >= 0x11)
+			dp_panel->dsc_en = true;
+	} else {
+		dp_panel->sink_dsc_caps.dsc_capable = false;
+		dp_panel->dsc_en = false;
+	}
+}
+
+static void dp_panel_read_sink_dsc_caps(struct dp_panel *dp_panel)
+{
+	int rlen;
+	struct dp_panel_private *panel;
+	int dpcd_rev;
+
+	if (!dp_panel) {
+		DRM_ERROR("invalid input\n");
+		return;
+	}
+
+	dpcd_rev = dp_panel->dpcd[DP_DPCD_REV];
+
+	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
+	if (dpcd_rev >= 0x14) {
+		rlen = drm_dp_dpcd_read(panel->aux, DP_DSC_SUPPORT,
+			dp_panel->dsc_dpcd, (DP_DSC_RECEIVER_CAP_SIZE + 1));
+		if (rlen < (DP_DSC_RECEIVER_CAP_SIZE + 1)) {
+			drm_dbg_dp(panel->drm_dev, "dsc dpcd read failed, rlen=%d\n", rlen);
+			return;
+		}
+
+		print_hex_dump_debug("[drm-dp] SINK DSC DPCD: ",
+			DUMP_PREFIX_NONE, 8, 1, dp_panel->dsc_dpcd, rlen, false);
+
+		dp_panel_decode_dsc_dpcd(dp_panel);
+	}
+}
+
+static void dp_panel_read_sink_fec_caps(struct dp_panel *dp_panel)
+{
+	int rlen;
+	struct dp_panel_private *panel;
+	s64 fec_overhead_fp = drm_fixp_from_fraction(1, 1);
+
+	if (!dp_panel) {
+		DRM_ERROR("invalid input\n");
+		return;
+	}
+
+	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
+	rlen = drm_dp_dpcd_readb(panel->aux, DP_FEC_CAPABILITY,
+			&dp_panel->fec_dpcd);
+	if (rlen < 1) {
+		DRM_ERROR("fec capability read failed, rlen=%d\n", rlen);
+		return;
+	}
+
+	print_hex_dump_debug("[drm-dp] SINK FEC DPCD: ",
+		DUMP_PREFIX_NONE, 8, 1, &dp_panel->fec_dpcd, rlen, false);
+
+	dp_panel->fec_en = dp_panel->fec_dpcd & DP_FEC_CAPABLE;
+
+	if (dp_panel->fec_en)
+		fec_overhead_fp = drm_fixp_from_fraction(100000, 97582);
+
+	dp_panel->fec_overhead_fp = fec_overhead_fp;
+}
+
 int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 	struct drm_connector *connector)
 {
@@ -224,6 +308,11 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 		}
 		panel->aux_cfg_update_done = false;
 	}
+
+	dp_panel_read_sink_fec_caps(dp_panel);
+
+	if (dp_panel->fec_en)
+		dp_panel_read_sink_dsc_caps(dp_panel);
 end:
 	return rc;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index f04d021..fb30b92 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2012-2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023. Qualcomm Innovation Center, Inc. All rights reserved
  */
 
 #ifndef _DP_PANEL_H_
@@ -11,6 +12,7 @@
 #include "dp_aux.h"
 #include "dp_link.h"
 #include "dp_hpd.h"
+#include "msm_drv.h"
 
 struct edid;
 
@@ -34,12 +36,21 @@ struct dp_panel_in {
 	struct dp_catalog *catalog;
 };
 
+struct dp_dsc_caps {
+	bool dsc_capable;
+	u8 version;
+	bool block_pred_en;
+	u8 color_depth;
+};
+
 struct dp_panel {
 	/* dpcd raw data */
 	u8 dpcd[DP_RECEIVER_CAP_SIZE + 1];
 	u8 ds_cap_info[DP_DOWNSTREAM_PORTS * DP_DOWNSTREAM_CAP_SIZE];
 	u32 ds_port_cnt;
 	u32 dfp_present;
+	u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE + 1];
+	u8 fec_dpcd;
 
 	struct dp_link_info link_info;
 	struct drm_dp_desc desc;
@@ -53,6 +64,13 @@ struct dp_panel {
 	u32 max_dp_link_rate;
 
 	u32 max_bw_code;
+
+	struct dp_dsc_caps sink_dsc_caps;
+	bool dsc_feature_enable;
+	bool fec_feature_enable;
+	bool dsc_en;
+	bool fec_en;
+	s64 fec_overhead_fp;
 };
 
 int dp_panel_init_panel_info(struct dp_panel *dp_panel);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

