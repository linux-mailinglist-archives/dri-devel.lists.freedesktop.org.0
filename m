Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F27633CAA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 13:38:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A17018825E;
	Tue, 22 Nov 2022 12:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68FB110E3D0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 12:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669120723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TlBwJNp/jitu4dnjNvCRWCp8vuWXGMZrB45QP9OtTb4=;
 b=IpzmBLNyACs49jY7lgm++c8lhjtDTgOXfwTpMANdyIWb3BfgSbDCeyxhy1qhFETXdDsd0G
 An5awmOQ49LKZxGh5izikymF4VR9bXLTXwERrsalSCWWgRSGPg0Pw+ndj60IUPIGdPJpKh
 EWzeYEpE3ou6yA2Us7yJHfSCe5bm1GU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-185-2DvPkuXtOxOv2q7bIOOdaw-1; Tue, 22 Nov 2022 07:38:42 -0500
X-MC-Unique: 2DvPkuXtOxOv2q7bIOOdaw-1
Received: by mail-wm1-f69.google.com with SMTP id
 187-20020a1c02c4000000b003d016c210f7so4931319wmc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 04:38:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TlBwJNp/jitu4dnjNvCRWCp8vuWXGMZrB45QP9OtTb4=;
 b=1HtH/Cieao+EmBQ76I8nF1UnlsWwA9tgAAu7GGR+tDW3QgVlf4XqVMDfRycjwvUw8V
 ZD4S/xLn7E6pCScIUWr5lX+R40EbWWBkZzGHvuMg8grJx93Xgt/Qu7wOj8CDuBeJpj5z
 0AfLGTohxAt0aNkpAWSa3UiK59l3HgPygWZgGjpp1iIk6ZdWOhqnhA8K+OGD1LQvHL0F
 OZEoRTboUytEsXI9FYtI03MRcVkSWGyp4n6MyjTip/7bOZ4G/bmQ05KzckVQejZKBuSQ
 9UmZl8MZdCwUFPPlW9dbL6OyC4GGIAXxBmqXCN/eAsG47dxuRfrT4z9q2OwrQeuIGSPV
 paZg==
X-Gm-Message-State: ANoB5pl1iwdqGMevrlMX9mEyCLvMe+fnAYpqL5XfeojoVHUigwLDAs7E
 HAoiqxuhC6nDoAhezZZ9scuvGL5lY8JWQH7xRFpwqP0LYx3g6EjbLptJIaRrk2RljndNIvt2p5P
 HmhskF3cGn7SjQ9YaA9jLOrZYAh7q
X-Received: by 2002:adf:e844:0:b0:241:bfc9:5975 with SMTP id
 d4-20020adfe844000000b00241bfc95975mr6721675wrn.605.1669120721081; 
 Tue, 22 Nov 2022 04:38:41 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7FQCDctLOc6CMomYnGKvCTF1tBw+hwXPXd04O7+t428MWI9RvMvJ15rLs2ESKiQpMYCXYY+g==
X-Received: by 2002:adf:e844:0:b0:241:bfc9:5975 with SMTP id
 d4-20020adfe844000000b00241bfc95975mr6721629wrn.605.1669120720555; 
 Tue, 22 Nov 2022 04:38:40 -0800 (PST)
Received: from ?IPV6:2003:cb:c706:c300:b066:75e3:f1d2:b69b?
 (p200300cbc706c300b06675e3f1d2b69b.dip0.t-ipconnect.de.
 [2003:cb:c706:c300:b066:75e3:f1d2:b69b])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a5d5952000000b00236883f2f5csm13821707wri.94.2022.11.22.04.38.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 04:38:40 -0800 (PST)
Message-ID: <6ace6cd4-3e13-8ec1-4c2a-49e2e14e81a6@redhat.com>
Date: Tue, 22 Nov 2022 13:38:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
To: Hans Verkuil <hverkuil@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20221107161740.144456-1-david@redhat.com>
 <20221107161740.144456-17-david@redhat.com>
 <CAAFQd5C3Ba1WhjYJF_7tW06mgvzoz9KTakNo+Tz8h_f6dGKzHQ@mail.gmail.com>
 <6175d780-3307-854c-448a-8e6c7ad0772c@xs4all.nl>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH RFC 16/19] mm/frame-vector: remove FOLL_FORCE usage
In-Reply-To: <6175d780-3307-854c-448a-8e6c7ad0772c@xs4all.nl>
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

On 22.11.22 13:25, Hans Verkuil wrote:
> Hi Tomasz, David,
> 
> On 11/8/22 05:45, Tomasz Figa wrote:
>> Hi David,
>>
>> On Tue, Nov 8, 2022 at 1:19 AM David Hildenbrand <david@redhat.com> wrote:
>>>
>>> FOLL_FORCE is really only for debugger access. According to commit
>>> 707947247e95 ("media: videobuf2-vmalloc: get_userptr: buffers are always
>>> writable"), the pinned pages are always writable.
>>
>> Actually that patch is only a workaround to temporarily disable
>> support for read-only pages as they seemed to suffer from some
>> corruption issues in the retrieved user pages. We expect to support
>> read-only pages as hardware input after. That said, FOLL_FORCE doesn't
>> sound like the right thing even in that case, but I don't know the
>> background behind it being added here in the first place. +Hans
>> Verkuil +Marek Szyprowski do you happen to remember anything about it?
> 
> I tracked the use of 'force' all the way back to the first git commit
> (2.6.12-rc1) in the very old video-buf.c. So it is very, very old and the
> reason is lost in the mists of time.
> 
> I'm not sure if the 'force' argument of get_user_pages() at that time
> even meant the same as FOLL_FORCE today. From what I can tell it has just
> been faithfully used ever since, but I have my doubt that anyone understands
> the reason behind it since it was never explained.
> 
> Looking at this old LWN article https://lwn.net/Articles/28548/ suggests
> that it might be related to calling get_user_pages for write buffers
> (non-zero write argument) where you also want to be able to read from the
> buffer. That is certainly something that some drivers need to do post-capture
> fixups.
> 
> But 'force' was also always set for read buffers, and I don't know if that
> was something that was actually needed, or just laziness.
> 
> I assume that removing FOLL_FORCE from 'FOLL_FORCE|FOLL_WRITE' will still
> allow drivers to read from the buffer?

Yes. The only problematic corner case I can imagine is if someone has a 
VMA without write permissions (no PROT_WRITE/VM_WRITE) and wants to pin 
user space pages as a read buffer. We'd specify now FOLL_WRITE without 
FOLL_FORCE and GUP would reject that: write access without write 
permissions is invalid.

There would be no way around "fixing" this implementation to not specify 
FOLL_WRITE when only reading from user-space pages. Not sure what the 
implications are regarding that corruption that was mentioned in 
707947247e95.

Having said that, I assume such a scenario is unlikely -- but you might 
know better how user space usually uses this interface. There would be 
three options:

1) Leave the FOLL_FORCE hack in for now, which I *really* want to avoid.
2) Remove FOLL_FORCE and see if anybody even notices (this patch) and
    leave the implementation as is for now.
3) Remove FOLL_FORCE and fixup the implementation to only specify
    FOLL_WRITE if the pages will actually get written to.

3) would most probably ideal, however, I am no expert on that code and 
can't do it (707947247e95 confuses me). So naive me would go with 2) first.

-- 
Thanks,

David / dhildenb

