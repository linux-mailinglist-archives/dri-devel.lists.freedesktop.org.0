Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA9DCA7601
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:28:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7B710EAC9;
	Fri,  5 Dec 2025 11:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k69Y0rbn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6125210EACC;
 Fri,  5 Dec 2025 11:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764934097; x=1796470097;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jd//C1+j4hE3LyQ/oBZKIQiND/RJu4K9iMtTIzXHUAI=;
 b=k69Y0rbnwewIujD/X9p8zTDIIFzuR7F3MzsEZmKjc7kTNltFxMFle8cZ
 58bM6sWYX/+A2qu7V7erv5ZcS+41p2vsX81dgRDIL5OKwzJIO0moxzvO9
 9M89vJuc1toOcUhMKxYglVun+6BP70Yye4o8D1bJ3+XlSJIcWVbVK1Knb
 pXkXkK/jjTCJAFv4r+k7jFytzR7RM5B91Dvy4roKCC7Y1JgsY6EDuA4zQ
 xo1utSEi0yoauf+umyH641RlDrKXDIIr8q/MpE4uH/Dtk27QlcoCaPj55
 5plXDKEIiKqv1GH+jNUejYSwoVzLVPNJNaJo3zcpcvjqTbeSIE48N8jJJ w==;
X-CSE-ConnectionGUID: wwahbja8QuGxKgRsdLsrEQ==
X-CSE-MsgGUID: +qscqsgiSeS3NaHrohS+7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="65968458"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="65968458"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:28:17 -0800
X-CSE-ConnectionGUID: ePnRNJ82TIuqMCXqNs5w7g==
X-CSE-MsgGUID: Tn3bVrAjQmqtfYO1xiWyiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="232650369"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:28:15 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 05/25] drm/vblank: limit vblank variable scope to atomic
Date: Fri,  5 Dec 2025 13:27:21 +0200
Message-ID: <955a25cf930344191a48dd1c736a355f1e1d4389.1764933891.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1764933891.git.jani.nikula@intel.com>
References: <cover.1764933891.git.jani.nikula@intel.com>
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

