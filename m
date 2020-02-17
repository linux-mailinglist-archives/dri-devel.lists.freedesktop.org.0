Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9E51621B5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 08:55:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18F56E14E;
	Tue, 18 Feb 2020 07:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5D36E916;
 Mon, 17 Feb 2020 10:16:10 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k11so18938154wrd.9;
 Mon, 17 Feb 2020 02:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1BQ3RLCCPj8Vx5ymm6Uw4hsRHsW/TZRnV/QBxLYgzPE=;
 b=WGKq+4fgVhtkETJVlVTABzl+QqNb8Jqw3m4onad5SHBssBiUMLn9bDl14TzSFtmAQI
 OZR0RVFsDB7xIsl7QZOOnhnEj9NchsUC8dtXy+L38Q1CJ7cqzTJvKoJCsvsegJumEXJT
 jwVy/cp3ibFuBis2ggJZbrzgiSOs22T2AbZHJ7/T9qe6J9zB39/u2XCQdV7inQUvim+Z
 +YtdT+B9/PaQ5DvEygmaSXfiJOeIZKl72TrAef9TwSqPwnmUT/6Eq+It5joHUagF6ce3
 QEr6kkpK+r4Ra3vEw3DmokrDnil0A4NlmEgwiISb1vknhMBxbfnUKiN7n6K0CB2WJF6r
 2zYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1BQ3RLCCPj8Vx5ymm6Uw4hsRHsW/TZRnV/QBxLYgzPE=;
 b=FHmRYADGlsxPkkOJAAr9CaDCt70I6AViU/FkhhrQ5QXELVN3GozfyBawhsEkxohyAY
 t1hPmtMok6XCKvGAE3Xoz11wXQGM1/LCON7sOag6SC8lPWsH+f87Oz7hAonUE8D0X+4o
 P4DFNcsU1lrpa3v+uJy69G/ncmPqlqZJHjmfnUTr8RAJ8G7TZNAygQ1Ybi9LvcekIPZI
 XST1IFh7yNZGO3HCEqwg29t3e06YA7L/pGlli6Ca7XypxcKMMhHxWn3O20ktWsLzQkkt
 Sr+1f0VRyopJPsuvfimhKnqB+/nRMUHbMekW3uorPDZbXnK1NUDmycPeAAI6d11iadi+
 KCYQ==
X-Gm-Message-State: APjAAAU2SVWNmREbEwS8TY/pH6RdbApciUsBP57XlwqBjdS9/asWWk5w
 +j74WojeaXrFgJBlmb/gM6UODXHocSMtZg==
X-Google-Smtp-Source: APXvYqx9rjuZR5lXX9kcxCTxETYvWNx9nB+4sQ+RnTnzCBMa2uaN7jl+//VNkVFtNdh1YfB+VuhE4g==
X-Received: by 2002:adf:e9d2:: with SMTP id l18mr21320314wrn.344.1581934569118; 
 Mon, 17 Feb 2020 02:16:09 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F261400BC111EAD619EC67C.dip0.t-ipconnect.de.
 [2003:c5:8f26:1400:bc11:1ead:619e:c67c])
 by smtp.gmail.com with ESMTPSA id a16sm278487wrt.30.2020.02.17.02.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 02:16:08 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/7] drm/ttm: do not keep GPU dependent addresses
Date: Mon, 17 Feb 2020 11:18:41 +0100
Message-Id: <20200217101841.7437-8-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217101841.7437-1-nirmoy.das@amd.com>
References: <20200217101841.7437-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 18 Feb 2020 07:55:25 +0000
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
