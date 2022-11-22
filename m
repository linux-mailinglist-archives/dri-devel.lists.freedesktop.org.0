Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CECA5633E7B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 15:07:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2566110E0D8;
	Tue, 22 Nov 2022 14:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF4710E0D8;
 Tue, 22 Nov 2022 14:07:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 71F8E6155C;
 Tue, 22 Nov 2022 14:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B899AC433C1;
 Tue, 22 Nov 2022 14:07:35 +0000 (UTC)
Message-ID: <4d3ef082-f7b3-2b6e-6fcf-5f991ffe14e9@xs4all.nl>
Date: Tue, 22 Nov 2022 15:07:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH RFC 16/19] mm/frame-vector: remove FOLL_FORCE usage
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20221107161740.144456-1-david@redhat.com>
 <20221107161740.144456-17-david@redhat.com>
 <CAAFQd5C3Ba1WhjYJF_7tW06mgvzoz9KTakNo+Tz8h_f6dGKzHQ@mail.gmail.com>
 <6175d780-3307-854c-448a-8e6c7ad0772c@xs4all.nl>
 <6ace6cd4-3e13-8ec1-4c2a-49e2e14e81a6@redhat.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <6ace6cd4-3e13-8ec1-4c2a-49e2e14e81a6@redhat.com>
Content-Type: text/plain; charset=UTF-8
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

On 11/22/22 13:38, David Hildenbrand wrote:
> On 22.11.22 13:25, Hans Verkuil wrote:
>> Hi Tomasz, David,
>>
>> On 11/8/22 05:45, Tomasz Figa wrote:
>>> Hi David,
>>>
>>> On Tue, Nov 8, 2022 at 1:19 AM David Hildenbrand <david@redhat.com> wrote:
>>>>
>>>> FOLL_FORCE is really only for debugger access. According to commit
>>>> 707947247e95 ("media: videobuf2-vmalloc: get_userptr: buffers are always
>>>> writable"), the pinned pages are always writable.
>>>
>>> Actually that patch is only a workaround to temporarily disable
>>> support for read-only pages as they seemed to suffer from some
>>> corruption issues in the retrieved user pages. We expect to support
>>> read-only pages as hardware input after. That said, FOLL_FORCE doesn't
>>> sound like the right thing even in that case, but I don't know the
>>> background behind it being added here in the first place. +Hans
>>> Verkuil +Marek Szyprowski do you happen to remember anything about it?
>>
>> I tracked the use of 'force' all the way back to the first git commit
>> (2.6.12-rc1) in the very old video-buf.c. So it is very, very old and the
>> reason is lost in the mists of time.
>>
>> I'm not sure if the 'force' argument of get_user_pages() at that time
>> even meant the same as FOLL_FORCE today. From what I can tell it has just
>> been faithfully used ever since, but I have my doubt that anyone understands
>> the reason behind it since it was never explained.
>>
>> Looking at this old LWN article https://lwn.net/Articles/28548/ suggests
>> that it might be related to calling get_user_pages for write buffers
>> (non-zero write argument) where you also want to be able to read from the
>> buffer. That is certainly something that some drivers need to do post-capture
>> fixups.
>>
>> But 'force' was also always set for read buffers, and I don't know if that
>> was something that was actually needed, or just laziness.
>>
>> I assume that removing FOLL_FORCE from 'FOLL_FORCE|FOLL_WRITE' will still
>> allow drivers to read from the buffer?
> 
> Yes. The only problematic corner case I can imagine is if someone has a 
> VMA without write permissions (no PROT_WRITE/VM_WRITE) and wants to pin 
> user space pages as a read buffer. We'd specify now FOLL_WRITE without 
> FOLL_FORCE and GUP would reject that: write access without write 
> permissions is invalid.

I do not believe this will be an issue.

> 
> There would be no way around "fixing" this implementation to not specify 
> FOLL_WRITE when only reading from user-space pages. Not sure what the 
> implications are regarding that corruption that was mentioned in 
> 707947247e95.

Before 707947247e95 the FOLL_WRITE flag was only set for write buffers
(i.e. video capture, DMA_FROM_DEVICE), not for read buffers (video output,
DMA_TO_DEVICE). In the video output case there should never be any need
for drivers to write to the buffer to the best of my knowledge.

But I have had some complaints about that commit that it causes problems
in some scenarios, and it has been on my todo list for quite some time now
to dig deeper into this. I probably should prioritize this for this or
next week.

> 
> Having said that, I assume such a scenario is unlikely -- but you might 
> know better how user space usually uses this interface. There would be 
> three options:
> 
> 1) Leave the FOLL_FORCE hack in for now, which I *really* want to avoid.
> 2) Remove FOLL_FORCE and see if anybody even notices (this patch) and
>     leave the implementation as is for now.
> 3) Remove FOLL_FORCE and fixup the implementation to only specify
>     FOLL_WRITE if the pages will actually get written to.
> 
> 3) would most probably ideal, however, I am no expert on that code and 
> can't do it (707947247e95 confuses me). So naive me would go with 2) first.
> 

Option 3 would be best. And 707947247e95 confuses me as well, and I actually
wrote it :-) I am wondering whether it was addressed at the right level, but
as I said, I need to dig a bit deeper into this.

Regards,

	Hans
