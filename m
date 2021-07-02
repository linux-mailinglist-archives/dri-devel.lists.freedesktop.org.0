Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D463B9F3D
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 12:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225266E0ED;
	Fri,  2 Jul 2021 10:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DAAF6E0ED;
 Fri,  2 Jul 2021 10:46:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="208666601"
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; d="scan'208";a="208666601"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2021 03:46:52 -0700
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; d="scan'208";a="482276946"
Received: from salle-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.224.112])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2021 03:46:51 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/selftests: fix smatch warning in mock_reserve
Date: Fri,  2 Jul 2021 11:46:42 +0100
Message-Id: <20210702104642.1189978-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210702104642.1189978-1-matthew.auld@intel.com>
References: <20210702104642.1189978-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: Dan Carpenter <dan.carpenter@oracle.com>, kernel test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If mock_region_create fails then mem will be an error pointer. Instead
we just need to use the correct ordering for the onion unwind.

igt_mock_reserve() error: 'mem' dereferencing possible ERR_PTR()

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/selftests/intel_memory_region.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
index 1aaccb9841a0..418caae84759 100644
--- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
@@ -173,7 +173,7 @@ static int igt_mock_reserve(void *arg)
 	if (IS_ERR(mem)) {
 		pr_err("failed to create memory region\n");
 		err = PTR_ERR(mem);
-		goto out_close;
+		goto out_free_order;
 	}
 
 	/* Reserve a bunch of ranges within the region */
@@ -224,9 +224,10 @@ static int igt_mock_reserve(void *arg)
 	}
 
 out_close:
-	kfree(order);
 	close_objects(mem, &objects);
 	intel_memory_region_put(mem);
+out_free_order:
+	kfree(order);
 	return err;
 }
 
-- 
2.26.3

