Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D568ABF84BA
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 21:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E399A10E63D;
	Tue, 21 Oct 2025 19:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XKbaDCtj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6E910E337;
 Tue, 21 Oct 2025 19:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761075920; x=1792611920;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0ov3xQ1DiGIU1XYKfskzS67IJN48ZhXTJavVl2Mj1n8=;
 b=XKbaDCtjjZRiVwm6BKgF+cAQDG7qo0ZHFnJrhoyHn9D8knBHeHK8RZfA
 guemUwbVH1kg1vaP9T/qYAq0VNcBoN5IQOQc1rFOCQXbKhWLHODWswQEJ
 wNBajxIC1sGoJ8gewgP6LOMDFZqmDUuYv0+u3/BYSF10QjGoERGMetEyS
 MyciOIlqM/2zrMTOEEtbFGbdcO3hbdGec9CrDcQu96tbDFnqoNks2yrZ1
 TRwzvsOYHWcbhL5p9M3gp1HaNp1CsNV03UodHxN/JxwnSk4zGQIPFPvYx
 00mL6bC+ZONuIIksnfGzF/wOCwP0UecsPZP3DmKWhkP7tFNG/EmaMXji7 A==;
X-CSE-ConnectionGUID: pe9ZYotVR66bMRMT1eYcnQ==
X-CSE-MsgGUID: 2g8K3ii1QnieXwpGXzwxaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63362320"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="63362320"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 12:45:20 -0700
X-CSE-ConnectionGUID: eqxPIHB4T/GFnMWmMVhPvA==
X-CSE-MsgGUID: TSRA0heaSgayrfnXMyVypQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="188788905"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.214])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 12:45:18 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH 4/5] drm/i915/dumb: Reject dumb buffer that exceed max fb
 dimensions
Date: Tue, 21 Oct 2025 22:44:54 +0300
Message-ID: <20251021194455.24297-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251021194455.24297-1-ville.syrjala@linux.intel.com>
References: <20251021194455.24297-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reject dumb buffers that exceed the declared maximum framebuffer
size. Such a buffer would anyway get rejected later, assuming
it got fully wrapped into a framebuffer.

Cc: Daniel Stone <daniels@collabora.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_plane.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index f12f8300a7c4..3325d1bc9666 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -1709,9 +1709,16 @@ int intel_plane_atomic_check(struct intel_atomic_state *state)
 int intel_plane_dumb_create(struct intel_display *display,
 			    struct drm_mode_create_dumb *args)
 {
+	const struct drm_mode_config *mode_config = &display->drm->mode_config;
 	int cpp = DIV_ROUND_UP(args->bpp, 8);
 	u32 format;
 
+	if (args->width > mode_config->max_width)
+		return -EINVAL;
+
+	if (args->height > mode_config->max_height)
+		return -EINVAL;
+
 	switch (cpp) {
 	case 1:
 		format = DRM_FORMAT_C8;
-- 
2.49.1

