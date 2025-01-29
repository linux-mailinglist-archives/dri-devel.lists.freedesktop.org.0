Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE26A22046
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 16:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC54910E81B;
	Wed, 29 Jan 2025 15:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V/fpZA/U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD08D10E81B;
 Wed, 29 Jan 2025 15:28:52 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so71472495e9.3; 
 Wed, 29 Jan 2025 07:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738164531; x=1738769331; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=oy9uAEFPZc5iEkwcnA+wQLhPVpGnYnqmr1wmYD9GK00=;
 b=V/fpZA/UWYbcyWwSCoEEX2jqS0U8t5xl5drbKTbhdQJxNLVi4Ws+qKL5aJKfXVuYeg
 qhlveh4xHrsdyUghzwkCU7VLZ1n1beXJm7NfVv6mEAAP8EE9iJn+U5MczHhxro7bleV/
 w0vykiZSH0npada2CWy9X27DH1nYYHbtuY/B6PXNSIlKX68PGGQCTHoClJuNiynft31o
 MSpl0JswgnUpcAqu7I6Yw5Ty21YbveHOO6u5rYai98D2b4fQkX0KMTAAnYiyngOxjJ0t
 Rqk/zwf1ELuaXHmUSyY0W6imWcEFJE5oya8l9Knpk9YwIWWO5v9WSCCUt9oGoL/NdmbC
 KDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738164531; x=1738769331;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oy9uAEFPZc5iEkwcnA+wQLhPVpGnYnqmr1wmYD9GK00=;
 b=VXJ7mz+KaW+eNSls950ukOjEilLtsmq2Y8KMCLL0l3PJBygBH3E1/wo9OPj9sTCnZK
 iWIQa7VO5gER5ABvu6WhubNTCkjeRierC8L3oX2hfzxFWRggplh/KaBR9fSvzL6N2o7A
 sS+QRN9str4w43Ub/pKOLLJ9SZhVPIhldaBFCcOm0PYxdT0ll6jlYhQ9NdvgoXxZcq2P
 7EXJYihJ6OUMBK2X4xUlxBIJlQ9/CZEBvALWd0aoQFdJAMRl3tHxl9U5XhgzYODAZNUI
 QnMj5ypepR6fra9jS47DgAsZnCvmTO0XNPSlmeRzG6nFvCY6S8JJEn9+xxdz4+yzLDhg
 SiYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyTSFKRzFMyYWmqF1ew8ZaxsOUXnz4m/hDYWfq61ZK5TavhRuYtOJd7qsHo4kNwZssUSp0bRUGek/R@lists.freedesktop.org,
 AJvYcCXZqwXex1sVGcdPjEONWZJH92u6CUiCWF/FTYtqlyKGGgp5hHpIruD6hyL5PZUHzYZvYl5kZ5KV@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9YaPHkO/RqpiFKkwGFcOR8wRlWHmSAbetfcHR8TVCEx1sGNFW
 lWFF5QM0fgcGdBMxtKQzBIxQE0t0VL8TFwDnWBZR0w1D5piXUc0v
X-Gm-Gg: ASbGncsLlyxh1rQWWvyaksE8CR0AYC/UgrPJHPzgEz/chbf1W/qg07nP5FTGunW2L+k
 JNg7YYnMCWQJUKQ3oGj+xWKMdzH41As7DFE6apJ30It6gRCFuHm/dAvLz4KPVtTJqnIBcEH/NNf
 o2e4omYeUDtLHwJj+TsYeRMLCKtfqO9oxwDdjAIgr/mooU22/2KcUJuHuCawDqWt1npqVkqa7OB
 KgcV3H3xFs5FtdYyjkmhp8G+a2PRwVEnzAhj2mKg58J2lOcMnIwVDJ+d1vknFX77HqSKYORh9ol
 Cvj/0Q29AYi96cpIoXHkqCEdN7IK
X-Google-Smtp-Source: AGHT+IFbtLeT/Xwi3taA1u3URhxFeV8wPslCx1rwXepBOAh/7LMRuauYcfHBbl6gTaNPyvmYrT4ynA==
X-Received: by 2002:a05:600c:4f83:b0:436:713b:cb31 with SMTP id
 5b1f17b1804b1-438dc3a904cmr29497085e9.3.1738164531090; 
 Wed, 29 Jan 2025 07:28:51 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:155e:6600:f980:913c:b763:f23d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc1317fsm27280455e9.8.2025.01.29.07.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 07:28:50 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: James.Zhu@amd.com, Felix.Kuehling@amd.com, Philip.Yang@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/ttm: test private resv obj on release/destroy
Date: Wed, 29 Jan 2025 16:28:48 +0100
Message-Id: <20250129152849.15777-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Test the fences in the private dma_resv object instead of the pointer to
a potentially shared dma_resv object.

This only matters for imported BOs with an SG table since those don't
get their dma_resv pointer replaced on release.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 06d6a452c4f4..4d6b2143db63 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -234,7 +234,7 @@ static void ttm_bo_delayed_delete(struct work_struct *work)
 
 	bo = container_of(work, typeof(*bo), delayed_delete);
 
-	dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP, false,
+	dma_resv_wait_timeout(&bo->base._resv, DMA_RESV_USAGE_BOOKKEEP, false,
 			      MAX_SCHEDULE_TIMEOUT);
 	dma_resv_lock(bo->base.resv, NULL);
 	ttm_bo_cleanup_memtype_use(bo);
@@ -269,7 +269,7 @@ static void ttm_bo_release(struct kref *kref)
 		drm_vma_offset_remove(bdev->vma_manager, &bo->base.vma_node);
 		ttm_mem_io_free(bdev, bo->resource);
 
-		if (!dma_resv_test_signaled(bo->base.resv,
+		if (!dma_resv_test_signaled(&bo->base._resv,
 					    DMA_RESV_USAGE_BOOKKEEP) ||
 		    (want_init_on_free() && (bo->ttm != NULL)) ||
 		    bo->type == ttm_bo_type_sg ||
-- 
2.34.1

