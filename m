Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 517A3C47E27
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:19:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E3810E47A;
	Mon, 10 Nov 2025 16:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HXfCUcNp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC89F10E475;
 Mon, 10 Nov 2025 16:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762791571; x=1794327571;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c8Ap6FGF6I0FpuGm+jaBJaqm6+VMSpCL+LNLGdYLTtc=;
 b=HXfCUcNpwuA3qdfBie2DYOX47tPVYqwGQYKVg1Cite8PtvYVyxjMgL2C
 LC2E0q1nrJJxFQsslXmVq3vfat6o0OBOaz24iJQBM1aM9546wyO5zBgfZ
 aQJWK6I0x6fo8BltkNd6RXB4cvgiOYLgJ+bJPcFhTIlmpMP20mcwBJ98C
 aumEDg6x2QhLq5zx65Aw5JY+krFke8MkQ7Y5XuQcK44qTHk5cfzgrQdxO
 qimODM+GgS/EYNS9JVd2KwGputuQzXfh3p0AnPRQ7YeKBi3hcmJWUo5hx
 kcV7lqru3U537ho0NAUpEX/LHBcCx2gKtulKBlmrQzmCxDN7OtBX5lUr8 g==;
X-CSE-ConnectionGUID: Fu5pDRbURnm4zGMcayBWiA==
X-CSE-MsgGUID: X1+C7QBxQgKQJLbx1P/akQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="82242436"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="82242436"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:19:31 -0800
X-CSE-ConnectionGUID: XICKUblQT4KFP9aP2PFgVQ==
X-CSE-MsgGUID: rwTOWshOQcCKkBv/OUu9sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="193897831"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:19:29 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 20/24] drm/vblank: pass vblank to __{enable,disable}_vblank()
Date: Mon, 10 Nov 2025 18:17:38 +0200
Message-ID: <96b915f7e4e95aceeea3b579d183fbf043eac817.1762791343.git.jani.nikula@intel.com>
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

Use the vblank pointer instead of a dev, pipe pair to simplify code.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 955cea949d3d..a274b4a7b1c2 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -443,10 +443,12 @@ u64 drm_crtc_accurate_vblank_count(struct drm_crtc *crtc)
 }
 EXPORT_SYMBOL(drm_crtc_accurate_vblank_count);
 
-static void __disable_vblank(struct drm_device *dev, unsigned int pipe)
+static void __disable_vblank(struct drm_vblank_crtc *vblank)
 {
+	struct drm_device *dev = vblank->dev;
+
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
-		struct drm_crtc *crtc = drm_crtc_from_index(dev, pipe);
+		struct drm_crtc *crtc = drm_crtc_from_vblank(vblank);
 
 		if (drm_WARN_ON(dev, !crtc))
 			return;
@@ -491,7 +493,7 @@ void drm_vblank_disable_and_save(struct drm_device *dev, unsigned int pipe)
 	 * between drm_crtc_vblank_on() and drm_crtc_vblank_off().
 	 */
 	drm_update_vblank_count(vblank, false);
-	__disable_vblank(dev, pipe);
+	__disable_vblank(vblank);
 	vblank->enabled = false;
 
 out:
@@ -1153,10 +1155,12 @@ void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
 }
 EXPORT_SYMBOL(drm_crtc_send_vblank_event);
 
-static int __enable_vblank(struct drm_device *dev, unsigned int pipe)
+static int __enable_vblank(struct drm_vblank_crtc *vblank)
 {
+	struct drm_device *dev = vblank->dev;
+
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
-		struct drm_crtc *crtc = drm_crtc_from_index(dev, pipe);
+		struct drm_crtc *crtc = drm_crtc_from_vblank(vblank);
 
 		if (drm_WARN_ON(dev, !crtc))
 			return 0;
@@ -1186,7 +1190,7 @@ static int drm_vblank_enable(struct drm_vblank_crtc *vblank)
 		 * timestamps. Filtercode in drm_handle_vblank() will
 		 * prevent double-accounting of same vblank interval.
 		 */
-		ret = __enable_vblank(dev, pipe);
+		ret = __enable_vblank(vblank);
 		drm_dbg_core(dev, "enabling vblank on crtc %u, ret: %d\n",
 			     pipe, ret);
 		if (ret) {
-- 
2.47.3

