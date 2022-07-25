Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B6A57FC58
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 11:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FE218B5BE;
	Mon, 25 Jul 2022 09:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BCE8AEF1;
 Mon, 25 Jul 2022 09:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658741198; x=1690277198;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BCTGBD10Jed4Oi1ESc2XFHwH9gcczME1KdhWYgPO7/k=;
 b=J+xFI0bn4VatO8ETpj0m0pq4MQ60cVEWGCkVKHGAibf/FW2JrnF+J71B
 1DkdJtyfmBQ5kN9Sp2fI/GHFxnodWrU+M0qKXgnyepWByULSBBYAM/CsT
 6LsrpWjZ1m1GQm82q4I7L8VAZubT2BAHdnmCzrcOXaYp4lqGxlodXC8ix
 jheuGaVASXD9KfKEfxYtbLXwzd4O/2dAKK1g4CKrhLY5AVz7HRxMWb1zl
 B+uA1sVuZw3FwiCDKd0wbobWij6a3oAajLFBcwDhjiEoLqTpjVwTKqx+5
 GMfzSrnCptM+Zw8Xx8TrkZWrDiobz+G98kFVTWK5j6iAi0es8lphwtWol g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10418"; a="268047832"
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; d="scan'208";a="268047832"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 02:26:35 -0700
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; d="scan'208";a="926823867"
Received: from abaruah-mobl.gar.corp.intel.com (HELO hades.ger.corp.intel.com)
 ([10.249.37.11])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 02:26:32 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 6/7] drm/i915: Use error code as -E2BIG when the size of
 gem ttm object is too large
Date: Mon, 25 Jul 2022 12:25:27 +0300
Message-Id: <20220725092528.1281487-7-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220725092528.1281487-1-gwan-gyeong.mun@intel.com>
References: <20220725092528.1281487-1-gwan-gyeong.mun@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, airlied@linux.ie,
 matthew.auld@intel.com, mchehab@kernel.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ttm_bo_init_reserved() functions returns -ENOSPC if the size is too big
to add vma. The direct function that returns -ENOSPC is drm_mm_insert_node_in_range().
To handle the same error as other code returning -E2BIG when the size is
too large, it converts return value to -E2BIG.

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 88f2887627dc..4d478bf325be 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -1249,6 +1249,17 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	ret = ttm_bo_init_reserved(&i915->bdev, i915_gem_to_ttm(obj), bo_type,
 				   &i915_sys_placement, page_size >> PAGE_SHIFT,
 				   &ctx, NULL, NULL, i915_ttm_bo_destroy);
+
+	/*
+	 * XXX: The ttm_bo_init_reserved() functions returns -ENOSPC if the size
+	 * is too big to add vma. The direct function that returns -ENOSPC is
+	 * drm_mm_insert_node_in_range(). To handle the same error as other code
+	 * that returns -E2BIG when the size is too large, it converts -ENOSPC to
+	 * -E2BIG.
+	 */
+	if (size >> PAGE_SHIFT > INT_MAX && ret == -ENOSPC)
+		ret = -E2BIG;
+
 	if (ret)
 		return i915_ttm_err_to_gem(ret);
 
-- 
2.34.1

