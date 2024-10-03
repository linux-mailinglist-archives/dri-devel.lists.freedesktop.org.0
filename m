Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA28198EE32
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 13:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F2B10E81B;
	Thu,  3 Oct 2024 11:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ekg/2ATL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A1A10E81B;
 Thu,  3 Oct 2024 11:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727955203; x=1759491203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zwoTH6dv5J17CVV+F7mJ9gz7DFU3Wnk39sxXGUoH3LE=;
 b=Ekg/2ATLTZMEXkakf22dpGtvz8+cw8G/gvgszHwJgz/3UekixVZm345e
 b02YOMr8Ja2LKS8ZCkSOjAnQbMRklVpia7n1qJ2CspJ7zeFs1NwzFHv3t
 H4TDLEDVoKFWpLUXhUgl6MiSr789/Ejxz+fnmYGRfq//BfgDsuJZxUhkU
 JL4U+HeGcUQRd70VcCHf0XeiKkk9Uub4/kAPLzbuLU7PiR90sVH4Ciuzt
 gVlCQXb8aA0UusTgeylxzBq2mR4tuPyyplmDFRRE3iOjrdmyXgRy2Nm0t
 BHVZdfihfP575iz4J7eas4WxykCH6S/Mis2v1la7IN/daPV6Fr/68ztmw w==;
X-CSE-ConnectionGUID: VhY8wgrhQnelaNzbnbKzdA==
X-CSE-MsgGUID: ep2iv+BHT/2323q6HDN5MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="38503006"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="38503006"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 04:33:23 -0700
X-CSE-ConnectionGUID: DyDTOqyySi+K1kD8KUSg5g==
X-CSE-MsgGUID: Wy/ocmcvRX6/jUQb3FZPJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="74426543"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 04:33:21 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2024 14:33:20 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/8] drm/client: Stop using the legacy crtc->mode
Date: Thu,  3 Oct 2024 14:33:01 +0300
Message-ID: <20241003113304.11700-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241003113304.11700-1-ville.syrjala@linux.intel.com>
References: <20241003113304.11700-1-ville.syrjala@linux.intel.com>
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

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index d413e119db3f..3e49448370c4 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -710,19 +710,8 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 
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
-			drm_mode_copy(&modes[i], &connector->state->crtc->mode);
+			drm_mode_copy(&modes[i], &new_crtc->state->mode);
 		}
 
 		/*
-- 
2.45.2

