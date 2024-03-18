Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 914C787FA8B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 10:14:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC1010F8FD;
	Tue, 19 Mar 2024 09:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="csSI/ZO6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849FA10F8DD
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 09:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710839683; x=1742375683;
 h=resent-from:resent-date:resent-message-id:resent-to:from:
 to:cc:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=HZsgmxpn/d7I73aHkhjqcb9wJ8ucpOy6Wqvzh/mhEpU=;
 b=csSI/ZO6eGcgrQ7IvWg+GNKR1d369ysW4irEFYcIuwIwEhx+6cAifAyD
 imh4XGCSGx+R1MutwvHXDHylB5FL+ffn6QeJUlZrPHcmbnpodwwsNiUf8
 NWcP216Ux4wIp+mKww9wGTxSkKsJbE86iG2XHOv6VRv//29DNDYrOx7Xs
 9V68y4+a6htzbxHBpSpM34ypUjIgt9iLF2JwiB1JwaXcrHWtxnGTvPufu
 +F1TmNk/qc9GTl2I7aw4zgkGZQpzX9D519vT3XLsF+Uf7kbQXiNegzt6G
 icl18360QXteaCVfKIeLwvPSvVpzavUx93OP+HKiEpYv1laK3RWyhjQL2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5529728"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="5529728"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:14:42 -0700
X-ExtLoopCount2: 2 from 10.237.72.74
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="827782080"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="827782080"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 19 Mar 2024 02:14:39 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 19 Mar 2024 11:14:39 +0200
Resent-From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Resent-Date: Tue, 19 Mar 2024 11:14:39 +0200
Resent-Message-ID: <ZflXf8fp5sauI0Ue@intel.com>
Resent-To: dri-devel@lists.freedesktop.org
X-Original-To: ville.syrjala@linux.intel.com
Delivered-To: ville.syrjala@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
 by stinkbox.stink.local with IMAP (fetchmail-6.4.37)
 for <vsyrjala@localhost> (single-drop); Mon, 18 Mar 2024 22:49:05 +0200 (EET)
Received: from orsmga001.jf.intel.com (orsmga001.jf.intel.com [10.7.209.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 9FA28580D4E
 for <ville.syrjala@linux.intel.com>; Mon, 18 Mar 2024 13:44:21 -0700 (PDT)
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="827781926"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="827781926"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 18 Mar 2024 13:44:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 18 Mar 2024 22:44:17 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Simon Ser <contact@emersion.fr>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Sameer Lattannavar <sameer.lattannavar@intel.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: [PATCH v3 2/2] drm/i915: Add SIZE_HINTS property for cursors
Date: Mon, 18 Mar 2024 22:44:08 +0200
Message-ID: <20240318204408.9687-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240318204408.9687-1-ville.syrjala@linux.intel.com>
References: <20240318204408.9687-1-ville.syrjala@linux.intel.com>
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
2.43.2
