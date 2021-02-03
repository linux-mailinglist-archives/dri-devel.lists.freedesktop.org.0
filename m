Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8A730D4DE
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCC46EA06;
	Wed,  3 Feb 2021 08:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE336E9D7
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 01:27:16 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DVkWv5tQ5zMTrn;
 Wed,  3 Feb 2021 09:25:31 +0800 (CST)
Received: from [10.174.179.241] (10.174.179.241) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Wed, 3 Feb 2021 09:27:05 +0800
Subject: Re: [PATCH 1/2] mm: replace BUG_ON in vm_insert_page with a return of
 an error
To: Suren Baghdasaryan <surenb@google.com>, <sumit.semwal@linaro.org>
References: <20210203003134.2422308-1-surenb@google.com>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <a2376ae0-c6a2-12e4-d4ad-04696eb51535@huawei.com>
Date: Wed, 3 Feb 2021 09:27:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210203003134.2422308-1-surenb@google.com>
Content-Language: en-US
X-Originating-IP: [10.174.179.241]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:13:07 +0000
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
Cc: linaro-mm-sig@lists.linaro.org, orjan.eide@arm.com, sspatil@google.com,
 linux-mm@kvack.org, kernel-team@android.com, jajones@nvidia.com,
 linux-kernel@vger.kernel.org, lmark@codeaurora.org, christian.koenig@amd.com,
 hch@infradead.org, minchan@kernel.org, dri-devel@lists.freedesktop.org,
 cgoldswo@codeaurora.org, hridya@google.com, akpm@linux-foundation.org,
 labbott@redhat.com, robin.murphy@arm.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi:
On 2021/2/3 8:31, Suren Baghdasaryan wrote:
> Replace BUG_ON(vma->vm_flags & VM_PFNMAP) in vm_insert_page with
> WARN_ON_ONCE and returning an error. This is to ensure users of the
> vm_insert_page that set VM_PFNMAP are notified of the wrong flag usage
> and get an indication of an error without panicing the kernel.
> This will help identifying drivers that need to clear VM_PFNMAP before
> using dmabuf system heap which is moving to use vm_insert_page.
> 
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Looks reasonable. Thanks.
Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>

> ---
>  mm/memory.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index feff48e1465a..e503c9801cd9 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1827,7 +1827,8 @@ int vm_insert_page(struct vm_area_struct *vma, unsigned long addr,
>  		return -EINVAL;
>  	if (!(vma->vm_flags & VM_MIXEDMAP)) {
>  		BUG_ON(mmap_read_trylock(vma->vm_mm));
> -		BUG_ON(vma->vm_flags & VM_PFNMAP);
> +		if (WARN_ON_ONCE(vma->vm_flags & VM_PFNMAP))
> +			return -EINVAL;
>  		vma->vm_flags |= VM_MIXEDMAP;
>  	}
>  	return insert_page(vma, addr, page, vma->vm_page_prot);
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
