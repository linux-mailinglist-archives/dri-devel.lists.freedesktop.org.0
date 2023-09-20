Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6337A8E57
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 23:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4E410E567;
	Wed, 20 Sep 2023 21:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BDA10E56B;
 Wed, 20 Sep 2023 21:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695244857; x=1726780857;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YJAYIV5p2+KM7HLqocbEj70PwpD0CSfqSHDXdPkW+Ko=;
 b=MefqbfWoApIbP+1KqXLLugB4ZEjEzgLsgMnl1uJsB9ewvhyZuScqYqvh
 Ki0QXeoZ8LmVr9Ft6XOhhyBY94GOgRUMkFwx/keyqesT/8B3Vm4P2ANKi
 kPOVCdpg9CVukhqd3jnWvEUQ89R5kbsoQ8uhKex9DeNMToCILwqxbVes0
 JiO6rNUIdIEvZvOictOERox0BteyaP9AooDxElUU0tpmKtYBZYJerroQE
 p9K+o4wjDpOfZWkShae+rzC9MXfDYq6mrmVIWxyGvve25G/td0D699CJQ
 M0cBJtVguxVkU31up0kwEWy5zCWY3ajw5vACn/m6IQKu9sSBq13a6xoUj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="359727158"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="359727158"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 14:19:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="776155755"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="776155755"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga008.jf.intel.com with SMTP; 20 Sep 2023 14:19:39 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 21 Sep 2023 00:19:38 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/i915/bios: Fixup h/vsync_end instead of h/vtotal
Date: Thu, 21 Sep 2023 00:19:34 +0300
Message-ID: <20230920211934.14920-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920211934.14920-1-ville.syrjala@linux.intel.com>
References: <20230920211934.14920-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

We have the same h/vsync_end vs. h/vtotal quirk in the VBT parser
that was also present in EDID parser. Adjust the VBT parser the
same way as was done for hte EDID parser to fixup h/vsync_end
instead of h/vtotal. While I'm not currently aware of any machines
that need this for the VBT it seems prudent to keep both parsers
in sync.

And while at it let's add some debugs here as well. A bit
lackluster but didn't feel like plumbing the connector all
the way down at this time.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index f735b035436c..863ff54fffd1 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -521,7 +521,8 @@ static void init_bdb_blocks(struct drm_i915_private *i915,
 }
 
 static void
-fill_detail_timing_data(struct drm_display_mode *panel_fixed_mode,
+fill_detail_timing_data(struct drm_i915_private *i915,
+			struct drm_display_mode *panel_fixed_mode,
 			const struct lvds_dvo_timing *dvo_timing)
 {
 	panel_fixed_mode->hdisplay = (dvo_timing->hactive_hi << 8) |
@@ -561,11 +562,17 @@ fill_detail_timing_data(struct drm_display_mode *panel_fixed_mode,
 	panel_fixed_mode->height_mm = (dvo_timing->vimage_hi << 8) |
 		dvo_timing->vimage_lo;
 
-	/* Some VBTs have bogus h/vtotal values */
-	if (panel_fixed_mode->hsync_end > panel_fixed_mode->htotal)
-		panel_fixed_mode->htotal = panel_fixed_mode->hsync_end + 1;
-	if (panel_fixed_mode->vsync_end > panel_fixed_mode->vtotal)
-		panel_fixed_mode->vtotal = panel_fixed_mode->vsync_end + 1;
+	/* Some VBTs have bogus h/vsync_end values */
+	if (panel_fixed_mode->hsync_end > panel_fixed_mode->htotal) {
+		drm_dbg_kms(&i915->drm, "reducing hsync_end %d->%d\n",
+			    panel_fixed_mode->hsync_end, panel_fixed_mode->htotal);
+		panel_fixed_mode->hsync_end = panel_fixed_mode->htotal;
+	}
+	if (panel_fixed_mode->vsync_end > panel_fixed_mode->vtotal) {
+		drm_dbg_kms(&i915->drm, "reducing vsync_end %d->%d\n",
+			    panel_fixed_mode->vsync_end, panel_fixed_mode->vtotal);
+		panel_fixed_mode->vsync_end = panel_fixed_mode->vtotal;
+	}
 
 	drm_mode_set_name(panel_fixed_mode);
 }
@@ -849,7 +856,7 @@ parse_lfp_panel_dtd(struct drm_i915_private *i915,
 	if (!panel_fixed_mode)
 		return;
 
-	fill_detail_timing_data(panel_fixed_mode, panel_dvo_timing);
+	fill_detail_timing_data(i915, panel_fixed_mode, panel_dvo_timing);
 
 	panel->vbt.lfp_lvds_vbt_mode = panel_fixed_mode;
 
@@ -1134,7 +1141,7 @@ parse_sdvo_panel_data(struct drm_i915_private *i915,
 	if (!panel_fixed_mode)
 		return;
 
-	fill_detail_timing_data(panel_fixed_mode, &dtds->dtds[index]);
+	fill_detail_timing_data(i915, panel_fixed_mode, &dtds->dtds[index]);
 
 	panel->vbt.sdvo_lvds_vbt_mode = panel_fixed_mode;
 
-- 
2.41.0

