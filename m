Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DE589CC36
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 21:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F453112828;
	Mon,  8 Apr 2024 19:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WBFjuCaD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CF61127EF;
 Mon,  8 Apr 2024 19:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712603182; x=1744139182;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=znPNea9/5wTXB58sWQjupuPxu9fxhYmg0jiERI1q8bk=;
 b=WBFjuCaDxeV/RkeMM4srFNTF6JSsRdk9G4SPKgPbDm5wLMeiY1Q6V4lh
 ToNdAeHBsoPGM6VN023x/r/Zo0m7lBTaSgBO5yye0VzeDnh5soTv8GycZ
 pCcUWmASrjlQ9JnjNmX5FgfjUfzNfa9fcGEpa0GFocuuN6+sgPzH2FNtN
 MNpFj3x0pryZ5o46As+bE4KMXdjKVr+th9bUk+/dAe+HE8mNX8qhzlY3+
 dEYzm9Om4nlNCE75LkLCr0xhNQtLn+RORDnRbBqOqrgxA27r0ynN3gX25
 t+77RUHR0obj25Na9mBmZRiiF7Jy4MMsgjraxBofyMwbYCE54WlQwsUwV A==;
X-CSE-ConnectionGUID: kpUXIgxNQ1mzKWo/vMy1Yw==
X-CSE-MsgGUID: LwNlDuf0QeqpM4w4FjYBfw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19278635"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="19278635"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 12:06:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792378"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="827792378"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 12:06:19 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 22:06:18 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/5] drm/i915: Use drm_crtc_vblank_crtc()
Date: Mon,  8 Apr 2024 22:06:09 +0300
Message-ID: <20240408190611.24914-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240408190611.24914-1-ville.syrjala@linux.intel.com>
References: <20240408190611.24914-1-ville.syrjala@linux.intel.com>
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

Replace the open coded drm_crtc_vblank_crtc() with the real
thing.

Cc: intel-gfx@lists.freedesktop.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c   |  3 +--
 drivers/gpu/drm/i915/display/intel_vblank.c | 16 +++++-----------
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 25593f6aae7d..339010384b86 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -78,8 +78,7 @@ void intel_wait_for_vblank_if_active(struct drm_i915_private *i915,
 
 u32 intel_crtc_get_vblank_counter(struct intel_crtc *crtc)
 {
-	struct drm_device *dev = crtc->base.dev;
-	struct drm_vblank_crtc *vblank = &dev->vblank[drm_crtc_index(&crtc->base)];
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(&crtc->base);
 
 	if (!crtc->active)
 		return 0;
diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index baf7354cb6e2..951190bcbc50 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -132,8 +132,7 @@ u32 g4x_get_vblank_counter(struct drm_crtc *crtc)
 static u32 intel_crtc_scanlines_since_frame_timestamp(struct intel_crtc *crtc)
 {
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
-	struct drm_vblank_crtc *vblank =
-		&crtc->base.dev->vblank[drm_crtc_index(&crtc->base)];
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(&crtc->base);
 	const struct drm_display_mode *mode = &vblank->hwmode;
 	u32 htotal = mode->crtc_htotal;
 	u32 clock = mode->crtc_clock;
@@ -178,8 +177,7 @@ static u32 intel_crtc_scanlines_since_frame_timestamp(struct intel_crtc *crtc)
  */
 static u32 __intel_get_crtc_scanline_from_timestamp(struct intel_crtc *crtc)
 {
-	struct drm_vblank_crtc *vblank =
-		&crtc->base.dev->vblank[drm_crtc_index(&crtc->base)];
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(&crtc->base);
 	const struct drm_display_mode *mode = &vblank->hwmode;
 	u32 vblank_start = mode->crtc_vblank_start;
 	u32 vtotal = mode->crtc_vtotal;
@@ -200,17 +198,14 @@ static int __intel_get_crtc_scanline(struct intel_crtc *crtc)
 {
 	struct drm_device *dev = crtc->base.dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
-	const struct drm_display_mode *mode;
-	struct drm_vblank_crtc *vblank;
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(&crtc->base);
+	const struct drm_display_mode *mode = &vblank->hwmode;
 	enum pipe pipe = crtc->pipe;
 	int position, vtotal;
 
 	if (!crtc->active)
 		return 0;
 
-	vblank = &crtc->base.dev->vblank[drm_crtc_index(&crtc->base)];
-	mode = &vblank->hwmode;
-
 	if (crtc->mode_flags & I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP)
 		return __intel_get_crtc_scanline_from_timestamp(crtc);
 
@@ -254,8 +249,7 @@ static int __intel_get_crtc_scanline(struct intel_crtc *crtc)
 
 int intel_crtc_scanline_to_hw(struct intel_crtc *crtc, int scanline)
 {
-	const struct drm_vblank_crtc *vblank =
-		&crtc->base.dev->vblank[drm_crtc_index(&crtc->base)];
+	const struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(&crtc->base);
 	const struct drm_display_mode *mode = &vblank->hwmode;
 	int vtotal;
 
-- 
2.43.2

