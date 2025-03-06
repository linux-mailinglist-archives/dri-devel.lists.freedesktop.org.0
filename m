Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AEFA54C14
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 14:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C2310E99E;
	Thu,  6 Mar 2025 13:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Vw2pCUUh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD7610E99E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 13:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741267507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AMe2L544kp/d38WLjn3xMcZvhSWCOUekm7mNyssXwXc=;
 b=Vw2pCUUhjY8aXJ6JGkj6HVUbkga7b7M6e3g8LRAh4To14aoxmGjO9q1IjBNVNtPylaW1Ub
 GMo8VESZL8cYobIWOqyrNfYDceK1A6HX4lHw1UHrOvB7zH6i/9RXoX02lvRwgumv8UMJO7
 t9oEx1Q9+px1VkbIss2lg83fggLjel0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-ZihQ8_yfMnOfcoWZnO5EpA-1; Thu, 06 Mar 2025 08:24:56 -0500
X-MC-Unique: ZihQ8_yfMnOfcoWZnO5EpA-1
X-Mimecast-MFC-AGG-ID: ZihQ8_yfMnOfcoWZnO5EpA_1741267495
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-391079c9798so310633f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 05:24:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741267495; x=1741872295;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AMe2L544kp/d38WLjn3xMcZvhSWCOUekm7mNyssXwXc=;
 b=maZfMuImd7XI80JqkYdtf2qmohSNDdcQXP7YW1qGfDykOIM3JxZ4pTBhmzGQ7CGxdf
 k3CqSZqKuRWhKLQ6nc90rQNDlB0YM6wf5nvEQ2cO4vPDDF7OT3YRRZSMXESkjxTlHGYj
 hQzd0TBwvEWjFDfnPojdTA4Ggm4Y+9KmkULi1cUhIM6YzpnJGEYZv5+ZunG5pu6ijupW
 K91CTIOvYteVmx938d1yC094YDumcTekHr+iMRvdzM0ATHpBv62GV378oy1osTTUhRiM
 lwzatA1mYnQRl/BSQbc5VgJ853l+l+TCvK+z384HiEm4h+mlWltCjgrxSbNab+zsvCI7
 hymg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8rilkh9Mc5fkZMpBzxilfMzgrQv5q7YxohWjzZocZQ4j6r14kxAYNl9WVv1ZOGA3BKW/6Ql7MmfE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRlUUGOC8x5SzYG/wHwNrgLejFddCSqErjdDbnk9+nXMmPQhPN
 S1e0UQmGoviO9Nw4E4tbR3Ja6cxKLAf7gSd9VZH8KDVQr6ann025cSDNsTpO9On8Sti0Umt/cO6
 A4d43RULsaI6Klgzx43aU4r6rDhPbQ88Cr2Rf5oUCdiD3uXrCC+4CJ0udMzbgJsFUkw==
X-Gm-Gg: ASbGnctXw91TUT5LaKXP+zLqcoxieIbrH5dOGzHwJu0ztTgWEamvewVZjr/qjK0ACVF
 tyVcaRVcPe6jnedKHRlIXZm8GfGdrJpQMYos45dyrdNvykdmBguJs538pC82ksl3CuUxiEx+M3t
 BjnrElxf93qDNgnKurj05R5J+534XrlmaidRhkJAtj1tFdXioapcEs2rPcLN0A+PPqQFc7ZwRMM
 kbkLWoyOop65DwaVqhWPyK8AW4MZ5yfGzabySWlAu9nz+iaOGqEOGHsxf1bVxkmHFeFwz8Jralj
 UKJCVaAmUpWXo4rJnjOiCT5dCUpqS/4CKiZJdy6dYDRbo74H7KzFlNU=
X-Received: by 2002:a05:6000:42c7:b0:390:f9d0:5e4 with SMTP id
 ffacd0b85a97d-3911f741261mr5096854f8f.21.1741267494954; 
 Thu, 06 Mar 2025 05:24:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIwqvoLsZ7nWE/oVtc7eKMKzGDa6NvX7GYnOgsSJBfK4lxmD7NxGmoi2sk4zoXn8lH+Jx7Gg==
X-Received: by 2002:a05:6000:42c7:b0:390:f9d0:5e4 with SMTP id
 ffacd0b85a97d-3911f741261mr5096838f8f.21.1741267494530; 
 Thu, 06 Mar 2025 05:24:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfdfdsm2117782f8f.34.2025.03.06.05.24.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 05:24:53 -0800 (PST)
Message-ID: <3bfd4238-6954-41a3-a5a3-8515a3ac9dce@redhat.com>
Date: Thu, 6 Mar 2025 14:24:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-next 1/2] vmalloc: Add atomic_vmap
To: Matthew Wilcox <willy@infradead.org>, Ryosuke Yasuoka <ryasuoka@redhat.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, kraxel@redhat.com,
 gurchetansingh@chromium.org, olvaffe@gmail.com, akpm@linux-foundation.org,
 urezki@gmail.com, hch@infradead.org, dmitry.osipenko@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-mm@kvack.org
References: <20250305152555.318159-1-ryasuoka@redhat.com>
 <20250305152555.318159-2-ryasuoka@redhat.com>
 <Z8kp9Z9VgTpQmV9d@casper.infradead.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <Z8kp9Z9VgTpQmV9d@casper.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9DF1QtqnK0KXc8oPEA2HEiqzOH9nuYZDtMjZrXdHX8A_1741267495
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

On 06/03/2025 05:52, Matthew Wilcox wrote:
> On Thu, Mar 06, 2025 at 12:25:53AM +0900, Ryosuke Yasuoka wrote:
>> Some drivers can use vmap in drm_panic, however, vmap is sleepable and
>> takes locks. Since drm_panic will vmap in panic handler, atomic_vmap
>> requests pages with GFP_ATOMIC and maps KVA without locks and sleep.
> 
> In addition to the implicit GFP_KERNEL allocations Vlad mentioned, how
> is this supposed to work?
> 
>> +	vn = addr_to_node(va->va_start);
>> +
>> +	insert_vmap_area(va, &vn->busy.root, &vn->busy.head);
> 
> If someone else is holding the vn->busy.lock because they're modifying the
> busy tree, you'll corrupt the tree.  You can't just say "I can't take a
> lock here, so I won't bother".  You need to figure out how to do something
> safe without taking the lock.  For example, you could preallocate the
> page tables and reserve a vmap area when the driver loads that would
> then be usable for the panic situation.  I don't know that we have APIs
> to let you do that today, but it's something that could be added.
> 
Regarding the lock, it should be possible to use the trylock() variant, 
and fail if the lock is already taken. (In the panic handler, only 1 CPU 
remain active, so it's unlikely the lock would be released anyway).

If we need to pre-allocate the page table and reserve the vmap area, 
maybe it would be easier to just always vmap() the primary framebuffer, 
so it can be used in the panic handler?

Best regards,

-- 

Jocelyn

