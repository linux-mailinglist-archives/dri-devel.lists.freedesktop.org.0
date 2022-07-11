Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04638570467
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 15:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14EE14A9C3;
	Mon, 11 Jul 2022 13:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95B714A9C3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 13:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657546552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/a5xYvzFvSo0mMGHcGn3XDGCspkQtQvU8SRGH+lIT7E=;
 b=NK7K971bBe7507+gVjFwOzqtB33ngAS+JdqBNbmx5Bv7H5eMd9Ediq7y2AecBaqIeDTttq
 IKIE5B7HpCZxOxPFQ17UmSeJ5ikyXtglxIG/xoSVvKWGX/wiSuSoH4CM1AULCLkTBnMd6V
 Pnu4xOe28dyUSrqRQl3S25MkJKw7TWM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-g0dfj64mMdWuOZNgDwctQw-1; Mon, 11 Jul 2022 09:35:45 -0400
X-MC-Unique: g0dfj64mMdWuOZNgDwctQw-1
Received: by mail-wm1-f72.google.com with SMTP id
 n18-20020a05600c501200b003a050cc39a0so2676814wmr.7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 06:35:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=/a5xYvzFvSo0mMGHcGn3XDGCspkQtQvU8SRGH+lIT7E=;
 b=UWCymy9I3Q84Qtokw5nXIqJGrF6P/XASqynH0UP7LmYEfMJmIaGTfcfWrdVTSKMmvX
 SnyMWp5wwwusk1G1fYJg1mwazfChqGgrzSw0VlFR6Ovgjmynxr0G1wVOMtUPYp3MrbnZ
 wGszrtZUg1hRN76/SEeiyHxyaKgbstlOOSjOsexY+NqKcQ0A9ITUy5wflemPbBAYWY/4
 jfmdTAOtOj6WS244fwDWPy3O1BKExEbnBQwBvnL/wNLBEcMiERuyA3iOkL1aobuuv4Vt
 EoQyxxrxe+1UQBhdwn/MmMX1wQ78Gbwclq8czMz5+5YG5tMIMCLrSzWG+yvpPi2r2tJl
 LHKQ==
X-Gm-Message-State: AJIora/IOqII4Fid5NW2htVnF5R9K94G6FfFkvZSTX70Rp65AALplaxV
 axIIxZrBwv298RNeNcXGd5b7GlTO5e0A7w+oIwkd97R/9kfq9n297aZuWB/YuwfC0NF9XTTaa7Y
 SieZo2uDw9qLzlYpdyqgBLkvP7ZJd
X-Received: by 2002:a5d:64e8:0:b0:21d:2fc9:20dd with SMTP id
 g8-20020a5d64e8000000b0021d2fc920ddmr16233258wri.101.1657546543641; 
 Mon, 11 Jul 2022 06:35:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1swwNqqy08ywAh4vjGNUUySj6rzTVDwFqgW9rlmCmMyqw6xznPhl3IGIvkFU36hZ2LDn+8inw==
X-Received: by 2002:a5d:64e8:0:b0:21d:2fc9:20dd with SMTP id
 g8-20020a5d64e8000000b0021d2fc920ddmr16233220wri.101.1657546543286; 
 Mon, 11 Jul 2022 06:35:43 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:1400:c3:4ae0:6d5c:1ab2?
 (p200300cbc702140000c34ae06d5c1ab2.dip0.t-ipconnect.de.
 [2003:cb:c702:1400:c3:4ae0:6d5c:1ab2])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c510800b003a2e2e965absm5753132wms.20.2022.07.11.06.35.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 06:35:42 -0700 (PDT)
Message-ID: <2c4dd559-4fa9-f874-934f-d6b674543d0f@redhat.com>
Date: Mon, 11 Jul 2022 15:35:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To: Alex Sierra <alex.sierra@amd.com>, jgg@nvidia.com
References: <20220707190349.9778-1-alex.sierra@amd.com>
 <20220707190349.9778-8-alex.sierra@amd.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v8 07/15] mm/gup: migrate device coherent pages when
 pinning instead of failing
In-Reply-To: <20220707190349.9778-8-alex.sierra@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: rcampbell@nvidia.com, willy@infradead.org, Felix.Kuehling@amd.com,
 apopple@nvidia.com, amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07.07.22 21:03, Alex Sierra wrote:
> From: Alistair Popple <apopple@nvidia.com>
> 
> Currently any attempts to pin a device coherent page will fail. This is
> because device coherent pages need to be managed by a device driver, and
> pinning them would prevent a driver from migrating them off the device.
> 
> However this is no reason to fail pinning of these pages. These are
> coherent and accessible from the CPU so can be migrated just like
> pinning ZONE_MOVABLE pages. So instead of failing all attempts to pin
> them first try migrating them out of ZONE_DEVICE.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> [hch: rebased to the split device memory checks,
>       moved migrate_device_page to migrate_device.c]
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  mm/gup.c            | 47 +++++++++++++++++++++++++++++++++++-----
>  mm/internal.h       |  1 +
>  mm/migrate_device.c | 53 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 96 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index b65fe8bf5af4..9b6b9923d22d 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1891,9 +1891,43 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>  			continue;
>  		prev_folio = folio;
>  
> -		if (folio_is_longterm_pinnable(folio))
> +		/*
> +		 * Device private pages will get faulted in during gup so it
> +		 * shouldn't be possible to see one here.
> +		 */
> +		if (WARN_ON_ONCE(folio_is_device_private(folio))) {
> +			ret = -EFAULT;
> +			goto unpin_pages;
> +		}

I'd just drop that. Device private pages are never part of a present PTE. So if we
could actually get a grab of one via GUP we would be in bigger trouble ... 
already before this patch.

> +
> +		/*
> +		 * Device coherent pages are managed by a driver and should not
> +		 * be pinned indefinitely as it prevents the driver moving the
> +		 * page. So when trying to pin with FOLL_LONGTERM instead try
> +		 * to migrate the page out of device memory.
> +		 */
> +		if (folio_is_device_coherent(folio)) {
> +			WARN_ON_ONCE(PageCompound(&folio->page));

Maybe that belongs into migrate_device_page()?

> +
> +			/*
> +			 * Migration will fail if the page is pinned, so convert

[...]

>  /*
>   * mm/gup.c
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index cf9668376c5a..5decd26dd551 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -794,3 +794,56 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
>  	}
>  }
>  EXPORT_SYMBOL(migrate_vma_finalize);
> +
> +/*
> + * Migrate a device coherent page back to normal memory.  The caller should have
> + * a reference on page which will be copied to the new page if migration is
> + * successful or dropped on failure.
> + */
> +struct page *migrate_device_page(struct page *page, unsigned int gup_flags)

Function name should most probably indicate that we're dealing with coherent pages here?

> +{
> +	unsigned long src_pfn, dst_pfn = 0;
> +	struct migrate_vma args;
> +	struct page *dpage;
> +
> +	lock_page(page);
> +	src_pfn = migrate_pfn(page_to_pfn(page)) | MIGRATE_PFN_MIGRATE;
> +	args.src = &src_pfn;
> +	args.dst = &dst_pfn;
> +	args.cpages = 1;
> +	args.npages = 1;
> +	args.vma = NULL;
> +	migrate_vma_setup(&args);
> +	if (!(src_pfn & MIGRATE_PFN_MIGRATE))
> +		return NULL;

Wow, these refcount and page locking/unlocking rules with this migrate_* api are
confusing now. And the usage here of sometimes returning and sometimes falling
trough don't make it particularly easier to understand here.

I'm not 100% happy about reusing migrate_vma_setup() usage if there *is no VMA*.
That's just absolutely confusing, because usually migrate_vma_setup() itself 
would do the collection step and ref+lock pages. :/

In general, I can see why/how we're reusing the migrate_vma_* API here, but there 
is absolutely no VMA ... not sure what to improve besides providing a second API
that does a simple single-page migration. But that can be changed later ...


> +
> +	dpage = alloc_pages(GFP_USER | __GFP_NOWARN, 0);
> +

alloc_page()

> +	/*
> +	 * get/pin the new page now so we don't have to retry gup after
> +	 * migrating. We already have a reference so this should never fail.
> +	 */
> +	if (dpage && WARN_ON_ONCE(!try_grab_page(dpage, gup_flags))) {
> +		__free_pages(dpage, 0);

__free_page()

> +		dpage = NULL;
> +	}

Hm, this means that we are not pinning via the PTE at hand, but via something
we expect migration to put into the PTE. I'm not really happy about this.

Ideally, we'd make the pinning decision only on the actual GUP path, not in here.
Just like in the migrate_pages() case, where we end up dropping all refs/pins
and looking up again via GUP from the PTE.

For example, I wonder if something nasty could happen if the PTE got mapped
R/O in the meantime and you're pinning R/W here ... 

TBH, all this special casing on gup_flags here is nasty. Please, let's just do
it like migrate_pages() and do another GUP walk. Absolutely no need to optimize.

[...]



I'd go with something like the following on top (which does not touch on the
general semantic issue with migrate_vma_* ). Note that I most probably messed
up some refcount/lock handling and that it's broken.
Just to give you an idea what I think could be cleaner.



diff --git a/mm/gup.c b/mm/gup.c
index 9b6b9923d22d..17041b3e605e 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1881,7 +1881,7 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 	unsigned long isolation_error_count = 0, i;
 	struct folio *prev_folio = NULL;
 	LIST_HEAD(movable_page_list);
-	bool drain_allow = true;
+	bool drain_allow = true, any_device_coherent = false;
 	int ret = 0;
 
 	for (i = 0; i < nr_pages; i++) {
@@ -1891,15 +1891,6 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 			continue;
 		prev_folio = folio;
 
-		/*
-		 * Device private pages will get faulted in during gup so it
-		 * shouldn't be possible to see one here.
-		 */
-		if (WARN_ON_ONCE(folio_is_device_private(folio))) {
-			ret = -EFAULT;
-			goto unpin_pages;
-		}
-
 		/*
 		 * Device coherent pages are managed by a driver and should not
 		 * be pinned indefinitely as it prevents the driver moving the
@@ -1907,7 +1898,12 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 		 * to migrate the page out of device memory.
 		 */
 		if (folio_is_device_coherent(folio)) {
-			WARN_ON_ONCE(PageCompound(&folio->page));
+			/*
+			 * We always want a new GUP lookup with device coherent
+			 * pages.
+			 */
+			any_device_coherent = true;
+			pages[i] = 0;
 
 			/*
 			 * Migration will fail if the page is pinned, so convert
@@ -1918,11 +1914,12 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 				unpin_user_page(&folio->page);
 			}
 
-			pages[i] = migrate_device_page(&folio->page, gup_flags);
-			if (!pages[i]) {
-				ret = -EBUSY;
+			ret = migrate_device_coherent_page(&folio->page);
+			if (ret)
 				goto unpin_pages;
-			}
+			/* The reference to our folio is stale now. */
+			prev_folio = NULL;
+			folio = NULL;
 			continue;
 		}
 
@@ -1953,7 +1950,8 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 				    folio_nr_pages(folio));
 	}
 
-	if (!list_empty(&movable_page_list) || isolation_error_count)
+	if (!list_empty(&movable_page_list) || isolation_error_count ||
+	    any_device_coherent)
 		goto unpin_pages;
 
 	/*
@@ -1963,14 +1961,19 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 	return nr_pages;
 
 unpin_pages:
-	for (i = 0; i < nr_pages; i++) {
-		if (!pages[i])
-			continue;
+	/* We have to be careful if we stumbled over device coherent pages. */
+	if (unlikely(any_device_coherent || !(gup_flags & FOLL_PIN))) {
+		for (i = 0; i < nr_pages; i++) {
+			if (!pages[i])
+				continue;
 
-		if (gup_flags & FOLL_PIN)
-			unpin_user_page(pages[i]);
-		else
-			put_page(pages[i]);
+			if (gup_flags & FOLL_PIN)
+				unpin_user_page(pages[i]);
+			else
+				put_page(pages[i]);
+		}
+	} else {
+		unpin_user_pages(pages, nr_pages);
 	}
 
 	if (!list_empty(&movable_page_list)) {
diff --git a/mm/internal.h b/mm/internal.h
index eeab4ee7a4a3..899dab512c5a 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -853,7 +853,7 @@ int numa_migrate_prep(struct page *page, struct vm_area_struct *vma,
 		      unsigned long addr, int page_nid, int *flags);
 
 void free_zone_device_page(struct page *page);
-struct page *migrate_device_page(struct page *page, unsigned int gup_flags);
+int migrate_device_coherent_page(struct page *page);
 
 /*
  * mm/gup.c
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 5decd26dd551..dfb78ea3d326 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -797,53 +797,40 @@ EXPORT_SYMBOL(migrate_vma_finalize);
 
 /*
  * Migrate a device coherent page back to normal memory.  The caller should have
- * a reference on page which will be copied to the new page if migration is
- * successful or dropped on failure.
+ * a reference on page, which will be dropped on return.
  */
-struct page *migrate_device_page(struct page *page, unsigned int gup_flags)
+int migrate_device_coherent_page(struct page *page)
 {
 	unsigned long src_pfn, dst_pfn = 0;
-	struct migrate_vma args;
+	struct migrate_vma args = {
+		.src = &src_pfn,
+		.dst = &dst_pfn,
+		.cpages = 1,
+		.npages = 1,
+		.vma = NULL,
+	};
 	struct page *dpage;
 
+	VM_WARN_ON_ONCE(PageCompound(page));
+
 	lock_page(page);
 	src_pfn = migrate_pfn(page_to_pfn(page)) | MIGRATE_PFN_MIGRATE;
-	args.src = &src_pfn;
-	args.dst = &dst_pfn;
-	args.cpages = 1;
-	args.npages = 1;
-	args.vma = NULL;
-	migrate_vma_setup(&args);
-	if (!(src_pfn & MIGRATE_PFN_MIGRATE))
-		return NULL;
-
-	dpage = alloc_pages(GFP_USER | __GFP_NOWARN, 0);
-
-	/*
-	 * get/pin the new page now so we don't have to retry gup after
-	 * migrating. We already have a reference so this should never fail.
-	 */
-	if (dpage && WARN_ON_ONCE(!try_grab_page(dpage, gup_flags))) {
-		__free_pages(dpage, 0);
-		dpage = NULL;
-	}
 
-	if (dpage) {
-		lock_page(dpage);
-		dst_pfn = migrate_pfn(page_to_pfn(dpage));
+	migrate_vma_setup(&args);
+	if (src_pfn & MIGRATE_PFN_MIGRATE) {
+		dpage = alloc_page(GFP_USER | __GFP_NOWARN);
+		if (dpage) {
+			dst_pfn = migrate_pfn(page_to_pfn(dpage));
+			lock_page(dpage);
+		}
 	}
 
 	migrate_vma_pages(&args);
 	if (src_pfn & MIGRATE_PFN_MIGRATE)
 		copy_highpage(dpage, page);
 	migrate_vma_finalize(&args);
-	if (dpage && !(src_pfn & MIGRATE_PFN_MIGRATE)) {
-		if (gup_flags & FOLL_PIN)
-			unpin_user_page(dpage);
-		else
-			put_page(dpage);
-		dpage = NULL;
-	}
 
-	return dpage;
+	if (src_pfn & MIGRATE_PFN_MIGRATE)
+		return 0;
+	return -EBUSY;
 }
-- 
2.35.3



-- 
Thanks,

David / dhildenb

