Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FB0A21C9D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:54:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E6F10E7C7;
	Wed, 29 Jan 2025 11:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LKUWO0PY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC9F10E7C5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738151674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bwRdkJe7S5eVWCBWfyg7xh/8u+L2oGZrd41rkCVbduE=;
 b=LKUWO0PYGzc9dUy1UErMnP8OYzjxyiNMxuix/cKwbPyIYHzTWSCZCK/Ib22baSZ9WegrhN
 ldpZLa/hVFB859ju/s4ficWmRE3y6m/T5i8guJeslw1W7X2ECh7t6EfQIgmSCK2Y2tpH3O
 MtgNE6Qmg5ZnLmmDXl36+UQx08cRwOI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-QazVhdy4M3Ofk1W9sck0_A-1; Wed, 29 Jan 2025 06:54:32 -0500
X-MC-Unique: QazVhdy4M3Ofk1W9sck0_A-1
X-Mimecast-MFC-AGG-ID: QazVhdy4M3Ofk1W9sck0_A
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43651b1ba8aso46674375e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:54:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738151671; x=1738756471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bwRdkJe7S5eVWCBWfyg7xh/8u+L2oGZrd41rkCVbduE=;
 b=CgppWoUaw58lQsgfqLjQve1HupwRKS+dWVWdK1AC2qMQe6u2Ku8xS8SNlB3fXLlSz3
 XI1clcJFSwQWbhfMVAXabs/OFFUmCAzFV4gAz9q8yn/Eii+bxbjSkCzZJ2qEQJdoja41
 0gPjtddPV0httNMm8jmAAZTdNmG6UBVl+OnWALsD6DfrVzGdnvU1jUESQWL40RjMWNuv
 91fLJPqojuvXf/GwJ9AzlOpNn58c1Da5gurK7isCiM0Xl2souKvKE7ccmTdhzbs6qlAv
 PDzOB0b7F2aF+Zl4QZNfSpXDfhO2R7L6ILxoqyXH19pTasAnKLg4XiJaS5R6SrfE+h6Y
 Vz3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB9tYk3BtMW21CPVRV6zCE0DIM31jNmDuzOsjpMyMnGcu8Zdhrdzok0yeVnpqAQl75nJreGRN6Xzo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKSwJXH2Q3lNzPkIrAS/NstDtDbYn5XQOYfbAGdASubSQPLwKw
 Tfx0lMKjCuzACFvxjKXdw6WmE9x9PtyOuJB+9rosFVgIE1v+XZL80bJB4mUDOADg7W13lBjPuOd
 yee9UyUDraNHwHkmw04cF/ypwesZeecWM4DYdAVQ4v+Yrk72X3qnCFJrXEjhMI2ODTA==
X-Gm-Gg: ASbGnctMP6bcY2UIFyQClZzLJBtx6Bbd8JyTOGwV32buCnkJ01PKjfjGOuYkOE9DJbC
 Xr9kFG6wrHtwCgCmU2F7nXeMWOPfG8ks1lCS5p3yGNl0gxWgdyxuJttwNU5cmHINn1nRuzyqoUW
 RzTZ9JixOfmOT89iUH7cDJ4obX9mKvmvNJrp1wLzYad7zF4EnD/cUnAO5F88r0fOzetuFj88nXM
 8vL5psakUIMTdzRJM+clvXJnVdDcpkiyU/1ii0tkIx70WLzaMXHGt9U1zvWlFsXnFJtAY3Wv8WF
 0pwHO/prtrthivlcipEKHVBCGkyX21+essQuGeKsTz7j/u9Ux3Vca1YWRtfVF7XQ2g==
X-Received: by 2002:a05:600c:1c1a:b0:434:f9c4:a850 with SMTP id
 5b1f17b1804b1-438dc3c4623mr25664805e9.10.1738151671648; 
 Wed, 29 Jan 2025 03:54:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhuPkSFqdGYqW92VDVvy4lKssWj+By02GdvgYFn3sg13RZ9e45UT5b96yUwTD+A2GCuT4qDg==
X-Received: by 2002:a05:600c:1c1a:b0:434:f9c4:a850 with SMTP id
 5b1f17b1804b1-438dc3c4623mr25664525e9.10.1738151671268; 
 Wed, 29 Jan 2025 03:54:31 -0800 (PST)
Received: from localhost
 (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de.
 [2003:cb:c705:3b00:64b8:6719:5794:bf13])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-438dcc24e73sm20192895e9.16.2025.01.29.03.54.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:54:30 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v1 06/12] mm: use single SWP_DEVICE_EXCLUSIVE entry type
Date: Wed, 29 Jan 2025 12:54:04 +0100
Message-ID: <20250129115411.2077152-7-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115411.2077152-1-david@redhat.com>
References: <20250129115411.2077152-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QsI8qH4AdhJpNwkSppM_wMSd54N98PVdrjlcLU-1BR8_1738151672
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

There is no need for the distinction anymore; let's merge the readable
and writable device-exclusive entries into a single device-exclusive
entry type.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/swap.h    |  7 +++----
 include/linux/swapops.h | 27 ++++-----------------------
 mm/mprotect.c           |  8 --------
 mm/page_table_check.c   |  5 ++---
 mm/rmap.c               |  2 +-
 5 files changed, 10 insertions(+), 39 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 91b30701274e..9a48e79a0a52 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -74,14 +74,13 @@ static inline int current_is_kswapd(void)
  * to a special SWP_DEVICE_{READ|WRITE} entry.
  *
  * When a page is mapped by the device for exclusive access we set the CPU page
- * table entries to special SWP_DEVICE_EXCLUSIVE_* entries.
+ * table entries to a special SWP_DEVICE_EXCLUSIVE entry.
  */
 #ifdef CONFIG_DEVICE_PRIVATE
-#define SWP_DEVICE_NUM 4
+#define SWP_DEVICE_NUM 3
 #define SWP_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM)
 #define SWP_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+1)
-#define SWP_DEVICE_EXCLUSIVE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
-#define SWP_DEVICE_EXCLUSIVE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
+#define SWP_DEVICE_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
 #else
 #define SWP_DEVICE_NUM 0
 #endif
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index 96f26e29fefe..64ea151a7ae3 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -186,26 +186,16 @@ static inline bool is_writable_device_private_entry(swp_entry_t entry)
 	return unlikely(swp_type(entry) == SWP_DEVICE_WRITE);
 }
 
-static inline swp_entry_t make_readable_device_exclusive_entry(pgoff_t offset)
+static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 {
-	return swp_entry(SWP_DEVICE_EXCLUSIVE_READ, offset);
-}
-
-static inline swp_entry_t make_writable_device_exclusive_entry(pgoff_t offset)
-{
-	return swp_entry(SWP_DEVICE_EXCLUSIVE_WRITE, offset);
+	return swp_entry(SWP_DEVICE_EXCLUSIVE, offset);
 }
 
 static inline bool is_device_exclusive_entry(swp_entry_t entry)
 {
-	return swp_type(entry) == SWP_DEVICE_EXCLUSIVE_READ ||
-		swp_type(entry) == SWP_DEVICE_EXCLUSIVE_WRITE;
+	return swp_type(entry) == SWP_DEVICE_EXCLUSIVE;
 }
 
-static inline bool is_writable_device_exclusive_entry(swp_entry_t entry)
-{
-	return unlikely(swp_type(entry) == SWP_DEVICE_EXCLUSIVE_WRITE);
-}
 #else /* CONFIG_DEVICE_PRIVATE */
 static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 {
@@ -227,12 +217,7 @@ static inline bool is_writable_device_private_entry(swp_entry_t entry)
 	return false;
 }
 
-static inline swp_entry_t make_readable_device_exclusive_entry(pgoff_t offset)
-{
-	return swp_entry(0, 0);
-}
-
-static inline swp_entry_t make_writable_device_exclusive_entry(pgoff_t offset)
+static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
 }
@@ -242,10 +227,6 @@ static inline bool is_device_exclusive_entry(swp_entry_t entry)
 	return false;
 }
 
-static inline bool is_writable_device_exclusive_entry(swp_entry_t entry)
-{
-	return false;
-}
 #endif /* CONFIG_DEVICE_PRIVATE */
 
 #ifdef CONFIG_MIGRATION
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 516b1d847e2c..9cb6ab7c4048 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -225,14 +225,6 @@ static long change_pte_range(struct mmu_gather *tlb,
 				newpte = swp_entry_to_pte(entry);
 				if (pte_swp_uffd_wp(oldpte))
 					newpte = pte_swp_mkuffd_wp(newpte);
-			} else if (is_writable_device_exclusive_entry(entry)) {
-				entry = make_readable_device_exclusive_entry(
-							swp_offset(entry));
-				newpte = swp_entry_to_pte(entry);
-				if (pte_swp_soft_dirty(oldpte))
-					newpte = pte_swp_mksoft_dirty(newpte);
-				if (pte_swp_uffd_wp(oldpte))
-					newpte = pte_swp_mkuffd_wp(newpte);
 			} else if (is_pte_marker_entry(entry)) {
 				/*
 				 * Ignore error swap entries unconditionally,
diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index 509c6ef8de40..c2b3600429a0 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -196,9 +196,8 @@ EXPORT_SYMBOL(__page_table_check_pud_clear);
 /* Whether the swap entry cached writable information */
 static inline bool swap_cached_writable(swp_entry_t entry)
 {
-	return is_writable_device_exclusive_entry(entry) ||
-	    is_writable_device_private_entry(entry) ||
-	    is_writable_migration_entry(entry);
+	return is_writable_device_private_entry(entry) ||
+	       is_writable_migration_entry(entry);
 }
 
 static inline void page_table_check_pte_flags(pte_t pte)
diff --git a/mm/rmap.c b/mm/rmap.c
index 49ffac6d27f8..65d9bbea16d0 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2470,7 +2470,7 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 	 * do_swap_page() will trigger the conversion back while holding the
 	 * folio lock.
 	 */
-	entry = make_writable_device_exclusive_entry(page_to_pfn(page));
+	entry = make_device_exclusive_entry(page_to_pfn(page));
 	swp_pte = swp_entry_to_pte(entry);
 	if (pte_soft_dirty(fw.pte))
 		swp_pte = pte_swp_mksoft_dirty(swp_pte);
-- 
2.48.1

