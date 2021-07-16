Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B31D23CB04D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 03:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5416E8D0;
	Fri, 16 Jul 2021 01:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22DB76E8D0;
 Fri, 16 Jul 2021 01:11:54 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GQtR46G3WzZkts;
 Fri, 16 Jul 2021 09:08:32 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 16 Jul 2021 09:11:51 +0800
Received: from thunder-town.china.huawei.com (10.174.179.0) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 16 Jul 2021 09:11:50 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/i915: Fix error return code in igt_vma_create()
Date: Fri, 16 Jul 2021 09:11:12 +0800
Message-ID: <20210716011112.3305-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.179.0]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
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
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Although 'err' has been initialized to -ENOMEM, but it will be reassigned
by the "err = create_vmas(...)" statement in the for loop. So that, the
value of 'err' may be zero when i915_gem_object_create_internal() or
mock_context() failed.

Fix to reassign 'err' before 'goto out'.

Fixes: e3c7a1c5377e ("drm/i915: Test creation of VMA")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/gpu/drm/i915/selftests/i915_vma.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
index dd0607254a95..96771c341f29 100644
--- a/drivers/gpu/drm/i915/selftests/i915_vma.c
+++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
@@ -156,7 +156,7 @@ static int igt_vma_create(void *arg)
 	IGT_TIMEOUT(end_time);
 	LIST_HEAD(contexts);
 	LIST_HEAD(objects);
-	int err = -ENOMEM;
+	int err;
 
 	/* Exercise creating many vma amonst many objections, checking the
 	 * vma creation and lookup routines.
@@ -166,8 +166,10 @@ static int igt_vma_create(void *arg)
 	for_each_prime_number(num_obj, ULONG_MAX - 1) {
 		for (; no < num_obj; no++) {
 			obj = i915_gem_object_create_internal(i915, PAGE_SIZE);
-			if (IS_ERR(obj))
+			if (IS_ERR(obj)) {
+				err = PTR_ERR(obj);
 				goto out;
+			}
 
 			list_add(&obj->st_link, &objects);
 		}
@@ -176,8 +178,10 @@ static int igt_vma_create(void *arg)
 		for_each_prime_number(num_ctx, 2 * BITS_PER_LONG) {
 			for (; nc < num_ctx; nc++) {
 				ctx = mock_context(i915, "mock");
-				if (!ctx)
+				if (!ctx) {
+					err = -ENOMEM;
 					goto out;
+				}
 
 				list_move(&ctx->link, &contexts);
 			}
-- 
2.25.1

