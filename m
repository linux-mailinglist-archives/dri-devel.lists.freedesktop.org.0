Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1D3C47E00
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:19:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A415E10E45D;
	Mon, 10 Nov 2025 16:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FK0I+PLQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7585710E459;
 Mon, 10 Nov 2025 16:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762791541; x=1794327541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6ziNskecPTdDjQwHLfm5byZpy7NVFOJO2xP81h4dGOg=;
 b=FK0I+PLQYlHjGsPq2b+qKBZ/jT8aAjPLtl/hYGkWlouX4BDh2ZDSmsbA
 SbheYTWXTdVXciR584wxwGs0K6+vo3ofgUFtm1PBNKCuJujh9JH/1zIY/
 ofi1t1TdUs7vlsO6wBegkCfTIeUgt6dp1i74FhU/8sOqU8UX+67/gulg6
 3E16hM5mCFirmJUFNsLsX3xR54Ht6vQ6rch//nonknP0e9xHqhuuAGbhn
 xmj3NqTx+zyiqeEvNgVO12h//0eUXQwmLWtHs6H/p8eZ/p4Gil2oELrG8
 QYmAgexKumdYyWk5rNrWMP+kfm4l3pkahYM2UKZ0Mrm75uStVJsVNv7jy w==;
X-CSE-ConnectionGUID: sjLy3cuzTMycI4gUkyix0w==
X-CSE-MsgGUID: arAAW+9PRD6SNnHLNFhroQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64545122"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="64545122"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:19:00 -0800
X-CSE-ConnectionGUID: 4AlnUANaSaeYQF9RVg9tUg==
X-CSE-MsgGUID: WPvlRshUTEugIjD77UyuLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="219432345"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:18:57 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 14/24] drm/vblank: pass vblank to drm_reset_vblank_timestamp()
Date: Mon, 10 Nov 2025 18:17:32 +0200
Message-ID: <9e634ac72028f9776bdd2e3f14a9b11d58e01541.1762791343.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/drm_vblank.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 0a2e372dd549..93ad785cbc32 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -245,8 +245,10 @@ static u32 __get_vblank_counter(struct drm_device *dev, unsigned int pipe)
  * Note: caller must hold &drm_device.vbl_lock since this reads & writes
  * device vblank fields.
  */
-static void drm_reset_vblank_timestamp(struct drm_device *dev, unsigned int pipe)
+static void drm_reset_vblank_timestamp(struct drm_vblank_crtc *vblank)
 {
+	struct drm_device *dev = vblank->dev;
+	unsigned int pipe = vblank->pipe;
 	u32 cur_vblank;
 	bool rc;
 	ktime_t t_vblank;
@@ -1487,7 +1489,7 @@ void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
 		vblank->inmodeset = 0;
 	}
 
-	drm_reset_vblank_timestamp(dev, pipe);
+	drm_reset_vblank_timestamp(vblank);
 
 	/*
 	 * re-enable interrupts if there are users left, or the
-- 
2.47.3

