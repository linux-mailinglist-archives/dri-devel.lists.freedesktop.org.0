Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E85CCDACF
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 22:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF10B10E490;
	Thu, 18 Dec 2025 21:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m7HLPAG+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C401710E490
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 21:24:46 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7aae5f2633dso1152050b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 13:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766093086; x=1766697886; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YTohBmtIORr8n8lsBagnrEz6IPI4sdKvMwJT/pJENjY=;
 b=m7HLPAG+Zi7qb/nAtZyb6A/9l0B0FM+A3qc1VkVR5XZp3XZ1V9b5+V4JrERUN6dxjA
 8hAPNRRYNnfah5Sc/6TBKyLohcbwzRs6kgW59ox/1ZKw7KMq4CxR1kt6TPLIDzSRgfzz
 g/BpJH0HhVD273FkQRTKkUIsJt5wSjKgcgcwtelALK4owrM7fHiZLdVWsw4arDt6h3Ux
 UY6Ow5+soYtpuoBjU7xrz865vQbzJALAzqSR5sZe1HVYw2dyG8nsnmO8njmZ4VLGUG/q
 6KoBPZFFGTiJYOeF2TUPEdXJ56vMBR1ylw+mJPHIJYqcJ7Ci+izaM5mC/caE55gpcOlz
 XGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766093086; x=1766697886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YTohBmtIORr8n8lsBagnrEz6IPI4sdKvMwJT/pJENjY=;
 b=stRy7xeGWhoE/bj+mE2ahHl6bKaKSqV5QxAXrrVsosAdjafo4veB6U6dfLD1SsJT/2
 h4XqDMGQT2kJdoSXR21MB2PRsG/V4eq+2clswPopuZ63KDnYYiiPC6+tsqB/EmfAaeD9
 Mo7R27aejAtnUg5R5Be9iqnZQWIHkWwUwBzSMlZZvPNM69KUccmy3itFLga4+0uGPS5Q
 LB5BAqWe1QnEiuEkUvU6b+YX6TJAyv+n6bNFqOJ5mOdk+q7+gOJMrNIkGvOXE9qHgD4C
 njhOVP7PGbFR/6yq0963lyMFG6DnwnyDrTH3JNaj9tZePTia2sOlTZr4+3u4HBkE9Sny
 mwKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpxXbpqRRlivM7ds8bTzlWmphVIbWfLtn5RpUa+iTLDZJq3B8VYaBNTvIlzFH4maafcIzFe1giATQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYnBSM9VQvjtwF1ov/o+qZx7c2/W5RSZnTXOYRwA9S3D3gjksJ
 /Ep4ndxI0lBQlot8UHJ4lV1kAU6xfyn7VZk5ZHimz1zrep+oJl/dWmTg
X-Gm-Gg: AY/fxX4w/Sn5vKJEFwqhW6rt4dnIDDMvnD0DZozZTYxtq0Sk5ASagjAtRrKjLEnhsFl
 RLJSaa6vl5dhy7y9fpLH+AgbSFLgEMPkj+U1WVUcPnRJ7RWLLWQ7gh/BduElChbp8KfeET184oX
 ZpN3aJ9XSx/saT/7Ah2/rqemRoA9onzxHIoXiMarj/hRxcpZaG1QJV19xxVbt1DRvGem/IQKxEl
 6AH6BqTEKcYAivxGon5uLq5txGJ/UX4kON5dR6pw06HnG1bY0Zg4HwL2oEkPpYlT3TRbObcgky3
 iDRQIS+L7F591MQoCJeqR4OhJ+d3S4ejXxxr8ehpIsme5cyFteEC3L9CenpzocZ6t81OHGdSXHy
 eRD7OSGRQGbZKU1RQVIx4s3nKDGUBjMJ822Zx1Bp/9nr8Ev0Gg8fDS3l02X+Maehy+JDga53PJk
 JrhUbPteFagfQQg61HZHJQPzqq
X-Google-Smtp-Source: AGHT+IGdOHVdrcCuEhBbazWVZdWwuUQF6Z6rcTSGphDUl2qn81RLeTCX0R1hfWncTkyQFdQxgYXjUA==
X-Received: by 2002:a05:6a00:808c:b0:7e8:450c:61b5 with SMTP id
 d2e1a72fcca58-7ff6607b7e7mr687761b3a.37.1766093086042; 
 Thu, 18 Dec 2025 13:24:46 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ff7a939ea2sm258519b3a.4.2025.12.18.13.24.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 18 Dec 2025 13:24:45 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: urezki@gmail.com
Cc: 21cnbao@gmail.com, akpm@linux-foundation.org, david@kernel.org,
 dri-devel@lists.freedesktop.org, jstultz@google.com,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org, mripard@kernel.org,
 sumit.semwal@linaro.org, v-songbaohua@oppo.com, zhengtangquan@oppo.com
Subject: Re: [PATCH] mm/vmalloc: map contiguous pages in batches for vmap()
 whenever possible
Date: Fri, 19 Dec 2025 05:24:36 +0800
Message-Id: <20251218212436.17142-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <aUQHss6K8b_esvpw@milan>
References: <aUQHss6K8b_esvpw@milan>
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

On Thu, Dec 18, 2025 at 9:55 PM Uladzislau Rezki <urezki@gmail.com> wrote:
>
> On Thu, Dec 18, 2025 at 02:01:56PM +0100, David Hildenbrand (Red Hat) wrote:
> > On 12/15/25 06:30, Barry Song wrote:
> > > From: Barry Song <v-songbaohua@oppo.com>
> > >
> > > In many cases, the pages passed to vmap() may include high-order
> > > pages allocated with __GFP_COMP flags. For example, the systemheap
> > > often allocates pages in descending order: order 8, then 4, then 0.
> > > Currently, vmap() iterates over every page individually—even pages
> > > inside a high-order block are handled one by one.
> > >
> > > This patch detects high-order pages and maps them as a single
> > > contiguous block whenever possible.
> > >
> > > An alternative would be to implement a new API, vmap_sg(), but that
> > > change seems to be large in scope.
> > >
> > > When vmapping a 128MB dma-buf using the systemheap, this patch
> > > makes system_heap_do_vmap() roughly 17× faster.
> > >
> > > W/ patch:
> > > [   10.404769] system_heap_do_vmap took 2494000 ns
> > > [   12.525921] system_heap_do_vmap took 2467008 ns
> > > [   14.517348] system_heap_do_vmap took 2471008 ns
> > > [   16.593406] system_heap_do_vmap took 2444000 ns
> > > [   19.501341] system_heap_do_vmap took 2489008 ns
> > >
> > > W/o patch:
> > > [    7.413756] system_heap_do_vmap took 42626000 ns
> > > [    9.425610] system_heap_do_vmap took 42500992 ns
> > > [   11.810898] system_heap_do_vmap took 42215008 ns
> > > [   14.336790] system_heap_do_vmap took 42134992 ns
> > > [   16.373890] system_heap_do_vmap took 42750000 ns
> > >
> >
> > That's quite a speedup.
> >
> > > Cc: David Hildenbrand <david@kernel.org>
> > > Cc: Uladzislau Rezki <urezki@gmail.com>
> > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > Cc: John Stultz <jstultz@google.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Tested-by: Tangquan Zheng <zhengtangquan@oppo.com>
> > > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > > ---
> > >   * diff with rfc:
> > >   Many code refinements based on David's suggestions, thanks!
> > >   Refine comment and changelog according to Uladzislau, thanks!
> > >   rfc link:
> > >   https://lore.kernel.org/linux-mm/20251122090343.81243-1-21cnbao@gmail.com/
> > >
> > >   mm/vmalloc.c | 45 +++++++++++++++++++++++++++++++++++++++------
> > >   1 file changed, 39 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > index 41dd01e8430c..8d577767a9e5 100644
> > > --- a/mm/vmalloc.c
> > > +++ b/mm/vmalloc.c
> > > @@ -642,6 +642,29 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
> > >     return err;
> > >   }
> > > +static inline int get_vmap_batch_order(struct page **pages,
> > > +           unsigned int stride, unsigned int max_steps, unsigned int idx)
> > > +{
> > > +   int nr_pages = 1;
> >
> > unsigned int, maybe

Right

> >
> > Why are you initializing nr_pages when you overwrite it below?

Right, initializing nr_pages can be dropped.

> >
> > > +
> > > +   /*
> > > +    * Currently, batching is only supported in vmap_pages_range
> > > +    * when page_shift == PAGE_SHIFT.
> >
> > I don't know the code so realizing how we go from page_shift to stride too
> > me a second. Maybe only talk about stride here?
> >
> > OTOH, is "stride" really the right terminology?
> >
> > we calculate it as
> >
> >       stride = 1U << (page_shift - PAGE_SHIFT);
> >
> > page_shift - PAGE_SHIFT should give us an "order". So is this a
> > "granularity" in nr_pages?

This is the case where vmalloc() may realize that it has
high-order pages and therefore calls
vmap_pages_range_noflush() with a page_shift larger than
PAGE_SHIFT. For vmap(), we take a pages array, so
page_shift is always PAGE_SHIFT.

> >
> > Again, I don't know this code, so sorry for the question.
> >
> To me "stride" also sounds unclear.

Thanks, David and Uladzislau. On second thought, this stride may be
redundant, and it should be possible to drop it entirely. This results
in the code below:

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 41dd01e8430c..3962bdcb43e5 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -642,6 +642,20 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
 	return err;
 }
 
+static inline int get_vmap_batch_order(struct page **pages,
+		unsigned int max_steps, unsigned int idx)
+{
+	unsigned int nr_pages	 = compound_nr(pages[idx]);
+
+	if (nr_pages == 1 || max_steps < nr_pages)
+		return 0;
+
+	if (num_pages_contiguous(&pages[idx], nr_pages) == nr_pages)
+		return compound_order(pages[idx]);
+	return 0;
+}
+
 /*
  * vmap_pages_range_noflush is similar to vmap_pages_range, but does not
  * flush caches.
@@ -658,20 +672,35 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 
 	WARN_ON(page_shift < PAGE_SHIFT);
 
+	/*
+	 * For vmap(), users may allocate pages from high orders down to
+	 * order 0, while always using PAGE_SHIFT as the page_shift.
+	 * We first check whether the initial page is a compound page. If so,
+	 * there may be an opportunity to batch multiple pages together.
+	 */
 	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
-			page_shift == PAGE_SHIFT)
+			(page_shift == PAGE_SHIFT && !PageCompound(pages[0])))
 		return vmap_small_pages_range_noflush(addr, end, prot, pages);
 
-	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
+	for (i = 0; i < nr; ) {
+		unsigned int shift = page_shift;
 		int err;
 
-		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
+		/*
+		 * For vmap() cases, page_shift is always PAGE_SHIFT, even
+		 * if the pages are physically contiguous, they may still
+		 * be mapped in a batch.
+		 */
+		if (page_shift == PAGE_SHIFT)
+			shift += get_vmap_batch_order(pages, nr - i, i);
+		err = vmap_range_noflush(addr, addr + (1UL << shift),
 					page_to_phys(pages[i]), prot,
-					page_shift);
+					shift);
 		if (err)
 			return err;
 
-		addr += 1UL << page_shift;
+		addr += 1UL  << shift;
+		i += 1U << shift;
 	}
 
 	return 0;

Does this look clearer?

Thanks
Barry
