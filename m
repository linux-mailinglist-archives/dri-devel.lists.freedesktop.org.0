Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCFBB117B3
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE44A10E9A9;
	Fri, 25 Jul 2025 05:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QTmEtWkX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF2310E44F;
 Fri, 25 Jul 2025 05:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419897; x=1784955897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=djMVt06wY6uaY8L62l7V/mXYrOeB1NmkhTaVVLoh+vE=;
 b=QTmEtWkXyujhs64lb4XaM/3Ke/sSidV9u30CwZpE+2DOrGjLFgZy2ULJ
 Yf5MjJbEwhNN3eBOEDPM+v9p6b2Z13nTaZ01lxPRNt66+rr+QkB5oWZjF
 DlPrVrDWIDrO9u+y6iAQmKTNuuSBuKjH4puGu1zqWT2kHzy2aA8JNc06k
 I0vU1rkcTIztrtrMmOwYUOIWMz40l+LsKQ4VQbe3pewXFJuW7j2Dw6q1B
 Xjumesm7gxKTXo8GEksNUYlOaz7ZIfXIxl9uy1JnFucsf1rk/rD90PU3J
 NwkYJqzogVZRmdi5b6NBlPU+vrdLlp4f4mkBXyoJgI0nK7FQZ8Nd3MVaB A==;
X-CSE-ConnectionGUID: VbV8optUT6K5/6iZDGgHKg==
X-CSE-MsgGUID: cr3GR/kxRCaOy4kDO4+/4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299552"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299552"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:04:57 -0700
X-CSE-ConnectionGUID: 0HvFo3kfSNGJJbuSAx+Pwg==
X-CSE-MsgGUID: REJ+Mg0+T8OnG+PdDqINig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956660"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:04:55 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 18/28] drm/i915/writeback: Add connector atomic check
Date: Fri, 25 Jul 2025 10:33:59 +0530
Message-Id: <20250725050409.2687242-19-suraj.kandpal@intel.com>
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

Add connector helper function for atomic check which sets the
mode_changed bit and checks if pixel format of fb is valid or not.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../gpu/drm/i915/display/intel_writeback.c    | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index 9b2432d86d35..7fb30cc61991 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -186,6 +186,54 @@ static void intel_writeback_connector_destroy(struct drm_connector *connector)
 	kfree(connector);
 }
 
+static int intel_writeback_check_format(u32 format)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(writeback_formats); i++) {
+		if (writeback_formats[i] == format)
+			return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int intel_writeback_atomic_check(struct drm_connector *connector,
+					struct drm_atomic_state *state)
+{
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	struct drm_crtc_state *crtc_state;
+	struct drm_framebuffer *fb;
+	int ret;
+
+	/* We return 0 since this is called while disabling writeback encoder */
+	if (!conn_state->crtc)
+		return 0;
+
+	/* We do not allow a blank commit when using writeback connector */
+	if (!conn_state->writeback_job)
+		return -EINVAL;
+
+	fb = conn_state->writeback_job->fb;
+	if (!fb)
+		return -EINVAL;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	if (fb->width != crtc_state->mode.hdisplay ||
+	    fb->height != crtc_state->mode.vdisplay)
+		return -EINVAL;
+
+	ret = intel_writeback_check_format(fb->format->format);
+	if (ret) {
+		drm_dbg_kms(connector->dev,
+			    "Unsupported drm format sent in writeback job\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static struct drm_writeback_connector *
 intel_get_writeback_connector(struct drm_connector *connector)
 {
@@ -221,6 +269,7 @@ static const struct drm_connector_helper_funcs conn_helper_funcs = {
 	.get_writeback_connector = intel_get_writeback_connector,
 	.get_modes = intel_writeback_get_modes,
 	.mode_valid = intel_writeback_mode_valid,
+	.atomic_check = intel_writeback_atomic_check,
 	.prepare_writeback_job = intel_writeback_prepare_job,
 	.cleanup_writeback_job = intel_writeback_cleanup_job,
 };
-- 
2.34.1

