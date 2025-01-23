Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17683A1A6B3
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 16:09:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E60210E845;
	Thu, 23 Jan 2025 15:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JS+bMm3f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABF610E84C;
 Thu, 23 Jan 2025 15:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737644980; x=1769180980;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=67vbD90fuka4O01DybDYSNNgVStAcQW8oDZsMvJvufo=;
 b=JS+bMm3fiOjvSFPnt0jq78B7vHxEUeyDBEAgL9jOoO++M4LL3lKB7gSl
 cKqUDCDWeoP4fU9P2/acdY2KDAW5c4t/9+XxOzBhUse+v0St4GkF+H8B+
 R1OE72QX6E8FtQwiFRca3Qcy9ORv0d6N+PDK7IeJg/O2EpzOwBWG98AEi
 9frrhb7RPBA9OwWPO99rAjgCFnGk0X5ZhVZrv6eJRz3LE8P0jVQYMtc8K
 l9CXJViu0wsamyUGPqhjagh/iOnuAdbK1z09NbqjIbKgqdm8K102n9zMf
 kz0HbzTDJ5lTXMeo3LEUGxfgE9vS4iIjaokq1AhdKfN0jzSR4vp1nE0x6 g==;
X-CSE-ConnectionGUID: UlwMZwKwRk+hC5+i8Zktjw==
X-CSE-MsgGUID: igBJB0nuQT2QJ0tnjRcyMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="49542439"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="49542439"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 07:09:40 -0800
X-CSE-ConnectionGUID: X+TEgBY0RL2vZ2kwTjOZ4Q==
X-CSE-MsgGUID: 8og6vsC/Qoy+in5mTeHhgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108350338"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 07:09:38 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 4/5] drm/print: Include drm_device.h
Date: Thu, 23 Jan 2025 17:09:11 +0200
Message-Id: <11497a3e490c001f3a884acb310b4812b643a9a0.1737644530.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1737644530.git.jani.nikula@intel.com>
References: <cover.1737644530.git.jani.nikula@intel.com>
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

From: Gustavo Sousa <gustavo.sousa@intel.com>

The header drm_print.h uses members of struct drm_device pointers, as
such, it should include drm_device.h to let the compiler know the full
type definition.

Without such include, users of drm_print.h that don't explicitly need
drm_device.h would bump into build errors and be forced to include the
latter.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>

---

Including here as a dependency. May be merged independently.
---
 include/drm/drm_print.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index f77fe1531cf8..9732f514566d 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -32,6 +32,7 @@
 #include <linux/dynamic_debug.h>
 
 #include <drm/drm.h>
+#include <drm/drm_device.h>
 
 struct debugfs_regset32;
 struct drm_device;
-- 
2.39.5

