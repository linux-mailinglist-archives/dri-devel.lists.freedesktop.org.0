Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE11ACFEC9
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 11:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A62A10EA25;
	Fri,  6 Jun 2025 09:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ioGDaCJO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B330810EA27;
 Fri,  6 Jun 2025 09:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749200796; x=1780736796;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HB5C6BCHsT5JFoOJ43SwerESUt5mBsUbuCGo9CImbp8=;
 b=ioGDaCJOc7nWi3Przefaauqj79TLWSOBZOi5dMiLMI2GQiDssK7IYRTj
 6hNBw2M9oOqpRg6RusURsiOOIkoOsj/wW7Kpb5Noa+nur/C7laCJCfxHO
 j2WN78hTN5sOF+4tWKc6eh2PWf9OlozsZq8RaEE6jqlNjk3PIxcS+Te2e
 w862YTaT4mjJFW3hw6Li3E6+FxSrjyb3JXxTcLYFt24/edz6TMrIGKDuJ
 jrk2ddO3KiuWdn+ILFd2y3PJKOui9mMGAgywRj1evSVT0fZr3WqufDgFV
 Yn8yqgkWEZccSEnR+GKHzUMf0MBQYTwgpkbnusmZy1eY+qRTveSoCWKE1 Q==;
X-CSE-ConnectionGUID: qVop4F5BQvmLtk2wvxY2Nw==
X-CSE-MsgGUID: FZs7flRUSw+2vRyZgOqeyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="68785087"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="68785087"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 02:06:36 -0700
X-CSE-ConnectionGUID: 16hvF7rWTf+y9xlFcnUZMA==
X-CSE-MsgGUID: 0DBxXEd1QzqwGoE/gugCIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="146289608"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.33])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 02:06:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Wysocki Rafael J <rafael.j.wysocki@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>, simon1.yang@intel.com,
 Doug Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 4/4] drm/i915/panel: sync panel prepared state at register
Date: Fri,  6 Jun 2025 12:05:12 +0300
Message-Id: <a33e4fe5e9970aed9c4aef8c426c00a189149c32.1749199013.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1749199013.git.jani.nikula@intel.com>
References: <cover.1749199013.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the panel is enabled at probe, and we take over the hardware state,
the drm_panel prepared state will be out of sync. We'll need to notify
drm_panel framework about the state at probe, so it can in turn notify
the panel followers.

Cc: Lee Shawn C <shawn.c.lee@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_panel.c | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index b1d549e6cf53..f956919dc648 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -463,6 +463,45 @@ void intel_panel_fini(struct intel_connector *connector)
 	}
 }
 
+/*
+ * If the panel was already enabled at probe, and we took over the state, the
+ * panel prepared state is out of sync, and the panel followers won't be
+ * notified. We need to call drm_panel_prepare() on enabled panels.
+ *
+ * It would be natural to handle this e.g. in the connector ->sync_state hook at
+ * intel_modeset_readout_hw_state(), but that's unfortunately too early. We
+ * don't have drm_connector::kdev at that time. For now, figure out the state at
+ * ->late_register, and sync there.
+ */
+static void intel_panel_sync_state(struct intel_connector *connector)
+{
+	struct intel_display *display = to_intel_display(connector);
+	struct drm_connector_state *conn_state;
+	struct intel_crtc *crtc;
+	int ret;
+
+	ret = drm_modeset_lock(&display->drm->mode_config.connection_mutex, NULL);
+	if (ret)
+		return;
+
+	conn_state = connector->base.state;
+
+	crtc = to_intel_crtc(conn_state->crtc);
+	if (crtc) {
+		struct intel_crtc_state *crtc_state;
+
+		crtc_state = to_intel_crtc_state(crtc->base.state);
+
+		if (crtc_state->hw.active) {
+			drm_dbg_kms(display->drm, "[CONNECTOR:%d:%s] Panel prepare\n",
+				    connector->base.base.id, connector->base.name);
+			intel_panel_prepare(crtc_state, conn_state);
+		}
+	}
+
+	drm_modeset_unlock(&display->drm->mode_config.connection_mutex);
+}
+
 const struct drm_panel_funcs dummy_panel_funcs = {
 };
 
@@ -513,6 +552,8 @@ int intel_panel_register(struct intel_connector *connector)
 		drm_dbg_kms(display->drm, "[CONNECTOR:%d:%s] Registered panel device '%s', has fwnode: %s\n",
 			    connector->base.base.id, connector->base.name,
 			    dev_name(dev), str_yes_no(dev_fwnode(dev)));
+
+		intel_panel_sync_state(connector);
 	}
 
 out:
-- 
2.39.5

