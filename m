Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3137398608F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 16:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380BD10E838;
	Wed, 25 Sep 2024 14:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="qGeYFcQg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 467 seconds by postgrey-1.36 at gabe;
 Wed, 25 Sep 2024 14:26:32 UTC
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com
 [91.218.175.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A2810E836
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 14:26:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1727273923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=j1jLzGsVDLJpvcx9eHuYorQp4QLT+Mz2rR2lkvgJUBc=;
 b=qGeYFcQguJyat4m0Y6rli6DTb6lVeOVti6hvTMdkragSAjHgxBhjwN6/6LrJA5+6dgNiCk
 hAOU41BfwGN7U4syOz+hI6Vh/s1cKJQCsvE1hsqJPBGsLDvf+V2Ay3fDgpuTI383qbRVR5
 2+E/pcY3JoBLr04nrI3JspsG8fCFsrM=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kunwu Chan <chentao@kylinos.cn>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
 Ivan Briano <ivan.briano@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915: Use memdup_user() instead of kmalloc() and
 copy_from_user()
Date: Wed, 25 Sep 2024 16:17:46 +0200
Message-ID: <20240925141750.51198-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Use memdup_user() instead of kmalloc() followed by copy_from_user() to
simplify set_context_image().

Fixes the following Coccinelle/coccicheck warning reported by
memdup_user.cocci:

  WARNING opportunity for memdup_user

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
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
2.46.1

