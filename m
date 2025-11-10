Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02B5C47DAF
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC09810E439;
	Mon, 10 Nov 2025 16:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QHLCHvFh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD8110E439;
 Mon, 10 Nov 2025 16:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762791496; x=1794327496;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HyuYf6KkEyaVrK6fLBHoTnii/H1JRPYjEKtohrqf7F0=;
 b=QHLCHvFhJsW2zLwI+rytEKSg7g+vzmEdJpLPJ4Wb1J6L0oky9PYkUBmZ
 ssrial0Gh0PXfBc9s0At2dNeeX10+QIhswPWWQ1CPIQFNCtJzIcJe2hB+
 gXufBWqCDI7Nk/ZKFmWiqvVedz4AT+ifcsBtLmvwNRy6i3zwsWR0k6rXG
 TFgYpcTpjPHIAp/DaW0m36f0uDaafx7FIyjdQuIYnueufpkDfpJOmzmzV
 SAFDS9tlhMHnUD73NvOJfTXF3ncQzzC08934cOW5HlxRAmMdl4GdPzyh7
 AGl0DE+TaFdS9iscSQgBLWCjFIzRm8ESp5K+S81SzW9N56jqROS44radS w==;
X-CSE-ConnectionGUID: LXhh7HKtTEeb0bCzYtFdUw==
X-CSE-MsgGUID: vM1qMPM7SF+rFWU0ieqb3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75136479"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="75136479"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:18:15 -0800
X-CSE-ConnectionGUID: fwYDOJjOQO+Oz+lSQwWJxA==
X-CSE-MsgGUID: Hqq7Hw+FSj+LxiqyQHOk/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="225970079"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:18:13 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 05/24] drm/vblank: use the drm_vblank_crtc() and
 drm_crtc_vblank_crtc() helpers more
Date: Mon, 10 Nov 2025 18:17:23 +0200
Message-ID: <84b53d5530efc51a8efa01d7cd3699f136789b6e.1762791343.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1762791343.git.jani.nikula@intel.com>
References: <cover.1762791343.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

We have the helpers to avoid open coding dev->vblank[pipe] access.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 503eb23d38d2..e3a5a783686f 100644
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
 
@@ -710,7 +712,7 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
 {
 	struct drm_device *dev = crtc->dev;
 	unsigned int pipe = crtc->index;
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
 	struct timespec64 ts_etime, ts_vblank_time;
 	ktime_t stime, etime;
 	bool vbl_status;
@@ -1782,7 +1784,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 	if (pipe >= dev->num_crtcs)
 		return -EINVAL;
 
-	vblank = &dev->vblank[pipe];
+	vblank = drm_vblank_crtc(dev, pipe);
 
 	/* If the counter is currently enabled and accurate, short-circuit
 	 * queries to return the cached timestamp of the last vblank.
-- 
2.47.3

