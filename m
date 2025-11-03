Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F04EC2AB5F
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 10:22:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B67F10E0DB;
	Mon,  3 Nov 2025 09:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hiClyrtG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C96110E0DB
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 09:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762161770; x=1793697770;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZfD85JnCcKIET4+CszZR9EDnOKKB6p02G0xFk7wFUz4=;
 b=hiClyrtGE8juWEyppHMcMneuUVNX8b+FRRjGsHxxsv47aev2RF9MoHuk
 iJ+HbdqAdLnlt0DLtVpO1oGCVHdRfDt6/gimOHIekM2Hdjpkyph38IMkP
 Q5Y3HCKHuF22I293J9emo37VWpeh8vRDri1tGRNPQp1vd/pA2C0/3+0/m
 8gaYwfY1DWhkdMSatBRwYFojyIjolnobNYe9QBnhUTwobS0J1mdKrESAX
 E1iZEDqR9uriBQY78XDZPfkqCo8KN4z2HsK/EO8qG0XD5NNPiSP2lu7c7
 AUeqik0Kb3biI9tp1pt8XndQSeX/2aJdm2L/IqN17yPUBqV2xmwWSvroo A==;
X-CSE-ConnectionGUID: wNGYylg6Sl+AW9i5pzGROA==
X-CSE-MsgGUID: gVDPLOXvQ66DQsclAN739w==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="64265165"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="64265165"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 01:22:50 -0800
X-CSE-ConnectionGUID: v2W4xMFoQua+pwsdftd4jw==
X-CSE-MsgGUID: 7roWW8m5Sr6X+f218pkLjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="191980476"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.127])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 01:22:48 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: jani.nikula@intel.com
Subject: [PATCH 1/2] drm/renesas: include drm_print.h where needed
Date: Mon,  3 Nov 2025 11:22:38 +0200
Message-ID: <04f617d5fe37f92d750efbb73065df3997f5c6b5.1762161597.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1762161597.git.jani.nikula@intel.com>
References: <cover.1762161597.git.jani.nikula@intel.com>
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

rzg2l_du_drv.c depends on drm_print.h being indirectly included via
drm_buddy.h, drm_mm.h, or ttm/ttm_resource.h. Include drm_print.h
explicitly.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/r/20251103112418.031b3f8c@canb.auug.org.au
Fixes: f6e8dc9edf96 ("drm: include drm_print.h where needed")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index e1aa6a719529..0fef33a5a089 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -17,6 +17,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "rzg2l_du_drv.h"
-- 
2.47.3

