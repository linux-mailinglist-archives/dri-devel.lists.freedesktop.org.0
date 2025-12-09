Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A0ECB042B
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:23:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9743910E61E;
	Tue,  9 Dec 2025 14:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DuX1ZLHE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D7E10E61B;
 Tue,  9 Dec 2025 14:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765290231; x=1796826231;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jd//C1+j4hE3LyQ/oBZKIQiND/RJu4K9iMtTIzXHUAI=;
 b=DuX1ZLHEFMEnucF2upOc/MuE+GoM3tc8ovE4NdabFIhAHaI9sQ/SSVgj
 /fxziX8kMvc/auYI6vdt2uLHQHw/QJ52Out/jnICCoaCwGTdrhxjocdMC
 Cwzin8QzMsjPLm2QEo3kg6iZmfcgvQ4g8PyZf/vzOP9FMJ0qN6YOpL5gs
 VZcmfk48HKryyypP0Fyks5N+Pa4HxVH6UiOAsk1ciVYjuXgazWkb0e6wa
 NMg4yJg+lbApzGSxt3CQVXpFgnIe43M5zanh9LCh4LcVLTXC79uNl/tuV
 fbycrCPuB35Q+9AfeuKn7B3MzRutv0OLnVM/Gq6Kf0P3fQ39m56xB6m2c g==;
X-CSE-ConnectionGUID: pvk29xORQ+2IkuQyAFHiCQ==
X-CSE-MsgGUID: beMxqhKjSyypvqT4xLEuBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67140953"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="67140953"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 06:23:51 -0800
X-CSE-ConnectionGUID: 3c4aXMiyRQiSP7Ax+YvCnQ==
X-CSE-MsgGUID: Z/oQn/idS969AG8EobMP7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="201160821"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.154])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 06:23:48 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH 5/7] drm/vblank: limit vblank variable scope to atomic
Date: Tue,  9 Dec 2025 16:23:13 +0200
Message-ID: <b50f0bff654a6902ffd7ae52c31d46fad9ed7540.1765290097.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765290097.git.jani.nikula@intel.com>
References: <cover.1765290097.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

In drm_crtc_vblank_helper_get_vblank_timestamp_internal(), we only need
the vblank variable for atomic modesetting. Limit the scope to make
upcoming changes easier.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 503eb23d38d2..91e63177daaf 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -710,7 +710,6 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
 {
 	struct drm_device *dev = crtc->dev;
 	unsigned int pipe = crtc->index;
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 	struct timespec64 ts_etime, ts_vblank_time;
 	ktime_t stime, etime;
 	bool vbl_status;
@@ -729,10 +728,13 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
 		return false;
 	}
 
-	if (drm_drv_uses_atomic_modeset(dev))
+	if (drm_drv_uses_atomic_modeset(dev)) {
+		struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+
 		mode = &vblank->hwmode;
-	else
+	} else {
 		mode = &crtc->hwmode;
+	}
 
 	/* If mode timing undefined, just return as no-op:
 	 * Happens during initial modesetting of a crtc.
-- 
2.47.3

