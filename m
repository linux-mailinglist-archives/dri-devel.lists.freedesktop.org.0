Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAF043E203
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 15:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A1F6E97F;
	Thu, 28 Oct 2021 13:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB54C6E97E;
 Thu, 28 Oct 2021 13:26:37 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 o4-20020a1c7504000000b0032cab7473caso4689730wmc.1; 
 Thu, 28 Oct 2021 06:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=e+8fJ8qEMMMqeIZ3F1ua658PpkVFhH+XcSxIsmdPPN0=;
 b=EU2MSDkmpLBlyxYoFxQDehm+rttAByW+1sx0AHb7428+3h4Vvhf1YLcR20jST2wIS8
 RXO4c/1ovzIGzUhpa5LlIvUmni6QVo2WtF5r987qIIkmV/sk0mtJQitb9a3hR8j21OiA
 xe+ZsnT1yyWgxLL2pgz2Az2eQqWioHiGPvrzswLrd5pbh4TKlFNzrx8H8solOFT5D7Uh
 zz17J9aZs0uUQl4Usmjfo4ME3mXf5A0RWr3rkXCnJKGdtzHY8v2TzjR8NzYpeEA7Fcag
 E/ZOBk/5BZlM3okACjo4dGEJ6il5FzLaGEtHpdbJRktuDrWfpoQXiloWEgBZjvTyL/NS
 6oBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e+8fJ8qEMMMqeIZ3F1ua658PpkVFhH+XcSxIsmdPPN0=;
 b=OUk7Tmk8CxXZyBIyjurdKd4+a3a3UjNcoOKbqVLKzHcQMblg0zQKcvf9G78uL8V/oM
 eEqO+Uq6OD//fp36ZMWyBvrQqEoWB9SyGq0hfQdFVt2zwvzWC3TOJlVxn+9p9DwpGtUt
 J4COTVLdUBwli69LI39SoYb+4gsL0JkNmwPImLv/561cwDJP7PZf9/c1ILpojrPQra/Z
 0IchgaC2rKDWH+H574Dswhk/Pd3Lu+aPz1EvyKBpOqYd1mraA0WWt1zt5PEdD0aTAFyg
 XIZXsYQry+g+LRpnuG/o5VQui1c47UsktFU7dPANUNJpwdslgPGwOZ52CKoRTtI5XMga
 8Dlg==
X-Gm-Message-State: AOAM5317Btlwkp7JwDMYrQ0bkqI7QR9TKJBaTKWqtFPIpBz7VemKPABj
 XBS1V2R70cGj53n59OsjrpKQ2FArgXg=
X-Google-Smtp-Source: ABdhPJxVYI6AkcFJUSk41xOEyRBmUiX5QjAXTS8UFeWQOkEEVBPh6d2GQPqGnmkDAIygbNjFjtpzsA==
X-Received: by 2002:a05:600c:17d4:: with SMTP id
 y20mr9318505wmo.113.1635427596472; 
 Thu, 28 Oct 2021 06:26:36 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l11sm2935695wrt.49.2021.10.28.06.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 06:26:35 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 etnaviv@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 5/6] RDMA: use dma_resv_wait() instead of extracting the fence
Date: Thu, 28 Oct 2021 15:26:29 +0200
Message-Id: <20211028132630.2330-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028132630.2330-1-christian.koenig@amd.com>
References: <20211028132630.2330-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Use dma_resv_wait() instead of extracting the exclusive fence and
waiting on it manually.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/infiniband/core/umem_dmabuf.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
index e824baf4640d..258ba9b8c17d 100644
--- a/drivers/infiniband/core/umem_dmabuf.c
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -13,7 +13,6 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
 {
 	struct sg_table *sgt;
 	struct scatterlist *sg;
-	struct dma_fence *fence;
 	unsigned long start, end, cur = 0;
 	unsigned int nmap = 0;
 	int i;
@@ -65,11 +64,8 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
 	 * may be not up-to-date. Wait for the exporter to finish
 	 * the migration.
 	 */
-	fence = dma_resv_excl_fence(umem_dmabuf->attach->dmabuf->resv);
-	if (fence)
-		return dma_fence_wait(fence, false);
-
-	return 0;
+	return dma_resv_wait_timeout(umem_dmabuf->attach->dmabuf->resv, false,
+				     false, MAX_SCHEDULE_TIMEOUT);
 }
 EXPORT_SYMBOL(ib_umem_dmabuf_map_pages);
 
-- 
2.25.1

