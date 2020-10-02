Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 463C2281A31
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 19:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F3E6E10D;
	Fri,  2 Oct 2020 17:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B826E0A5
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 17:53:43 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id j136so2606924wmj.2
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Oct 2020 10:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Ic9kLI7iEmx4fzg6K/MGmVs8Kbr/xz3cK5mQ8gVn9M=;
 b=GdOd/VH/FT5eF5Gfj5Q1p9o3Vy+IUnorHd0BlnwOL9uxqZXuqaW6hM5SPvXVoCliFo
 bYTAnUT5U/MmyPZiyzSRP+mItblvHt3dnKeVQamNmGl1Wkstvlwhpe9QI+eMQwsUSnFG
 vCIrvzCfJM5d8ZpALwF1YBf+lWT2Rg+eoosfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Ic9kLI7iEmx4fzg6K/MGmVs8Kbr/xz3cK5mQ8gVn9M=;
 b=LkaeGPAbPVmHQSM+xVhTQf1lz+92zAgoh5R35ZGVAFLJmyGVwAo/EPzTGLri7KIxBC
 qnUwT4Df2l34i2SAfph+r8hsbztWaLpqDb0MiGICQMHR7YX6lj0EYPdtc0t9AZ4fDTMU
 ktmIWeNHAquPn6fndrJJCY6XdcKiY9IfrhMv1deoS1mokHRqH8Swpgm3sNpjm7cMp/Wx
 o6sGpx62Rrfa6G3fkqmqqew+ULTQ2kTfgFxD/k6KlMNq72Gi+mEamUbyRMmSyRlMgiud
 myTQ3jlI9ibB850Za789nZscHR+iOBpctxzNxUuttNV52WYPrfsI9+2JMtsAGeu4WO4t
 F4pg==
X-Gm-Message-State: AOAM533OGViBWjHbh5QepXmFCc2BPRFqzLUJhKiOIcLYuEAwYAm06owQ
 7FuVDfRfHzSXBDatBopZdm9Nwq+/qG9gjR8l
X-Google-Smtp-Source: ABdhPJx4N0mByTSrMhoszno9AheTX2LZ7oZ+iqT+Q3TvlZQuWl0+xgzy8x8+JKsZ5hS5NTaTlr3Xeg==
X-Received: by 2002:a7b:cf1a:: with SMTP id l26mr4030327wmg.164.1601661221643; 
 Fri, 02 Oct 2020 10:53:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m10sm2585429wmc.9.2020.10.02.10.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 10:53:40 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] mm/frame-vec: Drop gup_flags from get_vaddr_frames()
Date: Fri,  2 Oct 2020 19:53:02 +0200
Message-Id: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-mm@kvack.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Omer Shpigelman <oshpigelman@habana.ai>,
 Kukjin Kim <kgene@kernel.org>, Tomer Tayar <ttayar@habana.ai>,
 linux-media@vger.kernel.org, Pawel Osciak <pawel@osciak.com>,
 linux-arm-kernel@lists.infradead.org, Pawel Piskorski <ppiskorski@habana.ai>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, LKML <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

FOLL_WRITE | FOLL_FORCE is really the only reasonable thing to do for
simple dma device that can't guarantee write protection. Which is also
what all the callers are using.

So just simplify this.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pawel Osciak <pawel@osciak.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Tomasz Figa <tfiga@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Oded Gabbay <oded.gabbay@gmail.com>
Cc: Omer Shpigelman <oshpigelman@habana.ai>
Cc: Tomer Tayar <ttayar@habana.ai>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pawel Piskorski <ppiskorski@habana.ai>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linux-mm@kvack.org
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c           | 3 +--
 drivers/media/common/videobuf2/videobuf2-memops.c | 3 +--
 drivers/misc/habanalabs/common/memory.c           | 3 +--
 include/linux/mm.h                                | 2 +-
 mm/frame_vector.c                                 | 4 ++--
 5 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 967a5cdc120e..ac452842bab3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -480,8 +480,7 @@ static dma_addr_t *g2d_userptr_get_dma_addr(struct g2d_data *g2d,
 		goto err_free;
 	}
 
-	ret = get_vaddr_frames(start, npages, FOLL_FORCE | FOLL_WRITE,
-		g2d_userptr->vec);
+	ret = get_vaddr_frames(start, npages, g2d_userptr->vec);
 	if (ret != npages) {
 		DRM_DEV_ERROR(g2d->dev,
 			      "failed to get user pages from userptr.\n");
diff --git a/drivers/media/common/videobuf2/videobuf2-memops.c b/drivers/media/common/videobuf2/videobuf2-memops.c
index 6e9e05153f4e..9dd6c27162f4 100644
--- a/drivers/media/common/videobuf2/videobuf2-memops.c
+++ b/drivers/media/common/videobuf2/videobuf2-memops.c
@@ -40,7 +40,6 @@ struct frame_vector *vb2_create_framevec(unsigned long start,
 	unsigned long first, last;
 	unsigned long nr;
 	struct frame_vector *vec;
-	unsigned int flags = FOLL_FORCE | FOLL_WRITE;
 
 	first = start >> PAGE_SHIFT;
 	last = (start + length - 1) >> PAGE_SHIFT;
@@ -48,7 +47,7 @@ struct frame_vector *vb2_create_framevec(unsigned long start,
 	vec = frame_vector_create(nr);
 	if (!vec)
 		return ERR_PTR(-ENOMEM);
-	ret = get_vaddr_frames(start & PAGE_MASK, nr, flags, vec);
+	ret = get_vaddr_frames(start & PAGE_MASK, nr, vec);
 	if (ret < 0)
 		goto out_destroy;
 	/* We accept only complete set of PFNs */
diff --git a/drivers/misc/habanalabs/common/memory.c b/drivers/misc/habanalabs/common/memory.c
index 5ff4688683fd..43b10aee8150 100644
--- a/drivers/misc/habanalabs/common/memory.c
+++ b/drivers/misc/habanalabs/common/memory.c
@@ -1287,8 +1287,7 @@ static int get_user_memory(struct hl_device *hdev, u64 addr, u64 size,
 		return -ENOMEM;
 	}
 
-	rc = get_vaddr_frames(start, npages, FOLL_FORCE | FOLL_WRITE,
-				userptr->vec);
+	rc = get_vaddr_frames(start, npages, userptr->vec);
 
 	if (rc != npages) {
 		dev_err(hdev->dev,
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 16b799a0522c..7d14aa2780d2 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1757,7 +1757,7 @@ struct frame_vector {
 struct frame_vector *frame_vector_create(unsigned int nr_frames);
 void frame_vector_destroy(struct frame_vector *vec);
 int get_vaddr_frames(unsigned long start, unsigned int nr_pfns,
-		     unsigned int gup_flags, struct frame_vector *vec);
+		     struct frame_vector *vec);
 void put_vaddr_frames(struct frame_vector *vec);
 int frame_vector_to_pages(struct frame_vector *vec);
 void frame_vector_to_pfns(struct frame_vector *vec);
diff --git a/mm/frame_vector.c b/mm/frame_vector.c
index 10f82d5643b6..5d34c9047e9c 100644
--- a/mm/frame_vector.c
+++ b/mm/frame_vector.c
@@ -12,7 +12,6 @@
  * get_vaddr_frames() - map virtual addresses to pfns
  * @start:	starting user address
  * @nr_frames:	number of pages / pfns from start to map
- * @gup_flags:	flags modifying lookup behaviour
  * @vec:	structure which receives pages / pfns of the addresses mapped.
  *		It should have space for at least nr_frames entries.
  *
@@ -32,10 +31,11 @@
  * This function takes care of grabbing mmap_lock as necessary.
  */
 int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
-		     unsigned int gup_flags, struct frame_vector *vec)
+		     struct frame_vector *vec)
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
+	unsigned int gup_flags = FOLL_WRITE | FOLL_FORCE;
 	int ret = 0;
 	int err;
 	int locked;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
