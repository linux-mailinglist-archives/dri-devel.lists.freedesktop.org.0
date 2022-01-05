Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC4C485531
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 16:00:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B289B10FAF4;
	Wed,  5 Jan 2022 15:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828D810FAF8;
 Wed,  5 Jan 2022 15:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641394813; x=1672930813;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MTvPVnisEXbaMTys4ep5X2aJzUPbt+lEaOCT1g6iXCU=;
 b=OlXu504qbgtsuwJTsYXjw2hn8GkrT9i7KJuk/vfXGXey3QJV0AqgNHDX
 M4HQyNgtJCe9GFGl8VMr1AaduLCEXGK//sonR0yiHjz2RXwNzoQ/504u2
 +0KL/daWlU8cg7mjV8cgcpKd5kazzchOMcJ+EqZwaX+5FtYhqOwH+MNY0
 yEQEUXK/Q+IFzaNif2SbJ9pNZH9y7qdvZ17mFU4wAVtJk5HBIkTEVuveg
 KrjT6DT2JihWz0kYV6NNQsFlYYHTPgil3O+hKRYUobRj94n9acpWWUFYU
 y8g38LxJK/HaZIeCFXx4Kx6qN5Tt1s7jktsNwzsNV4B5t1pyGd3/2fxos g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="239999792"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; d="scan'208";a="239999792"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:00:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; d="scan'208";a="512979184"
Received: from unknown (HELO mwauld-desk1.intel.com) ([10.252.26.67])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:00:12 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/4] drm/i915/ttm: ensure we unmap when purging
Date: Wed,  5 Jan 2022 14:58:34 +0000
Message-Id: <20220105145835.142950-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220105145835.142950-1-matthew.auld@intel.com>
References: <20220105145835.142950-1-matthew.auld@intel.com>
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

Purging can happen during swapping out, or directly invoked with the
madvise ioctl. In such cases this doesn't involve a ttm move, which
skips umapping the object.

Fixes: cf3e3e86d779 ("drm/i915: Use ttm mmap handling for ttm bo's.")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 8d61d4538a64..f148e7e48f86 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -399,6 +399,8 @@ int i915_ttm_purge(struct drm_i915_gem_object *obj)
 	if (obj->mm.madv == __I915_MADV_PURGED)
 		return 0;
 
+	ttm_bo_unmap_virtual(bo);
+
 	ret = ttm_bo_validate(bo, &place, &ctx);
 	if (ret)
 		return ret;
-- 
2.31.1

