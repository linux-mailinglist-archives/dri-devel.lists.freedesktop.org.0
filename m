Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1B36784AD
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 19:25:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E172610E537;
	Mon, 23 Jan 2023 18:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7258910E534;
 Mon, 23 Jan 2023 18:25:03 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30NF0QeO003107; Mon, 23 Jan 2023 18:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=bcvdKmtVc7iDNnCIS7zeryMebVqjz0yiH+gCb5bokdA=;
 b=N9VZSm3lS8bODyILDjWBEz7uBT5wI1eO1hsIEErsOPPI2fImZ4n5J+hHXmloZyeNotRx
 hsVbqwtmpm3JxiofzJ6XKIS1Unv82zpLhLZiOto491YNk46wmz0ubTzS3w5SFXksYDDW
 sWXHyXhm+EbLS/ghJRHdj1YQ27ByWAubvjQxSpfuq58BVlav1P2oan6Foa4qv2qWaUSA
 iDBHBjtiT/4Bvz0n5Il2XG+41vKuPKgyM5hX0LjgstfMD+3DhKvp1FN6zOEEHLYkqClD
 W/katrEclLQjy18DsrhSbuTdukZVCHJ0xPbT+ZLMsOwPfk9YmYbkyN0b/3qBC5QnhDym 4Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n89gt3h9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 18:24:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30NIOuvu012349
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 18:24:56 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 23 Jan 2023 10:24:56 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v1 06/14] drm/msm/dp: add display compression related struct
Date: Mon, 23 Jan 2023 10:24:26 -0800
Message-ID: <1674498274-6010-7-git-send-email-quic_khsieh@quicinc.com>
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
X-Proofpoint-GUID: dka5GSLh7yYiey_IoY0wN7Kz24A1m6v-
X-Proofpoint-ORIG-GUID: dka5GSLh7yYiey_IoY0wN7Kz24A1m6v-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301230177
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

Add display compression related struct to support variant compression
mechanism. However, DSC is the only one supported at this moment.
VDC may be added later.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_panel.h | 42 ++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h     | 89 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 131 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 1153e88..4c45d51 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -21,12 +21,54 @@ struct edid;
 #define DP_DOWNSTREAM_PORTS		4
 #define DP_DOWNSTREAM_CAP_SIZE		4
 
+
+#define DP_PANEL_CAPS_DSC	BIT(0)
+
+enum dp_output_format {
+	DP_OUTPUT_FORMAT_RGB,
+	DP_OUTPUT_FORMAT_YCBCR420,
+	DP_OUTPUT_FORMAT_YCBCR422,
+	DP_OUTPUT_FORMAT_YCBCR444,
+	DP_OUTPUT_FORMAT_INVALID,
+};
+
+
+struct dp_panel_info {
+	u32 h_active;
+	u32 v_active;
+	u32 h_back_porch;
+	u32 h_front_porch;
+	u32 h_sync_width;
+	u32 h_active_low;
+	u32 v_back_porch;
+	u32 v_front_porch;
+	u32 v_sync_width;
+	u32 v_active_low;
+	u32 h_skew;
+	u32 refresh_rate;
+	u32 pixel_clk_khz;
+	u32 bpp;
+	bool widebus_en;
+	struct msm_compression_info comp_info;
+	s64 dsc_overhead_fp;
+};
+
 struct dp_display_mode {
 	struct drm_display_mode drm_mode;
+	struct dp_panel_info timing;
 	u32 capabilities;
+	s64 fec_overhead_fp;
+	s64 dsc_overhead_fp;
 	u32 bpp;
 	u32 h_active_low;
 	u32 v_active_low;
+	/**
+	 * @output_format:
+	 *
+	 * This is used to indicate DP output format.
+	 * The output format can be read from drm_mode.
+	 */
+	enum dp_output_format output_format;
 };
 
 struct dp_panel_in {
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 9f0c184..f155803 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023. Qualcomm Innovation Center, Inc. All rights reserved
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
  */
@@ -70,6 +71,16 @@ enum msm_dp_controller {
 #define MAX_H_TILES_PER_DISPLAY 2
 
 /**
+ * enum msm_display_compression_type - compression method used for pixel stream
+ * @MSM_DISPLAY_COMPRESSION_NONE:     Pixel data is not compressed
+ * @MSM_DISPLAY_COMPRESSION_DSC:      DSC compresison is used
+ */
+enum msm_display_compression_type {
+	MSM_DISPLAY_COMPRESSION_NONE,
+	MSM_DISPLAY_COMPRESSION_DSC,
+};
+
+/**
  * enum msm_event_wait - type of HW events to wait for
  * @MSM_ENC_COMMIT_DONE - wait for the driver to flush the registers to HW
  * @MSM_ENC_TX_COMPLETE - wait for the HW to transfer the frame to panel
@@ -82,6 +93,84 @@ enum msm_event_wait {
 };
 
 /**
+ * struct msm_display_dsc_info - defines dsc configuration
+ * @config                   DSC encoder configuration
+ * @scr_rev:                 DSC revision.
+ * @initial_lines:           Number of initial lines stored in encoder.
+ * @pkt_per_line:            Number of packets per line.
+ * @bytes_in_slice:          Number of bytes in slice.
+ * @eol_byte_num:            Valid bytes at the end of line.
+ * @bytes_per_pkt            Number of bytes in DSI packet
+ * @pclk_per_line:           Compressed width.
+ * @slice_last_group_size:   Size of last group in pixels.
+ * @slice_per_pkt:           Number of slices per packet.
+ * @num_active_ss_per_enc:   Number of active soft slices per encoder.
+ * @source_color_space:      Source color space of DSC encoder
+ * @chroma_format:           Chroma_format of DSC encoder.
+ * @det_thresh_flatness:     Flatness threshold.
+ * @extra_width:             Extra width required in timing calculations.
+ * @pps_delay_ms:            Post PPS command delay in milliseconds.
+ * @dsc_4hsmerge_en:         Using DSC 4HS merge topology
+ * @dsc_4hsmerge_padding     4HS merge DSC pair padding value in bytes
+ * @dsc_4hsmerge_alignment   4HS merge DSC alignment value in bytes
+ * @half_panel_pu            True for single and dual dsc encoders if partial
+ *                           update sets the roi width to half of mode width
+ *                           False in all other cases
+ */
+struct msm_display_dsc_info {
+	struct drm_dsc_config drm_dsc;
+	u8 scr_rev;
+
+	int initial_lines;
+	int pkt_per_line;
+	int bytes_in_slice;
+	int bytes_per_pkt;
+	int eol_byte_num;
+	int pclk_per_line;
+	int slice_last_group_size;
+	int slice_per_pkt;
+	int num_active_ss_per_enc;
+	int source_color_space;
+	int chroma_format;
+	int det_thresh_flatness;
+	u32 extra_width;
+	u32 pps_delay_ms;
+	bool dsc_4hsmerge_en;
+	u32 dsc_4hsmerge_padding;
+	u32 dsc_4hsmerge_alignment;
+	bool half_panel_pu;
+};
+
+/*
+ * conver from struct drm_dsc_config to struct msm_display_dsc_info
+ */
+#define to_msm_dsc_info(dsc) container_of((dsc), struct msm_display_dsc_info, drm_dsc)
+
+/**
+ * Bits/pixel target >> 4  (removing the fractional bits)
+ * returns the integer bpp value from the drm_dsc_config struct
+ */
+#define DSC_BPP(config) ((config).bits_per_pixel >> 4)
+
+/**
+ * struct msm_compression_info - defined panel compression
+ * @enabled:          enabled/disabled
+ * @comp_type:        type of compression supported
+ * @comp_ratio:       compression ratio
+ * @src_bpp:          bits per pixel before compression
+ * @tgt_bpp:          bits per pixel after compression
+ * @msm_dsc_info:     msm dsc info if the compression supported is DSC
+ */
+struct msm_compression_info {
+	bool enabled;
+	enum msm_display_compression_type comp_type;
+	u32 comp_ratio;
+	u32 src_bpp;
+	u32 tgt_bpp;
+	struct msm_display_dsc_info msm_dsc_info;
+};
+
+/**
  * struct msm_display_topology - defines a display topology pipeline
  * @num_lm:       number of layer mixers used
  * @num_intf:     number of interfaces the panel is mounted on
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

