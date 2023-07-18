Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D11BD75840E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 20:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EFF610E3B6;
	Tue, 18 Jul 2023 18:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C59C10E3AB
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 18:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689703400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SY9GwLmOLkIsgD5VRg5Bj1YDunHBFQl0Vn/1PnJiJD4=;
 b=AwczMJ2sAESS70iXtxmD8NkvmIXdTNSE/RPPV6+zVGPFBEhqFx+hPoKEkdP5oSkWMZ7eGy
 dEkA74rUUXeNPpoIDmfPhf5sYO0sRXGKs29dR/KDFoAjvfsC+gRa1NjzMeLxQSInsLs+Us
 Z5R3B2iHBEjuY8FDaKAH3fUsy9/jU9Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-dwzHcuumMwqhgTg6Tx_BCA-1; Tue, 18 Jul 2023 14:03:18 -0400
X-MC-Unique: dwzHcuumMwqhgTg6Tx_BCA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fb416d7731so33936765e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 11:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689703397; x=1692295397;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SY9GwLmOLkIsgD5VRg5Bj1YDunHBFQl0Vn/1PnJiJD4=;
 b=WG1n/PraNWMKlP6QGta0LCo2njpsbvOMrpuEj31nKvQd1+7TSBcaF6Pq8EAM0MOq5Q
 Tz+cIuNJ6jfyQFlNG1kH1cdcLDpzjKnJQeKz6fIZLTD96GDrlvXL5gCsGntpmVaRVpZ0
 kUs0ApMitIHlWCGwIAkB56fvr4Na60+/jjP8mDLcA5jVJOZeNfp9balXOXiHkyGlvx/5
 lzGETlbduf2tJIZ7bPpNG3we55AtLDMzmc7snsfAlnVHCkMUxK4VW/uuBeYb/PslA3ru
 b/pASA5lMLxchQRndmPSI5IZKg+8ZSCPmDUUXVyfjS+MH1Ps1cc5Ofibd5uhykudET9c
 KnMg==
X-Gm-Message-State: ABy/qLYMXILWwqSyl5Z2TAmh5P/+R8J2hVV2b2OuzVdpvV/vGe0DLLNy
 EoNY616JSmR8l3tdGyEasloJK6kiM/6NqiG6J0hDXAMEEi+r78RPfdb8qKeHIWnk0A1p36E3Oj8
 tRAxrcr8bG6DDDUqg833ieUy2ME1U
X-Received: by 2002:a7b:cd17:0:b0:3fa:98c3:7dbd with SMTP id
 f23-20020a7bcd17000000b003fa98c37dbdmr96578wmj.41.1689703397540; 
 Tue, 18 Jul 2023 11:03:17 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGMCnHCqNgIyAwZV1X7rZ5Hq2PZqusyGxkB8TuMlh/1Pv1pf9o76wIKjAJiDucNX2ah7GCzyw==
X-Received: by 2002:a7b:cd17:0:b0:3fa:98c3:7dbd with SMTP id
 f23-20020a7bcd17000000b003fa98c37dbdmr96560wmj.41.1689703397178; 
 Tue, 18 Jul 2023 11:03:17 -0700 (PDT)
Received: from ?IPV6:2003:cb:c740:6200:84e1:eabc:8e2:7429?
 (p200300cbc740620084e1eabc08e27429.dip0.t-ipconnect.de.
 [2003:cb:c740:6200:84e1:eabc:8e2:7429])
 by smtp.gmail.com with ESMTPSA id
 9-20020a05600c228900b003fba92fad35sm10875616wmf.26.2023.07.18.11.03.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 11:03:16 -0700 (PDT)
Message-ID: <05b60d58-80e2-730f-f8e1-e61fc5f25680@redhat.com>
Date: Tue, 18 Jul 2023 20:03:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/2] udmabuf: Use vmf_insert_pfn and VM_PFNMAP for
 handling mmap
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
References: <20230718082605.1570740-1-vivek.kasireddy@intel.com>
 <20230718082605.1570740-2-vivek.kasireddy@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230718082605.1570740-2-vivek.kasireddy@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Dongwon Kim <dongwon.kim@intel.com>,
 Junxiao Chang <junxiao.chang@intel.com>, Hugh Dickins <hughd@google.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18.07.23 10:26, Vivek Kasireddy wrote:
> Add VM_PFNMAP to vm_flags in the mmap handler to ensure that
> the mappings would be managed without using struct page.
> 
> And, in the vm_fault handler, use vmf_insert_pfn to share the
> page's pfn to userspace instead of directly sharing the page
> (via struct page *).
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Mike Kravetz <mike.kravetz@oracle.com>
> Cc: Hugh Dickins <hughd@google.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Dongwon Kim <dongwon.kim@intel.com>
> Cc: Junxiao Chang <junxiao.chang@intel.com>
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>   drivers/dma-buf/udmabuf.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index c40645999648..820c993c8659 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -35,12 +35,13 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
>   	struct vm_area_struct *vma = vmf->vma;
>   	struct udmabuf *ubuf = vma->vm_private_data;
>   	pgoff_t pgoff = vmf->pgoff;
> +	unsigned long pfn;
>   
>   	if (pgoff >= ubuf->pagecount)
>   		return VM_FAULT_SIGBUS;
> -	vmf->page = ubuf->pages[pgoff];
> -	get_page(vmf->page);
> -	return 0;
> +
> +	pfn = page_to_pfn(ubuf->pages[pgoff]);
> +	return vmf_insert_pfn(vma, vmf->address, pfn);
>   }
>   
>   static const struct vm_operations_struct udmabuf_vm_ops = {
> @@ -56,6 +57,7 @@ static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
>   
>   	vma->vm_ops = &udmabuf_vm_ops;
>   	vma->vm_private_data = ubuf;
> +	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
>   	return 0;
>   }
>   

Looks reasonable to me.

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

