Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBAC61FEF7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 20:58:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B17210E3FE;
	Mon,  7 Nov 2022 19:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F64710E3FE
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 19:58:12 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id kt23so33055315ejc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 11:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1P73afq4uEFGxRapIG09H+jBzHwMHJ5yJQQ9xlWoSAQ=;
 b=FFpyQNKrmPSl1XkLLiVXx3l9fz9PcvUBX/jm8GfzSnl5BUBEld8auUfQ6MyluyeWij
 fUFu/+FpLCPqolAy0l2BcP2kxGrcKU8ByRMXJejGpxqZD7uA0jE/AVyBBs6o2Ki3aHaO
 h/jdL8OvXSmIlj6+2uu9KwCFwg8lXUDNWODlJ/YBVG1wIYmFFytSR2NTqRl1twtdcaeX
 VeIDtCejHdsY2bKRB9yQaFD9gdv/Jctc4oUR+E3X9yWk02FQwh9f35rKkkRHEXxfjHUJ
 3jCnL+2EAIdUWsExM4eWcXdQdbLwQey1RpB0rniC/3Pdt95ONLyJPg2oC2ZdLPlTM4hS
 aWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1P73afq4uEFGxRapIG09H+jBzHwMHJ5yJQQ9xlWoSAQ=;
 b=6nEsdegBtQbnv5woJ8PWpCRXczeOyY4a1IWiRIMo8U21IosHVDxZHn1vcnmTpfqhiV
 s4ZgTIiGR6nIAd+gni49gPMAE/JH4Zu8X7dh1Fze29dUfhwhDwt/tN/vYAdFpWeWzhd6
 20Y5tEj1TGPRBxnVYh/+VaAzJZA2XFZmRabG7/tZ8LuruictDTAh55ygLeleMxsy1oo8
 aTvWHDj1wNJa9jI32gPfjKpyg4/TxTU+j5ozvktSv8SB6flJnN0n2I+J64UJfxlNJDDL
 Rh2zfdrvsAHaYfGzLVaR9gx6yJJvAbBkPGR31Gj4Z/vnxxr5HHq9Z6WaGlUmSmE5TcCw
 GW5w==
X-Gm-Message-State: ACrzQf0WAIh4rcvuCcj6y6e1dxUE+He1+xtWsbwSvtCOaDXsRul6gqiL
 gQqFjGDock4we5+Y0s/tIFNJLNTvKu8=
X-Google-Smtp-Source: AMsMyM4o6Q4o2SaT81W8Kpy3cFGf4OnH/nttq0nMnvdpQC1DRGWLw2+aH9MtDda1ylBKgpyEMQmtQg==
X-Received: by 2002:a17:906:2a93:b0:78d:b87e:6aab with SMTP id
 l19-20020a1709062a9300b0078db87e6aabmr50075816eje.157.1667851090699; 
 Mon, 07 Nov 2022 11:58:10 -0800 (PST)
Received: from able.fritz.box (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a17090676c200b0073cf6ec3276sm3413810ejn.207.2022.11.07.11.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 11:58:09 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	felix.kuehling@amd.com
Subject: [PATCH] drm/ttm: optimize pool allocations a bit
Date: Mon,  7 Nov 2022 20:58:08 +0100
Message-Id: <20221107195808.1873-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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

If we got a page pool use it as much as possible.

If we can't get more pages from the pool allocate as much as possible.

Only if that still doesn't work reduce the order and try again.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 81 ++++++++++++++++++++++++----------
 1 file changed, 57 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 21b61631f73a..cf15874cf380 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -344,6 +344,27 @@ static unsigned int ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
 	return p->private;
 }
 
+/* Called when we got a page, either from a pool or newly allocated */
+int ttm_pool_page_allocated(struct ttm_pool *pool, unsigned int order,
+			    struct page *p, dma_addr_t **dma_addr,
+			    unsigned long *num_pages, struct page ***pages)
+{
+	unsigned int i;
+	int r;
+
+	if (*dma_addr) {
+		r = ttm_pool_map(pool, order, p, dma_addr);
+		if (r)
+			return r;
+	}
+
+	*num_pages -= 1 << order;
+	for (i = 1 << order; i; --i)
+		*((*pages)++) = p++;
+
+	return 0;
+}
+
 /**
  * ttm_pool_alloc - Fill a ttm_tt object
  *
@@ -385,45 +406,57 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 	for (order = min_t(unsigned int, MAX_ORDER - 1, __fls(num_pages));
 	     num_pages;
 	     order = min_t(unsigned int, order, __fls(num_pages))) {
-		bool apply_caching = false;
 		struct ttm_pool_type *pt;
 
 		pt = ttm_pool_select_type(pool, tt->caching, order);
 		p = pt ? ttm_pool_type_take(pt) : NULL;
 		if (p) {
-			apply_caching = true;
-		} else {
-			p = ttm_pool_alloc_page(pool, gfp_flags, order);
-			if (p && PageHighMem(p))
-				apply_caching = true;
-		}
-
-		if (!p) {
-			if (order) {
-				--order;
-				continue;
-			}
-			r = -ENOMEM;
-			goto error_free_all;
-		}
-
-		if (apply_caching) {
 			r = ttm_pool_apply_caching(caching, pages,
 						   tt->caching);
 			if (r)
 				goto error_free_page;
-			caching = pages + (1 << order);
+
+			while (p) {
+				r = ttm_pool_page_allocated(pool, order, p,
+							    &dma_addr,
+							    &num_pages,
+							    &pages);
+				if (r)
+					goto error_free_page;
+
+				if (num_pages < (1 << order))
+					break;
+
+				p = ttm_pool_type_take(pt);
+			}
+			caching = pages;
 		}
 
-		if (dma_addr) {
-			r = ttm_pool_map(pool, order, p, &dma_addr);
+		while (num_pages >= (1 << order) &&
+		       (p = ttm_pool_alloc_page(pool, gfp_flags, order))) {
+
+			if (PageHighMem(p)) {
+				r = ttm_pool_apply_caching(caching, pages,
+							   tt->caching);
+				if (r)
+					goto error_free_page;
+			}
+			r = ttm_pool_page_allocated(pool, order, p, &dma_addr,
+						    &num_pages, &pages);
 			if (r)
 				goto error_free_page;
+			if (PageHighMem(p))
+				caching = pages;
 		}
 
-		num_pages -= 1 << order;
-		for (i = 1 << order; i; --i)
-			*(pages++) = p++;
+		if (!p) {
+			if (order) {
+				--order;
+				continue;
+			}
+			r = -ENOMEM;
+			goto error_free_all;
+		}
 	}
 
 	r = ttm_pool_apply_caching(caching, pages, tt->caching);
-- 
2.34.1

