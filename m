Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0077C6D09F8
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 17:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E9A10EEE5;
	Thu, 30 Mar 2023 15:40:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2048710EEE1;
 Thu, 30 Mar 2023 15:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680190828; x=1711726828;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PNefpu7MBgDx3a0Fxfh+renMuveuBMAkbxAW/37tU5w=;
 b=Gw9/jRqYn42qNLPvkDPjdLjPgDzh/cgY4ddYxUqDcMfXM34bJNuzcM2X
 uuIlltpMB6187qFQTtz/9TxntXhHYYSK4ohD93D1OKLpt5cblOw6qnRwF
 7SwS2LAv0CIMBpu8AkXU6uo9d+FwIbAagKBpnUs6+GpYyQDHp8eG0uTPj
 860wJquIZwOCMUYsxl23CZjdAtqorxieb+2k/ojEE9Oc22ILuxGzjkIbL
 QL+ue+ff6Bzx2seRkxsDT4Ba4P41xPTm7l4vG2jFjhbJ4MV5Arvw90Pjj
 7Npm2Ofh2FVu1bQJDzUpvKO4pNCnH8zBlbEignF4feX2AZuCzx/GvTNwj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="329722183"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="329722183"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:40:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="687294891"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="687294891"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:40:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/12] drm/i915/debugfs: stop using edid_blob_ptr
Date: Thu, 30 Mar 2023 18:39:43 +0300
Message-Id: <867f30b5cbc2f94f0f9d98e4cef7d0427886b108.1680190534.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680190534.git.jani.nikula@intel.com>
References: <cover.1680190534.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Only the EDID code and sysfs should look at the EDID property. Stop
using it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index d5715ccc37f0..2ea16a2e974c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -6,6 +6,7 @@
 #include <linux/string_helpers.h>
 
 #include <drm/drm_debugfs.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_fourcc.h>
 
 #include "hsw_ips.h"
@@ -226,19 +227,18 @@ static void intel_hdcp_info(struct seq_file *m,
 	seq_puts(m, "\n");
 }
 
-static void intel_dp_info(struct seq_file *m,
-			  struct intel_connector *intel_connector)
+static void intel_dp_info(struct seq_file *m, struct intel_connector *connector)
 {
-	struct intel_encoder *intel_encoder = intel_attached_encoder(intel_connector);
+	struct intel_encoder *intel_encoder = intel_attached_encoder(connector);
 	struct intel_dp *intel_dp = enc_to_intel_dp(intel_encoder);
-	const struct drm_property_blob *edid = intel_connector->base.edid_blob_ptr;
+	const struct edid *edid = drm_edid_raw(connector->detect_edid);
 
 	seq_printf(m, "\tDPCD rev: %x\n", intel_dp->dpcd[DP_DPCD_REV]);
 	seq_printf(m, "\taudio support: %s\n",
 		   str_yes_no(intel_dp->has_audio));
 
 	drm_dp_downstream_debug(m, intel_dp->dpcd, intel_dp->downstream_ports,
-				edid ? edid->data : NULL, &intel_dp->aux);
+				edid, &intel_dp->aux);
 }
 
 static void intel_dp_mst_info(struct seq_file *m,
-- 
2.39.2

