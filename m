Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B9BA23CBB
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 12:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BD810EA77;
	Fri, 31 Jan 2025 11:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="emLzihv9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C2910EA79
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 11:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738321611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ptBTE/j9Ief471JDveY+5Ixgr7ekpcVIWvNqXG+KHaU=;
 b=emLzihv9b2TKwjpha2vkhLpdV3vx6IGbXxbhbBt2uQcmRQyqV1TGtsMlJp9Ck2Mf1eqLtm
 hA4XMMKDNojiCBfkVdV+4ipPm5ZuQT7wZoxRVsDwAdhIVFQdL9WYb+Uky0mx8K1hH4wrd0
 1+rF5FV2ExuW0nmcFUi9SYFqYB52W1M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-1ktlF7LtNu67tWKEaegE-A-1; Fri, 31 Jan 2025 06:06:47 -0500
X-MC-Unique: 1ktlF7LtNu67tWKEaegE-A-1
X-Mimecast-MFC-AGG-ID: 1ktlF7LtNu67tWKEaegE-A
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4388eee7073so13218975e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 03:06:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738321606; x=1738926406;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ptBTE/j9Ief471JDveY+5Ixgr7ekpcVIWvNqXG+KHaU=;
 b=rrCXkfFVm4z+0ihb1+l0K7o39IFvCAl2XT3DfSsOg5dE/9wEUl5sV006HzPYhX2tqr
 YtCY8oULzz1Jw7QfJatwKVSPnoUW0KIcXPsA5atfQAZT6rbpFJmxh1jAz8BSY6MWL83D
 GMpEnWBkDi8s516KzNj2TLW5IPXbgEQ9W91yRd97FntjgHhUf4wrgaqYCb/B3paPkLAR
 MmvcFGY9w/yAaVflQNNt7sXi8ESrApJzFmZsUhU166xLhLTRYT0i4950+vad4Je71Ke0
 58vBY50M18li/wcDQ7Flax1ePEkcHJmUZWRw2CR2ndwk1AKeoHZ2Kd6s8EsRK0W1LO0I
 YyDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmAGn+dM9kr7RiCSPYgRbDVoptR7rH9OXyMUot7SfwKusdHb8HyqBZ9TjjrrJHbfVj5pj97E5kFDM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqCxTt1uOp9/IryKdXNgDP4lBXJojgUQjj2sPGFjBtXZSka+tv
 u7IeOyst4JaCB2P9PuyT6YTLdmyWIdO9Ryd44yiHKroOQ822xO9euy81GO7sCS1yZMfwcmzBSIO
 DzuZ1i1/oOUUgAopwWsGUVnNUYbgfEaojcdrEsYfTYsUM0AoTvd1g6ttSeB1LdVPtbQ==
X-Gm-Gg: ASbGncv34eqITrDXHRhCDPHc/V/aIs7UBIyg97leainmJZN6poq2TzXV5G4C9/iE0mG
 c9mLlUw7IlzJyZGO08CuCS7Mly2ddgaoNFEQB/EgGDEz3wXgq9CO80ZoHai7aHfSR4is1MoDetM
 XITKw7rpe57HM8TLLQ+TAMd321RI3STgYxnwWTHrxf5znEwef5r60sMN693Wzmpk2eCecxzeUsp
 yUdJEDewx8MTczXhKhvW+Av4YwE4f7b6USw6T7TIB5s3r2t5DD46eH4G+PEeydvoLu4mnHe7hvu
 8nt+YM7flXrlh6wOjL+gfesBlvFCK81E3ltK1lyB/Ooa25yUsfq0EF3FZqW9FADqlbSoFTef+0B
 tjnSNe5T92+ETF5BXTvgGGMtvuQj+rQ/2
X-Received: by 2002:a05:600c:1c9b:b0:434:fc5d:179c with SMTP id
 5b1f17b1804b1-438e1705f38mr61309865e9.13.1738321606661; 
 Fri, 31 Jan 2025 03:06:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvI25JKGadHoBsKNpaNligj01qj4xJdVU/Z3aCpJkv3iDtFRRerBqry12mhnck6BMQkG+OlA==
X-Received: by 2002:a05:600c:1c9b:b0:434:fc5d:179c with SMTP id
 5b1f17b1804b1-438e1705f38mr61309445e9.13.1738321606312; 
 Fri, 31 Jan 2025 03:06:46 -0800 (PST)
Received: from ?IPV6:2003:cb:c70a:1c00:b8d4:bc62:e7ed:ec0e?
 (p200300cbc70a1c00b8d4bc62e7edec0e.dip0.t-ipconnect.de.
 [2003:cb:c70a:1c00:b8d4:bc62:e7ed:ec0e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438d7b5eaecsm59983415e9.3.2025.01.31.03.06.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2025 03:06:44 -0800 (PST)
Message-ID: <cab05891-cfce-4d64-a05f-b90038d5ee9f@redhat.com>
Date: Fri, 31 Jan 2025 12:06:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/12] mm/page_vma_mapped: device-private entries are
 not migration entries
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-8-david@redhat.com>
 <baraw2czilsofpedok3jtxxshfaxjrmef6u42pitibtcst6mel@scoukpiwnvvc>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <baraw2czilsofpedok3jtxxshfaxjrmef6u42pitibtcst6mel@scoukpiwnvvc>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nWEoy0M_3ztL9UFQHt1TJToChUdeG15Y_9BA-lB1miA_1738321607
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

On 31.01.25 00:36, Alistair Popple wrote:
> On Wed, Jan 29, 2025 at 12:54:05PM +0100, David Hildenbrand wrote:
>> It's unclear why they would be considered migration entries; they are
>> not.
> 
> Yeah, I agree that doesn't seem right. I suspect I was initially modelling
> device exclusive entries similar to migration entries but obviously went too
> far. So thanks for fixing:
> 
> Reviewed-by: Alistair Popple <apopple@nvidia.com>

Thanks ... fixing all the wrong use of "device-private" in the 
subject+description ... not sure what my mind was doing there.

It's all about "device-exclusive" of course.

-- 
Cheers,

David / dhildenb

