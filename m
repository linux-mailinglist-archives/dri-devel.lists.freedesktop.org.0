Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8AEB117B9
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1653C10E9B7;
	Fri, 25 Jul 2025 05:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ary52Wf0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FE110E9B2;
 Fri, 25 Jul 2025 05:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419904; x=1784955904;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SEc6oVNRkbmxxCO3v/lZFHIbdjow3qqUndcy2/NjBgQ=;
 b=ary52Wf07n7U42uhvVpLkecVzkcJ7KlqeKQ1T3f5qU2Fmr0QUJZTZKG0
 czwZvI3bhAqP2Y1XumKlxIk8/gJlm0VZiEpiclfNZbNCe6cim7cze3mCl
 WxHQIPo9VRDtUV19498lrfJgVx+mUp5Pq6QI+8sTObDgcoysgQFkPJ/Il
 0dwpiySQg7FLnP27udO0/JjwyaPoywHyzbZN+AzgOI4xRDF8CRsvZi/qd
 6qDIY9P4M8XB4q3H8QOMFtBJcZ5XTG8KTki4RmLdyLjTP9Grh9DleKNNd
 gz7RLfhIBdmJjMBx/Q+pngAcvBPUrdO5Gv5GUAo7iPz66PEmuyryGEGIn g==;
X-CSE-ConnectionGUID: FLrWGFa4QfKWcZekD0bBrA==
X-CSE-MsgGUID: aiuDAyOQQmqOayq/S0hVEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299560"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299560"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:05:04 -0700
X-CSE-ConnectionGUID: DJxb/IVkQH+5xA9gX6A5lw==
X-CSE-MsgGUID: SaL2NS4mTeCu3xvgalCBHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956708"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:05:01 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 21/28] drm/i915/writeback: Define writeback frame capture
 function
Date: Fri, 25 Jul 2025 10:34:02 +0530
Message-Id: <20250725050409.2687242-22-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725050409.2687242-1-suraj.kandpal@intel.com>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Define the commit function to be called at atomic_commit_tail
if drm_writeback_job is available. This function calls the
capture function and queues the job to be called later via
interrupt handler when the job is complete.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  |  3 ++
 .../gpu/drm/i915/display/intel_writeback.c    | 54 +++++++++++++++++++
 .../gpu/drm/i915/display/intel_writeback.h    |  4 ++
 3 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index c2d1156de8e9..67ed3d6791b8 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -125,6 +125,7 @@
 #include "intel_vga.h"
 #include "intel_vrr.h"
 #include "intel_wm.h"
+#include "intel_writeback.h"
 #include "skl_scaler.h"
 #include "skl_universal_plane.h"
 #include "skl_watermark.h"
@@ -7429,6 +7430,8 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	/* FIXME probably need to sequence this properly */
 	intel_program_dpkgc_latency(state);
 
+	intel_writeback_atomic_commit(state);
+
 	intel_wait_for_vblank_workers(state);
 
 	/* FIXME: We should call drm_atomic_helper_commit_hw_done() here
diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index 2db9ae7d810f..25e293cc5be4 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -244,6 +244,60 @@ static int intel_writeback_atomic_check(struct drm_connector *connector,
 	return 0;
 }
 
+static void intel_writeback_capture(struct intel_atomic_state *state,
+				    struct intel_connector *connector)
+{
+	struct intel_display *display = to_intel_display(connector);
+	struct intel_writeback_connector *wb_conn =
+		conn_to_intel_writeback_connector(connector);
+	enum transcoder trans = wb_conn->trans;
+	u32 val = 0;
+
+	val |= START_TRIGGER_FRAME | WD_FRAME_NUMBER(wb_conn->frame_num);
+	intel_de_rmw(display, WD_TRANS_FUNC_CTL(trans),
+		     START_TRIGGER_FRAME | WD_FRAME_NUMBER_MASK,
+		     val);
+
+	if (intel_de_wait_for_set(display, WD_FRAME_STATUS(trans), WD_FRAME_COMPLETE,
+				  50)) {
+		drm_dbg_kms(display->drm,
+			    "Frame was not captured after triggering a capture\n");
+		intel_de_rmw(display, WD_TRANS_FUNC_CTL(trans),
+			     STOP_TRIGGER_FRAME,
+			     STOP_TRIGGER_FRAME);
+	} else {
+		drm_writeback_signal_completion(&wb_conn->base, 0);
+		intel_de_write(display, WD_FRAME_STATUS(trans), WD_FRAME_COMPLETE);
+		wb_conn->frame_num++;
+		if (wb_conn->frame_num > 7)
+			wb_conn->frame_num = 1;
+		wb_conn->job = NULL;
+	}
+}
+
+void intel_writeback_atomic_commit(struct intel_atomic_state *state)
+{
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+	int i;
+
+	for_each_new_connector_in_state(&state->base, connector, conn_state, i) {
+		struct intel_writeback_job *job;
+		struct intel_connector *intel_connector = to_intel_connector(connector);
+
+		if (!conn_state)
+			return;
+
+		if (conn_state->writeback_job && conn_state->writeback_job->fb) {
+			WARN_ON(connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK);
+			job = conn_state->writeback_job->priv;
+
+			drm_writeback_queue_job(job->wb_connector, conn_state);
+			intel_writeback_capture(state, intel_connector);
+		}
+	}
+}
+
 static void intel_writeback_enable_encoder(struct intel_atomic_state *state,
 					   struct intel_encoder *encoder,
 					   const struct intel_crtc_state *crtc_state,
diff --git a/drivers/gpu/drm/i915/display/intel_writeback.h b/drivers/gpu/drm/i915/display/intel_writeback.h
index 5911684cb81a..3c145cf73e20 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.h
+++ b/drivers/gpu/drm/i915/display/intel_writeback.h
@@ -8,10 +8,14 @@
 
 #include <linux/types.h>
 
+#include "intel_display_types.h"
+
+struct intel_atomic_state;
 struct intel_display;
 struct intel_writeback_connector;
 
 int intel_writeback_init(struct intel_display *display);
+void intel_writeback_atomic_commit(struct intel_atomic_state *state);
 
 #endif /* __INTEL_WRITEBACK_H__ */
 
-- 
2.34.1

