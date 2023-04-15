Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E6E6E2E2C
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 03:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1455D10E21B;
	Sat, 15 Apr 2023 01:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4685410EEE5;
 Sat, 15 Apr 2023 01:23:42 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1681521812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=wk6tBRL4rOUhZyc8yDlJOrUexb/aW0doiLcILhv9l7I=;
 b=K3VpJIa7/dxb0WP7AvWLftrAQNOTsaZjvZmKQ6YN2nguYFLsK6AsUuyRV9uDrC6jiWGzPD
 lganGKWEcmuOvIgBuHlfalKv3fuJVLucbbyw+e9JWAQyXZ84woRWVrjWslhuXs85CfHp9c
 omAzaAOG5TzCfmfat02AeNfKJW9OCG2hOwekQ+PE6TYZMtIjsUYjIU2xXGrikg1ws+V8IS
 bdJ/57TjCAwVw/BA+SNG8YFss8jEtMXwtWg+dZqBAbssKa0td9ruPW/8anxCcbkqwD67qg
 8bfNP4vxgc3Ums3ojYGSf6fK8w0v6DukzGWb5n0z5MF+slXH5C6fP3az35hViA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1681521812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=wk6tBRL4rOUhZyc8yDlJOrUexb/aW0doiLcILhv9l7I=;
 b=sD8RwqQUN1CEo6InqlzRlqogbgz0MsLVKyf2S6UvbYcE7yi6nc7UxCvpXgQQkjg45mnbnl
 XS7dLzTzE7fWAlDw==
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v2] drm/nouveau: fix incorrect conversion to
 dma_resv_wait_timeout()
Date: Sat, 15 Apr 2023 03:27:37 +0206
Message-Id: <20230415012137.615305-1-john.ogness@linutronix.de>
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tanmay Bhushan <007047221b@gmail.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 41d351f29528 ("drm/nouveau: stop using ttm_bo_wait")
converted from ttm_bo_wait_ctx() to dma_resv_wait_timeout().
However, dma_resv_wait_timeout() returns greater than zero on
success as opposed to ttm_bo_wait_ctx(). As a result, relocs
will fail and log errors even when it was a success.

Change the return code handling to match that of
nouveau_gem_ioctl_cpu_prep(), which was already using
dma_resv_wait_timeout() correctly.

Fixes: 41d351f29528 ("drm/nouveau: stop using ttm_bo_wait")
Reported-by: Tanmay Bhushan <007047221b@gmail.com>
Link: https://lore.kernel.org/lkml/20230119225351.71657-1-007047221b@gmail.com
Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 The original report was actually a patch that needed fixing.
 Since nobody has stepped up to fix this regression correctly,
 I'm posting the v2.

 This is a real regression introduced in 6.3-rc1.

 drivers/gpu/drm/nouveau/nouveau_gem.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index f77e44958037..346839c24273 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -645,8 +645,9 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
 				struct drm_nouveau_gem_pushbuf_reloc *reloc,
 				struct drm_nouveau_gem_pushbuf_bo *bo)
 {
-	long ret = 0;
+	int ret = 0;
 	unsigned i;
+	long lret;
 
 	for (i = 0; i < req->nr_relocs; i++) {
 		struct drm_nouveau_gem_pushbuf_reloc *r = &reloc[i];
@@ -703,13 +704,18 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
 				data |= r->vor;
 		}
 
-		ret = dma_resv_wait_timeout(nvbo->bo.base.resv,
-					    DMA_RESV_USAGE_BOOKKEEP,
-					    false, 15 * HZ);
-		if (ret == 0)
+		lret = dma_resv_wait_timeout(nvbo->bo.base.resv,
+					     DMA_RESV_USAGE_BOOKKEEP,
+					     false, 15 * HZ);
+		if (!lret)
 			ret = -EBUSY;
+		else if (lret > 0)
+			ret = 0;
+		else
+			ret = lret;
+
 		if (ret) {
-			NV_PRINTK(err, cli, "reloc wait_idle failed: %ld\n",
+			NV_PRINTK(err, cli, "reloc wait_idle failed: %d\n",
 				  ret);
 			break;
 		}

base-commit: 09a9639e56c01c7a00d6c0ca63f4c7c41abe075d
-- 
2.30.2

