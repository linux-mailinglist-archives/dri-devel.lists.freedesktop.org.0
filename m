Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D74A74CDA4B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 18:24:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DAB41129CE;
	Fri,  4 Mar 2022 17:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A733F112A32;
 Fri,  4 Mar 2022 17:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646414664; x=1677950664;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LKGc1TT9GPmDXb9i3/Z6KC6MlQAG3xUDW2WIV92/s50=;
 b=mDgOH3SWSQRCMTgpPJNkHvGTVp3DnTUKliqg3+xIYM3+KUe3Abkql22i
 fn1MwzeYmLbqAH8+DbL9dwNkRWowm6RFdZ40UFZpiTEDYRIB/BCURCZBc
 GaItbomHrnkIqbHObyMQYhjw2rxMvZa5Fh0DJMrIjy69iB+vEkvVsJ722
 cncY4D7onG6M2eExsqgyhjpDOuvns6qeg3s+QulY0bQoANA1lXyRVpi2d
 RzNBZsxV61U9vc2eYcv8ruNajPqUtmzOxO9EHSy5d7eXWpwKTc/cC5mN0
 C4iKyUUzSdwPnteCLaTD2FtmSaFvU7XA41hktvE7fQbZr/iNehA7zA35w g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="252848990"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="252848990"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 09:24:24 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="631216631"
Received: from vkats-mobl1.ccr.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.8])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 09:24:23 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 7/8] drm/i915: fixup the initial fb base on DG1
Date: Fri,  4 Mar 2022 17:23:32 +0000
Message-Id: <20220304172333.991778-8-matthew.auld@intel.com>
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

The offset we get looks to be the exact start of DSM, but the
inital_plane_vma expects the address to be relative.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 .../drm/i915/display/intel_plane_initial.c    | 22 +++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index f797fcef18fc..b39d3a8dfe45 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -56,10 +56,24 @@ initial_plane_vma(struct drm_i915_private *i915,
 	if (!mem || plane_config->size == 0)
 		return NULL;
 
-	base = round_down(plane_config->base,
-			  I915_GTT_MIN_ALIGNMENT);
-	size = round_up(plane_config->base + plane_config->size,
-			mem->min_page_size);
+	base = plane_config->base;
+	if (IS_DGFX(i915)) {
+		/*
+		 * On discrete the base address should be somewhere in LMEM, but
+		 * depending on the size of LMEM the base address might
+		 * intersect with the start of DSM, like on DG1, in which case
+		 * we need the relative address. In such cases we might also
+		 * need to choose between inital fb vs fbc, if space is limited.
+		 *
+		 * On future discrete HW, like DG2, we should be able to just
+		 * allocate directly from LMEM, due to larger LMEM size.
+		 */
+		if (base >= i915->dsm.start)
+			base -= i915->dsm.start;
+	}
+
+	size = roundup(base + plane_config->size, mem->min_page_size);
+	base = round_down(base, I915_GTT_MIN_ALIGNMENT);
 	size -= base;
 
 	/*
-- 
2.34.1

