Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC78652CFE8
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F10311B33F;
	Thu, 19 May 2022 09:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1895E11B32E;
 Thu, 19 May 2022 09:55:19 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id g12so6335684edq.4;
 Thu, 19 May 2022 02:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9obn04yJj9rZ0fYrM+R/7zzmeeRej2X5M8LMjJ0gWi0=;
 b=n/tVsgsWcmyradZac6/uzeqFkNT/4lCETBxjeYmM9zsE3NBJ/Nhx2CcSSNxSrmz/LS
 2QgpjgqsdXQM2zF2yfmtFQAuRfbt7gUeGGoVNR5gH4Bs2MmCF+hR+RPyTR46feE7O2r0
 QY+gryIucZyaAoWaOgc21KnGSEvNCTN/MhZMe2MLgCoPwgT6fugXFCIBnl5I2Nww2jSG
 nvhunGNUPmmtTewywm99F6huJkNMNs3aJHYKPeCGfHo+CL1JRoSqnynYBHMShOAYDuS+
 hOO2QqH90vJI3a7w1LmJGVNu/Bk1Kl4ZPsNFYd/sJ5lwrUfBu8igbgwi+DknBrGSEBjd
 PBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9obn04yJj9rZ0fYrM+R/7zzmeeRej2X5M8LMjJ0gWi0=;
 b=hwpK55TMmzN22MPHtwskQFwaiXwBv6vjOI44vQwIn3SKYakGuGRHf/Wxl9U4bk4HcW
 q0c/JKvbgb6WnUh+6hCY6uC+cpuTDKaSClj2oXUk3564breVOI77azvcmL9hK56nVKx1
 AKiKDbErunRsxeEEPjA293gRIVkf3h+Sv2aRU8JtT2ix9LcJk+ISLrN1XVFh37fQ4Nsw
 2K3Z0URFA6ITbl8xmOoK828T4FteIvFmurJhiAw9az9vkIMuS046wYzK6LY7rjIxpo6u
 6JtPUM/nnj6wvbvOarXgbschhWEsiE+vflUtRI9XnpXTDWHE+7b9p57QoQXUisj6EBDK
 VzuA==
X-Gm-Message-State: AOAM533zYB+09GML+G/0QghOgKCIWwQJdoy3xGQ7PdTHHMEUPlMMB1PM
 4tdk21fBUDDWRarFcd6QBm/sunN888s=
X-Google-Smtp-Source: ABdhPJyk8YouP1AgPJiXFa1vnw+e6DXzEY0GNjUbDy4XIJ97jM7U0EzhiUkK5QRiKI6VzNIzpdJ/yA==
X-Received: by 2002:aa7:c952:0:b0:42a:f08f:4d4c with SMTP id
 h18-20020aa7c952000000b0042af08f4d4cmr4407784edt.26.1652954117693; 
 Thu, 19 May 2022 02:55:17 -0700 (PDT)
Received: from able.fritz.box (p57b0bdaa.dip0.t-ipconnect.de. [87.176.189.170])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a170906518600b006fe9c65ffb8sm388267ejk.92.2022.05.19.02.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 02:55:17 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 07/11] drm/amdgpu: audit bo->resource usage
Date: Thu, 19 May 2022 11:55:04 +0200
Message-Id: <20220519095508.115203-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519095508.115203-1-christian.koenig@amd.com>
References: <20220519095508.115203-1-christian.koenig@amd.com>
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
Cc: matthew.william.auld@gmail.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make sure we can at least move and release BOs without backing store.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 116c8d31e646..5cf3a58bc925 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1302,7 +1302,7 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 	if (bo->base.resv == &bo->base._resv)
 		amdgpu_amdkfd_remove_fence_on_pt_pd_bos(abo);
 
-	if (bo->resource->mem_type != TTM_PL_VRAM ||
+	if (!bo->resource || bo->resource->mem_type != TTM_PL_VRAM ||
 	    !(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE) ||
 	    adev->in_suspend || adev->shutdown)
 		return;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index ec26edd4f4d8..b79c93812342 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -471,7 +471,8 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 
 	adev = amdgpu_ttm_adev(bo->bdev);
 
-	if (old_mem->mem_type == TTM_PL_SYSTEM && bo->ttm == NULL) {
+	if (!old_mem || (old_mem->mem_type == TTM_PL_SYSTEM &&
+			 bo->ttm == NULL)) {
 		ttm_bo_move_null(bo, new_mem);
 		goto out;
 	}
-- 
2.25.1

