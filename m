Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 498EA73736A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 20:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9411110E311;
	Tue, 20 Jun 2023 18:01:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DEA10E311
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 18:01:56 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-666e97fcc60so2164915b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 11:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687284115; x=1689876115;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3EwBl0XaiIO54g7L7UjAnszZLl2VR52IrplzddXZU+c=;
 b=iQW6+b1Oph+u6iCyX6ZODZCGY4R4Enf/2pvdZCVPk+5qz0m5sINbl02H8l+pmgabXu
 D/IvorfPuy5rw9GoMtJc6AyHg7Pb67Ad3hYRFoK3ZLj5q2UjCAO6YNChdl+cEO1wLXr4
 NbnobWQbw/Ke2bi+bwf/QOnhJe8hc1dfKhXjhnNei9t6etdxBmxGMTA36owsI+U6c8Nw
 jPA9pFnYwfLtiZs6OJksdJW7LXUSlYFhno+bs3qu/zNtsKqQNdFtT3+oDdaLJBC3GFqv
 ww945Ntn/t9mG2/xvrwYg/rYoL4ooSVSt0YHVZDf+t5NVAm38a+54LOoO/4+zI+nNEMS
 Imxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687284115; x=1689876115;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3EwBl0XaiIO54g7L7UjAnszZLl2VR52IrplzddXZU+c=;
 b=b2vBGJv7E3Gt/+/dY4Oft0xWgOReylrOZfcqdltS4NrTGuF11RJpskGL5vCBeGzTQE
 fTFPIpU51hsknxCCm3bgFiUE9TiF9GbQHUhr416TZbfo4c2KCWQZQQRc/EsOevJIEmOX
 qmZMHX6KdNdWGlRHuYjA1xi8hC0ETYWXO77oTMNWugVJgqgZlHzrNCp+RDtGoVt8PFvl
 Q6WU3WMcIqpkoCb+nV2Wrrx8S48LQFbS2Z15pln4FMmZM01R0JXHOeUywUfOeF78aB8b
 cB3t/DSyy1LZT9a092zDuqYTqDNzoS/IngcYcBPFn1/kGeGbG9L5YHNRbtdG4ERuXS8j
 MX+A==
X-Gm-Message-State: AC+VfDz5iZNP1mt0EsDpDdHmvRhCp7RvlOyE4BqCWLrKPeDaeMXgaeEo
 34sbq1DkdUHpXfjfN1tRskk=
X-Google-Smtp-Source: ACHHUZ4iyl7yHia6txNusntUMnGBSJEz1FTmrXLxRe5BhqHFADhX0t7zW+LF/J48D7lHEOtzBgcytw==
X-Received: by 2002:a05:6a20:3d85:b0:118:a48:8977 with SMTP id
 s5-20020a056a203d8500b001180a488977mr10390846pzi.3.1687284115289; 
 Tue, 20 Jun 2023 11:01:55 -0700 (PDT)
Received: from sumitra.com ([106.207.162.67]) by smtp.gmail.com with ESMTPSA id
 r8-20020a62e408000000b0064550f76efesm1596101pfh.29.2023.06.20.11.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 11:01:54 -0700 (PDT)
Date: Tue, 20 Jun 2023 11:01:48 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/gma500: Replace kmap{,_atomic}() with page_address()
Message-ID: <20230620180148.GA419134@sumitra.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Deepak R Varma <drv@mailo.com>, Fabio <fmdefrancesco@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>, Sumitra Sharma <sumitraartsy@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove unnecessary calls to kmap{,_atomic}() when acquiring
pages using GFP_DMA32.

The GFP_DMA32 uses the DMA32 zone to satisfy the allocation
requests. Therefore, pages allocated with GFP_DMA32 cannot
come from Highmem.

Avoid using calls to kmap_local_page() / kunmap_local() and
kmap() / kunmap() in the psb_mmu_alloc_pd function. Instead,
utilize page_address().

Remove the usage of kmap_atomic() / kunmap_atomic() in the
psb_mmu_alloc_pt function. Use page_address() instead.

Substitute kmap_atomic(pt->p) / kunmap_atomic(pt->v) calls
in the psb_mmu_pt_alloc_map_lock() and psb_mmu_pt_unmap_unlock()
functions with page_address(pt->p). This is possible as
pt = psb_mmu_alloc_pt(pd) allocates a page using
pt->p = alloc_page(GFP_DMA32).

Suggested-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
 drivers/gpu/drm/gma500/mmu.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/gma500/mmu.c b/drivers/gpu/drm/gma500/mmu.c
index a70b01ccdf70..59aa5661e56a 100644
--- a/drivers/gpu/drm/gma500/mmu.c
+++ b/drivers/gpu/drm/gma500/mmu.c
@@ -184,20 +184,15 @@ struct psb_mmu_pd *psb_mmu_alloc_pd(struct psb_mmu_driver *driver,
 		pd->invalid_pte = 0;
 	}
 
-	v = kmap_local_page(pd->dummy_pt);
+	v = page_address(pd->dummy_pt);
 	for (i = 0; i < (PAGE_SIZE / sizeof(uint32_t)); ++i)
 		v[i] = pd->invalid_pte;
 
-	kunmap_local(v);
-
-	v = kmap_local_page(pd->p);
+	v = page_address(pd->p);
 	for (i = 0; i < (PAGE_SIZE / sizeof(uint32_t)); ++i)
 		v[i] = pd->invalid_pde;
 
-	kunmap_local(v);
-
-	clear_page(kmap(pd->dummy_page));
-	kunmap(pd->dummy_page);
+	clear_page(page_address(pd->dummy_page));
 
 	pd->tables = vmalloc_user(sizeof(struct psb_mmu_pt *) * 1024);
 	if (!pd->tables)
@@ -279,7 +274,7 @@ static struct psb_mmu_pt *psb_mmu_alloc_pt(struct psb_mmu_pd *pd)
 
 	spin_lock(lock);
 
-	v = kmap_atomic(pt->p);
+	v = page_address(pt->p);
 	clf = (uint8_t *) v;
 	ptes = (uint32_t *) v;
 	for (i = 0; i < (PAGE_SIZE / sizeof(uint32_t)); ++i)
@@ -293,7 +288,6 @@ static struct psb_mmu_pt *psb_mmu_alloc_pt(struct psb_mmu_pd *pd)
 		}
 		mb();
 	}
-	kunmap_atomic(v);
 	spin_unlock(lock);
 
 	pt->count = 0;
@@ -339,7 +333,7 @@ static struct psb_mmu_pt *psb_mmu_pt_alloc_map_lock(struct psb_mmu_pd *pd,
 			atomic_set(&pd->driver->needs_tlbflush, 1);
 		}
 	}
-	pt->v = kmap_atomic(pt->p);
+	pt->v = page_address(pt->p);
 	return pt;
 }
 
@@ -365,7 +359,6 @@ static void psb_mmu_pt_unmap_unlock(struct psb_mmu_pt *pt)
 	struct psb_mmu_pd *pd = pt->pd;
 	uint32_t *v;
 
-	kunmap_atomic(pt->v);
 	if (pt->count == 0) {
 		v = kmap_atomic(pd->p);
 		v[pt->index] = pd->invalid_pde;
-- 
2.25.1

