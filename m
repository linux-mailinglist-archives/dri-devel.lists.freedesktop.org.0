Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC1B5A82EC
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 18:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4113010E47C;
	Wed, 31 Aug 2022 16:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097A310E47C;
 Wed, 31 Aug 2022 16:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661962752; x=1693498752;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xv7+hHd2EJoOGRBxG2sMeE9VuN9qw77RDWbu3e0Szrs=;
 b=nzIKnBscdI17XPoliWerJGO6+mCgwQMbWek0l7pqi/k2k0t5+9ojvk78
 beotH8hYki7p1+EwZR5LLRdISqA2MmTuxYQ9y8UPG/25e62bNnQa31Gqr
 MX+G8U5UBy42HKqvAH4R3ZbjIYcHzTSwE5XQ5L3a0aS3hIjgN565vUwPF
 S5DulGtTPobuR0b7V7I2lJaghaLlECNo2hmqwUZ8ofs39EDpREyeHM29k
 fPE3VG551Q/pkJoeKPDtoXN9RAOPNB2zB6Nb5ZVCPXORHY9MuUuwy5yy3
 6yVlTMj8TwFyXjvGTZZ823z8gZ/7KV7g7ujTR4Bjq+hxabTzQW64sEjGx w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="381782790"
X-IronPort-AV: E=Sophos;i="5.93,278,1654585200"; d="scan'208";a="381782790"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 09:18:55 -0700
X-IronPort-AV: E=Sophos;i="5.93,278,1654585200"; d="scan'208";a="673417344"
Received: from nirmoyda-desk.igk.intel.com ([10.102.13.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 09:18:53 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/ttm: Abort suspend on i915_ttm_backup failure
Date: Wed, 31 Aug 2022 18:18:41 +0200
Message-Id: <20220831161841.20033-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: thomas.hellstrom@intel.com, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org, chris.p.wilson@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On system suspend when system memory is low then i915_gem_obj_copy_ttm()
could fail trying to backup a lmem obj. GEM_WARN_ON() is not enough,
suspend shouldn't continue if i915_ttm_backup() throws an error.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/6529
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Suggested-by: Chris P Wilson <chris.p.wilson@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
index 9aad84059d56..6f5d5c0909b4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
@@ -79,7 +79,12 @@ static int i915_ttm_backup(struct i915_gem_apply_to_region *apply,
 		goto out_no_populate;
 
 	err = i915_gem_obj_copy_ttm(backup, obj, pm_apply->allow_gpu, false);
-	GEM_WARN_ON(err);
+	if (err) {
+		drm_err(&i915->drm,
+			"Unable to copy from device to system memory, err:%d\n",
+			err);
+		goto out_no_populate;
+	}
 	ttm_bo_wait_ctx(backup_bo, &ctx);
 
 	obj->ttm.backup = backup;
-- 
2.35.1

