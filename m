Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81255629597
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 11:18:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC50610E0DC;
	Tue, 15 Nov 2022 10:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74EC110E0DC;
 Tue, 15 Nov 2022 10:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668507466; x=1700043466;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fQb/OaXN26SXEoDRrT7JdX2VluGU9V4GlRUHdO5g6Bo=;
 b=icyJljLRZsTt5hifgc+2g4pMnH5UKX+jTeyEOL3D5eJg+nnSfjJ4CDkG
 mwdlKPSvfYfn6AaLbxQR7k99427jYXeKicghAwKFlKQ0iqlHnMCS1Yj0d
 lLnybzIw9PKxkRY0yg3bsF3sSoRiuFMTtm1GmWB49Ld7uRDSgHsig1fJP
 wXMoEF3FOqUHlhwUaelxXTuMi+AAC/r0dPUMILxhHNJwgAQVXn2bHhZjS
 BqAUDzFugklQrzWF2g8osgoi/Qh/L5w2fVVX/7U6Y/D3PInX5w1/Ka5Nj
 7/DIqRLszbmkfa5ukiF3gPqN9i3u9wfAPXMPyQGA/89+SpAkXx3G0QLrx w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="291928489"
X-IronPort-AV: E=Sophos;i="5.96,165,1665471600"; d="scan'208";a="291928489"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 02:17:45 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="616702585"
X-IronPort-AV: E=Sophos;i="5.96,165,1665471600"; d="scan'208";a="616702585"
Received: from rainikit-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.198.207])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 02:17:44 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Fix vma allocator debug
Date: Tue, 15 Nov 2022 10:17:30 +0000
Message-Id: <20221115101730.394880-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Add a missing colon which I accidentally removed in the recent logging
changes.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Fixes: a10234fda466 ("drm/i915: Partial abandonment of legacy DRM logging macros")
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 3b969d679c1e..947fde68e5f5 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -73,7 +73,7 @@ static void vma_print_allocator(struct i915_vma *vma, const char *reason)
 	char buf[512];
 
 	if (!vma->node.stack) {
-		drm_dbg(&to_i915(vma->obj->base.dev)->drm
+		drm_dbg(&to_i915(vma->obj->base.dev)->drm,
 			"vma.node [%08llx + %08llx] %s: unknown owner\n",
 			vma->node.start, vma->node.size, reason);
 		return;
-- 
2.34.1

