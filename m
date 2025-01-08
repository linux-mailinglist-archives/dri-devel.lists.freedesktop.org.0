Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65173A066FE
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 22:12:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABDC10E34D;
	Wed,  8 Jan 2025 21:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OmwYzxAL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03AA10E34D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 21:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736370762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7IxiThQS6Cse7A3b/CM1fKv8ccuu3lHxvYoroemHzVY=;
 b=OmwYzxAL+CpLn359hjWKJn7YAmX33gkhw/pVX6R1pFVFmfAUnnh9VaNHJFu9ewA/SKt4IS
 2zp1cJ2i+DHdp6AZccghxBX1LRtqPKvS49aKuiCOb7pNuhRLPLjYOTxyn6Qz9BNmwRQfOl
 z9gQrcVDytpuVDUkjHwxo90ZFnXau54=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-EsMv77-tO2SEOTy6otM-YQ-1; Wed, 08 Jan 2025 16:12:41 -0500
X-MC-Unique: EsMv77-tO2SEOTy6otM-YQ-1
X-Mimecast-MFC-AGG-ID: EsMv77-tO2SEOTy6otM-YQ
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-436248d1240so1178615e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 13:12:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736370760; x=1736975560;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7IxiThQS6Cse7A3b/CM1fKv8ccuu3lHxvYoroemHzVY=;
 b=AJgS3Chhuo8Ya4lI4DN3gPEYCyALmqTnXFT5P2u6HlFTJxdk5Qi5gQh0QIWguclHLf
 4vhlw/VKx07r+3pyByxjMEBuF9eRgnC0Q33sZml5QwVETnHK+G8zeqHMq6hPy8DtrLAi
 PEnQWXmtg/+uHXv/u1pCQNEaxHyo8K+UeQOobv3kSqdp6jS8YWyOUgyCJbdbVJMoIN2S
 9TW9FOspKx6fJi6Qc93verkG3GaC+bBNYgfzwyeLPi8iXY8Nf2FWu10mvOhWhgC/0WMy
 IEABvbCSXYXtw58qFi5kU8A6Q2YSRJhyXQ2y6PGKr+TaFAKCipXLy8ineIhwrmwkKtlr
 1EKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo+2WA892H8yBv5/TtiIWaU6+/18l4fxg3mEiGhsd0y74A/3885Ta+ODgzC0jMbUnyUvWFEQ9d9fE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKkZXI9uVDpO7tFz4y4CA7SQQcV6T4tUytXRZVk4+0nGOsQXV1
 56QyfH77xj+uNbl31M3Fgh3rNK7cjmkGKZGNrsJaBxdK4izbG+rH2ZYqSkYPCxYCzp87cLJjU+f
 jiCABJNlLzwYBuqyw25Qb59TGUMrAj0vcKwBCkxRto60HQvMmVN/a0Qcgwyz9ylXgFw==
X-Gm-Gg: ASbGncvzkw3EnkP1FA3HKkTtK+PjqdQQWGmisFZjy8n6nlnxlssPcGOC0xl7J2PIeeI
 DvTntBahJE5g5XJ1RmZaZXtEImbffI7W+bN16nZ++ZehW0Nbt2EIzsc6ByhNe1+nhjTebGwLbfp
 fh9CGxa5yiFUvB9rXtgALtLnmXQf5VYKWwvAYuuYcrFki/Jf8RIKszJXR7FOV4/URt02F8RF4OL
 bUwMz8chdQSUtrzxNxkfhDG5CmtXNIQwTrBxtKqyLQcj/u0hMA435IogV2ueYd/c9UfThfQl8CP
 lOnm9sH72PnTxLD4y3QT8y56v3lr/KzY4UIQdsRScB3BursBbHp9kn5R0BLlke+RGWq4AoMaftc
 Ritq/GA==
X-Received: by 2002:a05:600c:a01:b0:434:9c1b:b36a with SMTP id
 5b1f17b1804b1-436e269715amr40429635e9.13.1736370760067; 
 Wed, 08 Jan 2025 13:12:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEG0PXp4kXypKS88K2vg7pB4Jl1C7o4xE/MHkOHIy5/fPaztXmKRfd8MdWjYZXK3UFU0t4BVA==
X-Received: by 2002:a05:600c:a01:b0:434:9c1b:b36a with SMTP id
 5b1f17b1804b1-436e269715amr40429225e9.13.1736370759073; 
 Wed, 08 Jan 2025 13:12:39 -0800 (PST)
Received: from ?IPV6:2003:cb:c70d:3a00:d73c:6a8:ca9f:1df7?
 (p200300cbc70d3a00d73c06a8ca9f1df7.dip0.t-ipconnect.de.
 [2003:cb:c70d:3a00:d73c:6a8:ca9f:1df7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a28f17315sm48324196f8f.108.2025.01.08.13.12.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2025 13:12:37 -0800 (PST)
Message-ID: <34ad8349-c4c3-4370-a662-324fa91b32b1@redhat.com>
Date: Wed, 8 Jan 2025 22:12:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] fb_defio: do not use deprecated page->mapping,
 index fields
To: Matthew Wilcox <willy@infradead.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jaya Kumar <jayalk@intworks.biz>,
 Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <cover.1736352361.git.lorenzo.stoakes@oracle.com>
 <1e452b5b65f15a9a5d0c2ed3f5f812fdd1367603.1736352361.git.lorenzo.stoakes@oracle.com>
 <Z362xoQMxQRxYUlJ@casper.infradead.org>
 <b7465ad8-50ec-490b-a62a-e535e0a4691c@redhat.com>
 <Z37mE7NdQu-ZgBES@casper.infradead.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z37mE7NdQu-ZgBES@casper.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5iUg00ZZrH9BqglZDjzovMRFEZk2WGzYwbAoZ77juG4_1736370760
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

On 08.01.25 21:54, Matthew Wilcox wrote:
> On Wed, Jan 08, 2025 at 09:14:53PM +0100, David Hildenbrand wrote:
>> On 08.01.25 18:32, Matthew Wilcox wrote:
>>> On Wed, Jan 08, 2025 at 04:18:42PM +0000, Lorenzo Stoakes wrote:
>>>> @@ -280,7 +269,10 @@ static void fb_deferred_io_work(struct work_struct *work)
>>>>    		struct folio *folio = page_folio(pageref->page);
>>>>    		folio_lock(folio);
>>>> -		folio_mkclean(folio);
>>>> +		rmap_wrprotect_file_page(fbdefio->mapping,
>>>> +					 pageref->offset >> PAGE_SHIFT,
>>>> +					 compound_nr(pageref->page),
>>>> +					 page_to_pfn(pageref->page));
>>>>    		folio_unlock(folio);
>>>
>>> Why do we need to lock the folio?  (since this isn't necessarily a
>>> folio)
>>
>> Can you clarify the "since this isn't necessarily a folio" part ? Do you
>> mean in the future, when we split "struct page" and "struct folio"?
> 
> Right.  I need to finish the email that explains where I think we're
> going in 2025 ...
> 
>> Doing an rmap walk on something that won't be a folio is ... sounds odd
>> (->wrong :) )
> 
> Not necessarily!  We already do that (since 2022) for DAX (see
> 6a8e0596f004).  rmap lets you find every place that a given range
> of a file is mapped into user address spaces; but that file might be a
> device file, and so it's not just pagecache but also (in this case)
> fb memory, and whatever else device drivers decide to mmap.

Yes, that part I remember.

I thought we would be passing in a page into rmap_wrprotect_file_page(), 
and was wondering what we would do to "struct page" that won't be a 
folio in there.

Probably, because the "_page" in rmap_wrprotect_file_page() is misleading :)

... should it be "file_range" ? (but we also pass the pfn ... )

-- 
Cheers,

David / dhildenb

