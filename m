Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36012467751
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 13:25:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF1273F67;
	Fri,  3 Dec 2021 12:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E9873F5D;
 Fri,  3 Dec 2021 12:25:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="297761406"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="297761406"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 04:25:07 -0800
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="746699421"
Received: from ashunt-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.17.106])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 04:25:05 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 5/8] drm/i915/migrate: fix length calculation
Date: Fri,  3 Dec 2021 12:24:23 +0000
Message-Id: <20211203122426.2859679-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203122426.2859679-1-matthew.auld@intel.com>
References: <20211203122426.2859679-1-matthew.auld@intel.com>
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
Cc: bob.beckett@collabora.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 adrian.larumbe@collabora.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No need to insert PTEs for the PTE window itself, also foreach expects a
length not an end offset, which could be gigantic here with a second
engine.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index cb0bb3b94644..2076e24e0489 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -136,7 +136,7 @@ static struct i915_address_space *migrate_vm(struct intel_gt *gt)
 			goto err_vm;
 
 		/* Now allow the GPU to rewrite the PTE via its own ppGTT */
-		vm->vm.foreach(&vm->vm, base, base + sz, insert_pte, &d);
+		vm->vm.foreach(&vm->vm, base, d.offset - base, insert_pte, &d);
 	}
 
 	return &vm->vm;
-- 
2.31.1

