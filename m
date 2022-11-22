Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A2A633FC0
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 16:04:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FA5882AF;
	Tue, 22 Nov 2022 15:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEDC210E407
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 15:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669129424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=In9GuqAn29oXIcP45h0iG42nfIf4b++tYbTcRtB/XTA=;
 b=Wh44xFnp6qsD+t2fiFeiXPxccC/IvClEoRGxbPzx8R7pbGUJ8/X0RBs3cRHp0UBziiTYI5
 Dx9A0z0ngLgAkHMdH5RIRb+6IJYBv1kIWDG+wUBnWpMZHJlgeRL8ADzYqLHHpYB3ttb07+
 q7FU/iJHK8lRWp2oUHS+3E7mfL2gP/o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-216-R6lFcnHHMXuTi-WEiTVWTA-1; Tue, 22 Nov 2022 10:03:43 -0500
X-MC-Unique: R6lFcnHHMXuTi-WEiTVWTA-1
Received: by mail-wm1-f69.google.com with SMTP id
 bi19-20020a05600c3d9300b003cf9d6c4016so11103187wmb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 07:03:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=In9GuqAn29oXIcP45h0iG42nfIf4b++tYbTcRtB/XTA=;
 b=ayK7KORu8K+Qd2tdaB+e1UsmoWSDMNKUymIdrVs5JnZrP8gMjhi5oywFKuyqUgmwcJ
 AoXjnIRLY7fVgpbztFmugvLNsl7MFKAl/QAcEI3ZpdHBpq24bIe6UF0jBR8sKfT8piFH
 /FdxMuF7jEJQnfq+wsMrrRAGqVEOCD25VfWSu7dQVlb+DPVFvO/lWPMbg7qIYNYOR2Xq
 jaGFN2AHoT72/3vO3i3WqBVV0JNgYYKiui8NwLEaybEDBIqGd5RTvd52IvcgBQDa4ZtL
 WC5CL6wg2yYuOznozz4WeWVkubXkNK8n5ZNTdFbtfzh/iePx7lWEfhRFuoccu8UUOQnI
 E8XQ==
X-Gm-Message-State: ANoB5pn+HCV+FVzVBtx/XFpq5wfJOHsCvRGIGvnr2nvIpDmZN91cCrDc
 EPCNeTEU0+7E1JMJodNozcpYDPGLp71TaylnHJEJL+voTAotPSE30AEz0SYtB095y1pudyfnQG/
 CJOyoNVogLBgjao+u9NOLNgRQu7Pd
X-Received: by 2002:adf:ea4d:0:b0:22e:38b9:5d6d with SMTP id
 j13-20020adfea4d000000b0022e38b95d6dmr4031736wrn.276.1669129422179; 
 Tue, 22 Nov 2022 07:03:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf54snVDIVC/Upuxil+entzwHNnXxSae3W9n6F4Fs/sye/XpHsJ2iwBQKe4HoNog5OAYgHNY7A==
X-Received: by 2002:adf:ea4d:0:b0:22e:38b9:5d6d with SMTP id
 j13-20020adfea4d000000b0022e38b95d6dmr4031700wrn.276.1669129421815; 
 Tue, 22 Nov 2022 07:03:41 -0800 (PST)
Received: from ?IPV6:2003:cb:c706:c300:b066:75e3:f1d2:b69b?
 (p200300cbc706c300b06675e3f1d2b69b.dip0.t-ipconnect.de.
 [2003:cb:c706:c300:b066:75e3:f1d2:b69b])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a5d668d000000b00236488f62d6sm14289929wru.79.2022.11.22.07.03.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 07:03:41 -0800 (PST)
Message-ID: <56fecbe9-ecf1-bdac-4e05-4767aa9d4386@redhat.com>
Date: Tue, 22 Nov 2022 16:03:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH RFC 16/19] mm/frame-vector: remove FOLL_FORCE usage
To: Hans Verkuil <hverkuil@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20221107161740.144456-1-david@redhat.com>
 <20221107161740.144456-17-david@redhat.com>
 <CAAFQd5C3Ba1WhjYJF_7tW06mgvzoz9KTakNo+Tz8h_f6dGKzHQ@mail.gmail.com>
 <6175d780-3307-854c-448a-8e6c7ad0772c@xs4all.nl>
 <6ace6cd4-3e13-8ec1-4c2a-49e2e14e81a6@redhat.com>
 <4d3ef082-f7b3-2b6e-6fcf-5f991ffe14e9@xs4all.nl>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <4d3ef082-f7b3-2b6e-6fcf-5f991ffe14e9@xs4all.nl>
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
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org,
 Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org,
 linux-rdma@vger.kernel.org, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
 etnaviv@lists.freedesktop.org, Peter Xu <peterx@redhat.com>,
 Muchun Song <songmuchun@bytedance.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22.11.22 15:07, Hans Verkuil wrote:
> On 11/22/22 13:38, David Hildenbrand wrote:
>> On 22.11.22 13:25, Hans Verkuil wrote:
>>> Hi Tomasz, David,
>>>
>>> On 11/8/22 05:45, Tomasz Figa wrote:
>>>> Hi David,
>>>>
>>>> On Tue, Nov 8, 2022 at 1:19 AM David Hildenbrand <david@redhat.com> wrote:
>>>>>
>>>>> FOLL_FORCE is really only for debugger access. According to commit
>>>>> 707947247e95 ("media: videobuf2-vmalloc: get_userptr: buffers are always
>>>>> writable"), the pinned pages are always writable.
>>>>
>>>> Actually that patch is only a workaround to temporarily disable
>>>> support for read-only pages as they seemed to suffer from some
>>>> corruption issues in the retrieved user pages. We expect to support
>>>> read-only pages as hardware input after. That said, FOLL_FORCE doesn't
>>>> sound like the right thing even in that case, but I don't know the
>>>> background behind it being added here in the first place. +Hans
>>>> Verkuil +Marek Szyprowski do you happen to remember anything about it?
>>>
>>> I tracked the use of 'force' all the way back to the first git commit
>>> (2.6.12-rc1) in the very old video-buf.c. So it is very, very old and the
>>> reason is lost in the mists of time.
>>>
>>> I'm not sure if the 'force' argument of get_user_pages() at that time
>>> even meant the same as FOLL_FORCE today. From what I can tell it has just
>>> been faithfully used ever since, but I have my doubt that anyone understands
>>> the reason behind it since it was never explained.
>>>
>>> Looking at this old LWN article https://lwn.net/Articles/28548/ suggests
>>> that it might be related to calling get_user_pages for write buffers
>>> (non-zero write argument) where you also want to be able to read from the
>>> buffer. That is certainly something that some drivers need to do post-capture
>>> fixups.
>>>
>>> But 'force' was also always set for read buffers, and I don't know if that
>>> was something that was actually needed, or just laziness.
>>>
>>> I assume that removing FOLL_FORCE from 'FOLL_FORCE|FOLL_WRITE' will still
>>> allow drivers to read from the buffer?
>>
>> Yes. The only problematic corner case I can imagine is if someone has a
>> VMA without write permissions (no PROT_WRITE/VM_WRITE) and wants to pin
>> user space pages as a read buffer. We'd specify now FOLL_WRITE without
>> FOLL_FORCE and GUP would reject that: write access without write
>> permissions is invalid.
> 
> I do not believe this will be an issue.
> 
>>
>> There would be no way around "fixing" this implementation to not specify
>> FOLL_WRITE when only reading from user-space pages. Not sure what the
>> implications are regarding that corruption that was mentioned in
>> 707947247e95.
> 
> Before 707947247e95 the FOLL_WRITE flag was only set for write buffers
> (i.e. video capture, DMA_FROM_DEVICE), not for read buffers (video output,
> DMA_TO_DEVICE). In the video output case there should never be any need
> for drivers to write to the buffer to the best of my knowledge.
> 
> But I have had some complaints about that commit that it causes problems
> in some scenarios, and it has been on my todo list for quite some time now
> to dig deeper into this. I probably should prioritize this for this or
> next week.
> 
>>
>> Having said that, I assume such a scenario is unlikely -- but you might
>> know better how user space usually uses this interface. There would be
>> three options:
>>
>> 1) Leave the FOLL_FORCE hack in for now, which I *really* want to avoid.
>> 2) Remove FOLL_FORCE and see if anybody even notices (this patch) and
>>      leave the implementation as is for now.
>> 3) Remove FOLL_FORCE and fixup the implementation to only specify
>>      FOLL_WRITE if the pages will actually get written to.
>>
>> 3) would most probably ideal, however, I am no expert on that code and
>> can't do it (707947247e95 confuses me). So naive me would go with 2) first.
>>
> 
> Option 3 would be best. And 707947247e95 confuses me as well, and I actually
> wrote it :-) I am wondering whether it was addressed at the right level, but
> as I said, I need to dig a bit deeper into this.

Cool, let me know if I can help!

-- 
Thanks,

David / dhildenb

