Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7C04292BC
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 17:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F1C6E508;
	Mon, 11 Oct 2021 15:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22536E4A2;
 Mon, 11 Oct 2021 15:01:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="227179424"
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="227179424"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 07:56:50 -0700
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="569984437"
Received: from phutoant-mobl3.ccr.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.44.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 07:56:47 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v8 3/8] drm/i915/gtt: drop unneeded make_unshrinkable
Date: Mon, 11 Oct 2021 15:56:14 +0100
Message-Id: <20211011145619.1397733-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211011145619.1397733-1-matthew.auld@intel.com>
References: <20211011145619.1397733-1-matthew.auld@intel.com>
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

We already do this when mapping the pages.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c | 1 -
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
index 890191f286e3..baea9770200a 100644
--- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
@@ -185,7 +185,6 @@ static void gen6_alloc_va_range(struct i915_address_space *vm,
 
 			pt = stash->pt[0];
 			__i915_gem_object_pin_pages(pt->base);
-			i915_gem_object_make_unshrinkable(pt->base);
 
 			fill32_px(pt, vm->scratch[0]->encode);
 
diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index 037a9a6e4889..8af2f709571c 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -301,7 +301,6 @@ static void __gen8_ppgtt_alloc(struct i915_address_space * const vm,
 
 			pt = stash->pt[!!lvl];
 			__i915_gem_object_pin_pages(pt->base);
-			i915_gem_object_make_unshrinkable(pt->base);
 
 			fill_px(pt, vm->scratch[lvl]->encode);
 
-- 
2.26.3

