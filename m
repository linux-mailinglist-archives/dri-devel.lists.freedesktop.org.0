Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2C0808945
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 14:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793F610E88D;
	Thu,  7 Dec 2023 13:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D867510E8AA
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 13:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701956150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=E/EwcdTZozOedmEE4X00D3yKhiMNuCK/D274aL2l810=;
 b=IJtFt+n2mURrSQKsQPQV9dCp0fv88DLe2kCHAehTxZUZmq0kKA59Asz8IO8xWApRab4NEn
 8re1ppAu/F31Af+B3fwWypATsYDKJYVoxgp+JpmvZXEC7l54ZMhaDFi5J9JWqFaizIf6KU
 bgaaJpvGB3Uv27o2EPFTgiLZ439qYN4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-OpTiqE-8O_GB8c_yRZmj2A-1; Thu, 07 Dec 2023 08:35:47 -0500
X-MC-Unique: OpTiqE-8O_GB8c_yRZmj2A-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-333405020afso954521f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 05:35:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701956146; x=1702560946;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :references:cc:to:content-language:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E/EwcdTZozOedmEE4X00D3yKhiMNuCK/D274aL2l810=;
 b=TTjDKE3YHnA6pPFgmqiTKYdkim7cye12W82N0koptPffrT0WsMWf7sTD8OFc7tM3QW
 +xyP2t3VFFLHIaXa/uBuUQEnCJja7cboBmazZDYH54hvekxowRA9NaWDF30a0ENUNctu
 Nt/3zS2P2S7KLYTFd1cc058TYfvFItxi40Qo4V/hYCw1Sb9Kgpg4s0VFOs4j1a9Rhafr
 EI4wAj+RnrjGG0jOtbiZTP1hqQpZyvXtRdwrdcrHgqmE7TU4QIlUz6yDeByVDewylRmL
 4QlruDLTWpqAbMr6o923vwQUUXxsJYwOpurkW/RZUork8TaPTCh3IZm2gM9iZNVl6lIs
 fw7A==
X-Gm-Message-State: AOJu0Yxa6XnUZZLmww6bJQumoT2wnarHK6KEX5BPIOHlAoLHhif3eJhT
 W41wDBguVSt273c2A36NdmaNIIOAIpFAE3nQkKP92awdOvvtX+XLdqrgjTnKxENfAfI8gCvhO2w
 zjEyJAnjdtowev6ODZY5YnRDRZ1JT
X-Received: by 2002:a05:600c:16d3:b0:40b:5e59:ccbd with SMTP id
 l19-20020a05600c16d300b0040b5e59ccbdmr1535020wmn.158.1701956146114; 
 Thu, 07 Dec 2023 05:35:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpM50rVoEmEdYhihLLiBeHAx4BEcHbUJPn7K2Dux16j4phDHcKDhiY4f0L5Vqlks8zHpK65Q==
X-Received: by 2002:a05:600c:16d3:b0:40b:5e59:ccbd with SMTP id
 l19-20020a05600c16d300b0040b5e59ccbdmr1535004wmn.158.1701956145718; 
 Thu, 07 Dec 2023 05:35:45 -0800 (PST)
Received: from ?IPV6:2003:cb:c71b:5d00:18d7:1475:24bc:2417?
 (p200300cbc71b5d0018d7147524bc2417.dip0.t-ipconnect.de.
 [2003:cb:c71b:5d00:18d7:1475:24bc:2417])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b0040b45282f88sm2000544wmq.36.2023.12.07.05.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 05:35:45 -0800 (PST)
Message-ID: <5e9ca410-3273-493b-bb8a-8496ab0879c0@redhat.com>
Date: Thu, 7 Dec 2023 14:35:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] mm/gup: Introduce memfd_pin_user_pages() for
 pinning memfd pages (v6)
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20231205053509.2342169-1-vivek.kasireddy@intel.com>
 <20231205053509.2342169-4-vivek.kasireddy@intel.com>
 <5ffe2ea3-83da-4b5f-adc8-af9cd9a57cd2@redhat.com>
 <IA0PR11MB718520192D5885CFCCEE320FF88BA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <b8b82134-36b5-41a2-b0f8-1fb81d65a679@redhat.com>
 <20231207130532.GH2692119@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20231207130532.GH2692119@nvidia.com>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 "Chang, Junxiao" <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07.12.23 14:05, Jason Gunthorpe wrote:
> On Thu, Dec 07, 2023 at 10:44:14AM +0100, David Hildenbrand wrote:
> 
>>>> If you always want to return folios, then better name it
>>>> "memfd_pin_user_folios" (or just "memfd_pin_folios") and pass in a range
>>>> (instead of a nr_pages parameter), and somehow indicate to the caller
>>>> how many folio were in that range, and if that range was fully covered.
>>> I think it makes sense to return folios from this interface; and considering my
>>> use-case, I'd like have this API return an error if it cannot pin (or allocate)
>>> the exact number of folios the caller requested.
>>
>> Okay, then better use folios.
>>
>> Assuming a caller puts in "start = X" and gets some large folio back. How is
>> the caller supposed to know at which offset to look into that folio (IOW<
>> which subpage)? For "pages" it was obvious (you get the actual subpages),
>> but as soon as we return a large folio, some information is missing for the
>> caller.
>>
>> How can the caller figure that out?
> 
> This can only work if the memfd is required to only have full folios
> at aligned locations. Under that restriction computing the first folio
> offset is easy enough:
> 
>    folio offset = (start % folio size)
> 
> But is that true for the memfds here?

I assume folios are always naturally aligned, like:

[ 2m ][ 2m ][1m][1m][ 2m ]
^f0   ^f1   ^f2 ^f3 ^f4

If you query the range "3m -> 7m", you get back f1,f2,f3,f4 and have to 
start in the middle of the first folio with offset 1m. From there, it is
indeed simply continuing with the full folio size -- until the last 
folio, where you want to only process 1m.

folio offset = (1m % 2m)

would be correct in that case.

-- 
Cheers,

David / dhildenb

