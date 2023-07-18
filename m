Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC294758415
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 20:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A27610E3AB;
	Tue, 18 Jul 2023 18:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BD410E3AB
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 18:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689703509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BdnawvUq/ESyZgDDMa23Rpm43IZBpwfkwo4hNwMktF4=;
 b=YaxEJEB/4N1ZImJGE52yTnJC4+Pl39vjI1L79bGs5ULHIikrjx768IGyEjEdJSzBmhFUVb
 y5Hj1Fq6bTm35toG3OTn/aCrB3BPpRQiyqSl5OKCI9s29UefdLLA2MJuV029baHd/so1Ux
 jQIYZG6IOg0Imbp2+8fLJxbzfalZOwU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-JXyaUVXrNyifWITalbGr_g-1; Tue, 18 Jul 2023 14:05:07 -0400
X-MC-Unique: JXyaUVXrNyifWITalbGr_g-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30793c16c78so3734600f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 11:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689703504; x=1692295504;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BdnawvUq/ESyZgDDMa23Rpm43IZBpwfkwo4hNwMktF4=;
 b=K6I2gv+8PFkE5b7INzEHTBm0cOuAxibCPoEcXk88ywSuXA6CoTzPs94Tpkg7r0IeJJ
 8jszKdti4SmKrH0WevT9upfAOSEj/+O7IP9V4AF5bO7TJOL0Whf8nL4qMlE58Esg/iyn
 5Ke7YKGhC3ZT7944o2DJ2Vca53NpcjR5NHGMS4rwvK1GvMy59UmfGX28D6Mr2BzKqwA3
 iPQdyo4UpM+9AHjRgSFo1KaKf/RYwdjSU6eTJiRYN4pFWkGibJ2HZ0TrfwnpydInxGwC
 5h79UKGzMWP3+5wn+KExg/Ydf54+zNwe8KQpU+P7S++zxu+CxD6nbJhTe8yIQg7DhLqa
 TlJQ==
X-Gm-Message-State: ABy/qLag3pw4fFUPE20+pvPcGXiZK3nGlnAhZ4/rO1iyO/GrkLFn/Skz
 jRYD5hFY3mBSXTcuzANzdUy+WoHi77rDWjIwlHKfzeYNzKSnBSymuv5ayV6tMeGVpfFu2DRHL5X
 xYsiZa5g14AdsIykzWcCO2ZL3kVhA
X-Received: by 2002:adf:f8c3:0:b0:314:22ea:4ee7 with SMTP id
 f3-20020adff8c3000000b0031422ea4ee7mr14494080wrq.33.1689703504096; 
 Tue, 18 Jul 2023 11:05:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFukCzwvofvcGW8EW7kBTjsACh25vsuvoclxvSpcB3aRfCp96tR3U1ZptWpG88c0KvDaDa9Cw==
X-Received: by 2002:adf:f8c3:0:b0:314:22ea:4ee7 with SMTP id
 f3-20020adff8c3000000b0031422ea4ee7mr14494056wrq.33.1689703503783; 
 Tue, 18 Jul 2023 11:05:03 -0700 (PDT)
Received: from ?IPV6:2003:cb:c740:6200:84e1:eabc:8e2:7429?
 (p200300cbc740620084e1eabc08e27429.dip0.t-ipconnect.de.
 [2003:cb:c740:6200:84e1:eabc:8e2:7429])
 by smtp.gmail.com with ESMTPSA id
 y25-20020a7bcd99000000b003fc04eb92cbsm2741669wmj.44.2023.07.18.11.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 11:05:03 -0700 (PDT)
Message-ID: <2556f0dd-d951-c21f-0e2e-7f2bb8d9fab3@redhat.com>
Date: Tue, 18 Jul 2023 20:05:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/2] udmabuf: Add back support for mapping hugetlb
 pages (v2)
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Mike Kravetz <mike.kravetz@oracle.com>
References: <20230718082605.1570740-1-vivek.kasireddy@intel.com>
 <20230718082605.1570740-3-vivek.kasireddy@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230718082605.1570740-3-vivek.kasireddy@intel.com>
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
 Jason Gunthorpe <jgg@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18.07.23 10:26, Vivek Kasireddy wrote:
> A user or admin can configure a VMM (Qemu) Guest's memory to be
> backed by hugetlb pages for various reasons. However, a Guest OS
> would still allocate (and pin) buffers that are backed by regular
> 4k sized pages. In order to map these buffers and create dma-bufs
> for them on the Host, we first need to find the hugetlb pages where
> the buffer allocations are located and then determine the offsets
> of individual chunks (within those pages) and use this information
> to eventually populate a scatterlist.
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
> v2: Updated get_sg_table() to manually populate the scatterlist for
>      both huge page and non-huge-page cases.
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Mike Kravetz <mike.kravetz@oracle.com>
> Cc: Hugh Dickins <hughd@google.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Dongwon Kim <dongwon.kim@intel.com>
> Cc: Junxiao Chang <junxiao.chang@intel.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>   drivers/dma-buf/udmabuf.c | 84 +++++++++++++++++++++++++++++++++------
>   1 file changed, 71 insertions(+), 13 deletions(-)

LGTM, in general. But I really hope Mike can comment.

-- 
Cheers,

David / dhildenb

