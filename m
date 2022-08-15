Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 932A2592F6D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 15:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9894EC57D4;
	Mon, 15 Aug 2022 13:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C22C577F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 13:08:52 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id s23so3819168wmj.4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 06:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=SrPKpKxSKJBULmBef1offyMg3cqAOwV5QE9nkY47bb8=;
 b=n9NkzOMidcw1dV8fiPy3qJp0vRfelb56D6FQpASFf18p8WPt5eqtnOcoGhcEKY9Jc9
 4W9od0/3xY8tjWhLiqziMUb8TNu28gH+AtGtbF7A1JltpFk9trE4m/09BtmvVf4VnuNO
 Ey+qG2/ALu4c2blnL4MGetY6N1bh3J6S26xXXrH0axsqw0IkXo1THCwu1dfqlOM++a7k
 lLDfDYzsWH3cHYmmN1Y3DkW2PVmP0jVeMOiV7H08t0x2UE3ZPmXiDdBcTQhvkSiMQcG5
 ruXYaps2iSBDeZExveLz+XFCKPU167BGzndPDHTFShZQTfipcKAX+6gegUJtuDtsizw3
 aBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=SrPKpKxSKJBULmBef1offyMg3cqAOwV5QE9nkY47bb8=;
 b=AlKGESZ7BIG2mRz4HQuyD+gQI8AiZKuu3Yp2HzGjX+3LWwbMeLXaCzcrwRn65un7/H
 WAyLCtaBlmy/3WyUtkouSN4nLPZOF4tocIN5UtRtLJbb/gDwjFW/Hn8I2Vp1Qeg3Sdgd
 yFRJrLby5yEAE6rqabg/yTsMo89dE7cU1px2AvuJkO/MaPFthQ7jtIoK7mJMFl6QlT/7
 oZD+x7EXU5kJIiT+Qq0OLcOoFRJeoraYM7EM9ja29YP7bA/WvbyE2dEQtkVHSdvXokAz
 F5dCT5QztLnTi1PlGZcjaCTMhwDPG1Y9uEBCOiXlhjjsXPHcFZeFe5uZ5NTox3rWLkF3
 UHUw==
X-Gm-Message-State: ACgBeo2jQ9U+xAzLyWnv63j3UxWfxDGrrRCqc8fKs4pp6X8m3xh/01BQ
 9n20LzeEhdGovfgJJ7RXVXcAaIn4P+E=
X-Google-Smtp-Source: AA6agR5FOYz60dDXtDmQnkYB8nUG2e9cgawvO6H7Nc+yvQrFoGrR0dO4PyfJoddqaWiN4TyKm6XQ8A==
X-Received: by 2002:a1c:7209:0:b0:3a5:c069:25d1 with SMTP id
 n9-20020a1c7209000000b003a5c06925d1mr12843969wmc.71.1660568930391; 
 Mon, 15 Aug 2022 06:08:50 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a05600c0a0700b003a5c2abc412sm10487449wmp.44.2022.08.15.06.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 06:08:49 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	dmitry.osipenko@collabora.com
Subject: [PATCH] drm/ttm: prevent grabbing page references
Date: Mon, 15 Aug 2022 15:08:48 +0200
Message-Id: <20220815130848.33492-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TTM owns the pages it uses for backing buffer objects with system
memory. Because of this it is absolutely illegal to mess around with
the reference count of those pages.

So make sure that nobody ever tries to grab an extra reference on
pages allocated through the page pool.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 1bba0a0ed3f9..cbca84dbd83f 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -93,8 +93,17 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
 
 	if (!pool->use_dma_alloc) {
 		p = alloc_pages(gfp_flags, order);
-		if (p)
+		if (p) {
 			p->private = order;
+
+			/* The pages are fully owned by TTM and because of this
+			 * it's illegal to grab extra references to it or
+			 * otherwise we corrupt TTMs internal state. Make sure
+			 * nobody tries to ever increase the reference count of
+			 * those pages.
+			 */
+			set_page_count(p, 0);
+		}
 		return p;
 	}
 
@@ -144,6 +153,9 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
 #endif
 
 	if (!pool || !pool->use_dma_alloc) {
+		/* See alloc why references to TTMs pages are illegal */
+		WARN_ON(page_count(p));
+		set_page_count(p, 1);
 		__free_pages(p, order);
 		return;
 	}
-- 
2.25.1

