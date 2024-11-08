Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC11E9C259B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 20:33:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC92610EA30;
	Fri,  8 Nov 2024 19:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="L60C5nhK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3551510EA2F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 19:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731094434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HXUvQ9DDoTuKmTlcnKhUpWVHW2+zg/XnWwIaMSXVfPs=;
 b=L60C5nhKRy5F5hnXiDEA83IG1rydqE53hf+s6hxB5RQEEIByPxy0B5iNQ15t2frXbnTsjw
 T5om+zYWuA6QQAU4mlqwRydd82MQ2s0vXaxmSYnI6Cl4up1AZ1vzerhwcaMAMu13AerwVT
 L7WB75zHpsJICtQajS3MP0GMs1OjSwc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-pYb-5cgwPr-7PuUvhf8Hag-1; Fri, 08 Nov 2024 14:33:53 -0500
X-MC-Unique: pYb-5cgwPr-7PuUvhf8Hag-1
X-Mimecast-MFC-AGG-ID: pYb-5cgwPr-7PuUvhf8Hag
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-37d67f4bf98so1174413f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 11:33:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731094432; x=1731699232;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HXUvQ9DDoTuKmTlcnKhUpWVHW2+zg/XnWwIaMSXVfPs=;
 b=mWWxeFarY+pgo7Bkp+WZartYiQjijgX0dhB6UGtwvbzMZ6fdW8gIAFOtUM7HNZFZSQ
 F2jwgw/S83t33CJXogGsCWzdErGCC/oW3sRONpPapYU1jrcfhUtqM5ExNfEm04gW/XLg
 0rER5CgbrUtE7E/0VQ+a6XzoZOBVRWwA148XQIqu1y50h8ic4kDugJ0OmSi0fR3jtMVW
 LDS7RnSM41mhR5Bwfcm+NkzDSrLM28rpPa0l9yrgd+lBBHB+b+pMroKaKYXgess2v883
 hEzQY0eEESqVxE0wiLHUamCSkv04c5K6pqXnLiFpyEFpG7MpTdbx92522g/MJd1Bo0Rv
 lEBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFIq2lzSdug3YjmIyctK6TS/5AMhUQRWh6SqpxOWm06B7Ho4jHfIjlyqhQfCJv+VmnrWx6oLanv8E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdJKoI7YUe4RAz+G1Hg3mUEaRyUjMMCQL5M/AMq0IG0JJ6NVyz
 o+cAiSU/7kpFHc+g9qoforUNjsrY9VzqD/jb8VeOg/22BOUPLsWRnMIjciBqAbLrwBqVC7bzWgo
 6FAaN9HPbOCD39/EmbBKKLMSJvV2I2EGf2t9748f2HZP/nhtp60GmztPB5ypHzytIXw==
X-Received: by 2002:a05:6000:1564:b0:381:d014:9be0 with SMTP id
 ffacd0b85a97d-381f186c6a3mr3649581f8f.17.1731094431750; 
 Fri, 08 Nov 2024 11:33:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMHDodmRF53aDkZGw6BGZ9F+ccf5Mc+bz5kN7YN38h8pDU+2YBOqvKdtD83yKuSgIuDHnfag==
X-Received: by 2002:a05:6000:1564:b0:381:d014:9be0 with SMTP id
 ffacd0b85a97d-381f186c6a3mr3649554f8f.17.1731094431330; 
 Fri, 08 Nov 2024 11:33:51 -0800 (PST)
Received: from ?IPV6:2003:d8:2f3a:cb00:3f4e:6894:3a3b:36b5?
 (p200300d82f3acb003f4e68943a3b36b5.dip0.t-ipconnect.de.
 [2003:d8:2f3a:cb00:3f4e:6894:3a3b:36b5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed9ea7c3sm5912898f8f.80.2024.11.08.11.33.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2024 11:33:50 -0800 (PST)
Message-ID: <9dc212ac-c4c3-40f2-9feb-a8bcf71a1246@redhat.com>
Date: Fri, 8 Nov 2024 20:33:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 00/10] mm: Introduce and use folio_owner_ops
To: Jason Gunthorpe <jgg@nvidia.com>, Fuad Tabba <tabba@google.com>
Cc: linux-mm@kvack.org, kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rppt@kernel.org, jglisse@redhat.com,
 akpm@linux-foundation.org, muchun.song@linux.dev, simona@ffwll.ch,
 airlied@gmail.com, pbonzini@redhat.com, seanjc@google.com,
 willy@infradead.org, jhubbard@nvidia.com, ackerleytng@google.com,
 vannapurve@google.com, mail@maciej.szmigiero.name,
 kirill.shutemov@linux.intel.com, quic_eberman@quicinc.com, maz@kernel.org,
 will@kernel.org, qperret@google.com, keirf@google.com, roypat@amazon.co.uk
References: <20241108162040.159038-1-tabba@google.com>
 <20241108170501.GI539304@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20241108170501.GI539304@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Dgh2EdRzobN_o7eC00sqFBOZS101EF6u5Nktq3mXAuQ_1731094432
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08.11.24 18:05, Jason Gunthorpe wrote:
> On Fri, Nov 08, 2024 at 04:20:30PM +0000, Fuad Tabba wrote:
>> Some folios, such as hugetlb folios and zone device folios,
>> require special handling when the folio's reference count reaches
>> 0, before being freed. Moreover, guest_memfd folios will likely
>> require special handling to notify it once a folio's reference
>> count reaches 0, to facilitate shared to private folio conversion
>> [*]. Currently, each usecase has a dedicated callback when the
>> folio refcount reaches 0 to that effect. Adding yet more
>> callbacks is not ideal.
> 

Thanks for having a look!

Replying to clarify some things. Fuad, feel free to add additional 
information.

> Honestly, I question this thesis. How complex would it be to have 'yet
> more callbacks'? Is the challenge really that the mm can't detect when
> guestmemfd is the owner of the page because the page will be
> ZONE_NORMAL?

Fuad might have been a bit imprecise here: We don't want an ever growing 
list of checks+callbacks on the page freeing fast path.

This series replaces the two cases we have by a single generic one, 
which is nice independent of guest_memfd I think.

> 
> So the point of this is really to allow ZONE_NORMAL pages to have a
> per-allocator callback?

To intercept the refcount going to zero independent of any zones or 
magic page types, without as little overhead in the common page freeing 
path.

It can be used to implement custom allocators, like factored out for 
hugetlb in this series. It's not necessarily limited to that, though. It 
can be used as a form of "asynchronous page ref freezing", where you get 
notified once all references are gone.

(I might have another use case with PageOffline, where we want to 
prevent virtio-mem ones of them from getting accidentally leaked into 
the buddy during memory offlining with speculative references -- 
virtio_mem_fake_offline_going_offline() contains the interesting bits. 
But I did not look into the dirty details yet, just some thought where 
we'd want to intercept the refcount going to 0.)

> 
> But this is also why I suggested to shift them to ZONE_DEVICE for
> guestmemfd, because then you get these things for free from the pgmap.

With this series even hugetlb gets it for "free", and hugetlb is not 
quite the nail for the ZONE_DEVICE hammer IMHO :)

For things we can statically set aside early during boot and never 
really want to return to the buddy/another allocator, I would agree that 
static ZONE_DEVICE would have possible.

Whenever the buddy or other allocators are involved, and we might have 
granularity as a handful of pages (e.g., taken from the buddy), getting 
ZONE_DEVICE involved is not a good (or even feasible) approach.

After all, all we want is intercept the refcount going to 0.

-- 
Cheers,

David / dhildenb

