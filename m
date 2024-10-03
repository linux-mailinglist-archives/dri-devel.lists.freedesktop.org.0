Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 745AA98F5EA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 20:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA2A10E8CA;
	Thu,  3 Oct 2024 18:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bpup9Hqc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E8A10E8C9;
 Thu,  3 Oct 2024 18:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727979391; x=1759515391;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n/VM/tyNogsq7+sdBDKT+tIPMYtIVgL9RlJczHT7fAE=;
 b=bpup9HqcknoOlHolFuEHAaZn6bxHwYBfn4vfQMd9bkHZC7AHOnhs1o8Z
 nEDAPUCWLMB7qZ0SRBDYEpq43cKWhLKyyMhC4D/YCjHwbcmC/KjJ52drK
 E89uehPe8AK6PgDTKNaZ73J44puvahmh9XIvPYSzv1a2uEt2JLC0jHNSQ
 AWo46j3kwK6ombTcYATVxIcn/uJ2tth/x2CDtvWQLwR23gvJJzKREr238
 u0bAcVqg/XeeT6cccxPcvRB8yLF182PqYuw8q4RA/u/LrNt7ElwPMo8op
 2pORmhHs5XnCIyruLt1cHd/8+Dg339Tw/VkGNQYaGlNZPWUuy6KIxXHrg w==;
X-CSE-ConnectionGUID: UZcwa0hoRhSzQaJdm04FSg==
X-CSE-MsgGUID: mQceJGhdRdeHtDXlVJocJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27070102"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; d="scan'208";a="27070102"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 11:16:30 -0700
X-CSE-ConnectionGUID: 4zK2GztbREqN6aiWRaKkBg==
X-CSE-MsgGUID: NwzU3H2ZR/6Qijd9B5KT2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; d="scan'208";a="74543912"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 11:16:28 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2024 21:16:27 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 5/8] drm/client: Stop using the legacy crtc->mode
Date: Thu,  3 Oct 2024 21:16:27 +0300
Message-ID: <20241003181627.8950-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241003113304.11700-6-ville.syrjala@linux.intel.com>
References: <20241003113304.11700-6-ville.syrjala@linux.intel.com>
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

crtc->mode is legacy junk and shouldn't really be used with
atomic drivers.

Most (all?) atomic drivers do end up still calling
drm_atomic_helper_update_legacy_modeset_state() at some
point, so crtc->mode does still get populated, and this
does work for now. But now that the modes[] lifetime issues
have been sorted out we can just switch over to the
proper crtc->state->mode.

v2: Rebase

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 730ed0d4bfa9..0f3418cb59ab 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -724,20 +724,9 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 
 		/* last resort: use current mode */
 		if (!mode_valid(&modes[i])) {
-			/*
-			 * IMPORTANT: We want to use the adjusted mode (i.e.
-			 * after the panel fitter upscaling) as the initial
-			 * config, not the input mode, which is what crtc->mode
-			 * usually contains. But since our current
-			 * code puts a mode derived from the post-pfit timings
-			 * into crtc->mode this works out correctly.
-			 *
-			 * This is crtc->mode and not crtc->state->mode for the
-			 * fastboot check to work correctly.
-			 */
 			mode_type = "current";
 			mode_copy_if_not_null(&modes[i],
-					      &connector->state->crtc->mode);
+					      &new_crtc->state->mode);
 		}
 
 		/*
-- 
2.45.2

