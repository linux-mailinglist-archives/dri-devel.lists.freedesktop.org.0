Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA50AC359A7
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 13:22:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24DEC10E72C;
	Wed,  5 Nov 2025 12:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S78FcQcY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EFC710E721;
 Wed,  5 Nov 2025 12:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762345360; x=1793881360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4JffU4knAzHoLiOAmnl9TZ6eQw0qTJI25eJlRv/75O4=;
 b=S78FcQcYdEBwykvwwBqayj85UbInSEmw1GERk4Gz+jmwiIoVZlr36Mjq
 RWiZiDFYGdnk6xb6D8VSH8V/tQHiyuDbYBJS0reYZP0IC0U+7KzuDWfqg
 52EnJJQWQdJjAkgosX6Jipm8MOrRH0o8WCVtJGykV3bFR3LA6WnVP2KHJ
 Dz1sylyYIQMdIelbp0oza/tyCxe3QeBJJsXs2G5PXq4NofYOMFfUeqOTD
 xTvZtjUivQc9L0QAUGYQ1q9hs9z0QPuC0HylCPEcODsiRzv/nebtPB0xd
 RJ7ZFBrIcTtVoPcL/cGCtAVSEYhkjPtkF/UZgNkxZT7OwlVirueaEfPWY w==;
X-CSE-ConnectionGUID: 0CKV0AMfSOiGvOC21xsffA==
X-CSE-MsgGUID: mIX9F7qaTOyhBLTsX5u+rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68317513"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="68317513"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:22:40 -0800
X-CSE-ConnectionGUID: 04oYlXoOTaSCS9qqgglRig==
X-CSE-MsgGUID: LLgXuJU7Squ4CE0R/bsKnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187740207"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa008.fm.intel.com with ESMTP; 05 Nov 2025 04:22:36 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 jani.nikula@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v6 04/16] drm/i915/color: Add helper to create intel colorop
Date: Wed,  5 Nov 2025 18:04:00 +0530
Message-ID: <20251105123413.2671075-5-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251105123413.2671075-1-uma.shankar@intel.com>
References: <20251105123413.2671075-1-uma.shankar@intel.com>
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

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Add intel colorop create helper

v2:
 - Make function names consistent (Jani)
 - Remove redundant code related to colorop state
 - Refactor code to separate files

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_colorop.c | 25 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_colorop.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_colorop.c b/drivers/gpu/drm/i915/display/intel_colorop.c
index eaab50d2d126..f2fc0d8780ce 100644
--- a/drivers/gpu/drm/i915/display/intel_colorop.c
+++ b/drivers/gpu/drm/i915/display/intel_colorop.c
@@ -8,3 +8,28 @@ struct intel_colorop *to_intel_colorop(struct drm_colorop *colorop)
 {
 	return container_of(colorop, struct intel_colorop, base);
 }
+
+struct intel_colorop *intel_colorop_alloc(void)
+{
+	struct intel_colorop *colorop;
+
+	colorop = kzalloc(sizeof(*colorop), GFP_KERNEL);
+	if (!colorop)
+		return ERR_PTR(-ENOMEM);
+
+	return colorop;
+}
+
+struct intel_colorop *intel_colorop_create(enum intel_color_block id)
+{
+	struct intel_colorop *colorop;
+
+	colorop = intel_colorop_alloc();
+
+	if (IS_ERR(colorop))
+		return colorop;
+
+	colorop->id = id;
+
+	return colorop;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_colorop.h b/drivers/gpu/drm/i915/display/intel_colorop.h
index 23a29a565949..21d58eb9f3d0 100644
--- a/drivers/gpu/drm/i915/display/intel_colorop.h
+++ b/drivers/gpu/drm/i915/display/intel_colorop.h
@@ -9,5 +9,7 @@
 #include "intel_display_types.h"
 
 struct intel_colorop *to_intel_colorop(struct drm_colorop *colorop);
+struct intel_colorop *intel_colorop_alloc(void);
+struct intel_colorop *intel_colorop_create(enum intel_color_block id);
 
 #endif /* __INTEL_COLOROP_H__ */
-- 
2.50.1

