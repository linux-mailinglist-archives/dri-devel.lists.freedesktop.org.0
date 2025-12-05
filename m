Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A880BCA760D
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C1910EAD9;
	Fri,  5 Dec 2025 11:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l81W1Rkp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8347D10EAD9;
 Fri,  5 Dec 2025 11:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764934108; x=1796470108;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/ID4vRny/vKU2A0rxemD72OUI4rMIef8GB8tp7a5oE0=;
 b=l81W1Rkp2aRN4oQUMFz3PtC48hfQVjERKXeclyNwP1brXY9lWYXIMVsP
 y/uJk+uQQIoOoNDuoO/DrpkvdHfBtfCvDrvmKGBlaAo8jGy8cO575FC3V
 i14PT7U3Nh9JZ4eAgH5dRslOpa5k8H94kvlQ4/srTsQGMovRcYNMu0mE9
 dKqWMoUNmhCHJA85cKBKSoWIsXcN3qfq7dIBBs2lZ7Wx18fyFktIExSBX
 5xrlbESlvJcFaJnwueexqXXyGQxTzS5Ug8CMsdDINJzro/LeDEK2wivc4
 GdsmdGI2u/BKHRQSHLMD1fGMVX00tlGEBrO+3Xp5JG7hUWNUHsGQ+R5vU g==;
X-CSE-ConnectionGUID: BDuKC/xDSjyXVYKITbv4Rg==
X-CSE-MsgGUID: eBG4xbgSTwC0m69U30Ny3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66861913"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="66861913"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:28:27 -0800
X-CSE-ConnectionGUID: Kqia1brXQreNNPkkhzhG7A==
X-CSE-MsgGUID: t9+pl0uaRTaaoJL2GF6YmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="195188113"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:28:25 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 07/25] drm/vblank: prefer drm_crtc_vblank_crtc() over
 drm_vblank_crtc()
Date: Fri,  5 Dec 2025 13:27:23 +0200
Message-ID: <adaf24b598ccb9f5e848f9fb1f9d4d9a377810bd.1764933891.git.jani.nikula@intel.com>
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

