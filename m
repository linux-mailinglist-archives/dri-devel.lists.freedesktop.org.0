Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5B1715974
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 11:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C83010E33F;
	Tue, 30 May 2023 09:09:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0361C10E330;
 Tue, 30 May 2023 09:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685437739; x=1716973739;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pvax2fnE7DaVJww4gkiUGJInGESffJTX4RxAlmJZMzk=;
 b=emsEem6Sdv/BKQgvABQ07yvu33dxiTCOhEwFK3JJ7xLsMb94ltkJl9jf
 qHq4dB5q6RR+KcwPFieRlJKUFQj5i0uRY5/+rBbMqZFTK3nw1DNGFr9Vf
 54BxITDsnnPOj8J8pFpn42k9Z0/aFISHzDMmjVaErfKM8vNi9YePDyJuw
 RtlCi7nm240IrDLx0xxqcZaKeCvG52uMe7TFR2h1z3fd3CL56mPCT2mG2
 3i8OWKSbscgIsV8QSjmh+SPkirtKVouEeHz5MthGv+g2Cp0LqNEIAd3A6
 BejfFlbEhNwtVYA7C6HfnOFcKeJhYRWZ9ae2jsh4HxePjHSQ6rDGcOy8P Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="335208765"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="335208765"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 02:08:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="850684472"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="850684472"
Received: from kleve-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.47.8])
 by fmsmga001-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 02:08:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 02/13] drm/display/dp_mst: drop has_audio from struct
 drm_dp_mst_port
Date: Tue, 30 May 2023 12:08:14 +0300
Message-Id: <7d9eefdf150870479c5797f027d4c2b0a19ff583.1685437500.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1685437500.git.jani.nikula@intel.com>
References: <cover.1685437500.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Caching the has_audio in struct drm_dp_mst_port seems odd, and oddly
placed. Defer audio handling to drivers, and use the info from the
connector display info. i915 was the only one using it anyway.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c        | 2 +-
 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 4 ++--
 drivers/gpu/drm/i915/display/intel_dp_mst.c          | 2 +-
 include/drm/display/drm_dp_mst_helper.h              | 5 -----
 4 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 38dab76ae69e..a2b8732db0c8 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4170,7 +4170,7 @@ struct edid *drm_dp_mst_get_edid(struct drm_connector *connector, struct drm_dp_
 	else {
 		edid = drm_get_edid(connector, &port->aux.ddc);
 	}
-	port->has_audio = drm_detect_monitor_audio(edid);
+
 	drm_dp_mst_topology_put_port(port);
 	return edid;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index e72288662f02..77caed2552d0 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -244,9 +244,9 @@ static void intel_dp_info(struct seq_file *m,
 }
 
 static void intel_dp_mst_info(struct seq_file *m,
-			      struct intel_connector *intel_connector)
+			      struct intel_connector *connector)
 {
-	bool has_audio = intel_connector->port->has_audio;
+	bool has_audio = connector->base.display_info.has_audio;
 
 	seq_printf(m, "\taudio support: %s\n", str_yes_no(has_audio));
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 6df8519b3347..1d483a83d59c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -298,7 +298,7 @@ static bool intel_dp_mst_has_audio(const struct drm_connector_state *conn_state)
 		to_intel_connector(conn_state->connector);
 
 	if (intel_conn_state->force_audio == HDMI_AUDIO_AUTO)
-		return connector->port->has_audio;
+		return connector->base.display_info.has_audio;
 	else
 		return intel_conn_state->force_audio == HDMI_AUDIO_ON;
 }
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index 32c764fb9cb5..5be96a158ab2 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -139,11 +139,6 @@ struct drm_dp_mst_port {
 	 * that the EDID for all connectors is read immediately.
 	 */
 	struct edid *cached_edid;
-	/**
-	 * @has_audio: Tracks whether the sink connector to this port is
-	 * audio-capable.
-	 */
-	bool has_audio;
 
 	/**
 	 * @fec_capable: bool indicating if FEC can be supported up to that
-- 
2.39.2

