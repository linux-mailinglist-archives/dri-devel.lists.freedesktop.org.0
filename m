Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF165A9DED
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 19:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484EB10E0D7;
	Thu,  1 Sep 2022 17:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EE310E0C5;
 Thu,  1 Sep 2022 17:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662052966; x=1693588966;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+ydk57zNsrUCHPaIocstQqqDgcBZtn2HxGOcgB7agDY=;
 b=EgQ1ZWGWsjL1bdi4/AXRfY1e8bYYOcoU8O7yoi90jvLAlZdKdZ3KlRRp
 n9PIadmEmTnxRhtigRROFOelwyKAbclWihuZgUeWo++/59WGLGgUgXfRa
 dmvIicGhvk02QxucUyOO/NL6a5jPgid1wF0iXqNKz5RNkaLPKd774NEbj
 +jordBmvTRHbVSx+1VD6kG4mnRZf2vA0CFEz6bEwtDyieaosoBlkODCuj
 mQ8oZIfQZfp/0ZhyFnpA8C3QvCTuBvzi0gF3smbDhsLJOqoxGHiOcO+W5
 N3Nn6ctfj4kz9EfLWtoF1llC4Wm/n0H6s/JpEQHqslqaH7XXDD5k7H7aq A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="282761851"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="282761851"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 10:22:25 -0700
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="673956662"
Received: from nirmoyda-desk.igk.intel.com ([10.102.13.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 10:22:23 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3] drm/i915/ttm: Abort suspend on i915_ttm_backup failure
Date: Thu,  1 Sep 2022 19:22:17 +0200
Message-Id: <20220901172217.18392-1-nirmoy.das@intel.com>
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
Cc: andrzej.hajda@intel.com, thomas.hellstrom@intel.com, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org, chris.p.wilson@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On system suspend when system memory is low then i915_gem_obj_copy_ttm()
could fail trying to backup a lmem obj. GEM_WARN_ON() is not enough,
suspend shouldn't continue if i915_ttm_backup() throws an error.

v2: Keep the fdo issue till we have a igt test(Matt).
v3: Use %pe(Andrzej)

References: https://gitlab.freedesktop.org/drm/intel/-/issues/6529
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Suggested-by: Chris P Wilson <chris.p.wilson@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
index 9aad84059d56..07e49f22f2de 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
@@ -79,7 +79,12 @@ static int i915_ttm_backup(struct i915_gem_apply_to_region *apply,
 		goto out_no_populate;
 
 	err = i915_gem_obj_copy_ttm(backup, obj, pm_apply->allow_gpu, false);
-	GEM_WARN_ON(err);
+	if (err) {
+		drm_err(&i915->drm,
+			"Unable to copy from device to system memory, err:%pe\n",
+			ERR_PTR(err));
+		goto out_no_populate;
+	}
 	ttm_bo_wait_ctx(backup_bo, &ctx);
 
 	obj->ttm.backup = backup;
-- 
2.35.1

