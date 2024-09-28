Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF278988F35
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2024 14:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E91110E132;
	Sat, 28 Sep 2024 12:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="gpBRX+Ep";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198A010E02A
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2024 02:39:18 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-71b0d9535c0so1953278b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 19:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1727491158; x=1728095958;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cZT9Gm3S6q8DxsqjZ2Rp3vkP4roxjo+MNxY+Zln4d6o=;
 b=gpBRX+EpSOiRV4/HqJah9Px7o+Ehu8ovrvuc8XHPBXlYbtumgX4/fX9UOw73bMDBEH
 OoMbff3c0z7nLI4m3rFcJeI4k/KnhLcCA/HD5Z0Uv9WjT+VUuKQqNLZR3ymyAoYbC0NN
 11ll4ZOCg4gBLTxG+xgGuig6EHtzjZ6P8K2qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727491158; x=1728095958;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cZT9Gm3S6q8DxsqjZ2Rp3vkP4roxjo+MNxY+Zln4d6o=;
 b=NzAqFg5+GtTtj8JRqpSiVcV4FK5B7lcNqrxjus3FFEpyLFwxAkFYEkt9KvqkahlwRG
 7P64KLChYLt5Q7g9aFSH+ralgQAJx8NbX5XK5ggmo3BYxSwLB+OslvEyAh9/2GAD8AQH
 8eObKudMKpUjz9L1qfnNFvHHXpvRTCJo+P2345M0G8Os9zpTx9+xC9awFfuvbWUlrNha
 S6HfvUktKI/Hp5rEwJwsxcRgW92rSKdsidIUxhyLLJmuRJSR+2yrjVTgLY7Gend3YaJZ
 Rn3RFTGgWuTcyGyfohyRflZeYHPoNNt8QzOEgaL2aSrpDFTZPQYyPmiayy6bx8xiOnBh
 zOuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjNTsh1nK2QTEd+yOmESEG26DBAwkwGAltPj6Z+nU+yMviliSdsHYlXRLaDzFiunhd1aQ2BvV6Kak=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOr3IMdE9/2NW25EKZpPhemb1pbgPfxUkuRUetxXyD+vJz3PFj
 xp5351u6AtQ1aEc3uXaZED6irwgYEZDyXxw2RHgtIXQ9yQNuWzy14tGc53lZ4A==
X-Google-Smtp-Source: AGHT+IFKS7D4fABzjLCVOL0jPF/qivnq4j2bKZDUVAsulCQwvpOLfV216FHbRIKYyK6JEesnwc2drw==
X-Received: by 2002:a05:6a00:c88:b0:710:6e83:cd5e with SMTP id
 d2e1a72fcca58-71b25da6fb2mr9431095b3a.0.1727491158092; 
 Fri, 27 Sep 2024 19:39:18 -0700 (PDT)
Received: from shivania.eng.vmware.com ([66.170.99.1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71b264b7dbdsm2267550b3a.53.2024.09.27.19.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 19:39:17 -0700 (PDT)
From: Shivani Agarwal <shivani.agarwal@broadcom.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.c, krastevm@vmware.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ajay.kaher@broadcom.com, alexey.makhalov@broadcom.com,
 vasavi.sirnapalli@broadcom.com,
 Martin Krastev <martin.krastev@broadcom.com>,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
 Shivani Agarwal <shivani.agarwal@broadcom.com>
Subject: [PATCH v6.6] drm/vmwgfx: Prevent unmapping active read buffers
Date: Fri, 27 Sep 2024 19:38:55 -0700
Message-Id: <20240928023855.154766-1-shivani.agarwal@broadcom.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 28 Sep 2024 12:38:53 +0000
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

commit aba07b9a0587f50e5d3346eaa19019cf3f86c0ea upstream.

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
Link: https://patchwork.freedesktop.org/patch/msgid/20240816183332.31961-2-zack.rusin@broadcom.com
Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>
Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
[Shivani: Modified to apply on v6.6.y]
Signed-off-by: Shivani Agarwal <shivani.agarwal@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c | 13 +++++++++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h |  3 +++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index ae796e0c64aa..fdc34283eeb9 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -331,6 +331,8 @@ void *vmw_bo_map_and_cache(struct vmw_bo *vbo)
 	void *virtual;
 	int ret;
 
+	atomic_inc(&vbo->map_count);
+
 	virtual = ttm_kmap_obj_virtual(&vbo->map, &not_used);
 	if (virtual)
 		return virtual;
@@ -353,11 +355,17 @@ void *vmw_bo_map_and_cache(struct vmw_bo *vbo)
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
 
 
@@ -390,6 +398,7 @@ static int vmw_bo_init(struct vmw_private *dev_priv,
 	BUILD_BUG_ON(TTM_MAX_BO_PRIORITY <= 3);
 	vmw_bo->tbo.priority = 3;
 	vmw_bo->res_tree = RB_ROOT;
+	atomic_set(&vmw_bo->map_count, 0);
 
 	params->size = ALIGN(params->size, PAGE_SIZE);
 	drm_gem_private_object_init(vdev, &vmw_bo->tbo.base, params->size);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
index f349642e6190..156ea612fc2a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
@@ -68,6 +68,8 @@ struct vmw_bo_params {
  * @map: Kmap object for semi-persistent mappings
  * @res_tree: RB tree of resources using this buffer object as a backing MOB
  * @res_prios: Eviction priority counts for attached resources
+ * @map_count: The number of currently active maps. Will differ from the
+ * cpu_writers because it includes kernel maps.
  * @cpu_writers: Number of synccpu write grabs. Protected by reservation when
  * increased. May be decreased without reservation.
  * @dx_query_ctx: DX context if this buffer object is used as a DX query MOB
@@ -86,6 +88,7 @@ struct vmw_bo {
 	struct rb_root res_tree;
 	u32 res_prios[TTM_MAX_BO_PRIORITY];
 
+	atomic_t map_count;
 	atomic_t cpu_writers;
 	/* Not ref-counted.  Protected by binding_mutex */
 	struct vmw_resource *dx_query_ctx;
-- 
2.39.4

