Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D72E9C47DE8
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:18:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E805D10E454;
	Mon, 10 Nov 2025 16:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hr2wCDST";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A056210E453;
 Mon, 10 Nov 2025 16:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762791524; x=1794327524;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h4TVx05AYYob31DdLy89UVEkWz5L/bX9aXJhdaKYDRQ=;
 b=Hr2wCDSTRql6EEmrPdVoJ5dunrAng0iVFUSDE2Mrab+OBl9d1zSE8+t/
 As21BrZZctogHTtRoGsT7hvlFLJUCRtizBAH/n7zjIbhE5spvjE1WGsm9
 tgTjzS6+BzhMSW562UpJFRaNcf0fO7mlDoTTquPX6gFchQEyz3C5uRDiD
 qy58LV0/3P0s5qaEBHgn8trb3yhNIgK2yeR6jweARQ/ii9uEW/AINBSlV
 mEbyScwY9tg/x8o11YZkaiHGOWHbq6lkN79ZBT+VwzJqgyrHs4FoWLGzP
 mhSm1TzfcZt5LJDyS6UJa/KdYGy7Z100DoUcfg6iCiAQbHPPbrY/ngoeZ w==;
X-CSE-ConnectionGUID: 7L/FQsOnTC+/67OjBquQtA==
X-CSE-MsgGUID: QeqLFWqASU6rqz+UXf9tCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="82471524"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="82471524"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:18:44 -0800
X-CSE-ConnectionGUID: tEr+BRwjTbCl3ZhIt0l1mA==
X-CSE-MsgGUID: k2hE+rc2QgCMfJXZiyVLgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="192969120"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:18:42 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 11/24] drm/vblank: pass vblank to drm_queue_vblank_event()
Date: Mon, 10 Nov 2025 18:17:29 +0200
Message-ID: <cc973461b71f070481bd0ffbd5cb1bf86433709a.1762791343.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/drm_vblank.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 1c0ade41a57f..5880c43e19a0 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1596,12 +1596,13 @@ void drm_crtc_vblank_restore(struct drm_crtc *crtc)
 }
 EXPORT_SYMBOL(drm_crtc_vblank_restore);
 
-static int drm_queue_vblank_event(struct drm_device *dev, unsigned int pipe,
+static int drm_queue_vblank_event(struct drm_vblank_crtc *vblank,
 				  u64 req_seq,
 				  union drm_wait_vblank *vblwait,
 				  struct drm_file *file_priv)
 {
-	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
+	struct drm_device *dev = vblank->dev;
+	unsigned int pipe = vblank->pipe;
 	struct drm_pending_vblank_event *e;
 	ktime_t now;
 	u64 seq;
@@ -1822,7 +1823,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 		/* must hold on to the vblank ref until the event fires
 		 * drm_vblank_put will be called asynchronously
 		 */
-		return drm_queue_vblank_event(dev, pipe, req_seq, vblwait, file_priv);
+		return drm_queue_vblank_event(vblank, req_seq, vblwait, file_priv);
 	}
 
 	if (req_seq != seq) {
-- 
2.47.3

