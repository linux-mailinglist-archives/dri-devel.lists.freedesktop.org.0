Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB04ECA75EF
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:28:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311D010EAC7;
	Fri,  5 Dec 2025 11:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m//a4/1c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F89110EAC7;
 Fri,  5 Dec 2025 11:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764934082; x=1796470082;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E6m5xMdtokxQfk/FVLzPIfWQaWb9e8R7HJTb6T1Evd4=;
 b=m//a4/1ctRK9xj7dJZVReXXrnLwxvlM/6EORXLAmKobBsJe1Otnrcnhe
 6+8itG3XKENVFQvwEyP27tkXrzXl+Fsoeb02bbcWsc1f5n/b5sYp7qjQ4
 Ix8SWmdcD6aVftq57HItpqQOmTerxn0ep10RcRGDyowzZOeCwj/0LcmHr
 X0nQYtk6VqxdDFtFErQsIYS9rHUiXcKmlhIlNFOfvxml8VvBHsIi1Mk7B
 V4oKztsnnxM0jeWXF0K9Df6/BKDhsmOJSc4JSW5KxIITysQFq5a2G/suG
 nU96lVjnytOlIVa5bCZJinBvw6MPKYu2qE7BNuZsi462+3krlDNdfa60+ w==;
X-CSE-ConnectionGUID: vIwWQJhmS3KYpZeWvsfrPQ==
X-CSE-MsgGUID: f/4RhMXUQ36fu7aB2w1D9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="65968428"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="65968428"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:28:02 -0800
X-CSE-ConnectionGUID: MEJXh4NhSJCi3uuQ0QZ0Vg==
X-CSE-MsgGUID: YFZiPHfQTtK69E/q29iFJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="232650312"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:28:00 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 02/25] drm/vblank: remove drm_wait_one_vblank() completely
Date: Fri,  5 Dec 2025 13:27:18 +0200
Message-ID: <2a17538a24f1d12c3c82d9cde03363195b64d0cf.1764933891.git.jani.nikula@intel.com>
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

There's really no need for the extra static function at all.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index c15d6d9d0082..1d12836e3d80 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1286,8 +1286,18 @@ void drm_crtc_vblank_put(struct drm_crtc *crtc)
 }
 EXPORT_SYMBOL(drm_crtc_vblank_put);
 
-static void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
+/**
+ * drm_crtc_wait_one_vblank - wait for one vblank
+ * @crtc: DRM crtc
+ *
+ * This waits for one vblank to pass on @crtc, using the irq driver interfaces.
+ * It is a failure to call this when the vblank irq for @crtc is disabled, e.g.
+ * due to lack of driver support or because the crtc is off.
+ */
+void drm_crtc_wait_one_vblank(struct drm_crtc *crtc)
 {
+	struct drm_device *dev = crtc->dev;
+	int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
 	int ret;
 	u64 last;
@@ -1310,19 +1320,6 @@ static void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
 
 	drm_vblank_put(dev, pipe);
 }
-
-/**
- * drm_crtc_wait_one_vblank - wait for one vblank
- * @crtc: DRM crtc
- *
- * This waits for one vblank to pass on @crtc, using the irq driver interfaces.
- * It is a failure to call this when the vblank irq for @crtc is disabled, e.g.
- * due to lack of driver support or because the crtc is off.
- */
-void drm_crtc_wait_one_vblank(struct drm_crtc *crtc)
-{
-	drm_wait_one_vblank(crtc->dev, drm_crtc_index(crtc));
-}
 EXPORT_SYMBOL(drm_crtc_wait_one_vblank);
 
 /**
-- 
2.47.3

