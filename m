Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E14F3B9F3E
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 12:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8F96E0F3;
	Fri,  2 Jul 2021 10:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E316E0ED;
 Fri,  2 Jul 2021 10:46:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="208666599"
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; d="scan'208";a="208666599"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2021 03:46:51 -0700
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; d="scan'208";a="482276513"
Received: from salle-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.224.112])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2021 03:46:50 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/selftests: fix smatch warning in igt_check_blocks
Date: Fri,  2 Jul 2021 11:46:41 +0100
Message-Id: <20210702104642.1189978-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
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
Cc: Dan Carpenter <dan.carpenter@oracle.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The block here can't be NULL, especially since we already dereferenced
it earlier, so remove the redundant check.

igt_check_blocks() warn: variable dereferenced before check 'block' (see line 126)

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_buddy.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_buddy.c b/drivers/gpu/drm/i915/selftests/i915_buddy.c
index f0f5c4df8dbc..d61ec9c951bf 100644
--- a/drivers/gpu/drm/i915/selftests/i915_buddy.c
+++ b/drivers/gpu/drm/i915/selftests/i915_buddy.c
@@ -166,10 +166,8 @@ static int igt_check_blocks(struct i915_buddy_mm *mm,
 		igt_dump_block(mm, prev);
 	}
 
-	if (block) {
-		pr_err("bad block, dump:\n");
-		igt_dump_block(mm, block);
-	}
+	pr_err("bad block, dump:\n");
+	igt_dump_block(mm, block);
 
 	return err;
 }
-- 
2.26.3

