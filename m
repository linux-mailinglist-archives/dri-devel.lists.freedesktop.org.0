Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF53E4B263F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5940110EB99;
	Fri, 11 Feb 2022 12:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31EA10EB97
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:50:13 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id qk11so2333976ejb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 04:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7WCa5qA1/nLtCEHZ/PpDjh5N7A1IJbEHHrC/YoiEV28=;
 b=SSgZgljVNjvx1oqnD//TN6+IssxV32Y0AlvHMXWHnH8JVzNIo/uCvIx8rMLXi0YVzr
 6HTAvCA8UTTkOMEjgA398IVWxT/EnXFMmvlxl3SSAaAQFr4pESj1klnheSui/ZybbPjc
 zoE0n33plybqGTR/TEvOB8OMEo6/LML2OvcLKZmvMLdLa5r4ldyTMYfFuBBUzMrN0vJz
 kW1Xw8On1xdCrFqMjKcuU2gTUGEjcpxz9tw93G6U0Rv+EUJ9gqE0L92NwVAaK+wJr26A
 NvWuOg9rJuQU6ahArADh9rbDQELPTWlXjMjGK7LCF6p9omQjEZQ727d3Ea8URPd0nRN9
 3Ehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7WCa5qA1/nLtCEHZ/PpDjh5N7A1IJbEHHrC/YoiEV28=;
 b=xnHqLvJlpueGv6wvvf40cZacLloTw1JKN/OAy1JIZTDhfr5QMP2+s3rLGf+9Q5sLZg
 bM7+6CMDPU9F01wZ4k4jxibw89x8Uzp26k783RYV8ILOfvbpbQiVGYQ8O49msOEd94LL
 qhaZ6Z7aOv1eK65EDYxkYkbamheuUmvyrkqpLqh0/+Wt51BMPgmpSltImtfqxAf1TeVE
 Y/V77mhxAb1lZWcqnHOpUfWk/0cJd7BfI3AvU9R8rSHbb7k5XBXHsFd4WnDIS541xFMk
 sM5qGQjz5FstFxO27CcZVKQ+s6xCjILwzsCm1geWRglYwHjfcbYQCx2IxIlBdlHZIl4T
 cCrg==
X-Gm-Message-State: AOAM532eSs+tawecismOTAd5OfUyYhzpKAhtEqdAEuhXrJmaGWo3fmmw
 5Y+QLrO0cHPNlWhGugMxdEs=
X-Google-Smtp-Source: ABdhPJzQyaglDPGwQ6W1hx6Sc/G4ING4kQYcZ1GiaVimGtdC3TOZIJTw4eMUcQ/iJWTDeJ/4ILVnOg==
X-Received: by 2002:a17:907:168b:: with SMTP id
 hc11mr1255839ejc.676.1644583812340; 
 Fri, 11 Feb 2022 04:50:12 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id w22sm7868604ejc.137.2022.02.11.04.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 04:50:11 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 06/23] drm/nouveau: stop using dma_resv_excl_fence
Date: Fri, 11 Feb 2022 13:49:46 +0100
Message-Id: <20220211125003.918447-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211125003.918447-1-christian.koenig@amd.com>
References: <20220211125003.918447-1-christian.koenig@amd.com>
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

Instead use the new dma_resv_get_singleton function.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index fa73fe57f97b..74f8652d2bd3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -959,7 +959,14 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
 {
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
 	struct drm_device *dev = drm->dev;
-	struct dma_fence *fence = dma_resv_excl_fence(bo->base.resv);
+	struct dma_fence *fence;
+	int ret;
+
+	/* TODO: This is actually a memory management dependency */
+	ret = dma_resv_get_singleton(bo->base.resv, false, &fence);
+	if (ret)
+		dma_resv_wait_timeout(bo->base.resv, false, false,
+				      MAX_SCHEDULE_TIMEOUT);
 
 	nv10_bo_put_tile_region(dev, *old_tile, fence);
 	*old_tile = new_tile;
-- 
2.25.1

