Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A045CA760A
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:28:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F9010EAD1;
	Fri,  5 Dec 2025 11:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dg3Go97U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC7C10EACC;
 Fri,  5 Dec 2025 11:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764934103; x=1796470103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zh6oPQvEwc1yEu7r7NHUjvZ5z5TG5c2SLyisU12NTOk=;
 b=Dg3Go97UCd5CyuvEpvhyHpIntjGJZYyODJVPK9OfZHbk4kOoKGIbBtTS
 wIF6i/xEc5ZQ/5Ifkkk1D8x835Ae+HYuaOxP8DYxc260h1y3HqaV3803E
 6gtph2KoPybhYpAxKxpfkGfXIpa3mTdkqTO2NFhIM0p8dstggTH0vyjko
 sgMJiR1YticF8k2B64qI19qAKatQTSdJJr0/lkHo2uAWYi0qPElNtwVXt
 fhiVCw01Mx1ejXteHIkPg/r3Ft+ONtdf+N0x+pbDJ8f6EmG1e0vvTWKvb
 GtLmuNhY2r3bCBuYjuiPsi1dxM+78Tm02L1mI1duvJkecJbVWIbvT+SRo w==;
X-CSE-ConnectionGUID: agBYfrSwSLCdSm4Hu7SxfA==
X-CSE-MsgGUID: vKBWvDh7TsiZFZMxxlEgrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66861903"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="66861903"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:28:23 -0800
X-CSE-ConnectionGUID: FCnNjKkCReeF27T2I1k9xg==
X-CSE-MsgGUID: SbBE2jrgSHO1j6VQi56Jvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="195188087"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:28:20 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 06/25] drm/vblank: use the drm_vblank_crtc() and
 drm_crtc_vblank_crtc() helpers more
Date: Fri,  5 Dec 2025 13:27:22 +0200
Message-ID: <52421f785542e109e86c6be7e5d805fe1316581d.1764933891.git.jani.nikula@intel.com>
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

