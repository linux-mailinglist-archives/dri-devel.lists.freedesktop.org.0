Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D69248A28
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 17:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A5F6E029;
	Tue, 18 Aug 2020 15:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B363189FF6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 15:40:31 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id t23so15446330qto.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 08:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6vRfOs2o2NN5SluKBtbfT0p2wFwReCTeNLg6KbhriRk=;
 b=R4wtKNSZUpxdvd/d8yidrhjTITlu81kJuEYKsrXpaEw8ColUQQdMEBo21I3YbfHeHv
 jADBLP9NzawsUaG/LDgE3kK9b5LRTaiqb6VZ29BrkURnZHaBzYmiyFb0irJrKcJlf4Bl
 6tcYnbim0UP9AcMgtMQK6WG5m16WRrFFVz1XwwcyXnuatyzygSRQ8CDwsyuxjXXgo2+Q
 uquROH/aYL1qvYBhUGGFjIcALzA1nxIxV9rONWEt3HYG7mjzIyMYoE6ESLbuRntqVlLB
 9KrKUVJdTCZI+Zd//Zc5eNtdj6V0rCghMSZZ0kB2WhMAIoKDMgNoXUVy7LrTPWJl2a4e
 k1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6vRfOs2o2NN5SluKBtbfT0p2wFwReCTeNLg6KbhriRk=;
 b=n0Nfmp/K1fK4GivAs4G9fRB6lS6gtUadYu6CY/KvQ2q3wxL8RaMWP2QkrqKOaxNdLo
 T8Hn6m89H6ll7u9oIlC0rLS0FxCAYg0g8nEO2elcHxyJJ7/pNwpSLpbZEzE6LJic3ilr
 BhjHJVrLtQPr87Bd3DJiARdg6Wyi8zqnsYkMqOJTNMZ0oy218jrfHGpT/rEp7rivN3Jx
 0OLhGNhVBdS/jmijRivIe8RY5c3ZuAZYVWLbQvG0ZoJYVoo0MrVCsu7HY1JoL8XBZzYB
 dGac3Rd+dC9fbiIzrrg5jm/aAAePiTW/eUm0SzvrzEYOYY6aoQARFOHgBk9qcsYsVb1N
 hSWQ==
X-Gm-Message-State: AOAM532O5xyJR9rEamTKlUnDrIArAvdrwm2Z3XL/vLFFy+gW748DxA0j
 UuWFsP+Z9nEicfnlWtY8rVYBDnvFnWFurQ==
X-Google-Smtp-Source: ABdhPJxzmiSs/y2ATU0zE3iZ9ulSIFebxsARs+FvdzdhQxvWXWd0e1SBJhyq59jMXPHEkG7LGDT7Gg==
X-Received: by 2002:ac8:4c8e:: with SMTP id j14mr19125935qtv.381.1597765229887; 
 Tue, 18 Aug 2020 08:40:29 -0700 (PDT)
Received: from localhost (mobile-166-170-57-144.mycingular.net.
 [166.170.57.144])
 by smtp.gmail.com with ESMTPSA id h13sm23354328qtu.7.2020.08.18.08.40.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Aug 2020 08:40:29 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 juston.li@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 anshuman.gupta@intel.com
Subject: [PATCH v8 12/17] drm/i915: Factor out HDCP shim functions from dp for
 use by dp_mst
Date: Tue, 18 Aug 2020 11:39:00 -0400
Message-Id: <20200818153910.27894-13-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818153910.27894-1-sean@poorly.run>
References: <20200818153910.27894-1-sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

These functions are all the same for dp and dp_mst, so move them into a
dedicated file for both sst and mst to use.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20191203173638.94919-11-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20191212190230.188505-12-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20200117193103.156821-12-sean@poorly.run #v3
Link: https://patchwork.freedesktop.org/patch/msgid/20200218220242.107265-12-sean@poorly.run #v4
Link: https://patchwork.freedesktop.org/patch/msgid/20200305201236.152307-12-sean@poorly.run #v5
Link: https://patchwork.freedesktop.org/patch/msgid/20200429195502.39919-12-sean@poorly.run #v6
Link: https://patchwork.freedesktop.org/patch/msgid/20200623155907.22961-13-sean@poorly.run #v7

Changes in v2:
-None
Changes in v3:
-Created intel_dp_hdcp.c for the shared functions to live (Ville)
Changes in v4:
-Rebased on new drm logging change
Changes in v5:
-None
Changes in v6:
-None
Changes in v7:
-Rebased patch
Changes in v8:
-None
---
 drivers/gpu/drm/i915/Makefile                |   1 +
 drivers/gpu/drm/i915/display/intel_dp.c      | 607 +-----------------
 drivers/gpu/drm/i915/display/intel_dp.h      |   3 +
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 637 +++++++++++++++++++
 4 files changed, 642 insertions(+), 606 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dp_hdcp.c

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index bda4c0e408f8..e5574e506a5c 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -234,6 +234,7 @@ i915-y += \
 	display/intel_ddi.o \
 	display/intel_dp.o \
 	display/intel_dp_aux_backlight.o \
+	display/intel_dp_hdcp.o \
 	display/intel_dp_link_training.o \
 	display/intel_dp_mst.o \
 	display/intel_dsi.o \
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index b54577a04ccf..41d76df7423e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -38,7 +38,6 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_edid.h>
-#include <drm/drm_hdcp.h>
 #include <drm/drm_probe_helper.h>
 
 #include "i915_debugfs.h"
@@ -6401,610 +6400,6 @@ void intel_dp_encoder_suspend(struct intel_encoder *intel_encoder)
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
-int intel_dp_hdcp_write_an_aksv(struct intel_digital_port *dig_port,
-				u8 *an)
-{
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
-	u8 aksv[DRM_HDCP_KSV_LEN] = {};
-	ssize_t dpcd_ret;
-
-	/* Output An first, that's easy */
-	dpcd_ret = drm_dp_dpcd_write(&dig_port->dp.aux, DP_AUX_HDCP_AN,
-				     an, DRM_HDCP_AN_LEN);
-	if (dpcd_ret != DRM_HDCP_AN_LEN) {
-		drm_dbg_kms(&i915->drm,
-			    "Failed to write An over DP/AUX (%zd)\n",
-			    dpcd_ret);
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
-	dpcd_ret = drm_dp_dpcd_write(&dig_port->dp.aux, DP_AUX_HDCP_AKSV,
-				     aksv, DRM_HDCP_KSV_LEN);
-	if (dpcd_ret != DRM_HDCP_KSV_LEN) {
-		drm_dbg_kms(&i915->drm,
-			    "Failed to write Aksv over DP/AUX (%zd)\n",
-			    dpcd_ret);
-		return dpcd_ret >= 0 ? -EIO : dpcd_ret;
-	}
-	return 0;
-}
-
-static int intel_dp_hdcp_read_bksv(struct intel_digital_port *dig_port,
-				   u8 *bksv)
-{
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
-	ssize_t ret;
-
-	ret = drm_dp_dpcd_read(&dig_port->dp.aux, DP_AUX_HDCP_BKSV, bksv,
-			       DRM_HDCP_KSV_LEN);
-	if (ret != DRM_HDCP_KSV_LEN) {
-		drm_dbg_kms(&i915->drm,
-			    "Read Bksv from DP/AUX failed (%zd)\n", ret);
-		return ret >= 0 ? -EIO : ret;
-	}
-	return 0;
-}
-
-static int intel_dp_hdcp_read_bstatus(struct intel_digital_port *dig_port,
-				      u8 *bstatus)
-{
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
-	ssize_t ret;
-
-	/*
-	 * For some reason the HDMI and DP HDCP specs call this register
-	 * definition by different names. In the HDMI spec, it's called BSTATUS,
-	 * but in DP it's called BINFO.
-	 */
-	ret = drm_dp_dpcd_read(&dig_port->dp.aux, DP_AUX_HDCP_BINFO,
-			       bstatus, DRM_HDCP_BSTATUS_LEN);
-	if (ret != DRM_HDCP_BSTATUS_LEN) {
-		drm_dbg_kms(&i915->drm,
-			    "Read bstatus from DP/AUX failed (%zd)\n", ret);
-		return ret >= 0 ? -EIO : ret;
-	}
-	return 0;
-}
-
-static
-int intel_dp_hdcp_read_bcaps(struct intel_digital_port *dig_port,
-			     u8 *bcaps)
-{
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
-	ssize_t ret;
-
-	ret = drm_dp_dpcd_read(&dig_port->dp.aux, DP_AUX_HDCP_BCAPS,
-			       bcaps, 1);
-	if (ret != 1) {
-		drm_dbg_kms(&i915->drm,
-			    "Read bcaps from DP/AUX failed (%zd)\n", ret);
-		return ret >= 0 ? -EIO : ret;
-	}
-
-	return 0;
-}
-
-static
-int intel_dp_hdcp_repeater_present(struct intel_digital_port *dig_port,
-				   bool *repeater_present)
-{
-	ssize_t ret;
-	u8 bcaps;
-
-	ret = intel_dp_hdcp_read_bcaps(dig_port, &bcaps);
-	if (ret)
-		return ret;
-
-	*repeater_present = bcaps & DP_BCAPS_REPEATER_PRESENT;
-	return 0;
-}
-
-static
-int intel_dp_hdcp_read_ri_prime(struct intel_digital_port *dig_port,
-				u8 *ri_prime)
-{
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
-	ssize_t ret;
-
-	ret = drm_dp_dpcd_read(&dig_port->dp.aux, DP_AUX_HDCP_RI_PRIME,
-			       ri_prime, DRM_HDCP_RI_LEN);
-	if (ret != DRM_HDCP_RI_LEN) {
-		drm_dbg_kms(&i915->drm, "Read Ri' from DP/AUX failed (%zd)\n",
-			    ret);
-		return ret >= 0 ? -EIO : ret;
-	}
-	return 0;
-}
-
-static
-int intel_dp_hdcp_read_ksv_ready(struct intel_digital_port *dig_port,
-				 bool *ksv_ready)
-{
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
-	ssize_t ret;
-	u8 bstatus;
-
-	ret = drm_dp_dpcd_read(&dig_port->dp.aux, DP_AUX_HDCP_BSTATUS,
-			       &bstatus, 1);
-	if (ret != 1) {
-		drm_dbg_kms(&i915->drm,
-			    "Read bstatus from DP/AUX failed (%zd)\n", ret);
-		return ret >= 0 ? -EIO : ret;
-	}
-	*ksv_ready = bstatus & DP_BSTATUS_READY;
-	return 0;
-}
-
-static
-int intel_dp_hdcp_read_ksv_fifo(struct intel_digital_port *dig_port,
-				int num_downstream, u8 *ksv_fifo)
-{
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
-	ssize_t ret;
-	int i;
-
-	/* KSV list is read via 15 byte window (3 entries @ 5 bytes each) */
-	for (i = 0; i < num_downstream; i += 3) {
-		size_t len = min(num_downstream - i, 3) * DRM_HDCP_KSV_LEN;
-		ret = drm_dp_dpcd_read(&dig_port->dp.aux,
-				       DP_AUX_HDCP_KSV_FIFO,
-				       ksv_fifo + i * DRM_HDCP_KSV_LEN,
-				       len);
-		if (ret != len) {
-			drm_dbg_kms(&i915->drm,
-				    "Read ksv[%d] from DP/AUX failed (%zd)\n",
-				    i, ret);
-			return ret >= 0 ? -EIO : ret;
-		}
-	}
-	return 0;
-}
-
-static
-int intel_dp_hdcp_read_v_prime_part(struct intel_digital_port *dig_port,
-				    int i, u32 *part)
-{
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
-	ssize_t ret;
-
-	if (i >= DRM_HDCP_V_PRIME_NUM_PARTS)
-		return -EINVAL;
-
-	ret = drm_dp_dpcd_read(&dig_port->dp.aux,
-			       DP_AUX_HDCP_V_PRIME(i), part,
-			       DRM_HDCP_V_PRIME_PART_LEN);
-	if (ret != DRM_HDCP_V_PRIME_PART_LEN) {
-		drm_dbg_kms(&i915->drm,
-			    "Read v'[%d] from DP/AUX failed (%zd)\n", i, ret);
-		return ret >= 0 ? -EIO : ret;
-	}
-	return 0;
-}
-
-static
-int intel_dp_hdcp_toggle_signalling(struct intel_digital_port *dig_port,
-				    enum transcoder cpu_transcoder,
-				    bool enable)
-{
-	/* Not used for single stream DisplayPort setups */
-	return 0;
-}
-
-static
-bool intel_dp_hdcp_check_link(struct intel_digital_port *dig_port)
-{
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
-	ssize_t ret;
-	u8 bstatus;
-
-	ret = drm_dp_dpcd_read(&dig_port->dp.aux, DP_AUX_HDCP_BSTATUS,
-			       &bstatus, 1);
-	if (ret != 1) {
-		drm_dbg_kms(&i915->drm,
-			    "Read bstatus from DP/AUX failed (%zd)\n", ret);
-		return false;
-	}
-
-	return !(bstatus & (DP_BSTATUS_LINK_FAILURE | DP_BSTATUS_REAUTH_REQ));
-}
-
-static
-int intel_dp_hdcp_capable(struct intel_digital_port *dig_port,
-			  bool *hdcp_capable)
-{
-	ssize_t ret;
-	u8 bcaps;
-
-	ret = intel_dp_hdcp_read_bcaps(dig_port, &bcaps);
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
-static int
-intel_dp_hdcp2_read_rx_status(struct intel_digital_port *dig_port,
-			      u8 *rx_status)
-{
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
-	ssize_t ret;
-
-	ret = drm_dp_dpcd_read(&dig_port->dp.aux,
-			       DP_HDCP_2_2_REG_RXSTATUS_OFFSET, rx_status,
-			       HDCP_2_2_DP_RXSTATUS_LEN);
-	if (ret != HDCP_2_2_DP_RXSTATUS_LEN) {
-		drm_dbg_kms(&i915->drm,
-			    "Read bstatus from DP/AUX failed (%zd)\n", ret);
-		return ret >= 0 ? -EIO : ret;
-	}
-
-	return 0;
-}
-
-static
-int hdcp2_detect_msg_availability(struct intel_digital_port *dig_port,
-				  u8 msg_id, bool *msg_ready)
-{
-	u8 rx_status;
-	int ret;
-
-	*msg_ready = false;
-	ret = intel_dp_hdcp2_read_rx_status(dig_port, &rx_status);
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
-intel_dp_hdcp2_wait_for_msg(struct intel_digital_port *dig_port,
-			    const struct hdcp2_dp_msg_data *hdcp2_msg_data)
-{
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
-	struct intel_dp *dp = &dig_port->dp;
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
-		ret = hdcp2_detect_msg_availability(dig_port,
-						    msg_id, &msg_ready);
-		if (!msg_ready)
-			ret = -ETIMEDOUT;
-	}
-
-	if (ret)
-		drm_dbg_kms(&i915->drm,
-			    "msg_id %d, ret %d, timeout(mSec): %d\n",
-			    hdcp2_msg_data->msg_id, ret, timeout);
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
-int intel_dp_hdcp2_write_msg(struct intel_digital_port *dig_port,
-			     void *buf, size_t size)
-{
-	struct intel_dp *dp = &dig_port->dp;
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
-		ret = drm_dp_dpcd_write(&dig_port->dp.aux,
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
-ssize_t get_receiver_id_list_size(struct intel_digital_port *dig_port)
-{
-	u8 rx_info[HDCP_2_2_RXINFO_LEN];
-	u32 dev_cnt;
-	ssize_t ret;
-
-	ret = drm_dp_dpcd_read(&dig_port->dp.aux,
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
-int intel_dp_hdcp2_read_msg(struct intel_digital_port *dig_port,
-			    u8 msg_id, void *buf, size_t size)
-{
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
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
-	ret = intel_dp_hdcp2_wait_for_msg(dig_port, hdcp2_msg_data);
-	if (ret < 0)
-		return ret;
-
-	if (msg_id == HDCP_2_2_REP_SEND_RECVID_LIST) {
-		ret = get_receiver_id_list_size(dig_port);
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
-		ret = drm_dp_dpcd_read(&dig_port->dp.aux, offset,
-				       (void *)byte, len);
-		if (ret < 0) {
-			drm_dbg_kms(&i915->drm, "msg_id %d, ret %zd\n",
-				    msg_id, ret);
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
-int intel_dp_hdcp2_config_stream_type(struct intel_digital_port *dig_port,
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
-	ret =  intel_dp_hdcp2_write_msg(dig_port, &stream_type_msg,
-					sizeof(stream_type_msg));
-
-	return ret < 0 ? ret : 0;
-
-}
-
-static
-int intel_dp_hdcp2_check_link(struct intel_digital_port *dig_port)
-{
-	u8 rx_status;
-	int ret;
-
-	ret = intel_dp_hdcp2_read_rx_status(dig_port, &rx_status);
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
-int intel_dp_hdcp2_capable(struct intel_digital_port *dig_port,
-			   bool *capable)
-{
-	u8 rx_caps[3];
-	int ret;
-
-	*capable = false;
-	ret = drm_dp_dpcd_read(&dig_port->dp.aux,
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
@@ -8241,7 +7636,7 @@ intel_dp_init_connector(struct intel_digital_port *dig_port,
 	intel_dp_add_properties(intel_dp, connector);
 
 	if (is_hdcp_supported(dev_priv, port) && !intel_dp_is_edp(intel_dp)) {
-		int ret = intel_hdcp_init(intel_connector, &intel_dp_hdcp_shim);
+		int ret = intel_dp_init_hdcp(dig_port, intel_connector);
 		if (ret)
 			drm_dbg_kms(&dev_priv->drm,
 				    "HDCP init failed, skipping.\n");
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index d13b45151a3f..29934ab4c435 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -134,4 +134,7 @@ void intel_ddi_update_pipe(struct intel_atomic_state *state,
 			   const struct intel_crtc_state *crtc_state,
 			   const struct drm_connector_state *conn_state);
 
+int intel_dp_init_hdcp(struct intel_digital_port *dig_port,
+		       struct intel_connector *intel_connector);
+
 #endif /* __INTEL_DP_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
new file mode 100644
index 000000000000..0b8200bed061
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
@@ -0,0 +1,637 @@
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
+static
+int intel_dp_hdcp_write_an_aksv(struct intel_digital_port *dig_port,
+				u8 *an)
+{
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	u8 aksv[DRM_HDCP_KSV_LEN] = {};
+	ssize_t dpcd_ret;
+
+	/* Output An first, that's easy */
+	dpcd_ret = drm_dp_dpcd_write(&dig_port->dp.aux, DP_AUX_HDCP_AN,
+				     an, DRM_HDCP_AN_LEN);
+	if (dpcd_ret != DRM_HDCP_AN_LEN) {
+		drm_dbg_kms(&i915->drm,
+			    "Failed to write An over DP/AUX (%zd)\n",
+			    dpcd_ret);
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
+	dpcd_ret = drm_dp_dpcd_write(&dig_port->dp.aux, DP_AUX_HDCP_AKSV,
+				     aksv, DRM_HDCP_KSV_LEN);
+	if (dpcd_ret != DRM_HDCP_KSV_LEN) {
+		drm_dbg_kms(&i915->drm,
+			    "Failed to write Aksv over DP/AUX (%zd)\n",
+			    dpcd_ret);
+		return dpcd_ret >= 0 ? -EIO : dpcd_ret;
+	}
+	return 0;
+}
+
+static int intel_dp_hdcp_read_bksv(struct intel_digital_port *dig_port,
+				   u8 *bksv)
+{
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	ssize_t ret;
+
+	ret = drm_dp_dpcd_read(&dig_port->dp.aux, DP_AUX_HDCP_BKSV, bksv,
+			       DRM_HDCP_KSV_LEN);
+	if (ret != DRM_HDCP_KSV_LEN) {
+		drm_dbg_kms(&i915->drm,
+			    "Read Bksv from DP/AUX failed (%zd)\n", ret);
+		return ret >= 0 ? -EIO : ret;
+	}
+	return 0;
+}
+
+static int intel_dp_hdcp_read_bstatus(struct intel_digital_port *dig_port,
+				      u8 *bstatus)
+{
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	ssize_t ret;
+
+	/*
+	 * For some reason the HDMI and DP HDCP specs call this register
+	 * definition by different names. In the HDMI spec, it's called BSTATUS,
+	 * but in DP it's called BINFO.
+	 */
+	ret = drm_dp_dpcd_read(&dig_port->dp.aux, DP_AUX_HDCP_BINFO,
+			       bstatus, DRM_HDCP_BSTATUS_LEN);
+	if (ret != DRM_HDCP_BSTATUS_LEN) {
+		drm_dbg_kms(&i915->drm,
+			    "Read bstatus from DP/AUX failed (%zd)\n", ret);
+		return ret >= 0 ? -EIO : ret;
+	}
+	return 0;
+}
+
+static
+int intel_dp_hdcp_read_bcaps(struct intel_digital_port *dig_port,
+			     u8 *bcaps)
+{
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	ssize_t ret;
+
+	ret = drm_dp_dpcd_read(&dig_port->dp.aux, DP_AUX_HDCP_BCAPS,
+			       bcaps, 1);
+	if (ret != 1) {
+		drm_dbg_kms(&i915->drm,
+			    "Read bcaps from DP/AUX failed (%zd)\n", ret);
+		return ret >= 0 ? -EIO : ret;
+	}
+
+	return 0;
+}
+
+static
+int intel_dp_hdcp_repeater_present(struct intel_digital_port *dig_port,
+				   bool *repeater_present)
+{
+	ssize_t ret;
+	u8 bcaps;
+
+	ret = intel_dp_hdcp_read_bcaps(dig_port, &bcaps);
+	if (ret)
+		return ret;
+
+	*repeater_present = bcaps & DP_BCAPS_REPEATER_PRESENT;
+	return 0;
+}
+
+static
+int intel_dp_hdcp_read_ri_prime(struct intel_digital_port *dig_port,
+				u8 *ri_prime)
+{
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	ssize_t ret;
+
+	ret = drm_dp_dpcd_read(&dig_port->dp.aux, DP_AUX_HDCP_RI_PRIME,
+			       ri_prime, DRM_HDCP_RI_LEN);
+	if (ret != DRM_HDCP_RI_LEN) {
+		drm_dbg_kms(&i915->drm, "Read Ri' from DP/AUX failed (%zd)\n",
+			    ret);
+		return ret >= 0 ? -EIO : ret;
+	}
+	return 0;
+}
+
+static
+int intel_dp_hdcp_read_ksv_ready(struct intel_digital_port *dig_port,
+				 bool *ksv_ready)
+{
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	ssize_t ret;
+	u8 bstatus;
+
+	ret = drm_dp_dpcd_read(&dig_port->dp.aux, DP_AUX_HDCP_BSTATUS,
+			       &bstatus, 1);
+	if (ret != 1) {
+		drm_dbg_kms(&i915->drm,
+			    "Read bstatus from DP/AUX failed (%zd)\n", ret);
+		return ret >= 0 ? -EIO : ret;
+	}
+	*ksv_ready = bstatus & DP_BSTATUS_READY;
+	return 0;
+}
+
+static
+int intel_dp_hdcp_read_ksv_fifo(struct intel_digital_port *dig_port,
+				int num_downstream, u8 *ksv_fifo)
+{
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	ssize_t ret;
+	int i;
+
+	/* KSV list is read via 15 byte window (3 entries @ 5 bytes each) */
+	for (i = 0; i < num_downstream; i += 3) {
+		size_t len = min(num_downstream - i, 3) * DRM_HDCP_KSV_LEN;
+		ret = drm_dp_dpcd_read(&dig_port->dp.aux,
+				       DP_AUX_HDCP_KSV_FIFO,
+				       ksv_fifo + i * DRM_HDCP_KSV_LEN,
+				       len);
+		if (ret != len) {
+			drm_dbg_kms(&i915->drm,
+				    "Read ksv[%d] from DP/AUX failed (%zd)\n",
+				    i, ret);
+			return ret >= 0 ? -EIO : ret;
+		}
+	}
+	return 0;
+}
+
+static
+int intel_dp_hdcp_read_v_prime_part(struct intel_digital_port *dig_port,
+				    int i, u32 *part)
+{
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	ssize_t ret;
+
+	if (i >= DRM_HDCP_V_PRIME_NUM_PARTS)
+		return -EINVAL;
+
+	ret = drm_dp_dpcd_read(&dig_port->dp.aux,
+			       DP_AUX_HDCP_V_PRIME(i), part,
+			       DRM_HDCP_V_PRIME_PART_LEN);
+	if (ret != DRM_HDCP_V_PRIME_PART_LEN) {
+		drm_dbg_kms(&i915->drm,
+			    "Read v'[%d] from DP/AUX failed (%zd)\n", i, ret);
+		return ret >= 0 ? -EIO : ret;
+	}
+	return 0;
+}
+
+static
+int intel_dp_hdcp_toggle_signalling(struct intel_digital_port *dig_port,
+				    enum transcoder cpu_transcoder,
+				    bool enable)
+{
+	/* Not used for single stream DisplayPort setups */
+	return 0;
+}
+
+static
+bool intel_dp_hdcp_check_link(struct intel_digital_port *dig_port)
+{
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	ssize_t ret;
+	u8 bstatus;
+
+	ret = drm_dp_dpcd_read(&dig_port->dp.aux, DP_AUX_HDCP_BSTATUS,
+			       &bstatus, 1);
+	if (ret != 1) {
+		drm_dbg_kms(&i915->drm,
+			    "Read bstatus from DP/AUX failed (%zd)\n", ret);
+		return false;
+	}
+
+	return !(bstatus & (DP_BSTATUS_LINK_FAILURE | DP_BSTATUS_REAUTH_REQ));
+}
+
+static
+int intel_dp_hdcp_capable(struct intel_digital_port *dig_port,
+			  bool *hdcp_capable)
+{
+	ssize_t ret;
+	u8 bcaps;
+
+	ret = intel_dp_hdcp_read_bcaps(dig_port, &bcaps);
+	if (ret)
+		return ret;
+
+	*hdcp_capable = bcaps & DP_BCAPS_HDCP_CAPABLE;
+	return 0;
+}
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
+static int
+intel_dp_hdcp2_read_rx_status(struct intel_digital_port *dig_port,
+			      u8 *rx_status)
+{
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	ssize_t ret;
+
+	ret = drm_dp_dpcd_read(&dig_port->dp.aux,
+			       DP_HDCP_2_2_REG_RXSTATUS_OFFSET, rx_status,
+			       HDCP_2_2_DP_RXSTATUS_LEN);
+	if (ret != HDCP_2_2_DP_RXSTATUS_LEN) {
+		drm_dbg_kms(&i915->drm,
+			    "Read bstatus from DP/AUX failed (%zd)\n", ret);
+		return ret >= 0 ? -EIO : ret;
+	}
+
+	return 0;
+}
+
+static
+int hdcp2_detect_msg_availability(struct intel_digital_port *dig_port,
+				  u8 msg_id, bool *msg_ready)
+{
+	u8 rx_status;
+	int ret;
+
+	*msg_ready = false;
+	ret = intel_dp_hdcp2_read_rx_status(dig_port, &rx_status);
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
+intel_dp_hdcp2_wait_for_msg(struct intel_digital_port *dig_port,
+			    const struct hdcp2_dp_msg_data *hdcp2_msg_data)
+{
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct intel_dp *dp = &dig_port->dp;
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
+		ret = hdcp2_detect_msg_availability(dig_port,
+						    msg_id, &msg_ready);
+		if (!msg_ready)
+			ret = -ETIMEDOUT;
+	}
+
+	if (ret)
+		drm_dbg_kms(&i915->drm,
+			    "msg_id %d, ret %d, timeout(mSec): %d\n",
+			    hdcp2_msg_data->msg_id, ret, timeout);
+
+	return ret;
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
+int intel_dp_hdcp2_write_msg(struct intel_digital_port *dig_port,
+			     void *buf, size_t size)
+{
+	struct intel_dp *dp = &dig_port->dp;
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
+		ret = drm_dp_dpcd_write(&dig_port->dp.aux,
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
+static
+ssize_t get_receiver_id_list_size(struct intel_digital_port *dig_port)
+{
+	u8 rx_info[HDCP_2_2_RXINFO_LEN];
+	u32 dev_cnt;
+	ssize_t ret;
+
+	ret = drm_dp_dpcd_read(&dig_port->dp.aux,
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
+int intel_dp_hdcp2_read_msg(struct intel_digital_port *dig_port,
+			    u8 msg_id, void *buf, size_t size)
+{
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
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
+	ret = intel_dp_hdcp2_wait_for_msg(dig_port, hdcp2_msg_data);
+	if (ret < 0)
+		return ret;
+
+	if (msg_id == HDCP_2_2_REP_SEND_RECVID_LIST) {
+		ret = get_receiver_id_list_size(dig_port);
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
+		ret = drm_dp_dpcd_read(&dig_port->dp.aux, offset,
+				       (void *)byte, len);
+		if (ret < 0) {
+			drm_dbg_kms(&i915->drm, "msg_id %d, ret %zd\n",
+				    msg_id, ret);
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
+int intel_dp_hdcp2_config_stream_type(struct intel_digital_port *dig_port,
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
+	ret =  intel_dp_hdcp2_write_msg(dig_port, &stream_type_msg,
+					sizeof(stream_type_msg));
+
+	return ret < 0 ? ret : 0;
+
+}
+
+static
+int intel_dp_hdcp2_check_link(struct intel_digital_port *dig_port)
+{
+	u8 rx_status;
+	int ret;
+
+	ret = intel_dp_hdcp2_read_rx_status(dig_port, &rx_status);
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
+int intel_dp_hdcp2_capable(struct intel_digital_port *dig_port,
+			   bool *capable)
+{
+	u8 rx_caps[3];
+	int ret;
+
+	*capable = false;
+	ret = drm_dp_dpcd_read(&dig_port->dp.aux,
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
+int intel_dp_init_hdcp(struct intel_digital_port *dig_port,
+		       struct intel_connector *intel_connector)
+{
+	struct drm_device *dev = intel_connector->base.dev;
+	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct intel_encoder *intel_encoder = &dig_port->base;
+	enum port port = intel_encoder->port;
+	struct intel_dp *intel_dp = &dig_port->dp;
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
