Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDC5B07AA5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 18:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A26510E66B;
	Wed, 16 Jul 2025 16:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JXSTUF0w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536E710E7D3;
 Wed, 16 Jul 2025 16:06:03 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso10806f8f.1; 
 Wed, 16 Jul 2025 09:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752681962; x=1753286762; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hiXRIBxyZsvqMOiIfj1pfMUoYaZtVY+txuYeW3ru9rs=;
 b=JXSTUF0wkAUrWIzmGZ5drdBQcUG/S1I2WXsRkwxCZk8/Gr6xtJhkZgGD+QwHzwWT5Z
 4pk2KhXdbrIZWBw7fZpnB9mXE2sr7jd5o4SynRjqOJacWGrlxKv8Qnk2WbAkRSQt6kAC
 grEQhk7dOD2NqyFuvOdkPVqyu4bDAdZAZb7AbL33Dsj4R5T6SnTmLdhvXr4aavuW8rSo
 H2C99gJVtanflppN0Kmqk2agasevIrd2oTTWUb0YixU9ra4f1KL9q2s4pCWCKU1xqPdG
 V7smsM1d0UrDJi3nQTcpONlYebJ1tT/gLWkPe+2yT9qV1W6dKG5mxQs0e6WxnVHwkFaA
 eTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752681962; x=1753286762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hiXRIBxyZsvqMOiIfj1pfMUoYaZtVY+txuYeW3ru9rs=;
 b=bdvn0o/jVZ759FbR9J0Uz4EY1S3DsJzS6gQm7NKP9YTCWB6RgsxcTAGKb3AnmazSAw
 hvvFQN2u4mx0v/aXzpmeKiSwxrq99B0q4mvuvR+opY9wvllVPJnRhjABsTdHsp+9mQRO
 iwHP8oIpR9X79RRgnG3dZAe8HzOWDZrP6dPjFZwLZJDOE+iurbQLcQzsayUp6NE0GxdA
 yE5uG+mMil8HaKur2DGulzLmrZoCBt6NmG2i9BNyrchSsOtI/8LSMk0Zcsv91iMqAJ7L
 2QyTzXU7I7Wobsm3rYFOsZNp7x0k8CrFpD11QbRwOHNS+2WjGL4IEaZCzl3DThdLd55x
 BdBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7AJ2Ik72788zE23zMrsdyO/VP0lkCrq/OTMIrJ5hN4FDcxF7yLOdAm1yIn9pSjoAO2m7KX990ZEI=@lists.freedesktop.org,
 AJvYcCWJBw27pgpDTj9c1v5qM+faH1eK+Z8azHrFbPKXbFDW1GKZcXFtuWFckSFqqYYoM0c6O1iuSIiQKi4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzU7shsKRP2hEF3qrS80i/cJwxu1wCmVna6iAdSKEEWnkrYyY+C
 vys7XwaQYVTrWH/SWKw4xN3KKVxRa9w4ml9GGdKSY3uGxlEiqEmONP7l
X-Gm-Gg: ASbGncsmnL3B3ijSgetIkg2JydCapcTEj9kiMwJfbA5xlj2/R/WOSOZnyl5UlhMXsTc
 o7Qy4PMQTQ2inYiIQw/47NOLxI0U2fRs5djzVYaDQ/f8uQji0PvMs4oyEJ5BPg/cT+jvkVikh6D
 w80EI8UhKYSKV3bmXGdW4jifvzS7b4ZFQz+trULIXkWW+QEmfFQny/9j4wVjxr7wp9xbDeBqZgg
 3YGZH9EaZdLGhDXjAQJ/UwO7ZPwJsSmyRQGmdbsejKyOTxc22YE7fbIRMsr6s9Gumz0sygjEOi/
 dnoldZFBv5G1gPBDyspWFusa6MtUQczZ8+J6UnYMAVCR2Lv7Ku3Y+SE5PzrNV5GozdbqOKZjk+a
 FyXa5ypUSNgvhNKOcdNPsFfu+rnFrA1pk+XI=
X-Google-Smtp-Source: AGHT+IGENWkboVO1pWdYY0K2k1HR6gIUriGJy2W2kUQVR16MRUqtUsAni9vLF+NQbLEMVm9gujJhVw==
X-Received: by 2002:a05:6000:2101:b0:3a5:67d5:a400 with SMTP id
 ffacd0b85a97d-3b60dd7ad32mr2507198f8f.33.1752681961554; 
 Wed, 16 Jul 2025 09:06:01 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15ac:3200:9bfa:f68e:168b:a67a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e884779sm25296185e9.19.2025.07.16.09.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 09:06:01 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: [PATCH 3/7] drm/ttm: grab BO reference before locking it
Date: Wed, 16 Jul 2025 18:04:22 +0200
Message-ID: <20250716160555.20217-4-christian.koenig@amd.com>
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

Previously we always grabbed the BO reference after taking the lock, but
that isn't necessary any more.

So avoid doing that and cleanup the handling here.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index dec60a41185d..a903529c2b1f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -979,14 +979,17 @@ __ttm_bo_lru_cursor_next(struct ttm_bo_lru_cursor *curs)
 			break;
 
 		bo = res->bo;
-		if (ttm_lru_walk_trylock(curs, bo))
-			bo_locked = true;
-		else if (!arg->ticket || arg->ctx->no_wait_gpu || arg->trylock_only)
+		if (!ttm_bo_get_unless_zero(bo))
 			continue;
 
-		if (!ttm_bo_get_unless_zero(bo)) {
-			if (curs->needs_unlock)
-				dma_resv_unlock(bo->base.resv);
+		if (ttm_lru_walk_trylock(curs, bo)) {
+			bo_locked = true;
+
+		} else if (!arg->ticket || arg->ctx->no_wait_gpu ||
+			   arg->trylock_only) {
+			spin_unlock(lru_lock);
+			ttm_bo_put(bo);
+			spin_lock(lru_lock);
 			continue;
 		}
 
-- 
2.43.0

