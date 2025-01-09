Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCF7A08113
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 21:01:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015E710EFDB;
	Thu,  9 Jan 2025 20:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OCbtp6FS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433B410EFD7;
 Thu,  9 Jan 2025 20:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736452889; x=1767988889;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=hbchfju9b4CRHL5Ou5/eNr/bEReF2TKUmkIfMY9Llis=;
 b=OCbtp6FS+f2A91DzpMdedvvGKXilMUThaqghE0sVOB6APKz7Go123ofv
 w/P1sJOduSzwdGUe/xByPbI953Ol/STMdVzzgtyDlXOhR7axhpoXCu5Ku
 65f9DjufRk1d1ruBxC2EGNC9wDO+8NGAQYP8QEorsMRQ36ykZrzmKSXOr
 be+tjY4xFf2bxcmDCKsapjuLmQQY4/BPuwQ+4YNqypFB9SpjN8EE2hhD8
 Y+5N+lgBq6s8mXaaR/537pZmHS/BOd9/SNYBbRYXohHp0pV6esTLDWMuV
 x0wufduepW8ZVfSaPxD+3oqPvU0yW5K+WOwOi6g6hU9p5lCHZDe/3p9oA g==;
X-CSE-ConnectionGUID: fm0NpflPSaKzqFmWLE8C9w==
X-CSE-MsgGUID: CpXYRXqhQYCUjA+7jn111g==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36619293"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="36619293"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 12:01:25 -0800
X-CSE-ConnectionGUID: lX0bx9siTrSD89WY7tNTjQ==
X-CSE-MsgGUID: YqiEEqPpQt2NZRjg1nfZsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126798693"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 09 Jan 2025 12:01:22 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Fri, 10 Jan 2025 01:15:39 +0530
Subject: [PATCH v7 11/14] drm/i915/crtc: Hook i915 IET LUT with the drm IET
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-dpst-v7-11-605cb0271162@intel.com>
References: <20250110-dpst-v7-0-605cb0271162@intel.com>
In-Reply-To: <20250110-dpst-v7-0-605cb0271162@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: dmitry.baryshkov@linaro.org, suraj.kandpal@intel.com, 
 uma.shankar@intel.com, 
 "Imported from f20241218-dpst-v7-0-81bfe7d08c2d"@intel.com, 
 20240705091333.328322-1-mohammed.thasleem@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

Upon drm getting the IET LUT value from the user through the IET_LUT
property, i915 driver will write the LUT table to the hardware
registers.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c    | 3 +++
 drivers/gpu/drm/i915/display/intel_display.c | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 619aa363724602d4084184bfdf5766b71aed1b9f..8c1527ae348083c9d8af7cbbbe188ed18afb0a43 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -387,6 +387,9 @@ int intel_crtc_init(struct drm_i915_private *dev_priv, enum pipe pipe)
 	if (drm_crtc_create_histogram_property(&crtc->base,
 					       crtc->histogram->caps))
 		drm_err(&dev_priv->drm, "Failed to initialize histogram properties\n");
+	if (drm_crtc_create_iet_lut_property(&crtc->base,
+					     crtc->histogram->iet_caps))
+		drm_err(&dev_priv->drm, "Failed to initialize histogram properties\n");
 
 	intel_color_crtc_init(crtc);
 	intel_drrs_crtc_init(crtc);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 486992a2caadebf2d3deb200b01d2d0d26b26cb0..dfa0b214a54b5336d45e965282b7d8017f68bafa 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7890,6 +7890,8 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 			intel_histogram_update(crtc,
 					       (struct drm_histogram_config *)
 					       new_crtc_state->uapi.histogram_enable->data);
+		if (new_crtc_state->uapi.iet_lut_updated)
+			intel_histogram_set_iet_lut(crtc, new_crtc_state->uapi.iet_lut);
 	}
 
 	/* Underruns don't always raise interrupts, so check manually */

-- 
2.25.1

