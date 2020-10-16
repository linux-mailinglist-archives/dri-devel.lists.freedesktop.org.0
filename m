Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C615228FF84
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 09:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC8A6EA89;
	Fri, 16 Oct 2020 07:54:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7952C6EA89
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 07:54:28 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f8951870000>; Fri, 16 Oct 2020 00:53:43 -0700
Received: from [10.2.49.77] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct
 2020 07:54:19 +0000
Subject: Re: [PATCH v2 05/17] mm/frame-vector: Use FOLL_LONGTERM
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-6-daniel.vetter@ffwll.ch>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <4685181e-8306-0d96-8be6-592b3c563cbf@nvidia.com>
Date: Fri, 16 Oct 2020 00:54:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201009075934.3509076-6-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1602834823; bh=x8+KhcjN/0jeBmkHwcjBNjUK8qbDE0ZVZJYKZ9Z6VGs=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=OPXG7m+swcryyW3+1c3mxRCD9ELJ64r6RX1Dgjsv/DxKINT3TrWkfzRvFH5oOjwQ9
 kbmWxE8cjt++1sfq9zZBm7pAsjxLHRKxIkJrIYBO5d5BHLfs1GBTG4uNWzgJwAYEib
 a0tpEVj2BXEbDUUj0WNA08KLGk0UpBLrh6Q4zl4oRKuwi2vFzQU7IWPvzl60U5doRa
 9Sx7wqrwS1T6lY56FeeLMgq9fZLnJB5MNWWrmUCdHStngTzwSQOW6ZGYVnKoe93gas
 pNw8s4iejdBCZ9jkBUIDbZgPpbSPLosjj5nPK4785xOzYYi5NQgwhH2Nz6WyvBj4Gr
 OGagG2GGGM95w==
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Pawel Osciak <pawel@osciak.com>, kvm@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mm@kvack.org, Kyungmin
 Park <kyungmin.park@samsung.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/9/20 12:59 AM, Daniel Vetter wrote:
...
> @@ -48,40 +47,25 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
>   
>   	start = untagged_addr(start);
>   
> -	mmap_read_lock(mm);
> -	locked = 1;
> -	vma = find_vma_intersection(mm, start, start + 1);
> -	if (!vma) {
> -		ret = -EFAULT;
> -		goto out;
> -	}
> -
> -	/*
> -	 * While get_vaddr_frames() could be used for transient (kernel
> -	 * controlled lifetime) pinning of memory pages all current
> -	 * users establish long term (userspace controlled lifetime)
> -	 * page pinning. Treat get_vaddr_frames() like
> -	 * get_user_pages_longterm() and disallow it for filesystem-dax
> -	 * mappings.
> -	 */
> -	if (vma_is_fsdax(vma)) {
> -		ret = -EOPNOTSUPP;
> -		goto out;
> -	}
> -
> -	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP))) {
> +	ret = pin_user_pages_fast(start, nr_frames,
> +				  FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
> +				  (struct page **)(vec->ptrs));
> +	if (ret > 0) {

None of the callers that we have today will accept anything less than
ret == nr_frames. And the whole partially pinned region idea turns out
to be just not useful for almost everyone, from what I recall of the gup/pup
call sites. So I wonder if we should just have get_vaddr_frames do the
cleanup here and return -EFAULT, if ret != nr_frames ?

thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
