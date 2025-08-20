Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 039A1B2DF8E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 16:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486E610E773;
	Wed, 20 Aug 2025 14:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iqyqbYK2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4577B10E763;
 Wed, 20 Aug 2025 14:37:45 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3c43399ea42so100139f8f.1; 
 Wed, 20 Aug 2025 07:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755700664; x=1756305464; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U93qn1UI4GgLvvq5/l1PHGQkyBBtBBh1gQ2zra+l084=;
 b=iqyqbYK2uBbl/uVAuiN7Y914Ul7lMZmNGdwxM3JR4uLibKpdLw30AKWNQSPceNxtlL
 in43v5RisMzZf2keKpALXQAG/S2L2vXpE2uuZWSUhOdpE8TMe5G4/IYs9tUBag+4M6ID
 uQnxE1XhqFf8CMAaMu73Bp3aLi1uAf55ra5hr9xjgOnuVotGv8c/WapB4c3Dm4dyDmCH
 UUcoqmjgyhL4/iA5mFjVvm5EToViPDeTIt4QVdTN3gEHBTXAGszMEqyZqiDS1lInTKWL
 zLRc/UrYv0ofaRhOjtAU/jbMgHRBYFAmJOO1uNgLt6Ko9GPhnm/jwfhKHINep+zpgzVY
 +Agw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755700664; x=1756305464;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U93qn1UI4GgLvvq5/l1PHGQkyBBtBBh1gQ2zra+l084=;
 b=sXHq/TvXzQ3Z1VWnHLsTiQH3q7c9aODonBzmc4PF4/kyviI/NM2o1bVeOwG9ZixO1i
 Mz6JBjZU4SScNft93OCdT0M9TOSaWtRp7zXTqOaDjVcwJE84gvhKkiMkqlvdTAvS9/ti
 Wy1kXMgCb0FO0aNUhdR/3tyUqjFqHdTC4bAPkEKwMoXjBABE8f1m6gHvdAgfKZBL8WSO
 F0m+3p5VgV9ag8FUVfmm5JJeHOPgPVNg3Vn3PzGhemeH35NW5hKk9hQQl+DWfMUVJoae
 5wEdzl+2O3rkdxfcknFO++oGuS/iPWwHWo6ZQx/tOL3fInPavRsLahziYMU1Z22g/4nN
 r6Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsS+kTw7mkW3G3IRHtX2KWjZh6kK0lLlmz4Z7EPXKFrmybps/xIXdBiwo0R8MoerTaprLyUo/ieiNe@lists.freedesktop.org,
 AJvYcCWGvMnNP/QChQ8oP17Wk+DJE9S8/7QV16SfNaVKKw6BfOxcW3VYOmleA1rS7HeVhzdc6BFrCvwQTjLF@lists.freedesktop.org,
 AJvYcCWr8/WUn03VqD64pSL1HBLOfZeiskB0o9fe29Z4fY8FINdgcSNPAtQg/idSWWHZ2WgYGfkUut+p@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/LBgnSpEQkoolqAOb7USJNN+1PZjwJbmh5wHtvkICw0k5b1Hb
 8oQG7pObPvLkTmvs/wTc13dOjbiZonPvJhVcz7gGlROLDP4f7xrtrRWVDJ9C+w==
X-Gm-Gg: ASbGncsmlUhp8rxSxhHpt8Dww1nki8QbcKQALgrI05Qu+eW8zcl3CDflRPIWKAOyd5h
 Ak+gMzDxpzHDOy3ddP4+pUJvnxdZeIlZF0xPYHSfzoz403FBrcOUk7jt2MHq6DQ1fQHkC3cyGTl
 qNifqUFg3eZ0UMvES/tGyECWe12B0NtHU6uFxEQChamBdFpfXl2QBbeNNsPyeO8MTTlQ/9xZjJa
 u/OVnWIjXeB8xtm9v65g5sWn6dhyVRJKIA3oUvSQq1B2it9gniNpC0I3vbshJgpauyFH+wizk31
 BZDVAfCfQ8hL/tm7jnUylyTKfkUgOeM1YgKVorGA5zioMjbwY44KQnDFxELAS2OeWQii95uUo7J
 VHWQeURsruShTYS5FewhXH2m7aAZQjc20Ldc=
X-Google-Smtp-Source: AGHT+IGHnY+xzvcrQ5hyWZUlPpr8s1blNaaIOPtNGq3up/JF10lJZO05uK8+JU2BKECGJiw0dUwbRg==
X-Received: by 2002:a5d:5d83:0:b0:3b8:fb9d:248a with SMTP id
 ffacd0b85a97d-3c32c910b55mr2490836f8f.24.1755700663645; 
 Wed, 20 Aug 2025 07:37:43 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1579:3800:9446:56c7:e203:3b9c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c074d43ba5sm8090404f8f.22.2025.08.20.07.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 07:37:43 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 x86@kernel.org
Cc: airlied@gmail.com, thomas.hellstrom@linux.intel.com,
 matthew.brost@intel.com, david@redhat.com, dave.hansen@linux.intel.com,
 luto@kernel.org, peterz@infradead.org
Subject: [PATCH 2/3] drm/ttm: reapply increase ttm pre-fault value to PMD size"
Date: Wed, 20 Aug 2025 16:33:12 +0200
Message-ID: <20250820143739.3422-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820143739.3422-1-christian.koenig@amd.com>
References: <20250820143739.3422-1-christian.koenig@amd.com>
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

Now that we have improved the handling faulting in a full PMD only
increases the overhead on my test system from 21us to 29us if only a
single page is requested, but massively improves the performance for
all other use cases.

So re-apply that change again to improve the fault handling for large
allocations bringing us close to improving it by a factor of 10.

This reverts commit c358a809cb58af944d496944391a240e02f5837a.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 include/drm/ttm/ttm_bo.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 903cd1030110..e96477606207 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -39,7 +39,11 @@
 #include "ttm_device.h"
 
 /* Default number of pre-faulted pages in the TTM fault handler */
+#if CONFIG_PGTABLE_LEVELS > 2
+#define TTM_BO_VM_NUM_PREFAULT (1 << (PMD_SHIFT - PAGE_SHIFT))
+#else
 #define TTM_BO_VM_NUM_PREFAULT 16
+#endif
 
 struct iosys_map;
 
-- 
2.43.0

