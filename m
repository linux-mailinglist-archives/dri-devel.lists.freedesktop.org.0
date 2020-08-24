Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA77250A96
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 23:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDF66E5A9;
	Mon, 24 Aug 2020 21:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520896E598
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 21:11:29 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f442cc20001>; Mon, 24 Aug 2020 14:10:26 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 24 Aug 2020 14:11:27 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 24 Aug 2020 14:11:27 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 24 Aug
 2020 21:11:27 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 24 Aug 2020 21:11:27 +0000
Received: from sandstorm.nvidia.com (Not Verified[10.2.58.8]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f442cff0000>; Mon, 24 Aug 2020 14:11:27 -0700
From: John Hubbard <jhubbard@nvidia.com>
To: <jens.wiklander@linaro.org>
Subject: [PATCH v3] tee: convert convert get_user_pages() --> pin_user_pages()
Date: Mon, 24 Aug 2020 14:11:25 -0700
Message-ID: <20200824211125.1867329-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <CAHUa44FrxidzSUOM_JchOTa5pF6P+j8uZJA5DpKfGLWaS6tCcw@mail.gmail.com>
References: <CAHUa44FrxidzSUOM_JchOTa5pF6P+j8uZJA5DpKfGLWaS6tCcw@mail.gmail.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1598303426; bh=sPKT2vVWDEL5uCOVvAzzh/qnGwDPnupB1+gNHfgo2wA=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=DMCiLDcu/bbZ0HfTovzGNWhZ32KGT2RI2dt39vFl1huAYVropJDqFzm95VE0bDl17
 2iKl7y4XYSQN7sP9FAZMlRVcoc/USP4iaa04eQ7aXDmCVYNO767uZnlAmtC6qoBwSL
 fPhaLcdA2bU0nPQSEaYElAz9fEBZOrQj2TOCj8kKL5eZ7LC2xqisYmnZ6lgpBZP2GL
 sc1CODEDr1LwWbDI2cyEsedGFLX8WmgiHSiUuLZ80FM/PcQqRoj1db3hi3k8oT0RVD
 QHtHVMRDNGMP/tpWp7jgNH8DS27MP6YoKI7d8OAKpTnFrTMezxD/WDZj4q1zJ0GVZZ
 8N4VPH4CgRURg==
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
Cc: linaro-mm-sig@lists.linaro.org, jhubbard@nvidia.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tee-dev@lists.linaro.org, soc@kernel.org, arm@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This code was using get_user_pages*(), in a "Case 2" scenario
(DMA/RDMA), using the categorization from [1]. That means that it's
time to convert the get_user_pages*() + put_page() calls to
pin_user_pages*() + unpin_user_pages() calls.

Factor out a new, small release_registered_pages() function, in
order to consolidate the logic for discerning between
TEE_SHM_USER_MAPPED and TEE_SHM_KERNEL_MAPPED pages. This also
absorbs the kfree() call that is also required there.

There is some helpful background in [2]: basically, this is a small
part of fixing a long-standing disconnect between pinning pages, and
file systems' use of those pages.

[1] Documentation/core-api/pin_user_pages.rst

[2] "Explicit pinning of user-space pages":
    https://lwn.net/Articles/807108/

Cc: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: tee-dev@lists.linaro.org
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---

OK, one more try, this time actually handling the _USER_MAPPED vs.
_KERNEL_MAPPED pages!

thanks,
John Hubbard
NVIDIA

 drivers/tee/tee_shm.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index 827ac3d0fea9..00472f5ce22e 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -12,6 +12,22 @@
 #include <linux/uio.h>
 #include "tee_private.h"
 
+static void release_registered_pages(struct tee_shm *shm)
+{
+	if (shm->pages) {
+		if (shm->flags & TEE_SHM_USER_MAPPED) {
+			unpin_user_pages(shm->pages, shm->num_pages);
+		} else {
+			size_t n;
+
+			for (n = 0; n < shm->num_pages; n++)
+				put_page(shm->pages[n]);
+		}
+
+		kfree(shm->pages);
+	}
+}
+
 static void tee_shm_release(struct tee_shm *shm)
 {
 	struct tee_device *teedev = shm->ctx->teedev;
@@ -32,17 +48,13 @@ static void tee_shm_release(struct tee_shm *shm)
 
 		poolm->ops->free(poolm, shm);
 	} else if (shm->flags & TEE_SHM_REGISTER) {
-		size_t n;
 		int rc = teedev->desc->ops->shm_unregister(shm->ctx, shm);
 
 		if (rc)
 			dev_err(teedev->dev.parent,
 				"unregister shm %p failed: %d", shm, rc);
 
-		for (n = 0; n < shm->num_pages; n++)
-			put_page(shm->pages[n]);
-
-		kfree(shm->pages);
+		release_registered_pages(shm);
 	}
 
 	teedev_ctx_put(shm->ctx);
@@ -228,7 +240,7 @@ struct tee_shm *tee_shm_register(struct tee_context *ctx, unsigned long addr,
 	}
 
 	if (flags & TEE_SHM_USER_MAPPED) {
-		rc = get_user_pages_fast(start, num_pages, FOLL_WRITE,
+		rc = pin_user_pages_fast(start, num_pages, FOLL_WRITE,
 					 shm->pages);
 	} else {
 		struct kvec *kiov;
@@ -292,18 +304,12 @@ struct tee_shm *tee_shm_register(struct tee_context *ctx, unsigned long addr,
 	return shm;
 err:
 	if (shm) {
-		size_t n;
-
 		if (shm->id >= 0) {
 			mutex_lock(&teedev->mutex);
 			idr_remove(&teedev->idr, shm->id);
 			mutex_unlock(&teedev->mutex);
 		}
-		if (shm->pages) {
-			for (n = 0; n < shm->num_pages; n++)
-				put_page(shm->pages[n]);
-			kfree(shm->pages);
-		}
+		release_registered_pages(shm);
 	}
 	kfree(shm);
 	teedev_ctx_put(ctx);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
