Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DABCE1A301A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 09:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4600C6EB62;
	Thu,  9 Apr 2020 07:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from r3-19.sinamail.sina.com.cn (r3-19.sinamail.sina.com.cn
 [202.108.3.19])
 by gabe.freedesktop.org (Postfix) with SMTP id 4D3E36E105
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 12:48:48 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([114.246.227.120])
 by sina.com with ESMTP
 id 5E8DC8290002A7AA; Wed, 8 Apr 2020 20:48:45 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 82000715073508
From: Hillf Danton <hdanton@sina.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 02/28] staging: android: ion: use vmap instead of
 vm_map_ram
Date: Wed,  8 Apr 2020 20:48:33 +0800
Message-Id: <20200408124833.13032-1-hdanton@sina.com>
In-Reply-To: <20200408115926.1467567-1-hch@lst.de>
References: <20200408115926.1467567-1-hch@lst.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Apr 2020 07:33:24 +0000
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-s390@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed,  8 Apr 2020 13:59:00 +0200
> 
> vm_map_ram can keep mappings around after the vm_unmap_ram.  Using that
> with non-PAGE_KERNEL mappings can lead to all kinds of aliasing issues.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/staging/android/ion/ion_heap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/android/ion/ion_heap.c b/drivers/staging/android/ion/ion_heap.c
> index 473b465724f1..a2d5c6df4b96 100644
> --- a/drivers/staging/android/ion/ion_heap.c
> +++ b/drivers/staging/android/ion/ion_heap.c
> @@ -99,12 +99,12 @@ int ion_heap_map_user(struct ion_heap *heap, struct ion_buffer *buffer,
>  
>  static int ion_heap_clear_pages(struct page **pages, int num, pgprot_t pgprot)
>  {
> -	void *addr = vm_map_ram(pages, num, -1, pgprot);
> +	void *addr = vmap(pages, num, VM_MAP);

A merge glitch?

void *vmap(struct page **pages, unsigned int count,
	   unsigned long flags, pgprot_t prot)
>  
>  	if (!addr)
>  		return -ENOMEM;
>  	memset(addr, 0, PAGE_SIZE * num);
> -	vm_unmap_ram(addr, num);
> +	vunmap(addr);
>  
>  	return 0;
>  }
> -- 
> 2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
