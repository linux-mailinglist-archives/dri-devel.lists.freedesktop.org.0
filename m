Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C747269C5
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 21:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A2A10E1E0;
	Wed,  7 Jun 2023 19:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42FA710E0ED
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 19:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686166079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CAuZKWxgMnD5I2dUAcxpBa+vUyMeeRszn4FXRAq2g14=;
 b=ajarC25pi8G7WiwY9n6+MI9u4kPCud6efQYrly/lOJWHSV9fON4q9u5ZGM2yYiMGnIGCHS
 E4qjdxH9ZcVxsGA49GvArJ2SQNUJo8L/zXrH3hSRRMjazEXukJ4K4AdeYffEtCkHqEOcmQ
 Y5ckLsPgCtqFY7pHsOn7tww7I21n4Lg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-2ne2CGkgNNGqZwGvec4zlg-1; Wed, 07 Jun 2023 15:27:56 -0400
X-MC-Unique: 2ne2CGkgNNGqZwGvec4zlg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30ade645c59so3465584f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 12:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686166075; x=1688758075;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CAuZKWxgMnD5I2dUAcxpBa+vUyMeeRszn4FXRAq2g14=;
 b=PNkk2WXYLFknUWL7dz0RJ5s/QU4MzV6zTpyuB2vOChu/9IJidjBOBHpLzjdJAaXYok
 5Lng1b4IJVnyLr1QuSJ1lVgHHjbG/QaeRzr6TdzUhX9bOhsy4LGxyIlQyZehX0g2pxoJ
 yeUaEyM+vevJ/mXW0D5Z3RgI2WowiCGkkfF8dQsYvVRUlo6rcdX9BN301gSBSQgJCUiS
 57vJcNN8p3BoOSSRvL6C3YJJ6g+SWOIjwclhEMAW4j+oys6VC0DOdQFDsxy7REybjvNI
 iWIXlGUU/CrUJp0iefanj+jy+oKEBvuvhlh4uffSyopdV5Y7jZVh8uFTxcjVhK+3qZgY
 QnTg==
X-Gm-Message-State: AC+VfDwaJOdn+PbOkR6wPx24S/cQgv8Jdm0nQXEmmqgwYQMgmawEVofj
 6cU5Su4rlZDwqX9MJ+E5y9DfAf+pOYhu9eECBzn6ELHlDsPmeum9FPvhQZSUMCjf+3Xt5ld4Lfv
 I2Z9F5mFu9konq6dXZAon6/olupfk
X-Received: by 2002:adf:f212:0:b0:30d:5cce:3bb5 with SMTP id
 p18-20020adff212000000b0030d5cce3bb5mr5361263wro.60.1686166075670; 
 Wed, 07 Jun 2023 12:27:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ53BZ7epzz2YZH1dV8dbSaXlZkItElGSeMArJqwAMGz80G25ws0g1jH8hMaJauWnUparPOSbg==
X-Received: by 2002:adf:f212:0:b0:30d:5cce:3bb5 with SMTP id
 p18-20020adff212000000b0030d5cce3bb5mr5361244wro.60.1686166075225; 
 Wed, 07 Jun 2023 12:27:55 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70e:9c00:8d26:3031:d131:455c?
 (p200300cbc70e9c008d263031d131455c.dip0.t-ipconnect.de.
 [2003:cb:c70e:9c00:8d26:3031:d131:455c])
 by smtp.gmail.com with ESMTPSA id
 t3-20020adfe103000000b0030ae6432504sm16252528wrz.38.2023.06.07.12.27.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 12:27:54 -0700 (PDT)
Message-ID: <e3383f71-6b33-9e44-d66e-aa889a2f183d@redhat.com>
Date: Wed, 7 Jun 2023 21:27:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] mm: fix hugetlb page unmap count balance issue
To: Mike Kravetz <mike.kravetz@oracle.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20230512072036.1027784-1-junxiao.chang@intel.com>
 <CADrL8HV25JyeaT=peaR7NWhUiaBz8LzpyFosYZ3_0ACt+twU6w@mail.gmail.com>
 <20230512232947.GA3927@monkey> <20230515170259.GA3848@monkey>
 <20230516223440.GA30624@monkey>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230516223440.GA30624@monkey>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: mhocko@suse.com, jmarchan@redhat.com, Dongwon Kim <dongwon.kim@intel.com>,
 Junxiao Chang <junxiao.chang@intel.com>, muchun.song@linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-mm@kvack.org,
 James Houghton <jthoughton@google.com>, akpm@linux-foundation.org,
 kirill.shutemov@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17.05.23 00:34, Mike Kravetz wrote:
> On 05/15/23 10:04, Mike Kravetz wrote:
>> On 05/12/23 16:29, Mike Kravetz wrote:
>>> On 05/12/23 14:26, James Houghton wrote:
>>>> On Fri, May 12, 2023 at 12:20 AM Junxiao Chang <junxiao.chang@intel.com> wrote:
>>>>
>>>> This alone doesn't fix mapcounting for PTE-mapped HugeTLB pages. You
>>>> need something like [1]. I can resend it if that's what we should be
>>>> doing, but this mapcounting scheme doesn't work when the page structs
>>>> have been freed.
>>>>
>>>> It seems like it was a mistake to include support for hugetlb memfds in udmabuf.
>>>
>>> IIUC, it was added with commit 16c243e99d33 udmabuf: Add support for mapping
>>> hugepages (v4).  Looks like it was never sent to linux-mm?  That is unfortunate
>>> as hugetlb vmemmap freeing went in at about the same time.  And, as you have
>>> noted udmabuf will not work if hugetlb vmemmap freeing is enabled.
>>>
>>> Sigh!
>>>
>>> Trying to think of a way forward.
>>> -- 
>>> Mike Kravetz
>>>
>>>>
>>>> [1]: https://lore.kernel.org/linux-mm/20230306230004.1387007-2-jthoughton@google.com/
>>>>
>>>> - James
>>
>> Adding people and list on Cc: involved with commit 16c243e99d33.
>>
>> There are several issues with trying to map tail pages of hugetllb pages
>> not taken into account with udmabuf.  James spent quite a bit of time trying
>> to understand and address all the issues with the HGM code.  While using
>> the scheme proposed by James, may be an approach to the mapcount issue there
>> are also other issues that need attention.  For example, I do not see how
>> the fault code checks the state of the hugetlb page (such as poison) as none
>> of that state is carried in tail pages.
>>
>> The more I think about it, the more I think udmabuf should treat hugetlb
>> pages as hugetlb pages.  They should be mapped at the appropriate level
>> in the page table.  Of course, this would impose new restrictions on the
>> API (mmap and ioctl) that may break existing users.  I have no idea how
>> extensively udmabuf is being used with hugetlb mappings.
> 
> Verified that using udmabug on a hugetlb mapping with vmemmap optimization will
> BUG as:
> 
> [14106.812312] BUG: unable to handle page fault for address: ffffea000a7c4030
> [14106.813704] #PF: supervisor write access in kernel mode
> [14106.814791] #PF: error_code(0x0003) - permissions violation
> [14106.815921] PGD 27fff9067 P4D 27fff9067 PUD 27fff8067 PMD 17ec34067 PTE 8000000285dab021
> [14106.818489] Oops: 0003 [#1] PREEMPT SMP PTI
> [14106.819345] CPU: 2 PID: 2313 Comm: udmabuf Not tainted 6.4.0-rc1-next-20230508+ #44
> [14106.820906] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-1.fc37 04/01/2014
> [14106.822679] RIP: 0010:page_add_file_rmap+0x2e/0x270
> 
> I started looking more closely at the driver and I do not fully understand the
> usage model.  I took clues from the selftest and driver.  It seems the first
> step is to create a buffer via the UDMABUF_CREATE ioctl.  This will copy 4K
> pages from the page cache to an array associated with a file.  I did note that
> hugetlb and shm behavior is different here as the driver can not add missing
> hugetlb pages to the cache as it does with shm.  However, what seems more
> concerning is that there is nothing to prevent the pages from being replaced
> in the cache before being added to a udmabuf mapping.  This means udmabuf
> mapping and original memfd could be operating on a different set of pages.
> Is this acceptable, or somehow prevented?
> 
> In my role, I am more interested in udmabuf handling of hugetlb pages.
> Trying to use individual 4K pages of hugetlb pages is something that
> should be avoided here.  Would it be acceptable to change code so that
> only whole hugetlb pages are used by udmabuf?  If not, then perhaps the
> existing hugetlb support can be removed?

I'm wondering if that VMA shouldn't be some kind of special mapping 
(VM_PFNMAP), such that the struct page is entirely ignored?

I'm quite confused and concerned when I read that code (what the hell is 
it doing with shmem/hugetlb pages? why does the mapcount even get adjusted?)

This all has a bad smell to it, I hope I'm missing something important ...

-- 
Cheers,

David / dhildenb

