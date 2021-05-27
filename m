Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4876D3937A6
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 22:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B096F4D7;
	Thu, 27 May 2021 20:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B27B6F4D1;
 Thu, 27 May 2021 20:56:17 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id m1so1470321ilg.10;
 Thu, 27 May 2021 13:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2FzI6x3fU0QUcf05c+RVHhBbWnKsL4r+PvrdiDWp0Ug=;
 b=TLwGz8LMDx2vbMXpzw+10gPyg2EpEOTpZtnbFC3FGLvl96Z7gVXEaf1ZN9fJk3n15k
 RGC11WKM5KoPHT0esRsXvVSdfl7otKBapsX2IxvkgIfhEfwlbuVWiXa3EgpDvNz4qzlW
 sroUyGg1PXooi6hMOssfwjYdL1xLVa20VbABkZEQjZDFWpXmjpRiQRRp/eP3TeFxPBUn
 7ELXNpBt/SQ+hkmcx2dNGQZDN0RI7nhCnhNB8hgadfC1NsffNsHawfLkRNz+KTUlNHN4
 K06DJAEg9yscow7F1n5pIj0eiiLOTJpzZTHuMF0FY2Ha7dW6mI8PrETFAJSdwNWFzfsZ
 LmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2FzI6x3fU0QUcf05c+RVHhBbWnKsL4r+PvrdiDWp0Ug=;
 b=eW9e+D1CRNeL37uXyRJCtUlEapXK9QGscwNfZL3xiNcRMr0ce35kjbGeaKdTyoQ2TG
 Z/NKqWp1dUNzlDx2EEl1viYXJjjkXf2qrE133kg1Q/Pr7StrhFDgVyFELNYGb7YPnJ2V
 gXdox0WURzyDq5/SFwDMFT55ZnSq05vvSc2q5KtwuX4JqpYLgbj1GZhNjF0IyMFlw3Nz
 q7WWUCfzU5zlAKz9eORD4Z6w9zzS8iiXq/lCTd/FzzPVLp/R3Kc/V12Nww8RrSty+oe8
 oyF6ir5wpJ6kqXhGiIZ+5W33m29vIBANt+Eef4ywCB0cpbMgVG/DuA1vHQQmRTkNBO9v
 OfXw==
X-Gm-Message-State: AOAM531uh1yVBGcu5TS1jTt+XLV+N9QNsnJBsQGA6o67snHtQO0l6XeT
 1tomcAmmvJsy4nnXv9dJZuQbRlOdaH4NSQ==
X-Google-Smtp-Source: ABdhPJyJiLAdgpBimSCfjgkLAi2g2Ax2oqqgTx5gUini8s6TDoputCYi5yezgWbXkhnr9Xg33F19zw==
X-Received: by 2002:a92:c104:: with SMTP id p4mr4392567ile.307.1622148976090; 
 Thu, 27 May 2021 13:56:16 -0700 (PDT)
Received: from Harpoon.amd.com ([165.204.55.251])
 by smtp.gmail.com with ESMTPSA id b10sm1577265ioz.35.2021.05.27.13.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 13:56:15 -0700 (PDT)
From: Felix Kuehling <felix.kuehling@gmail.com>
X-Google-Original-From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 07/10] drm/amdkfd: skip migration for pages already in VRAM
Date: Thu, 27 May 2021 16:56:03 -0400
Message-Id: <20210527205606.2660-7-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210527205606.2660-1-Felix.Kuehling@amd.com>
References: <20210527205606.2660-1-Felix.Kuehling@amd.com>
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
Cc: Alex Sierra <alex.sierra@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

Migration skipped for pages that are already in VRAM
domain. These could be the result of previous partial
migrations to SYS RAM, and prefetch back to VRAM.
Ex. Coherent pages in VRAM that were not written/invalidated after
a copy-on-write.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 6fd68528c425..8a3f21d76915 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -329,14 +329,15 @@ svm_migrate_copy_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
 	for (i = j = 0; i < npages; i++) {
 		struct page *spage;
 
-		dst[i] = vram_addr + (j << PAGE_SHIFT);
-		migrate->dst[i] = svm_migrate_addr_to_pfn(adev, dst[i]);
-		svm_migrate_get_vram_page(prange, migrate->dst[i]);
-
-		migrate->dst[i] = migrate_pfn(migrate->dst[i]);
-		migrate->dst[i] |= MIGRATE_PFN_LOCKED;
-
-		if (migrate->src[i] & MIGRATE_PFN_VALID) {
+		spage = migrate_pfn_to_page(migrate->src[i]);
+		if (spage && !is_zone_device_page(spage)) {
+			dst[i] = vram_addr + (j << PAGE_SHIFT);
+			migrate->dst[i] = svm_migrate_addr_to_pfn(adev, dst[i]);
+			svm_migrate_get_vram_page(prange, migrate->dst[i]);
+			migrate->dst[i] = migrate_pfn(migrate->dst[i]);
+			migrate->dst[i] |= MIGRATE_PFN_LOCKED;
+		}
+		if (migrate->dst[i] & MIGRATE_PFN_VALID) {
 			spage = migrate_pfn_to_page(migrate->src[i]);
 			src[i] = dma_map_page(dev, spage, 0, PAGE_SIZE,
 					      DMA_TO_DEVICE);
-- 
2.31.1

