Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A575E7D48
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 16:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5A110E3A4;
	Fri, 23 Sep 2022 14:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3111C10E3A4;
 Fri, 23 Sep 2022 14:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663943858; x=1695479858;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=76x+UoQ2TUS+M2ihl/sXsH9sq4ESP2S4X6lZDx1sgY4=;
 b=d81hYOAHakk00ZTHJJtAUx0EI6tZwVM7YlTSdM5N0hMOoGNVhu23SeJu
 B5hs6aPvGc8fQ2G7JJmF9bBU19eZ2U+jYkYhT75CGhYv5x2GxMofazxXM
 RbK/BCcDPEL9tLRUDoiTRTla9OnhndStSc05eHl/Rs+SqLdQA5oYTGXUW
 t3Rno+WzwftEI9Tal9dJSEf/u2Gr0Fx+yqAJYeXQMySK9w+yJDCIbpl6h
 3Hjf1jkg14EWvUtmfHll+FBWhOSvTqmNCVx1uGhzfNZjaHsus4D9uA5k0
 MJbetW4JgzWrUV2JKDDIhWEmTOuTVzVNkk3w9OJ5jcGKh/c28LUldPby8 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10479"; a="386893195"
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="386893195"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 07:37:37 -0700
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="949035103"
Received: from nirmoyda-desk.igk.intel.com ([10.102.13.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 07:37:36 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3] drm/i915: Improve debug print in vm_fault_ttm
Date: Fri, 23 Sep 2022 16:37:30 +0200
Message-Id: <20220923143730.13498-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.37.3
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
Cc: andrzej.hajda@intel.com, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Print the error code returned by __i915_ttm_migrate()
for better debuggability.

v2: Fix kernel test robot warning.
v3: Fix dim checkpatch warning.
References: https://gitlab.freedesktop.org/drm/intel/-/issues/6889
Acked-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index e3fc38dd5db0..3dc6acfcf4ec 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -1034,7 +1034,8 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
 		}
 
 		if (err) {
-			drm_dbg(dev, "Unable to make resource CPU accessible\n");
+			drm_dbg(dev, "Unable to make resource CPU accessible(err = %pe)\n",
+				ERR_PTR(err));
 			dma_resv_unlock(bo->base.resv);
 			ret = VM_FAULT_SIGBUS;
 			goto out_rpm;
-- 
2.37.3

