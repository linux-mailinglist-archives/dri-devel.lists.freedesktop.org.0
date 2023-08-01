Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C765876B4B1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 14:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB6710E3F3;
	Tue,  1 Aug 2023 12:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE5F10E3F3
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 12:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690892767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DVW4mMZFCGALC8ybzrJ+aDrIna738EUhn6/2uRNkmyU=;
 b=eNW8luu8fuVoFr+ER60jLK9Uh+RyWDj/Uluehz4iqK1YuCgCMjTT+Do+pgTxXEWjHiRg9E
 1QXoH3WQ8QqU5p9XWPijDnSCZxoZqJjYfxSQsyUP3oHspT01341AEu/i51xtb/Br1pTbKB
 G7xKo9l995p7UJ5wgzWO54BdNeKM/VU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-c8G_S_jbM-Sbi9jIdVxtqg-1; Tue, 01 Aug 2023 08:26:06 -0400
X-MC-Unique: c8G_S_jbM-Sbi9jIdVxtqg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-31758708b57so3537360f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 05:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690892765; x=1691497565;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DVW4mMZFCGALC8ybzrJ+aDrIna738EUhn6/2uRNkmyU=;
 b=JEzWtwjHkm58BvrOSKhJdrbbwLpc5eXW+uiHz7SU5Tby2PTZIt94HsU0kfUBx8nRXV
 AdHaBcBM0t/s8TrB8Uj+nOq++d0xKgzEaDycBpO5MF5JBl4+H9lOsh5WdZ+jtf3lgNj0
 C4T4elOJ7h+M2YrfNXuaa7jbXv4BJBXQhgOeTA+kZdT0n3uR/sMejKlqZV+j1ka5VarB
 p7JDoiWAkuRt54dg62II6MdFCzbPi5O6pdqXEFgKKXczZH/MIXihLKPHhvIDfEHrtNZI
 e2xInOedHtYwglCwuYihczKRNlRgSblXERPNDKFPGUWGSISMWSGHaFwUCmT0WWilXcQe
 yqxQ==
X-Gm-Message-State: ABy/qLbxrM4Iux01+cHeNjnYzg7FRZIJpQhds44S7IYtDvRIYKTqmQOA
 7EB7y9YuB3nlgreZq7jeQXl/j51sKzNqrKDICwws2BTmS8jVu/BNxrpx5oQpD/c1jk6vuoyGrMk
 8cnv+oIqRq4IkXwesOud0j2ukh0X6
X-Received: by 2002:a5d:510a:0:b0:314:bdb:cf71 with SMTP id
 s10-20020a5d510a000000b003140bdbcf71mr2456654wrt.53.1690892765221; 
 Tue, 01 Aug 2023 05:26:05 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGMVMk1xCuqDPUyHo5qOLYWKhcLDSbX7D9uKJPDex6Q8dFpdLdnBzEQwcp/6JNBf2xHjW5iYg==
X-Received: by 2002:a5d:510a:0:b0:314:bdb:cf71 with SMTP id
 s10-20020a5d510a000000b003140bdbcf71mr2456640wrt.53.1690892764815; 
 Tue, 01 Aug 2023 05:26:04 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:d100:871b:ec55:67d:5247?
 (p200300cbc705d100871bec55067d5247.dip0.t-ipconnect.de.
 [2003:cb:c705:d100:871b:ec55:67d:5247])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a5d410a000000b00317495f88fasm15877389wrp.112.2023.08.01.05.26.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Aug 2023 05:26:04 -0700 (PDT)
Message-ID: <48f22686-2c1b-fd9d-91ba-da6105d410db@redhat.com>
Date: Tue, 1 Aug 2023 14:26:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
To: Jason Gunthorpe <jgg@nvidia.com>
References: <ZL/B6yvO1bIkFRcF@nvidia.com>
 <CH3PR11MB7177FA18562FCED8A3171007F803A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <ZMBSWxYnWLlzG3+6@nvidia.com>
 <IA0PR11MB71853E11B6C419DC0D043953F801A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMJbywGYN0QLh3vF@nvidia.com>
 <CH3PR11MB71779C83F8A0EC6C2F3F4B0CF807A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <ZMbtsY4O3Ho3B69J@nvidia.com>
 <IA0PR11MB71857E9D6C3AD311CF698D13F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMj4Og063T6T/okI@nvidia.com>
 <d4bae5e4-ff92-bee9-d585-9f30e34ef646@redhat.com>
 <ZMj5MvQGk2PQiJn+@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <ZMj5MvQGk2PQiJn+@nvidia.com>
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Alistair Popple <apopple@nvidia.com>,
 Hugh Dickins <hughd@google.com>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 Mike Kravetz <mike.kravetz@oracle.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01.08.23 14:23, Jason Gunthorpe wrote:
> On Tue, Aug 01, 2023 at 02:22:12PM +0200, David Hildenbrand wrote:
>> On 01.08.23 14:19, Jason Gunthorpe wrote:
>>> On Tue, Aug 01, 2023 at 05:32:38AM +0000, Kasireddy, Vivek wrote:
>>>
>>>>> You get another invalidate because the memfd removes the zero pages
>>>>> that hmm_range_fault installed in the PTEs before replacing them with
>>>>> actual writable pages. Then you do the move, and another
>>>>> hmm_range_fault, and basically the whole thing over again. Except this
>>>>> time instead of returning zero pages it returns actual writable
>>>>> page.
>>>
>>>> Ok, when I tested earlier (by registering an invalidate callback) but without
>>>> hmm_range_fault(), I did not find this additional invalidate getting triggered.
>>>> Let me try with hmm_range_fault() and see if everything works as expected.
>>>> Thank you for your help.
>>>
>>> If you do not get an invalidate then there is a pretty serious bug in
>>> the mm that needs fixing.
>>>
>>> Anything hmm_range_fault() returns must be invalidated if the
>>> underying CPU mapping changes for any reasons. Since hmm_range_fault()
>>> will populate zero pages when reading from a hole in a memfd, it must
>>> also get an invalidation when the zero pages are changed into writable
>>> pages.
>>
>> Can you point me at the code that returns that (shared) zero page?
> 
> It calls handle_mm_fault() - shouldn't that do it? Same as if the CPU
> read faulted the page?

To the best of my knowledge, the shared zeropage is only used in 
MAP_PRIVATE|MAP_AON mappings and in weird DAX mappings.

If that changed, we have to fix FOLL_PIN|FOLL_LONGTERM for MAP_SHARED VMAs.

If you read-fault on a memfd hole, you should get a proper "zeroed" 
pagecache page that effectively "filled that hole" -- so there is no 
file hole anymore.

-- 
Cheers,

David / dhildenb

