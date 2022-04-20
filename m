Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBDC508F39
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 20:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA1E10E031;
	Wed, 20 Apr 2022 18:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC55310E031;
 Wed, 20 Apr 2022 18:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650478585; x=1682014585;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JI/PQ35JsaPHJwaCoTn02lr0WPN2Q6LfIMFWc7RLmjw=;
 b=GOKkVsKV7i1tkCaPS//RhA6AprTVXUDZBwkXjvrKu3f42mAhizjb6NCy
 y0UHeuk1B52OxeLwMIdxvEfvWUGM47voWGJ1WxPaetvZjSHQPen8a2sr4
 psfWj/mt5hGGvoRDpA8IBekF4FJtD0GXmT1P/RrCa0zR7s20EilSyzFyg
 CAYf0vqI1gGjA1koyTxHxLPpmzsMIpE6K2ihJHk7OqxEVNSOaaq9WrlJi
 4BgppR3hLl0oxjXqEd1v1ey0QeQXHzpk+uLH5RaXyVHPiI18zpr0zDCX3
 GCxppou+Ag0Mcxh7Yj69KkxeF9TfVtOmsKBMeLgTNqLRs+GvEp8kOHTW2 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="261723144"
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; d="scan'208";a="261723144"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 11:16:25 -0700
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; d="scan'208";a="593286068"
Received: from briansim-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.3.144])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 11:16:23 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [CI 1/4] drm/i915: consider min_page_size when migrating
Date: Wed, 20 Apr 2022 19:16:10 +0100
Message-Id: <20220420181613.70033-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
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
 Nirmoy Das <nirmoy.das@intel.com>, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We can only force migrate an object if the existing object size is
compatible with the new destinations min_page_size for the region.
Currently we blow up with something like:

[ 2857.497462] kernel BUG at drivers/gpu/drm/i915/gt/intel_migrate.c:431!
[ 2857.497497] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
[ 2857.497502] CPU: 1 PID: 8921 Comm: i915_selftest Tainted: G     U  W         5.18.0-rc1-drm-tip+ #27
[ 2857.497513] RIP: 0010:emit_pte.cold+0x11a/0x17e [i915]
[ 2857.497646] Code: 00 48 c7 c2 f0 cd c1 a0 48 c7 c7 e9 99 bd a0 e8 d2 77 5d e0 bf 01 00 00 00 e8 08 47 5d e0 31 f6 bf 09 00 00 00 e8 3c 7b 4d e0 <0f> 0b 48 c7 c1 e0 2a c5 a0 ba 34 00 00 00 48 c7 c6 00 ce c1 a0 48
[ 2857.497654] RSP: 0018:ffffc900000f7748 EFLAGS: 00010246
[ 2857.497658] RAX: 0000000000000000 RBX: ffffc900000f77c8 RCX: 0000000000000006
[ 2857.497662] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000009
[ 2857.497665] RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000001
[ 2857.497668] R10: 0000000000022302 R11: ffff88846dea08f0 R12: 0000000000010000
[ 2857.497672] R13: 0000000001880000 R14: 000000000000081b R15: ffff888106b7c040
[ 2857.497675] FS:  00007f0d4c4e0600(0000) GS:ffff88845da80000(0000) knlGS:0000000000000000
[ 2857.497679] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2857.497682] CR2: 00007f113966c088 CR3: 0000000211e60003 CR4: 00000000003706e0
[ 2857.497686] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[ 2857.497689] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[ 2857.497692] Call Trace:
[ 2857.497694]  <TASK>
[ 2857.497697]  intel_context_migrate_copy+0x1e5/0x4f0 [i915]

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c            | 3 +++
 drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 747ac65e060f..06b1b188ce5a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -606,6 +606,9 @@ bool i915_gem_object_can_migrate(struct drm_i915_gem_object *obj,
 	if (!mr)
 		return false;
 
+	if (!IS_ALIGNED(obj->base.size, mr->min_page_size))
+		return false;
+
 	if (obj->mm.region == mr)
 		return true;
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
index 6bd61b1f839c..801af51aff62 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
@@ -47,14 +47,16 @@ static int igt_create_migrate(struct intel_gt *gt, enum intel_region_id src,
 {
 	struct drm_i915_private *i915 = gt->i915;
 	struct intel_memory_region *src_mr = i915->mm.regions[src];
+	struct intel_memory_region *dst_mr = i915->mm.regions[dst];
 	struct drm_i915_gem_object *obj;
 	struct i915_gem_ww_ctx ww;
 	int err = 0;
 
 	GEM_BUG_ON(!src_mr);
+	GEM_BUG_ON(!dst_mr);
 
 	/* Switch object backing-store on create */
-	obj = i915_gem_object_create_region(src_mr, PAGE_SIZE, 0, 0);
+	obj = i915_gem_object_create_region(src_mr, dst_mr->min_page_size, 0, 0);
 	if (IS_ERR(obj))
 		return PTR_ERR(obj);
 
-- 
2.34.1

