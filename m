Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DD46E2E73
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 04:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307D610E00F;
	Sat, 15 Apr 2023 02:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DD710E00F;
 Sat, 15 Apr 2023 02:04:46 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1681524285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QvcA5HnArT0juQcF/pl/UzocaIDN3s8qO05ZD9AHBzE=;
 b=WAdGjtojvZtiEi0uFTGSkIhurdv40v6CO9/2ElIZENNMe/XpJb6QqRTo7lK+AVvZ/QSaGu
 SPGx0ndC+0A0mVsTL5HcIh77lBq3+ojEHj/h2i1mdbQwHu5g5UQonlvrLc3bzGwj/iF8Hw
 LZAU4Yl5o+nGNAQHinyQRG/Xo7Arffk53TSjXUxrl95YRoifE4rCEgk9k6PbW/RCxbK3lg
 liSjFPsFw/KfoepDZKW8S4GVazp/pNLxibZntNctNFHBpdRExSRd8LLAIr6uNSys3ETss5
 bfw+YjOoIq+xe3QCyRsDSlzi5w7Nn3SJS2plz21OPFI94G/6w4U2OgU/zVbZdQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1681524285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QvcA5HnArT0juQcF/pl/UzocaIDN3s8qO05ZD9AHBzE=;
 b=CwlW0QiZiaCRp7T+kaLraqtWcuxFmF7F3Nw4r2zMdjo8BTw+gg7+DNlx4B/zx+6AeXqakD
 jLgy4BY6abTjgwBQ==
To: =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v3] drm/nouveau: fix incorrect conversion to
 dma_resv_wait_timeout()
In-Reply-To: <20230415012137.615305-1-john.ogness@linutronix.de>
References: <20230415012137.615305-1-john.ogness@linutronix.de>
Date: Sat, 15 Apr 2023 04:08:50 +0206
Message-ID: <87edolaomt.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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
 I just realized that the nouveau driver style prefers to scope
 variables used only in loops.

 v3: Define @lret within the for-loop.

 drivers/gpu/drm/nouveau/nouveau_gem.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index f77e44958037..ab9062e50977 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -645,7 +645,7 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
 				struct drm_nouveau_gem_pushbuf_reloc *reloc,
 				struct drm_nouveau_gem_pushbuf_bo *bo)
 {
-	long ret = 0;
+	int ret = 0;
 	unsigned i;
 
 	for (i = 0; i < req->nr_relocs; i++) {
@@ -653,6 +653,7 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
 		struct drm_nouveau_gem_pushbuf_bo *b;
 		struct nouveau_bo *nvbo;
 		uint32_t data;
+		long lret;
 
 		if (unlikely(r->bo_index >= req->nr_buffers)) {
 			NV_PRINTK(err, cli, "reloc bo index invalid\n");
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
