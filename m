Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AC04C27F6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 10:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F3810F498;
	Thu, 24 Feb 2022 09:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C0B10F40F;
 Thu, 24 Feb 2022 09:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645694431; x=1677230431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iwdt3HoDzld+OcFJl96Rmp4ahi1z9gNIBd3/XmwFPIg=;
 b=Tp2JcL9xQemeqLC6Tm46tnuXifKudCLJ1ovvoaA678lsZooYQ3KNeJpq
 TU93lc8jjuOG2CcLzeL6R+tjx5so+zDLGyl+h0ycct1ZDUHa9MIEcE2zz
 yhdPk68uwDk5Ej/5FmsHsrORIOx/fjlAoDLA9/tEce657FPYJdp8Vj+c1
 zak8cFC4htCqZ7U/NinM+U6u60cABrzZ/MgpvsAjc/48PICAONKlwLCRN
 oTzYCph1zGjKCAfWbi8oPsb2KYjlS2nSRg7QP116UjBav0wE5CsCmk2vK
 Qi+6hoPTuJk8zz9ZIDTuxMQtvcBsw524eVTGgbTo4HNVPDpjy8h4Bd48Y Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="232162998"
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; d="scan'208";a="232162998"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 01:20:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; d="scan'208";a="491537802"
Received: from pallavim-desk.iind.intel.com ([10.145.162.180])
 by orsmga003.jf.intel.com with ESMTP; 24 Feb 2022 01:20:27 -0800
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: gfx-internal-devel@eclists.intel.com
Subject: [PATCH 3/6] drm/i915/gem: clear userspace buffers for LMEM
Date: Thu, 24 Feb 2022 14:52:29 +0530
Message-Id: <20220224092232.780075-4-pallavi.mishra@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224092232.780075-1-pallavi.mishra@intel.com>
References: <20220224092232.780075-1-pallavi.mishra@intel.com>
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
Cc: Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>, dri-devel@lists.freedesktop.org,
 Kenneth Graunke <kenneth@whitecape.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>, matthew.auld@intel.com,
 Jason Ekstrand <jason@jlekstrand.net>, mesa-dev@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Auld <matthew.auld@intel.com>

All userspace objects must be cleared when allocating the backing store,
before they are potentially visible to userspace.  For now use simple
CPU based clearing to do this for device local-memory objects, note that
in the near future this will instead use the blitter engine.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: mesa-dev@lists.freedesktop.org
Reviewed-by: Kenneth Graunke <kenneth@whitecape.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210429103056.407067-8-matthew.auld@intel.com
(cherry picked from commit 0e997a36ecb61b161a22980ec9240ee7537f3f62)
---
 drivers/gpu/drm/i915/gem/i915_gem_create.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index 957f790c644b..f6729feae582 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -71,6 +71,7 @@ static int
 i915_gem_setup(struct drm_i915_gem_object *obj, u64 size)
 {
 	struct intel_memory_region *mr = obj->mm.placements[0];
+	unsigned int flags;
 	int ret;
 
 	size = round_up(size, object_max_page_size(obj));
@@ -83,7 +84,16 @@ i915_gem_setup(struct drm_i915_gem_object *obj, u64 size)
 	if (i915_gem_object_size_2big(size))
 		return -E2BIG;
 
-	ret = mr->ops->init_object(mr, obj, size, 0);
+	/*
+	 * For now resort to CPU based clearing for device local-memory, in the
+	 * near future this will use the blitter engine for accelerated, GPU
+	 * based clearing.
+	 */
+	flags = 0;
+	if (mr->type == INTEL_MEMORY_LOCAL)
+		flags = I915_BO_ALLOC_CPU_CLEAR;
+
+	ret = mr->ops->init_object(mr, obj, size, flags);
 	if (ret)
 		return ret;
 
