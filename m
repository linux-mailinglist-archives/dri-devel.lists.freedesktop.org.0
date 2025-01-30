Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FFDA22C2A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 12:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422B810E93A;
	Thu, 30 Jan 2025 11:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bJr3M7nH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC3310E939
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 11:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738235327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hRyAgd3cBvQHsVuEfrhD/VealxKoGbpl8JEiOYT4zok=;
 b=bJr3M7nH9opKHZI/HI52rkkAAy/CuwH6po+BBewvAVmTHCnqA8tw/XA1jPAanbxNegxdXJ
 yOXeaSbIkyC55wgrgYc286qECtd/eGBX0f2nZCD7cPDnSMPNIhaTGLMSf5ddssAjDS1E2p
 WusX4COqWde1nVlbE3ADFYGF4opd7r0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-xHjPLlj8MhqluAezeu5-MA-1; Thu, 30 Jan 2025 06:08:46 -0500
X-MC-Unique: xHjPLlj8MhqluAezeu5-MA-1
X-Mimecast-MFC-AGG-ID: xHjPLlj8MhqluAezeu5-MA
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3862f3ccf4fso277451f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 03:08:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738235325; x=1738840125;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hRyAgd3cBvQHsVuEfrhD/VealxKoGbpl8JEiOYT4zok=;
 b=NAekqp46joRTFPuE0weUBKI2mVPiB68YqSkeoTTVwftEw069xS/GxpJ8mFz2JvChxz
 0uNKQheP7OKZCwnNAyc0MT4R4zcIhGjelrHax0SBWPOQfovKhKW+Bf2OkX2y/YCUL773
 2fWBWDirxA2OOAqQIAQArXPjnahRfvTJT/oX4IIXOtGArt1OStgXhYpy/J+HzrPskn4a
 /unFG0hv303vomZzdDTTboyibd0qdny5z3MGzCa8VBgfVTvvC0eC0uiR/g+SH6IXBWdw
 67tGf5gkBu9M6FIP70QB4zwtZFgrPSvX2a6frVln/MC4zslJvHLe8cVaYK7FHbCzpnip
 R5Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkUG8jqFo6YfOt4jQzeedXAFXr3DlMrj+1vs3N876BUYKqRB9PqRv1REyZCJNJ+IypMMAq8+NAYRk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxziT+ZGx7AUbPVeRwxa/ySryrN9xK8EPKKDyxgguWWO5ZMVZ3C
 eRVNYYSLR2LhQlKtt/9RVbeGLxd7wP7aoIiMFptHj6z8HL/tYbEtxalEA3jvQWoc1vBK71PozBn
 d8oolWctEZfvMCDefHJMz7hKGr0w183lnlLBnxCsjEh2+xlZ0E1wh9po58zZ+ytBl8A==
X-Gm-Gg: ASbGncsx5mRS2E0U8aUO7F9V9CHrTjo1vB15vSgQdARzyKtVBPJ5j77zduDoGIN10zq
 stq/MEA8MI0dGAtO1yXI10HRjutz4Y115UQZeCG8HAZqu99W10Tk5QkXhsB1Aj/aorFD9MXRG1Q
 xLNppoiwRRx0gue07ZT/Q4VQWrjbqymTgrzalY5Jkv19c1fKbDHyDlG2DABS8BBrIdRKIQ3dPiF
 katpkguD8N0RN8yCBSE3ew+cPUym+hO9cY5YjMzQ+3p2kb1/U16L8Gq+Na8OhSwPe7ZtmBqnZbW
 10z4yQmJ7+G6p39jPBqgCRQ2cSz9fV9t6ynpW8x9UQIL1vR0lxLhMqjHue3G6AyTeNojkaYLQp0
 Qn3Uorcx+Q0SdbWrqXlqLk/HbnmTVwIo=
X-Received: by 2002:a5d:6d86:0:b0:38b:ef22:d8c3 with SMTP id
 ffacd0b85a97d-38c5209395cmr7569849f8f.35.1738235325429; 
 Thu, 30 Jan 2025 03:08:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8Jaj7pR0+ZuRLv9i3VWlgl8F3HqPDaZn5mScaXDv//sxwlV18Dtu62XjbQ4yrxQNHvUAKBA==
X-Received: by 2002:a5d:6d86:0:b0:38b:ef22:d8c3 with SMTP id
 ffacd0b85a97d-38c5209395cmr7569801f8f.35.1738235325088; 
 Thu, 30 Jan 2025 03:08:45 -0800 (PST)
Received: from ?IPV6:2003:cb:c713:3b00:16ce:8f1c:dd50:90fb?
 (p200300cbc7133b0016ce8f1cdd5090fb.dip0.t-ipconnect.de.
 [2003:cb:c713:3b00:16ce:8f1c:dd50:90fb])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b4e99sm1645539f8f.74.2025.01.30.03.08.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 03:08:44 -0800 (PST)
Message-ID: <59feb709-dadc-4d19-857e-49320cca3d98@redhat.com>
Date: Thu, 30 Jan 2025 12:08:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/12] mm/rmap: handle device-exclusive entries
 correctly in try_to_unmap_one()
To: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
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
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-9-david@redhat.com>
 <Z5tQL60SNNGCkfQR@phenom.ffwll.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z5tQL60SNNGCkfQR@phenom.ffwll.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9SbR5tancTd2jSeuwo2F6Wd-AZzotbCvnw8lY9gF9eo_1738235325
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

On 30.01.25 11:10, Simona Vetter wrote:
> On Wed, Jan 29, 2025 at 12:54:06PM +0100, David Hildenbrand wrote:
>> Ever since commit b756a3b5e7ea ("mm: device exclusive memory access")
>> we can return with a device-exclusive entry from page_vma_mapped_walk().
>>
>> try_to_unmap_one() is not prepared for that, so teach it about these
>> non-present nonswap PTEs.
>>
>> Before that, could we also have triggered this case with device-private
>> entries? Unlikely.
> 
> Just quick comment on this, I'm still pondering all the other aspects.
> 
> device-private memory is entirely owned by the driver, the core mm isn't
> supposed to touch these beyond migrating it back to system memory in
> do_swap_page. Plus using rmap when the driver asks for invalidating
> mappings as needed.
> 
> So no lru, thp, migration or anything initiated by core mm should ever
> happen on these device private pages. If it does, it'd be a bug.

I was not 100% sure about HWPoison handling, that's why I added that 
comment. In other regards I agree: reclaim etc. does not apply.

-- 
Cheers,

David / dhildenb

