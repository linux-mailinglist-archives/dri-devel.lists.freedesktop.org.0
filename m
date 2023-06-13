Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAD872EA3A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 19:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D2F10E36F;
	Tue, 13 Jun 2023 17:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A619510E36F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 17:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686678670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=juXhP8h8oDmvEUGxpUcem9DQ8p6SNtDcHFetvbuMc3c=;
 b=B7+Et1Cp6np2W40v23Ml1UC4Mqo7BMHb9E8BPwXJYV7M6tMVUYSeKx5+slSvnb8epOezly
 3xm/hkafiVLsRu2WFBz/s0nQc610xgm3j9IXIrj5ImbCE/gCgySHGPw/slLxnpGWffpplm
 PBEk/PVF1nYVH8AMlhFwxEbfB0kuvmM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-7rjLp91uMiCuA0YQihNCyA-1; Tue, 13 Jun 2023 13:51:09 -0400
X-MC-Unique: 7rjLp91uMiCuA0YQihNCyA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f41a04a297so28162455e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 10:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686678668; x=1689270668;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=juXhP8h8oDmvEUGxpUcem9DQ8p6SNtDcHFetvbuMc3c=;
 b=W4SQVDJbhjiB/2Le7IWdUfapcmaNvBIUrlJhctlnOkh9eVNOn+3GHgc8zhDh1JL8Fx
 UK8OJtVTwBOnbrTmlGkBMH7wBR51nBnmoyoj3IYXBib/0+FXqBZqSQGvuJ/RRITu8Ewv
 N/XkBlptzUT3VGwqDr+7aDLfUTapbNwMKaew0EMLV/nmcN05kA/hUlwpRgbzq5omp+qM
 FVRYjYxaaiFfmrXt+Zov7qFdc3yoBc2C4VobJ0Z20JDxEif3CxM/K5xo087jweqqsDaO
 SZ/p5trpbA8zwk+Pc7YjXdjfb7uyCGqwiKAhIs4yNseet7C6l+Oui9zpH6TnGEcNODHH
 UYOA==
X-Gm-Message-State: AC+VfDy8RH92z8LnY1rrAGUQF6Uu01RtIZmESDvID/gyB2e/hqd66Vou
 lWnZIx8AEUjKwKzA/Tu0q0bD5MnqYSuLc4qbMZb64d7qvFLFFydjih2ivMyrSizC4SsIg96IZqJ
 zAirnevtjkWwW/sDVDi5kj0ICP4BB
X-Received: by 2002:a5d:550f:0:b0:30f:d2a2:4789 with SMTP id
 b15-20020a5d550f000000b0030fd2a24789mr555648wrv.15.1686678667877; 
 Tue, 13 Jun 2023 10:51:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6lyYhUT4jenaM6rLsrwexVg0v9nokG/WYAFV8FGI+Et386/Ww0vCErRFY7lVfu35C1ypzfbg==
X-Received: by 2002:a5d:550f:0:b0:30f:d2a2:4789 with SMTP id
 b15-20020a5d550f000000b0030fd2a24789mr555631wrv.15.1686678667516; 
 Tue, 13 Jun 2023 10:51:07 -0700 (PDT)
Received: from ?IPV6:2003:cb:c710:ff00:1a06:80f:733a:e8c6?
 (p200300cbc710ff001a06080f733ae8c6.dip0.t-ipconnect.de.
 [2003:cb:c710:ff00:1a06:80f:733a:e8c6])
 by smtp.gmail.com with ESMTPSA id
 h4-20020adffa84000000b0030647d1f34bsm15965105wrr.1.2023.06.13.10.51.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 10:51:07 -0700 (PDT)
Message-ID: <676ee47d-8ca0-94c4-7454-46e9915ea36a@redhat.com>
Date: Tue, 13 Jun 2023 19:51:05 +0200
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
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] udmabuf: revert 'Add support for mapping hugepages (v4)'
In-Reply-To: <IA0PR11MB71852D6B27C83658670CBFBDF855A@IA0PR11MB7185.namprd11.prod.outlook.com>
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

On 13.06.23 10:26, Kasireddy, Vivek wrote:
> Hi David,
> 
>>
>> On 12.06.23 09:10, Kasireddy, Vivek wrote:
>>> Hi Mike,
>>
>> Hi Vivek,
>>
>>>
>>> Sorry for the late reply; I just got back from vacation.
>>> If it is unsafe to directly use the subpages of a hugetlb page, then reverting
>>> this patch seems like the only option for addressing this issue immediately.
>>> So, this patch is
>>> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>>>
>>> As far as the use-case is concerned, there are two main users of the
>> udmabuf
>>> driver: Qemu and CrosVM VMMs. However, it appears Qemu is the only
>> one
>>> that uses hugetlb pages (when hugetlb=on is set) as the backing store for
>>> Guest (Linux, Android and Windows) system memory. The main goal is to
>>> share the pages associated with the Guest allocated framebuffer (FB) with
>>> the Host GPU driver and other components in a zero-copy way. To that
>> end,
>>> the guest GPU driver (virtio-gpu) allocates 4k size pages (associated with
>>> the FB) and pins them before sharing the (guest) physical (or dma)
>> addresses
>>> (and lengths) with Qemu. Qemu then translates the addresses into file
>>> offsets and shares these offsets with udmabuf.
>>
>> Is my understanding correct, that we can effectively long-term pin
>> (worse than mlock) 64 MiB per UDMABUF_CREATE, allowing eventually !root
> The 64 MiB limit is the theoretical upper bound that we have not seen hit in
> practice. Typically, for a 1920x1080 resolution (commonly used in Guests),
> the size of the FB is ~8 MB (1920x1080x4). And, most modern Graphics
> compositors flip between two FBs.
> 

Okay, but users with privileges to open that file can just create as 
many as they want? I think I'll have to play with it.

>> users
>>
>> ll /dev/udmabuf
>> crw-rw---- 1 root kvm 10, 125 12. Jun 08:12 /dev/udmabuf
>>
>> to bypass there effective MEMLOCK limit, fragmenting physical memory and
>> breaking swap?
> Right, it does not look like the mlock limits are honored.
> 

That should be added.

>>
>> Regarding the udmabuf_vm_fault(), I assume we're mapping pages we
>> obtained from the memfd ourselves into a special VMA (mmap() of the
> mmap operation is really needed only if any component on the Host needs
> CPU access to the buffer. But in most scenarios, we try to ensure direct GPU
> access (h/w acceleration via gl) to these pages.
> 
>> udmabuf). I'm not sure how well shmem pages are prepared for getting
>> mapped by someone else into an arbitrary VMA (page->index?).
> Most drm/gpu drivers use shmem pages as the backing store for FBs and
> other buffers and also provide mmap capability. What concerns do you see
> with this approach?

Are these mmaping the pages the way udmabuf maps these pages (IOW, 
on-demand fault where we core-mm will adjust the mapcount etc)?

Skimming over at shmem_read_mapping_page() users, I assume most of them 
use a VM_PFNMAP mapping (or don't mmap them at all), where we won't be 
messing with the struct page at all.

(That might even allow you to mmap hugetlb sub-pages, because the struct 
page -- and mapcount -- will be ignored completely and not touched.)

> 
>>
>> ... also, just imagine someone doing FALLOC_FL_PUNCH_HOLE / ftruncate()
>> on the memfd. What's mapped into the memfd no longer corresponds to
>> what's pinned / mapped into the VMA.
> IIUC, making use of the DMA_BUF_IOCTL_SYNC ioctl would help with any
> coherency issues:
> https://www.kernel.org/doc/html/v6.2/driver-api/dma-buf.html#c.dma_buf_sync
> 

Would it as of now? udmabuf_create() pulls the shmem pages out of the 
memfd, not sure how DMA_BUF_IOCTL_SYNC would help to update that 
whenever the pages inside the memfd would change (e.g., 
FALLOC_FL_PUNCH_HOLE + realloc).

But that's most probably simply "not supported".

>>
>>
>> Was linux-mm (and especially shmem maintainers, ccing Hugh) involved in
>> the upstreaming of udmabuf?
> It does not appear so from the link below although other key lists were cc'd:
> https://patchwork.freedesktop.org/patch/246100/?series=39879&rev=7

That's unfortunate :(

-- 
Cheers,

David / dhildenb

