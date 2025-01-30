Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33ACBA22B0E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 10:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90ACF10E920;
	Thu, 30 Jan 2025 09:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eecCXv5H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9EB910E920
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 09:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738231137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=FUEZfcfVLbYRN/NAsi1VmnFF+mk13nz+2s9oetN07Fc=;
 b=eecCXv5HGjk0GpXu9iQ6yLS/i+dFBDMp1hQFaUBz8GlQI+SCWtgaDe7SQriWda03qaKGq0
 7/mIeUuX+8Li299QhZZ0pbFz/Q7+m5fv6HJs101Nt6Wq+4HGnebidWgJR+o3WlfTgWvfjG
 lvHcO3BGnpbuuroHh8+9LKZbe1ZWK4w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-533-50pNRi8YNEi4_SgSP8RBUA-1; Thu, 30 Jan 2025 04:58:55 -0500
X-MC-Unique: 50pNRi8YNEi4_SgSP8RBUA-1
X-Mimecast-MFC-AGG-ID: 50pNRi8YNEi4_SgSP8RBUA
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4361eb83f46so3922005e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 01:58:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738231134; x=1738835934;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FUEZfcfVLbYRN/NAsi1VmnFF+mk13nz+2s9oetN07Fc=;
 b=voATLRyojpCZyBBzbeU0jKzDYMU01YM5Rg3mcZ+llgnVOr5jo1l9BAcgtf3HPyRg0s
 deJH66nuE+xwIY6lE3/ySF6aO30AZcsPibsf3+5qW+Znfk1qKbiMZqRXyJCaACVoxFfY
 fmFWMA9/AAXz0PQlvrFQ6aH9J3JzejZ7E3uSBMNrMLlLssUOuD3zGGLqymkAlCdridf6
 3ZVaAefTRSzMUCsHgVv08LtB8xv5tF8DhBCz+sMMMT2h8aZlH6JszTBOfDl10eXTc0xC
 qltPLmqNnU/5GZ2RF0ouQwXCU9vvjNBeYsmpWEKd8IIt9RhKB67auxRjw8V8cH9Ghg1D
 lBLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOen2OxGcFXpm3PziGUbbtq267cVibZRb0i6qs6waonmZo0AUYm95MktMaCG4G8qnCUy64t2A3r0M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7LQPhYkadBBOyNs7Hart01gRh8083cOf1IJJ+YwyO86L0Hbrl
 Enrv/Upa7uzVPywFZnl6v7YZcCDPkVOEH2fhNkMyenK5QWPI6kNFuBukq2EsGLVAiN4Z9DnptYx
 e3zNY07pRZ5hv3c+FMjdorEB5xL4ILPZ8YNhWJPSMohIqxn/kaBswKi3gxCAcs2x6JA==
X-Gm-Gg: ASbGncsvqjz9cigoraQLGCO3oRxFw/oML0cr0q34ZMb0Sqhlkj2Ci8S9xzG2suRoB4o
 QajhANydtcRO9s6/xkcIDhjENCRjDVQOGJL9I2ZPMmzBb9ED7JAoyVwwlh3Ez30wgXjhth/DgAK
 9jzSxrfgCkU2tleo7iDcm0c3EENgvXJVfyrJ4sD261upeYRD/Zmq6lU89rwoNg+6aNbJXctBroD
 Wy2nWsZQEYiH6qlefDOsOAOOAOa6EW4zWC28sU8eDQQdmr/oYWYTr8w/FGRMEmYANj3WLn0tV4E
 crhZMUQhIT88JLh+uJHZ54T3vsq6s9A6fYf6R87NCFEn
X-Received: by 2002:a05:600c:4f83:b0:436:713b:cb31 with SMTP id
 5b1f17b1804b1-438dc3a904cmr53453055e9.3.1738231134313; 
 Thu, 30 Jan 2025 01:58:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqgIQqKr43IrI1fX0tpLwZlRgUsdNhX+UslE5goA732BQskQeY8sZku5RbN2jwnY4mL7r0Gw==
X-Received: by 2002:a05:600c:4f83:b0:436:713b:cb31 with SMTP id
 5b1f17b1804b1-438dc3a904cmr53452735e9.3.1738231133913; 
 Thu, 30 Jan 2025 01:58:53 -0800 (PST)
Received: from ?IPV6:2a01:599:904:96e0:a245:aa9f:6c57:eb41?
 ([2a01:599:904:96e0:a245:aa9f:6c57:eb41])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c0ec2f4sm1517326f8f.11.2025.01.30.01.58.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 01:58:53 -0800 (PST)
Message-ID: <2670f65f-e973-483e-aed6-526d00125ad7@redhat.com>
Date: Thu, 30 Jan 2025 10:58:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/12] mm/memory: detect writability in
 restore_exclusive_pte() through can_change_pte_writable()
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
 <20250129115411.2077152-6-david@redhat.com>
 <Z5tLmYOQaZrdWQHN@phenom.ffwll.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z5tLmYOQaZrdWQHN@phenom.ffwll.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LVB9J9ylO5VZeg5_fEv4Q0ghgzUsJ2cQWECeLW4TX8U_1738231134
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

On 30.01.25 10:51, Simona Vetter wrote:
> On Wed, Jan 29, 2025 at 12:54:03PM +0100, David Hildenbrand wrote:
>> Let's do it just like mprotect write-upgrade or during NUMA-hinting
>> faults on PROT_NONE PTEs: detect if the PTE can be writable by using
>> can_change_pte_writable().
>>
>> Set the PTE only dirty if the folio is dirty: we might not
>> necessarily have a write access, and setting the PTE writable doesn't
>> require setting the PTE dirty.
> 
> Not sure whether there's much difference in practice, since a device
> exclusive access means a write, so the folio better be dirty (unless we
> aborted halfway through). But then I couldn't find the code in nouveau to
> do that, so now I'm confused.

That confused me as well. Requiring the PTE to be writable does not 
imply that it is dirty.

So something must either set the PTE or the folio dirty.

( In practice, most anonymous folios are dirty most of the time ... )

If we assume that "device-exclusive entries" are always dirty, then it 
doesn't make sense to set the folio dirty when creating device-exclusive 
entries. We'd always have to set the PTE dirty when restoring the 
exclusive pte.

-- 
Cheers,

David / dhildenb

