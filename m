Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F189CB0434
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:24:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81CFC10E612;
	Tue,  9 Dec 2025 14:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lIkmgLBZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA2710E61B;
 Tue,  9 Dec 2025 14:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765290243; x=1796826243;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/ID4vRny/vKU2A0rxemD72OUI4rMIef8GB8tp7a5oE0=;
 b=lIkmgLBZZH4SU21LYVU5feLK4TxT6UQuYYOKfpTexCF27tDyFb9s44u+
 lDuJP0WtEPpGVRV3kP+t7UtS1srEewrosdLHzFRmto/LpbqPzG+CEqjN5
 30lKQXgfqXcgwGaJBp+VTngpRjgCd9KyjZteUPoRHAaMUNCJhBb+KtT4v
 e8tXn1EBQG1G644VmGp+RfAqKM0NV0HGYYWZA2kTfEN55jwOMrInYqk7N
 KKd0hrqvVxp5psP6fTMKndpUj5R2Xiui+YdKuvxdoX5VG1z/GaMdTAIqY
 oBjcIrSV682UtfexbSeqIZ27/VjtgQY2OGAVfKyuyilEMClFb+DDvhUTA A==;
X-CSE-ConnectionGUID: KO3KLzk1TwSCTx+U+xBFMQ==
X-CSE-MsgGUID: NJqXuvUsSpeEtmdp8AdlUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="84656963"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="84656963"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 06:24:03 -0800
X-CSE-ConnectionGUID: Acaf7oPfRcCuXW3HkujCeQ==
X-CSE-MsgGUID: 2aPPXhFnTuywvlb35PT9mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="227270711"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.154])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 06:24:00 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH 7/7] drm/vblank: prefer drm_crtc_vblank_crtc() over
 drm_vblank_crtc()
Date: Tue,  9 Dec 2025 16:23:15 +0200
Message-ID: <29a29e746bc90c824d4f2bd15e42817dd7d0b199.1765290097.git.jani.nikula@intel.com>
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

Use the higher level function where crtc is available.

v2: Rebase

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index a86561c4b999..498fc91450e6 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -731,7 +731,7 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
 	}
 
 	if (drm_drv_uses_atomic_modeset(dev)) {
-		struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
+		struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 
 		mode = &vblank->hwmode;
 	} else {
@@ -1304,7 +1304,7 @@ int drm_crtc_wait_one_vblank(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
 	int pipe = drm_crtc_index(crtc);
-	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 	int ret;
 	u64 last;
 
-- 
2.47.3

