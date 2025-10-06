Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7698EBBE937
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 18:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C0910E419;
	Mon,  6 Oct 2025 16:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X7qGExnU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E55110E418;
 Mon,  6 Oct 2025 16:01:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7F32C451C9;
 Mon,  6 Oct 2025 16:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8C5C4CEF5;
 Mon,  6 Oct 2025 16:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759766517;
 bh=gK0gwx/5nj8BxIOYpHUVKbNTrU6HPqVCyFo2NZIq2+k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X7qGExnUygst8ikG9goN/tgOsUmyvjcgYxBGRVWOScnCNadcuWzvwAYa7xl0hNNqK
 KCIeWJ5pJBUx7TxT8eJre9GkPzR8APx6WUmv7D/2djvoMp0qow9OhHqZjXr9opb93i
 Ixks72TZ16TA6qZTuhTLIIXGXIo4fnfaG7uI0kDZPgDJ3O78gf73gNIbPd+QZqXG7V
 AniUAE9YhLTxC4KJTHcDvdM8u4sbnz4brrxJzUpjVCqMdq2ejlACdLz9KdqVek2Zkk
 zWJc+R3wkToxIbdNF3H01Mt+H1tBxGJuDZWVgZA79AukmuWmddv8zBwC1AfGBLeYnt
 2FUCERGgr0lhA==
Date: Mon, 6 Oct 2025 18:01:53 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?B?TG/Dr2M=?= Molinari <loic.molinari@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Melissa Wen <mwen@igalia.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Al Viro <viro@zeniv.linux.org.uk>,
 =?utf-8?Q?Miko=C5=82aj?= Wasiak <mikolaj.wasiak@intel.com>, 
 Christian Brauner <brauner@kernel.org>, Nitin Gote <nitin.r.gote@intel.com>, 
 Andi Shyti <andi.shyti@linux.intel.com>, Christopher Healy <healych@amazon.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 linux-mm@kvack.org, kernel@collabora.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 01/10] drm/shmem-helper: Add huge page fault handler
Message-ID: <fbfii7x7ypvbsowp63zuayzykqmpjpdjvzjdpyswwhfttuwemd@wbs7qxp5zie6>
References: <20251004093054.21388-1-loic.molinari@collabora.com>
 <20251004093054.21388-2-loic.molinari@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251004093054.21388-2-loic.molinari@collabora.com>
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

Hi Loic,

...

> +					   unsigned int order)
>  {
>  	struct vm_area_struct *vma = vmf->vma;
>  	struct drm_gem_object *obj = vma->vm_private_data;
> @@ -582,6 +583,10 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
>  	vm_fault_t ret;

we could initialize ret to VM_FAULT_FALLBACK and avoid the else's
and the default case.

>  	struct page *page;
>  	pgoff_t page_offset;
> +	unsigned long pfn;
> +#if defined(CONFIG_ARCH_SUPPORTS_PMD_PFNMAP) || defined(CONFIG_ARCH_SUPPORTS_PUD_PFNMAP)
> +	unsigned long paddr;
> +#endif

we could declare paddr inside the switch case in order to avoid
some extra ifdefs.

>  	/* We don't use vmf->pgoff since that has the fake offset */
>  	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
> @@ -592,17 +597,57 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
>  	    drm_WARN_ON_ONCE(obj->dev, !shmem->pages) ||
>  	    shmem->madv < 0) {
>  		ret = VM_FAULT_SIGBUS;
> -	} else {
> -		page = shmem->pages[page_offset];
> +		goto out;
> +	}
>  
> -		ret = vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
> +	page = shmem->pages[page_offset];
> +	pfn = page_to_pfn(page);
> +
> +	switch (order) {
> +	case 0:

'0' needs to be defined, what does '0' mean? (I know what it
means, but for consistency I think it should have its own name).

Andi

> +		ret = vmf_insert_pfn(vma, vmf->address, pfn);
> +		break;
