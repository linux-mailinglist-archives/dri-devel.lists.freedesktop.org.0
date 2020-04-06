Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4038819F4C9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 13:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8F56E35F;
	Mon,  6 Apr 2020 11:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F33B6E35F;
 Mon,  6 Apr 2020 11:38:07 +0000 (UTC)
IronPort-SDR: FVW4Iel0YSfbZ0all4eJqZGT4ZINi2UehZZ8iBXaEoiJr3ftVsQqxTpNYaRAFu+dSkoCuez/lM
 hKSVk0eZMnxA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 04:38:06 -0700
IronPort-SDR: YQgyt6U4HkLpyUAnw+OZjBMV4dkgfyIVtoVL7VlYfVcAeWyPkl27OAiF5NJ2QxZiVjSYDTt7sF
 pecD9e48CJig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,350,1580803200"; d="scan'208";a="361192422"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2020 04:38:03 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Subject: [PATCH 10/18] drm/i915/display/overlay: Prefer drm_WARN_ON over
 WARN_ON
Date: Mon,  6 Apr 2020 16:57:52 +0530
Message-Id: <20200406112800.23762-11-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200406112800.23762-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200406112800.23762-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct drm_device specific drm_WARN* macros include device information
in the backtrace, so we know what device the warnings originate from.

Prefer drm_WARN_ON over WARN_ON.

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/display/intel_overlay.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index 6e1d66323223..66711e62fa71 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -281,7 +281,7 @@ static void intel_overlay_flip_prepare(struct intel_overlay *overlay,
 	enum pipe pipe = overlay->crtc->pipe;
 	struct intel_frontbuffer *from = NULL, *to = NULL;
 
-	WARN_ON(overlay->old_vma);
+	drm_WARN_ON(&overlay->i915->drm, overlay->old_vma);
 
 	if (overlay->vma)
 		from = intel_frontbuffer_get(overlay->vma->obj);
@@ -350,7 +350,7 @@ static void intel_overlay_release_old_vma(struct intel_overlay *overlay)
 	struct i915_vma *vma;
 
 	vma = fetch_and_zero(&overlay->old_vma);
-	if (WARN_ON(!vma))
+	if (drm_WARN_ON(&overlay->i915->drm, !vma))
 		return;
 
 	intel_frontbuffer_flip_complete(overlay->i915,
@@ -396,7 +396,7 @@ static int intel_overlay_off(struct intel_overlay *overlay)
 	struct i915_request *rq;
 	u32 *cs, flip_addr = overlay->flip_addr;
 
-	WARN_ON(!overlay->active);
+	drm_WARN_ON(&overlay->i915->drm, !overlay->active);
 
 	/* According to intel docs the overlay hw may hang (when switching
 	 * off) without loading the filter coeffs. It is however unclear whether
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
