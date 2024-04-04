Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BAB898FA1
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 22:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A0C91134E7;
	Thu,  4 Apr 2024 20:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QvJOqJjY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ACFE1134E7;
 Thu,  4 Apr 2024 20:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712262832; x=1743798832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=92hjle/pwNcWuCE6iVMaitGKnU/LAhsRRTDjpO3z/3w=;
 b=QvJOqJjYky/ds7H5WV9AtTvQBidmIxIBqRYNvgbYFS4qyR+3mHpaLLxa
 FW+bS2FgHN6TgmFBzq0pF9klHWFCyBrO061HRus15h4KqDf6/izg6N+g6
 3mMp+5FTputgtZkV9Qq7QbViYQYncmY86fhpOHgsVfaZBoNLzh7rGQKpF
 52+6VpkR8xppn+0yhXAsQ4jvouOEtkyorfIbyxz8LMf3eJgljPRDhvjil
 r7Xvdz9jqRSxef8BFqC/6uLyNFpFZRG2f9M50pVXptj/kMwKCdzCsjq1m
 wxmgClJXpsBsA95hcz8bDMQk4gn80cQnP/3IxbfG7RCXyUysDB6UeQsWt w==;
X-CSE-ConnectionGUID: ecaFlLc1RlyjSE0Jl77b7g==
X-CSE-MsgGUID: w1dJwxwVQFuulKWIOIhm0g==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25019733"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="25019733"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 13:33:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="827790581"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="827790581"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 04 Apr 2024 13:33:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 04 Apr 2024 23:33:49 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH 04/12] drm/client: Add a FIXME around crtc->mode usage
Date: Thu,  4 Apr 2024 23:33:28 +0300
Message-ID: <20240404203336.10454-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
References: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
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
does work for now. But eventually would be nice to eliminate
all the legacy stuff from atomic drivers.

Switching to crtc->state->mode would require some bigger
changes however, as we currently drop the crtc->mutex
before we're done using the mode. So leave the junk in
for now and just add a FIXME to remind us that this
needs fixing.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 2b7d0be04911..8ef03608b424 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -699,6 +699,10 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 			 *
 			 * This is crtc->mode and not crtc->state->mode for the
 			 * fastboot check to work correctly.
+			 *
+			 * FIXME using legacy crtc->mode with atomic drivers
+			 * is dodgy. Switch to crtc->state->mode, after taking
+			 * care of the resulting locking/lifetime issues.
 			 */
 			DRM_DEBUG_KMS("looking for current mode on connector %s\n",
 				      connector->name);
-- 
2.43.2

