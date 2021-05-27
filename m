Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4223938FC
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 01:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5236F4F6;
	Thu, 27 May 2021 23:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A97F6F4F6;
 Thu, 27 May 2021 23:11:12 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id e17so2259309iol.7;
 Thu, 27 May 2021 16:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+fnXZ/6nvmXOv34c4RRw63958oJli0u/lIVwH76TfVs=;
 b=hfsWP/9+JPpVyYC9O3ojjoSJgCVa8bg3ZxS8juUlu3nvrnQa1FDwqPHFiW7Wq1FFmL
 ILWXJk8rzcTa4KRswm4pXmJB+49rU98TN4ZkYCTQXtDevKsG0VUzsfAZ+VgXi5v2V2z6
 br8VB8OP9GF+MpfgShzjNvZF+o4rtD8nnnIkPLsY9T2PeLX7b8qySpRzCRn4yrGrJbQN
 n49lox+UZw6fKMZgz5uCdzEvhyO7JY/CVfdfc67IRcEvH8E6dkt6lcuC4SMqOrj1a1nb
 9XnyOq+IBtpMPCU0nMcRhEn/d+SYQkcG/Q1L3J6P7bj0eq09etW3Ka4Hw+8doA5no8zw
 eipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+fnXZ/6nvmXOv34c4RRw63958oJli0u/lIVwH76TfVs=;
 b=ork8Ldi3PIg4owhgM/O3eH0wDV5C466ncUhTe2kNCyKF2PMKZ2KMdRNIbQ2GFaRKO3
 /WJVxyWzlf7AZmrvHc7GFxIw3jrutkCuWmGx9loorpvWJhSl/RBQlg2is8I6CbCLgw62
 hCHnZFOmONOPaMXs2MBgV2c06kXob7hkbrfRoIMsQGW7d6wGOAaMjP1eHyUrNV1ueFRh
 gpZyy9S6XOAnCRhrR7hlyQc/lb9/VdJvlf8e24LTAQUY34Rg/1Jno1tvri6FyJJD6/ph
 kLhx2m0GAsslvBIAnCiODpWOxhOEUvJHon+Em4q+j9OXjDTD906wG/fvN0zGwazi9jCa
 +y/g==
X-Gm-Message-State: AOAM531bkK8Er52HxiJWQYV9qsSDJvfOtHdTDeVSPgwLvXwexQar6gWl
 dqJ7TpJEvqZf+SDeapaX0x5TEl3bNz/d/wBW
X-Google-Smtp-Source: ABdhPJxhTAtS0KfJXNAGDVbVTIZAdKf4Y0VwXKHDCbpaIaFnpP8Peruryw244ygyruPJzPvmeqvEhQ==
X-Received: by 2002:a5d:8d87:: with SMTP id b7mr4546232ioj.46.1622157071809;
 Thu, 27 May 2021 16:11:11 -0700 (PDT)
Received: from Harpoon.amd.com ([165.204.55.251])
 by smtp.gmail.com with ESMTPSA id r5sm1860014ilb.1.2021.05.27.16.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 16:11:03 -0700 (PDT)
From: Felix Kuehling <felix.kuehling@gmail.com>
X-Google-Original-From: Felix Kuehling <Felix.Kuehling@amd.com>
To: felix.kuehling@amd.com,
	akpm@linux-foundation.org,
	linux-mm@kvack.org
Subject: [RFC PATCH 5/5] mm: changes to unref pages with Generic type
Date: Thu, 27 May 2021 19:08:09 -0400
Message-Id: <20210527230809.3701-6-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210527230809.3701-1-Felix.Kuehling@amd.com>
References: <20210527230809.3701-1-Felix.Kuehling@amd.com>
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
Cc: Alex Sierra <alex.sierra@amd.com>, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

pages in device mapping refcounts are 1-based, instead
of 0-based. If refcount 1, means it can be freed.
This logic is not set for Generic memory type. Therefore,
its release is threated as a normal page, instead of
the callback device driver release it.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 include/linux/mm.h | 1 +
 mm/memremap.c      | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 1af7b9b76948..83bd2f3e111b 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1130,6 +1130,7 @@ static inline bool page_is_devmap_managed(struct page *page)
 	switch (page->pgmap->type) {
 	case MEMORY_DEVICE_PRIVATE:
 	case MEMORY_DEVICE_FS_DAX:
+	case MEMORY_DEVICE_GENERIC:
 		return true;
 	default:
 		break;
diff --git a/mm/memremap.c b/mm/memremap.c
index 16b2fb482da1..d2563fbcf987 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -44,6 +44,7 @@ EXPORT_SYMBOL(devmap_managed_key);
 static void devmap_managed_enable_put(struct dev_pagemap *pgmap)
 {
 	if (pgmap->type == MEMORY_DEVICE_PRIVATE ||
+	    pgmap->type == MEMORY_DEVICE_GENERIC ||
 	    pgmap->type == MEMORY_DEVICE_FS_DAX)
 		static_branch_dec(&devmap_managed_key);
 }
@@ -51,6 +52,7 @@ static void devmap_managed_enable_put(struct dev_pagemap *pgmap)
 static void devmap_managed_enable_get(struct dev_pagemap *pgmap)
 {
 	if (pgmap->type == MEMORY_DEVICE_PRIVATE ||
+	    pgmap->type == MEMORY_DEVICE_GENERIC ||
 	    pgmap->type == MEMORY_DEVICE_FS_DAX)
 		static_branch_inc(&devmap_managed_key);
 }
@@ -480,7 +482,8 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
 void free_devmap_managed_page(struct page *page)
 {
 	/* notify page idle for dax */
-	if (!is_device_private_page(page)) {
+	if (!(is_device_private_page(page) ||
+	    is_device_generic_page(page))) {
 		wake_up_var(&page->_refcount);
 		return;
 	}
-- 
2.31.1

