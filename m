Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DD6739969
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 10:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD59110E1AC;
	Thu, 22 Jun 2023 08:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909F110E1AC
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 08:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687422322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rZXaqCVfN5pwWKG3rKtxQoevt0a1zXC+RoOCtcXhifY=;
 b=e1YPmBahqNoV8c7krW6hBR3jjVpIOhHpX0DuhLQImIFEgnyxzgvXnH5GXbTQ+1mFApQ3Cx
 nMS2kUkWoBtDvg/59zQMU/PwfiIuGMFY2M8K9q9rZVre0cu0IFjxRWBIVwtN1qnG1bFmOj
 f0MhukaG9yoFJX+zWbCFtohclyIgCw0=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-e7xH1HlSPvafvL6sIyyTyg-1; Thu, 22 Jun 2023 04:25:21 -0400
X-MC-Unique: e7xH1HlSPvafvL6sIyyTyg-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-4f8727c7fb6so3575390e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 01:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687422319; x=1690014319;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :content-language:references:cc:to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rZXaqCVfN5pwWKG3rKtxQoevt0a1zXC+RoOCtcXhifY=;
 b=j671WHbrXFvkwynGQtYpYt440XY7W1idtoVcjaos/Rnw9UpVEJK5TR4qwIdgUvAZyo
 8S5BJA4g9S2h72syg78JiGF0iNGPRXQzfINwLjPRz2C716mRgTAiAruua5NFw0WlfCym
 rRbGHwDF4c8kvt+R97kj6dAw+ErVAP4MSS+9wycPkZkIrb6/im5+NR95nN/osoevYwF1
 sEEi1/CzS+3QlOV/jNj4irDY6aJuwCAT7cIiOST7hRdRiiSUYEpcWpW7RHvXy9q1XEjl
 WIa0KXYZu98jMZEncUUX0/6P9L2BVO8dUMnajCALT1sKuhW0BU8EfHteEuxEFudPOFUo
 5byQ==
X-Gm-Message-State: AC+VfDxKvDYjXu/PEfeYXmg69BUxOVo9iiha8LD6yTJRCalmf5X+QQMq
 DYh5gg8zZ1xicJROnxezbCPgvnOVgq8+5CbdfomjGgVw+vkpsAxC2t9EQAW864D+687A4a8w+eL
 ml6YbY9nrx8/bNs2H206w4XGr7xPN
X-Received: by 2002:a19:5e01:0:b0:4f6:45af:70b8 with SMTP id
 s1-20020a195e01000000b004f645af70b8mr10006748lfb.58.1687422319532; 
 Thu, 22 Jun 2023 01:25:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4qHq2NkQm/h8KwcL2Gs4ziUytBjL4OQtI5NDyjVyLs7lue4yBBVXXSWHlZdfjTNRloVUjujw==
X-Received: by 2002:a19:5e01:0:b0:4f6:45af:70b8 with SMTP id
 s1-20020a195e01000000b004f645af70b8mr10006730lfb.58.1687422319088; 
 Thu, 22 Jun 2023 01:25:19 -0700 (PDT)
Received: from ?IPV6:2003:cb:c71a:c00:a3d3:85e8:742c:2e9?
 (p200300cbc71a0c00a3d385e8742c02e9.dip0.t-ipconnect.de.
 [2003:cb:c71a:c00:a3d3:85e8:742c:2e9])
 by smtp.gmail.com with ESMTPSA id
 e17-20020a5d5011000000b002c70ce264bfsm6448123wrt.76.2023.06.22.01.25.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 01:25:18 -0700 (PDT)
Message-ID: <6e429fbc-e0e6-53c0-c545-2e2cbbe757de@redhat.com>
Date: Thu, 22 Jun 2023 10:25:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
References: <20230622072710.3707315-1-vivek.kasireddy@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 0/2] udmabuf: Add back support for mapping hugetlb pages
In-Reply-To: <20230622072710.3707315-1-vivek.kasireddy@intel.com>
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
Cc: James Houghton <jthoughton@google.com>,
 Jerome Marchand <jmarchan@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 Junxiao Chang <junxiao.chang@intel.com>, Muchun Song <muchun.song@linux.dev>,
 Michal Hocko <mhocko@suse.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22.06.23 09:27, Vivek Kasireddy wrote:
> The first patch ensures that the mappings needed for handling mmap
> operation would be managed by using the pfn instead of struct page.
> The second patch restores support for mapping hugetlb pages where
> subpages of a hugepage are not directly used anymore (main reason
> for revert) and instead the hugetlb pages and the relevant offsets
> are used to populate the scatterlist for dma-buf export and for
> mmap operation.
> 
> Testcase: default_hugepagesz=2M hugepagesz=2M hugepages=2500 options
> were passed to the Host kernel and Qemu was launched with these
> relevant options: qemu-system-x86_64 -m 4096m....
> -device virtio-gpu-pci,max_outputs=1,blob=true,xres=1920,yres=1080
> -display gtk,gl=on
> -object memory-backend-memfd,hugetlb=on,id=mem1,size=4096M
> -machine memory-backend=mem1
> 
> Replacing -display gtk,gl=on with -display gtk,gl=off above would
> exercise the mmap handler.
> 

While I think the VM_PFNMAP approach is much better and should fix that 
issue at hand, I thought more about missing memlock support and realized 
that we might have to fix something else. SO I'm going to raise the 
issue here.

I think udmabuf chose the wrong interface to do what it's doing, that 
makes it harder to fix it eventually.

Instead of accepting a range in a memfd, it should just have accepted a 
user space address range and then used 
pin_user_pages(FOLL_WRITE|FOLL_LONGTERM) to longterm-pin the pages 
"officially".

So what's the issue? Udma effectively pins pages longterm ("possibly 
forever") simply by grabbing a reference on them. These pages might 
easily reside in ZONE_MOVABLE or in MIGRATE_CMA pageblocks.

So what udmabuf does is break memory hotunplug and CMA, because it turns 
pages that have to remain movable unmovable.

In the pin_user_pages(FOLL_LONGTERM) case we make sure to migrate these 
pages. See mm/gup.c:check_and_migrate_movable_pages() and especially 
folio_is_longterm_pinnable(). We'd probably have to implement something 
similar for udmabuf, where we detect such unpinnable pages and migrate them.


For example, pairing udmabuf with vfio (which pins pages using 
pin_user_pages(FOLL_LONGTERM)) in QEMU will most probably not work in 
all cases: if udmabuf longterm pinned the pages "the wrong way", vfio 
will fail to migrate them during FOLL_LONGTERM and consequently fail 
pin_user_pages(). As long as udmabuf holds a reference on these pages, 
that will never succeed.


There are *probably* more issues on the QEMU side when udmabuf is paired 
with things like MADV_DONTNEED/FALLOC_FL_PUNCH_HOLE used for 
virtio-balloon, virtio-mem, postcopy live migration, ... for example, in 
the vfio/vdpa case we make sure that we disallow most of these, because 
otherwise there can be an accidental "disconnect" between the pages 
mapped into the VM (guest view) and the pages mapped into the IOMMU 
(device view), for example, after a reboot.

-- 
Cheers,

David / dhildenb

