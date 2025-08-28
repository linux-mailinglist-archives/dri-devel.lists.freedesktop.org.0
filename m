Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F83B3B41B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 09:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8540110EB5C;
	Fri, 29 Aug 2025 07:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IMQ/+Wm8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8214D10E19F;
 Thu, 28 Aug 2025 07:43:58 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-61cb9f6dbe7so1139201a12.0; 
 Thu, 28 Aug 2025 00:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756367037; x=1756971837; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uCyWFKVmsqDpuka3mORfqvZ6ED5815cQsuT83UfJ0fY=;
 b=IMQ/+Wm8thcXQbsQ3Lxt1O7uG8LDGr1D/VgzgKObFGYbYJIrsast5iqazV3skuhwhm
 8GpI0C6IRZ0aA9aX0S9RV2uCJ3zQwkDm2mtTHBpQh++Y2FHuLEga5/MCUp0myX+VNe9W
 72kAc+A0ykWU37cQ9FD8LvuQ5jrQjmsW9+BFXQ4lLdmzo1r3XAdT2jBDgoRJ1Z81B4Vu
 vVx1ph0DNWzcQkzU89MwpvG3bUSsfPN8JU6huRgxKaJZwRTyKKSBduQa3zvndg+GzXpG
 gPhbNMBWE9BzoZARGWURyG0dwaEL4hcTz+98Ac5V3w7SEupHjdsbp73wVBjnEVs4iwn/
 61AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756367037; x=1756971837;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uCyWFKVmsqDpuka3mORfqvZ6ED5815cQsuT83UfJ0fY=;
 b=co87OKaPr53xd1O4U7iP6W9MGfCpUBI1aMxD8hfaRiORX9bFdOVQHj1oy8p3Tqx6sB
 1kAgRZ1Y0A7ygR2hI6QJZymM3GwmrlAGuMnLm5XupYyE++xTEAHLXq4qayz8plZ6fx8y
 Zoc4z16a5pmeIleL5Ygb3rdTMazrvBusu3UvGLf3Ad89HhS/p2tGAIjbXaZW7I4WxZLQ
 b1sMjnjspm8gztVL31gjo80BAv5awhnMWR6vAP3nPrTDwc3OGXwdokkOURqDozn5X74v
 lJ+3WGTLEAsstogRnjGnmju0q9Emnhc+UowkDw6N36CarRF0/zK1IIYteG6pzNG7f4JM
 nSUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbU6Lr1chyn4DhbvamTdZh+74wr2hH/F8jJu2CGwX9+itPf9BBeLeEjy1wLDJznvLAbvLppRSWdlU=@lists.freedesktop.org,
 AJvYcCWpZFqomsuP/1xdrlYMC5XeX/PAPFk1qP9iu45p0wBFeCXtxwkbIGFIRho42esCTOlgTiut/6tA1eAX@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGRwS/AimDV+oG0uCsLlP0c5aOd+k7RTTbiA36RWsucxXZqh4A
 SL6Cu7tYqY6WSZ8rqLJ021nB8zy0IuzsHO2MReitRWTYZgfjp8/Edwuh
X-Gm-Gg: ASbGncueFtr9EaXhB1g3tMzHCGotKDJFib21Fve9llGhiGY918jpborbdzqM33cOQGC
 +8/bxBiwZIU8qoA9qoe6/2NDtU9XOBs0+f+rfeDWbqVwnHzVAh3dVCs+cby1tit944QG7Oj2tcQ
 R2diqVLFQhl1ZFUFywhrenUecIPvDzb+dqN/3SPCaxycGZDsTS6LagItBkxRS+Wd/9kiIaw0qqW
 u3l6qocikMbFAXjtczBc9ensHO76RsdAY1sjyP8pQfn9X1VD3w4nD7HHAzUCLMzIHdGQJoy0xJk
 NOm5YoA2CCdPFAKcxXr4+hn7xRjfRQcmNoCg6iVpk176r6bQyl8I7Ap1qRrwkKm6PAug+51xKqM
 ORssr+VaoR0r6NCrRqbwjJeid7Y8djUsy8uItz5dAmU+njQ4=
X-Google-Smtp-Source: AGHT+IFCWGCB9w3JZkSqlrk4a0OYpaWYnOsewLh1z3k9Jb7NB4buZSqln74MwC7LX4UWbpbQGZTMJw==
X-Received: by 2002:a17:906:3717:b0:afe:764d:6b31 with SMTP id
 a640c23a62f3a-afe764d736dmr1280383766b.4.1756367036783; 
 Thu, 28 Aug 2025 00:43:56 -0700 (PDT)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe48fae316sm1165798866b.28.2025.08.28.00.43.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Aug 2025 00:43:56 -0700 (PDT)
Date: Thu, 28 Aug 2025 07:43:56 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>,
 Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, iommu@lists.linux.dev,
 io-uring@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
 Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
 John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org
Subject: Re: [PATCH v1 12/36] mm: simplify folio_page() and folio_page_idx()
Message-ID: <20250828074356.3xiuqugokg36yuxw@master>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-13-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827220141.262669-13-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Fri, 29 Aug 2025 07:17:00 +0000
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 28, 2025 at 12:01:16AM +0200, David Hildenbrand wrote:
>Now that a single folio/compound page can no longer span memory sections
>in problematic kernel configurations, we can stop using nth_page().
>
>While at it, turn both macros into static inline functions and add
>kernel doc for folio_page_idx().
>
>Reviewed-by: Zi Yan <ziy@nvidia.com>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

The code looks good, while one nit below.

>---
> include/linux/mm.h         | 16 ++++++++++++++--
> include/linux/page-flags.h |  5 ++++-
> 2 files changed, 18 insertions(+), 3 deletions(-)
>
>diff --git a/include/linux/mm.h b/include/linux/mm.h
>index 2dee79fa2efcf..f6880e3225c5c 100644
>--- a/include/linux/mm.h
>+++ b/include/linux/mm.h
>@@ -210,10 +210,8 @@ extern unsigned long sysctl_admin_reserve_kbytes;
> 
> #if defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
> #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
>-#define folio_page_idx(folio, p)	(page_to_pfn(p) - folio_pfn(folio))
> #else
> #define nth_page(page,n) ((page) + (n))
>-#define folio_page_idx(folio, p)	((p) - &(folio)->page)
> #endif
> 
> /* to align the pointer to the (next) page boundary */
>@@ -225,6 +223,20 @@ extern unsigned long sysctl_admin_reserve_kbytes;
> /* test whether an address (unsigned long or pointer) is aligned to PAGE_SIZE */
> #define PAGE_ALIGNED(addr)	IS_ALIGNED((unsigned long)(addr), PAGE_SIZE)
> 
>+/**
>+ * folio_page_idx - Return the number of a page in a folio.
>+ * @folio: The folio.
>+ * @page: The folio page.
>+ *
>+ * This function expects that the page is actually part of the folio.
>+ * The returned number is relative to the start of the folio.
>+ */
>+static inline unsigned long folio_page_idx(const struct folio *folio,
>+		const struct page *page)
>+{
>+	return page - &folio->page;
>+}
>+
> static inline struct folio *lru_to_folio(struct list_head *head)
> {
> 	return list_entry((head)->prev, struct folio, lru);
>diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
>index 5ee6ffbdbf831..faf17ca211b4f 100644
>--- a/include/linux/page-flags.h
>+++ b/include/linux/page-flags.h
>@@ -316,7 +316,10 @@ static __always_inline unsigned long _compound_head(const struct page *page)
>  * check that the page number lies within @folio; the caller is presumed
>  * to have a reference to the page.
>  */
>-#define folio_page(folio, n)	nth_page(&(folio)->page, n)
>+static inline struct page *folio_page(struct folio *folio, unsigned long n)
>+{
>+	return &folio->page + n;
>+}
> 

Curious about why it is in page-flags.h. It seems not related to page-flags.

> static __always_inline int PageTail(const struct page *page)
> {
>-- 
>2.50.1
>

-- 
Wei Yang
Help you, Help me
