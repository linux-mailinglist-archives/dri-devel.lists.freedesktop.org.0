Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ACF3984F7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 11:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3AAC6EC04;
	Wed,  2 Jun 2021 09:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4488A6EC04
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 09:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 34D573F860;
 Wed,  2 Jun 2021 11:07:57 +0200 (CEST)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="AkzyrQVQ";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pN94uFm7hglL; Wed,  2 Jun 2021 11:07:55 +0200 (CEST)
Received: by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id DB7F93F558;
 Wed,  2 Jun 2021 11:07:53 +0200 (CEST)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 4A8C236012A;
 Wed,  2 Jun 2021 11:07:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1622624873; bh=2I6mKaspreYTp7Wt5xpxppuMUS3C2rxrva0N7eXDvRM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=AkzyrQVQtl4TvBW6rWAJ/hlubnRLCrG15FK2W13+sIjERLuQ8ZhgDZz3OHD/pTTPM
 mZifFDmqj5xGIzOUPwhRr93kR22yNoVZxYkL5GMnnKXDHoeoS0HtAAXB39EgltT9Eg
 pHR0RWFt9YSkiKIHcWSBWFTk3INvqNDNQ+YmblvM=
Subject: Re: [PATCH] drm/ttm: nuke VM_MIXEDMAP on BO mappings
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel@ffwll.ch, jgg@ziepe.ca, thomas.hellstrom@linux.intel.com
References: <20210602083013.1561-1-christian.koenig@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <54c5dc94-b367-70dd-ca8f-afcbda7598c6@shipmail.org>
Date: Wed, 2 Jun 2021 11:07:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602083013.1561-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/2/21 10:30 AM, Christian König wrote:
> We discussed if that is really the right approach for quite a while now, but
> digging deeper into a bug report on arm turned out that this is actually
> horrible broken right now.
>
> The reason for this is that vmf_insert_mixed_prot() always tries to grab
> a reference to the underlaying page on architectures without
> ARCH_HAS_PTE_SPECIAL and as far as I can see also enabled GUP.
>
> So nuke using VM_MIXEDMAP here and use VM_PFNMAP instead.
>
> Also set VM_SHARED, not 100% sure if that is needed with VM_PFNMAP, but better
> save than sorry.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Bugs: https://gitlab.freedesktop.org/drm/amd/-/issues/1606#note_936174
> ---
>   drivers/gpu/drm/ttm/ttm_bo_vm.c | 29 +++++++----------------------
>   1 file changed, 7 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index 9bd15cb39145..bf86ae849340 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -359,12 +359,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>   		 * at arbitrary times while the data is mmap'ed.
>   		 * See vmf_insert_mixed_prot() for a discussion.
>   		 */
> -		if (vma->vm_flags & VM_MIXEDMAP)
> -			ret = vmf_insert_mixed_prot(vma, address,
> -						    __pfn_to_pfn_t(pfn, PFN_DEV),
> -						    prot);
> -		else
> -			ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
> +		ret = vmf_insert_pfn_prot(vma, address, pfn, prot);

I think vmwgfx still uses MIXEDMAP. (Which is ofc same bug and should be 
changed).

>   
>   		/* Never error on prefaulted PTEs */
>   		if (unlikely((ret & VM_FAULT_ERROR))) {
> @@ -411,15 +406,9 @@ vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot)
>   	pfn = page_to_pfn(page);
>   
>   	/* Prefault the entire VMA range right away to avoid further faults */
> -	for (address = vma->vm_start; address < vma->vm_end; address += PAGE_SIZE) {
> -
> -		if (vma->vm_flags & VM_MIXEDMAP)
> -			ret = vmf_insert_mixed_prot(vma, address,
> -						    __pfn_to_pfn_t(pfn, PFN_DEV),
> -						    prot);
> -		else
> -			ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
> -	}
> +	for (address = vma->vm_start; address < vma->vm_end;
> +	     address += PAGE_SIZE)
> +		ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
>   
>   	return ret;
>   }
> @@ -576,14 +565,10 @@ static void ttm_bo_mmap_vma_setup(struct ttm_buffer_object *bo, struct vm_area_s
>   
>   	vma->vm_private_data = bo;
>   
> -	/*
> -	 * We'd like to use VM_PFNMAP on shared mappings, where
> -	 * (vma->vm_flags & VM_SHARED) != 0, for performance reasons,
> -	 * but for some reason VM_PFNMAP + x86 PAT + write-combine is very
> -	 * bad for performance. Until that has been sorted out, use
> -	 * VM_MIXEDMAP on all mappings. See freedesktop.org bug #75719
> +	/* Enforce VM_SHARED here since no driver backend actually supports COW
> +	 * on TTM buffer object mappings.

I think by default all TTM drivers support COW mappings in the sense 
that written data never makes it to the bo but stays in anonymous pages, 
although I can't find a single usecase. So comment should be changed to 
state that they are useless for us and that we can't support COW 
mappings with VM_PFNMAP.

>   	 */
> -	vma->vm_flags |= VM_MIXEDMAP;
> +	vma->vm_flags |= VM_PFNMAP | VM_SHARED;

Hmm, shouldn't we refuse COW mappings instead, like my old patch on this 
subject did? In theory someone could be setting up what she thinks is a 
private mapping to a shared buffer object, and write sensitive data to 
it, which will immediately leak. It's a simple check, could open-code if 
necessary.

>   	vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
>   }
>   

/Thomas


