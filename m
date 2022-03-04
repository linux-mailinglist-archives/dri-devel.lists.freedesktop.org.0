Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DB74CDA4F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 18:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4728B112B07;
	Fri,  4 Mar 2022 17:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A9210FED3;
 Fri,  4 Mar 2022 17:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646414666; x=1677950666;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=snHbOntyYfQr9K82seOaBfBl8X9a55eeg1V89w+NDqo=;
 b=ETyQmzsF8DrK7aThU7fBmrRUXR49fewLGf3c4f3cODt7tYZuUZTZ3ADG
 uKNkf0vg+cu1PBvziDLT9gSOBW/g+4kfVgC0ghah1aYkQemdTk6Qs8+G3
 VjUjQgVt4x514K+GFadkB4Ckgn0BsDuOkdog8oZnIvnW1JcF6SVZS9Tgi
 j2vsKWTDLmMRgiOnzVFcHc9tkVGZiW1lELZukCjNc7t2eijABwUy4wmsa
 xzanRim9RrIc+XInFpnIdFcXX5V3Xnq3ZtHuCc0lzlFXEC+ikjr9yTMjn
 cNL8i0YA8SpRrbD0/uf/K6w3HP0qeIXvA1bziMIDgpwtU3NBm/9j2TrIT w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="252848997"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="252848997"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 09:24:26 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="631216639"
Received: from vkats-mobl1.ccr.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.8])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 09:24:24 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 8/8] drm/i915: fixup the initial fb on DG2
Date: Fri,  4 Mar 2022 17:23:33 +0000
Message-Id: <20220304172333.991778-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304172333.991778-1-matthew.auld@intel.com>
References: <20220304172333.991778-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On DG2+ the initial fb shouldn't be placed anywhere close to DSM, and so
should just be allocated directly from LMEM.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_plane_initial.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index b39d3a8dfe45..5a3baeb620a6 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -68,8 +68,12 @@ initial_plane_vma(struct drm_i915_private *i915,
 		 * On future discrete HW, like DG2, we should be able to just
 		 * allocate directly from LMEM, due to larger LMEM size.
 		 */
-		if (base >= i915->dsm.start)
+		if (base >= i915->dsm.start) {
 			base -= i915->dsm.start;
+		} else {
+			WARN_ON_ONCE(IS_DG1(i915));
+			mem = i915->mm.regions[INTEL_REGION_LMEM];
+		}
 	}
 
 	size = roundup(base + plane_config->size, mem->min_page_size);
@@ -82,11 +86,11 @@ initial_plane_vma(struct drm_i915_private *i915,
 	 * features.
 	 */
 	if (IS_ENABLED(CONFIG_FRAMEBUFFER_CONSOLE) &&
+	    mem == i915->mm.stolen_region &&
 	    size * 2 > i915->stolen_usable_size)
 		return NULL;
 
-	obj = i915_gem_object_create_region_at(i915->mm.stolen_region,
-					       base, size, 0);
+	obj = i915_gem_object_create_region_at(mem, base, size, 0);
 	if (IS_ERR(obj))
 		return NULL;
 
-- 
2.34.1

