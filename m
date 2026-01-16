Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF092D2C815
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 07:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC5A10E7F7;
	Fri, 16 Jan 2026 06:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NhuGWdV3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C0410E068;
 Fri, 16 Jan 2026 06:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768544696; x=1800080696;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vy9GcFPmrzHtOG77FJH0MmVRR8Lcfdpn/FBODKC8BTg=;
 b=NhuGWdV3p23hU31UI4tNxnDLSs42Ym/JnPowaZQfXPo18VBguN161Pj0
 L1bhhjVAeNvnsWcveLrj8R9irRm681ZgSuGRF+FliBlQT2+ry8ynha4aL
 AQvu6NYpXT1PESzlBK627GzwV1IgnC6UJWLY8PXd8YR2tNJJn01YY5pDa
 cviCCm+H7tGlgUR2oxdraoAHl5raeHtwVCII0MPFnN7XQ/CuRfT8ltWYD
 0XsAbF1zCshb27aYtI9CCilS5FkjXfpjrMFW1XdoEPCeW90YHWjzCtow6
 z/gGE/us1QTw99nQx6LBXq8n3djUmo6RFstjynNSflb9lufPD7AfEhYcl A==;
X-CSE-ConnectionGUID: Q5ekZlb+S9WSppun2zZY6A==
X-CSE-MsgGUID: SOPGV5L7TPWO4buWA0qIIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="72445192"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="72445192"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 22:24:55 -0800
X-CSE-ConnectionGUID: 7fvNjFoJRyWLuvyIj7C22Q==
X-CSE-MsgGUID: +Xgt/FEnQBuELYmf0sxNPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="210028021"
Received: from baandr0id001.iind.intel.com ([10.66.253.151])
 by fmviesa004.fm.intel.com with ESMTP; 15 Jan 2026 22:24:52 -0800
From: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Kaushlendra Kumar <kaushlendra.kumar@intel.com>
Subject: [PATCH] drm/i915/crtc: Guard vblank wait when CRTC lookup fails
Date: Fri, 16 Jan 2026 11:52:03 +0530
Message-Id: <20260116062203.1650454-1-kaushlendra.kumar@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

intel_crtc_for_pipe() may return NULL in teardown/error paths.
Add a NULL check in intel_wait_for_vblank_if_active() to avoid
dereferencing a missing CRTC and rare NULL deref panics.

Fixes: 92e9624ad946 ("drm/i915/crtc: un-inline some crtc functions and move to intel_crtc.[ch]")
Signed-off-by: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 9d2a23c96c61..9eb158737c1c 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -74,7 +74,7 @@ void intel_wait_for_vblank_if_active(struct intel_display *display,
 {
 	struct intel_crtc *crtc = intel_crtc_for_pipe(display, pipe);
 
-	if (crtc->active)
+	if (crtc && crtc->active)
 		intel_crtc_wait_for_next_vblank(crtc);
 }
 
-- 
2.34.1

