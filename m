Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDBEC19CC4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 11:40:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DE910E79D;
	Wed, 29 Oct 2025 10:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cEEzDIXE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CECB10E797;
 Wed, 29 Oct 2025 10:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761734423; x=1793270423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EPPeponlyekpCQGmbPotKL1qRfB73f7qnvY2x+Ep9WU=;
 b=cEEzDIXE0OCPUDbCY2J6H0NZrCw/Cn0VOO8U+K+QF3pZyrqM6is7OZMO
 OP+FLFFziLboHZDQt/9cx+ijM5X9vKjxRZ+oXwLhdRQrq1IuYHwNyMiiG
 jUz7jQh2zvBxfEVNIbidd0GEKo9S349SMEmklIb3XFt0GzQ+63ZkPu5Sc
 G56bIeSknb5Q7akoqQ/jndJ/km5DH7XbYMY/ocITDf2G54LyO4P0Uzyyy
 dVlUP2oZTkuCgW+eAxw8/Cx5VaEUDLBt8+tmbwFMGIG72Oj+ilmvOjIUz
 ftcR5CD2Q7RjriJ3AMnwcQfZGx9CGbxIhzV3urmBIAtMFLtdFphZD5C5E w==;
X-CSE-ConnectionGUID: JFdL7tUPRJGmxN3K2kN8cQ==
X-CSE-MsgGUID: ihthr9MCTjyxI5eX+2CHGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67688576"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67688576"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 03:40:23 -0700
X-CSE-ConnectionGUID: oG8vYNNDS0SerxifAzmYVA==
X-CSE-MsgGUID: BXEgwvzjRo6Yh22UcIfe8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="185700041"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 03:40:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 simona.vetter@ffwll.ch
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: [PATCH v3 4/4] drm/ttm: replace drm_print.h include with a forward
 declaration
Date: Wed, 29 Oct 2025 12:39:48 +0200
Message-ID: <cfdb1095033112c2a7e58767481c98929984a33c.1761734313.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1761734313.git.jani.nikula@intel.com>
References: <cover.1761734313.git.jani.nikula@intel.com>
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

The ttm/ttm_resource.h header does not really need anything from
drm_print.h. A simple forward declaration for struct drm_printer is
sufficient.

An explicit drm_print.h include has previously been added to all the
files that indirectly depended on this include.

v3: Only remove the include here (Thomas)

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/ttm/ttm_resource.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index f49daa504c36..68bf010d8b40 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -31,14 +31,15 @@
 #include <linux/iosys-map.h>
 #include <linux/dma-fence.h>
 
-#include <drm/drm_print.h>
 #include <drm/ttm/ttm_caching.h>
 #include <drm/ttm/ttm_kmap_iter.h>
 
 #define TTM_MAX_BO_PRIORITY	4U
 #define TTM_NUM_MEM_TYPES 9
 
+struct dentry;
 struct dmem_cgroup_device;
+struct drm_printer;
 struct ttm_device;
 struct ttm_resource_manager;
 struct ttm_resource;
-- 
2.47.3

