Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AD9C47E07
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0695110E460;
	Mon, 10 Nov 2025 16:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C6xdIPpC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE7110E45E;
 Mon, 10 Nov 2025 16:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762791551; x=1794327551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mgeEVD7//BBV/ltU5eI+pFClpbgryjmEpy0n7Djr35g=;
 b=C6xdIPpCcJ0tOV8Eh6O8KK4mg/LBn6zHJ/2ctTshKwKhInPneAH4AuCG
 q842iihjRx0X4Km75UlP3uFPgWUDCYjbT2QTpbupisRtaJ/5D+OIHvVcP
 +TGux4L6FYQgWcidZXCcjRbz0KCrqJrBYnOUqY5QNIZXf9awvagkWAVvW
 Ta72LizX7xQIHzLvbiatjklmk8PBlysWXohfBSCcYsb7R0BBinvRzMVT7
 coNGzuK9dGWhLgds5bumKqcF0pNWRXkfVGkwHyHdV4jILF5GOm6p/4d1g
 t39jkClnGhDQg9idRim83U+urHM4XAp9o58IwBYg7LZ8v62AsEpuBeSSq A==;
X-CSE-ConnectionGUID: 1AcDo9d3RF6nOp2U4awwnA==
X-CSE-MsgGUID: 64dwao9dSIuqd9p7B8o9rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64545161"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="64545161"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:19:11 -0800
X-CSE-ConnectionGUID: sEvDx+CsQMusZ38YmwX4OA==
X-CSE-MsgGUID: j5GXbv+iRQiqQUtFFbeADA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="188460246"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:19:08 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 16/24] drm/vblank: pass vblank to drm_vblank_enable()
Date: Mon, 10 Nov 2025 18:17:34 +0200
Message-ID: <9c90b009510a979268d5f11754544a53b499bdf2.1762791343.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/drm_vblank.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 86919b1c0c2c..0ff69b06b2bd 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1163,9 +1163,10 @@ static int __enable_vblank(struct drm_device *dev, unsigned int pipe)
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
@@ -1204,7 +1205,6 @@ static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
 int drm_vblank_get(struct drm_vblank_crtc *vblank)
 {
 	struct drm_device *dev = vblank->dev;
-	int pipe = vblank->pipe;
 	unsigned long irqflags;
 	int ret = 0;
 
@@ -1214,7 +1214,7 @@ int drm_vblank_get(struct drm_vblank_crtc *vblank)
 	spin_lock_irqsave(&dev->vbl_lock, irqflags);
 	/* Going from 0->1 means we have to enable interrupts again */
 	if (atomic_add_return(1, &vblank->refcount) == 1) {
-		ret = drm_vblank_enable(dev, pipe);
+		ret = drm_vblank_enable(vblank);
 	} else {
 		if (!vblank->enabled) {
 			atomic_dec(&vblank->refcount);
@@ -1496,7 +1496,7 @@ void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
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

