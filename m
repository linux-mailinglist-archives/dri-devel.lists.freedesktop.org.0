Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F4B9550EE
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 20:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F362510E81F;
	Fri, 16 Aug 2024 18:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="YZesYvzP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9518510E81D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 18:33:37 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-5d5de0e47b9so1244018eaf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 11:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723833216; x=1724438016;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P95LtJB1nhFTYOUH2EZKp7MYs1daoi0KuRhYeJ4tGy4=;
 b=YZesYvzPySNgLRP1CENMYN0lV2kREmmqmqknemVIK92nYt9cVfMyNsTapng4YQQ1HZ
 geLrQ0V8tSHk6WB91KKRO53TKkVG5kDvsab8KwhgRF2ekaO9b+Nf0oTqpGYiSMWxTwyf
 rcKiuDFQES7QcMG7ijJfp8pZgCqPxu9ORm2mQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723833216; x=1724438016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P95LtJB1nhFTYOUH2EZKp7MYs1daoi0KuRhYeJ4tGy4=;
 b=mBn0r/xbb4b5mC7N8B81MdRLYiUyD8SdmScXXrIpeTtYQWeR8AputlPggm2cOTI1lg
 ug0mwESh4iDahKGZneekjSxgwWnq54OhnCREG4ZsjV7SNTgxzegpg0oy/y9wvwFL8x7q
 bZJj6BwMTBmPTRaMvW9geHJtF3qGkWEDkd7nzf0MjUCaa03IadSmrOgeAvYNPknyvB5g
 RJR6XaHgEtcogEibzsOuJMoU61d2Yr5bQAGWFQXLYPJItyFi1t9movNmZcYjkJSQEWZI
 l1/mlDTBAcff5sWwpMv2lXCQbe/rbGfSpdstth7GFGwyoxHcYe0AyZ7yBhni94f/W6AJ
 q27g==
X-Gm-Message-State: AOJu0YyeN5PvG+YY55OPeZpokVUrWTRM0UMsP9P9tUJlW1skFAEX/P72
 H4Ds1MDNyTxyDX6iPK7+FNj6lYtnRjPdc5PhSGXh61fzzS2RQDpfTY3LhqYkXFCYJbg0CeQwzQb
 gTWdqT8KlaC8lDACNzyBSGNH/JBMJ3iK7bVTvl8ZzOtbzC0wCiGZzti448NVGE8VBR7GUr2uVGP
 krg2F7Z4pPjS982oX145qY1TuFt/5HW5wDrNqdbMirq0ZyH1zKVw==
X-Google-Smtp-Source: AGHT+IGx0lop90/Dw2gUMjIutZqyQovKDw6FztnK7wDaypj8FZGYkH/MZWSNgxrxUCHCWkQw3OIX7w==
X-Received: by 2002:a05:6358:290b:b0:1b1:ac7f:51d5 with SMTP id
 e5c5f4694b2df-1b3a3b91aeamr69774255d.22.1723833216107; 
 Fri, 16 Aug 2024 11:33:36 -0700 (PDT)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bf6fe26c71sm20164106d6.61.2024.08.16.11.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 11:33:35 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>, stable@vger.kernel.org
Subject: [PATCH 1/3] drm/vmwgfx: Prevent unmapping active read buffers
Date: Fri, 16 Aug 2024 14:32:05 -0400
Message-ID: <20240816183332.31961-2-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240816183332.31961-1-zack.rusin@broadcom.com>
References: <20240816183332.31961-1-zack.rusin@broadcom.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The kms paths keep a persistent map active to read and compare the cursor
buffer. These maps can race with each other in simple scenario where:
a) buffer "a" mapped for update
b) buffer "a" mapped for compare
c) do the compare
d) unmap "a" for compare
e) update the cursor
f) unmap "a" for update
At step "e" the buffer has been unmapped and the read contents is bogus.

Prevent unmapping of active read buffers by simply keeping a count of
how many paths have currently active maps and unmap only when the count
reaches 0.

Fixes: 485d98d472d5 ("drm/vmwgfx: Add support for CursorMob and CursorBypass 4")
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.19+
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c | 13 +++++++++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h |  3 +++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index f42ebc4a7c22..a0e433fbcba6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -360,6 +360,8 @@ void *vmw_bo_map_and_cache_size(struct vmw_bo *vbo, size_t size)
 	void *virtual;
 	int ret;
 
+	atomic_inc(&vbo->map_count);
+
 	virtual = ttm_kmap_obj_virtual(&vbo->map, &not_used);
 	if (virtual)
 		return virtual;
@@ -383,11 +385,17 @@ void *vmw_bo_map_and_cache_size(struct vmw_bo *vbo, size_t size)
  */
 void vmw_bo_unmap(struct vmw_bo *vbo)
 {
+	int map_count;
+
 	if (vbo->map.bo == NULL)
 		return;
 
-	ttm_bo_kunmap(&vbo->map);
-	vbo->map.bo = NULL;
+	map_count = atomic_dec_return(&vbo->map_count);
+
+	if (!map_count) {
+		ttm_bo_kunmap(&vbo->map);
+		vbo->map.bo = NULL;
+	}
 }
 
 
@@ -421,6 +429,7 @@ static int vmw_bo_init(struct vmw_private *dev_priv,
 	vmw_bo->tbo.priority = 3;
 	vmw_bo->res_tree = RB_ROOT;
 	xa_init(&vmw_bo->detached_resources);
+	atomic_set(&vmw_bo->map_count, 0);
 
 	params->size = ALIGN(params->size, PAGE_SIZE);
 	drm_gem_private_object_init(vdev, &vmw_bo->tbo.base, params->size);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
index 62b4342d5f7c..43b5439ec9f7 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
@@ -71,6 +71,8 @@ struct vmw_bo_params {
  * @map: Kmap object for semi-persistent mappings
  * @res_tree: RB tree of resources using this buffer object as a backing MOB
  * @res_prios: Eviction priority counts for attached resources
+ * @map_count: The number of currently active maps. Will differ from the
+ * cpu_writers because it includes kernel maps.
  * @cpu_writers: Number of synccpu write grabs. Protected by reservation when
  * increased. May be decreased without reservation.
  * @dx_query_ctx: DX context if this buffer object is used as a DX query MOB
@@ -90,6 +92,7 @@ struct vmw_bo {
 	u32 res_prios[TTM_MAX_BO_PRIORITY];
 	struct xarray detached_resources;
 
+	atomic_t map_count;
 	atomic_t cpu_writers;
 	/* Not ref-counted.  Protected by binding_mutex */
 	struct vmw_resource *dx_query_ctx;
-- 
2.43.0

