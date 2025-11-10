Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D80C4C47D9A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:18:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C27F10E434;
	Mon, 10 Nov 2025 16:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YBpALlDL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A7210E433;
 Mon, 10 Nov 2025 16:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762791479; x=1794327479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p1vzotFt7PhnYkHs4kkKO+IA59rmcTXhb1R3+TIVV14=;
 b=YBpALlDLvXxLWYzteY+jxp8nwFhN4FX3qqEX6oAdjq+Sc2IA16zPx0HV
 qqjBph664YbUOpOg6R9Pcf9r0yhHI914jf9XQYnqYd7fQC03JTmUUxaM0
 F1R9Y7WFFys7XXvA83QcQ2JS/5KOEjN0j5lwSjuSQt5OGjpVK5TFBOaNK
 1uL8SFvf15aTb6x8b35Zuj0BLMPpFxZDaPbfLvt3rvLPAiWZQs2meXssu
 /OocbcFTZOaUlLAY5iWIAh++AEEX0tKAlej6B1riBCE+nFY58K6oVgxof
 ZsSNcEA0hZVx4kBbBgeIdeSC7Sj9hpoF8RFGdNCmW/xhKGogdopjfDJZA w==;
X-CSE-ConnectionGUID: 2Ld8S2dkSbexuutix3AKqQ==
X-CSE-MsgGUID: vCuoeo6fTCm7WQmTBYplZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="82242253"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="82242253"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:17:59 -0800
X-CSE-ConnectionGUID: HQAfvqNDTAeN1BqruSus8g==
X-CSE-MsgGUID: pYQGJrQHQ0S8iuzuSWnTtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="193090997"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:17:57 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 02/24] drm/vblank: remove drm_wait_one_vblank() completely
Date: Mon, 10 Nov 2025 18:17:20 +0200
Message-ID: <ed3d14e4cee8ba06e8e9fe09ba0a513d25153931.1762791343.git.jani.nikula@intel.com>
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

There's really no need for the extra static function at all.

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

