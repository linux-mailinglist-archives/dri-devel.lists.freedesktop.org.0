Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A053940CCFA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 21:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830ED6E9F7;
	Wed, 15 Sep 2021 19:00:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23846E9F4;
 Wed, 15 Sep 2021 19:00:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="286094833"
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; d="scan'208";a="286094833"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 12:00:34 -0700
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; d="scan'208";a="553461246"
Received: from rdignam-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.31.110])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 12:00:33 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v3 12/12] drm/i915/ttm: enable shmem tt backend
Date: Wed, 15 Sep 2021 19:59:54 +0100
Message-Id: <20210915185954.3114858-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210915185954.3114858-1-matthew.auld@intel.com>
References: <20210915185954.3114858-1-matthew.auld@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable shmem tt backend, and enable shrinking.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index e758de336b96..6199e8c067ff 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -1050,6 +1050,7 @@ static u64 i915_ttm_mmap_offset(struct drm_i915_gem_object *obj)
 
 static const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
 	.name = "i915_gem_object_ttm",
+	.flags = I915_GEM_OBJECT_IS_SHRINKABLE,
 
 	.get_pages = i915_ttm_get_pages,
 	.put_pages = i915_ttm_put_pages,
-- 
2.26.3

