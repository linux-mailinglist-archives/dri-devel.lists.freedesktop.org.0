Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3912886A04D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 20:35:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FB110E977;
	Tue, 27 Feb 2024 19:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RQNLzqgl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A1B10E774;
 Tue, 27 Feb 2024 19:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709062538; x=1740598538;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wixL8hXKCRkoLQv8T4g9eHfvcYEDH8H6bntqDHWFuDY=;
 b=RQNLzqglG63ije1Gqn72Rz/QYmxb0tJCZINENSaFAS0KIJpIVn2UCz+J
 f+3EchQJ+s0GpHFsYUxTD5KGD7EJASnPKU/2CiL5+MHatn6akDNTvy74A
 YVS/hVMZL/TZw8zipVUvySmgC/GVGYWr7bDay4dBNs0drGCSy3SOFlm5v
 NtTVRAsSrJMLkg21JyJprAT0cSfvTfV5xWDyTUSJPuaBbVVH041h3tEVV
 Mu0IYvr3lY9LnYMBnmSqHdhQrJWOHAfaDA9cVKraGV3lTtOOVlRwoMzcj
 y3xmyFJwdwmLAAY/6KaZNAC8b3RGhYDCUrRYgX0IpyNfM25shJhL8b/xf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="6377157"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="6377157"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 11:35:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="827770862"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="827770862"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 27 Feb 2024 11:35:33 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 27 Feb 2024 21:35:32 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Simon Ser <contact@emersion.fr>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Sameer Lattannavar <sameer.lattannavar@intel.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: [PATCH v2 2/2] drm/i915: Add SIZE_HINTS property for cursors
Date: Tue, 27 Feb 2024 21:35:23 +0200
Message-ID: <20240227193523.5601-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227193523.5601-1-ville.syrjala@linux.intel.com>
References: <20240227193523.5601-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Advertize more suitable cursor sizes via the new SIZE_HINTS
plane property.

We can't really enumerate all supported cursor sizes on
the platforms where the cursor height can vary freely, so
for simplicity we'll just expose all square+POT sizes between
each platform's min and max cursor limits.

Depending on the platform this will give us one of three
results:
- 64x64,128x128,256x256,512x512
- 64x64,128x128,256x256
- 64x64

Cc: Simon Ser <contact@emersion.fr>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Daniel Stone <daniel@fooishbar.org>
Cc: Sameer Lattannavar <sameer.lattannavar@intel.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index f8b33999d43f..49e9b9be2235 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -823,6 +823,28 @@ static const struct drm_plane_funcs intel_cursor_plane_funcs = {
 	.format_mod_supported = intel_cursor_format_mod_supported,
 };
 
+static void intel_cursor_add_size_hints_property(struct intel_plane *plane)
+{
+	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	const struct drm_mode_config *config = &i915->drm.mode_config;
+	struct drm_plane_size_hint hints[4];
+	int size, max_size, num_hints = 0;
+
+	max_size = min(config->cursor_width, config->cursor_height);
+
+	/* for simplicity only enumerate the supported square+POT sizes */
+	for (size = 64; size <= max_size; size *= 2) {
+		if (drm_WARN_ON(&i915->drm, num_hints >= ARRAY_SIZE(hints)))
+			break;
+
+		hints[num_hints].width = size;
+		hints[num_hints].height = size;
+		num_hints++;
+	}
+
+	drm_plane_add_size_hints_property(&plane->base, hints, num_hints);
+}
+
 struct intel_plane *
 intel_cursor_plane_create(struct drm_i915_private *dev_priv,
 			  enum pipe pipe)
@@ -881,6 +903,8 @@ intel_cursor_plane_create(struct drm_i915_private *dev_priv,
 						   DRM_MODE_ROTATE_0 |
 						   DRM_MODE_ROTATE_180);
 
+	intel_cursor_add_size_hints_property(cursor);
+
 	zpos = DISPLAY_RUNTIME_INFO(dev_priv)->num_sprites[pipe] + 1;
 	drm_plane_create_zpos_immutable_property(&cursor->base, zpos);
 
-- 
2.43.0

