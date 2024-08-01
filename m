Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57241945253
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 19:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3BC10E065;
	Thu,  1 Aug 2024 17:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="HW70cE7w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FB410E065
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 17:55:59 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-7105043330aso1695847b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2024 10:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1722534958; x=1723139758;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3fdN3/DLiamzo5QjdRkCvIbvGru1UX7f39kFhf5XVSE=;
 b=HW70cE7woabPNPONfjUB8ANQyRffXblhuLsey8i9EdI/wTCbjsHxNSijeqdQFVg1X+
 u/9159Qs4u0wHp8w0hv4gjMBU1mOwOvL5zNiBZ3nA5ZS8D6kgCYoJC1k2eHAvZOjgrMT
 eaucTstxZ+PdJvUqvrWbW975u47UoAL3xEhGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722534958; x=1723139758;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3fdN3/DLiamzo5QjdRkCvIbvGru1UX7f39kFhf5XVSE=;
 b=GeR8PExSmERgxIfwfO/xmICtkD+yJvzUKgxxVNVngtwoL4GH/9TYZeUrQT/+tnYPxM
 eoFo4GwFMIKdU0VT946DLxZ1wrguhLdlx0f9jvEkatnTRKYpDJkyIcclHo4PtjMgp8Q7
 DdPEliS48+jGedN5Y2yfBitujPJrokkR43tVLT5zqhpXJmTf0kJP41EnRoumf/f4cr4/
 uahfz/hMNSZ3yc2xJfhk04MaKznPUM6qS+4LU2Y2AeexrJNzvcN2ESyJPJTfWa7mCzxI
 /0P8R0Mwb9pkZuLmunbLS1LE4ZQBmz4ZLEPDJ1wzu2s30Ai9SmDHn10DCfR4K4fhckzs
 DqvQ==
X-Gm-Message-State: AOJu0YwbAuQCtGU07B28jXrJHgRxrvsS/i+57Fv5x7f7k9K2tYeNGa7z
 jzctcC1UhVHqAIAYMuI6KqvlU4T/Abd2s4zMvQCtbfnj/2c9zHvLLO5+3F1dI054ZGZxYGLatQQ
 sAIY/++22XnJSc4jGu+L2IDOeeoNWGzrFWWh32/eDW6cf87RH74eO8jbKT4FEN3dDF0+CfG1KWg
 zmPvFGldWjSelDqpHOppWNLgL95yaXMwDyU3+sJVG9tQuqvkKOWw==
X-Google-Smtp-Source: AGHT+IGztRaX8jV6rVIE8EZ+NclDD0ImAVKFb7YTdV4ZG6l/jeJGfvm3NGI+86rosOyO2gUT6yHYGA==
X-Received: by 2002:a05:6a20:840b:b0:1c3:ff33:24b9 with SMTP id
 adf61e73a8af0-1c69954a34fmr1412376637.3.1722534958139; 
 Thu, 01 Aug 2024 10:55:58 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7106ece3c19sm103321b3a.134.2024.08.01.10.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 10:55:57 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>, stable@vger.kernel.org
Subject: [PATCH 1/2] drm/vmwgfx: Prevent unmapping active read buffers
Date: Thu,  1 Aug 2024 13:55:46 -0400
Message-ID: <20240801175548.17185-1-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.43.0
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
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h |  1 +
 2 files changed, 12 insertions(+), 2 deletions(-)

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
index 62b4342d5f7c..dc13f1e996c1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
@@ -90,6 +90,7 @@ struct vmw_bo {
 	u32 res_prios[TTM_MAX_BO_PRIORITY];
 	struct xarray detached_resources;
 
+	atomic_t map_count;
 	atomic_t cpu_writers;
 	/* Not ref-counted.  Protected by binding_mutex */
 	struct vmw_resource *dx_query_ctx;
-- 
2.43.0

