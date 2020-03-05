Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C15DD17AF8C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 21:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A4F6EC2B;
	Thu,  5 Mar 2020 20:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0157F6EC2E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 20:12:52 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id j71so2521633ywb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2020 12:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HVsvW5LN3zhRA/390EAEt/UXgIcKsuN1p7uYOYzVj2I=;
 b=AWCrQH8XsCUFVbscm3/ELpmzCYY5NU9zFSS1fGsDpdsKbFIDTWMG6pivCosFz7gecL
 86KJ0MVSpBYxdMj1twcvj4UqCk7JSOoOxHKP7m34oMUQRlvsrHp4mxsNwi/gPvJhmI30
 fKm0i4qT3vrJH/NTuSPG6qKX/8bS3Ot4NqAcrkaNRYtYTDtR6rd1hFC4H98BEeTuUgMb
 FJODubaJb3dl+Viq/f4E0gxUupSBBNXEtk9pKIuymECHQxXX/N6EXIC/XFZijgJkTS/q
 zljKkTNj7XLaBsvPikPqBE5WivJkJWbGXBGABzqGu2orYd9MxAjGuPD3P1mDPN62HU0x
 9iBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HVsvW5LN3zhRA/390EAEt/UXgIcKsuN1p7uYOYzVj2I=;
 b=D4WLbg/VG3JzTKAIr3uU5RNS5vlyvdegvomw/APDFhc/qgu+CcttKhe3Hvp54dWJGy
 LyN0Q+HOdo8Sq4nyoc0NE2ITkjlH3iOSAGMQ2fP1XndEbvJgofw1qpLA9Nv+qIIULxHx
 b68Gvh9VqUykvlNlf+85iY+VHIgjvCoRhdEmtC//Mz/eDTcdk5kA5BVzKx9yqiCLo2gh
 hfdLKxTTqHZsWBK7JAUkse7w4rReQJkDmL0RK+S+rw9CqA5HBloMGNdZLTkdetfjnIlE
 /9axTf2qh39ldKODQKgXPq4d9GDpYYti9g46noMwlHBvz+3/1PCmcKPI77JiDF55p20p
 +jfg==
X-Gm-Message-State: ANhLgQ3Dl/L0KWgR6Uui7ahYbQ4mS851PbupTwf0kpbrap+F95N7fjtt
 WxsvVthiPsKSuVsMJizvB8fh0BJjIhg=
X-Google-Smtp-Source: ADFU+vvGbg/3gzHRe59peCNbYytxZMs0MmIDZnvHQwyv+iPD9G/UYQg/ZMpV3WpB6P0eQrp8BGgK2Q==
X-Received: by 2002:a25:9882:: with SMTP id l2mr10179623ybo.143.1583439170800; 
 Thu, 05 Mar 2020 12:12:50 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id w15sm13151203ywg.1.2020.03.05.12.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 12:12:50 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 11/16] drm/i915: Factor out HDCP shim functions from dp for
 use by dp_mst
Date: Thu,  5 Mar 2020 15:12:31 -0500
Message-Id: <20200305201236.152307-12-sean@poorly.run>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200305201236.152307-1-sean@poorly.run>
References: <20200305201236.152307-1-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch, Sean Paul <seanpaul@chromium.org>,
 juston.li@intel.com, rodrigo.vivi@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

These functions are all the same for dp and dp_mst, so move them into a
dedicated file for both sst and mst to use.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20191203173638.94919-11-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20191212190230.188505-12-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20200117193103.156821-12-sean@poorly.run #v3
Link: https://patchwork.freedesktop.org/patch/msgid/20200218220242.107265-12-sean@poorly.run #v4

Changes in v2:
-None
Changes in v3:
-Created intel_dp_hdcp.c for the shared functions to live (Ville)
Changes in v4:
-Rebased on new drm logging change
Changes in v5:
-None
---
 drivers/gpu/drm/i915/Makefile                |   1 +
 drivers/gpu/drm/i915/display/intel_dp.c      | 585 +-----------------
 drivers/gpu/drm/i915/display/intel_dp.h      |   3 +
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 607 +++++++++++++++++++
 4 files changed, 615 insertions(+), 581 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dp_hdcp.c

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 991a8c537d123..cb4a7f137c0d9 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -225,6 +225,7 @@ i915-y += \
 	display/intel_ddi.o \
 	display/intel_dp.o \
 	display/intel_dp_aux_backlight.o \
+	display/intel_dp_hdcp.o \
 	display/intel_dp_link_training.o \
 	display/intel_dp_mst.o \
 	display/intel_dsi.o \
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 4a38012a1fb03..306e4ccac5bb4 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5958,580 +5958,6 @@ void intel_dp_encoder_suspend(struct intel_encoder *intel_encoder)
 		edp_panel_vdd_off_sync(intel_dp);
 }
 
-static void intel_dp_hdcp_wait_for_cp_irq(struct intel_hdcp *hdcp, int timeout)
-{
-	long ret;
-
-#define C (hdcp->cp_irq_count_cached != atomic_read(&hdcp->cp_irq_count))
-	ret = wait_event_interruptible_timeout(hdcp->cp_irq_queue, C,
-					       msecs_to_jiffies(timeout));
-
-	if (!ret)
-		DRM_DEBUG_KMS("Timedout at waiting for CP_IRQ\n");
-}
-
-static
-int intel_dp_hdcp_write_an_aksv(struct intel_digital_port *intel_dig_port,
-				u8 *an)
-{
-	u8 aksv[DRM_HDCP_KSV_LEN] = {};
-	ssize_t dpcd_ret;
-
-	dpcd_ret = drm_dp_dpcd_write(&intel_dig_port->dp.aux, DP_AUX_HDCP_AN,
-				     an, DRM_HDCP_AN_LEN);
-	if (dpcd_ret != DRM_HDCP_AN_LEN) {
-		DRM_DEBUG_KMS("Failed to write An over DP/AUX (%zd)\n",
-			      dpcd_ret);
-		return dpcd_ret >= 0 ? -EIO : dpcd_ret;
-	}
-
-	/*
-	 * Since Aksv is Oh-So-Secret, we can't access it in software. So we
-	 * send an empty buffer of the correct length through the DP helpers. On
-	 * the other side, in the transfer hook, we'll generate a flag based on
-	 * the destination address which will tickle the hardware to output the
-	 * Aksv on our behalf after the header is sent.
-	 */
-	dpcd_ret = drm_dp_dpcd_write(&intel_dig_port->dp.aux, DP_AUX_HDCP_AKSV,
-				     aksv, DRM_HDCP_KSV_LEN);
-	if (dpcd_ret != DRM_HDCP_KSV_LEN) {
-		DRM_DEBUG_KMS("Failed to write Aksv over DP/AUX (%zd)\n",
-			      dpcd_ret);
-		return dpcd_ret >= 0 ? -EIO : dpcd_ret;
-	}
-	return 0;
-}
-
-static int intel_dp_hdcp_read_bksv(struct intel_digital_port *intel_dig_port,
-				   u8 *bksv)
-{
-	ssize_t ret;
-	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux, DP_AUX_HDCP_BKSV, bksv,
-			       DRM_HDCP_KSV_LEN);
-	if (ret != DRM_HDCP_KSV_LEN) {
-		DRM_DEBUG_KMS("Read Bksv from DP/AUX failed (%zd)\n", ret);
-		return ret >= 0 ? -EIO : ret;
-	}
-	return 0;
-}
-
-static int intel_dp_hdcp_read_bstatus(struct intel_digital_port *intel_dig_port,
-				      u8 *bstatus)
-{
-	ssize_t ret;
-	/*
-	 * For some reason the HDMI and DP HDCP specs call this register
-	 * definition by different names. In the HDMI spec, it's called BSTATUS,
-	 * but in DP it's called BINFO.
-	 */
-	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux, DP_AUX_HDCP_BINFO,
-			       bstatus, DRM_HDCP_BSTATUS_LEN);
-	if (ret != DRM_HDCP_BSTATUS_LEN) {
-		DRM_DEBUG_KMS("Read bstatus from DP/AUX failed (%zd)\n", ret);
-		return ret >= 0 ? -EIO : ret;
-	}
-	return 0;
-}
-
-static
-int intel_dp_hdcp_read_bcaps(struct intel_digital_port *intel_dig_port,
-			     u8 *bcaps)
-{
-	ssize_t ret;
-
-	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux, DP_AUX_HDCP_BCAPS,
-			       bcaps, 1);
-	if (ret != 1) {
-		DRM_DEBUG_KMS("Read bcaps from DP/AUX failed (%zd)\n", ret);
-		return ret >= 0 ? -EIO : ret;
-	}
-
-	return 0;
-}
-
-static
-int intel_dp_hdcp_repeater_present(struct intel_digital_port *intel_dig_port,
-				   bool *repeater_present)
-{
-	ssize_t ret;
-	u8 bcaps;
-
-	ret = intel_dp_hdcp_read_bcaps(intel_dig_port, &bcaps);
-	if (ret)
-		return ret;
-
-	*repeater_present = bcaps & DP_BCAPS_REPEATER_PRESENT;
-	return 0;
-}
-
-static
-int intel_dp_hdcp_read_ri_prime(struct intel_digital_port *intel_dig_port,
-				u8 *ri_prime)
-{
-	ssize_t ret;
-	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux, DP_AUX_HDCP_RI_PRIME,
-			       ri_prime, DRM_HDCP_RI_LEN);
-	if (ret != DRM_HDCP_RI_LEN) {
-		DRM_DEBUG_KMS("Read Ri' from DP/AUX failed (%zd)\n", ret);
-		return ret >= 0 ? -EIO : ret;
-	}
-	return 0;
-}
-
-static
-int intel_dp_hdcp_read_ksv_ready(struct intel_digital_port *intel_dig_port,
-				 bool *ksv_ready)
-{
-	ssize_t ret;
-	u8 bstatus;
-	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux, DP_AUX_HDCP_BSTATUS,
-			       &bstatus, 1);
-	if (ret != 1) {
-		DRM_DEBUG_KMS("Read bstatus from DP/AUX failed (%zd)\n", ret);
-		return ret >= 0 ? -EIO : ret;
-	}
-	*ksv_ready = bstatus & DP_BSTATUS_READY;
-	return 0;
-}
-
-static
-int intel_dp_hdcp_read_ksv_fifo(struct intel_digital_port *intel_dig_port,
-				int num_downstream, u8 *ksv_fifo)
-{
-	ssize_t ret;
-	int i;
-
-	/* KSV list is read via 15 byte window (3 entries @ 5 bytes each) */
-	for (i = 0; i < num_downstream; i += 3) {
-		size_t len = min(num_downstream - i, 3) * DRM_HDCP_KSV_LEN;
-		ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux,
-				       DP_AUX_HDCP_KSV_FIFO,
-				       ksv_fifo + i * DRM_HDCP_KSV_LEN,
-				       len);
-		if (ret != len) {
-			DRM_DEBUG_KMS("Read ksv[%d] from DP/AUX failed (%zd)\n",
-				      i, ret);
-			return ret >= 0 ? -EIO : ret;
-		}
-	}
-	return 0;
-}
-
-static
-int intel_dp_hdcp_read_v_prime_part(struct intel_digital_port *intel_dig_port,
-				    int i, u32 *part)
-{
-	ssize_t ret;
-
-	if (i >= DRM_HDCP_V_PRIME_NUM_PARTS)
-		return -EINVAL;
-
-	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux,
-			       DP_AUX_HDCP_V_PRIME(i), part,
-			       DRM_HDCP_V_PRIME_PART_LEN);
-	if (ret != DRM_HDCP_V_PRIME_PART_LEN) {
-		DRM_DEBUG_KMS("Read v'[%d] from DP/AUX failed (%zd)\n", i, ret);
-		return ret >= 0 ? -EIO : ret;
-	}
-	return 0;
-}
-
-static
-int intel_dp_hdcp_toggle_signalling(struct intel_digital_port *intel_dig_port,
-				    enum transcoder cpu_transcoder,
-				    bool enable)
-{
-	/* Not used for single stream DisplayPort setups */
-	return 0;
-}
-
-static
-bool intel_dp_hdcp_check_link(struct intel_digital_port *intel_dig_port)
-{
-	ssize_t ret;
-	u8 bstatus;
-
-	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux, DP_AUX_HDCP_BSTATUS,
-			       &bstatus, 1);
-	if (ret != 1) {
-		DRM_DEBUG_KMS("Read bstatus from DP/AUX failed (%zd)\n", ret);
-		return false;
-	}
-
-	return !(bstatus & (DP_BSTATUS_LINK_FAILURE | DP_BSTATUS_REAUTH_REQ));
-}
-
-static
-int intel_dp_hdcp_capable(struct intel_digital_port *intel_dig_port,
-			  bool *hdcp_capable)
-{
-	ssize_t ret;
-	u8 bcaps;
-
-	ret = intel_dp_hdcp_read_bcaps(intel_dig_port, &bcaps);
-	if (ret)
-		return ret;
-
-	*hdcp_capable = bcaps & DP_BCAPS_HDCP_CAPABLE;
-	return 0;
-}
-
-struct hdcp2_dp_errata_stream_type {
-	u8	msg_id;
-	u8	stream_type;
-} __packed;
-
-struct hdcp2_dp_msg_data {
-	u8 msg_id;
-	u32 offset;
-	bool msg_detectable;
-	u32 timeout;
-	u32 timeout2; /* Added for non_paired situation */
-};
-
-static const struct hdcp2_dp_msg_data hdcp2_dp_msg_data[] = {
-	{ HDCP_2_2_AKE_INIT, DP_HDCP_2_2_AKE_INIT_OFFSET, false, 0, 0 },
-	{ HDCP_2_2_AKE_SEND_CERT, DP_HDCP_2_2_AKE_SEND_CERT_OFFSET,
-	  false, HDCP_2_2_CERT_TIMEOUT_MS, 0 },
-	{ HDCP_2_2_AKE_NO_STORED_KM, DP_HDCP_2_2_AKE_NO_STORED_KM_OFFSET,
-	  false, 0, 0 },
-	{ HDCP_2_2_AKE_STORED_KM, DP_HDCP_2_2_AKE_STORED_KM_OFFSET,
-	  false, 0, 0 },
-	{ HDCP_2_2_AKE_SEND_HPRIME, DP_HDCP_2_2_AKE_SEND_HPRIME_OFFSET,
-	  true, HDCP_2_2_HPRIME_PAIRED_TIMEOUT_MS,
-	  HDCP_2_2_HPRIME_NO_PAIRED_TIMEOUT_MS },
-	{ HDCP_2_2_AKE_SEND_PAIRING_INFO,
-	  DP_HDCP_2_2_AKE_SEND_PAIRING_INFO_OFFSET, true,
-	  HDCP_2_2_PAIRING_TIMEOUT_MS, 0 },
-	{ HDCP_2_2_LC_INIT, DP_HDCP_2_2_LC_INIT_OFFSET, false, 0, 0 },
-	{ HDCP_2_2_LC_SEND_LPRIME, DP_HDCP_2_2_LC_SEND_LPRIME_OFFSET,
-	  false, HDCP_2_2_DP_LPRIME_TIMEOUT_MS, 0 },
-	{ HDCP_2_2_SKE_SEND_EKS, DP_HDCP_2_2_SKE_SEND_EKS_OFFSET, false,
-	  0, 0 },
-	{ HDCP_2_2_REP_SEND_RECVID_LIST,
-	  DP_HDCP_2_2_REP_SEND_RECVID_LIST_OFFSET, true,
-	  HDCP_2_2_RECVID_LIST_TIMEOUT_MS, 0 },
-	{ HDCP_2_2_REP_SEND_ACK, DP_HDCP_2_2_REP_SEND_ACK_OFFSET, false,
-	  0, 0 },
-	{ HDCP_2_2_REP_STREAM_MANAGE,
-	  DP_HDCP_2_2_REP_STREAM_MANAGE_OFFSET, false,
-	  0, 0 },
-	{ HDCP_2_2_REP_STREAM_READY, DP_HDCP_2_2_REP_STREAM_READY_OFFSET,
-	  false, HDCP_2_2_STREAM_READY_TIMEOUT_MS, 0 },
-/* local define to shovel this through the write_2_2 interface */
-#define HDCP_2_2_ERRATA_DP_STREAM_TYPE	50
-	{ HDCP_2_2_ERRATA_DP_STREAM_TYPE,
-	  DP_HDCP_2_2_REG_STREAM_TYPE_OFFSET, false,
-	  0, 0 },
-};
-
-static inline
-int intel_dp_hdcp2_read_rx_status(struct intel_digital_port *intel_dig_port,
-				  u8 *rx_status)
-{
-	ssize_t ret;
-
-	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux,
-			       DP_HDCP_2_2_REG_RXSTATUS_OFFSET, rx_status,
-			       HDCP_2_2_DP_RXSTATUS_LEN);
-	if (ret != HDCP_2_2_DP_RXSTATUS_LEN) {
-		DRM_DEBUG_KMS("Read bstatus from DP/AUX failed (%zd)\n", ret);
-		return ret >= 0 ? -EIO : ret;
-	}
-
-	return 0;
-}
-
-static
-int hdcp2_detect_msg_availability(struct intel_digital_port *intel_dig_port,
-				  u8 msg_id, bool *msg_ready)
-{
-	u8 rx_status;
-	int ret;
-
-	*msg_ready = false;
-	ret = intel_dp_hdcp2_read_rx_status(intel_dig_port, &rx_status);
-	if (ret < 0)
-		return ret;
-
-	switch (msg_id) {
-	case HDCP_2_2_AKE_SEND_HPRIME:
-		if (HDCP_2_2_DP_RXSTATUS_H_PRIME(rx_status))
-			*msg_ready = true;
-		break;
-	case HDCP_2_2_AKE_SEND_PAIRING_INFO:
-		if (HDCP_2_2_DP_RXSTATUS_PAIRING(rx_status))
-			*msg_ready = true;
-		break;
-	case HDCP_2_2_REP_SEND_RECVID_LIST:
-		if (HDCP_2_2_DP_RXSTATUS_READY(rx_status))
-			*msg_ready = true;
-		break;
-	default:
-		DRM_ERROR("Unidentified msg_id: %d\n", msg_id);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static ssize_t
-intel_dp_hdcp2_wait_for_msg(struct intel_digital_port *intel_dig_port,
-			    const struct hdcp2_dp_msg_data *hdcp2_msg_data)
-{
-	struct intel_dp *dp = &intel_dig_port->dp;
-	struct intel_hdcp *hdcp = &dp->attached_connector->hdcp;
-	u8 msg_id = hdcp2_msg_data->msg_id;
-	int ret, timeout;
-	bool msg_ready = false;
-
-	if (msg_id == HDCP_2_2_AKE_SEND_HPRIME && !hdcp->is_paired)
-		timeout = hdcp2_msg_data->timeout2;
-	else
-		timeout = hdcp2_msg_data->timeout;
-
-	/*
-	 * There is no way to detect the CERT, LPRIME and STREAM_READY
-	 * availability. So Wait for timeout and read the msg.
-	 */
-	if (!hdcp2_msg_data->msg_detectable) {
-		mdelay(timeout);
-		ret = 0;
-	} else {
-		/*
-		 * As we want to check the msg availability at timeout, Ignoring
-		 * the timeout at wait for CP_IRQ.
-		 */
-		intel_dp_hdcp_wait_for_cp_irq(hdcp, timeout);
-		ret = hdcp2_detect_msg_availability(intel_dig_port,
-						    msg_id, &msg_ready);
-		if (!msg_ready)
-			ret = -ETIMEDOUT;
-	}
-
-	if (ret)
-		DRM_DEBUG_KMS("msg_id %d, ret %d, timeout(mSec): %d\n",
-			      hdcp2_msg_data->msg_id, ret, timeout);
-
-	return ret;
-}
-
-static const struct hdcp2_dp_msg_data *get_hdcp2_dp_msg_data(u8 msg_id)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(hdcp2_dp_msg_data); i++)
-		if (hdcp2_dp_msg_data[i].msg_id == msg_id)
-			return &hdcp2_dp_msg_data[i];
-
-	return NULL;
-}
-
-static
-int intel_dp_hdcp2_write_msg(struct intel_digital_port *intel_dig_port,
-			     void *buf, size_t size)
-{
-	struct intel_dp *dp = &intel_dig_port->dp;
-	struct intel_hdcp *hdcp = &dp->attached_connector->hdcp;
-	unsigned int offset;
-	u8 *byte = buf;
-	ssize_t ret, bytes_to_write, len;
-	const struct hdcp2_dp_msg_data *hdcp2_msg_data;
-
-	hdcp2_msg_data = get_hdcp2_dp_msg_data(*byte);
-	if (!hdcp2_msg_data)
-		return -EINVAL;
-
-	offset = hdcp2_msg_data->offset;
-
-	/* No msg_id in DP HDCP2.2 msgs */
-	bytes_to_write = size - 1;
-	byte++;
-
-	hdcp->cp_irq_count_cached = atomic_read(&hdcp->cp_irq_count);
-
-	while (bytes_to_write) {
-		len = bytes_to_write > DP_AUX_MAX_PAYLOAD_BYTES ?
-				DP_AUX_MAX_PAYLOAD_BYTES : bytes_to_write;
-
-		ret = drm_dp_dpcd_write(&intel_dig_port->dp.aux,
-					offset, (void *)byte, len);
-		if (ret < 0)
-			return ret;
-
-		bytes_to_write -= ret;
-		byte += ret;
-		offset += ret;
-	}
-
-	return size;
-}
-
-static
-ssize_t get_receiver_id_list_size(struct intel_digital_port *intel_dig_port)
-{
-	u8 rx_info[HDCP_2_2_RXINFO_LEN];
-	u32 dev_cnt;
-	ssize_t ret;
-
-	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux,
-			       DP_HDCP_2_2_REG_RXINFO_OFFSET,
-			       (void *)rx_info, HDCP_2_2_RXINFO_LEN);
-	if (ret != HDCP_2_2_RXINFO_LEN)
-		return ret >= 0 ? -EIO : ret;
-
-	dev_cnt = (HDCP_2_2_DEV_COUNT_HI(rx_info[0]) << 4 |
-		   HDCP_2_2_DEV_COUNT_LO(rx_info[1]));
-
-	if (dev_cnt > HDCP_2_2_MAX_DEVICE_COUNT)
-		dev_cnt = HDCP_2_2_MAX_DEVICE_COUNT;
-
-	ret = sizeof(struct hdcp2_rep_send_receiverid_list) -
-		HDCP_2_2_RECEIVER_IDS_MAX_LEN +
-		(dev_cnt * HDCP_2_2_RECEIVER_ID_LEN);
-
-	return ret;
-}
-
-static
-int intel_dp_hdcp2_read_msg(struct intel_digital_port *intel_dig_port,
-			    u8 msg_id, void *buf, size_t size)
-{
-	unsigned int offset;
-	u8 *byte = buf;
-	ssize_t ret, bytes_to_recv, len;
-	const struct hdcp2_dp_msg_data *hdcp2_msg_data;
-
-	hdcp2_msg_data = get_hdcp2_dp_msg_data(msg_id);
-	if (!hdcp2_msg_data)
-		return -EINVAL;
-	offset = hdcp2_msg_data->offset;
-
-	ret = intel_dp_hdcp2_wait_for_msg(intel_dig_port, hdcp2_msg_data);
-	if (ret < 0)
-		return ret;
-
-	if (msg_id == HDCP_2_2_REP_SEND_RECVID_LIST) {
-		ret = get_receiver_id_list_size(intel_dig_port);
-		if (ret < 0)
-			return ret;
-
-		size = ret;
-	}
-	bytes_to_recv = size - 1;
-
-	/* DP adaptation msgs has no msg_id */
-	byte++;
-
-	while (bytes_to_recv) {
-		len = bytes_to_recv > DP_AUX_MAX_PAYLOAD_BYTES ?
-		      DP_AUX_MAX_PAYLOAD_BYTES : bytes_to_recv;
-
-		ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux, offset,
-				       (void *)byte, len);
-		if (ret < 0) {
-			DRM_DEBUG_KMS("msg_id %d, ret %zd\n", msg_id, ret);
-			return ret;
-		}
-
-		bytes_to_recv -= ret;
-		byte += ret;
-		offset += ret;
-	}
-	byte = buf;
-	*byte = msg_id;
-
-	return size;
-}
-
-static
-int intel_dp_hdcp2_config_stream_type(struct intel_digital_port *intel_dig_port,
-				      bool is_repeater, u8 content_type)
-{
-	int ret;
-	struct hdcp2_dp_errata_stream_type stream_type_msg;
-
-	if (is_repeater)
-		return 0;
-
-	/*
-	 * Errata for DP: As Stream type is used for encryption, Receiver
-	 * should be communicated with stream type for the decryption of the
-	 * content.
-	 * Repeater will be communicated with stream type as a part of it's
-	 * auth later in time.
-	 */
-	stream_type_msg.msg_id = HDCP_2_2_ERRATA_DP_STREAM_TYPE;
-	stream_type_msg.stream_type = content_type;
-
-	ret =  intel_dp_hdcp2_write_msg(intel_dig_port, &stream_type_msg,
-					sizeof(stream_type_msg));
-
-	return ret < 0 ? ret : 0;
-
-}
-
-static
-int intel_dp_hdcp2_check_link(struct intel_digital_port *intel_dig_port)
-{
-	u8 rx_status;
-	int ret;
-
-	ret = intel_dp_hdcp2_read_rx_status(intel_dig_port, &rx_status);
-	if (ret)
-		return ret;
-
-	if (HDCP_2_2_DP_RXSTATUS_REAUTH_REQ(rx_status))
-		ret = HDCP_REAUTH_REQUEST;
-	else if (HDCP_2_2_DP_RXSTATUS_LINK_FAILED(rx_status))
-		ret = HDCP_LINK_INTEGRITY_FAILURE;
-	else if (HDCP_2_2_DP_RXSTATUS_READY(rx_status))
-		ret = HDCP_TOPOLOGY_CHANGE;
-
-	return ret;
-}
-
-static
-int intel_dp_hdcp2_capable(struct intel_digital_port *intel_dig_port,
-			   bool *capable)
-{
-	u8 rx_caps[3];
-	int ret;
-
-	*capable = false;
-	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux,
-			       DP_HDCP_2_2_REG_RX_CAPS_OFFSET,
-			       rx_caps, HDCP_2_2_RXCAPS_LEN);
-	if (ret != HDCP_2_2_RXCAPS_LEN)
-		return ret >= 0 ? -EIO : ret;
-
-	if (rx_caps[0] == HDCP_2_2_RX_CAPS_VERSION_VAL &&
-	    HDCP_2_2_DP_HDCP_CAPABLE(rx_caps[2]))
-		*capable = true;
-
-	return 0;
-}
-
-static const struct intel_hdcp_shim intel_dp_hdcp_shim = {
-	.write_an_aksv = intel_dp_hdcp_write_an_aksv,
-	.read_bksv = intel_dp_hdcp_read_bksv,
-	.read_bstatus = intel_dp_hdcp_read_bstatus,
-	.repeater_present = intel_dp_hdcp_repeater_present,
-	.read_ri_prime = intel_dp_hdcp_read_ri_prime,
-	.read_ksv_ready = intel_dp_hdcp_read_ksv_ready,
-	.read_ksv_fifo = intel_dp_hdcp_read_ksv_fifo,
-	.read_v_prime_part = intel_dp_hdcp_read_v_prime_part,
-	.toggle_signalling = intel_dp_hdcp_toggle_signalling,
-	.check_link = intel_dp_hdcp_check_link,
-	.hdcp_capable = intel_dp_hdcp_capable,
-	.write_2_2_msg = intel_dp_hdcp2_write_msg,
-	.read_2_2_msg = intel_dp_hdcp2_read_msg,
-	.config_stream_type = intel_dp_hdcp2_config_stream_type,
-	.check_2_2_link = intel_dp_hdcp2_check_link,
-	.hdcp_2_2_capable = intel_dp_hdcp2_capable,
-	.protocol = HDCP_PROTOCOL_DP,
-};
-
 static void intel_edp_panel_vdd_sanitize(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
@@ -7665,7 +7091,7 @@ intel_dp_init_connector(struct intel_digital_port *intel_dig_port,
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	enum port port = intel_encoder->port;
 	enum phy phy = intel_port_to_phy(dev_priv, port);
-	int type;
+	int type, ret;
 
 	/* Initialize the work for modeset in case of link train failure */
 	INIT_WORK(&intel_connector->modeset_retry_work,
@@ -7755,12 +7181,9 @@ intel_dp_init_connector(struct intel_digital_port *intel_dig_port,
 
 	intel_dp_add_properties(intel_dp, connector);
 
-	if (is_hdcp_supported(dev_priv, port) && !intel_dp_is_edp(intel_dp)) {
-		int ret = intel_hdcp_init(intel_connector, &intel_dp_hdcp_shim);
-		if (ret)
-			drm_dbg_kms(&dev_priv->drm,
-				    "HDCP init failed, skipping.\n");
-	}
+	ret = intel_dp_init_hdcp(intel_dig_port, intel_connector);
+	if (ret)
+		drm_dbg_kms(&dev_priv->drm, "HDCP init failed (%d)\n", ret);
 
 	/* For G4X desktop chip, PEG_BAND_GAP_DATA 3:0 must first be written
 	 * 0xd.  Failure to do so will result in spurious interrupts being
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index ae4a1517632bf..937abdd158434 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -127,4 +127,7 @@ void intel_ddi_update_pipe(struct intel_encoder *encoder,
 			   const struct intel_crtc_state *crtc_state,
 			   const struct drm_connector_state *conn_state);
 
+int intel_dp_init_hdcp(struct intel_digital_port *intel_dig_port,
+		       struct intel_connector *intel_connector);
+
 #endif /* __INTEL_DP_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
new file mode 100644
index 0000000000000..f41fe9e9d6f89
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
@@ -0,0 +1,607 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (C) 2020 Google, Inc.
+ *
+ * Authors:
+ * Sean Paul <seanpaul@chromium.org>
+ */
+
+#include <drm/drm_dp_helper.h>
+#include <drm/drm_hdcp.h>
+#include <drm/drm_print.h>
+
+#include "intel_display_types.h"
+#include "intel_dp.h"
+#include "intel_hdcp.h"
+
+struct hdcp2_dp_errata_stream_type {
+	u8	msg_id;
+	u8	stream_type;
+} __packed;
+
+struct hdcp2_dp_msg_data {
+	u8 msg_id;
+	u32 offset;
+	bool msg_detectable;
+	u32 timeout;
+	u32 timeout2; /* Added for non_paired situation */
+};
+
+static const struct hdcp2_dp_msg_data hdcp2_dp_msg_data[] = {
+	{ HDCP_2_2_AKE_INIT, DP_HDCP_2_2_AKE_INIT_OFFSET, false, 0, 0 },
+	{ HDCP_2_2_AKE_SEND_CERT, DP_HDCP_2_2_AKE_SEND_CERT_OFFSET,
+	  false, HDCP_2_2_CERT_TIMEOUT_MS, 0 },
+	{ HDCP_2_2_AKE_NO_STORED_KM, DP_HDCP_2_2_AKE_NO_STORED_KM_OFFSET,
+	  false, 0, 0 },
+	{ HDCP_2_2_AKE_STORED_KM, DP_HDCP_2_2_AKE_STORED_KM_OFFSET,
+	  false, 0, 0 },
+	{ HDCP_2_2_AKE_SEND_HPRIME, DP_HDCP_2_2_AKE_SEND_HPRIME_OFFSET,
+	  true, HDCP_2_2_HPRIME_PAIRED_TIMEOUT_MS,
+	  HDCP_2_2_HPRIME_NO_PAIRED_TIMEOUT_MS },
+	{ HDCP_2_2_AKE_SEND_PAIRING_INFO,
+	  DP_HDCP_2_2_AKE_SEND_PAIRING_INFO_OFFSET, true,
+	  HDCP_2_2_PAIRING_TIMEOUT_MS, 0 },
+	{ HDCP_2_2_LC_INIT, DP_HDCP_2_2_LC_INIT_OFFSET, false, 0, 0 },
+	{ HDCP_2_2_LC_SEND_LPRIME, DP_HDCP_2_2_LC_SEND_LPRIME_OFFSET,
+	  false, HDCP_2_2_DP_LPRIME_TIMEOUT_MS, 0 },
+	{ HDCP_2_2_SKE_SEND_EKS, DP_HDCP_2_2_SKE_SEND_EKS_OFFSET, false,
+	  0, 0 },
+	{ HDCP_2_2_REP_SEND_RECVID_LIST,
+	  DP_HDCP_2_2_REP_SEND_RECVID_LIST_OFFSET, true,
+	  HDCP_2_2_RECVID_LIST_TIMEOUT_MS, 0 },
+	{ HDCP_2_2_REP_SEND_ACK, DP_HDCP_2_2_REP_SEND_ACK_OFFSET, false,
+	  0, 0 },
+	{ HDCP_2_2_REP_STREAM_MANAGE,
+	  DP_HDCP_2_2_REP_STREAM_MANAGE_OFFSET, false,
+	  0, 0 },
+	{ HDCP_2_2_REP_STREAM_READY, DP_HDCP_2_2_REP_STREAM_READY_OFFSET,
+	  false, HDCP_2_2_STREAM_READY_TIMEOUT_MS, 0 },
+/* local define to shovel this through the write_2_2 interface */
+#define HDCP_2_2_ERRATA_DP_STREAM_TYPE	50
+	{ HDCP_2_2_ERRATA_DP_STREAM_TYPE,
+	  DP_HDCP_2_2_REG_STREAM_TYPE_OFFSET, false,
+	  0, 0 },
+};
+
+static void intel_dp_hdcp_wait_for_cp_irq(struct intel_hdcp *hdcp, int timeout)
+{
+	long ret;
+
+#define C (hdcp->cp_irq_count_cached != atomic_read(&hdcp->cp_irq_count))
+	ret = wait_event_interruptible_timeout(hdcp->cp_irq_queue, C,
+					       msecs_to_jiffies(timeout));
+
+	if (!ret)
+		DRM_DEBUG_KMS("Timedout at waiting for CP_IRQ\n");
+}
+
+static const struct hdcp2_dp_msg_data *get_hdcp2_dp_msg_data(u8 msg_id)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(hdcp2_dp_msg_data); i++)
+		if (hdcp2_dp_msg_data[i].msg_id == msg_id)
+			return &hdcp2_dp_msg_data[i];
+
+	return NULL;
+}
+
+static
+int intel_dp_hdcp2_write_msg(struct intel_digital_port *intel_dig_port,
+			     void *buf, size_t size)
+{
+	struct intel_dp *dp = &intel_dig_port->dp;
+	struct intel_hdcp *hdcp = &dp->attached_connector->hdcp;
+	unsigned int offset;
+	u8 *byte = buf;
+	ssize_t ret, bytes_to_write, len;
+	const struct hdcp2_dp_msg_data *hdcp2_msg_data;
+
+	hdcp2_msg_data = get_hdcp2_dp_msg_data(*byte);
+	if (!hdcp2_msg_data)
+		return -EINVAL;
+
+	offset = hdcp2_msg_data->offset;
+
+	/* No msg_id in DP HDCP2.2 msgs */
+	bytes_to_write = size - 1;
+	byte++;
+
+	hdcp->cp_irq_count_cached = atomic_read(&hdcp->cp_irq_count);
+
+	while (bytes_to_write) {
+		len = bytes_to_write > DP_AUX_MAX_PAYLOAD_BYTES ?
+				DP_AUX_MAX_PAYLOAD_BYTES : bytes_to_write;
+
+		ret = drm_dp_dpcd_write(&intel_dig_port->dp.aux,
+					offset, (void *)byte, len);
+		if (ret < 0)
+			return ret;
+
+		bytes_to_write -= ret;
+		byte += ret;
+		offset += ret;
+	}
+
+	return size;
+}
+
+static inline
+int intel_dp_hdcp2_read_rx_status(struct intel_digital_port *intel_dig_port,
+				  u8 *rx_status)
+{
+	ssize_t ret;
+
+	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux,
+			       DP_HDCP_2_2_REG_RXSTATUS_OFFSET, rx_status,
+			       HDCP_2_2_DP_RXSTATUS_LEN);
+	if (ret != HDCP_2_2_DP_RXSTATUS_LEN) {
+		DRM_DEBUG_KMS("Read bstatus from DP/AUX failed (%zd)\n", ret);
+		return ret >= 0 ? -EIO : ret;
+	}
+
+	return 0;
+}
+
+static
+int hdcp2_detect_msg_availability(struct intel_digital_port *intel_dig_port,
+				  u8 msg_id, bool *msg_ready)
+{
+	u8 rx_status;
+	int ret;
+
+	*msg_ready = false;
+	ret = intel_dp_hdcp2_read_rx_status(intel_dig_port, &rx_status);
+	if (ret < 0)
+		return ret;
+
+	switch (msg_id) {
+	case HDCP_2_2_AKE_SEND_HPRIME:
+		if (HDCP_2_2_DP_RXSTATUS_H_PRIME(rx_status))
+			*msg_ready = true;
+		break;
+	case HDCP_2_2_AKE_SEND_PAIRING_INFO:
+		if (HDCP_2_2_DP_RXSTATUS_PAIRING(rx_status))
+			*msg_ready = true;
+		break;
+	case HDCP_2_2_REP_SEND_RECVID_LIST:
+		if (HDCP_2_2_DP_RXSTATUS_READY(rx_status))
+			*msg_ready = true;
+		break;
+	default:
+		DRM_ERROR("Unidentified msg_id: %d\n", msg_id);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static ssize_t
+intel_dp_hdcp2_wait_for_msg(struct intel_digital_port *intel_dig_port,
+			    const struct hdcp2_dp_msg_data *hdcp2_msg_data)
+{
+	struct intel_dp *dp = &intel_dig_port->dp;
+	struct intel_hdcp *hdcp = &dp->attached_connector->hdcp;
+	u8 msg_id = hdcp2_msg_data->msg_id;
+	int ret, timeout;
+	bool msg_ready = false;
+
+	if (msg_id == HDCP_2_2_AKE_SEND_HPRIME && !hdcp->is_paired)
+		timeout = hdcp2_msg_data->timeout2;
+	else
+		timeout = hdcp2_msg_data->timeout;
+
+	/*
+	 * There is no way to detect the CERT, LPRIME and STREAM_READY
+	 * availability. So Wait for timeout and read the msg.
+	 */
+	if (!hdcp2_msg_data->msg_detectable) {
+		mdelay(timeout);
+		ret = 0;
+	} else {
+		/*
+		 * As we want to check the msg availability at timeout, Ignoring
+		 * the timeout at wait for CP_IRQ.
+		 */
+		intel_dp_hdcp_wait_for_cp_irq(hdcp, timeout);
+		ret = hdcp2_detect_msg_availability(intel_dig_port,
+						    msg_id, &msg_ready);
+		if (!msg_ready)
+			ret = -ETIMEDOUT;
+	}
+
+	if (ret)
+		DRM_DEBUG_KMS("msg_id %d, ret %d, timeout(mSec): %d\n",
+			      hdcp2_msg_data->msg_id, ret, timeout);
+
+	return ret;
+}
+
+static
+ssize_t get_receiver_id_list_size(struct intel_digital_port *intel_dig_port)
+{
+	u8 rx_info[HDCP_2_2_RXINFO_LEN];
+	u32 dev_cnt;
+	ssize_t ret;
+
+	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux,
+			       DP_HDCP_2_2_REG_RXINFO_OFFSET,
+			       (void *)rx_info, HDCP_2_2_RXINFO_LEN);
+	if (ret != HDCP_2_2_RXINFO_LEN)
+		return ret >= 0 ? -EIO : ret;
+
+	dev_cnt = (HDCP_2_2_DEV_COUNT_HI(rx_info[0]) << 4 |
+		   HDCP_2_2_DEV_COUNT_LO(rx_info[1]));
+
+	if (dev_cnt > HDCP_2_2_MAX_DEVICE_COUNT)
+		dev_cnt = HDCP_2_2_MAX_DEVICE_COUNT;
+
+	ret = sizeof(struct hdcp2_rep_send_receiverid_list) -
+		HDCP_2_2_RECEIVER_IDS_MAX_LEN +
+		(dev_cnt * HDCP_2_2_RECEIVER_ID_LEN);
+
+	return ret;
+}
+
+static
+int intel_dp_hdcp2_read_msg(struct intel_digital_port *intel_dig_port,
+			    u8 msg_id, void *buf, size_t size)
+{
+	unsigned int offset;
+	u8 *byte = buf;
+	ssize_t ret, bytes_to_recv, len;
+	const struct hdcp2_dp_msg_data *hdcp2_msg_data;
+
+	hdcp2_msg_data = get_hdcp2_dp_msg_data(msg_id);
+	if (!hdcp2_msg_data)
+		return -EINVAL;
+	offset = hdcp2_msg_data->offset;
+
+	ret = intel_dp_hdcp2_wait_for_msg(intel_dig_port, hdcp2_msg_data);
+	if (ret < 0)
+		return ret;
+
+	if (msg_id == HDCP_2_2_REP_SEND_RECVID_LIST) {
+		ret = get_receiver_id_list_size(intel_dig_port);
+		if (ret < 0)
+			return ret;
+
+		size = ret;
+	}
+	bytes_to_recv = size - 1;
+
+	/* DP adaptation msgs has no msg_id */
+	byte++;
+
+	while (bytes_to_recv) {
+		len = bytes_to_recv > DP_AUX_MAX_PAYLOAD_BYTES ?
+		      DP_AUX_MAX_PAYLOAD_BYTES : bytes_to_recv;
+
+		ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux, offset,
+				       (void *)byte, len);
+		if (ret < 0) {
+			DRM_DEBUG_KMS("msg_id %d, ret %zd\n", msg_id, ret);
+			return ret;
+		}
+
+		bytes_to_recv -= ret;
+		byte += ret;
+		offset += ret;
+	}
+	byte = buf;
+	*byte = msg_id;
+
+	return size;
+}
+
+static
+int intel_dp_hdcp2_config_stream_type(struct intel_digital_port *intel_dig_port,
+				      bool is_repeater, u8 content_type)
+{
+	int ret;
+	struct hdcp2_dp_errata_stream_type stream_type_msg;
+
+	if (is_repeater)
+		return 0;
+
+	/*
+	 * Errata for DP: As Stream type is used for encryption, Receiver
+	 * should be communicated with stream type for the decryption of the
+	 * content.
+	 * Repeater will be communicated with stream type as a part of it's
+	 * auth later in time.
+	 */
+	stream_type_msg.msg_id = HDCP_2_2_ERRATA_DP_STREAM_TYPE;
+	stream_type_msg.stream_type = content_type;
+
+	ret =  intel_dp_hdcp2_write_msg(intel_dig_port, &stream_type_msg,
+					sizeof(stream_type_msg));
+
+	return ret < 0 ? ret : 0;
+
+}
+
+static
+int intel_dp_hdcp2_check_link(struct intel_digital_port *intel_dig_port)
+{
+	u8 rx_status;
+	int ret;
+
+	ret = intel_dp_hdcp2_read_rx_status(intel_dig_port, &rx_status);
+	if (ret)
+		return ret;
+
+	if (HDCP_2_2_DP_RXSTATUS_REAUTH_REQ(rx_status))
+		ret = HDCP_REAUTH_REQUEST;
+	else if (HDCP_2_2_DP_RXSTATUS_LINK_FAILED(rx_status))
+		ret = HDCP_LINK_INTEGRITY_FAILURE;
+	else if (HDCP_2_2_DP_RXSTATUS_READY(rx_status))
+		ret = HDCP_TOPOLOGY_CHANGE;
+
+	return ret;
+}
+
+static
+int intel_dp_hdcp2_capable(struct intel_digital_port *intel_dig_port,
+			   bool *capable)
+{
+	u8 rx_caps[3];
+	int ret;
+
+	*capable = false;
+	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux,
+			       DP_HDCP_2_2_REG_RX_CAPS_OFFSET,
+			       rx_caps, HDCP_2_2_RXCAPS_LEN);
+	if (ret != HDCP_2_2_RXCAPS_LEN)
+		return ret >= 0 ? -EIO : ret;
+
+	if (rx_caps[0] == HDCP_2_2_RX_CAPS_VERSION_VAL &&
+	    HDCP_2_2_DP_HDCP_CAPABLE(rx_caps[2]))
+		*capable = true;
+
+	return 0;
+}
+
+static
+int intel_dp_hdcp_write_an_aksv(struct intel_digital_port *intel_dig_port,
+				u8 *an)
+{
+	u8 aksv[DRM_HDCP_KSV_LEN] = {};
+	ssize_t dpcd_ret;
+
+	dpcd_ret = drm_dp_dpcd_write(&intel_dig_port->dp.aux, DP_AUX_HDCP_AN,
+				     an, DRM_HDCP_AN_LEN);
+	if (dpcd_ret != DRM_HDCP_AN_LEN) {
+		DRM_DEBUG_KMS("Failed to write An over DP/AUX (%zd)\n",
+			      dpcd_ret);
+		return dpcd_ret >= 0 ? -EIO : dpcd_ret;
+	}
+
+	/*
+	 * Since Aksv is Oh-So-Secret, we can't access it in software. So we
+	 * send an empty buffer of the correct length through the DP helpers. On
+	 * the other side, in the transfer hook, we'll generate a flag based on
+	 * the destination address which will tickle the hardware to output the
+	 * Aksv on our behalf after the header is sent.
+	 */
+	dpcd_ret = drm_dp_dpcd_write(&intel_dig_port->dp.aux, DP_AUX_HDCP_AKSV,
+				     aksv, DRM_HDCP_KSV_LEN);
+	if (dpcd_ret != DRM_HDCP_KSV_LEN) {
+		DRM_DEBUG_KMS("Failed to write Aksv over DP/AUX (%zd)\n",
+			      dpcd_ret);
+		return dpcd_ret >= 0 ? -EIO : dpcd_ret;
+	}
+	return 0;
+}
+
+static int intel_dp_hdcp_read_bksv(struct intel_digital_port *intel_dig_port,
+				   u8 *bksv)
+{
+	ssize_t ret;
+	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux, DP_AUX_HDCP_BKSV, bksv,
+			       DRM_HDCP_KSV_LEN);
+	if (ret != DRM_HDCP_KSV_LEN) {
+		DRM_DEBUG_KMS("Read Bksv from DP/AUX failed (%zd)\n", ret);
+		return ret >= 0 ? -EIO : ret;
+	}
+	return 0;
+}
+
+static int intel_dp_hdcp_read_bstatus(struct intel_digital_port *intel_dig_port,
+				      u8 *bstatus)
+{
+	ssize_t ret;
+	/*
+	 * For some reason the HDMI and DP HDCP specs call this register
+	 * definition by different names. In the HDMI spec, it's called BSTATUS,
+	 * but in DP it's called BINFO.
+	 */
+	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux, DP_AUX_HDCP_BINFO,
+			       bstatus, DRM_HDCP_BSTATUS_LEN);
+	if (ret != DRM_HDCP_BSTATUS_LEN) {
+		DRM_DEBUG_KMS("Read bstatus from DP/AUX failed (%zd)\n", ret);
+		return ret >= 0 ? -EIO : ret;
+	}
+	return 0;
+}
+
+static
+int intel_dp_hdcp_read_bcaps(struct intel_digital_port *intel_dig_port,
+			     u8 *bcaps)
+{
+	ssize_t ret;
+
+	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux, DP_AUX_HDCP_BCAPS,
+			       bcaps, 1);
+	if (ret != 1) {
+		DRM_DEBUG_KMS("Read bcaps from DP/AUX failed (%zd)\n", ret);
+		return ret >= 0 ? -EIO : ret;
+	}
+
+	return 0;
+}
+
+static
+int intel_dp_hdcp_repeater_present(struct intel_digital_port *intel_dig_port,
+				   bool *repeater_present)
+{
+	ssize_t ret;
+	u8 bcaps;
+
+	ret = intel_dp_hdcp_read_bcaps(intel_dig_port, &bcaps);
+	if (ret)
+		return ret;
+
+	*repeater_present = bcaps & DP_BCAPS_REPEATER_PRESENT;
+	return 0;
+}
+
+static
+int intel_dp_hdcp_read_ri_prime(struct intel_digital_port *intel_dig_port,
+				u8 *ri_prime)
+{
+	ssize_t ret;
+	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux, DP_AUX_HDCP_RI_PRIME,
+			       ri_prime, DRM_HDCP_RI_LEN);
+	if (ret != DRM_HDCP_RI_LEN) {
+		DRM_DEBUG_KMS("Read Ri' from DP/AUX failed (%zd)\n", ret);
+		return ret >= 0 ? -EIO : ret;
+	}
+	return 0;
+}
+
+static
+int intel_dp_hdcp_read_ksv_ready(struct intel_digital_port *intel_dig_port,
+				 bool *ksv_ready)
+{
+	ssize_t ret;
+	u8 bstatus;
+	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux, DP_AUX_HDCP_BSTATUS,
+			       &bstatus, 1);
+	if (ret != 1) {
+		DRM_DEBUG_KMS("Read bstatus from DP/AUX failed (%zd)\n", ret);
+		return ret >= 0 ? -EIO : ret;
+	}
+	*ksv_ready = bstatus & DP_BSTATUS_READY;
+	return 0;
+}
+
+static
+int intel_dp_hdcp_read_ksv_fifo(struct intel_digital_port *intel_dig_port,
+				int num_downstream, u8 *ksv_fifo)
+{
+	ssize_t ret;
+	int i;
+
+	/* KSV list is read via 15 byte window (3 entries @ 5 bytes each) */
+	for (i = 0; i < num_downstream; i += 3) {
+		size_t len = min(num_downstream - i, 3) * DRM_HDCP_KSV_LEN;
+		ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux,
+				       DP_AUX_HDCP_KSV_FIFO,
+				       ksv_fifo + i * DRM_HDCP_KSV_LEN,
+				       len);
+		if (ret != len) {
+			DRM_DEBUG_KMS("Read ksv[%d] from DP/AUX failed (%zd)\n",
+				      i, ret);
+			return ret >= 0 ? -EIO : ret;
+		}
+	}
+	return 0;
+}
+
+static
+int intel_dp_hdcp_read_v_prime_part(struct intel_digital_port *intel_dig_port,
+				    int i, u32 *part)
+{
+	ssize_t ret;
+
+	if (i >= DRM_HDCP_V_PRIME_NUM_PARTS)
+		return -EINVAL;
+
+	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux,
+			       DP_AUX_HDCP_V_PRIME(i), part,
+			       DRM_HDCP_V_PRIME_PART_LEN);
+	if (ret != DRM_HDCP_V_PRIME_PART_LEN) {
+		DRM_DEBUG_KMS("Read v'[%d] from DP/AUX failed (%zd)\n", i, ret);
+		return ret >= 0 ? -EIO : ret;
+	}
+	return 0;
+}
+
+static
+int intel_dp_hdcp_toggle_signalling(struct intel_digital_port *intel_dig_port,
+				    enum transcoder cpu_transcoder,
+				    bool enable)
+{
+	/* Not used for single stream DisplayPort setups */
+	return 0;
+}
+
+static
+bool intel_dp_hdcp_check_link(struct intel_digital_port *intel_dig_port)
+{
+	ssize_t ret;
+	u8 bstatus;
+
+	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux, DP_AUX_HDCP_BSTATUS,
+			       &bstatus, 1);
+	if (ret != 1) {
+		DRM_DEBUG_KMS("Read bstatus from DP/AUX failed (%zd)\n", ret);
+		return false;
+	}
+
+	return !(bstatus & (DP_BSTATUS_LINK_FAILURE | DP_BSTATUS_REAUTH_REQ));
+}
+
+static
+int intel_dp_hdcp_capable(struct intel_digital_port *intel_dig_port,
+			  bool *hdcp_capable)
+{
+	ssize_t ret;
+	u8 bcaps;
+
+	ret = intel_dp_hdcp_read_bcaps(intel_dig_port, &bcaps);
+	if (ret)
+		return ret;
+
+	*hdcp_capable = bcaps & DP_BCAPS_HDCP_CAPABLE;
+	return 0;
+}
+
+static const struct intel_hdcp_shim intel_dp_hdcp_shim = {
+	.write_an_aksv = intel_dp_hdcp_write_an_aksv,
+	.read_bksv = intel_dp_hdcp_read_bksv,
+	.read_bstatus = intel_dp_hdcp_read_bstatus,
+	.repeater_present = intel_dp_hdcp_repeater_present,
+	.read_ri_prime = intel_dp_hdcp_read_ri_prime,
+	.read_ksv_ready = intel_dp_hdcp_read_ksv_ready,
+	.read_ksv_fifo = intel_dp_hdcp_read_ksv_fifo,
+	.read_v_prime_part = intel_dp_hdcp_read_v_prime_part,
+	.toggle_signalling = intel_dp_hdcp_toggle_signalling,
+	.check_link = intel_dp_hdcp_check_link,
+	.hdcp_capable = intel_dp_hdcp_capable,
+	.write_2_2_msg = intel_dp_hdcp2_write_msg,
+	.read_2_2_msg = intel_dp_hdcp2_read_msg,
+	.config_stream_type = intel_dp_hdcp2_config_stream_type,
+	.check_2_2_link = intel_dp_hdcp2_check_link,
+	.hdcp_2_2_capable = intel_dp_hdcp2_capable,
+	.protocol = HDCP_PROTOCOL_DP,
+};
+
+int intel_dp_init_hdcp(struct intel_digital_port *intel_dig_port,
+		       struct intel_connector *intel_connector)
+{
+	struct drm_device *dev = intel_connector->base.dev;
+	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct intel_encoder *intel_encoder = &intel_dig_port->base;
+	enum port port = intel_encoder->port;
+	struct intel_dp *intel_dp = &intel_dig_port->dp;
+
+	if (!is_hdcp_supported(dev_priv, port))
+		return 0;
+
+	if (!intel_dp_is_edp(intel_dp))
+		return intel_hdcp_init(intel_connector, &intel_dp_hdcp_shim);
+
+	return 0;
+}
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
