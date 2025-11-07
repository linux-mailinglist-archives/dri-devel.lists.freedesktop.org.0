Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6882C3FA1A
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 12:05:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FDBB10EA83;
	Fri,  7 Nov 2025 11:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ExCsUOWF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282BA10EA7F;
 Fri,  7 Nov 2025 11:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762513512; x=1794049512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rJnAZdbjJSXaij064i/siKMIJ08P/1Eo+KGfn8ka+fE=;
 b=ExCsUOWFOtAwUa6UwEwZSZMM2QMGFkLNMFnQRrnB7xjjVhngfkyajSIu
 e2ln78Az0c3LUHIncL4CkbBhsKppis0cpHBWDN7ziwYG9FU+3CPph+nGf
 gobVZvR6ScSC4bD+/+cOadtuDpSmRGW7L2gjZIjRNCXYDvUekseJAjQJx
 RpaFteueRsAC3hsU/lSqj2TiXBRHbuEI6/qZm7oQ5f7RNffd5zBDhuIx+
 /CN389yD0jK5XemqLdvPYJzMNgEeHLZHtH0joaG+uMq9cw4JzJWcBH2FO
 kpuWIFYOAqLG3vdS5dQw3XXG/1GTz/0KQEP0Z/Dk9JfFcJoUBkHu5JLLL A==;
X-CSE-ConnectionGUID: PpHTLp/gSwyCRMd6fx7OVw==
X-CSE-MsgGUID: sRfd1FNMSPGbSDlCU91NaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64587884"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64587884"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:05:12 -0800
X-CSE-ConnectionGUID: N9SkXUzHSwuW1yHI9oIk2A==
X-CSE-MsgGUID: g25fsFbaSLSb+oABszADJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="192274382"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.124])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:05:09 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com
Subject: [PATCH 1/6] drm/vblank: use drm_crtc_vblank_crtc() in workers
Date: Fri,  7 Nov 2025 13:04:55 +0200
Message-ID: <f046701a10340c1dcaecb1b52e41dcf2236fded1.1762513240.git.jani.nikula@intel.com>
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

We have drm_crtc_vblank_crtc() to get the struct drm_vblank_crtc pointer
for a crtc. Use it instead of poking at dev->vblank[] directly.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank_work.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_vblank_work.c b/drivers/gpu/drm/drm_vblank_work.c
index e4e1873f0e1e..70f0199251ea 100644
--- a/drivers/gpu/drm/drm_vblank_work.c
+++ b/drivers/gpu/drm/drm_vblank_work.c
@@ -244,7 +244,7 @@ EXPORT_SYMBOL(drm_vblank_work_flush);
 void drm_vblank_work_flush_all(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
-	struct drm_vblank_crtc *vblank = &dev->vblank[drm_crtc_index(crtc)];
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 
 	spin_lock_irq(&dev->event_lock);
 	wait_event_lock_irq(vblank->work_wait_queue,
-- 
2.47.3

