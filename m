Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2BF163EC7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 09:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9E86E9DB;
	Wed, 19 Feb 2020 08:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0DDE6EA58;
 Tue, 18 Feb 2020 18:02:34 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id e8so2587752wrm.5;
 Tue, 18 Feb 2020 10:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1BQ3RLCCPj8Vx5ymm6Uw4hsRHsW/TZRnV/QBxLYgzPE=;
 b=l4/WcLwljStdpK8xJerFkLX0pzH1B/09ZpDCAWFnn/iXFHX+/TC+U0Z8QcbkakyryX
 DrFV3j9LUMNLZS/MU6YyMRVZDdM7+fTfKwJxDnkNyKXqkc8R/XSx9CrEfTELvbrLNkX8
 1M0IC2PMSfSl8r9fbOGae7Yw5IJYkbqSSIiurIL3JD3TCHluZzMH8ZukqvgnIxmmD9/c
 uOKJ8So8CgzctfpjZl/Tt1Y87/kApQ+acSzUmKPPUI4lRt7b7/DPmT+uo+KR0MAahyy0
 vqX/dP90xZZtzlp5VUJfP7oc3j1P+dhbATAClUXK16JbBKbiTn3MLK+vZpu39fWS6e8u
 CJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1BQ3RLCCPj8Vx5ymm6Uw4hsRHsW/TZRnV/QBxLYgzPE=;
 b=oir5lanoNKgckAAfznY+46IJeI6PEeiF3BjEd56BdXBJaL+Q0+5o2EflEKCXgmGcpF
 Vw1SUmAIMvImtD57fjUFhxBWi2rMtASCrCwA6se633cmHR1CDZrG4kCijBETI2S8DK+h
 WJf1v0XOrhnYalL0DspZeLc65sUfAK3mt63o7ZfVXQqW1ayslFpD4gEjAoiZUx4tv7qB
 z+ltvNlxCG7DZ7lSPRQjyT/mOVUVZFY9KZv2fsAM+sxfdKta++x0XtNUKqS776qT/MfZ
 RoY+lxRDF3xS/SX3bfOgWYe1C1ujiRCm8zEfVj20+OTGD16i0bbr1exL7cq/2wprkRI7
 rjYA==
X-Gm-Message-State: APjAAAVglR+Lc507nOx8ZxPdEwnQDEyJjyhMgubjYy1dKmz+MkqCTUst
 Q0dkYnjxxUmFRPY0w2EZkS775ZVQG8UPDg==
X-Google-Smtp-Source: APXvYqwngObjeBQP1nhQc9KdSyytkg8UO2CaXjfzedplkmYcPgcZXTcZEeEjO2TqESVAvpvmLhmcwg==
X-Received: by 2002:a05:6000:124b:: with SMTP id
 j11mr28139784wrx.285.1582048952835; 
 Tue, 18 Feb 2020 10:02:32 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F2CE900751228326401B174.dip0.t-ipconnect.de.
 [2003:c5:8f2c:e900:7512:2832:6401:b174])
 by smtp.gmail.com with ESMTPSA id d16sm7872733wrg.27.2020.02.18.10.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 10:02:31 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 8/8] drm/ttm: do not keep GPU dependent addresses
Date: Tue, 18 Feb 2020 19:04:54 +0100
Message-Id: <20200218180454.81866-9-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200218180454.81866-1-nirmoy.das@amd.com>
References: <20200218180454.81866-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Feb 2020 08:19:59 +0000
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GPU address handling is device specific and should be handle by its device
driver.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c    | 7 -------
 include/drm/ttm/ttm_bo_api.h    | 2 --
 include/drm/ttm/ttm_bo_driver.h | 1 -
 3 files changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 151edfd8de77..d5885cd609a3 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -85,7 +85,6 @@ static void ttm_mem_type_debug(struct ttm_bo_device *bdev, struct drm_printer *p
 	drm_printf(p, "    has_type: %d\n", man->has_type);
 	drm_printf(p, "    use_type: %d\n", man->use_type);
 	drm_printf(p, "    flags: 0x%08X\n", man->flags);
-	drm_printf(p, "    gpu_offset: 0x%08llX\n", man->gpu_offset);
 	drm_printf(p, "    size: %llu\n", man->size);
 	drm_printf(p, "    available_caching: 0x%08X\n", man->available_caching);
 	drm_printf(p, "    default_caching: 0x%08X\n", man->default_caching);
@@ -345,12 +344,6 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 moved:
 	bo->evicted = false;
 
-	if (bo->mem.mm_node)
-		bo->offset = (bo->mem.start << PAGE_SHIFT) +
-		    bdev->man[bo->mem.mem_type].gpu_offset;
-	else
-		bo->offset = 0;
-
 	ctx->bytes_moved += bo->num_pages << PAGE_SHIFT;
 	return 0;
 
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index b9bc1b00142e..d6f39ee5bf5d 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -213,8 +213,6 @@ struct ttm_buffer_object {
 	 * either of these locks held.
 	 */
 
-	uint64_t offset; /* GPU address space is independent of CPU word size */
-
 	struct sg_table *sg;
 };
 
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
index c9e0fd09f4b2..c8ce6c181abe 100644
--- a/include/drm/ttm/ttm_bo_driver.h
+++ b/include/drm/ttm/ttm_bo_driver.h
@@ -177,7 +177,6 @@ struct ttm_mem_type_manager {
 	bool has_type;
 	bool use_type;
 	uint32_t flags;
-	uint64_t gpu_offset; /* GPU address space is independent of CPU word size */
 	uint64_t size;
 	uint32_t available_caching;
 	uint32_t default_caching;
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
