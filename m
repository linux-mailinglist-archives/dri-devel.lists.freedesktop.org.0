Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBF4308094
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 22:32:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112436E9A7;
	Thu, 28 Jan 2021 21:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CF76E233;
 Thu, 28 Jan 2021 21:32:02 +0000 (UTC)
IronPort-SDR: kZZ9E57usMswk6VJIA07hHCXKyuCMnLbLoV/iNhMA8djaP/bHHEX2tEnQdT1qflRJxpPumsHIZ
 lFyDDVC0YtVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9878"; a="167986396"
X-IronPort-AV: E=Sophos;i="5.79,383,1602572400"; d="scan'208";a="167986396"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2021 13:31:59 -0800
IronPort-SDR: F1qmP3FadG4ExjHRxrzmiHPn53kImCacNZAZ+ZvnNcbTFICNA/bBC0RjkphZgKLcAOBxamjUhP
 48ub7SqwNifA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,383,1602572400"; d="scan'208";a="411145119"
Received: from jhli-desk1.jf.intel.com ([10.54.74.156])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Jan 2021 13:31:59 -0800
From: Juston Li <juston.li@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [Intel-gfx] [PATCH v3 2/2] drm/i915/hdcp: read RxInfo once when
 reading Send_Pairing_Info
Date: Thu, 28 Jan 2021 13:31:46 -0800
Message-Id: <20210128213146.2503925-2-juston.li@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128213146.2503925-1-juston.li@intel.com>
References: <20210128213146.2503925-1-juston.li@intel.com>
MIME-Version: 1.0
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
Cc: anshuman.gupta@intel.com, seanpaul@chromium.org,
 Juston Li <juston.li@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Previously when reading Send_Pairing_Info, RxInfo by itself was read
once to retrieve the DEVICE_COUNT and then a second time when reading
the RepeaterAuth_Send_ReceiverID_List which contains RxInfo.

On a couple HDCP 2.2 docks, this second read attempt on RxInfo fails
due to no Ack response. This behavior doesn't seem to be defined but
regardless we can fix it by reading RxInfo once and storing it before
reading the rest of RepeaterAuth_Send_ReceiverID_List once we know the
size.

Modify get_receiver_id_list_size() to read and store RxInfo in the
message buffer and also parse DEVICE_COUNT so we know the size of
RepeaterAuth_Send_ReceiverID_List.

Afterwards, retrieve the rest of the message at the offset for
seq_num_V.

Changes in v3:
- remove comment

Changes in v2:
- remove unnecessary moving of drm_i915_private from patch 1

Signed-off-by: Juston Li <juston.li@intel.com>
Acked-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 30 ++++++++++----------
 include/drm/drm_dp_helper.h                  |  2 +-
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
index d1397af97f69..3c04576681b9 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
@@ -475,11 +475,10 @@ int intel_dp_hdcp2_write_msg(struct intel_digital_port *dig_port,
 }
 
 static
-ssize_t get_receiver_id_list_size(struct intel_digital_port *dig_port)
+ssize_t get_receiver_id_list_rx_info(struct intel_digital_port *dig_port, u32 *dev_cnt, u8 *byte)
 {
-	u8 rx_info[HDCP_2_2_RXINFO_LEN];
-	u32 dev_cnt;
 	ssize_t ret;
+	u8 *rx_info = byte;
 
 	ret = drm_dp_dpcd_read(&dig_port->dp.aux,
 			       DP_HDCP_2_2_REG_RXINFO_OFFSET,
@@ -487,15 +486,11 @@ ssize_t get_receiver_id_list_size(struct intel_digital_port *dig_port)
 	if (ret != HDCP_2_2_RXINFO_LEN)
 		return ret >= 0 ? -EIO : ret;
 
-	dev_cnt = (HDCP_2_2_DEV_COUNT_HI(rx_info[0]) << 4 |
+	*dev_cnt = (HDCP_2_2_DEV_COUNT_HI(rx_info[0]) << 4 |
 		   HDCP_2_2_DEV_COUNT_LO(rx_info[1]));
 
-	if (dev_cnt > HDCP_2_2_MAX_DEVICE_COUNT)
-		dev_cnt = HDCP_2_2_MAX_DEVICE_COUNT;
-
-	ret = sizeof(struct hdcp2_rep_send_receiverid_list) -
-		HDCP_2_2_RECEIVER_IDS_MAX_LEN +
-		(dev_cnt * HDCP_2_2_RECEIVER_ID_LEN);
+	if (*dev_cnt > HDCP_2_2_MAX_DEVICE_COUNT)
+		*dev_cnt = HDCP_2_2_MAX_DEVICE_COUNT;
 
 	return ret;
 }
@@ -511,6 +506,7 @@ int intel_dp_hdcp2_read_msg(struct intel_digital_port *dig_port,
 	u8 *byte = buf;
 	ssize_t ret, bytes_to_recv, len;
 	const struct hdcp2_dp_msg_data *hdcp2_msg_data;
+	u32 dev_cnt;
 
 	hdcp2_msg_data = get_hdcp2_dp_msg_data(msg_id);
 	if (!hdcp2_msg_data)
@@ -523,17 +519,21 @@ int intel_dp_hdcp2_read_msg(struct intel_digital_port *dig_port,
 
 	hdcp->cp_irq_count_cached = atomic_read(&hdcp->cp_irq_count);
 
+	/* DP adaptation msgs has no msg_id */
+	byte++;
+
 	if (msg_id == HDCP_2_2_REP_SEND_RECVID_LIST) {
-		ret = get_receiver_id_list_size(dig_port);
+		ret = get_receiver_id_list_rx_info(dig_port, &dev_cnt, byte);
 		if (ret < 0)
 			return ret;
 
-		size = ret;
+		byte += ret;
+		size = sizeof(struct hdcp2_rep_send_receiverid_list) -
+		HDCP_2_2_RXINFO_LEN - HDCP_2_2_RECEIVER_IDS_MAX_LEN +
+		(dev_cnt * HDCP_2_2_RECEIVER_ID_LEN);
 	}
-	bytes_to_recv = size - 1;
 
-	/* DP adaptation msgs has no msg_id */
-	byte++;
+	bytes_to_recv = size - 1;
 
 	while (bytes_to_recv) {
 		len = bytes_to_recv > DP_AUX_MAX_PAYLOAD_BYTES ?
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index edffd1dcca3e..3b42392394ba 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1388,7 +1388,7 @@ enum drm_dp_phy {
 #define DP_HDCP_2_2_LC_INIT_OFFSET		DP_HDCP_2_2_REG_RN_OFFSET
 #define DP_HDCP_2_2_LC_SEND_LPRIME_OFFSET	DP_HDCP_2_2_REG_LPRIME_OFFSET
 #define DP_HDCP_2_2_SKE_SEND_EKS_OFFSET		DP_HDCP_2_2_REG_EDKEY_KS_OFFSET
-#define DP_HDCP_2_2_REP_SEND_RECVID_LIST_OFFSET	DP_HDCP_2_2_REG_RXINFO_OFFSET
+#define DP_HDCP_2_2_REP_SEND_RECVID_LIST_OFFSET	DP_HDCP_2_2_REG_SEQ_NUM_V_OFFSET
 #define DP_HDCP_2_2_REP_SEND_ACK_OFFSET		DP_HDCP_2_2_REG_V_OFFSET
 #define DP_HDCP_2_2_REP_STREAM_MANAGE_OFFSET	DP_HDCP_2_2_REG_SEQ_NUM_M_OFFSET
 #define DP_HDCP_2_2_REP_STREAM_READY_OFFSET	DP_HDCP_2_2_REG_MPRIME_OFFSET
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
