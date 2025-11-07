Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03859C3FA23
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 12:05:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C09A10EA98;
	Fri,  7 Nov 2025 11:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mGwg3OsZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3D910EA91;
 Fri,  7 Nov 2025 11:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762513517; x=1794049517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fYoJ0ivOVi1hQgb9pZi86ypsDh5D1xWsEPqgjUDJgpI=;
 b=mGwg3OsZS1IcRYiWtQwDYO+cE6C3AHnliFai5O2aRhIzSDeE0qZeC5qt
 CGhs7Wo9NkbaeIzcTbGeNdZS4VlPhtNpeSlh38SjxEwcWPoljol1wGpus
 9f3CXmBhi6Hh1GNRuGPNq0FSof0xrNV807nBQ94Ns1GuJtbAhIwoo2WX4
 SK86BbBbvVu58fGCbyeAIWMRpqNIN8h575PntcIKz6SSzvYSou5tG+Xdf
 lnrAAerMfDlh70f1OQckG4Akj4E8DTDL06a9Iytop3zt/ubCkT2jpDhs0
 M8vWxuFhBQqYBGE/+gc7P/xmsLAdrCi32766Vhu/ppyz1PvSRGMxHdpvS Q==;
X-CSE-ConnectionGUID: hv/YwkqbSXuCcL2+bmRYdA==
X-CSE-MsgGUID: DMi/Y9T2QP2JPmuxheNZaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="74954810"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="74954810"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:05:17 -0800
X-CSE-ConnectionGUID: MVxLVmEKTbW9NkFYRWTEwQ==
X-CSE-MsgGUID: e06GzBVuSTGIZDs2tORYPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="193046041"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.124])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:05:14 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com
Subject: [PATCH 2/6] drm/atomic: use drm_crtc_vblank_waitqueue()
Date: Fri,  7 Nov 2025 13:04:56 +0200
Message-ID: <1097348197acea9110da8baebbbc189890d01660.1762513240.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1762513240.git.jani.nikula@intel.com>
References: <cover.1762513240.git.jani.nikula@intel.com>
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

We have drm_crtc_vblank_waitqueue() to get the wait_queue_head_t pointer
for a vblank. Use it instead of poking at dev->vblank[] directly.

Due to the macro maze of wait_event_timeout() that uses the address-of
operator on the argument, we have to pass it in with the indirection
operator.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 5a473a274ff0..e641fcf8c568 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1831,10 +1831,12 @@ drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
 	}
 
 	for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
+		wait_queue_head_t *queue = drm_crtc_vblank_waitqueue(crtc);
+
 		if (!(crtc_mask & drm_crtc_mask(crtc)))
 			continue;
 
-		ret = wait_event_timeout(dev->vblank[i].queue,
+		ret = wait_event_timeout(*queue,
 					 state->crtcs[i].last_vblank_count !=
 						drm_crtc_vblank_count(crtc),
 					 msecs_to_jiffies(100));
-- 
2.47.3

