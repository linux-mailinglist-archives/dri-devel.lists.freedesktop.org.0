Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E27CB0431
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:24:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0968010E620;
	Tue,  9 Dec 2025 14:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tl7k4nEE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB1010E618;
 Tue,  9 Dec 2025 14:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765290237; x=1796826237;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zh6oPQvEwc1yEu7r7NHUjvZ5z5TG5c2SLyisU12NTOk=;
 b=Tl7k4nEEuWzahf1f1XfLKb7Flj13gQXvcdO31Qhk18WBCRynOScP4rCn
 gdmI/sDomXm45XD3loSXuEaTRrrATKcYRHo1mveGP6vAmIPg0ZbAYFNR1
 icnl+bWN0WuWFhGkwiZ4vkaWudJZtwTT6uuvGB33KEBADIYNWIWCDa+1M
 0nbLjmuMY82HEA2z7x8k/UYhg0E9wq4cEIuBcCbfvNolQSFdMMBVVVLlX
 x3cCE/RfVdtO5l2pGuysT1StVHf96+30APeGa0KZQYJnaTkrpCztXSaXf
 LixChsompAqjvEvPSC1905CtBMVTVI8mkZ1yxZBbdRmhh23LFfJv3mJuz Q==;
X-CSE-ConnectionGUID: JOr3X5WqQU6NEkXFe1XVOw==
X-CSE-MsgGUID: EWhenm87Q6iIz8kEb8dg6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="84656950"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="84656950"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 06:23:57 -0800
X-CSE-ConnectionGUID: Q62cH2clQ/K94lR13s45Bw==
X-CSE-MsgGUID: 6N7t9X3tR+elJfIge6Cs2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="227270702"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.154])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 06:23:54 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH 6/7] drm/vblank: use the drm_vblank_crtc() and
 drm_crtc_vblank_crtc() helpers more
Date: Tue,  9 Dec 2025 16:23:14 +0200
Message-ID: <ad41f25c625d6a263b7e2e1d227cb14c5d0ce204.1765290097.git.jani.nikula@intel.com>
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

We have the helpers to avoid open coding dev->vblank[pipe] access.

v2: Rebase

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 91e63177daaf..a86561c4b999 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -551,7 +551,7 @@ int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
 	dev->num_crtcs = num_crtcs;
 
 	for (i = 0; i < num_crtcs; i++) {
-		struct drm_vblank_crtc *vblank = &dev->vblank[i];
+		struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, i);
 
 		vblank->dev = dev;
 		vblank->pipe = i;
@@ -605,7 +605,9 @@ EXPORT_SYMBOL(drm_dev_has_vblank);
  */
 wait_queue_head_t *drm_crtc_vblank_waitqueue(struct drm_crtc *crtc)
 {
-	return &crtc->dev->vblank[drm_crtc_index(crtc)].queue;
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
+
+	return &vblank->queue;
 }
 EXPORT_SYMBOL(drm_crtc_vblank_waitqueue);
 
@@ -729,7 +731,7 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
 	}
 
 	if (drm_drv_uses_atomic_modeset(dev)) {
-		struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+		struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
 
 		mode = &vblank->hwmode;
 	} else {
@@ -1784,7 +1786,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 	if (pipe >= dev->num_crtcs)
 		return -EINVAL;
 
-	vblank = &dev->vblank[pipe];
+	vblank = drm_vblank_crtc(dev, pipe);
 
 	/* If the counter is currently enabled and accurate, short-circuit
 	 * queries to return the cached timestamp of the last vblank.
-- 
2.47.3

