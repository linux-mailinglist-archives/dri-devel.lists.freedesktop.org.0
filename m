Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ABEC47DEE
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F98810E452;
	Mon, 10 Nov 2025 16:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VhEBhSJ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316ED10E450;
 Mon, 10 Nov 2025 16:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762791531; x=1794327531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dHxPIdBymikVUS+Seo2HzNy5MOkfNIbZWpse/LZb+Cg=;
 b=VhEBhSJ5fFJAdNud6Pfsl1RPb+DAy9d1gCLLsWIn8gMPIJBF/yJA1vHX
 l0y6bMY9A0bd2J8MzT/LhD/zZAVKDjEDLMHwkFeh5ag2eGaos3eun/w0W
 dAKgm2A+d//qBtbWmKh3YskyKSAfVeiZzuurhZBuGKHbIpcz68Jjq9Cr6
 RiYp5KWRSKzNBBeb3k1D66QAjSoONGnG4QenZtOLsR7+QNTO3fnyURHlc
 fZgyEcKxL6kMo1JD618z9QMTI3OpRblL8eQwhpkSngYTTeb1GpAObTsp3
 KhFoxkeiDKKsaYoWTCM8B8pAns6A3vU3xF8B0ykf1w6nTM9tFT18RDl6e A==;
X-CSE-ConnectionGUID: SyrEDj7ASGeEZJlU8J0X8w==
X-CSE-MsgGUID: s0PhPQrpTuOuPwPTAhrl7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="65000826"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="65000826"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:18:50 -0800
X-CSE-ConnectionGUID: FAu+OwkeSJO9m7atg61PsQ==
X-CSE-MsgGUID: 3KfwLIA1TEqhnu3Etr5wDg==
X-ExtLoop1: 1
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:18:47 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 12/24] drm/vblank: pass vblank to drm_wait_vblank_reply()
Date: Mon, 10 Nov 2025 18:17:30 +0200
Message-ID: <ccb6e73a7d02b475b8ec57b0f6b5f525b110e699.1762791343.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/drm_vblank.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 5880c43e19a0..e33b7fa6f19a 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1702,7 +1702,7 @@ static u64 widen_32_to_64(u32 narrow, u64 near)
 	return near + (s32) (narrow - near);
 }
 
-static void drm_wait_vblank_reply(struct drm_device *dev, unsigned int pipe,
+static void drm_wait_vblank_reply(struct drm_vblank_crtc *vblank,
 				  struct drm_wait_vblank_reply *reply)
 {
 	ktime_t now;
@@ -1713,7 +1713,7 @@ static void drm_wait_vblank_reply(struct drm_device *dev, unsigned int pipe,
 	 * to store the seconds. This is safe as we always use monotonic
 	 * timestamps since linux-4.15.
 	 */
-	reply->sequence = drm_vblank_count_and_time(dev, pipe, &now);
+	reply->sequence = drm_vblank_count_and_time(vblank->dev, vblank->pipe, &now);
 	ts = ktime_to_timespec64(now);
 	reply->tval_sec = (u32)ts.tv_sec;
 	reply->tval_usec = ts.tv_nsec / 1000;
@@ -1785,7 +1785,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 	if (vblank->config.disable_immediate &&
 	    drm_wait_vblank_is_query(vblwait) &&
 	    READ_ONCE(vblank->enabled)) {
-		drm_wait_vblank_reply(dev, pipe, &vblwait->reply);
+		drm_wait_vblank_reply(vblank, &vblwait->reply);
 		return 0;
 	}
 
@@ -1852,7 +1852,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 	}
 
 	if (ret != -EINTR) {
-		drm_wait_vblank_reply(dev, pipe, &vblwait->reply);
+		drm_wait_vblank_reply(vblank, &vblwait->reply);
 
 		drm_dbg_core(dev, "crtc %d returning %u to client\n",
 			     pipe, vblwait->reply.sequence);
-- 
2.47.3

