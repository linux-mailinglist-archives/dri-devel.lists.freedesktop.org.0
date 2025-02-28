Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22464A4A4CC
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 22:15:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82AAF10ED56;
	Fri, 28 Feb 2025 21:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jP0JZzRQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCA710ED4B;
 Fri, 28 Feb 2025 21:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740777315; x=1772313315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bULcN5viyy0C1hLt2e4R+uly163iYAmhTg0lzJ8LsWw=;
 b=jP0JZzRQl0VFeyFjaugil6k4waB4F1rO4o5vyWGMaxNt403FABikuU9w
 Igy3YZV6Jd38n/ONZDUuHnc3WAyNIG+H9XgMytK4+1047kgAzJexKnyZy
 l4KUuApbzAh1Skb8RqMF8c4K3OmyhdQYptnfnu4ybH6dTpZMzNAfbbCyo
 bg3WLHZ8Us1uacbwQvLvzh4zBkCHye8kENGVoCcJE2ezUY6jm0F2/IiQs
 4QBif3UAGwqkXbSIFATgNl1txAH1gV/v9I3oWVdLJ6eexghZ5eWyd6JNC
 0ZFQRfavEoth7WVIvlmrtbT1PTuqSMLg2yUDHDXS2L+4uGsrpGZA5pwLY Q==;
X-CSE-ConnectionGUID: BkCVrkqzSeKt1ZLVHQcvQA==
X-CSE-MsgGUID: FYhC1MqVSryBSwmltC5DfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="52352329"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="52352329"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 13:15:15 -0800
X-CSE-ConnectionGUID: e89fWaxdSk2kS2PRUZyADQ==
X-CSE-MsgGUID: +bDzgA0cTDWM2Sj8vsFu5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122684887"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 28 Feb 2025 13:15:13 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 28 Feb 2025 23:15:12 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 5/8] drm/client: Stop using the legacy crtc->mode
Date: Fri, 28 Feb 2025 23:14:51 +0200
Message-ID: <20250228211454.8138-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250228211454.8138-1-ville.syrjala@linux.intel.com>
References: <20250228211454.8138-1-ville.syrjala@linux.intel.com>
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
index ff034359f063..4c64535fb82c 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -733,20 +733,9 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 
 		/* last resort: use current mode */
 		if (!modes[i]) {
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
 			mode_replace(dev, &modes[i],
-				     &connector->state->crtc->mode);
+				     &new_crtc->state->mode);
 		}
 
 		/*
-- 
2.45.3

