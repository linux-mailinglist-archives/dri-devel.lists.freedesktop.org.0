Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7499B40976
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 17:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE8010E7AB;
	Tue,  2 Sep 2025 15:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YNhT1LJI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D566310E7AB
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 15:46:54 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3ceb9c3d98cso2464395f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 08:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756828013; x=1757432813; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n/5Ql6ePEZB3sncY9PXrRkrrrgHDmfb5EstPCmtwQL4=;
 b=YNhT1LJIfa/Bvk2T5Ig2aJ8sRjf//RnU/Wjeofm56QXwD+08K12NpV2GuKNfcY7S+Q
 AeN2hzviN58zViqXebJtAMtSI2MS22ny8yIbRYKbLVlRHeKPcWkOvNlKKlyuuZIflk08
 lOc9AvL1R/88gwYKtT1RDBxKGQECc5kEBIpd4rHNHDZDrcD2LpPLYRcayIdWfIitmsHR
 jaWc1xuwzmkdKuBlpnTXxgUWAIqeJcNioGXSz6dBMNWL3MqwyItUA7d2CSj+BfV5TsF/
 l2YaKO7oKm/1e5sPRF04XnamSmpeieqsTN8xRjUO8HGzquCh4plsgEoL2+4B7rYufy0x
 mdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756828013; x=1757432813;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n/5Ql6ePEZB3sncY9PXrRkrrrgHDmfb5EstPCmtwQL4=;
 b=baZq5o+KjMDc/z0Cwk8K31IcVZ6y065oF5wiV6icZijXgb+pAnnQtWQN/ektZu4mCi
 YSkuEtWGMFhgkPmS8Wj1950w7DFqrnDK3QnOwmIjq3Od3kIG/MitAWmoYoQINPPTIP7b
 GPlyYVHQP9YE4s6L1tnBKBMf/TDDsUt9lzzXlvfcMdmyGkgsSOTtYRk9B4Zd2bRdjzTy
 XimKuI6iox6kPMO07P4kQt4kHSg10/i4Zu9DiPyVnAPz15ZRQIbnrvJhkbJ/3IAaVRpP
 onpKeS53BRSfPk+Nu2wCvDTE34O6NDppUDuOncHfIAx3Jw4fkyGlowwbd6j6mtmKz4Os
 po1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXULpCfdU9jC8RpiYTPsEDrfFn6SWACWGnms/aqOfnVqaCno3CtGpGKuIwskDk99QMmbgCGdxTq7Xc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5sNJrPcBYfWyGee/LBa25+LekMVCz/Wh1+H2LDKG6DeJ1rQO5
 iJm7i+/8CvFGzebMZNqBL+OS9rI0lwQmfxHjJJQJNKidKxLcPCO7+f+r
X-Gm-Gg: ASbGnctgfi268teMSjT0S702ESPxLc5ez+7E6H7WmnHJdosEwQrDZrexggxC5zwfFCw
 i4IMh3VgYcipO0fjTyoyF4KZ36Hng88msSQ2vdMw2YuDb79Hzl/9W7y3ifku/vEWwzcObj6+7gv
 1r5OBk4MEyhlyExbPqB/nGzH48XvFDLnag9pxvDXAOiNBUHcauma1my20Jt93He4DnFuSr9AFpB
 76Sh1gqRhIsy8uf/9MoNhbOTMdK69hw83ge+8uNsIKkxrUvPhnHZ2zHrkZsTIUSnt7FCG/GMxOc
 BxBV2t4YbrFzAai8Uec6T398IZY1iuIuJN1NqAESFB3baEF5F750eCbGyA5vGhhg5DG/vdsOcet
 lnX1dRP8CIpNnvNj+qJIbb10KR2bC/Xa1bA0n2bCQSSKs0yOXHdT5nJKYmgVzVPhJQmhUhD6F0W
 LZrhVUQHIErcSdN6znVMa24dAq
X-Google-Smtp-Source: AGHT+IHq43AbE5VkmkapAR0tzhsq3zXTXrsk3nysd56WKEVtoZpJPwZ7v6YnW4KfZ38+U9nLscJHkg==
X-Received: by 2002:a05:6000:25c6:b0:3ce:f0a5:d598 with SMTP id
 ffacd0b85a97d-3d1dca7bfdbmr10337054f8f.10.1756828012868; 
 Tue, 02 Sep 2025 08:46:52 -0700 (PDT)
Received: from localhost
 (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45c447244c4sm4765415e9.6.2025.09.02.08.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 08:46:48 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org
Subject: [PATCH 3/9] mm/cma: Allow dynamically creating CMA areas
Date: Tue,  2 Sep 2025 17:46:23 +0200
Message-ID: <20250902154630.4032984-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902154630.4032984-1-thierry.reding@gmail.com>
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

There is no technical reason why there should be a limited number of CMA
regions, so extract some code into helpers and use them to create extra
functions (cma_create() and cma_free()) that allow creating and freeing,
respectively, CMA regions dynamically at runtime.

Note that these dynamically created CMA areas are treated specially and
do not contribute to the number of total CMA pages so that this count
still only applies to the fixed number of CMA areas.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/linux/cma.h | 16 ++++++++
 mm/cma.c            | 89 ++++++++++++++++++++++++++++++++++-----------
 2 files changed, 83 insertions(+), 22 deletions(-)

diff --git a/include/linux/cma.h b/include/linux/cma.h
index 62d9c1cf6326..f1e20642198a 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -61,6 +61,10 @@ extern void cma_reserve_pages_on_error(struct cma *cma);
 struct folio *cma_alloc_folio(struct cma *cma, int order, gfp_t gfp);
 bool cma_free_folio(struct cma *cma, const struct folio *folio);
 bool cma_validate_zones(struct cma *cma);
+
+struct cma *cma_create(phys_addr_t base, phys_addr_t size,
+		       unsigned int order_per_bit, const char *name);
+void cma_free(struct cma *cma);
 #else
 static inline struct folio *cma_alloc_folio(struct cma *cma, int order, gfp_t gfp)
 {
@@ -71,10 +75,22 @@ static inline bool cma_free_folio(struct cma *cma, const struct folio *folio)
 {
 	return false;
 }
+
 static inline bool cma_validate_zones(struct cma *cma)
 {
 	return false;
 }
+
+static inline struct cma *cma_create(phys_addr_t base, phys_addr_t size,
+				     unsigned int order_per_bit,
+				     const char *name)
+{
+	return NULL;
+}
+
+static inline void cma_free(struct cma *cma)
+{
+}
 #endif
 
 #endif
diff --git a/mm/cma.c b/mm/cma.c
index e56ec64d0567..8149227d319f 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -214,6 +214,18 @@ void __init cma_reserve_pages_on_error(struct cma *cma)
 	set_bit(CMA_RESERVE_PAGES_ON_ERROR, &cma->flags);
 }
 
+static void __init cma_init_area(struct cma *cma, const char *name,
+				 phys_addr_t size, unsigned int order_per_bit)
+{
+	if (name)
+		snprintf(cma->name, CMA_MAX_NAME, "%s", name);
+	else
+		snprintf(cma->name, CMA_MAX_NAME,  "cma%d\n", cma_area_count);
+
+	cma->available_count = cma->count = size >> PAGE_SHIFT;
+	cma->order_per_bit = order_per_bit;
+}
+
 static int __init cma_new_area(const char *name, phys_addr_t size,
 			       unsigned int order_per_bit,
 			       struct cma **res_cma)
@@ -232,13 +244,8 @@ static int __init cma_new_area(const char *name, phys_addr_t size,
 	cma = &cma_areas[cma_area_count];
 	cma_area_count++;
 
-	if (name)
-		snprintf(cma->name, CMA_MAX_NAME, "%s", name);
-	else
-		snprintf(cma->name, CMA_MAX_NAME,  "cma%d\n", cma_area_count);
+	cma_init_area(cma, name, size, order_per_bit);
 
-	cma->available_count = cma->count = size >> PAGE_SHIFT;
-	cma->order_per_bit = order_per_bit;
 	*res_cma = cma;
 	totalcma_pages += cma->count;
 
@@ -251,6 +258,27 @@ static void __init cma_drop_area(struct cma *cma)
 	cma_area_count--;
 }
 
+static int __init cma_check_memory(phys_addr_t base, phys_addr_t size)
+{
+	if (!size || !memblock_is_region_reserved(base, size))
+		return -EINVAL;
+
+	/*
+	 * CMA uses CMA_MIN_ALIGNMENT_BYTES as alignment requirement which
+	 * needs pageblock_order to be initialized. Let's enforce it.
+	 */
+	if (!pageblock_order) {
+		pr_err("pageblock_order not yet initialized. Called during early boot?\n");
+		return -EINVAL;
+	}
+
+	/* ensure minimal alignment required by mm core */
+	if (!IS_ALIGNED(base | size, CMA_MIN_ALIGNMENT_BYTES))
+		return -EINVAL;
+
+	return 0;
+}
+
 /**
  * cma_init_reserved_mem() - create custom contiguous area from reserved memory
  * @base: Base address of the reserved area
@@ -271,22 +299,9 @@ int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
 	struct cma *cma;
 	int ret;
 
-	/* Sanity checks */
-	if (!size || !memblock_is_region_reserved(base, size))
-		return -EINVAL;
-
-	/*
-	 * CMA uses CMA_MIN_ALIGNMENT_BYTES as alignment requirement which
-	 * needs pageblock_order to be initialized. Let's enforce it.
-	 */
-	if (!pageblock_order) {
-		pr_err("pageblock_order not yet initialized. Called during early boot?\n");
-		return -EINVAL;
-	}
-
-	/* ensure minimal alignment required by mm core */
-	if (!IS_ALIGNED(base | size, CMA_MIN_ALIGNMENT_BYTES))
-		return -EINVAL;
+	ret = cma_check_memory(base, size);
+	if (ret < 0)
+		return ret;
 
 	ret = cma_new_area(name, size, order_per_bit, &cma);
 	if (ret != 0)
@@ -1112,3 +1127,33 @@ void __init *cma_reserve_early(struct cma *cma, unsigned long size)
 
 	return ret;
 }
+
+struct cma *__init cma_create(phys_addr_t base, phys_addr_t size,
+			      unsigned int order_per_bit, const char *name)
+{
+	struct cma *cma;
+	int ret;
+
+	ret = cma_check_memory(base, size);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	cma = kzalloc(sizeof(*cma), GFP_KERNEL);
+	if (!cma)
+		return ERR_PTR(-ENOMEM);
+
+	cma_init_area(cma, name, size, order_per_bit);
+	cma->ranges[0].base_pfn = PFN_DOWN(base);
+	cma->ranges[0].early_pfn = PFN_DOWN(base);
+	cma->ranges[0].count = cma->count;
+	cma->nranges = 1;
+
+	cma_activate_area(cma);
+
+	return cma;
+}
+
+void cma_free(struct cma *cma)
+{
+	kfree(cma);
+}
-- 
2.50.0

