Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA2F3B18D7
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 13:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A9AE6E8BC;
	Wed, 23 Jun 2021 11:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4036E6E8B8;
 Wed, 23 Jun 2021 11:26:57 +0000 (UTC)
IronPort-SDR: 37WICaIZ5r7FvWHyFBBkf+5TGDCqkEcGejvhuCBOqVIie3IOZVFYv45tvWN+UEya1VhQBtzv4+
 lbbDkloCm2xw==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="271086590"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="271086590"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 04:26:56 -0700
IronPort-SDR: vjYspanLSwwRdHk/xlA5ejlFlN16CDRROJxXlh/eB8kbt9uzMEigHHoBrLa0wpISb3+p+ejNkH
 PYp4rScHJinQ==
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="454619210"
Received: from dconnon-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.14.111])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 04:26:55 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915/gtt: ignore min_page_size for paging structures
Date: Wed, 23 Jun 2021 12:26:37 +0100
Message-Id: <20210623112637.266855-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210623112637.266855-1-matthew.auld@intel.com>
References: <20210623112637.266855-1-matthew.auld@intel.com>
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

The min_page_size is only needed for pages inserted into the GTT, and
for our paging structures we only need at most 4K bytes, so simply
ignore the min_page_size restrictions here, otherwise we might see some
severe overallocation on some devices.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 084ea65d59c0..61e8a8c25374 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -16,7 +16,7 @@ struct drm_i915_gem_object *alloc_pt_lmem(struct i915_address_space *vm, int sz)
 {
 	struct drm_i915_gem_object *obj;
 
-	obj = i915_gem_object_create_lmem(vm->i915, sz, 0);
+	obj = __i915_gem_object_create_lmem_with_ps(vm->i915, sz, sz, 0);
 	/*
 	 * Ensure all paging structures for this vm share the same dma-resv
 	 * object underneath, with the idea that one object_lock() will lock
-- 
2.26.3

