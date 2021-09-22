Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DB94143E4
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 10:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89AF96EB16;
	Wed, 22 Sep 2021 08:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064776EB15;
 Wed, 22 Sep 2021 08:38:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="210784060"
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; d="scan'208";a="210784060"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 01:38:18 -0700
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; d="scan'208";a="613315556"
Received: from vkubarev-mobl1.ccr.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.165])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 01:38:17 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 2/3] drm/i915/ttm: Fix lockdep warning in
 __i915_gem_free_object()
Date: Wed, 22 Sep 2021 10:38:06 +0200
Message-Id: <20210922083807.888206-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210922083807.888206-1-thomas.hellstrom@linux.intel.com>
References: <20210922083807.888206-1-thomas.hellstrom@linux.intel.com>
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

In the mman selftest, some tests make the ttm_bo_init_reserved() fail,
which may trigger a call to the i915_ttm_bo_destroy() function.
However, at this point the gem object refcount is set to 1, which
triggers a lockdep warning in __i915_gem_free_object() and a
corresponding failure in DG1 BAT, i915_selftest@live@mman.

Fix this by clearing the gem object refcount if called from that
failure path.

Fixes: f9b23c157a78 ("drm/i915: Move __i915_gem_free_object to ttm_bo_destroy")
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index b94497989995..b1f561543ff3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -900,6 +900,10 @@ void i915_ttm_bo_destroy(struct ttm_buffer_object *bo)
 
 	i915_ttm_backup_free(obj);
 
+	/* Failure during ttm_bo_init_reserved leaves the refcount set to 1. */
+	if (IS_ENABLED(CONFIG_LOCKDEP) && !obj->ttm.created)
+		refcount_set(&obj->base.refcount.refcount, 0);
+
 	/* This releases all gem object bindings to the backend. */
 	__i915_gem_free_object(obj);
 
-- 
2.31.1

