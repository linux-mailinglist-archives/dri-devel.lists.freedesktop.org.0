Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8F25A4AF4
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 14:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5C810F167;
	Mon, 29 Aug 2022 12:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545D810F167;
 Mon, 29 Aug 2022 12:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661774679; x=1693310679;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JDt2sUk2X1oCVdgSTfAuuFX5toRav6GNAo6o4hHV6as=;
 b=aql4fAiWkMmJwv8fgBWIRozrrnMqtw//rEV2+sDcE4nAH6D3BBthSqvu
 lD7idm7ApC/wsSkYl3eGZuiy2Zs1h0weQ/gkyWAoUgakcglQR9NzlZTua
 PJhfyXaqnNWsFFi742OXUirnnZXIAwZNRWWBiR57pBjTrH8GPg1Cde6tK
 XxjQdngR/P5gmrQFB+K7HmhYmcESj3dx5cUEPjuJ0tPsSbQbPRtGkP8ac
 jY7K50JYos7GNmTY8LYXMgW47IsJWMbj1YbYVVhBxyOKu9/TiXQCpNo+F
 YDKG3TUQtlzYy45qihemBahaHo+BuVQyYENddZ2UR1/cNwzkZQ1PORdB5 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10453"; a="295653092"
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="295653092"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 05:04:17 -0700
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="672354997"
Received: from nirmoyda-desk.igk.intel.com ([10.102.13.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 05:04:15 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/ttm: Abort suspend on i915_ttm_backup failure
Date: Mon, 29 Aug 2022 14:04:09 +0200
Message-Id: <20220829120409.24260-1-nirmoy.das@intel.com>
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

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6529
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

