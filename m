Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2927D9EAFCD
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 12:26:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DFB10E899;
	Tue, 10 Dec 2024 11:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="XgSC9Z8i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7360E10E69C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 09:49:32 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-7b6c54037eeso158811285a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 01:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1733737771; x=1734342571;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6mWiopPXLC0E2jCzFzYGxckwBzYIb+nvAh0QWTdhx8g=;
 b=XgSC9Z8iFZFiHs0kdsald8iSJ8x8muGBfN0erhitkydH85gtN9jwbqnLPo8Yiw+wTs
 N1BhfUtUemyBRETtnpsNcUjf6Ss75ueqY0ti5psX5vn8h+iI1qbDinOnViXpFP5xm+bh
 2adh3GPwJeGynmbjdsYHeOWYDNOXuDMD5/cDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733737771; x=1734342571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6mWiopPXLC0E2jCzFzYGxckwBzYIb+nvAh0QWTdhx8g=;
 b=ezrzvQncMQEOY7BxQNhGzStJhTuBWIMCjUgA5ByhMF9gGN2aNTYXKMXKUiOPaabU/c
 J7ZTzi+p8W0wV8nItZgfhNS7KsUlikXJ/eLiOqeyAXaHw6Nt9ZFNIiqzdi1+mTM17c2c
 8Rhw8nOWjkwoGVXAOA7NwLoxmmhwqh4XKs0WcRBtcIvLH2s2dhbSyow0b+jSop9a0TCo
 Bh+I0kEEo4bfiQ5RKqRZmkLes3NubfbU9UCTUdftGRVZpZzYFxHwVeW8cBVm+UXBXjBK
 97n0xDY0B8zW6GkMu8adcEmQabkRQ62eBpodjlfc87Rfy5+fj6YhoCckfjxOg/exJMqJ
 tOgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeOqHoOvyfXOb8ZnzAnoYQto68fKgoJuOgv6GIXGWeOCCdmv7UNC0DXE7WQGBstOYY6E08mq24TOw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyjtQrWpNWKscJ24+S7840cXUCCgyxM24jpy/0S8agMz17f1Tx
 euQSgpOkr2xVCoYi1bPVZyQlbIe4LmLd5fXuZb+EuMVb30R2M1wfuR4y2JB5DJte8lU3tiPVAEE
 2+A==
X-Gm-Gg: ASbGncs1hpm+orCWLURVpXwYwwVQWX+MsPwJZm2teypbirHsKgqL1l29hnN/Y1Buikd
 Qq9FhBnJBY1l00PNSIpgR+r6+qtJxLJiJdjyt4VKjC7SpMPnz4LfscI84GdsmttNMaBvUJPo7gi
 qd5K0mJA5b1yDnCyqwgFmP6GLLPJ3VNRzi51MCXpN6OBJrWGFUOsseHEC6d3l8ckHfdVXkP/LVi
 i2UsqOmOGn5ldGXK6E6xaMB0tAVZ00JjnZs2AEiHup3TH3eHV/kCp2LXz8U5sIZGWKarLdHglU0
 IS4=
X-Google-Smtp-Source: AGHT+IEObkVCtOQT4fNMbgxB5Nqu4MxqQq+rw6lVugndMt9B/jEobcI08TaHej9/2Iw6d1G3VLBEcA==
X-Received: by 2002:a05:620a:3185:b0:7b6:cf5c:de1 with SMTP id
 af79cd13be357-7b6cf5c1004mr662955585a.31.1733737771439; 
 Mon, 09 Dec 2024 01:49:31 -0800 (PST)
Received: from photon-dev.. ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b6d2147ff2sm128409085a.70.2024.12.09.01.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 01:49:30 -0800 (PST)
From: Ajay Kaher <ajay.kaher@broadcom.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: zack.rusin@broadcom.com, thomas.hellstrom@linux.intel.com,
 christian.koenig@amd.com, ray.huang@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ajay.kaher@broadcom.com,
 alexey.makhalov@broadcom.com, vasavi.sirnapalli@broadcom.com,
 Sasha Levin <sashal@kernel.org>, Ye Li <ye.li@broadcom.com>
Subject: [PATCH v6.1.y 1/2] drm/ttm: Make sure the mapped tt pages are
 decrypted when needed
Date: Mon,  9 Dec 2024 09:49:03 +0000
Message-Id: <20241209094904.2547579-2-ajay.kaher@broadcom.com>
X-Mailer: git-send-email 2.39.4
In-Reply-To: <20241209094904.2547579-1-ajay.kaher@broadcom.com>
References: <20241209094904.2547579-1-ajay.kaher@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 10 Dec 2024 11:26:10 +0000
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

From: Zack Rusin <zack.rusin@broadcom.com>

commit 71ce046327cfd3aef3f93d1c44e091395eb03f8f upstream.

Some drivers require the mapped tt pages to be decrypted. In an ideal
world this would have been handled by the dma layer, but the TTM page
fault handling would have to be rewritten to able to do that.

A side-effect of the TTM page fault handling is using a dma allocation
per order (via ttm_pool_alloc_page) which makes it impossible to just
trivially use dma_mmap_attrs. As a result ttm has to be very careful
about trying to make its pgprot for the mapped tt pages match what
the dma layer thinks it is. At the ttm layer it's possible to
deduce the requirement to have tt pages decrypted by checking
whether coherent dma allocations have been requested and the system
is running with confidential computing technologies.

This approach isn't ideal but keeping TTM matching DMAs expectations
for the page properties is in general fragile, unfortunately proper
fix would require a rewrite of TTM's page fault handling.

Fixes vmwgfx with SEV enabled.

v2: Explicitly include cc_platform.h
v3: Use CC_ATTR_GUEST_MEM_ENCRYPT instead of CC_ATTR_MEM_ENCRYPT to
limit the scope to guests and log when memory decryption is enabled.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Fixes: 3bf3710e3718 ("drm/ttm: Add a generic TTM memcpy move for page-based iomem")
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Acked-by: Christian König <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: <stable@vger.kernel.org> # v5.14+
Link: https://patchwork.freedesktop.org/patch/msgid/20230926040359.3040017-1-zack@kde.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Ye Li <ye.li@broadcom.com>
Signed-off-by: Ajay Kaher <ajay.kaher@broadcom.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 13 +++++++++++--
 drivers/gpu/drm/ttm/ttm_tt.c      | 12 ++++++++++++
 include/drm/ttm/ttm_tt.h          |  7 +++++++
 3 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index fa04e62..dcb2c23 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -274,7 +274,13 @@ pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct ttm_resource *res,
 	enum ttm_caching caching;
 
 	man = ttm_manager_type(bo->bdev, res->mem_type);
-	caching = man->use_tt ? bo->ttm->caching : res->bus.caching;
+	if (man->use_tt) {
+		caching = bo->ttm->caching;
+		if (bo->ttm->page_flags & TTM_TT_FLAG_DECRYPTED)
+			tmp = pgprot_decrypted(tmp);
+	} else  {
+		caching = res->bus.caching;
+	}
 
 	return ttm_prot_from_caching(caching, tmp);
 }
@@ -317,6 +323,8 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
 		.no_wait_gpu = false
 	};
 	struct ttm_tt *ttm = bo->ttm;
+	struct ttm_resource_manager *man =
+			ttm_manager_type(bo->bdev, bo->resource->mem_type);
 	pgprot_t prot;
 	int ret;
 
@@ -326,7 +334,8 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
 	if (ret)
 		return ret;
 
-	if (num_pages == 1 && ttm->caching == ttm_cached) {
+	if (num_pages == 1 && ttm->caching == ttm_cached &&
+	    !(man->use_tt && (ttm->page_flags & TTM_TT_FLAG_DECRYPTED))) {
 		/*
 		 * We're mapping a single page, and the desired
 		 * page protection is consistent with the bo.
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index d505603..91e1797 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -31,11 +31,13 @@
 
 #define pr_fmt(fmt) "[TTM] " fmt
 
+#include <linux/cc_platform.h>
 #include <linux/sched.h>
 #include <linux/shmem_fs.h>
 #include <linux/file.h>
 #include <linux/module.h>
 #include <drm/drm_cache.h>
+#include <drm/drm_device.h>
 #include <drm/ttm/ttm_bo_driver.h>
 
 #include "ttm_module.h"
@@ -59,6 +61,7 @@ static atomic_long_t ttm_dma32_pages_allocated;
 int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
 {
 	struct ttm_device *bdev = bo->bdev;
+	struct drm_device *ddev = bo->base.dev;
 	uint32_t page_flags = 0;
 
 	dma_resv_assert_held(bo->base.resv);
@@ -80,6 +83,15 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
 		pr_err("Illegal buffer object type\n");
 		return -EINVAL;
 	}
+	/*
+	 * When using dma_alloc_coherent with memory encryption the
+	 * mapped TT pages need to be decrypted or otherwise the drivers
+	 * will end up sending encrypted mem to the gpu.
+	 */
+	if (bdev->pool.use_dma_alloc && cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
+		page_flags |= TTM_TT_FLAG_DECRYPTED;
+		drm_info(ddev, "TT memory decryption enabled.");
+	}
 
 	bo->ttm = bdev->funcs->ttm_tt_create(bo, page_flags);
 	if (unlikely(bo->ttm == NULL))
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index b7d3f38..9cbdf8c 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -79,6 +79,12 @@ struct ttm_tt {
 	 *   page_flags = TTM_TT_FLAG_EXTERNAL |
 	 *		  TTM_TT_FLAG_EXTERNAL_MAPPABLE;
 	 *
+	 * TTM_TT_FLAG_DECRYPTED: The mapped ttm pages should be marked as
+	 * not encrypted. The framework will try to match what the dma layer
+	 * is doing, but note that it is a little fragile because ttm page
+	 * fault handling abuses the DMA api a bit and dma_map_attrs can't be
+	 * used to assure pgprot always matches.
+	 *
 	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT USE. This is
 	 * set by TTM after ttm_tt_populate() has successfully returned, and is
 	 * then unset when TTM calls ttm_tt_unpopulate().
@@ -87,6 +93,7 @@ struct ttm_tt {
 #define TTM_TT_FLAG_ZERO_ALLOC		(1 << 1)
 #define TTM_TT_FLAG_EXTERNAL		(1 << 2)
 #define TTM_TT_FLAG_EXTERNAL_MAPPABLE	(1 << 3)
+#define TTM_TT_FLAG_DECRYPTED		(1 << 4)
 
 #define TTM_TT_FLAG_PRIV_POPULATED  (1U << 31)
 	uint32_t page_flags;
-- 
2.39.4

