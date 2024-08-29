Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B86F3963F6A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 11:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1D410E46D;
	Thu, 29 Aug 2024 09:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="DIojz1ih";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F34710E1AC
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 09:03:36 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-371a92d8c90so247659f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 02:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724922215; x=1725527015; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3T+CG5v4+Ey9aTOVAUPHmhumNfBgXVe+/Y5GMCSnjeI=;
 b=DIojz1ihnK7L6RzT2wfu6tCHty6zdJXfYlJfZkPdFb694HceBW1wG4ZgKmemENiv+o
 CvOxakQ54i/d+DXRLWgszrZoyY3M6YJnar2bze5IQNK2XZB7Qvwp71JqCTh5/XA5ti6e
 EK1unlW1eFvT91VoAEPpdBSbc/QQhuOOZBDWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724922215; x=1725527015;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3T+CG5v4+Ey9aTOVAUPHmhumNfBgXVe+/Y5GMCSnjeI=;
 b=dnHlUdC6kYCrBDJ+MBOoEz/0swhkWwk/2qXHEKc0oVa3dfWNLyO/NdN5o2VAvY0fUP
 pXCgOh7fkK2GvIGZ8FrK5GuUWhy2bDUB8mYfZ0tOZM+F4IqZGL2TGlxjegIHg/mRFSKR
 e8hX1wqMWwVHNEy6lM9boqidLCRjQDM+NrKufMcEPwz9+856UDtIQV9+VI3zr6ORMIII
 VblvyibetREx6hwjGGTbFG6/gcAshWiHMz17BNV2ca6LOvUbc5G99s9iGeGMwVwghKdO
 ahlQX17aWESvV0EAhpNTKzldNnSCMPWqreK5e8JFRNzmUwzPZk+b1gtl518qFNbnOCev
 0gIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpKv3oS46MGGi/S6zG/2Xi9HwqUJn1KxVg+Tqjym0qUp5VoYTPlJl89Epr+DS0IbtUlZvfSmkrkSA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJK4lqErxtS7abeei8UtdkMXPFilGDg7WIHfTUcXmbb58ek1yd
 Yal8oYBCLnlTLCFCadZ7EYsMmQVEo1sb154wjlPbhYNEaXTySF+/S7JFyuJRjZA=
X-Google-Smtp-Source: AGHT+IFFUoZ7dP1xkj9gRtOXJYeNO7mqWQbLyi0n+WV1esUiYks97AfRaYMCbbBceCwryiE451o5cg==
X-Received: by 2002:a5d:6e8f:0:b0:371:83ae:808f with SMTP id
 ffacd0b85a97d-3749b4d841fmr1389415f8f.0.1724922214393; 
 Thu, 29 Aug 2024 02:03:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee413besm871179f8f.5.2024.08.29.02.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 02:03:31 -0700 (PDT)
Date: Thu, 29 Aug 2024 11:03:29 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: Re: [RFC PATCH 04/28] mm/migrate: Add migrate_device_vma_range
Message-ID: <ZtA5YVIpmzIUHWc_@phenom.ffwll.local>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-5-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828024901.2582335-5-matthew.brost@intel.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Tue, Aug 27, 2024 at 07:48:37PM -0700, Matthew Brost wrote:
> Add migrate_device_vma_range which prepares an array of pre-populated
> device pages for migration and issues a MMU invalidation.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  include/linux/migrate.h |  3 +++
>  mm/migrate_device.c     | 53 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 56 insertions(+)
> 
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index 644be30b69c8..e8cce05bf9c2 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -226,6 +226,9 @@ void migrate_vma_pages(struct migrate_vma *migrate);
>  void migrate_vma_finalize(struct migrate_vma *migrate);
>  int migrate_device_range(unsigned long *src_pfns, unsigned long start,
>  			unsigned long npages);
> +int migrate_device_vma_range(struct mm_struct *mm, void *pgmap_owner,
> +			     unsigned long *src_pfns, unsigned long npages,
> +			     unsigned long start);
>  void migrate_device_pages(unsigned long *src_pfns, unsigned long *dst_pfns,
>  			unsigned long npages);
>  void migrate_device_finalize(unsigned long *src_pfns,
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 6d66dc1c6ffa..e25f12a132e8 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -920,6 +920,59 @@ int migrate_device_range(unsigned long *src_pfns, unsigned long start,
>  }
>  EXPORT_SYMBOL(migrate_device_range);
>  
> +/**
> + * migrate_device_vma_range() - migrate device private pfns to normal memory and
> + * trigger MMU invalidation.
> + * @mm: struct mm of device pages.
> + * @src_pfns: pre-popluated array of source device private pfns to migrate.
> + * @pgmap_owner: page group map owner of device pages.
> + * @npages: number of pages to migrate.
> + * @start: VMA start of device pages.
> + *
> + * Similar to migrate_device_range() but supports non-contiguous pre-popluated
> + * array of device pages to migrate. Also triggers MMU invalidation. Useful in
> + * device memory eviction paths where lock is held protecting the device pages
> + * but where the mmap lock cannot be taken to due to a locking inversion (e.g.
> + * DRM drivers). Since the mmap lock is not required to be held, the MMU
> + * invalidation can race with with VMA start being repurposed, worst case this
> + * would result in an unecessary invalidation.
> + */
> +int migrate_device_vma_range(struct mm_struct *mm, void *pgmap_owner,
> +			     unsigned long *src_pfns, unsigned long npages,
> +			     unsigned long start)
> +{
> +	struct mmu_notifier_range range;
> +	unsigned long i;
> +
> +	mmu_notifier_range_init_owner(&range, MMU_NOTIFY_MIGRATE, 0,
> +				      mm, start, start + npages * PAGE_SIZE,
> +				      pgmap_owner);
> +	mmu_notifier_invalidate_range_start(&range);

This isn't needed, try_to_migrate called from migrate_device_unmap already
has a notifier, if there's actually any ptes to clear. If you need this
one you've missed a pte clear notification somewhere, or there's some
other bad bug somewhere.
-Sima

> +
> +	for (i = 0; i < npages; i++) {
> +		struct page *page = pfn_to_page(src_pfns[i]);
> +
> +		if (!get_page_unless_zero(page)) {
> +			src_pfns[i] = 0;
> +			continue;
> +		}
> +
> +		if (!trylock_page(page)) {
> +			src_pfns[i] = 0;
> +			put_page(page);
> +			continue;
> +		}
> +
> +		src_pfns[i] = migrate_pfn(src_pfns[i]) | MIGRATE_PFN_MIGRATE;
> +	}
> +
> +	migrate_device_unmap(src_pfns, npages, NULL);
> +	mmu_notifier_invalidate_range_end(&range);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(migrate_device_vma_range);
> +
>  /*
>   * Migrate a device coherent page back to normal memory. The caller should have
>   * a reference on page which will be copied to the new page if migration is
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
