Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DE611D6B4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 20:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0D46E176;
	Thu, 12 Dec 2019 19:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5076E15F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 19:02:50 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id i126so1349863ywe.7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 11:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xy1B17lfksb5dTRjY2EQ5pYtmhnJCTlU3dPWT1o5MgQ=;
 b=TF3cFP3rQ3dU9HYNjNEde/BojFbZ3ffmLrA3D3tZY7kgZhC4kzVBokqj/xd9YYCrZj
 ShACeY9MN2ahq7GkNBFNu0JiQm3aAf/uzbz6749CEpsgHv8ouUMqJSxGXhv/G9O/qrF4
 X0fPxYQUve+wwLEuyXogJod/euAMzIPuXIIRB79A7MCeLhqFSx0vMFS29YoHMvO0f48j
 GabX960qf4rpMh7zqjhfLtvHyYN+63SI5EaY7VJTqSr5Yc02uVCQwt0zV0oXtj/oKn8U
 6CIU2GO7lyEkIcbBi/keczWWLOFOnJ9f7hwQCjqWyqOC3XHv1AndlJz0K3poIXqMnriX
 K/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xy1B17lfksb5dTRjY2EQ5pYtmhnJCTlU3dPWT1o5MgQ=;
 b=mZBHBQ/wiabTE0RHPvGBtGLk5ZbOn+FEvI9iQk27uC1NVqySHT9jGqjYCPYqspSR+Z
 0TVB2d61bxk2EHHv2/qHpf7cNexXiERUhrTjEEYmkNadqGSnlwJmqdR9WfbhYNvdL1RW
 Jnf7JpRFMWle3U/4i5J/j0RGJKFYHHFZ+ArUWbJx8GMIJuiu6mCqSzJFI9N/VpElYyj4
 7BfaMHwuXazIz84EOhzXQT2QPzXboF2UfJLdolGb6cTgzXSH9V4RVJe1gF2iLh3ImjE6
 m2NW0Nl0zsTMVIi26D+vf3DTidbRfLL3muMTdgdQE6qs2Cluszkmeoh7uN9Tw3TXVCN4
 z8MQ==
X-Gm-Message-State: APjAAAUoy8Q6C9JtpGb7ICEFeJUxCSbZ9Xf85SIX5IayRpCy15dUr7gi
 XGTv+wXe4Fluae9Sydmj8ibb+z8Yryp1xw==
X-Google-Smtp-Source: APXvYqyymfckhQiM/plSY4ngq6/ShZfrEwmMqB4WPneiBgn9HDYai69oUeTsmM+h+pzKhM8bqsVNrg==
X-Received: by 2002:a0d:dbce:: with SMTP id d197mr5112422ywe.260.1576177368823; 
 Thu, 12 Dec 2019 11:02:48 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id i84sm3020122ywc.43.2019.12.12.11.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 11:02:48 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 11/12] drm/i915: Expose HDCP shim functions from dp for use
 by dp_mst
Date: Thu, 12 Dec 2019 14:02:29 -0500
Message-Id: <20191212190230.188505-12-sean@poorly.run>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191212190230.188505-1-sean@poorly.run>
References: <20191212190230.188505-1-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch, rodrigo.vivi@intel.com,
 Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

These functions are all the same for dp and dp_mst, so expose them for
use by the dp_mst hdcp implementation.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20191203173638.94919-11-sean@poorly.run #v1

Changes in v2:
-none
---
 .../drm/i915/display/intel_display_types.h    | 22 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c       | 14 ++----------
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index ac5af925e403..b9e1f4638ff2 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1636,4 +1636,26 @@ static inline u32 intel_plane_ggtt_offset(const struct intel_plane_state *state)
 	return i915_ggtt_offset(state->vma);
 }
 
+int intel_dp_hdcp_write_an_aksv(struct intel_digital_port *intel_dig_port,
+				u8 *an);
+int intel_dp_hdcp_read_bksv(struct intel_digital_port *intel_dig_port,
+			    u8 *bksv);
+int intel_dp_hdcp_read_bstatus(struct intel_digital_port *intel_dig_port,
+				      u8 *bstatus);
+int intel_dp_hdcp_read_bcaps(struct intel_digital_port *intel_dig_port,
+			     u8 *bcaps);
+int intel_dp_hdcp_repeater_present(struct intel_digital_port *intel_dig_port,
+				   bool *repeater_present);
+int intel_dp_hdcp_read_ri_prime(struct intel_digital_port *intel_dig_port,
+				u8 *ri_prime);
+int intel_dp_hdcp_read_ksv_ready(struct intel_digital_port *intel_dig_port,
+				 bool *ksv_ready);
+int intel_dp_hdcp_read_ksv_fifo(struct intel_digital_port *intel_dig_port,
+				int num_downstream, u8 *ksv_fifo);
+int intel_dp_hdcp_read_v_prime_part(struct intel_digital_port *intel_dig_port,
+				    int i, u32 *part);
+bool intel_dp_hdcp_check_link(struct intel_digital_port *intel_dig_port);
+int intel_dp_hdcp_capable(struct intel_digital_port *intel_dig_port,
+			  bool *hdcp_capable);
+
 #endif /*  __INTEL_DISPLAY_TYPES_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 155067657e23..3d62b1b7224e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5915,7 +5915,6 @@ static void intel_dp_hdcp_wait_for_cp_irq(struct intel_hdcp *hdcp, int timeout)
 		DRM_DEBUG_KMS("Timedout at waiting for CP_IRQ\n");
 }
 
-static
 int intel_dp_hdcp_write_an_aksv(struct intel_digital_port *intel_dig_port,
 				u8 *an)
 {
@@ -5947,8 +5946,7 @@ int intel_dp_hdcp_write_an_aksv(struct intel_digital_port *intel_dig_port,
 	return 0;
 }
 
-static int intel_dp_hdcp_read_bksv(struct intel_digital_port *intel_dig_port,
-				   u8 *bksv)
+int intel_dp_hdcp_read_bksv(struct intel_digital_port *intel_dig_port, u8 *bksv)
 {
 	ssize_t ret;
 	ret = drm_dp_dpcd_read(&intel_dig_port->dp.aux, DP_AUX_HDCP_BKSV, bksv,
@@ -5960,7 +5958,7 @@ static int intel_dp_hdcp_read_bksv(struct intel_digital_port *intel_dig_port,
 	return 0;
 }
 
-static int intel_dp_hdcp_read_bstatus(struct intel_digital_port *intel_dig_port,
+int intel_dp_hdcp_read_bstatus(struct intel_digital_port *intel_dig_port,
 				      u8 *bstatus)
 {
 	ssize_t ret;
@@ -5978,7 +5976,6 @@ static int intel_dp_hdcp_read_bstatus(struct intel_digital_port *intel_dig_port,
 	return 0;
 }
 
-static
 int intel_dp_hdcp_read_bcaps(struct intel_digital_port *intel_dig_port,
 			     u8 *bcaps)
 {
@@ -5994,7 +5991,6 @@ int intel_dp_hdcp_read_bcaps(struct intel_digital_port *intel_dig_port,
 	return 0;
 }
 
-static
 int intel_dp_hdcp_repeater_present(struct intel_digital_port *intel_dig_port,
 				   bool *repeater_present)
 {
@@ -6009,7 +6005,6 @@ int intel_dp_hdcp_repeater_present(struct intel_digital_port *intel_dig_port,
 	return 0;
 }
 
-static
 int intel_dp_hdcp_read_ri_prime(struct intel_digital_port *intel_dig_port,
 				u8 *ri_prime)
 {
@@ -6023,7 +6018,6 @@ int intel_dp_hdcp_read_ri_prime(struct intel_digital_port *intel_dig_port,
 	return 0;
 }
 
-static
 int intel_dp_hdcp_read_ksv_ready(struct intel_digital_port *intel_dig_port,
 				 bool *ksv_ready)
 {
@@ -6039,7 +6033,6 @@ int intel_dp_hdcp_read_ksv_ready(struct intel_digital_port *intel_dig_port,
 	return 0;
 }
 
-static
 int intel_dp_hdcp_read_ksv_fifo(struct intel_digital_port *intel_dig_port,
 				int num_downstream, u8 *ksv_fifo)
 {
@@ -6062,7 +6055,6 @@ int intel_dp_hdcp_read_ksv_fifo(struct intel_digital_port *intel_dig_port,
 	return 0;
 }
 
-static
 int intel_dp_hdcp_read_v_prime_part(struct intel_digital_port *intel_dig_port,
 				    int i, u32 *part)
 {
@@ -6090,7 +6082,6 @@ int intel_dp_hdcp_toggle_signalling(struct intel_digital_port *intel_dig_port,
 	return 0;
 }
 
-static
 bool intel_dp_hdcp_check_link(struct intel_digital_port *intel_dig_port)
 {
 	ssize_t ret;
@@ -6106,7 +6097,6 @@ bool intel_dp_hdcp_check_link(struct intel_digital_port *intel_dig_port)
 	return !(bstatus & (DP_BSTATUS_LINK_FAILURE | DP_BSTATUS_REAUTH_REQ));
 }
 
-static
 int intel_dp_hdcp_capable(struct intel_digital_port *intel_dig_port,
 			  bool *hdcp_capable)
 {
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
