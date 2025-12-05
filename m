Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BA8CA767C
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:29:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2443810EAFD;
	Fri,  5 Dec 2025 11:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TD9HuN5b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A562010EADF;
 Fri,  5 Dec 2025 11:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764934181; x=1796470181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kTkv/RSKItP6LV4wdpmHj8MebigVuNjTeWgfcCyH2xA=;
 b=TD9HuN5bH4UPtfP92QkkRvb11CBWgLBnOa8nIo8fn+Bwt29/MI51xnjX
 lWUiE4gS5wnWO2A8knlvV/923+OR57QnCtIMMX21t/gV6Gf7vw271d8AG
 m0pcgIzMW0rs9DRHQ7gbRlli++HFBxf/hOAmAEls28O8sGzVqGnLEwuU1
 u3+1hHSmGmwN+csJNv3Z3T8dxdqFScZ32nYrqKzaXpE69fDEKS7aeZIs6
 hxIBs2SXu1kfjKcN6/z5bYQXIXLAAsD29vsfzOG2OQod7QxM2LdGD0tS7
 E0WCE4CeApaLLua+MJnLnECUcB393dqQqP5lPZT5TgrvYznU4YKaeh9m5 g==;
X-CSE-ConnectionGUID: pMDjCvkzTUegExV8JNP7EQ==
X-CSE-MsgGUID: rmU43DZ1R7e9mcdakyX5ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66902987"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="66902987"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:29:41 -0800
X-CSE-ConnectionGUID: NBhhMBo2ReKhsHKImpWL0w==
X-CSE-MsgGUID: rlAnL/ygQ7mFfEvlscxvqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="199757660"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:29:38 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 21/25] drm/vblank: pass vblank to __{enable,
 disable}_vblank()
Date: Fri,  5 Dec 2025 13:27:37 +0200
Message-ID: <6984b7dd2fdfe308c3b51fc6bbcd0bbdc540a7a4.1764933891.git.jani.nikula@intel.com>
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

Use the vblank pointer instead of a dev, pipe pair to simplify code.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 04c75cdbb916..52fa4ca361e3 100644
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
 	drm_vblank_crtc_update_count(vblank, false);
-	__disable_vblank(dev, pipe);
+	__disable_vblank(vblank);
 	vblank->enabled = false;
 
 out:
@@ -1155,10 +1157,12 @@ void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
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
@@ -1188,7 +1192,7 @@ static int drm_vblank_enable(struct drm_vblank_crtc *vblank)
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

