Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1E53A7E24
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 14:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32BE6E2D1;
	Tue, 15 Jun 2021 12:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BC16E28B;
 Tue, 15 Jun 2021 12:24:20 +0000 (UTC)
IronPort-SDR: gxRTVrOGzEksF7JABUPyJwaGh2ulcG6s9AUSBmJ8gjHAYpr9TwNjwlNcN3+xLniX8t1vgMBn4w
 0hYawWAAKO2Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="193286964"
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; d="scan'208";a="193286964"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 05:24:19 -0700
IronPort-SDR: 7o6rPd65e8j0kJE3BN0JdExwbqOgDko7R8Y9YWPn7xW+91i40cSc/zr75+dDvyg0vvotvSmBAG
 IYNqwACpeX2Q==
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; d="scan'208";a="487762188"
Received: from vgribano-mobl.ccr.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.53])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 05:24:17 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/ttm: Fix memory leaks
Date: Tue, 15 Jun 2021 14:24:08 +0200
Message-Id: <20210615122408.32347-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix two memory leaks introduced with the ttm backend.

Fixes: 213d50927763 ("drm/i915/ttm: Introduce a TTM i915 gem object backend")
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 08b72c280cb5..8059cb61bc3c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -122,6 +122,7 @@ static void i915_ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
 	struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
 
 	ttm_tt_destroy_common(bdev, ttm);
+	ttm_tt_fini(ttm);
 	kfree(i915_tt);
 }
 
@@ -217,6 +218,7 @@ static void i915_ttm_delete_mem_notify(struct ttm_buffer_object *bo)
 
 	if (likely(obj)) {
 		/* This releases all gem object bindings to the backend. */
+		i915_ttm_free_cached_io_st(obj);
 		__i915_gem_free_object(obj);
 	}
 }
-- 
2.31.1

