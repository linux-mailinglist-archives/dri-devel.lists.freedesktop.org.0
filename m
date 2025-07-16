Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BABB07AA7
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 18:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE6710E7E2;
	Wed, 16 Jul 2025 16:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hAemDpeR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B1710E7DA;
 Wed, 16 Jul 2025 16:06:06 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3a4f72cba73so710212f8f.1; 
 Wed, 16 Jul 2025 09:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752681965; x=1753286765; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Pyzg6d+Fpl4BI0JGiI7+zESUkb8q/0jGrd9Qmztq5Tk=;
 b=hAemDpeRZvoZMEetJ53jl+zwDZmDMydP/bXnxSxXi7I1dgkoe2cYhtzGVTyL1QjAjq
 6i5X6r46oQNmZAQrd1nN+RhpCFGpFbNnIa4jWcsK1WRfo8+1j7DS3/Tzw5XdY4y9NyRe
 S4nw0zc2Zto6eoHMvJujIgbsmnjSs3uqAbm+3FpNIWIYhDt+M+DZBh1sYfbO9ifHCt4i
 QdtSE4wGYiOtlKwaHW7976P9jGuNgq/w834mTb60PEpYOIoMtNAUl9BCsRYHWU4vEQ3u
 vHaraHVPguQytonehEzFqN81bX31h0N+8q963QLvqo6R8gxWZoS4Y4Sxwcc51ZGlDyE4
 DWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752681965; x=1753286765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pyzg6d+Fpl4BI0JGiI7+zESUkb8q/0jGrd9Qmztq5Tk=;
 b=py46BpGdnWgTWM9ttIl9rDbJ8ucTEFxMbMMGAMnhV+h1c7J/egjDlFJds6BY605nrw
 k3lozA/uyO+SFMwJkla4CI7R8wYTcZwAE+AHIQwLXs0NHiQa1SJ/OpwgFRei48/bXxIo
 b6H6lfB2NtGMRKabQTbgycnpPbuM7q9744zEYZYVwvbPMymGuursVNq3SWIeZecDVEal
 vWOiGn/8pzvf89F0CvOA0GHxPPbxbO5m0p1mGRXJGXutpGnbFzewEo+D7WE+jGcFI1jU
 ef292bDxZHJjnaynL12A88poLm1Hm5OEbvbU+naPuCJyYpWXYKZvA8xuwH/tWUMh/K+n
 y9oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0ZxUfalolBsNXKMaMn8gXNKCulSHs1tzBspeaIxyf1pDCoo9o6miDaZXRVApvjIrBWXA25/i+QrE=@lists.freedesktop.org,
 AJvYcCVzOhzKc/QeTlFtE0M/aWqzXSfxRVelfA5qkO0ES21agYa3P2s1issVRS6jJEIA5v8RHcEQvPtd/y4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywk4laLdOSOodfhQ/U7Ncw65hEN564ZegNjn5q6ODqTzZbOrZKh
 lADYs+USijNY3xkTMkbCiD0SIGjkAfOEpPiFAdXa5XDI4LvcoyobNHG/
X-Gm-Gg: ASbGncvekhKrh0nUVexI9uHMBnwy9pEkDs1uNQjeuy8VMDn2XCsK8whlSpzWDl70pDe
 ABkSQ5BEuWSL/yohWAVT3bgBVwKvy+qyEQQouUTzl+O7/az1/N9MpLAlTs6dhTqXDEws0XadH3C
 AZ6ohAbh/9Qk9780BeutSnBFbKM4CXlbpz0q4REKoHELA4aWca99IUd6q1R1P/wqF9NLZKHSY8h
 1pjaoMbNC8lYKujQ297msWIlrz0fuYCYfTbAJbxp77LVGp2va+03GH+1PrE4I4yLjleoXAdcSZJ
 GNd5XfKq6BYTHaOXG8LopM8rrTGMqa3qPDon8lzP/vflI/TwGxSlQu3Hz8VjMd1sy1uQYXBMvHU
 EHP9MnLdIuSFJDuPNl3i1WD0hA3guBp9dHLQ=
X-Google-Smtp-Source: AGHT+IG7NgHsZk6IxKnsRJIVX5nEq9hmbAGUcs2YyjVTGE+0kpCb3I44Sx/zYKNdg9L4w576qzsNGg==
X-Received: by 2002:a5d:64e8:0:b0:3b5:f8ea:28ff with SMTP id
 ffacd0b85a97d-3b6139ca66fmr35165f8f.6.1752681964470; 
 Wed, 16 Jul 2025 09:06:04 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15ac:3200:9bfa:f68e:168b:a67a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e884779sm25296185e9.19.2025.07.16.09.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 09:06:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: [PATCH 7/7] drm/xe: remove workaround for TTM internals
Date: Wed, 16 Jul 2025 18:04:26 +0200
Message-ID: <20250716160555.20217-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716160555.20217-1-christian.koenig@amd.com>
References: <20250716160555.20217-1-christian.koenig@amd.com>
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

This should no longer be necessary, TTM doesn't lock the BO without a
reference any more.

Only compile tested!

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 32 +++++---------------------------
 1 file changed, 5 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 9411114c6d5c..250ebd9ff184 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1409,31 +1409,6 @@ static unsigned long xe_ttm_io_mem_pfn(struct ttm_buffer_object *ttm_bo,
 
 static void __xe_bo_vunmap(struct xe_bo *bo);
 
-/*
- * TODO: Move this function to TTM so we don't rely on how TTM does its
- * locking, thereby abusing TTM internals.
- */
-static bool xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
-{
-	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
-	bool locked;
-
-	xe_assert(xe, !kref_read(&ttm_bo->base.refcount));
-
-	/*
-	 * We can typically only race with TTM trylocking under the
-	 * lru_lock, which will immediately be unlocked again since
-	 * the ttm_bo refcount is zero at this point. So trylocking *should*
-	 * always succeed here, as long as we hold the lru lock.
-	 */
-	spin_lock(&ttm_bo->bdev->lru_lock);
-	locked = dma_resv_trylock(ttm_bo->base.resv);
-	spin_unlock(&ttm_bo->bdev->lru_lock);
-	xe_assert(xe, locked);
-
-	return locked;
-}
-
 static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
 {
 	struct dma_resv_iter cursor;
@@ -1454,8 +1429,11 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
 	if (ttm_bo->base.resv != &ttm_bo->base._resv)
 		return;
 
-	if (!xe_ttm_bo_lock_in_destructor(ttm_bo))
-		return;
+	/*
+	 * This should never fail since there are no other references to the BO
+	 * any more.
+	 */
+	WARN_ON(!dma_resv_trylock(ttm_bo->base.resv));
 
 	/*
 	 * Scrub the preempt fences if any. The unbind fence is already
-- 
2.43.0

