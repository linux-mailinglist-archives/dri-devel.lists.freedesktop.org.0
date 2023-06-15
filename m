Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B607F731468
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 11:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4188410E4AD;
	Thu, 15 Jun 2023 09:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D253110E4AE
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 09:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686822520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tFas5ce2A1vgl/Pd1KLK4gSYDaGRoYeIBhP4kavIodY=;
 b=Rkva/9+cC8pNRv5Jh/EQ/fOlV15WLFgoiRfFrXsHvBX9gNFfG5nMHPar2DksxMtWek1nqL
 5TXeAdxLvnO24Klk8Zfi3Mwx6rMRbRh5yBVA5lmI95bPpeBy8R2AwbsxGTAQQ/jzOnvKFI
 IXvmI5XgUeEAJa749YxWhwqo0BQg0H4=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-wHuaSFA2MEeNtNbpUQ1oEQ-1; Thu, 15 Jun 2023 05:48:38 -0400
X-MC-Unique: wHuaSFA2MEeNtNbpUQ1oEQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-4edbdd8268bso6536394e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 02:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686822517; x=1689414517;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tFas5ce2A1vgl/Pd1KLK4gSYDaGRoYeIBhP4kavIodY=;
 b=L43tuIiCU+I5ibNNO5ZoBwhYidiyChcWucPY+Z2bGREXtJh41vrXJNn8IfQp0Bydlz
 UbfeHLWwMdYHb2dgt7lmTZkM9xgQ3X2C6xJ1u4wXcczR5UEVaurjMgVe2Qj9FYc0MPP7
 BEXXu35DHVg56JIJph7cM4R6hevVIf14xJIclBafXmCzlrpO1O2baz4xzIvlqwkOdOeh
 r+NJCa8W1gSjckOyNul9OjhF8IQ9ChNBEaXWwSIw+vvKk0HToY5IaLtV/8I68315r+U1
 khnMXSzTEAiXp/ubKATZ8bUCo6GpEi3ikmISU/XwcrafAzax/x3AzPwnEgAioMPmEICW
 CVAQ==
X-Gm-Message-State: AC+VfDw5U1HOFk2LVazArISUd9QxMw92dBOtKXzaafhEeYlmNNgtRes5
 6cRZzNug7xbeWTkLPcRZ4szGVzHG2A5uyBdKAFnYtOxf9Mo5lKqKwZc4r57gyS0Q+9peAliSCbA
 FUBd8f4vTObNqdCbB+fFnpDZBCy7f
X-Received: by 2002:a19:f205:0:b0:4dd:ce0b:7692 with SMTP id
 q5-20020a19f205000000b004ddce0b7692mr9513517lfh.46.1686822517132; 
 Thu, 15 Jun 2023 02:48:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ46ndnLtQ+lzJHNZ0kHKuZExuBXAwZ8nLK7yynFFKnsFo1JVRKjQW7nWIYv41TgUUl1IrX0NA==
X-Received: by 2002:a19:f205:0:b0:4dd:ce0b:7692 with SMTP id
 q5-20020a19f205000000b004ddce0b7692mr9513496lfh.46.1686822516710; 
 Thu, 15 Jun 2023 02:48:36 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7?
 ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a7bc7cf000000b003f6129d2e30sm20115269wmk.1.2023.06.15.02.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jun 2023 02:48:36 -0700 (PDT)
Message-ID: <015062b6-2d4a-7b91-8f64-1695f526f794@redhat.com>
Date: Thu, 15 Jun 2023 11:48:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Hugh Dickins <hughd@google.com>
References: <20230608204927.88711-1-mike.kravetz@oracle.com>
 <IA0PR11MB71851B64A5E7062E3BDD8D2FF854A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <281caf4f-25da-3a73-554b-4fb252963035@redhat.com>
 <IA0PR11MB71852D6B27C83658670CBFBDF855A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <676ee47d-8ca0-94c4-7454-46e9915ea36a@redhat.com>
 <IA0PR11MB71850D8A446FE1342B428EA1F85AA@IA0PR11MB7185.namprd11.prod.outlook.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] udmabuf: revert 'Add support for mapping hugepages (v4)'
In-Reply-To: <IA0PR11MB71850D8A446FE1342B428EA1F85AA@IA0PR11MB7185.namprd11.prod.outlook.com>
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
Cc: "Hocko, Michal" <mhocko@suse.com>,
 "jmarchan@redhat.com" <jmarchan@redhat.com>, "Kim,
 Dongwon" <dongwon.kim@intel.com>, "Chang, Junxiao" <junxiao.chang@intel.com>,
 "muchun.song@linux.dev" <muchun.song@linux.dev>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 James Houghton <jthoughton@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


>> Skimming over at shmem_read_mapping_page() users, I assume most of
>> them
>> use a VM_PFNMAP mapping (or don't mmap them at all), where we won't be
>> messing with the struct page at all.
>>
>> (That might even allow you to mmap hugetlb sub-pages, because the struct
>> page -- and mapcount -- will be ignored completely and not touched.)
> Oh, are you suggesting that if we do vma->vm_flags |= VM_PFNMAP
> in the mmap handler (mmap_udmabuf) and also do
> vmf_insert_pfn(vma, vmf->address, page_to_pfn(page))
> instead of
> vmf->page = ubuf->pages[pgoff];
> get_page(vmf->page);
> 
> in the vma fault handler (udmabuf_vm_fault), we can avoid most of the
> pitfalls you have identified -- including with the usage of hugetlb subpages?

Yes, that's my thinking, but I have to do my homework first to see if 
that would really work for hugetlb.

The thing is, I kind-of consider what udmabuf does a layer violation: we 
have a filesystem (shmem/hugetlb) that should handle mappings to user 
space. Yet, a driver decides to bypass that and simply map the pages 
ordinarily to user space. (revealed by the fact that hugetlb does never 
map sub-pages but udmabuf decides to do so)

In an ideal world everybody would simply mmap() the original memfd, but 
thinking about offset+size configuration within the memfd that might not 
always be desirable. As a workaround, we could mmap() only the PFNs, 
leaving the struct page unaffected.

I'll have to look closer into that.

-- 
Cheers,

David / dhildenb

