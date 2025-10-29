Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E04C19CBE
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 11:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A226210E798;
	Wed, 29 Oct 2025 10:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UmAA82dI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B25310E796;
 Wed, 29 Oct 2025 10:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761734417; x=1793270417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nYdA84dvFVgCNLmh9NPn0plcX/WcX4EsbSl9bJcatE8=;
 b=UmAA82dINSn7lqb5QbMV3qyPeLoroZUaqfFMdT1lWTkvTlcrVI5eX7Zc
 jE40XGvutmCopRo9ckFCCP7YSBDDuQgS9fk1UYexCDUbiyILwWXh3tFir
 b8QIyCPYHHbasna+rczXTo9z3ITlybPaJerJWOZeXsERqxnbjHPXA3iW5
 1k2WC4wRhJRcbBByAhAkeMVbCmPHJbRZx90kTccGCuv8E4mJ1DunR59wb
 71EBJR0QW+7sTiet4UrYpmT07agCTaI36JhVeEkVQj4d3IhiuxONB1acl
 JDdg8tvC2/pFcT9tnejgsREqtJQggLFt3DUWZE47wqNWtsGeyQ/uRZ7hu w==;
X-CSE-ConnectionGUID: GYTQPT92SwOOalPiC8VFXg==
X-CSE-MsgGUID: HQ6bx0bERUKDBy4H3XvbdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="67494243"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="67494243"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 03:40:17 -0700
X-CSE-ConnectionGUID: wLHIfwkVTHKT+5o0RdK3kg==
X-CSE-MsgGUID: L/YsjrVaQbOuGbHfJgWumw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="185253147"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.160])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 03:40:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 simona.vetter@ffwll.ch
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: [PATCH v3 3/4] drm/mm: replace drm_print.h include with a forward
 declaration
Date: Wed, 29 Oct 2025 12:39:47 +0200
Message-ID: <7d570ed1f0f0f14cac346bea50bce9ef02ddd166.1761734313.git.jani.nikula@intel.com>
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

The drm_mm.h header does not really need anything from drm_print.h. A
simple forward declaration for struct drm_printer is sufficient.

An explicit drm_print.h include has previously been added to all the
files that indirectly depended on this include.

v3: Only remove	the include here (Thomas)

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_mm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
index f654874c4ce6..16ce0e8f36a6 100644
--- a/include/drm/drm_mm.h
+++ b/include/drm/drm_mm.h
@@ -48,7 +48,7 @@
 #endif
 #include <linux/types.h>
 
-#include <drm/drm_print.h>
+struct drm_printer;
 
 #ifdef CONFIG_DRM_DEBUG_MM
 #define DRM_MM_BUG_ON(expr) BUG_ON(expr)
-- 
2.47.3

