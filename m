Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 268CDB00577
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 16:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CF810E8EB;
	Thu, 10 Jul 2025 14:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K/KH6nky";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0BA10E8E8;
 Thu, 10 Jul 2025 14:41:32 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4530921461aso7398275e9.0; 
 Thu, 10 Jul 2025 07:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752158491; x=1752763291; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SdHIeHcxEfDz129fQTVMcTDcqzS760k77rUUBAZYQ1k=;
 b=K/KH6nkycK2Uwqk9A86BJm7Cl666Dk2uOS146voRmXrBAiygL7jyob2ZX61y0QOMh4
 cSQy2w+o84l3CaDzqFkeIIoGGbddaAeTTwUfokK5cyvdWYH22rFBFDMgBRdilPW1vDMZ
 YcJ+tt7Yl0rDo66Rgk0AZ6i8ALBNiOlwRJLC7QVM2orLaV11wF8fwGry6cQYIhWfzaS2
 ihikOQqxr+KXzqOvjqMMOVBis84xuenihnzWnqo92MIABuX2QE5kn3o6mrCVEpCP7EZO
 IpmgP+2JW+b0h9RLGWZg0u7McIQneCSjaEGRa1VBYqsfKJCn5Kul/rWt95yTJ4aQ+aRM
 Xm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752158491; x=1752763291;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SdHIeHcxEfDz129fQTVMcTDcqzS760k77rUUBAZYQ1k=;
 b=lVpV1QXWgmOpZxYtfl1RleGW7R0xhIF7OxOhT3+wvBCyRnyHMOgGeyuhJs+72DX/qF
 3inSSvsjWlbmFqF1SN0Laeol4zk8ROMASmV+QkGIN23ITO9r3jG3/ehIbMfnVM0AGuB7
 2mjDfZkam/X6fRJ4Ga0D6AVPxi+3xMnntUqvWy9AD6Kc1/fydeDM44szLGZ/Nr0p2p0R
 ima+fg0XHgXwXdyVwqeoyZRJFN6Z5E8HjVolOv5DCGdODHbpg3cuFXFiQh2EkdkdGK+t
 n+6QqETsb8NJae8W5xPAVq4nwCnJ4GqJEdKc0Oeght7COBo+80i01AxOFc+vYpidAHaW
 gMlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKSRS8SKuaoNUHYVxLOWTeRK2V/kykcSbAfH3tMblU7WyU9w+/vX1XBoUJf2N171Fe/wGT6oUvVDw=@lists.freedesktop.org,
 AJvYcCVUZ2+j0LJSBEM9uSX9k7EDcrGIoEjRGHlE3sEVhAQgI/4vfT6n2/9+lx31NTQdpmKcLGXFfaZLG9I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxj225kxvoiG6zOIHTVB/hnGHy2lYj6aG9op0M6a+QWSi5VNPgc
 Zr5HgICQjEjNaxfgo6ny6yYn+MtBpPreQTS3s3u+JKNAP+E+QXnOcpCc
X-Gm-Gg: ASbGncvnp5gSXSN2g1WA0jDEmz/htgYbwlJnx/1iiOsSgqwJWk4lvV9ELaQd9p4jKjg
 AVhs2AlSp7gQzvRQURWGfLUw8ZMqpQa49N3uMEZXOgaNxnVV/GqYPS7hnM0JbjAh7KKCOFVGsPA
 vYdF5aot1B06PjUYnQETnfANVlNMKVnXLEtLc8qsLV5eZ/WVuo9OPqfupD18Bceeo8rSrfZxZ5P
 P18ZLy7s3sjMO/Kmx53SVveNVpvn8zBvrrqwPRGob13OII0B2WDN275Hr6LiXDkDghw1jmJ0lBF
 qK4v6qhO2ev8phzjq4Q8AMWuSD9X3NHluJuY8ly9o9+zb82q/VuUKk0IHraOeSyBGxjYBVG/8Yq
 cuAnCxfMUboQ=
X-Google-Smtp-Source: AGHT+IF9hyLVfNy7C0saRHdEdqmCReFru0jl87iQhbH0hOVDtkswfKG4wbOMgh3NGTAOpgN9OwLuZw==
X-Received: by 2002:a05:600c:888d:b0:43c:f1b8:16ad with SMTP id
 5b1f17b1804b1-454d5589236mr59206745e9.30.1752158491129; 
 Thu, 10 Jul 2025 07:41:31 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:152f:d800:cb54:c4ae:36fb:9b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454dd540a95sm21670525e9.29.2025.07.10.07.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 07:41:30 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/ttm: remove ttm_bo_validate_swapout test
Date: Thu, 10 Jul 2025 16:41:29 +0200
Message-Id: <20250710144129.1803-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710144129.1803-1-christian.koenig@amd.com>
References: <20250710144129.1803-1-christian.koenig@amd.com>
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

The test is quite fragile since it tries to allocate halve available system
memory + 1 page.

If the system has either not enough memory to make the allocation work
with other things running in parallel or to much memory so the allocation
fails as to large/invalid the test won't fail.

Completely remove the test. We already validate swapout on the device
level and that test seems to be stable.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 51 -------------------
 1 file changed, 51 deletions(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
index 38f476787302..1bcc67977f48 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
@@ -758,56 +758,6 @@ static void ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
 	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
 }
 
-static void ttm_bo_validate_swapout(struct kunit *test)
-{
-	unsigned long size_big, size = ALIGN(BO_SIZE, PAGE_SIZE);
-	enum ttm_bo_type bo_type = ttm_bo_type_device;
-	struct ttm_buffer_object *bo_small, *bo_big;
-	struct ttm_test_devices *priv = test->priv;
-	struct ttm_operation_ctx ctx = { };
-	struct ttm_placement *placement;
-	u32 mem_type = TTM_PL_TT;
-	struct ttm_place *place;
-	struct sysinfo si;
-	int err;
-
-	si_meminfo(&si);
-	size_big = ALIGN(((u64)si.totalram * si.mem_unit / 2), PAGE_SIZE);
-
-	ttm_mock_manager_init(priv->ttm_dev, mem_type, size_big + size);
-
-	place = ttm_place_kunit_init(test, mem_type, 0);
-	placement = ttm_placement_kunit_init(test, place, 1);
-
-	bo_small = kunit_kzalloc(test, sizeof(*bo_small), GFP_KERNEL);
-	KUNIT_ASSERT_NOT_NULL(test, bo_small);
-
-	drm_gem_private_object_init(priv->drm, &bo_small->base, size);
-
-	err = ttm_bo_init_reserved(priv->ttm_dev, bo_small, bo_type, placement,
-				   PAGE_SIZE, &ctx, NULL, NULL,
-				   &dummy_ttm_bo_destroy);
-	KUNIT_EXPECT_EQ(test, err, 0);
-	dma_resv_unlock(bo_small->base.resv);
-
-	bo_big = ttm_bo_kunit_init(test, priv, size_big, NULL);
-
-	dma_resv_lock(bo_big->base.resv, NULL);
-	err = ttm_bo_validate(bo_big, placement, &ctx);
-	dma_resv_unlock(bo_big->base.resv);
-
-	KUNIT_EXPECT_EQ(test, err, 0);
-	KUNIT_EXPECT_NOT_NULL(test, bo_big->resource);
-	KUNIT_EXPECT_EQ(test, bo_big->resource->mem_type, mem_type);
-	KUNIT_EXPECT_EQ(test, bo_small->resource->mem_type, TTM_PL_SYSTEM);
-	KUNIT_EXPECT_TRUE(test, bo_small->ttm->page_flags & TTM_TT_FLAG_SWAPPED);
-
-	ttm_bo_put(bo_big);
-	ttm_bo_put(bo_small);
-
-	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
-}
-
 static void ttm_bo_validate_happy_evict(struct kunit *test)
 {
 	u32 mem_type = TTM_PL_VRAM, mem_multihop = TTM_PL_TT,
@@ -1202,7 +1152,6 @@ static struct kunit_case ttm_bo_validate_test_cases[] = {
 	KUNIT_CASE(ttm_bo_validate_move_fence_signaled),
 	KUNIT_CASE_PARAM(ttm_bo_validate_move_fence_not_signaled,
 			 ttm_bo_validate_wait_gen_params),
-	KUNIT_CASE(ttm_bo_validate_swapout),
 	KUNIT_CASE(ttm_bo_validate_happy_evict),
 	KUNIT_CASE(ttm_bo_validate_all_pinned_evict),
 	KUNIT_CASE(ttm_bo_validate_allowed_only_evict),
-- 
2.34.1

