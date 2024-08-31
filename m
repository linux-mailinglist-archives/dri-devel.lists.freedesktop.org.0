Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D12DD9670C5
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 12:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A482210E0D7;
	Sat, 31 Aug 2024 10:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972B210E0D7
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2024 10:18:37 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WwrXb4pMSzpVBS;
 Sat, 31 Aug 2024 18:16:47 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 341D91800FE;
 Sat, 31 Aug 2024 18:18:34 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 31 Aug
 2024 18:18:33 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <tursulin@ursulin.net>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <chentao@kylinos.cn>, <ivan.briano@intel.com>,
 <ruanjinjie@huawei.com>, <vinay.belgaumkar@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] drm/i915: Use memdup_user() helper
Date: Sat, 31 Aug 2024 18:26:48 +0800
Message-ID: <20240831102648.92714-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemh500013.china.huawei.com (7.202.181.146)
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

Switching to memdup_user(), which combines kmalloc() and copy_from_user(),
and it can simplfy code.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index c0543c35cd6a..c1cc41e90502 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -2159,18 +2159,12 @@ static int set_context_image(struct i915_gem_context *ctx,
 		goto out_ce;
 	}
 
-	state = kmalloc(ce->engine->context_size, GFP_KERNEL);
-	if (!state) {
-		ret = -ENOMEM;
+	state = memdup_user(u64_to_user_ptr(user.image), ce->engine->context_size);
+	if (IS_ERR(state)) {
+		ret = PTR_ERR(state);
 		goto out_ce;
 	}
 
-	if (copy_from_user(state, u64_to_user_ptr(user.image),
-			   ce->engine->context_size)) {
-		ret = -EFAULT;
-		goto out_state;
-	}
-
 	shmem_state = shmem_create_from_data(ce->engine->name,
 					     state, ce->engine->context_size);
 	if (IS_ERR(shmem_state)) {
-- 
2.34.1

