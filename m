Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B999AFE34
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 11:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFF910EA47;
	Fri, 25 Oct 2024 09:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1033 seconds by postgrey-1.36 at gabe;
 Fri, 25 Oct 2024 09:30:59 UTC
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABF510EA47;
 Fri, 25 Oct 2024 09:30:59 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4XZcWQ1lk2zQrZF;
 Fri, 25 Oct 2024 17:12:50 +0800 (CST)
Received: from kwepemm600001.china.huawei.com (unknown [7.193.23.3])
 by mail.maildlp.com (Postfix) with ESMTPS id 4CE25140361;
 Fri, 25 Oct 2024 17:13:44 +0800 (CST)
Received: from huawei.com (10.175.113.133) by kwepemm600001.china.huawei.com
 (7.193.23.3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 25 Oct
 2024 17:13:42 +0800
From: Wang Hai <wanghai38@huawei.com>
To: <lucas.demarchi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <matthew.auld@intel.com>, <matthew.brost@intel.com>,
 <michal.wajdeczko@intel.com>, <akshata.jahagirdar@intel.com>,
 <david.kershner@intel.com>, <matthew.d.roper@intel.com>,
 <zhangxiaoxu5@huawei.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <wanghai38@huawei.com>
Subject: [PATCH] drm/xe/migrate: Fix inappropriate error printing in
 xe_migrate_sanity_test()
Date: Fri, 25 Oct 2024 17:13:10 +0800
Message-ID: <20241025091310.15380-1-wanghai38@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.113.133]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600001.china.huawei.com (7.193.23.3)
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

When creating pin map for tiny fails, the PTR_ERR(pt) is printed instead
of PTR_ERR(tiny), which makes it impossible to accurately get the true
cause of the error.

Print PTR_ERR(tiny) after creating pin map for tiny fails.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Wang Hai <wanghai38@huawei.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 1a192a2a941b..4542925445de 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -224,8 +224,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 				    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 				    XE_BO_FLAG_PINNED);
 	if (IS_ERR(tiny)) {
-		KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
-			   PTR_ERR(pt));
+		KUNIT_FAIL(test, "Failed to allocate fake tiny: %li\n",
+			   PTR_ERR(tiny));
 		goto free_pt;
 	}
 
-- 
2.17.1

