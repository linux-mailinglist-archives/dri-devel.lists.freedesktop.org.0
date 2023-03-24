Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A21396C8662
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 20:56:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F1E10ECA1;
	Fri, 24 Mar 2023 19:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AD910EC82
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 19:56:25 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-544f7c176easo52366047b3.9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 12:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1679687785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RQgvC0Q+CIVmgyjgzJ3RO6pVvgPsqkRgZbyp5TJJC/E=;
 b=nao4ys2THlP2qzz/hvaYZ46VhKz5kmSSLlfiKMcsxahwNtUrGsjE+TJXVFzkrDW+uQ
 uX1m++lDXVW2wDknr5JgLIzY3cOU8TprtH+5nwbVG/cAHa6mB1L2oZDi1grKAgWX+CmJ
 Wy0pMymy6h/9HQZ4TwPnEq+540mwLOzW937hU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679687785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RQgvC0Q+CIVmgyjgzJ3RO6pVvgPsqkRgZbyp5TJJC/E=;
 b=BJkcKx8ky95fSyyu1YhWlMfnL4q1b90ZsunsXonZgoprYNZLv/3ONCHUyRzYIIkFSF
 UhyzSz4e+OZXby2wbzJ58B32oe6KG3W7TsTE1LtHETO8oiX/bNQbNN8IhIdBkcCywJvr
 FZmuCzowqD5G0GHypTtJFRT04S5EJwjtEn/qoXmsu+qcCKFSVG0erTeyqK9FOO0F1hMS
 D37+kO58cTPhR9RQNByKCTWF0fWI6d+bQ9B3QJBINVY+Xzujyh37zcBYA4PAUtM/7Dnf
 a7fVl70CJGmIS5w/AVWrggKRgceuoD8a87UAn8a9rh6Veu6sk6RJOWgKfxHEc1ScjUYe
 3g7A==
X-Gm-Message-State: AAQBX9eECvIWvGhhtj37gsVmpsprFDvdyLmCRcvnXUIlh6423aSREYmH
 i0tYqBADGTaYJAA8Ss3CRlhImQ==
X-Google-Smtp-Source: AKy350aeatoBZN8xOV+tJZxdXvRWtVeagyToWkPSlLqYCQSTAH72e/Xpr6dbeFqCiqT63OR4ngr6Jw==
X-Received: by 2002:a81:6803:0:b0:545:d67:7411 with SMTP id
 d3-20020a816803000000b005450d677411mr3233789ywc.29.1679687784984; 
 Fri, 24 Mar 2023 12:56:24 -0700 (PDT)
Received: from localhost ([2620:0:1035:15:5509:ec45:2b32:b39f])
 by smtp.gmail.com with UTF8SMTPSA id
 h82-20020a252155000000b00b7767ca7493sm642768ybh.48.2023.03.24.12.56.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 12:56:24 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v7 07/10] drm/i915/hdcp: Use HDCP helpers for i915
Date: Fri, 24 Mar 2023 15:55:51 -0400
Message-Id: <20230324195555.3921170-8-markyacoub@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230324195555.3921170-1-markyacoub@google.com>
References: <20230324195555.3921170-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: suraj.kandpal@intel.com, Jani Nikula <jani.nikula@intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, intel-gfx@lists.freedesktop.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, seanpaul@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Now that all of the HDCP 1.x logic has been migrated to the central HDCP
helpers, use it in the i915 driver.

The majority of the driver code for HDCP 1.x will live in intel_hdcp.c,
however there are a few helper hooks which are connector-specific and
need to be partially or fully implemented in the intel_dp_hdcp.c or
intel_hdmi.c.

We'll leave most of the HDCP 2.x code alone since we don't have another
implementation of HDCP 2.x to use as reference for what should and
should not live in the drm helpers. The helper will call the overly
general enable/disable/is_capable HDCP 2.x callbacks and leave the
interesting stuff for the driver. Once we have another HDCP 2.x
implementation, we should do a similar migration.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Mark Yacoub <markyacoub@chromium.org>

---
Changes in v2:
-Fix mst helper function pointer reported by 0-day
Changes in v3:
-Add forward declaration for drm_atomic_state in intel_hdcp.h identified
 by 0-day
Changes in v4:
-None
Changes in v5:
-None
Changes in v6:
-Rebased.
Changes in v7:
-Added to drm_hdcp_helper_funcs new functions that are unique between DP
and HDMI
-Adjusted the function signatures to take "driver data"

 drivers/gpu/drm/i915/display/intel_ddi.c      |  32 +-
 .../drm/i915/display/intel_display_debugfs.c  |   6 +-
 .../drm/i915/display/intel_display_types.h    |  51 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  | 368 +++----
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  16 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 960 ++++--------------
 drivers/gpu/drm/i915/display/intel_hdcp.h     |  37 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 276 ++---
 8 files changed, 484 insertions(+), 1262 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 0f1ec2a98cc87..550a99d1811b4 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -28,6 +28,7 @@
 #include <linux/string_helpers.h>
 
 #include <drm/display/drm_scdc_helper.h>
+#include <drm/display/drm_hdcp_helper.h>
 #include <drm/drm_privacy_screen_consumer.h>
 
 #include "i915_drv.h"
@@ -2941,6 +2942,10 @@ static void intel_enable_ddi(struct intel_atomic_state *state,
 			     const struct intel_crtc_state *crtc_state,
 			     const struct drm_connector_state *conn_state)
 {
+	struct intel_connector *connector =
+		to_intel_connector(conn_state->connector);
+	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
+
 	drm_WARN_ON(state->base.dev, crtc_state->has_pch_encoder);
 
 	if (!intel_crtc_is_bigjoiner_slave(crtc_state))
@@ -2957,12 +2962,10 @@ static void intel_enable_ddi(struct intel_atomic_state *state,
 	else
 		intel_enable_ddi_dp(state, encoder, crtc_state, conn_state);
 
-	/* Enable hdcp if it's desired */
-	if (conn_state->content_protection ==
-	    DRM_MODE_CONTENT_PROTECTION_DESIRED)
-		intel_hdcp_enable(to_intel_connector(conn_state->connector),
-				  crtc_state,
-				  (u8)conn_state->hdcp_content_type);
+	if (connector->hdcp_helper_data)
+		drm_hdcp_helper_atomic_commit(connector->hdcp_helper_data,
+					      &state->base,
+					      &dig_port->hdcp_mutex);
 }
 
 static void intel_disable_ddi_dp(struct intel_atomic_state *state,
@@ -3008,7 +3011,14 @@ static void intel_disable_ddi(struct intel_atomic_state *state,
 			      const struct intel_crtc_state *old_crtc_state,
 			      const struct drm_connector_state *old_conn_state)
 {
-	intel_hdcp_disable(to_intel_connector(old_conn_state->connector));
+	struct intel_connector *connector =
+		to_intel_connector(old_conn_state->connector);
+	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
+
+	if (connector->hdcp_helper_data)
+		drm_hdcp_helper_atomic_commit(connector->hdcp_helper_data,
+					      &state->base,
+					      &dig_port->hdcp_mutex);
 
 	if (intel_crtc_has_type(old_crtc_state, INTEL_OUTPUT_HDMI))
 		intel_disable_ddi_hdmi(state, encoder, old_crtc_state,
@@ -3036,13 +3046,19 @@ void intel_ddi_update_pipe(struct intel_atomic_state *state,
 			   const struct intel_crtc_state *crtc_state,
 			   const struct drm_connector_state *conn_state)
 {
+	struct intel_connector *connector =
+		to_intel_connector(conn_state->connector);
+	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 
 	if (!intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI) &&
 	    !intel_encoder_is_mst(encoder))
 		intel_ddi_update_pipe_dp(state, encoder, crtc_state,
 					 conn_state);
 
-	intel_hdcp_update_pipe(state, encoder, crtc_state, conn_state);
+	if (connector->hdcp_helper_data)
+		drm_hdcp_helper_atomic_commit(connector->hdcp_helper_data,
+					      &state->base,
+					      &dig_port->hdcp_mutex);
 }
 
 static void
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index a14b86a07e545..b6a9c00a1b541 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_fourcc.h>
+#include <drm/display/drm_hdcp_helper.h>
 
 #include "i915_debugfs.h"
 #include "i915_irq.h"
@@ -502,10 +503,11 @@ static void intel_hdcp_info(struct seq_file *m,
 		goto out;
 	}
 
-	ret = intel_hdcp_capable(intel_connector, &hdcp_cap);
+	ret = intel_connector->hdcp_helper_data->funcs->hdcp1_capable(
+		intel_connector->hdcp_helper_data, &hdcp_cap);
 	if (ret)
 		hdcp_cap = false;
-	ret = intel_hdcp2_capable(intel_connector, &hdcp2_cap);
+	ret = intel_hdcp2_capable(&intel_connector->base, &hdcp2_cap);
 	if (ret)
 		hdcp2_cap = false;
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index f07395065a69f..b8b9d2109cc4b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -430,64 +430,14 @@ enum check_link_response {
  *		to send it over DP AUX vs DDC
  */
 struct intel_hdcp_shim {
-	/* Outputs the transmitter's An and Aksv values to the receiver. */
-	int (*write_an_aksv)(struct intel_digital_port *dig_port, u8 *an);
-
-	/* Reads the receiver's key selection vector */
-	int (*read_bksv)(struct intel_digital_port *dig_port, u8 *bksv);
-
-	/*
-	 * Reads BINFO from DP receivers and BSTATUS from HDMI receivers. The
-	 * definitions are the same in the respective specs, but the names are
-	 * different. Call it BSTATUS since that's the name the HDMI spec
-	 * uses and it was there first.
-	 */
-	int (*read_bstatus)(struct intel_digital_port *dig_port,
-			    u8 *bstatus);
-
-	/* Determines whether a repeater is present downstream */
-	int (*repeater_present)(struct intel_digital_port *dig_port,
-				bool *repeater_present);
-
-	/* Reads the receiver's Ri' value */
-	int (*read_ri_prime)(struct intel_digital_port *dig_port, u8 *ri);
-
-	/* Determines if the receiver's KSV FIFO is ready for consumption */
-	int (*read_ksv_ready)(struct intel_digital_port *dig_port,
-			      bool *ksv_ready);
-
-	/* Reads the ksv fifo for num_downstream devices */
-	int (*read_ksv_fifo)(struct intel_digital_port *dig_port,
-			     int num_downstream, u8 *ksv_fifo);
-
-	/* Reads a 32-bit part of V' from the receiver */
-	int (*read_v_prime_part)(struct intel_digital_port *dig_port,
-				 int i, u32 *part);
-
 	/* Enables HDCP signalling on the port */
 	int (*toggle_signalling)(struct intel_digital_port *dig_port,
 				 enum transcoder cpu_transcoder,
 				 bool enable);
 
-	/* Enable/Disable stream encryption on DP MST Transport Link */
-	int (*stream_encryption)(struct intel_connector *connector,
-				 bool enable);
-
-	/* Ensures the link is still protected */
-	bool (*check_link)(struct intel_digital_port *dig_port,
-			   struct intel_connector *connector);
-
-	/* Detects panel's hdcp capability. This is optional for HDMI. */
-	int (*hdcp_capable)(struct intel_digital_port *dig_port,
-			    bool *hdcp_capable);
-
 	/* HDCP adaptation(DP/HDMI) required on the port */
 	enum hdcp_wired_protocol protocol;
 
-	/* Detects whether sink is HDCP2.2 capable */
-	int (*hdcp_2_2_capable)(struct intel_digital_port *dig_port,
-				bool *capable);
-
 	/* Write HDCP2.2 messages */
 	int (*write_2_2_msg)(struct intel_digital_port *dig_port,
 			     void *buf, size_t size);
@@ -610,6 +560,7 @@ struct intel_connector {
 	struct work_struct modeset_retry_work;
 
 	struct intel_hdcp hdcp;
+	struct drm_hdcp_helper_data *hdcp_helper_data;
 };
 
 struct intel_digital_connector_state {
diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
index e0c1771614072..694798a169f03 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
@@ -48,17 +48,24 @@ static void intel_dp_hdcp_wait_for_cp_irq(struct intel_hdcp *hdcp, int timeout)
 		DRM_DEBUG_KMS("Timedout at waiting for CP_IRQ\n");
 }
 
-static
-int intel_dp_hdcp_write_an_aksv(struct intel_digital_port *dig_port,
-				u8 *an)
+static int intel_dp_hdcp_send_an_aksv(struct drm_connector *drm_connector,
+				      void *driver_data)
 {
+	struct intel_connector *connector = to_intel_connector(drm_connector);
+	struct intel_digital_port *dig_port =
+		intel_attached_dig_port(connector);
 	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct drm_hdcp_an an;
 	u8 aksv[DRM_HDCP_KSV_LEN] = {};
 	ssize_t dpcd_ret;
+	int ret;
+
+	ret = intel_hdcp1_read_an(drm_connector, &an);
+	if (ret)
+		return ret;
 
-	/* Output An first, that's easy */
 	dpcd_ret = drm_dp_dpcd_write(&dig_port->dp.aux, DP_AUX_HDCP_AN,
-				     an, DRM_HDCP_AN_LEN);
+				     an.bytes, DRM_HDCP_AN_LEN);
 	if (dpcd_ret != DRM_HDCP_AN_LEN) {
 		drm_dbg_kms(&i915->drm,
 			    "Failed to write An over DP/AUX (%zd)\n",
@@ -84,158 +91,6 @@ int intel_dp_hdcp_write_an_aksv(struct intel_digital_port *dig_port,
 	return 0;
 }
 
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
 static
 int intel_dp_hdcp_toggle_signalling(struct intel_digital_port *dig_port,
 				    enum transcoder cpu_transcoder,
@@ -245,40 +100,6 @@ int intel_dp_hdcp_toggle_signalling(struct intel_digital_port *dig_port,
 	return 0;
 }
 
-static
-bool intel_dp_hdcp_check_link(struct intel_digital_port *dig_port,
-			      struct intel_connector *connector)
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
 struct hdcp2_dp_errata_stream_type {
 	u8	msg_id;
 	u8	stream_type;
@@ -621,13 +442,19 @@ int intel_dp_hdcp2_check_link(struct intel_digital_port *dig_port,
 	return ret;
 }
 
-static
-int intel_dp_hdcp2_capable(struct intel_digital_port *dig_port,
-			   bool *capable)
+static int intel_dp_hdcp2_capable(struct drm_connector *drm_connector,
+				  bool *capable, void *driver_data)
 {
+	struct intel_connector *connector = to_intel_connector(drm_connector);
+	struct intel_digital_port *dig_port =
+		intel_attached_dig_port(connector);
 	u8 rx_caps[3];
 	int ret;
 
+	ret = intel_hdcp2_capable(drm_connector, capable);
+	if (ret || !capable)
+		return ret;
+
 	*capable = false;
 	ret = drm_dp_dpcd_read(&dig_port->dp.aux,
 			       DP_HDCP_2_2_REG_RX_CAPS_OFFSET,
@@ -643,22 +470,11 @@ int intel_dp_hdcp2_capable(struct intel_digital_port *dig_port,
 }
 
 static const struct intel_hdcp_shim intel_dp_hdcp_shim = {
-	.write_an_aksv = intel_dp_hdcp_write_an_aksv,
-	.read_bksv = intel_dp_hdcp_read_bksv,
-	.read_bstatus = intel_dp_hdcp_read_bstatus,
-	.repeater_present = intel_dp_hdcp_repeater_present,
-	.read_ri_prime = intel_dp_hdcp_read_ri_prime,
-	.read_ksv_ready = intel_dp_hdcp_read_ksv_ready,
-	.read_ksv_fifo = intel_dp_hdcp_read_ksv_fifo,
-	.read_v_prime_part = intel_dp_hdcp_read_v_prime_part,
 	.toggle_signalling = intel_dp_hdcp_toggle_signalling,
-	.check_link = intel_dp_hdcp_check_link,
-	.hdcp_capable = intel_dp_hdcp_capable,
 	.write_2_2_msg = intel_dp_hdcp2_write_msg,
 	.read_2_2_msg = intel_dp_hdcp2_read_msg,
 	.config_stream_type = intel_dp_hdcp2_config_stream_type,
 	.check_2_2_link = intel_dp_hdcp2_check_link,
-	.hdcp_2_2_capable = intel_dp_hdcp2_capable,
 	.protocol = HDCP_PROTOCOL_DP,
 };
 
@@ -714,6 +530,48 @@ intel_dp_mst_hdcp_stream_encryption(struct intel_connector *connector,
 	return 0;
 }
 
+static int
+intel_dp_mst_hdcp1_post_encryption(struct drm_connector *drm_connector,
+				   void *driver_data)
+{
+	struct intel_connector *connector = to_intel_connector(drm_connector);
+	int ret;
+
+	ret = intel_hdcp1_post_encryption(drm_connector, driver_data);
+	if (ret)
+		return ret;
+
+	return intel_dp_mst_hdcp_stream_encryption(connector, true);
+}
+
+static int intel_dp_mst_hdcp1_disable(struct drm_connector *drm_connector,
+				      void *driver_data)
+{
+	struct intel_connector *connector = to_intel_connector(drm_connector);
+	struct intel_digital_port *dig_port =
+		intel_attached_dig_port(connector);
+	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	int ret;
+
+	ret = intel_dp_mst_hdcp_stream_encryption(connector, true);
+	if (ret) {
+		drm_err(&i915->drm,
+			"[%s:%d] Failed to disable HDCP 1.4 stream enc\n",
+			connector->base.name, connector->base.base.id);
+		return ret;
+	}
+
+	/*
+	 * If there are other connectors on this port using HDCP,
+	 * don't disable it until it disabled HDCP encryption for
+	 * all connectors in MST topology.
+	*/
+	if (dig_port->num_hdcp_streams > 0)
+		return 0;
+
+	return intel_hdcp1_disable(drm_connector, driver_data);
+}
+
 static int
 intel_dp_mst_hdcp2_stream_encryption(struct intel_connector *connector,
 				     bool enable)
@@ -772,45 +630,101 @@ int intel_dp_mst_hdcp2_check_link(struct intel_digital_port *dig_port,
 }
 
 static const struct intel_hdcp_shim intel_dp_mst_hdcp_shim = {
-	.write_an_aksv = intel_dp_hdcp_write_an_aksv,
-	.read_bksv = intel_dp_hdcp_read_bksv,
-	.read_bstatus = intel_dp_hdcp_read_bstatus,
-	.repeater_present = intel_dp_hdcp_repeater_present,
-	.read_ri_prime = intel_dp_hdcp_read_ri_prime,
-	.read_ksv_ready = intel_dp_hdcp_read_ksv_ready,
-	.read_ksv_fifo = intel_dp_hdcp_read_ksv_fifo,
-	.read_v_prime_part = intel_dp_hdcp_read_v_prime_part,
 	.toggle_signalling = intel_dp_hdcp_toggle_signalling,
-	.stream_encryption = intel_dp_mst_hdcp_stream_encryption,
-	.check_link = intel_dp_hdcp_check_link,
-	.hdcp_capable = intel_dp_hdcp_capable,
 	.write_2_2_msg = intel_dp_hdcp2_write_msg,
 	.read_2_2_msg = intel_dp_hdcp2_read_msg,
 	.config_stream_type = intel_dp_hdcp2_config_stream_type,
 	.stream_2_2_encryption = intel_dp_mst_hdcp2_stream_encryption,
 	.check_2_2_link = intel_dp_mst_hdcp2_check_link,
-	.hdcp_2_2_capable = intel_dp_hdcp2_capable,
 	.protocol = HDCP_PROTOCOL_DP,
 };
 
+static const struct drm_hdcp_helper_funcs intel_dp_hdcp_helper_funcs = {
+	.setup = intel_hdcp_setup,
+	.load_keys = intel_hdcp_load_keys,
+	.hdcp2_capable = intel_dp_hdcp2_capable,
+	.hdcp2_enable = intel_hdcp2_enable,
+	.hdcp2_check_link = intel_hdcp2_check_link,
+	.hdcp2_disable = intel_hdcp2_disable,
+	.hdcp1_send_an_aksv = intel_dp_hdcp_send_an_aksv,
+	.hdcp1_store_receiver_info = intel_hdcp1_store_receiver_info,
+	.hdcp1_enable_encryption = intel_hdcp1_enable_encryption,
+	.hdcp1_wait_for_r0 = intel_hdcp1_wait_for_r0,
+	.hdcp1_match_ri = intel_hdcp1_match_ri,
+	.hdcp1_post_encryption = intel_hdcp1_post_encryption,
+	.hdcp1_store_ksv_fifo = intel_hdcp1_store_ksv_fifo,
+	.hdcp1_disable = intel_hdcp1_disable,
+	/* Common DRM functions that are different between DP vs HDMI*/
+	.remote_read = drm_hdcp_remote_dpcd_read,
+	.remote_write = drm_hdcp_remote_dpcd_write,
+	.hdcp1_capable = drm_hdcp_helper_hdcp1_capable_dp,
+	.hdcp1_ksv_fifo_ready = drm_hdcp_helper_hdcp1_ksv_fifo_ready_dp,
+	.wait_r0 = drm_hdcp_helper_wait_r0_dp,
+	.hdcp1_check_link_registers = drm_hdcp_hdcp1_check_link_registers_dp,
+	.hdcp1_read_ksv_fifo = drm_hdcp_helper_hdcp1_read_ksv_fifo_dp
+};
+
+static const struct drm_hdcp_helper_funcs intel_dp_mst_hdcp_helper_funcs = {
+	.setup = intel_hdcp_setup,
+	.load_keys = intel_hdcp_load_keys,
+	.hdcp2_capable = intel_dp_hdcp2_capable,
+	.hdcp2_enable = intel_hdcp2_enable,
+	.hdcp2_check_link = intel_hdcp2_check_link,
+	.hdcp2_disable = intel_hdcp2_disable,
+	.hdcp1_send_an_aksv = intel_dp_hdcp_send_an_aksv,
+	.hdcp1_store_receiver_info = intel_hdcp1_store_receiver_info,
+	.hdcp1_enable_encryption = intel_hdcp1_enable_encryption,
+	.hdcp1_wait_for_r0 = intel_hdcp1_wait_for_r0,
+	.hdcp1_match_ri = intel_hdcp1_match_ri,
+	.hdcp1_post_encryption = intel_dp_mst_hdcp1_post_encryption,
+	.hdcp1_store_ksv_fifo = intel_hdcp1_store_ksv_fifo,
+	.hdcp1_disable = intel_dp_mst_hdcp1_disable,
+	/* Common DRM functions that are different between DP vs HDMI*/
+	.remote_read = drm_hdcp_remote_dpcd_read,
+	.remote_write = drm_hdcp_remote_dpcd_write,
+	.hdcp1_capable = drm_hdcp_helper_hdcp1_capable_dp,
+	.hdcp1_ksv_fifo_ready = drm_hdcp_helper_hdcp1_ksv_fifo_ready_dp,
+	.wait_r0 = drm_hdcp_helper_wait_r0_dp,
+	.hdcp1_check_link_registers = drm_hdcp_hdcp1_check_link_registers_dp,
+	.hdcp1_read_ksv_fifo = drm_hdcp_helper_hdcp1_read_ksv_fifo_dp
+};
+
 int intel_dp_hdcp_init(struct intel_digital_port *dig_port,
-		       struct intel_connector *intel_connector)
+		       struct intel_connector *connector)
 {
-	struct drm_device *dev = intel_connector->base.dev;
-	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct intel_encoder *intel_encoder = &dig_port->base;
 	enum port port = intel_encoder->port;
 	struct intel_dp *intel_dp = &dig_port->dp;
+	struct drm_hdcp_helper_data *data;
+	const struct drm_hdcp_helper_funcs *helper_funcs;
+	const struct intel_hdcp_shim *intel_shim;
+	int ret;
 
-	if (!is_hdcp_supported(dev_priv, port))
+	if (!is_hdcp_supported(dev_priv, port) || intel_dp_is_edp(intel_dp))
 		return 0;
 
-	if (intel_connector->mst_port)
-		return intel_hdcp_init(intel_connector, dig_port,
-				       &intel_dp_mst_hdcp_shim);
-	else if (!intel_dp_is_edp(intel_dp))
-		return intel_hdcp_init(intel_connector, dig_port,
-				       &intel_dp_hdcp_shim);
+	if (connector->mst_port) {
+		helper_funcs = &intel_dp_mst_hdcp_helper_funcs;
+		intel_shim = &intel_dp_mst_hdcp_shim;
+	} else {
+		helper_funcs = &intel_dp_hdcp_helper_funcs;
+		intel_shim = &intel_dp_hdcp_shim;
+	}
+
+	data = drm_hdcp_helper_initialize_dp(&connector->base, &dig_port->dp.aux, 
+										 helper_funcs, true);
+	if (IS_ERR(data)) {
+		drm_dbg_kms(&dev_priv->drm, "HDCP init failed, skipping.\n");
+		return PTR_ERR(data);
+	}
+
+	ret = intel_hdcp_init(connector, dig_port, intel_shim);
+	if (ret) {
+		drm_hdcp_helper_destroy(data);
+		return ret;
+	}
 
+	connector->hdcp_helper_data = data;
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 4077a979a9249..73088715d39bd 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -23,6 +23,7 @@
  *
  */
 
+#include <drm/display/drm_hdcp_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
@@ -41,7 +42,6 @@
 #include "intel_dp_hdcp.h"
 #include "intel_dp_mst.h"
 #include "intel_dpio_phy.h"
-#include "intel_hdcp.h"
 #include "intel_hotplug.h"
 #include "skl_scaler.h"
 
@@ -372,7 +372,10 @@ static void intel_mst_disable_dp(struct intel_atomic_state *state,
 	drm_dbg_kms(&i915->drm, "active links %d\n",
 		    intel_dp->active_mst_links);
 
-	intel_hdcp_disable(intel_mst->connector);
+	if (connector->hdcp_helper_data)
+		drm_hdcp_helper_atomic_commit(connector->hdcp_helper_data,
+					      &state->base,
+					      &dig_port->hdcp_mutex);
 
 	drm_dp_remove_payload(&intel_dp->mst_mgr, mst_state,
 			      drm_atomic_get_mst_payload_state(mst_state, connector->port));
@@ -580,11 +583,10 @@ static void intel_mst_enable_dp(struct intel_atomic_state *state,
 	intel_audio_codec_enable(encoder, pipe_config, conn_state);
 
 	/* Enable hdcp if it's desired */
-	if (conn_state->content_protection ==
-	    DRM_MODE_CONTENT_PROTECTION_DESIRED)
-		intel_hdcp_enable(to_intel_connector(conn_state->connector),
-				  pipe_config,
-				  (u8)conn_state->hdcp_content_type);
+	if (connector->hdcp_helper_data)
+		drm_hdcp_helper_atomic_commit(connector->hdcp_helper_data,
+					      &state->base,
+					      &dig_port->hdcp_mutex);
 }
 
 static bool intel_dp_mst_enc_get_hw_state(struct intel_encoder *encoder,
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 61a862ae1f286..96e6c4e587d8c 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -140,67 +140,10 @@ static int intel_hdcp_prepare_streams(struct intel_connector *connector)
 	return 0;
 }
 
-static
-bool intel_hdcp_is_ksv_valid(u8 *ksv)
-{
-	int i, ones = 0;
-	/* KSV has 20 1's and 20 0's */
-	for (i = 0; i < DRM_HDCP_KSV_LEN; i++)
-		ones += hweight8(ksv[i]);
-	if (ones != 20)
-		return false;
-
-	return true;
-}
-
-static
-int intel_hdcp_read_valid_bksv(struct intel_digital_port *dig_port,
-			       const struct intel_hdcp_shim *shim, u8 *bksv)
-{
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
-	int ret, i, tries = 2;
-
-	/* HDCP spec states that we must retry the bksv if it is invalid */
-	for (i = 0; i < tries; i++) {
-		ret = shim->read_bksv(dig_port, bksv);
-		if (ret)
-			return ret;
-		if (intel_hdcp_is_ksv_valid(bksv))
-			break;
-	}
-	if (i == tries) {
-		drm_dbg_kms(&i915->drm, "Bksv is invalid\n");
-		return -ENODEV;
-	}
-
-	return 0;
-}
-
-/* Is HDCP1.4 capable on Platform and Sink */
-int intel_hdcp_capable(struct intel_connector *connector, bool *capable)
-{
-	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
-	const struct intel_hdcp_shim *shim = connector->hdcp.shim;
-	u8 bksv[5];
-
-	*capable = false;
-
-	if (!shim)
-		return 0;
-
-	if (shim->hdcp_capable)
-		return shim->hdcp_capable(dig_port, capable);
-
-	if (!intel_hdcp_read_valid_bksv(dig_port, shim, bksv))
-		*capable = true;
-
-	return 0;
-}
-
 /* Is HDCP2.2 capable on Platform and Sink */
-int intel_hdcp2_capable(struct intel_connector *connector, bool *capable)
+int intel_hdcp2_capable(struct drm_connector *drm_connector, bool *capable)
 {
-	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
+	struct intel_connector *connector = to_intel_connector(drm_connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 
@@ -218,16 +161,26 @@ int intel_hdcp2_capable(struct intel_connector *connector, bool *capable)
 	}
 	mutex_unlock(&dev_priv->display.hdcp.comp_mutex);
 
-	/* Sink's capability for HDCP2.2 */
-	return hdcp->shim->hdcp_2_2_capable(dig_port, capable);
+	return 0;
 }
 
-static bool intel_hdcp_in_use(struct drm_i915_private *dev_priv,
-			      enum transcoder cpu_transcoder, enum port port)
+int intel_hdcp1_check_link(struct drm_connector *drm_connector)
 {
-	return intel_de_read(dev_priv,
-	                     HDCP_STATUS(dev_priv, cpu_transcoder, port)) &
-	       HDCP_STATUS_ENC;
+	struct intel_connector *connector = to_intel_connector(drm_connector);
+	struct intel_digital_port *dig_port =
+		intel_attached_dig_port(connector);
+	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	enum transcoder cpu_transcoder = connector->hdcp.cpu_transcoder;
+	enum port port = dig_port->base.port;
+	u32 val;
+
+	val = intel_de_read(dev_priv,
+			    HDCP_STATUS(dev_priv, cpu_transcoder, port));
+
+	if (val & HDCP_STATUS_ENC)
+		return 0;
+
+	return -EINVAL;
 }
 
 static bool intel_hdcp2_in_use(struct drm_i915_private *dev_priv,
@@ -238,27 +191,6 @@ static bool intel_hdcp2_in_use(struct drm_i915_private *dev_priv,
 	       LINK_ENCRYPTION_STATUS;
 }
 
-static int intel_hdcp_poll_ksv_fifo(struct intel_digital_port *dig_port,
-				    const struct intel_hdcp_shim *shim)
-{
-	int ret, read_ret;
-	bool ksv_ready;
-
-	/* Poll for ksv list ready (spec says max time allowed is 5s) */
-	ret = __wait_for(read_ret = shim->read_ksv_ready(dig_port,
-							 &ksv_ready),
-			 read_ret || ksv_ready, 5 * 1000 * 1000, 1000,
-			 100 * 1000);
-	if (ret)
-		return ret;
-	if (read_ret)
-		return read_ret;
-	if (!ksv_ready)
-		return -ETIMEDOUT;
-
-	return 0;
-}
-
 static bool hdcp_key_loadable(struct drm_i915_private *dev_priv)
 {
 	enum i915_power_well_id id;
@@ -294,11 +226,18 @@ static void intel_hdcp_clear_keys(struct drm_i915_private *dev_priv)
 		       HDCP_KEY_LOAD_DONE | HDCP_KEY_LOAD_STATUS | HDCP_FUSE_IN_PROGRESS | HDCP_FUSE_ERROR | HDCP_FUSE_DONE);
 }
 
-static int intel_hdcp_load_keys(struct drm_i915_private *dev_priv)
+int intel_hdcp_load_keys(struct drm_connector *drm_connector, void *driver_data)
 {
+	struct intel_connector *connector = to_intel_connector(drm_connector);
+	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	int ret;
 	u32 val;
 
+	if (!hdcp_key_loadable(dev_priv)) {
+		drm_err(&dev_priv->drm, "HDCP key Load is not possible\n");
+		return -ENXIO;
+	}
+
 	val = intel_de_read(dev_priv, HDCP_KEY_STATUS);
 	if ((val & HDCP_KEY_LOAD_DONE) && (val & HDCP_KEY_LOAD_STATUS))
 		return 0;
@@ -308,8 +247,11 @@ static int intel_hdcp_load_keys(struct drm_i915_private *dev_priv)
 	 * out of reset. So if Key is not already loaded, its an error state.
 	 */
 	if (IS_HASWELL(dev_priv) || IS_BROADWELL(dev_priv))
-		if (!(intel_de_read(dev_priv, HDCP_KEY_STATUS) & HDCP_KEY_LOAD_DONE))
-			return -ENXIO;
+		if (!(intel_de_read(dev_priv, HDCP_KEY_STATUS) &
+		      HDCP_KEY_LOAD_DONE)) {
+			ret = -ENXIO;
+			goto err;
+		}
 
 	/*
 	 * Initiate loading the HDCP key from fuses.
@@ -325,7 +267,7 @@ static int intel_hdcp_load_keys(struct drm_i915_private *dev_priv)
 			drm_err(&dev_priv->drm,
 				"Failed to initiate HDCP key load (%d)\n",
 				ret);
-			return ret;
+			goto err;
 		}
 	} else {
 		intel_de_write(dev_priv, HDCP_KEY_CONF, HDCP_KEY_LOAD_TRIGGER);
@@ -335,15 +277,21 @@ static int intel_hdcp_load_keys(struct drm_i915_private *dev_priv)
 	ret = __intel_wait_for_register(&dev_priv->uncore, HDCP_KEY_STATUS,
 					HDCP_KEY_LOAD_DONE, HDCP_KEY_LOAD_DONE,
 					10, 1, &val);
-	if (ret)
-		return ret;
-	else if (!(val & HDCP_KEY_LOAD_STATUS))
-		return -ENXIO;
+	if (ret) {
+		goto err;
+	} else if (!(val & HDCP_KEY_LOAD_STATUS)) {
+		ret = -ENXIO;
+		goto err;
+	}
 
 	/* Send Aksv over to PCH display for use in authentication */
 	intel_de_write(dev_priv, HDCP_KEY_CONF, HDCP_AKSV_SEND_TRIGGER);
 
 	return 0;
+
+err:
+	intel_hdcp_clear_keys(dev_priv);
+	return ret;
 }
 
 /* Returns updated SHA-1 index */
@@ -399,25 +347,21 @@ u32 intel_hdcp_get_repeater_ctl(struct drm_i915_private *dev_priv,
 	}
 }
 
-static
-int intel_hdcp_validate_v_prime(struct intel_connector *connector,
-				const struct intel_hdcp_shim *shim,
-				u8 *ksv_fifo, u8 num_downstream, u8 *bstatus)
+int intel_hdcp1_store_ksv_fifo(struct drm_connector *drm_connector,
+			       u8 *ksv_fifo, u8 num_downstream, u8 *bstatus,
+			       u32 *v_prime, void *driver_data)
 {
+	struct intel_connector *connector = to_intel_connector(drm_connector);
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	enum transcoder cpu_transcoder = connector->hdcp.cpu_transcoder;
 	enum port port = dig_port->base.port;
-	u32 vprime, sha_text, sha_leftovers, rep_ctl;
+	u32 sha_text, sha_leftovers, rep_ctl;
 	int ret, i, j, sha_idx;
 
 	/* Process V' values from the receiver */
-	for (i = 0; i < DRM_HDCP_V_PRIME_NUM_PARTS; i++) {
-		ret = shim->read_v_prime_part(dig_port, i, &vprime);
-		if (ret)
-			return ret;
-		intel_de_write(dev_priv, HDCP_SHA_V_PRIME(i), vprime);
-	}
+	for (i = 0; i < DRM_HDCP_V_PRIME_NUM_PARTS; i++)
+		intel_de_write(dev_priv, HDCP_SHA_V_PRIME(i), v_prime[i]);
 
 	/*
 	 * We need to write the concatenation of all device KSVs, BINFO (DP) ||
@@ -642,131 +586,38 @@ int intel_hdcp_validate_v_prime(struct intel_connector *connector,
 	return 0;
 }
 
-/* Implements Part 2 of the HDCP authorization procedure */
-static
-int intel_hdcp_auth_downstream(struct intel_connector *connector)
+int intel_hdcp1_store_receiver_info(struct drm_connector *drm_connector,
+				    u32 *ksv, u32 status, u8 caps,
+				    bool repeater_present, void *driver_data)
 {
+	struct intel_connector *connector = to_intel_connector(drm_connector);
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
-	const struct intel_hdcp_shim *shim = connector->hdcp.shim;
-	u8 bstatus[2], num_downstream, *ksv_fifo;
-	int ret, i, tries = 3;
-
-	ret = intel_hdcp_poll_ksv_fifo(dig_port, shim);
-	if (ret) {
-		drm_dbg_kms(&dev_priv->drm,
-			    "KSV list failed to become ready (%d)\n", ret);
-		return ret;
-	}
-
-	ret = shim->read_bstatus(dig_port, bstatus);
-	if (ret)
-		return ret;
-
-	if (DRM_HDCP_MAX_DEVICE_EXCEEDED(bstatus[0]) ||
-	    DRM_HDCP_MAX_CASCADE_EXCEEDED(bstatus[1])) {
-		drm_dbg_kms(&dev_priv->drm, "Max Topology Limit Exceeded\n");
-		return -EPERM;
-	}
-
-	/*
-	 * When repeater reports 0 device count, HDCP1.4 spec allows disabling
-	 * the HDCP encryption. That implies that repeater can't have its own
-	 * display. As there is no consumption of encrypted content in the
-	 * repeater with 0 downstream devices, we are failing the
-	 * authentication.
-	 */
-	num_downstream = DRM_HDCP_NUM_DOWNSTREAM(bstatus[0]);
-	if (num_downstream == 0) {
-		drm_dbg_kms(&dev_priv->drm,
-			    "Repeater with zero downstream devices\n");
-		return -EINVAL;
-	}
-
-	ksv_fifo = kcalloc(DRM_HDCP_KSV_LEN, num_downstream, GFP_KERNEL);
-	if (!ksv_fifo) {
-		drm_dbg_kms(&dev_priv->drm, "Out of mem: ksv_fifo\n");
-		return -ENOMEM;
-	}
-
-	ret = shim->read_ksv_fifo(dig_port, num_downstream, ksv_fifo);
-	if (ret)
-		goto err;
-
-	if (drm_hdcp_check_ksvs_revoked(&dev_priv->drm, ksv_fifo,
-					num_downstream) > 0) {
-		drm_err(&dev_priv->drm, "Revoked Ksv(s) in ksv_fifo\n");
-		ret = -EPERM;
-		goto err;
-	}
+	enum transcoder cpu_transcoder = connector->hdcp.cpu_transcoder;
+	enum port port = dig_port->base.port;
 
-	/*
-	 * When V prime mismatches, DP Spec mandates re-read of
-	 * V prime atleast twice.
-	 */
-	for (i = 0; i < tries; i++) {
-		ret = intel_hdcp_validate_v_prime(connector, shim,
-						  ksv_fifo, num_downstream,
-						  bstatus);
-		if (!ret)
-			break;
-	}
+	intel_de_write(dev_priv, HDCP_BKSVLO(dev_priv, cpu_transcoder, port),
+		       ksv[0]);
+	intel_de_write(dev_priv, HDCP_BKSVHI(dev_priv, cpu_transcoder, port),
+		       ksv[1]);
 
-	if (i == tries) {
-		drm_dbg_kms(&dev_priv->drm,
-			    "V Prime validation failed.(%d)\n", ret);
-		goto err;
-	}
+	if (repeater_present)
+		intel_de_write(dev_priv, HDCP_REP_CTL,
+			       intel_hdcp_get_repeater_ctl(
+				       dev_priv, cpu_transcoder, port));
 
-	drm_dbg_kms(&dev_priv->drm, "HDCP is enabled (%d downstream devices)\n",
-		    num_downstream);
-	ret = 0;
-err:
-	kfree(ksv_fifo);
-	return ret;
+	return 0;
 }
 
-/* Implements Part 1 of the HDCP authorization procedure */
-static int intel_hdcp_auth(struct intel_connector *connector)
+int intel_hdcp1_read_an(struct drm_connector *drm_connector,
+			struct drm_hdcp_an *an)
 {
+	struct intel_connector *connector = to_intel_connector(drm_connector);
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
-	struct intel_hdcp *hdcp = &connector->hdcp;
-	const struct intel_hdcp_shim *shim = hdcp->shim;
 	enum transcoder cpu_transcoder = connector->hdcp.cpu_transcoder;
 	enum port port = dig_port->base.port;
-	unsigned long r0_prime_gen_start;
-	int ret, i, tries = 2;
-	union {
-		u32 reg[2];
-		u8 shim[DRM_HDCP_AN_LEN];
-	} an;
-	union {
-		u32 reg[2];
-		u8 shim[DRM_HDCP_KSV_LEN];
-	} bksv;
-	union {
-		u32 reg;
-		u8 shim[DRM_HDCP_RI_LEN];
-	} ri;
-	bool repeater_present, hdcp_capable;
-
-	/*
-	 * Detects whether the display is HDCP capable. Although we check for
-	 * valid Bksv below, the HDCP over DP spec requires that we check
-	 * whether the display supports HDCP before we write An. For HDMI
-	 * displays, this is not necessary.
-	 */
-	if (shim->hdcp_capable) {
-		ret = shim->hdcp_capable(dig_port, &hdcp_capable);
-		if (ret)
-			return ret;
-		if (!hdcp_capable) {
-			drm_dbg_kms(&dev_priv->drm,
-				    "Panel is not HDCP capable\n");
-			return -EINVAL;
-		}
-	}
+	int i;
 
 	/* Initialize An with 2 random values and acquire it */
 	for (i = 0; i < 2; i++)
@@ -784,92 +635,83 @@ static int intel_hdcp_auth(struct intel_connector *connector)
 		return -ETIMEDOUT;
 	}
 
-	an.reg[0] = intel_de_read(dev_priv,
-				  HDCP_ANLO(dev_priv, cpu_transcoder, port));
-	an.reg[1] = intel_de_read(dev_priv,
-				  HDCP_ANHI(dev_priv, cpu_transcoder, port));
-	ret = shim->write_an_aksv(dig_port, an.shim);
-	if (ret)
-		return ret;
+	an->words[0] = intel_de_read(dev_priv,
+				     HDCP_ANLO(dev_priv, cpu_transcoder, port));
+	an->words[1] = intel_de_read(dev_priv,
+				     HDCP_ANHI(dev_priv, cpu_transcoder, port));
 
-	r0_prime_gen_start = jiffies;
-
-	memset(&bksv, 0, sizeof(bksv));
-
-	ret = intel_hdcp_read_valid_bksv(dig_port, shim, bksv.shim);
-	if (ret < 0)
-		return ret;
-
-	if (drm_hdcp_check_ksvs_revoked(&dev_priv->drm, bksv.shim, 1) > 0) {
-		drm_err(&dev_priv->drm, "BKSV is revoked\n");
-		return -EPERM;
-	}
-
-	intel_de_write(dev_priv, HDCP_BKSVLO(dev_priv, cpu_transcoder, port),
-		       bksv.reg[0]);
-	intel_de_write(dev_priv, HDCP_BKSVHI(dev_priv, cpu_transcoder, port),
-		       bksv.reg[1]);
-
-	ret = shim->repeater_present(dig_port, &repeater_present);
-	if (ret)
-		return ret;
-	if (repeater_present)
-		intel_de_write(dev_priv, HDCP_REP_CTL,
-			       intel_hdcp_get_repeater_ctl(dev_priv, cpu_transcoder, port));
+	return 0;
+}
 
-	ret = shim->toggle_signalling(dig_port, cpu_transcoder, true);
-	if (ret)
-		return ret;
+int intel_hdcp1_enable_encryption(struct drm_connector *drm_connector,
+				  void *driver_data)
+{
+	struct intel_connector *connector = to_intel_connector(drm_connector);
+	struct intel_digital_port *dig_port =
+		intel_attached_dig_port(connector);
+	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	enum transcoder cpu_transcoder = connector->hdcp.cpu_transcoder;
+	enum port port = dig_port->base.port;
 
 	intel_de_write(dev_priv, HDCP_CONF(dev_priv, cpu_transcoder, port),
 		       HDCP_CONF_AUTH_AND_ENC);
 
+	return 0;
+}
+
+int intel_hdcp1_wait_for_r0(struct drm_connector *drm_connector,
+			    void *driver_data)
+{
+	struct intel_connector *connector = to_intel_connector(drm_connector);
+	struct intel_digital_port *dig_port =
+		intel_attached_dig_port(connector);
+	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	enum transcoder cpu_transcoder = connector->hdcp.cpu_transcoder;
+	enum port port = dig_port->base.port;
+
 	/* Wait for R0 ready */
-	if (wait_for(intel_de_read(dev_priv, HDCP_STATUS(dev_priv, cpu_transcoder, port)) &
-		     (HDCP_STATUS_R0_READY | HDCP_STATUS_ENC), 1)) {
+	if (wait_for((intel_de_read(dev_priv, 
+								HDCP_STATUS(dev_priv, cpu_transcoder, port))) &
+			     (HDCP_STATUS_R0_READY | HDCP_STATUS_ENC), 1)) {
 		drm_err(&dev_priv->drm, "Timed out waiting for R0 ready\n");
 		return -ETIMEDOUT;
 	}
 
-	/*
-	 * Wait for R0' to become available. The spec says 100ms from Aksv, but
-	 * some monitors can take longer than this. We'll set the timeout at
-	 * 300ms just to be sure.
-	 *
-	 * On DP, there's an R0_READY bit available but no such bit
-	 * exists on HDMI. Since the upper-bound is the same, we'll just do
-	 * the stupid thing instead of polling on one and not the other.
-	 */
-	wait_remaining_ms_from_jiffies(r0_prime_gen_start, 300);
-
-	tries = 3;
+	return 0;
+}
 
-	/*
-	 * DP HDCP Spec mandates the two more reattempt to read R0, incase
-	 * of R0 mismatch.
-	 */
-	for (i = 0; i < tries; i++) {
-		ri.reg = 0;
-		ret = shim->read_ri_prime(dig_port, ri.shim);
-		if (ret)
-			return ret;
-		intel_de_write(dev_priv,
-			       HDCP_RPRIME(dev_priv, cpu_transcoder, port),
-			       ri.reg);
+int intel_hdcp1_match_ri(struct drm_connector *drm_connector, u32 ri_prime,
+			 void *driver_data)
+{
+	struct intel_connector *connector = to_intel_connector(drm_connector);
+	struct intel_digital_port *dig_port =
+		intel_attached_dig_port(connector);
+	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	enum transcoder cpu_transcoder = connector->hdcp.cpu_transcoder;
+	enum port port = dig_port->base.port;
 
-		/* Wait for Ri prime match */
-		if (!wait_for(intel_de_read(dev_priv, HDCP_STATUS(dev_priv, cpu_transcoder, port)) &
-			      (HDCP_STATUS_RI_MATCH | HDCP_STATUS_ENC), 1))
-			break;
-	}
+	intel_de_write(dev_priv, HDCP_RPRIME(dev_priv, cpu_transcoder, port),
+		       ri_prime);
 
-	if (i == tries) {
-		drm_dbg_kms(&dev_priv->drm,
-			    "Timed out waiting for Ri prime match (%x)\n",
-			    intel_de_read(dev_priv, HDCP_STATUS(dev_priv,
-					  cpu_transcoder, port)));
+	/* Wait for Ri prime match */
+	if (wait_for(intel_de_read(dev_priv,
+				   HDCP_STATUS(dev_priv, cpu_transcoder, port)) &
+			     (HDCP_STATUS_RI_MATCH | HDCP_STATUS_ENC),
+		     1))
 		return -ETIMEDOUT;
-	}
+
+	return 0;
+}
+
+int intel_hdcp1_post_encryption(struct drm_connector *drm_connector,
+				void *driver_data)
+{
+	struct intel_connector *connector = to_intel_connector(drm_connector);
+	struct intel_digital_port *dig_port =
+		intel_attached_dig_port(connector);
+	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	enum transcoder cpu_transcoder = connector->hdcp.cpu_transcoder;
+	enum port port = dig_port->base.port;
 
 	/* Wait for encryption confirmation */
 	if (intel_de_wait_for_set(dev_priv,
@@ -880,56 +722,22 @@ static int intel_hdcp_auth(struct intel_connector *connector)
 		return -ETIMEDOUT;
 	}
 
-	/* DP MST Auth Part 1 Step 2.a and Step 2.b */
-	if (shim->stream_encryption) {
-		ret = shim->stream_encryption(connector, true);
-		if (ret) {
-			drm_err(&dev_priv->drm, "[%s:%d] Failed to enable HDCP 1.4 stream enc\n",
-				connector->base.name, connector->base.base.id);
-			return ret;
-		}
-		drm_dbg_kms(&dev_priv->drm, "HDCP 1.4 transcoder: %s stream encrypted\n",
-			    transcoder_name(hdcp->stream_transcoder));
-	}
-
-	if (repeater_present)
-		return intel_hdcp_auth_downstream(connector);
-
-	drm_dbg_kms(&dev_priv->drm, "HDCP is enabled (no repeater present)\n");
 	return 0;
 }
 
-static int _intel_hdcp_disable(struct intel_connector *connector)
+int intel_hdcp1_disable(struct drm_connector *drm_connector, void *driver_data)
 {
+	struct intel_connector *connector = to_intel_connector(drm_connector);
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	enum port port = dig_port->base.port;
 	enum transcoder cpu_transcoder = hdcp->cpu_transcoder;
 	u32 repeater_ctl;
-	int ret;
 
 	drm_dbg_kms(&dev_priv->drm, "[%s:%d] HDCP is being disabled...\n",
 		    connector->base.name, connector->base.base.id);
 
-	if (hdcp->shim->stream_encryption) {
-		ret = hdcp->shim->stream_encryption(connector, false);
-		if (ret) {
-			drm_err(&dev_priv->drm, "[%s:%d] Failed to disable HDCP 1.4 stream enc\n",
-				connector->base.name, connector->base.base.id);
-			return ret;
-		}
-		drm_dbg_kms(&dev_priv->drm, "HDCP 1.4 transcoder: %s stream encryption disabled\n",
-			    transcoder_name(hdcp->stream_transcoder));
-		/*
-		 * If there are other connectors on this port using HDCP,
-		 * don't disable it until it disabled HDCP encryption for
-		 * all connectors in MST topology.
-		 */
-		if (dig_port->num_hdcp_streams > 0)
-			return 0;
-	}
-
 	hdcp->hdcp_encrypted = false;
 	intel_de_write(dev_priv, HDCP_CONF(dev_priv, cpu_transcoder, port), 0);
 	if (intel_de_wait_for_clear(dev_priv,
@@ -945,190 +753,9 @@ static int _intel_hdcp_disable(struct intel_connector *connector)
 	intel_de_write(dev_priv, HDCP_REP_CTL,
 		       intel_de_read(dev_priv, HDCP_REP_CTL) & ~repeater_ctl);
 
-	ret = hdcp->shim->toggle_signalling(dig_port, cpu_transcoder, false);
-	if (ret) {
-		drm_err(&dev_priv->drm, "Failed to disable HDCP signalling\n");
-		return ret;
-	}
-
-	drm_dbg_kms(&dev_priv->drm, "HDCP is disabled\n");
 	return 0;
 }
 
-static int _intel_hdcp_enable(struct intel_connector *connector)
-{
-	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
-	struct intel_hdcp *hdcp = &connector->hdcp;
-	int i, ret, tries = 3;
-
-	drm_dbg_kms(&dev_priv->drm, "[%s:%d] HDCP is being enabled...\n",
-		    connector->base.name, connector->base.base.id);
-
-	if (!hdcp_key_loadable(dev_priv)) {
-		drm_err(&dev_priv->drm, "HDCP key Load is not possible\n");
-		return -ENXIO;
-	}
-
-	for (i = 0; i < KEY_LOAD_TRIES; i++) {
-		ret = intel_hdcp_load_keys(dev_priv);
-		if (!ret)
-			break;
-		intel_hdcp_clear_keys(dev_priv);
-	}
-	if (ret) {
-		drm_err(&dev_priv->drm, "Could not load HDCP keys, (%d)\n",
-			ret);
-		return ret;
-	}
-
-	/* Incase of authentication failures, HDCP spec expects reauth. */
-	for (i = 0; i < tries; i++) {
-		ret = intel_hdcp_auth(connector);
-		if (!ret) {
-			hdcp->hdcp_encrypted = true;
-			return 0;
-		}
-
-		drm_dbg_kms(&dev_priv->drm, "HDCP Auth failure (%d)\n", ret);
-
-		/* Ensuring HDCP encryption and signalling are stopped. */
-		_intel_hdcp_disable(connector);
-	}
-
-	drm_dbg_kms(&dev_priv->drm,
-		    "HDCP authentication failed (%d tries/%d)\n", tries, ret);
-	return ret;
-}
-
-static struct intel_connector *intel_hdcp_to_connector(struct intel_hdcp *hdcp)
-{
-	return container_of(hdcp, struct intel_connector, hdcp);
-}
-
-static void intel_hdcp_update_value(struct intel_connector *connector,
-				    u64 value, bool update_property)
-{
-	struct drm_device *dev = connector->base.dev;
-	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
-	struct intel_hdcp *hdcp = &connector->hdcp;
-
-	drm_WARN_ON(connector->base.dev, !mutex_is_locked(&hdcp->mutex));
-
-	if (hdcp->value == value)
-		return;
-
-	drm_WARN_ON(dev, !mutex_is_locked(&dig_port->hdcp_mutex));
-
-	if (hdcp->value == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
-		if (!drm_WARN_ON(dev, dig_port->num_hdcp_streams == 0))
-			dig_port->num_hdcp_streams--;
-	} else if (value == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
-		dig_port->num_hdcp_streams++;
-	}
-
-	hdcp->value = value;
-	if (update_property) {
-		drm_connector_get(&connector->base);
-		schedule_work(&hdcp->prop_work);
-	}
-}
-
-/* Implements Part 3 of the HDCP authorization procedure */
-static int intel_hdcp_check_link(struct intel_connector *connector)
-{
-	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
-	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
-	struct intel_hdcp *hdcp = &connector->hdcp;
-	enum port port = dig_port->base.port;
-	enum transcoder cpu_transcoder;
-	int ret = 0;
-
-	mutex_lock(&hdcp->mutex);
-	mutex_lock(&dig_port->hdcp_mutex);
-
-	cpu_transcoder = hdcp->cpu_transcoder;
-
-	/* Check_link valid only when HDCP1.4 is enabled */
-	if (hdcp->value != DRM_MODE_CONTENT_PROTECTION_ENABLED ||
-	    !hdcp->hdcp_encrypted) {
-		ret = -EINVAL;
-		goto out;
-	}
-
-	if (drm_WARN_ON(&dev_priv->drm,
-			!intel_hdcp_in_use(dev_priv, cpu_transcoder, port))) {
-		drm_err(&dev_priv->drm,
-			"%s:%d HDCP link stopped encryption,%x\n",
-			connector->base.name, connector->base.base.id,
-			intel_de_read(dev_priv, HDCP_STATUS(dev_priv, cpu_transcoder, port)));
-		ret = -ENXIO;
-		intel_hdcp_update_value(connector,
-					DRM_MODE_CONTENT_PROTECTION_DESIRED,
-					true);
-		goto out;
-	}
-
-	if (hdcp->shim->check_link(dig_port, connector)) {
-		if (hdcp->value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
-			intel_hdcp_update_value(connector,
-				DRM_MODE_CONTENT_PROTECTION_ENABLED, true);
-		}
-		goto out;
-	}
-
-	drm_dbg_kms(&dev_priv->drm,
-		    "[%s:%d] HDCP link failed, retrying authentication\n",
-		    connector->base.name, connector->base.base.id);
-
-	ret = _intel_hdcp_disable(connector);
-	if (ret) {
-		drm_err(&dev_priv->drm, "Failed to disable hdcp (%d)\n", ret);
-		intel_hdcp_update_value(connector,
-					DRM_MODE_CONTENT_PROTECTION_DESIRED,
-					true);
-		goto out;
-	}
-
-	ret = _intel_hdcp_enable(connector);
-	if (ret) {
-		drm_err(&dev_priv->drm, "Failed to enable hdcp (%d)\n", ret);
-		intel_hdcp_update_value(connector,
-					DRM_MODE_CONTENT_PROTECTION_DESIRED,
-					true);
-		goto out;
-	}
-
-out:
-	mutex_unlock(&dig_port->hdcp_mutex);
-	mutex_unlock(&hdcp->mutex);
-	return ret;
-}
-
-static void intel_hdcp_prop_work(struct work_struct *work)
-{
-	struct intel_hdcp *hdcp = container_of(work, struct intel_hdcp,
-					       prop_work);
-	struct intel_connector *connector = intel_hdcp_to_connector(hdcp);
-	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
-
-	drm_modeset_lock(&dev_priv->drm.mode_config.connection_mutex, NULL);
-	mutex_lock(&hdcp->mutex);
-
-	/*
-	 * This worker is only used to flip between ENABLED/DESIRED. Either of
-	 * those to UNDESIRED is handled by core. If value == UNDESIRED,
-	 * we're running just after hdcp has been disabled, so just exit
-	 */
-	if (hdcp->value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED)
-		drm_hdcp_update_content_protection(&connector->base,
-						   hdcp->value);
-
-	mutex_unlock(&hdcp->mutex);
-	drm_modeset_unlock(&dev_priv->drm.mode_config.connection_mutex);
-
-	drm_connector_put(&connector->base);
-}
-
 bool is_hdcp_supported(struct drm_i915_private *dev_priv, enum port port)
 {
 	return RUNTIME_INFO(dev_priv)->has_hdcp &&
@@ -1961,8 +1588,9 @@ static int hdcp2_authenticate_and_encrypt(struct intel_connector *connector)
 	return ret;
 }
 
-static int _intel_hdcp2_enable(struct intel_connector *connector)
+int intel_hdcp2_enable(struct drm_connector *drm_connector, void *driver_data)
 {
+	struct intel_connector *connector = to_intel_connector(drm_connector);
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	int ret;
@@ -1986,8 +1614,8 @@ static int _intel_hdcp2_enable(struct intel_connector *connector)
 	return 0;
 }
 
-static int
-_intel_hdcp2_disable(struct intel_connector *connector, bool hdcp2_link_recovery)
+static int _intel_hdcp2_disable(struct intel_connector *connector,
+				bool hdcp2_link_recovery, void *driver_data)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
@@ -2024,9 +1652,17 @@ _intel_hdcp2_disable(struct intel_connector *connector, bool hdcp2_link_recovery
 	return ret;
 }
 
+int intel_hdcp2_disable(struct drm_connector *drm_connector, void *driver_data)
+{
+	return _intel_hdcp2_disable(to_intel_connector(drm_connector), false,
+				    driver_data);
+}
+
 /* Implements the Link Integrity Check for HDCP2.2 */
-static int intel_hdcp2_check_link(struct intel_connector *connector)
+int intel_hdcp2_check_link(struct drm_connector *drm_connector,
+			   void *driver_data)
 {
+	struct intel_connector *connector = to_intel_connector(drm_connector);
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct intel_hdcp *hdcp = &connector->hdcp;
@@ -2034,109 +1670,39 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
 	enum transcoder cpu_transcoder;
 	int ret = 0;
 
-	mutex_lock(&hdcp->mutex);
-	mutex_lock(&dig_port->hdcp_mutex);
 	cpu_transcoder = hdcp->cpu_transcoder;
 
 	/* hdcp2_check_link is expected only when HDCP2.2 is Enabled */
-	if (hdcp->value != DRM_MODE_CONTENT_PROTECTION_ENABLED ||
-	    !hdcp->hdcp2_encrypted) {
-		ret = -EINVAL;
-		goto out;
-	}
+	if (!hdcp->hdcp2_encrypted)
+		return -EINVAL;
 
 	if (drm_WARN_ON(&dev_priv->drm,
 			!intel_hdcp2_in_use(dev_priv, cpu_transcoder, port))) {
 		drm_err(&dev_priv->drm,
 			"HDCP2.2 link stopped the encryption, %x\n",
 			intel_de_read(dev_priv, HDCP2_STATUS(dev_priv, cpu_transcoder, port)));
-		ret = -ENXIO;
-		_intel_hdcp2_disable(connector, true);
-		intel_hdcp_update_value(connector,
-					DRM_MODE_CONTENT_PROTECTION_DESIRED,
-					true);
-		goto out;
+		return -ENXIO;
 	}
 
 	ret = hdcp->shim->check_2_2_link(dig_port, connector);
-	if (ret == HDCP_LINK_PROTECTED) {
-		if (hdcp->value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
-			intel_hdcp_update_value(connector,
-					DRM_MODE_CONTENT_PROTECTION_ENABLED,
-					true);
-		}
-		goto out;
-	}
+	if (ret == HDCP_LINK_PROTECTED)
+		return 0;
 
 	if (ret == HDCP_TOPOLOGY_CHANGE) {
-		if (hdcp->value == DRM_MODE_CONTENT_PROTECTION_UNDESIRED)
-			goto out;
-
 		drm_dbg_kms(&dev_priv->drm,
 			    "HDCP2.2 Downstream topology change\n");
 		ret = hdcp2_authenticate_repeater_topology(connector);
-		if (!ret) {
-			intel_hdcp_update_value(connector,
-					DRM_MODE_CONTENT_PROTECTION_ENABLED,
-					true);
-			goto out;
-		}
-		drm_dbg_kms(&dev_priv->drm,
-			    "[%s:%d] Repeater topology auth failed.(%d)\n",
-			    connector->base.name, connector->base.base.id,
-			    ret);
-	} else {
-		drm_dbg_kms(&dev_priv->drm,
-			    "[%s:%d] HDCP2.2 link failed, retrying auth\n",
-			    connector->base.name, connector->base.base.id);
-	}
-
-	ret = _intel_hdcp2_disable(connector, true);
-	if (ret) {
-		drm_err(&dev_priv->drm,
-			"[%s:%d] Failed to disable hdcp2.2 (%d)\n",
-			connector->base.name, connector->base.base.id, ret);
-		intel_hdcp_update_value(connector,
-				DRM_MODE_CONTENT_PROTECTION_DESIRED, true);
-		goto out;
-	}
+		if (!ret)
+			return 0;
 
-	ret = _intel_hdcp2_enable(connector);
-	if (ret) {
 		drm_dbg_kms(&dev_priv->drm,
-			    "[%s:%d] Failed to enable hdcp2.2 (%d)\n",
-			    connector->base.name, connector->base.base.id,
-			    ret);
-		intel_hdcp_update_value(connector,
-					DRM_MODE_CONTENT_PROTECTION_DESIRED,
-					true);
-		goto out;
+			    "[%s:%d] Repeater topology auth failed.(%d)\n",
+			    connector->base.name, connector->base.base.id, ret);
 	}
 
-out:
-	mutex_unlock(&dig_port->hdcp_mutex);
-	mutex_unlock(&hdcp->mutex);
 	return ret;
 }
 
-static void intel_hdcp_check_work(struct work_struct *work)
-{
-	struct intel_hdcp *hdcp = container_of(to_delayed_work(work),
-					       struct intel_hdcp,
-					       check_work);
-	struct intel_connector *connector = intel_hdcp_to_connector(hdcp);
-
-	if (drm_connector_is_unregistered(&connector->base))
-		return;
-
-	if (!intel_hdcp2_check_link(connector))
-		schedule_delayed_work(&hdcp->check_work,
-				      DRM_HDCP2_CHECK_PERIOD_MS);
-	else if (!intel_hdcp_check_link(connector))
-		schedule_delayed_work(&hdcp->check_work,
-				      DRM_HDCP_CHECK_PERIOD_MS);
-}
-
 static int i915_hdcp_component_bind(struct device *i915_kdev,
 				    struct device *mei_kdev, void *data)
 {
@@ -2189,22 +1755,28 @@ static enum mei_fw_tc intel_get_mei_fw_tc(enum transcoder cpu_transcoder)
 	}
 }
 
-static int
-_intel_hdcp_setup(struct intel_connector *connector,
-		  const struct intel_crtc_state *pipe_config, u8 content_type)
+int intel_hdcp_setup(struct drm_connector *connector,
+		     struct drm_atomic_state *state, void *driver_data)
 {
-	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
-	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
-	struct intel_hdcp *hdcp = &connector->hdcp;
+	struct drm_i915_private *dev_priv = to_i915(connector->dev);
+	struct intel_connector *intel_connector = to_intel_connector(connector);
+	struct intel_digital_port *dig_port =
+		intel_attached_dig_port(intel_connector);
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
+	struct intel_crtc_state *pipe_config;
+	struct intel_hdcp *hdcp = &intel_connector->hdcp;
 	int ret = 0;
 
-	if (!connector->encoder) {
+	if (!intel_connector->encoder) {
 		drm_err(&dev_priv->drm, "[%s:%d] encoder is not initialized\n",
-			connector->base.name, connector->base.base.id);
+			connector->name, connector->base.id);
 		return -ENODEV;
 	}
 
-	hdcp->content_type = content_type;
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	pipe_config = to_intel_crtc_state(crtc_state);
 
 	if (intel_crtc_has_type(pipe_config, INTEL_OUTPUT_DP_MST)) {
 		hdcp->cpu_transcoder = pipe_config->mst_master_transcoder;
@@ -2321,7 +1893,6 @@ int intel_hdcp_init(struct intel_connector *connector,
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct intel_hdcp *hdcp = &connector->hdcp;
-	int ret;
 
 	if (!shim)
 		return -EINVAL;
@@ -2329,174 +1900,12 @@ int intel_hdcp_init(struct intel_connector *connector,
 	if (is_hdcp2_supported(dev_priv))
 		intel_hdcp2_init(connector, dig_port, shim);
 
-	ret =
-	drm_connector_attach_content_protection_property(&connector->base,
-							 hdcp->hdcp2_supported);
-	if (ret) {
-		hdcp->hdcp2_supported = false;
-		kfree(dig_port->hdcp_port_data.streams);
-		return ret;
-	}
-
 	hdcp->shim = shim;
-	mutex_init(&hdcp->mutex);
-	INIT_DELAYED_WORK(&hdcp->check_work, intel_hdcp_check_work);
-	INIT_WORK(&hdcp->prop_work, intel_hdcp_prop_work);
 	init_waitqueue_head(&hdcp->cp_irq_queue);
 
 	return 0;
 }
 
-int intel_hdcp_enable(struct intel_connector *connector,
-		      const struct intel_crtc_state *pipe_config, u8 content_type)
-{
-	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
-	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
-	struct intel_hdcp *hdcp = &connector->hdcp;
-	unsigned long check_link_interval = DRM_HDCP_CHECK_PERIOD_MS;
-	bool capable;
-	int ret = -EINVAL;
-
-	if (!hdcp->shim)
-		return -ENOENT;
-
-	mutex_lock(&hdcp->mutex);
-	mutex_lock(&dig_port->hdcp_mutex);
-	drm_WARN_ON(&dev_priv->drm,
-		    hdcp->value == DRM_MODE_CONTENT_PROTECTION_ENABLED);
-
-	ret = _intel_hdcp_setup(connector, pipe_config, content_type);
-	if (ret)
-		goto out;
-
-	/*
-	 * Considering that HDCP2.2 is more secure than HDCP1.4, If the setup
-	 * is capable of HDCP2.2, it is preferred to use HDCP2.2.
-	 */
-	ret = intel_hdcp2_capable(connector, &capable);
-	if (capable) {
-		ret = _intel_hdcp2_enable(connector);
-		if (!ret) {
-			check_link_interval = DRM_HDCP2_CHECK_PERIOD_MS;
-			goto out;
-		}
-	}
-
-	/*
-	 * When HDCP2.2 fails and Content Type is not Type1, HDCP1.4 will
-	 * be attempted.
-	 */
-	ret = intel_hdcp_capable(connector, &capable);
-	if (ret)
-		goto out;
-
-	if (capable && hdcp->content_type != DRM_MODE_HDCP_CONTENT_TYPE1)
-		ret = _intel_hdcp_enable(connector);
-
-out:
-	if (!ret) {
-		schedule_delayed_work(&hdcp->check_work, check_link_interval);
-		intel_hdcp_update_value(connector,
-					DRM_MODE_CONTENT_PROTECTION_ENABLED,
-					true);
-	}
-
-	mutex_unlock(&dig_port->hdcp_mutex);
-	mutex_unlock(&hdcp->mutex);
-	return ret;
-}
-
-int intel_hdcp_disable(struct intel_connector *connector)
-{
-	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
-	struct intel_hdcp *hdcp = &connector->hdcp;
-	int ret = 0;
-
-	if (!hdcp->shim)
-		return -ENOENT;
-
-	mutex_lock(&hdcp->mutex);
-	mutex_lock(&dig_port->hdcp_mutex);
-
-	if (hdcp->value == DRM_MODE_CONTENT_PROTECTION_UNDESIRED)
-		goto out;
-
-	intel_hdcp_update_value(connector,
-				DRM_MODE_CONTENT_PROTECTION_UNDESIRED, false);
-	if (hdcp->hdcp2_encrypted)
-		ret = _intel_hdcp2_disable(connector, false);
-	else if (hdcp->hdcp_encrypted)
-		ret = _intel_hdcp_disable(connector);
-
-out:
-	mutex_unlock(&dig_port->hdcp_mutex);
-	mutex_unlock(&hdcp->mutex);
-	cancel_delayed_work_sync(&hdcp->check_work);
-	return ret;
-}
-
-void intel_hdcp_update_pipe(struct intel_atomic_state *state,
-			    struct intel_encoder *encoder,
-			    const struct intel_crtc_state *crtc_state,
-			    const struct drm_connector_state *conn_state)
-{
-	struct intel_connector *connector =
-				to_intel_connector(conn_state->connector);
-	struct intel_hdcp *hdcp = &connector->hdcp;
-	bool content_protection_type_changed, desired_and_not_enabled = false;
-
-	if (!connector->hdcp.shim)
-		return;
-
-	content_protection_type_changed =
-		(conn_state->hdcp_content_type != hdcp->content_type &&
-		 conn_state->content_protection !=
-		 DRM_MODE_CONTENT_PROTECTION_UNDESIRED);
-
-	/*
-	 * During the HDCP encryption session if Type change is requested,
-	 * disable the HDCP and reenable it with new TYPE value.
-	 */
-	if (conn_state->content_protection ==
-	    DRM_MODE_CONTENT_PROTECTION_UNDESIRED ||
-	    content_protection_type_changed)
-		intel_hdcp_disable(connector);
-
-	/*
-	 * Mark the hdcp state as DESIRED after the hdcp disable of type
-	 * change procedure.
-	 */
-	if (content_protection_type_changed) {
-		mutex_lock(&hdcp->mutex);
-		hdcp->value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
-		drm_connector_get(&connector->base);
-		schedule_work(&hdcp->prop_work);
-		mutex_unlock(&hdcp->mutex);
-	}
-
-	if (conn_state->content_protection ==
-	    DRM_MODE_CONTENT_PROTECTION_DESIRED) {
-		mutex_lock(&hdcp->mutex);
-		/* Avoid enabling hdcp, if it already ENABLED */
-		desired_and_not_enabled =
-			hdcp->value != DRM_MODE_CONTENT_PROTECTION_ENABLED;
-		mutex_unlock(&hdcp->mutex);
-		/*
-		 * If HDCP already ENABLED and CP property is DESIRED, schedule
-		 * prop_work to update correct CP property to user space.
-		 */
-		if (!desired_and_not_enabled && !content_protection_type_changed) {
-			drm_connector_get(&connector->base);
-			schedule_work(&hdcp->prop_work);
-		}
-	}
-
-	if (desired_and_not_enabled || content_protection_type_changed)
-		intel_hdcp_enable(connector,
-				  crtc_state,
-				  (u8)conn_state->hdcp_content_type);
-}
-
 void intel_hdcp_component_fini(struct drm_i915_private *dev_priv)
 {
 	mutex_lock(&dev_priv->display.hdcp.comp_mutex);
@@ -2518,33 +1927,8 @@ void intel_hdcp_cleanup(struct intel_connector *connector)
 	if (!hdcp->shim)
 		return;
 
-	/*
-	 * If the connector is registered, it's possible userspace could kick
-	 * off another HDCP enable, which would re-spawn the workers.
-	 */
-	drm_WARN_ON(connector->base.dev,
-		connector->base.registration_state == DRM_CONNECTOR_REGISTERED);
-
-	/*
-	 * Now that the connector is not registered, check_work won't be run,
-	 * but cancel any outstanding instances of it
-	 */
-	cancel_delayed_work_sync(&hdcp->check_work);
-
-	/*
-	 * We don't cancel prop_work in the same way as check_work since it
-	 * requires connection_mutex which could be held while calling this
-	 * function. Instead, we rely on the connector references grabbed before
-	 * scheduling prop_work to ensure the connector is alive when prop_work
-	 * is run. So if we're in the destroy path (which is where this
-	 * function should be called), we're "guaranteed" that prop_work is not
-	 * active (tl;dr This Should Never Happen).
-	 */
-	drm_WARN_ON(connector->base.dev, work_pending(&hdcp->prop_work));
-
-	mutex_lock(&hdcp->mutex);
+	drm_hdcp_helper_destroy(connector->hdcp_helper_data);
 	hdcp->shim = NULL;
-	mutex_unlock(&hdcp->mutex);
 }
 
 /* Handles the CP_IRQ raised from the DP HDCP sink */
@@ -2558,5 +1942,5 @@ void intel_hdcp_handle_cp_irq(struct intel_connector *connector)
 	atomic_inc(&connector->hdcp.cp_irq_count);
 	wake_up_all(&connector->hdcp.cp_irq_queue);
 
-	schedule_delayed_work(&hdcp->check_work, 0);
+	drm_hdcp_helper_schedule_hdcp_check(connector->hdcp_helper_data);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.h b/drivers/gpu/drm/i915/display/intel_hdcp.h
index f06f6e5a2b1ad..7614bbf453133 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.h
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.h
@@ -10,8 +10,10 @@
 
 #define HDCP_ENCRYPT_STATUS_CHANGE_TIMEOUT_MS	50
 
+struct drm_atomic_state;
 struct drm_connector;
 struct drm_connector_state;
+struct drm_hdcp_an;
 struct drm_i915_private;
 struct intel_atomic_state;
 struct intel_connector;
@@ -25,16 +27,35 @@ enum transcoder;
 int intel_hdcp_init(struct intel_connector *connector,
 		    struct intel_digital_port *dig_port,
 		    const struct intel_hdcp_shim *hdcp_shim);
-int intel_hdcp_enable(struct intel_connector *connector,
-		      const struct intel_crtc_state *pipe_config, u8 content_type);
-int intel_hdcp_disable(struct intel_connector *connector);
-void intel_hdcp_update_pipe(struct intel_atomic_state *state,
-			    struct intel_encoder *encoder,
-			    const struct intel_crtc_state *crtc_state,
-			    const struct drm_connector_state *conn_state);
+int intel_hdcp_setup(struct drm_connector *drm_connector,
+		     struct drm_atomic_state *state, void *driver_data);
+int intel_hdcp_load_keys(struct drm_connector *drm_connector,
+			 void *driver_data);
 bool is_hdcp_supported(struct drm_i915_private *dev_priv, enum port port);
 int intel_hdcp_capable(struct intel_connector *connector, bool *capable);
-int intel_hdcp2_capable(struct intel_connector *connector, bool *capable);
+int intel_hdcp2_capable(struct drm_connector *drm_connector, bool *capable);
+int intel_hdcp2_enable(struct drm_connector *drm_connector, void *driver_data);
+int intel_hdcp2_disable(struct drm_connector *drm_connector, void *driver_data);
+int intel_hdcp2_check_link(struct drm_connector *drm_connector,
+			   void *driver_data);
+int intel_hdcp1_store_receiver_info(struct drm_connector *drm_connector,
+				    u32 *ksv, u32 status, u8 caps,
+				    bool repeater_present, void *driver_data);
+int intel_hdcp1_read_an(struct drm_connector *drm_connector,
+			struct drm_hdcp_an *an);
+int intel_hdcp1_enable_encryption(struct drm_connector *drm_connector,
+				  void *driver_data);
+int intel_hdcp1_wait_for_r0(struct drm_connector *drm_connector,
+			    void *driver_data);
+int intel_hdcp1_match_ri(struct drm_connector *drm_connector, u32 ri_prime,
+			 void *driver_data);
+int intel_hdcp1_post_encryption(struct drm_connector *drm_connector,
+				void *driver_data);
+int intel_hdcp1_store_ksv_fifo(struct drm_connector *drm_connector,
+			       u8 *ksv_fifo, u8 num_downstream, u8 *bstatus,
+			       u32 *v_prime, void *driver_data);
+int intel_hdcp1_check_link(struct drm_connector *drm_connector);
+int intel_hdcp1_disable(struct drm_connector *drm_connector, void *driver_data);
 void intel_hdcp_component_init(struct drm_i915_private *dev_priv);
 void intel_hdcp_component_fini(struct drm_i915_private *dev_priv);
 void intel_hdcp_cleanup(struct intel_connector *connector);
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index bac85d88054f5..e26e50bcccb2d 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -1325,17 +1325,25 @@ static int intel_hdmi_hdcp_write(struct intel_digital_port *dig_port,
 	return ret;
 }
 
-static
-int intel_hdmi_hdcp_write_an_aksv(struct intel_digital_port *dig_port,
-				  u8 *an)
+static int intel_hdmi_hdcp1_send_an_aksv(struct drm_connector *drm_connector,
+					 void *driver_data)
 {
+	struct intel_connector *connector = to_intel_connector(drm_connector);
+	struct intel_digital_port *dig_port =
+		intel_attached_dig_port(connector);
 	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
 	struct intel_hdmi *hdmi = &dig_port->hdmi;
 	struct i2c_adapter *adapter = intel_gmbus_get_adapter(i915,
 							      hdmi->ddc_bus);
+	struct drm_hdcp_an an;
 	int ret;
 
-	ret = intel_hdmi_hdcp_write(dig_port, DRM_HDCP_DDC_AN, an,
+	/* Output An first, that's easy */
+	ret = intel_hdcp1_read_an(drm_connector, &an);
+	if (ret)
+		return ret;
+
+	ret = intel_hdmi_hdcp_write(dig_port, DRM_HDCP_DDC_AN, an.bytes,
 				    DRM_HDCP_AN_LEN);
 	if (ret) {
 		drm_dbg_kms(&i915->drm, "Write An over DDC failed (%d)\n",
@@ -1351,120 +1359,6 @@ int intel_hdmi_hdcp_write_an_aksv(struct intel_digital_port *dig_port,
 	return 0;
 }
 
-static int intel_hdmi_hdcp_read_bksv(struct intel_digital_port *dig_port,
-				     u8 *bksv)
-{
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
-
-	int ret;
-	ret = intel_hdmi_hdcp_read(dig_port, DRM_HDCP_DDC_BKSV, bksv,
-				   DRM_HDCP_KSV_LEN);
-	if (ret)
-		drm_dbg_kms(&i915->drm, "Read Bksv over DDC failed (%d)\n",
-			    ret);
-	return ret;
-}
-
-static
-int intel_hdmi_hdcp_read_bstatus(struct intel_digital_port *dig_port,
-				 u8 *bstatus)
-{
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
-
-	int ret;
-	ret = intel_hdmi_hdcp_read(dig_port, DRM_HDCP_DDC_BSTATUS,
-				   bstatus, DRM_HDCP_BSTATUS_LEN);
-	if (ret)
-		drm_dbg_kms(&i915->drm, "Read bstatus over DDC failed (%d)\n",
-			    ret);
-	return ret;
-}
-
-static
-int intel_hdmi_hdcp_repeater_present(struct intel_digital_port *dig_port,
-				     bool *repeater_present)
-{
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
-	int ret;
-	u8 val;
-
-	ret = intel_hdmi_hdcp_read(dig_port, DRM_HDCP_DDC_BCAPS, &val, 1);
-	if (ret) {
-		drm_dbg_kms(&i915->drm, "Read bcaps over DDC failed (%d)\n",
-			    ret);
-		return ret;
-	}
-	*repeater_present = val & DRM_HDCP_DDC_BCAPS_REPEATER_PRESENT;
-	return 0;
-}
-
-static
-int intel_hdmi_hdcp_read_ri_prime(struct intel_digital_port *dig_port,
-				  u8 *ri_prime)
-{
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
-
-	int ret;
-	ret = intel_hdmi_hdcp_read(dig_port, DRM_HDCP_DDC_RI_PRIME,
-				   ri_prime, DRM_HDCP_RI_LEN);
-	if (ret)
-		drm_dbg_kms(&i915->drm, "Read Ri' over DDC failed (%d)\n",
-			    ret);
-	return ret;
-}
-
-static
-int intel_hdmi_hdcp_read_ksv_ready(struct intel_digital_port *dig_port,
-				   bool *ksv_ready)
-{
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
-	int ret;
-	u8 val;
-
-	ret = intel_hdmi_hdcp_read(dig_port, DRM_HDCP_DDC_BCAPS, &val, 1);
-	if (ret) {
-		drm_dbg_kms(&i915->drm, "Read bcaps over DDC failed (%d)\n",
-			    ret);
-		return ret;
-	}
-	*ksv_ready = val & DRM_HDCP_DDC_BCAPS_KSV_FIFO_READY;
-	return 0;
-}
-
-static
-int intel_hdmi_hdcp_read_ksv_fifo(struct intel_digital_port *dig_port,
-				  int num_downstream, u8 *ksv_fifo)
-{
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
-	int ret;
-	ret = intel_hdmi_hdcp_read(dig_port, DRM_HDCP_DDC_KSV_FIFO,
-				   ksv_fifo, num_downstream * DRM_HDCP_KSV_LEN);
-	if (ret) {
-		drm_dbg_kms(&i915->drm,
-			    "Read ksv fifo over DDC failed (%d)\n", ret);
-		return ret;
-	}
-	return 0;
-}
-
-static
-int intel_hdmi_hdcp_read_v_prime_part(struct intel_digital_port *dig_port,
-				      int i, u32 *part)
-{
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
-	int ret;
-
-	if (i >= DRM_HDCP_V_PRIME_NUM_PARTS)
-		return -EINVAL;
-
-	ret = intel_hdmi_hdcp_read(dig_port, DRM_HDCP_DDC_V_PRIME(i),
-				   part, DRM_HDCP_V_PRIME_PART_LEN);
-	if (ret)
-		drm_dbg_kms(&i915->drm, "Read V'[%d] over DDC failed (%d)\n",
-			    i, ret);
-	return ret;
-}
-
 static int kbl_repositioning_enc_en_signal(struct intel_connector *connector,
 					   enum transcoder cpu_transcoder)
 {
@@ -1533,50 +1427,42 @@ int intel_hdmi_hdcp_toggle_signalling(struct intel_digital_port *dig_port,
 	return 0;
 }
 
-static
-bool intel_hdmi_hdcp_check_link_once(struct intel_digital_port *dig_port,
-				     struct intel_connector *connector)
+static int
+intel_hdmi_hdcp1_enable_encryption(struct drm_connector *drm_connector,
+				   void *driver_data)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
-	enum port port = dig_port->base.port;
+	struct intel_connector *connector = to_intel_connector(drm_connector);
+	struct intel_digital_port *dig_port =
+		intel_attached_dig_port(connector);
 	enum transcoder cpu_transcoder = connector->hdcp.cpu_transcoder;
 	int ret;
-	union {
-		u32 reg;
-		u8 shim[DRM_HDCP_RI_LEN];
-	} ri;
 
-	ret = intel_hdmi_hdcp_read_ri_prime(dig_port, ri.shim);
+	ret = intel_hdmi_hdcp_toggle_signalling(dig_port, cpu_transcoder, true);
 	if (ret)
-		return false;
-
-	intel_de_write(i915, HDCP_RPRIME(i915, cpu_transcoder, port), ri.reg);
+		return ret;
 
-	/* Wait for Ri prime match */
-	if (wait_for((intel_de_read(i915, HDCP_STATUS(i915, cpu_transcoder, port)) &
-		      (HDCP_STATUS_RI_MATCH | HDCP_STATUS_ENC)) ==
-		     (HDCP_STATUS_RI_MATCH | HDCP_STATUS_ENC), 1)) {
-		drm_dbg_kms(&i915->drm, "Ri' mismatch detected (%x)\n",
-			intel_de_read(i915, HDCP_STATUS(i915, cpu_transcoder,
-							port)));
-		return false;
-	}
-	return true;
+	return intel_hdcp1_enable_encryption(drm_connector, driver_data);
 }
 
-static
-bool intel_hdmi_hdcp_check_link(struct intel_digital_port *dig_port,
-				struct intel_connector *connector)
+static int intel_hdmi_hdcp1_disable(struct drm_connector *drm_connector,
+				    void *driver_data)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
-	int retry;
+	struct intel_connector *connector = to_intel_connector(drm_connector);
+	struct intel_digital_port *dig_port =
+		intel_attached_dig_port(connector);
+	enum transcoder cpu_transcoder = connector->hdcp.cpu_transcoder;
+	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	int ret;
 
-	for (retry = 0; retry < 3; retry++)
-		if (intel_hdmi_hdcp_check_link_once(dig_port, connector))
-			return true;
+	ret = intel_hdcp1_disable(drm_connector, driver_data);
+	if (ret) {
+		drm_err(&i915->drm, "[%s:%d] Failed to disable HDCP 1.4\n",
+			connector->base.name, connector->base.base.id);
+		return ret;
+	}
 
-	drm_err(&i915->drm, "Link check failed\n");
-	return false;
+	return intel_hdmi_hdcp_toggle_signalling(dig_port, cpu_transcoder,
+						 false);
 }
 
 struct hdcp2_hdmi_msg_timeout {
@@ -1742,13 +1628,19 @@ int intel_hdmi_hdcp2_check_link(struct intel_digital_port *dig_port,
 	return ret;
 }
 
-static
-int intel_hdmi_hdcp2_capable(struct intel_digital_port *dig_port,
-			     bool *capable)
+static int intel_hdmi_hdcp2_capable(struct drm_connector *drm_connector,
+				    bool *capable, void *driver_data)
 {
+	struct intel_connector *connector = to_intel_connector(drm_connector);
+	struct intel_digital_port *dig_port =
+		intel_attached_dig_port(connector);
 	u8 hdcp2_version;
 	int ret;
 
+	ret = intel_hdcp2_capable(drm_connector, capable);
+	if (ret || !capable)
+		return ret;
+
 	*capable = false;
 	ret = intel_hdmi_hdcp_read(dig_port, HDCP_2_2_HDMI_REG_VER_OFFSET,
 				   &hdcp2_version, sizeof(hdcp2_version));
@@ -1759,23 +1651,38 @@ int intel_hdmi_hdcp2_capable(struct intel_digital_port *dig_port,
 }
 
 static const struct intel_hdcp_shim intel_hdmi_hdcp_shim = {
-	.write_an_aksv = intel_hdmi_hdcp_write_an_aksv,
-	.read_bksv = intel_hdmi_hdcp_read_bksv,
-	.read_bstatus = intel_hdmi_hdcp_read_bstatus,
-	.repeater_present = intel_hdmi_hdcp_repeater_present,
-	.read_ri_prime = intel_hdmi_hdcp_read_ri_prime,
-	.read_ksv_ready = intel_hdmi_hdcp_read_ksv_ready,
-	.read_ksv_fifo = intel_hdmi_hdcp_read_ksv_fifo,
-	.read_v_prime_part = intel_hdmi_hdcp_read_v_prime_part,
 	.toggle_signalling = intel_hdmi_hdcp_toggle_signalling,
-	.check_link = intel_hdmi_hdcp_check_link,
 	.write_2_2_msg = intel_hdmi_hdcp2_write_msg,
 	.read_2_2_msg = intel_hdmi_hdcp2_read_msg,
-	.check_2_2_link	= intel_hdmi_hdcp2_check_link,
-	.hdcp_2_2_capable = intel_hdmi_hdcp2_capable,
+	.check_2_2_link = intel_hdmi_hdcp2_check_link,
 	.protocol = HDCP_PROTOCOL_HDMI,
 };
 
+static const struct drm_hdcp_helper_funcs intel_hdmi_hdcp_helper_funcs = {
+	.setup = intel_hdcp_setup,
+	.load_keys = intel_hdcp_load_keys,
+	.hdcp2_capable = intel_hdmi_hdcp2_capable,
+	.hdcp2_enable = intel_hdcp2_enable,
+	.hdcp2_check_link = intel_hdcp2_check_link,
+	.hdcp2_disable = intel_hdcp2_disable,
+	.hdcp1_send_an_aksv = intel_hdmi_hdcp1_send_an_aksv,
+	.hdcp1_store_receiver_info = intel_hdcp1_store_receiver_info,
+	.hdcp1_enable_encryption = intel_hdmi_hdcp1_enable_encryption,
+	.hdcp1_wait_for_r0 = intel_hdcp1_wait_for_r0,
+	.hdcp1_match_ri = intel_hdcp1_match_ri,
+	.hdcp1_post_encryption = intel_hdcp1_post_encryption,
+	.hdcp1_store_ksv_fifo = intel_hdcp1_store_ksv_fifo,
+	.hdcp1_disable = intel_hdmi_hdcp1_disable,
+	/* Common DRM functions that are different between HDMI vs DP*/
+	.remote_read = drm_hdcp_remote_ddc_read,
+	.remote_write = drm_hdcp_remote_ddc_write,
+	.hdcp1_capable = drm_hdcp_helper_hdcp1_capable_hdmi,
+	.hdcp1_ksv_fifo_ready = drm_hdcp_helper_hdcp1_ksv_fifo_ready_hdmi,
+	.wait_r0 = drm_hdcp_helper_wait_r0_hdmi,
+	.hdcp1_check_link_registers = drm_hdcp_hdcp1_check_link_registers_hdmi,
+	.hdcp1_read_ksv_fifo = drm_hdcp_helper_hdcp1_read_ksv_fifo_hdmi,
+};
+
 static int intel_hdmi_source_max_tmds_clock(struct intel_encoder *encoder)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
@@ -2919,6 +2826,37 @@ void intel_infoframe_init(struct intel_digital_port *dig_port)
 	}
 }
 
+static void intel_hdmi_hdcp_init(struct intel_digital_port *dig_port,
+				 struct intel_connector *connector)
+{
+	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct intel_encoder *intel_encoder = &dig_port->base;
+	enum port port = intel_encoder->port;
+	struct drm_hdcp_helper_data *data;
+	int ret;
+
+	if (!is_hdcp_supported(dev_priv, port))
+		return;
+
+	data = drm_hdcp_helper_initialize_hdmi(
+		&connector->base, &intel_hdmi_hdcp_helper_funcs, true);
+	if (IS_ERR(data)) {
+		drm_dbg_kms(&dev_priv->drm, "HDCP init failed ret=%ld\n",
+			    PTR_ERR(data));
+		return;
+	}
+
+	ret = intel_hdcp_init(connector, dig_port, &intel_hdmi_hdcp_shim);
+	if (ret) {
+		drm_hdcp_helper_destroy(data);
+		drm_dbg_kms(&dev_priv->drm, "Intel HDCP init failed ret=%d\n",
+			    ret);
+		return;
+	}
+
+	connector->hdcp_helper_data = data;
+}
+
 void intel_hdmi_init_connector(struct intel_digital_port *dig_port,
 			       struct intel_connector *intel_connector)
 {
@@ -2971,13 +2909,7 @@ void intel_hdmi_init_connector(struct intel_digital_port *dig_port,
 	intel_connector_attach_encoder(intel_connector, intel_encoder);
 	intel_hdmi->attached_connector = intel_connector;
 
-	if (is_hdcp_supported(dev_priv, port)) {
-		int ret = intel_hdcp_init(intel_connector, dig_port,
-					  &intel_hdmi_hdcp_shim);
-		if (ret)
-			drm_dbg_kms(&dev_priv->drm,
-				    "HDCP init failed, skipping.\n");
-	}
+	intel_hdmi_hdcp_init(dig_port, intel_connector);
 
 	/* For G4X desktop chip, PEG_BAND_GAP_DATA 3:0 must first be written
 	 * 0xd.  Failure to do so will result in spurious interrupts being
-- 
2.40.0.348.gf938b09366-goog

