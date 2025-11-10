Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C28C47E06
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A2310E459;
	Mon, 10 Nov 2025 16:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aYGoMM/D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FBB10E459;
 Mon, 10 Nov 2025 16:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762791545; x=1794327545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FccoZxDFefWTESxPw/qMENnrnff/zkUSChskFr2gMic=;
 b=aYGoMM/DRsB1JQMeQMtIiG8Hyy4x8YV4bicFI1Q+vn49FN0S/hi3KaWO
 SsFk1PQU7I5Tk0pRue4ooWmPxuiFFSed/180r55Dr9BzHdL5mttyh2dTJ
 beJzkOkSOKcVQ9XdRIBZXUxBAzBnHbvIAkf46t4WBAOfuzu+++YdnW8QH
 afvODPyE09twCzypj9GdlJDqS6BUpQlAltynJopVBhhzJHZI6/LN+CslP
 00rwI+i7eBYmSguUmTXUCy4nGxr8cgIRV3NG5Nysu6cMD1sgB5xYu/U5/
 6knFW7t1g5KRawEE0PWYEmUb8QcV4/UjxebqwyOIsWir/94M6UMuSrboW w==;
X-CSE-ConnectionGUID: 2R7omx+STOe4esAlXHcVAg==
X-CSE-MsgGUID: 1ceMp7O6TIKq4kTPbLJE+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="68702311"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="68702311"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:19:05 -0800
X-CSE-ConnectionGUID: e+/5PtrDTdKsfeixcrowLg==
X-CSE-MsgGUID: b0OCgyUxTSuQBGCWvJieLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="188019831"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:19:03 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 15/24] drm/vblank: pass vblank to store_vblank()
Date: Mon, 10 Nov 2025 18:17:33 +0200
Message-ID: <b4d498e58646886de49eb5b0cce04410a3ed22b9.1762791343.git.jani.nikula@intel.com>
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
index 93ad785cbc32..86919b1c0c2c 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -188,11 +188,11 @@ drm_crtc_vblank_crtc(struct drm_crtc *crtc)
 }
 EXPORT_SYMBOL(drm_crtc_vblank_crtc);
 
-static void store_vblank(struct drm_device *dev, unsigned int pipe,
+static void store_vblank(struct drm_vblank_crtc *vblank,
 			 u32 vblank_count_inc,
 			 ktime_t t_vblank, u32 last)
 {
-	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
+	struct drm_device *dev = vblank->dev;
 
 	assert_spin_locked(&dev->vblank_time_lock);
 
@@ -277,7 +277,7 @@ static void drm_reset_vblank_timestamp(struct drm_vblank_crtc *vblank)
 	 * +1 to make sure user will never see the same
 	 * vblank counter value before and after a modeset
 	 */
-	store_vblank(dev, pipe, 1, t_vblank, cur_vblank);
+	store_vblank(vblank, 1, t_vblank, cur_vblank);
 
 	spin_unlock(&dev->vblank_time_lock);
 }
@@ -384,7 +384,7 @@ static void drm_update_vblank_count(struct drm_vblank_crtc *vblank,
 	if (!rc && !in_vblank_irq)
 		t_vblank = 0;
 
-	store_vblank(dev, pipe, diff, t_vblank, cur_vblank);
+	store_vblank(vblank, diff, t_vblank, cur_vblank);
 }
 
 u64 drm_vblank_count(struct drm_vblank_crtc *vblank)
-- 
2.47.3

