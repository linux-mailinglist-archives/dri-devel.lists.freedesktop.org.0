Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B137CA764F
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CCD10EAF1;
	Fri,  5 Dec 2025 11:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BGQNNr0k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6733C10EAEF;
 Fri,  5 Dec 2025 11:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764934158; x=1796470158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bpsgF1rmZA1COvYvQdsdwzArRRgGAskwWXnHIS3SxJU=;
 b=BGQNNr0kDBLenzoCT/FqtHLoVci+N9MGXoFgk5wNLbu+tetB3M9DWdyB
 cDG2KU8RGcML1MGJ9bvt4vX3ctIqtnFl5mwEo2DcNxwJthQ5gU/XuS+2M
 AwbNLVCEJVrWuEskvbZ2pfVE+t3WLmTmqQjXWERTj2jHw5djLddzMqayM
 1zepqZqhs/xVCR5/HkppB6c6vKJVtuYoJ6x7dPM/y1WTKTS0uFhbMUSDD
 W5eUfmk4mOKPppUEdM8jUQFTtIJeAf3hOsEbDyXdm1FNXOZIHEnXTlHZI
 yKQpN0eED1A1xU953BFCx/cQGFtNEvirLyq0guKMkA6zv3M+T1giDigeC Q==;
X-CSE-ConnectionGUID: q2hhXmM6T/Ksjef6iY+EuQ==
X-CSE-MsgGUID: EBZvOknCTyaZJdOzC286yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78431622"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="78431622"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:29:18 -0800
X-CSE-ConnectionGUID: 4jOBUBC3R4+7P1Nyw9JCTA==
X-CSE-MsgGUID: R4U3WgLBTLK+VljYZqsH9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="195097578"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:29:16 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 17/25] drm/vblank: pass vblank to drm_vblank_enable()
Date: Fri,  5 Dec 2025 13:27:33 +0200
Message-ID: <d5469001bcb4ddf73a4ffe7c10702c9f4eeb68f5.1764933891.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/drm_vblank.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 81224946df9d..e4c8af7fb5db 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1165,9 +1165,10 @@ static int __enable_vblank(struct drm_device *dev, unsigned int pipe)
 	return -EINVAL;
 }
 
-static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
+static int drm_vblank_enable(struct drm_vblank_crtc *vblank)
 {
-	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
+	struct drm_device *dev = vblank->dev;
+	unsigned int pipe = vblank->pipe;
 	int ret = 0;
 
 	assert_spin_locked(&dev->vbl_lock);
@@ -1207,7 +1208,6 @@ static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
 int drm_vblank_crtc_get(struct drm_vblank_crtc *vblank)
 {
 	struct drm_device *dev = vblank->dev;
-	int pipe = vblank->pipe;
 	unsigned long irqflags;
 	int ret = 0;
 
@@ -1217,7 +1217,7 @@ int drm_vblank_crtc_get(struct drm_vblank_crtc *vblank)
 	spin_lock_irqsave(&dev->vbl_lock, irqflags);
 	/* Going from 0->1 means we have to enable interrupts again */
 	if (atomic_add_return(1, &vblank->refcount) == 1) {
-		ret = drm_vblank_enable(dev, pipe);
+		ret = drm_vblank_enable(vblank);
 	} else {
 		if (!vblank->enabled) {
 			atomic_dec(&vblank->refcount);
@@ -1499,7 +1499,7 @@ void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
 	 * user wishes vblank interrupts to be enabled all the time.
 	 */
 	if (atomic_read(&vblank->refcount) != 0 || !vblank->config.offdelay_ms)
-		drm_WARN_ON(dev, drm_vblank_enable(dev, pipe));
+		drm_WARN_ON(dev, drm_vblank_enable(vblank));
 	spin_unlock_irq(&dev->vbl_lock);
 }
 EXPORT_SYMBOL(drm_crtc_vblank_on_config);
-- 
2.47.3

