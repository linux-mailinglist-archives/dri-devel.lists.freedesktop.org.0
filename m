Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF9FCDAAC0
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 22:23:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8232710E070;
	Tue, 23 Dec 2025 21:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e0uddnNZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB2610E070
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 21:23:48 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-7ba55660769so4354560b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 13:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766525028; x=1767129828; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aUOtxvoS/dJ0bosqqi9uYzrSZp+RubGpXgIfU8VaOC0=;
 b=e0uddnNZVeiHtbNtUBd4X+eQz0BdUBbhfIH+jJkOP32YJloLmXJYP14NdjQJ0a9qbr
 w4AIeA7hnUfjakSJt9g17C2yVzUF6DvRdOUZ7BC3FhqL/rnYgBSXbyRKchRrobYY//Qa
 ii6dVFagWlB8xb+0IDX764IhIGWc26EM8u9e0twmDofKmtdfLd4frgsma+hdR9ji49Tk
 JC3GqBLnA/Sza54jvkCeayiWBYiqRdgYJ+1Xov7LPiEXiYZQexTLMzN0snaVqskxrN7M
 Iu+umC21Innb0jv/uEKQO9IRrl7dSZRXSCFNxHEu1la+DwMxVAu9YIYWPD289DXZLKgg
 u8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766525028; x=1767129828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aUOtxvoS/dJ0bosqqi9uYzrSZp+RubGpXgIfU8VaOC0=;
 b=wOmGKezIXRzPcJ9+zvGxP6zSDf7yt8A4oL7ZZcjlsX/DNX+8RY3mMrJkxWDSvFpM0a
 dnop6Y6TO7KiehB+HhbUiIeqwGlexfVGeE3BMwPoRYSlNv/Bce2AaGxbEKOZ9yYFqF9a
 hzs3JSNx+mRhUhDC0/0IDXbfy2LcwwlF3j13vOqKGDotYD8o+YcnXmtADwkQPnQWcUPK
 eizKwbBaG/ZU7euxrD7RoQok44WVXNfSyPgFVuWvbEMZmMFyYEeltmpyviALRjQ1bYWu
 xMHTPlQ1/LZZbiqWIWjoL64dLXRZToqsdMy+9dVNQYyhD5g2+ZtFewDr9HCpDnU5KYqQ
 WQ5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWos1cYNT0Em7rCLghPYjPH+0DwOYiR9/sbJaH/mIbg5tSfGu1pnLJOCCI26RKiLVOu3VsDd42efes=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzddZJFA5degeZkCm3zzC0UNPYVqewMA2XzYfyt40VfcmDb+rz1
 1K/GW4HPHSvt3k3aDn5m7nCiSS6UNcPl+qbFbpWGX6IS6YPrnfwLozIG
X-Gm-Gg: AY/fxX7sj1VGcdHR6BHxc0PG3/JEWUhnkq71TrWsYKYhW7nPbeXi4oLuw9ygPQGPN1o
 FqAD8A9twL6PH1wj7TbSiQFqUfEUdFDzgJ5HvCeC8Bs5wXOCs8FcLMkJnByKwHFpOOZo3c1QAvF
 JMe6MRUyQt0ICvnXYOm5Vg+aAvh5x7eLXFOzytCZGwmyZDufeuYMdQmnLi2eIJZhSUrw/iGCulo
 3HkGg9VO+mM/+PBwup+vE9IDdsCaVnTcPy8jn1Bixpllgv9e57Q7PF2n0+KwjVJckpDbDAd41m1
 GAMLFnS2vqfc+MD0JxAB1chtoIf+U6pSdA2TTGjzn5wDhkxn4uqkzQGdQjbq+cpdLRqlwry7lDx
 Q4vB+g6/Nv3DAD8FpZnc1GQIPTjuWIBS0+CMIys4Nzidnv1hLjMqxY3psEtsEp5seiqyALQUTMD
 Fz5KJpgk7LjRPWmW6ITKHeO68=
X-Google-Smtp-Source: AGHT+IFjl4NYgeswg6t6gVHpQmyKXq6Zs/y+ycrSPrseIyz6yvUumVrAY0eo9AqIFMVJD/juZ07wKw==
X-Received: by 2002:a05:6a00:3017:b0:781:1f28:eadd with SMTP id
 d2e1a72fcca58-7ff646f8f08mr13731625b3a.20.1766525027718; 
 Tue, 23 Dec 2025 13:23:47 -0800 (PST)
Received: from barry-desktop.hub ([47.72.129.29])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e48cffesm14433009b3a.49.2025.12.23.13.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 13:23:45 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: urezki@gmail.com
Cc: 21cnbao@gmail.com, akpm@linux-foundation.org, david@kernel.org,
 dri-devel@lists.freedesktop.org, jstultz@google.com,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org, mripard@kernel.org,
 sumit.semwal@linaro.org, v-songbaohua@oppo.com, zhengtangquan@oppo.com
Subject: Re: [PATCH] mm/vmalloc: map contiguous pages in batches for vmap()
 whenever possible
Date: Wed, 24 Dec 2025 10:23:34 +1300
Message-ID: <20251223212336.36249-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <aUlC6N1jmDbMDPc5@milan>
References: <aUlC6N1jmDbMDPc5@milan>
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

> >  /*
> >   * vmap_pages_range_noflush is similar to vmap_pages_range, but does not
> >   * flush caches.
> > @@ -658,20 +672,35 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> >
> >       WARN_ON(page_shift < PAGE_SHIFT);
> >
> > +     /*
> > +      * For vmap(), users may allocate pages from high orders down to
> > +      * order 0, while always using PAGE_SHIFT as the page_shift.
> > +      * We first check whether the initial page is a compound page. If so,
> > +      * there may be an opportunity to batch multiple pages together.
> > +      */
> >       if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> > -                     page_shift == PAGE_SHIFT)
> > +                     (page_shift == PAGE_SHIFT && !PageCompound(pages[0])))
> >               return vmap_small_pages_range_noflush(addr, end, prot, pages);
> Hm.. If first few pages are order-0 and the rest are compound
> then we do nothing.

Now the dma-buf is allocated in descending order. If page0
is not huge, page1 will not be either. However, I agree that
we may extend support for this case.

>
> >
> > -     for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
> > +     for (i = 0; i < nr; ) {
> > +             unsigned int shift = page_shift;
> >               int err;
> >
> > -             err = vmap_range_noflush(addr, addr + (1UL << page_shift),
> > +             /*
> > +              * For vmap() cases, page_shift is always PAGE_SHIFT, even
> > +              * if the pages are physically contiguous, they may still
> > +              * be mapped in a batch.
> > +              */
> > +             if (page_shift == PAGE_SHIFT)
> > +                     shift += get_vmap_batch_order(pages, nr - i, i);
> > +             err = vmap_range_noflush(addr, addr + (1UL << shift),
> >                                       page_to_phys(pages[i]), prot,
> > -                                     page_shift);
> > +                                     shift);
> >               if (err)
> >                       return err;
> >
> > -             addr += 1UL << page_shift;
> > +             addr += 1UL  << shift;
> > +             i += 1U << shift;
> >       }
> >
> >       return 0;
> >
> > Does this look clearer?
> >
> The concern is we mix it with a huge page mapping path. If we want to batch
> v-mapping for page_shift == PAGE_SHIFT case, where "pages" array may contain
> compound pages(folio)(corner case to me), i think we should split it.

I agree this might not be common when the vmap buffer is only
used by the CPU. However, for GPUs, NPUs, and similar devices,
benefiting from larger mappings may be quite common.

Does the code below, which moves batched mapping to vmap(),
address both of your concerns?

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index ecbac900c35f..782f2eac8a63 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3501,6 +3501,20 @@ void vunmap(const void *addr)
 }
 EXPORT_SYMBOL(vunmap);
 
+static inline int get_vmap_batch_order(struct page **pages,
+		unsigned int max_steps, unsigned int idx)
+{
+	unsigned int nr_pages;
+
+	nr_pages = compound_nr(pages[idx]);
+	if (nr_pages == 1 || max_steps < nr_pages)
+		return 0;
+
+	if (num_pages_contiguous(&pages[idx], nr_pages) == nr_pages)
+		return compound_order(pages[idx]);
+	return 0;
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -3544,10 +3558,21 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;
 
 	addr = (unsigned long)area->addr;
-	if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
-				pages, PAGE_SHIFT) < 0) {
-		vunmap(area->addr);
-		return NULL;
+	for (unsigned int i = 0; i < count; ) {
+		unsigned int shift = PAGE_SHIFT;
+		int err;
+
+		shift += get_vmap_batch_order(pages, count - i, i);
+		err = vmap_range_noflush(addr, addr + (1UL << shift),
+				page_to_phys(pages[i]), pgprot_nx(prot),
+				shift);
+		if (err) {
+			vunmap(area->addr);
+			return NULL;
+		}
+
+		addr += 1UL  << shift;
+		i += 1U << shift;
 	}
 
 	if (flags & VM_MAP_PUT_PAGES) {
-- 
2.48.1

Thanks
Barry
