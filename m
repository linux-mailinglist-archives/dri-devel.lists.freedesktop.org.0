Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C1EAD1D4A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B1210E253;
	Mon,  9 Jun 2025 12:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Lmy6mWQM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1347910E0C2;
 Mon,  9 Jun 2025 12:24:05 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5598Oqsq000718;
 Mon, 9 Jun 2025 12:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jo+6ZvhYLafpcfsIS48hDiZZ6U1aQT9nDVEzeQWUpnI=; b=Lmy6mWQM6zoZFP7g
 9oP4ANw8XX/21T9MZp7HHmUbejD1JasBP5TOQ/jrJ/MuTMnqJTMURPUxc4cNpYo+
 jW+KOSmExhUUH9DnhpyVc3ZV/3HqR02KOGrOTMicN6t9zlxdVm+ySa3T9Ykowtqn
 soxkq/8LwD7rpGlVMhT7beIfWUsP8PHJTJ2RielTSz4YDs9PYrOhRWHFFfmhj5Vj
 V3/WCpJs65SoGf0mbSQZSoJnWbHBI9WIhdCCH1PVkJj3WyOa3n0B2Hs9p7HbZi/B
 Vzd98b9UCVEwLPoWI4yjjVGQ0+46XfRxoRkbO/bw+lhkzdOi+IW3QWgoHeL+W513
 zCb58g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2t8q0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 12:23:59 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559CNwR6016803
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Jun 2025 12:23:58 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:23:54 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:37 +0800
Subject: [PATCH v2 18/38] drm/msm/dp: add support for mst channel slot
 allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-msm-dp-mst-v2-18-a54d8902a23d@quicinc.com>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
In-Reply-To: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Yongxing Mou" <quic_yongmou@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471757; l=17973;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=M5xKecfDxcpTXvYcpNU/KybrEbMo5Wt6LQ5lJZyB7NM=;
 b=+ox+f4m55lcDoK0doH32MUGpUCLKhfbx7mo0txbQPUo7wcjM8vFVyf/RLSYuQOZZcWcvSHI+T
 cnoA0m8C3d8As8U91pLC7IxJhW4cecNEOUz3vU7eSPzSaugePxIMd/K
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: C0IMhdwnQcm6EZnq3tYmgTv-drGTyVfI
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=6846d25f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=z30a78qW5uUxn0NBRZoA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: C0IMhdwnQcm6EZnq3tYmgTv-drGTyVfI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MyBTYWx0ZWRfXzosynz3/GjMf
 6yvOGC2PaB4hscYLsKAjTnZdSo1V9BLGOSTP7c34DF4s0N2TIKlEjRC1fR49H2jmx3rC/71IAbl
 GxoggkC7qk/QenoDtm4qtc8t9NvridVCtzFL2vnH/uc2PzFqSv/2gsrfjK6ndn+v420h/xZmG7t
 KVV/GzX/QyEheHQQ09g64An++Tk/t7kjcrGf9vVmk6C4e6p+4nC03YRxbug3LGKCya79hbJh0Gj
 Mvcfbr7knmRcCxfHi9tLsLU21JwVxprRWKOahSS7I9YovtXfgtM60fv/LWQmrRniS8hBDbepgtl
 mTMV/oqpktJ5vwJ0zojMlPaLSk9aCSVIMut0E3VEv8PfCbhztduxSIh9rPUxKSuoddW4S1wDkQO
 2XffSSAqzIwxo9BZ2oXvqjBE20PMwV46WRkQw8538+Ul0njq7lXFRvsqcGDq6YQsKNTAOWKz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090093
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

For DP MST streams, the 64 MTP slots are time-shared between
the streams. Add the support to calculate the rate governor,
slots and reservation of the slots to the DP controller. Each
DP MST stream shall reserve its streams by calling the
dp_display_set_stream_info() from its bridge calls.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c |  88 +++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h |   8 ++
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 148 ++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   7 +-
 drivers/gpu/drm/msm/dp/dp_display.c |  28 +++++--
 drivers/gpu/drm/msm/dp/dp_display.h |   5 +-
 drivers/gpu/drm/msm/dp/dp_panel.h   |   2 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |  11 +++
 8 files changed, 283 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index ff0fb742d122646dd45fcd868a61532c630419d1..baa3a93a9bb3109c3110503e4d1dc1f6e3cdc2f8 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -1169,6 +1169,94 @@ bool msm_dp_catalog_read_act_complete_sts(struct msm_dp_catalog *msm_dp_catalog)
 	return msm_dp_read_link(catalog, REG_DP_MST_ACT);
 }
 
+void msm_dp_catalog_mst_channel_alloc(struct msm_dp_catalog *msm_dp_catalog,
+				      enum msm_dp_stream_id stream_id, u32 ch_start_slot,
+				      u32 tot_slot_cnt)
+{
+	struct msm_dp_catalog_private *catalog;
+	u32 i, slot_reg_1, slot_reg_2, slot;
+	u32 reg_off = 0;
+	int const num_slots_per_reg = 32;
+
+	if (!msm_dp_catalog || stream_id >= DP_STREAM_MAX) {
+		DRM_ERROR("invalid input. stream_id %d\n", stream_id);
+		return;
+	}
+
+	if (ch_start_slot > DP_MAX_TIME_SLOTS ||
+	    (ch_start_slot + tot_slot_cnt > DP_MAX_TIME_SLOTS)) {
+		DRM_ERROR("invalid slots start %d, tot %d\n",
+			  ch_start_slot, tot_slot_cnt);
+		return;
+	}
+
+	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
+
+	drm_dbg_dp(catalog->drm_dev, "stream_id %d, start_slot %d, tot_slot %d\n",
+		   stream_id, ch_start_slot, tot_slot_cnt);
+
+	if (stream_id == DP_STREAM_1)
+		reg_off = REG_DP_DP1_TIMESLOT_1_32 - REG_DP_DP0_TIMESLOT_1_32;
+
+	slot_reg_1 = 0;
+	slot_reg_2 = 0;
+
+	if (ch_start_slot && tot_slot_cnt) {
+		ch_start_slot--;
+		for (i = 0; i < tot_slot_cnt; i++) {
+			if (ch_start_slot < num_slots_per_reg) {
+				slot_reg_1 |= BIT(ch_start_slot);
+			} else {
+				slot = ch_start_slot - num_slots_per_reg;
+				slot_reg_2 |= BIT(slot);
+			}
+			ch_start_slot++;
+		}
+	}
+
+	drm_dbg_dp(catalog->drm_dev, "stream_id:%d slot_reg_1:%d, slot_reg_2:%d\n", stream_id,
+		   slot_reg_1, slot_reg_2);
+
+	if (stream_id > DP_STREAM_1) {
+		msm_dp_write_mst_link(catalog, stream_id, REG_DP_MST_LINK_TIMESLOT_1_32,
+				      slot_reg_1);
+		msm_dp_write_mst_link(catalog, stream_id, REG_DP_MST_LINK_TIMESLOT_33_63,
+				      slot_reg_2);
+	} else {
+		msm_dp_write_link(catalog, REG_DP_DP0_TIMESLOT_1_32 + reg_off, slot_reg_1);
+		msm_dp_write_link(catalog, REG_DP_DP0_TIMESLOT_33_63 + reg_off, slot_reg_2);
+	}
+}
+
+void msm_dp_catalog_ctrl_update_rg(struct msm_dp_catalog *msm_dp_catalog,
+				   enum msm_dp_stream_id stream_id, u32 x_int, u32 y_frac_enum)
+{
+	struct msm_dp_catalog_private *catalog;
+
+	u32 rg, reg_off = 0;
+
+	if (!msm_dp_catalog || stream_id >= DP_STREAM_MAX) {
+		DRM_ERROR("invalid input. stream %d\n", stream_id);
+		return;
+	}
+
+	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
+
+	rg = y_frac_enum;
+	rg |= (x_int << 16);
+
+	drm_dbg_dp(catalog->drm_dev, "stream_id: %d x_int:%d y_frac_enum:%d rg:%d\n",
+		stream_id, x_int, y_frac_enum, rg);
+
+	if (stream_id == DP_STREAM_1)
+		reg_off = REG_DP_DP1_RG - REG_DP_DP0_RG;
+
+	if (stream_id > DP_STREAM_1)
+		msm_dp_write_mst_link(catalog, stream_id, REG_DP_MST_LINK_DP_RG, rg);
+	else
+		msm_dp_write_link(catalog, REG_DP_DP0_RG + reg_off, rg);
+}
+
 void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
 				     enum msm_dp_stream_id stream_id,
 				     struct drm_display_mode *drm_mode)
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index e2c5e0235834527998d40caddd1649b434e1f180..8d3887e00cfd4e62aacf51795fb54aef071e34ee 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -31,6 +31,8 @@
 #define DP_HW_VERSION_1_0	0x10000000
 #define DP_HW_VERSION_1_2	0x10020000
 
+#define DP_MAX_TIME_SLOTS 64
+
 /* stream id */
 enum msm_dp_stream_id {
 	DP_STREAM_0,
@@ -132,4 +134,10 @@ void msm_dp_catalog_trigger_act(struct msm_dp_catalog *dp_catalog);
 bool msm_dp_catalog_read_act_complete_sts(struct msm_dp_catalog *dp_catalog);
 void msm_dp_catalog_mst_config(struct msm_dp_catalog *dp_catalog, bool enable);
 
+void msm_dp_catalog_mst_channel_alloc(struct msm_dp_catalog *dp_catalog,
+				      enum msm_dp_stream_id stream_id, u32 ch_start_slot,
+				      u32 tot_slot_cnt);
+void msm_dp_catalog_ctrl_update_rg(struct msm_dp_catalog *dp_catalog,
+				   enum msm_dp_stream_id stream_id, u32 x_int, u32 y_frac_enum);
+
 #endif /* _DP_CATALOG_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 596a949827a4db7c5ce3e804d31c3db8e048cebe..5c3bfc39ebeaee1cd88f9cd9ced80b92fba21669 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -70,6 +70,11 @@ struct msm_dp_vc_tu_mapping_table {
 	u8 tu_size_minus1;
 };
 
+struct msm_dp_mst_ch_slot_info {
+	u32 start_slot;
+	u32 tot_slots;
+};
+
 struct msm_dp_ctrl_private {
 	struct msm_dp_ctrl msm_dp_ctrl;
 	struct drm_device *drm_dev;
@@ -99,6 +104,8 @@ struct msm_dp_ctrl_private {
 	bool link_clks_on;
 	bool pixel_clks_on[DP_STREAM_MAX];
 	bool mst_active;
+
+	struct msm_dp_mst_ch_slot_info mst_ch_info[DP_STREAM_MAX];
 };
 
 static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
@@ -2069,7 +2076,103 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_li
 	return ret;
 }
 
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel)
+static void msm_dp_ctrl_mst_calculate_rg(struct msm_dp_ctrl_private *ctrl,
+					 struct msm_dp_panel *panel,
+					 u32 *p_x_int, u32 *p_y_frac_enum)
+{
+	u64 min_slot_cnt, max_slot_cnt;
+	u64 raw_target_sc, target_sc_fixp;
+	u64 ts_denom, ts_enum, ts_int;
+	u64 pclk = panel->msm_dp_mode.drm_mode.clock;
+	u64 lclk = 0;
+	u64 lanes = ctrl->link->link_params.num_lanes;
+	u64 bpp = panel->msm_dp_mode.bpp;
+	u64 pbn = panel->pbn;
+	u64 numerator, denominator, temp, temp1, temp2;
+	u32 x_int = 0, y_frac_enum = 0;
+	u64 target_strm_sym, ts_int_fixp, ts_frac_fixp, y_frac_enum_fixp;
+
+	lclk = ctrl->link->link_params.rate;
+
+	/* min_slot_cnt */
+	numerator = pclk * bpp * 64 * 1000;
+	denominator = lclk * lanes * 8 * 1000;
+	min_slot_cnt = drm_fixp_from_fraction(numerator, denominator);
+
+	/* max_slot_cnt */
+	numerator = pbn * 54 * 1000;
+	denominator = lclk * lanes;
+	max_slot_cnt = drm_fixp_from_fraction(numerator, denominator);
+
+	/* raw_target_sc */
+	numerator = max_slot_cnt + min_slot_cnt;
+	denominator = drm_fixp_from_fraction(2, 1);
+	raw_target_sc = drm_fixp_div(numerator, denominator);
+
+	/* target_sc */
+	temp = drm_fixp_from_fraction(256 * lanes, 1);
+	numerator = drm_fixp_mul(raw_target_sc, temp);
+	denominator = drm_fixp_from_fraction(256 * lanes, 1);
+	target_sc_fixp = drm_fixp_div(numerator, denominator);
+
+	ts_enum = 256 * lanes;
+	ts_denom = drm_fixp_from_fraction(256 * lanes, 1);
+	ts_int = drm_fixp2int(target_sc_fixp);
+
+	temp = drm_fixp2int_ceil(raw_target_sc);
+	if (temp != ts_int) {
+		temp = drm_fixp_from_fraction(ts_int, 1);
+		temp1 = raw_target_sc - temp;
+		temp2 = drm_fixp_mul(temp1, ts_denom);
+		ts_enum = drm_fixp2int(temp2);
+	}
+
+	/* target_strm_sym */
+	ts_int_fixp = drm_fixp_from_fraction(ts_int, 1);
+	ts_frac_fixp = drm_fixp_from_fraction(ts_enum, drm_fixp2int(ts_denom));
+	temp = ts_int_fixp + ts_frac_fixp;
+	temp1 = drm_fixp_from_fraction(lanes, 1);
+	target_strm_sym = drm_fixp_mul(temp, temp1);
+
+	/* x_int */
+	x_int = drm_fixp2int(target_strm_sym);
+
+	/* y_enum_frac */
+	temp = drm_fixp_from_fraction(x_int, 1);
+	temp1 = target_strm_sym - temp;
+	temp2 = drm_fixp_from_fraction(256, 1);
+	y_frac_enum_fixp = drm_fixp_mul(temp1, temp2);
+
+	temp1 = drm_fixp2int(y_frac_enum_fixp);
+	temp2 = drm_fixp2int_ceil(y_frac_enum_fixp);
+
+	y_frac_enum = (u32)((temp1 == temp2) ? temp1 : temp1 + 1);
+
+	*p_x_int = x_int;
+	*p_y_frac_enum = y_frac_enum;
+
+	drm_dbg_dp(ctrl->drm_dev, "mst lane_cnt:%llu, rate:%llu x_int:%d, y_frac:%d\n",
+		   lanes, lclk, x_int, y_frac_enum);
+}
+
+static void msm_dp_ctrl_mst_stream_setup(struct msm_dp_ctrl_private *ctrl,
+					 struct msm_dp_panel *panel,
+					 u32 max_streams)
+{
+	u32 x_int, y_frac_enum;
+
+	drm_dbg_dp(ctrl->drm_dev, "mst stream channel allocation\n");
+
+	msm_dp_ctrl_mst_stream_channel_slot_setup(&ctrl->msm_dp_ctrl, max_streams);
+
+	msm_dp_ctrl_mst_calculate_rg(ctrl, panel, &x_int, &y_frac_enum);
+
+	msm_dp_catalog_ctrl_update_rg(ctrl->catalog, panel->stream_id,
+				      x_int, y_frac_enum);
+}
+
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl,
+			  struct msm_dp_panel *msm_dp_panel, u32 max_streams)
 {
 	int ret = 0;
 	bool mainlink_ready = false;
@@ -2111,6 +2214,9 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 	if (!ctrl->mst_active)
 		msm_dp_ctrl_setup_tr_unit(ctrl);
 
+	if (ctrl->mst_active)
+		msm_dp_ctrl_mst_stream_setup(ctrl, msm_dp_panel, max_streams);
+
 	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
 
 	if (ctrl->mst_active)
@@ -2178,13 +2284,45 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
-	DRM_DEBUG_DP("Before, phy=%p init_count=%d power_on=%d\n",
-		phy, phy->init_count, phy->power_count);
+	drm_dbg_dp(ctrl->drm_dev, "Before, phy=%p init_count=%d power_on=%d\n",
+		   phy, phy->init_count, phy->power_count);
 
 	phy_power_off(phy);
 
-	DRM_DEBUG_DP("After, phy=%p init_count=%d power_on=%d\n",
-		phy, phy->init_count, phy->power_count);
+	drm_dbg_dp(ctrl->drm_dev, "After, phy=%p init_count=%d power_on=%d\n",
+		   phy, phy->init_count, phy->power_count);
+}
+
+void msm_dp_ctrl_set_mst_channel_info(struct msm_dp_ctrl *msm_dp_ctrl,
+				      enum msm_dp_stream_id strm,
+				      u32 start_slot, u32 tot_slots)
+{
+	struct msm_dp_ctrl_private *ctrl;
+
+	if (!msm_dp_ctrl || strm >= DP_STREAM_MAX) {
+		DRM_ERROR("invalid input\n");
+		return;
+	}
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	ctrl->mst_ch_info[strm].start_slot = start_slot;
+	ctrl->mst_ch_info[strm].tot_slots = tot_slots;
+}
+
+// TO-DO : Check if we can do a dealloc instead of this one during teardown
+void msm_dp_ctrl_mst_stream_channel_slot_setup(struct msm_dp_ctrl *msm_dp_ctrl, u32 max_streams)
+{
+	struct msm_dp_ctrl_private *ctrl;
+	int i;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	for (i = DP_STREAM_0; i < max_streams; i++) {
+		msm_dp_catalog_mst_channel_alloc(ctrl->catalog,
+						 i, ctrl->mst_ch_info[i].start_slot,
+						 ctrl->mst_ch_info[i].tot_slots);
+	}
 }
 
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index c74228bd3e4ac9e8498b75d6f5641834f662bfdc..074efc0cc80bcc19d8beba8c831c6ed16ab9eb9a 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -18,7 +18,8 @@ struct msm_dp_ctrl {
 struct phy;
 
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl, bool mst_active);
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl,
+			  struct msm_dp_panel *msm_dp_panel, u32 max_streams);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *dp_ctrl, bool force_link_train);
 void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl, enum msm_dp_stream_id stream_id);
@@ -46,5 +47,9 @@ void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl,
 void msm_dp_ctrl_psm_config(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *ctrl);
+void msm_dp_ctrl_mst_stream_channel_slot_setup(struct msm_dp_ctrl *msm_dp_ctrl, u32 max_streams);
+void msm_dp_ctrl_set_mst_channel_info(struct msm_dp_ctrl *msm_dp_ctrl,
+				      enum msm_dp_stream_id strm,
+				      u32 start_slot, u32 tot_slots);
 
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 83e73b7cf471ae967866b7d87da3abe2c1bb60d2..47475e4c76d5d701890b8ace0b63685fd4466c94 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -877,7 +877,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp)
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl, dp->panel);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl, dp->panel, dp->max_stream);
 	if (!rc)
 		msm_dp_display->power_on = true;
 
@@ -951,11 +951,14 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 	return 0;
 }
 
-int msm_dp_display_set_stream_id(struct msm_dp *dp,
-				 struct msm_dp_panel *panel, enum msm_dp_stream_id stream_id)
+int msm_dp_display_set_stream_info(struct msm_dp *dp, struct msm_dp_panel *panel,
+				   enum msm_dp_stream_id stream_id, u32 start_slot,
+				   u32 num_slots, u32 pbn, int vcpi)
 {
 	int rc = 0;
 	struct msm_dp_display_private *msm_dp_display;
+	const int max_slots = 64;
+
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
@@ -964,8 +967,18 @@ int msm_dp_display_set_stream_id(struct msm_dp *dp,
 		return -EINVAL;
 	}
 
-	if (panel)
+	if (start_slot + num_slots > max_slots) {
+		DRM_ERROR("invalid channel info received. start:%d, slots:%d\n",
+			  start_slot, num_slots);
+		return -EINVAL;
+	}
+
+	msm_dp_ctrl_set_mst_channel_info(msm_dp_display->ctrl, stream_id, start_slot, num_slots);
+
+	if (panel) {
 		panel->stream_id = stream_id;
+		panel->pbn = pbn;
+	}
 
 	return rc;
 }
@@ -1594,7 +1607,7 @@ void msm_dp_display_atomic_enable(struct msm_dp *dp)
 
 	mutex_lock(&msm_dp_display->event_mutex);
 
-	msm_dp_display_set_stream_id(dp, msm_dp_display->panel, 0);
+	msm_dp_display_set_stream_info(dp, msm_dp_display->panel, 0, 0, 0, 0, 0);
 
 	if (dp->prepared) {
 		rc = msm_dp_display_enable(msm_dp_display);
@@ -1622,8 +1635,11 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 
 	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
 
-	if (dp->mst_active)
+	if (msm_dp_display->mst_supported) {
+		msm_dp_ctrl_mst_stream_channel_slot_setup(msm_dp_display->ctrl,
+							  msm_dp_display->max_stream);
 		msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl);
+	}
 }
 
 static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 2751bf1c786e190cd7c7b514b23e90a6ed2ca3b9..10a5be9337cf9b2ea90b3061ef8d0d6de3282431 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -46,7 +46,8 @@ void msm_dp_display_mode_set(struct msm_dp *dp,
 enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 					       const struct drm_display_info *info,
 					       const struct drm_display_mode *mode);
-int msm_dp_display_set_stream_id(struct msm_dp *dp,
-				 struct msm_dp_panel *panel, enum msm_dp_stream_id stream_id);
+int msm_dp_display_set_stream_info(struct msm_dp *dp, struct msm_dp_panel *panel,
+				   enum msm_dp_stream_id stream_id,
+				   u32 start_slot, u32 num_slots, u32 pbn, int vcpi);
 
 #endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 170f819644b473b454f88cd4e8762959f4513613..15047f964037d00012b968e70b238ce1809c0fb1 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -44,6 +44,8 @@ struct msm_dp_panel {
 	u32 max_dp_link_rate;
 
 	u32 max_bw_code;
+
+	u32 pbn;
 };
 
 int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel);
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index f079c1132d5aa9a97a0bef314e31f64977d7ffc4..16182c7298eb351fd261391498e031d6213e96df 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -348,6 +348,17 @@
 #define REG_DP_PHY_AUX_BIST_CFG			(0x00000050)
 #define REG_DP_PHY_AUX_INTERRUPT_STATUS         (0x000000BC)
 
+/* DP MST related registers */
+#define REG_DP_DP0_TIMESLOT_1_32		(0x00000404)
+#define REG_DP_DP0_TIMESLOT_33_63		(0x00000408)
+#define REG_DP_DP1_TIMESLOT_1_32		(0x0000040C)
+#define REG_DP_DP1_TIMESLOT_33_63		(0x00000410)
+#define REG_DP_MST_LINK_TIMESLOT_1_32		(0x00000038)
+#define REG_DP_MST_LINK_TIMESLOT_33_63		(0x0000003C)
+#define REG_DP_DP0_RG				(0x000004F8)
+#define REG_DP_DP1_RG				(0x000004FC)
+#define REG_DP_MST_LINK_DP_RG			(0X0000011C)
+
 /* DP HDCP 1.3 registers */
 #define DP_HDCP_CTRL                                   (0x0A0)
 #define DP_HDCP_STATUS                                 (0x0A4)

-- 
2.34.1

