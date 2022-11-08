Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF48620C76
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 10:40:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A79810E3D0;
	Tue,  8 Nov 2022 09:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9393310E3CC
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 09:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667900429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lW38e6pXJ1acSlo/JcbNSc5AQG/ffLUgHR8IViSMTS4=;
 b=O0MA1cEdynN3K44Hxva6GbmQ61QfYPqmLajiUxaHDSMUpct4ljqhxUXk+QZysujokqKC7W
 d5/LrmjkmsxlS0lP8JrJuPGDs067f/5jIpP5pwjBwlZMLd1vVrUsENmwGSnjsgKceCbM1D
 E9oeg6nO04focmhTZPIomxzVURwCZL4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-351-ieTKZCw7NTid_1_b57oKTQ-1; Tue, 08 Nov 2022 04:40:26 -0500
X-MC-Unique: ieTKZCw7NTid_1_b57oKTQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 v12-20020adfa1cc000000b00236eaee7197so3754699wrv.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 01:40:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lW38e6pXJ1acSlo/JcbNSc5AQG/ffLUgHR8IViSMTS4=;
 b=aoO3xPa2ZQyADs6vrWhn3eIYhlrOUrPMB2v70N8tW8nnnRCpivKCfSJ8TIu/fylpmV
 uV9jkbXxL0YwtzqVzYdSeqcCfUwdI3vJFfoICBXXlIOyp0XKUMpiMab+oY3Jm9spHI54
 vhs4pwQ36gvyvrsfSIkZ+6txj0ErbtKBFPd1SdklYwAxKfQcJ5Ip4CK8IlvD3ht7Acji
 x0kMeItQat8Amd/p4SWTtcm38yvWzlMpd4QdaRvnajmuZwqCsZMdjBdU2wioIEOAqmyA
 9POEDRouDGPIVXAeH8Q2+JpU9B/N5feAin188drH5D7Ee0XLhtiME+mfqST385nHzH03
 o1XA==
X-Gm-Message-State: ACrzQf2k7WwuGJ+JQ3PMtPoUjdPQwYjcqVP9nCz20K/a/xFnGfDWr1C0
 hJa1IfShYGNEiJ1cEgqavUXhN37yWH47zKp2HgiDQiih7xHx2cAidj2dkdtiZSB+uFDDhgxTGJI
 ybrvJpk+y5vVBH2GgLqZWcKGyHgh8
X-Received: by 2002:a05:600c:54ca:b0:3cf:8e5d:7146 with SMTP id
 iw10-20020a05600c54ca00b003cf8e5d7146mr18675270wmb.191.1667900425631; 
 Tue, 08 Nov 2022 01:40:25 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5cH9tWJ/7f+h1bsvSFgTQP1m4PENc1Ye2cP0NqhUl7fQavJfxFFKESh5AiG6/w6GmkhSUyjQ==
X-Received: by 2002:a05:600c:54ca:b0:3cf:8e5d:7146 with SMTP id
 iw10-20020a05600c54ca00b003cf8e5d7146mr18675241wmb.191.1667900425279; 
 Tue, 08 Nov 2022 01:40:25 -0800 (PST)
Received: from ?IPV6:2003:cb:c708:db00:6510:da8d:df40:abbb?
 (p200300cbc708db006510da8ddf40abbb.dip0.t-ipconnect.de.
 [2003:cb:c708:db00:6510:da8d:df40:abbb])
 by smtp.gmail.com with ESMTPSA id
 bu12-20020a056000078c00b0023655e51c33sm10027356wrb.4.2022.11.08.01.40.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 01:40:24 -0800 (PST)
Message-ID: <040542e7-7d1c-4f25-b1ed-459f3c165283@redhat.com>
Date: Tue, 8 Nov 2022 10:40:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
To: Tomasz Figa <tfiga@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20221107161740.144456-1-david@redhat.com>
 <20221107161740.144456-17-david@redhat.com>
 <CAAFQd5C3Ba1WhjYJF_7tW06mgvzoz9KTakNo+Tz8h_f6dGKzHQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH RFC 16/19] mm/frame-vector: remove FOLL_FORCE usage
In-Reply-To: <CAAFQd5C3Ba1WhjYJF_7tW06mgvzoz9KTakNo+Tz8h_f6dGKzHQ@mail.gmail.com>
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

On 08.11.22 05:45, Tomasz Figa wrote:
> Hi David,

Hi Tomasz,

thanks for looking into this!

> 
> On Tue, Nov 8, 2022 at 1:19 AM David Hildenbrand <david@redhat.com> wrote:
>>
>> FOLL_FORCE is really only for debugger access. According to commit
>> 707947247e95 ("media: videobuf2-vmalloc: get_userptr: buffers are always
>> writable"), the pinned pages are always writable.
> 

As reference, the cover letter of the series:

https://lkml.kernel.org/r/20221107161740.144456-1-david@redhat.com

> Actually that patch is only a workaround to temporarily disable
> support for read-only pages as they seemed to suffer from some
> corruption issues in the retrieved user pages. We expect to support
> read-only pages as hardware input after. That said, FOLL_FORCE doesn't
> sound like the right thing even in that case, but I don't know the
> background behind it being added here in the first place. +Hans
> Verkuil +Marek Szyprowski do you happen to remember anything about it?

Maybe I mis-interpreted 707947247e95; re-reading it again, I am not 
quite sure what the actual problem is and how it relates to GUP 
FOLL_WRITE handling. FOLL_FORCE already was in place before 707947247e95 
and should be removed.

What I understood is "Just always call vb2_create_framevec() with 
FOLL_WRITE to always allow writing to the buffers.".


If the pinned page is never written to via the obtained GUP reference:
* FOLL_WRITE should not be set
* FOLL_FORCE should not be set
* We should not dirty the page when unpinning

If the pinned page may be written to via the obtained GUP reference:
* FOLL_WRITE should be set
* FOLL_FORCE should not be set
* We should dirty the page when unpinning


If the function is called for both, we should think about doing it 
conditional based on a "write" variable, like pre-707947247e95 did.

@Hans, any insight?

-- 
Thanks,

David / dhildenb

