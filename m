Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D5A935102
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 19:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DEB10EA51;
	Thu, 18 Jul 2024 17:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lU/uzVAk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECA410EA4F;
 Thu, 18 Jul 2024 17:00:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AEFAD61B9A;
 Thu, 18 Jul 2024 17:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E37A5C4AF0F;
 Thu, 18 Jul 2024 17:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721322013;
 bh=qnfD1Xqe20pbRiYxKLLJvNmxefb5y9pi0lOyNaL4O9w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lU/uzVAkNqHDyO2PLGG8wkkMGhjSdZ/I9s5LEosqLOxukSmJs8yDKB8ZRr7T7pflA
 x7OkNM2FyjMwpimuG7su9f5vKqvMVjs07S9eQOuLRgx9StXTNI4L/tC9kWDbpbZ3i6
 Nrjt6+WGenlrF6w2w9/DZy1BCxNfEglfjW6FOTzMcc+0OvKfNtzdz5mI97nv+VpJyA
 Y64Ed3llHuk198BJ9QZ/qtEfH/BLvhbbAxCjKw+bZqTpEU2ksRhAbRmer1D0jDed0g
 WS+26xRRqsbCzuMS7j8SYzKdBC2S7DnqVuYOF4yOkSwtyNVu4vJjmqvCKWGBSFqca5
 JbzusmJC2jSoQ==
From: Danilo Krummrich <dakr@kernel.org>
To: lyude@redhat.com,
	airlied@redhat.com,
	christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/3] drm/nouveau: prime: fix refcount underflow
Date: Thu, 18 Jul 2024 18:58:46 +0200
Message-ID: <20240718165959.3983-2-dakr@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240718165959.3983-1-dakr@kernel.org>
References: <20240718165959.3983-1-dakr@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Calling nouveau_bo_ref() on a nouveau_bo without initializing it (and
hence the backing ttm_bo) leads to a refcount underflow.

Instead of calling nouveau_bo_ref() in the unwind path of
drm_gem_object_init(), clean things up manually.

Fixes: ab9ccb96a6e6 ("drm/nouveau: use prime helpers")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_prime.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index b58ab595faf8..cd95446d6851 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -64,7 +64,8 @@ struct drm_gem_object *nouveau_gem_prime_import_sg_table(struct drm_device *dev,
 	 * to the caller, instead of a normal nouveau_bo ttm reference. */
 	ret = drm_gem_object_init(dev, &nvbo->bo.base, size);
 	if (ret) {
-		nouveau_bo_ref(NULL, &nvbo);
+		drm_gem_object_release(&nvbo->bo.base);
+		kfree(nvbo);
 		obj = ERR_PTR(-ENOMEM);
 		goto unlock;
 	}
-- 
2.45.2

