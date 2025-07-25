Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F09AB117AA
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6EA410E442;
	Fri, 25 Jul 2025 05:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z7MiHrwH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A68010E43B;
 Fri, 25 Jul 2025 05:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419888; x=1784955888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yv5Lasv51drvSAlmTVYI3hsx5BDYHtKJNv1M6pyT9gY=;
 b=Z7MiHrwH3vVwbZgu+AvqU6V6GjwjEhy/RPxh4gU0xX5r3u/Dxdem796+
 E34EUD20q5EI0PppHXK1XzjE+H5YQR4yxZ54mVmFII5ntWi3bMm9fQf7d
 M2VdjBXTMUY6XhtOchqsg5kmv6Qh+EvsC2iAcfIjvnchYznk6580ssU9x
 NTBW955WjcWl0YlSmQV+I/ClZY68G7e2URXLYMCoO+Iy9FQ4f4GTi7W5E
 RQC8VZNQJXcPTblUT7+EPp1MGUhUj6PX1izGzYIOHojmB9DjTlEL1EiI8
 XPZbflFGi0hYvu0jI3lybCNO8rjpdMWyrNN4w5wAzw5GS4KCcvdi9ey+S g==;
X-CSE-ConnectionGUID: cPeeVqAlRx29rNw+Qxzc/Q==
X-CSE-MsgGUID: Y6byWYk3RAGwMudzvUNzCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299545"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299545"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:04:48 -0700
X-CSE-ConnectionGUID: 5A9coD5STaGW1fDBThkZJQ==
X-CSE-MsgGUID: +LOPu6BvSxetzFr0bZ5/rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956628"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:04:46 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 14/28] drm/i915/writeback: Define function for prepare and
 cleanup hooks
Date: Fri, 25 Jul 2025 10:33:55 +0530
Message-Id: <20250725050409.2687242-15-suraj.kandpal@intel.com>
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

Define function for prepare and cleanup hooks which help map
and unmap drm framebuffer since we need these address to do
register writes in WD_SURF and WD_STRIDE register.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../gpu/drm/i915/display/intel_writeback.c    | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index 8d24b1ee0a2a..f1570a638422 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/slab.h>
+#include <linux/err.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_writeback.h>
 #include <drm/drm_modeset_helper_vtables.h>
@@ -11,13 +12,16 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 
 #include "i915_drv.h"
+#include "i915_vma.h"
 #include "intel_atomic.h"
 #include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_display_driver.h"
 #include "intel_connector.h"
+#include "intel_fb_pin.h"
 #include "intel_writeback.h"
 #include "intel_writeback_reg.h"
 
@@ -107,6 +111,68 @@ static int intel_writeback_get_modes(struct drm_connector *connector)
 	return drm_add_modes_noedid(connector, 3840, 2160);
 }
 
+static int intel_writeback_prepare_job(struct drm_writeback_connector *wb_connector,
+				       struct drm_writeback_job *job)
+{
+	struct intel_writeback_connector *wb_conn =
+		to_intel_writeback_connector(wb_connector);
+	struct i915_vma *vma;
+	struct intel_writeback_job *wb_job;
+	unsigned long out_flags = 0;
+	const struct i915_gtt_view view = {
+		.type = I915_GTT_VIEW_NORMAL,
+	};
+	int ret;
+
+	if (!job->fb)
+		return 0;
+
+	if (job->fb->modifier != DRM_FORMAT_MOD_LINEAR)
+		return -EINVAL;
+
+	wb_job = kzalloc(sizeof(*wb_job), GFP_KERNEL);
+	if (!wb_job)
+		return -ENOMEM;
+
+	vma = intel_fb_pin_to_ggtt(job->fb, &view, 4 * 1024, 0, 0, true, &out_flags);
+	if (IS_ERR(vma)) {
+		drm_err(job->fb->dev, "Failed to map framebuffer: %d\n", ret);
+		ret = PTR_ERR(vma);
+		goto err;
+	}
+
+	wb_job->fb = job->fb;
+	wb_job->vma = vma;
+	wb_job->wb_connector = wb_connector;
+	drm_framebuffer_get(wb_job->fb);
+	job->priv = wb_job;
+	wb_conn->job = wb_job;
+
+	return 0;
+
+err:
+	kfree(wb_job);
+	return ret;
+}
+
+static void intel_writeback_cleanup_job(struct drm_writeback_connector *connector,
+					struct drm_writeback_job *job)
+{
+	struct intel_writeback_job *wb_job = job->priv;
+	struct i915_vma *vma;
+	unsigned long out_flags = 0;
+
+	if (!job->fb)
+		return;
+
+	vma = wb_job->vma;
+	wb_job->vma = NULL;
+	intel_fb_unpin_vma(vma, out_flags);
+	drm_framebuffer_put(wb_job->fb);
+	kfree(wb_job);
+	job->priv = NULL;
+}
+
 static struct drm_writeback_connector *
 intel_get_writeback_connector(struct drm_connector *connector)
 {
@@ -140,6 +206,8 @@ static const struct drm_connector_helper_funcs conn_helper_funcs = {
 	.get_writeback_connector = intel_get_writeback_connector,
 	.get_modes = intel_writeback_get_modes,
 	.mode_valid = intel_writeback_mode_valid,
+	.prepare_writeback_job = intel_writeback_prepare_job,
+	.cleanup_writeback_job = intel_writeback_cleanup_job,
 };
 
 static const struct drm_writeback_connector_helper_funcs writeback_conn_helper_funcs = {
-- 
2.34.1

