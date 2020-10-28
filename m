Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0E029CFB5
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 12:31:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2D86E4F1;
	Wed, 28 Oct 2020 11:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1A06E4F1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 11:31:40 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id g12so5263309wrp.10
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 04:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LOSmu9OLh+Rtoi6Ilns2kcJe+1096EW4/ZG7BCbq7E4=;
 b=dywmnCFNu7aQENXcqa0P4ZhF0TNWZ5biLg2SLUUJ3L11xevJEd7iZLdTHpncCcO84C
 ymCNHXTOYns+o2RZyJEc+FjBXASvPaMe6KeU8a+bjEPITtcohUs/3aOPTsMtOI677bIk
 0R8Prf4v7DkiJbbPf3Dtsp/JUrlfVF+Xoov4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LOSmu9OLh+Rtoi6Ilns2kcJe+1096EW4/ZG7BCbq7E4=;
 b=CzKIolWcnuuCJ5qpMMm7juduhsBcKrUF5Sr7OJUWyQUDzjlH7RwaFXcHKDFuDntxmj
 pEiYrcR7tBkUSjjay/yw/HfkBMpu5LsK/3soxwyUa3t2vBDgsqqEfUtLQT/E5PAg7HUw
 NpmkgU/dATFWmEqjRBatuhJEoXdRGPcO89swMH/fIfoUBJaNEeZhTwgZIGbBmDi+bA13
 NdagGNf3/t0WM+I8l4TWib9stZZOdkHVLwx4gtFVQlGNmLNOEOJ9SVebhAQhGRp079EW
 6XwUAU73xd0LyHB4+XH5uHwDPZ56jy/JfguV2cdNY1C+nNOyJVCV+lG3VuyLghHZuKiq
 NN0w==
X-Gm-Message-State: AOAM532ZU2NF0/tZaUXioDdthE7LX2lKOiIvxBRjk6al0GB74ukgRgfx
 5oYIenPSbiKrWnH3cadEKKjFRiiUPOpf/M8r
X-Google-Smtp-Source: ABdhPJyl7385dDwYe7wXvvPFF7uRmggljGUKjnUTxwp9BHq1bkm9lmdiI1khFXON/vMt40fRz2V6qA==
X-Received: by 2002:adf:fd09:: with SMTP id e9mr8518587wrr.241.1603884698711; 
 Wed, 28 Oct 2020 04:31:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s185sm5980759wmf.3.2020.10.28.04.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 04:31:38 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/ttm: Warn on pinning without holding a reference
Date: Wed, 28 Oct 2020 12:31:20 +0100
Message-Id: <20201028113120.3641237-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Huang Rui <ray.huang@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not technically a problem for ttm, but very likely a driver bug and
pretty big time confusing for reviewing code.

So warn about it, both at cleanup time (so we catch these for sure)
and at pin/unpin time (so we know who's the culprit).

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
 include/drm/ttm/ttm_bo_api.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index f51b5e20fa17..a011072ab61d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -509,7 +509,7 @@ static void ttm_bo_release(struct kref *kref)
 		 * shrinkers, now that they are queued for
 		 * destruction.
 		 */
-		if (bo->pin_count) {
+		if (WARN_ON(bo->pin_count)) {
 			bo->pin_count = 0;
 			ttm_bo_del_from_lru(bo);
 			ttm_bo_add_mem_to_lru(bo, &bo->mem);
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 37102e45e496..b45aee23d7d0 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -571,6 +571,7 @@ static inline bool ttm_bo_uses_embedded_gem_object(struct ttm_buffer_object *bo)
 static inline void ttm_bo_pin(struct ttm_buffer_object *bo)
 {
 	dma_resv_assert_held(bo->base.resv);
+	WARN_ON_ONCE(!kref_read(&bo->kref));
 	++bo->pin_count;
 }
 
@@ -584,6 +585,7 @@ static inline void ttm_bo_unpin(struct ttm_buffer_object *bo)
 {
 	dma_resv_assert_held(bo->base.resv);
 	WARN_ON_ONCE(!bo->pin_count);
+	WARN_ON_ONCE(!kref_read(&bo->kref));
 	--bo->pin_count;
 }
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
