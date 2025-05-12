Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D16EBAB3707
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 14:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC0B10E3DE;
	Mon, 12 May 2025 12:34:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AdRmZRp4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6AC010E3DD
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 12:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747053277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vjnnC5BACKQYADpf3O8+rlLTsN5UNkR42iRu+4jj/5k=;
 b=AdRmZRp4m6r6RL0T14AcfP2U7HlxJop4Y2QdawtfyR9aRMNf6vxC8w3NACuxwdCF/aXG/z
 5cq7R2bzpPDl+5zMXkuBDoSkZl0mrXHQ/kpMLr9l5JMgR1R/K1S7CMzs4kyJufAu/idvVv
 NKvY5WBtS/QFD847tChR2stMuINI8pA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-_E8lCS94NbWXERCv2vTo4Q-1; Mon, 12 May 2025 08:34:35 -0400
X-MC-Unique: _E8lCS94NbWXERCv2vTo4Q-1
X-Mimecast-MFC-AGG-ID: _E8lCS94NbWXERCv2vTo4Q_1747053274
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43d209dc2d3so21225915e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 05:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747053274; x=1747658074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vjnnC5BACKQYADpf3O8+rlLTsN5UNkR42iRu+4jj/5k=;
 b=v4y+bTL39cv2eeTU1khgDWyh/yC1NZcxwFtcasZk4nxYhv+vz2iQJfv4Py0NukAdcB
 iPRr0eVUyAoTH4S3pnKKpHrYc84iwW5US3XF32LP6GNuhJeZ1SGGU31JMyOyvgsowN7k
 IlVGN6iQIAwuqm+nCLpTuJC7LXDQfEI+D/ApSJVAdoo1+lw5yA6s/gH39pSGZIWB8LEX
 TcVP5XAed4/G2mXHU4Vh8XSKPzYiGFvpRXrhGg+fDTt3jUJhSSIeDCt3+bhWurSa2inT
 dAUK1VOejVgN1x20pd9PTkRyn0spCKVEOrIZh50EnURZ12rLSxg2fWUZo1ww621oF2vs
 5kbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyVS5xo/OTauEOxwlVEdaZE4yLzDLzBmDI+hnxP04ZTq0H/TW7lnD3xPSildYSPQiPpEyLxJWn49A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5Zso9LNW19JfncxW8smZeup8sc6/7BOVNM1ZfXn3A0AdVoZ6m
 9+40jaZEh7BhJAowc9NtU8Y5l7g41IvLJ/5jpJW/fX8SiHqtpq8CnT7KIOCkhLy65g/UMZqh/Da
 O1/0Gowp+NNg/O2O8OMJUueZ7eAkSpFe08BVqPt2orn3H8vTPgklelxQ6YjRHMpKcQw==
X-Gm-Gg: ASbGncvKW5VxrUZeMit86jeGV6yNunnsE0WziEL39xl333ZF3VT5lO79xss24k9ftG4
 OsvAlSSSlBWSggoeAaOoCndArhjuahXS6BTn9PgKqz0tAODLBAoGIEpMOw68Sf+oLUHL++/EIqU
 anaMPY1Pe4/Et0+c31yAkjqVlNfCF9afZ/VO0zjJ1qxG+JdS3bMUFmzFRrxTWpBVc5GDpAgKOch
 tdY4fBngO+vVbfDw2Py6TK8ewGtzy0wEAWdxB4wUxwiwM5oyZP+ZuabfQwes9cv1bwnuu6qo08o
 A/bYrnRnuDOYl2Huv6mQ7+zk7zGbTBHZGXf/Q/9hkw/NMZ4Go4r+6sZFFgUYRqrhlgw4BUSb
X-Received: by 2002:a05:600c:5118:b0:43d:cc9:b09d with SMTP id
 5b1f17b1804b1-442d6dc539cmr82258565e9.20.1747053274328; 
 Mon, 12 May 2025 05:34:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLHMAxfNnCQj32PB2xBlHRpvgTd61IhRYv44GdPG9fUkbIQCt1pbTkP7UkTO09z7pcUrC5ng==
X-Received: by 2002:a05:600c:5118:b0:43d:cc9:b09d with SMTP id
 5b1f17b1804b1-442d6dc539cmr82258205e9.20.1747053273921; 
 Mon, 12 May 2025 05:34:33 -0700 (PDT)
Received: from localhost
 (p200300d82f4a5800f1ae8e20d7f451b0.dip0.t-ipconnect.de.
 [2003:d8:2f4a:5800:f1ae:8e20:d7f4:51b0])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-442d67df5ecsm123693385e9.9.2025.05.12.05.34.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 05:34:33 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, x86@kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>,
 Ingo Molnar <mingo@kernel.org>
Subject: [PATCH v2 03/11] mm: introduce pfnmap_track() and pfnmap_untrack()
 and use them for memremap
Date: Mon, 12 May 2025 14:34:16 +0200
Message-ID: <20250512123424.637989-4-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512123424.637989-1-david@redhat.com>
References: <20250512123424.637989-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wRRjl_DK20hKaj9HzKJRjCRjy_BxUqbHNWeIkPytouU_1747053274
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

Let's provide variants of track_pfn_remap() and untrack_pfn() that won't
mess with VMAs, and replace the usage in mm/memremap.c.

Add some documentation.

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/mm/pat/memtype.c | 14 ++++++++++++++
 include/linux/pgtable.h   | 39 +++++++++++++++++++++++++++++++++++++++
 mm/memremap.c             |  8 ++++----
 3 files changed, 57 insertions(+), 4 deletions(-)

diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index fa78facc6f633..1ec8af6cad6bf 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -1068,6 +1068,20 @@ int pfnmap_setup_cachemode(unsigned long pfn, unsigned long size, pgprot_t *prot
 	return 0;
 }
 
+int pfnmap_track(unsigned long pfn, unsigned long size, pgprot_t *prot)
+{
+	const resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
+
+	return reserve_pfn_range(paddr, size, prot, 0);
+}
+
+void pfnmap_untrack(unsigned long pfn, unsigned long size)
+{
+	const resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
+
+	free_pfn_range(paddr, size);
+}
+
 /*
  * untrack_pfn is called while unmapping a pfnmap for a region.
  * untrack can be called for a specific region indicated by pfn and size or
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index be1745839871c..90f72cd358390 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1502,6 +1502,16 @@ static inline int pfnmap_setup_cachemode(unsigned long pfn, unsigned long size,
 	return 0;
 }
 
+static inline int pfnmap_track(unsigned long pfn, unsigned long size,
+		pgprot_t *prot)
+{
+	return 0;
+}
+
+static inline void pfnmap_untrack(unsigned long pfn, unsigned long size)
+{
+}
+
 /*
  * track_pfn_copy is called when a VM_PFNMAP VMA is about to get the page
  * tables copied during copy_page_range(). Will store the pfn to be
@@ -1575,6 +1585,35 @@ extern int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
  */
 int pfnmap_setup_cachemode(unsigned long pfn, unsigned long size,
 		pgprot_t *prot);
+
+/**
+ * pfnmap_track - track a pfn range
+ * @pfn: the start of the pfn range
+ * @size: the size of the pfn range in bytes
+ * @prot: the pgprot to track
+ *
+ * Requested the pfn range to be 'tracked' by a hardware implementation and
+ * setup the cachemode in @prot similar to pfnmap_setup_cachemode().
+ *
+ * This allows for fine-grained control of memory cache behaviour at page
+ * level granularity. Tracking memory this way is persisted across VMA splits
+ * (VMA merging does not apply for VM_PFNMAP).
+ *
+ * Currently, there is only one implementation for this - x86 Page Attribute
+ * Table (PAT). See Documentation/arch/x86/pat.rst for more details.
+ *
+ * Returns 0 on success and -EINVAL on error.
+ */
+int pfnmap_track(unsigned long pfn, unsigned long size, pgprot_t *prot);
+
+/**
+ * pfnmap_untrack - untrack a pfn range
+ * @pfn: the start of the pfn range
+ * @size: the size of the pfn range in bytes
+ *
+ * Untrack a pfn range previously tracked through pfnmap_track().
+ */
+void pfnmap_untrack(unsigned long pfn, unsigned long size);
 extern int track_pfn_copy(struct vm_area_struct *dst_vma,
 		struct vm_area_struct *src_vma, unsigned long *pfn);
 extern void untrack_pfn_copy(struct vm_area_struct *dst_vma,
diff --git a/mm/memremap.c b/mm/memremap.c
index 2aebc1b192da9..c417c843e9b1f 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -130,7 +130,7 @@ static void pageunmap_range(struct dev_pagemap *pgmap, int range_id)
 	}
 	mem_hotplug_done();
 
-	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range), true);
+	pfnmap_untrack(PHYS_PFN(range->start), range_len(range));
 	pgmap_array_delete(range);
 }
 
@@ -211,8 +211,8 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 	if (nid < 0)
 		nid = numa_mem_id();
 
-	error = track_pfn_remap(NULL, &params->pgprot, PHYS_PFN(range->start), 0,
-			range_len(range));
+	error = pfnmap_track(PHYS_PFN(range->start), range_len(range),
+			     &params->pgprot);
 	if (error)
 		goto err_pfn_remap;
 
@@ -277,7 +277,7 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 	if (!is_private)
 		kasan_remove_zero_shadow(__va(range->start), range_len(range));
 err_kasan:
-	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range), true);
+	pfnmap_untrack(PHYS_PFN(range->start), range_len(range));
 err_pfn_remap:
 	pgmap_array_delete(range);
 	return error;
-- 
2.49.0

