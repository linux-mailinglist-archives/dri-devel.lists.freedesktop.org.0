Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE720A59108
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 11:23:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380F110E280;
	Mon, 10 Mar 2025 10:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PGePVzJG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B8E10E3ED
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 10:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741602230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/12pVfGrHfAC9KyGDgoRmy2bzHmGQuVzoa458sMOedg=;
 b=PGePVzJGA9AFXWShebGXObQLbomqOe73qMYQlo7e21WiszY5nnn/kOTFVQx4NUYmZjiE7f
 725LZV4IseSIMGgmWQSYep3zgZav6i9gEF2xUkUI6mKsWh8nuDGTOtOBK3E+ys000pM2cp
 oUZl8z4nUc+qME9N0nxU3dD/JMpo1Xw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-8PwMtKg0MFu1ZRxdnS8d6A-1; Mon, 10 Mar 2025 06:23:49 -0400
X-MC-Unique: 8PwMtKg0MFu1ZRxdnS8d6A-1
X-Mimecast-MFC-AGG-ID: 8PwMtKg0MFu1ZRxdnS8d6A_1741602228
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-39141ffa913so767045f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 03:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741602228; x=1742207028;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/12pVfGrHfAC9KyGDgoRmy2bzHmGQuVzoa458sMOedg=;
 b=s8jlyRp5UzslUMQRpBN9EXY7YLb4k7DqtjzpwbZxeUULeQCPZjgn3VB6xWbi3obmtK
 ND3seM5prChwqOIcEHQdhkKNC/Kuif374S/fhwAx8AUVmiZSPgl8TAE2nEaD+KgZQigr
 R3zMMesZOOcrqZnMWIyPJOYPP4UbdjaNPV5nZLnjfldMI74BE1PjHFYAuBK4pMYqPEzV
 9nreUnUNPrlT59ATnR43yumww6V2QaY58a6pegH5oyDTYSmrMMEt8z5kGRINg0vtiCse
 IL8cz8CVVSYQ0CvEjLmEwouIfJ8xWUKMpd+4hhyoSpZKfdXCImvRNRmhr0PHGGTMd0eZ
 xfzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGlZBI1qjqrZa8nB64TtKnHj7mgyVoizP2g3andIIL6TR4ykG8azcGfr47aCcfhdPmF49oh5Mov+s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXAXQBDxW8JMgXhQtSBUiAE3OmB2nippOjJNDobk+SurilZ8uL
 Dnautcgg4VRAkIZRn9dH1CTcwzYhJjz4zwkYRjiVzEUTamtB+8M2Fi00/mrZ7hsabPx0j5CRU1+
 E/gk/+h0Eq1jptfep+/knpAytgSMlbTrBN5H7rbT7VvyRhrtRJ0Dg87wJhMzZ+eNXNQ==
X-Gm-Gg: ASbGncvUuxpnYtgg21PiH63BVqv3AzO52uu46962T4jZvTbfFEDGmshSWZSUd029NR4
 2Ici1z4KHQM5bRrknXbG7uiKjtqEdCvfVsd/rA6wwQbhFgeq67fg9DuFOoUDF6yBmSOCIVuXVfx
 OTLv9yMdMwnposTLhc8sB00nHsMfPn/+kZ4pboQJkqeH7krc5ATgS3zFBy6cvThkkMHqUqHKHjG
 2WR1dNNzt02HvmJu4ZhAuGmTw4ud5FHgcPeeXFFZb2zwhROoVMgPqSJV185ZX1C5OqKWr0XEmJs
 CmvMbNXDert8AR4COoyJxx0rVNwkPN6PSgsFfORqKLQSxgc8O8mPUFo=
X-Received: by 2002:adf:e007:0:b0:390:f4f9:8396 with SMTP id
 ffacd0b85a97d-39132d7ff8bmr4952026f8f.28.1741602227912; 
 Mon, 10 Mar 2025 03:23:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTlUKdfWg/n6nLhAEk75JdM460Sx5llLCeap2DgVS7ohzTSeVMGhEWCd6FidoOs3NkTtglMA==
X-Received: by 2002:adf:e007:0:b0:390:f4f9:8396 with SMTP id
 ffacd0b85a97d-39132d7ff8bmr4951998f8f.28.1741602227497; 
 Mon, 10 Mar 2025 03:23:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdff72sm14634492f8f.36.2025.03.10.03.23.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 03:23:46 -0700 (PDT)
Message-ID: <de5b9722-905c-49e6-87dc-3fcdeb07fb09@redhat.com>
Date: Mon, 10 Mar 2025 11:23:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-next 1/2] vmalloc: Add atomic_vmap
To: Ryosuke Yasuoka <ryasuoka@redhat.com>
Cc: Matthew Wilcox <willy@infradead.org>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 akpm@linux-foundation.org, urezki@gmail.com, hch@infradead.org,
 dmitry.osipenko@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 linux-mm@kvack.org
References: <20250305152555.318159-1-ryasuoka@redhat.com>
 <20250305152555.318159-2-ryasuoka@redhat.com>
 <Z8kp9Z9VgTpQmV9d@casper.infradead.org>
 <3bfd4238-6954-41a3-a5a3-8515a3ac9dce@redhat.com>
 <Z8nEqDQhjU-Ly8Js@phenom.ffwll.local>
 <51c11147-4927-4ebc-9737-fd1eebe4e0bd@redhat.com>
 <CAHpthZqn7ZZW1ekFQe7nN0+xfsNvMQMKhjMNcB3EyQ18yfQhiA@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CAHpthZqn7ZZW1ekFQe7nN0+xfsNvMQMKhjMNcB3EyQ18yfQhiA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5hyUXKqzlADIDZiOdmXpgm86i8HsRhuAF0etpo_uUqc_1741602228
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 09/03/2025 09:07, Ryosuke Yasuoka wrote:
> On Fri, Mar 7, 2025 at 4:55 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>
>> On 06/03/2025 16:52, Simona Vetter wrote:
>>> On Thu, Mar 06, 2025 at 02:24:51PM +0100, Jocelyn Falempe wrote:
>>>> On 06/03/2025 05:52, Matthew Wilcox wrote:
>>>>> On Thu, Mar 06, 2025 at 12:25:53AM +0900, Ryosuke Yasuoka wrote:
>>>>>> Some drivers can use vmap in drm_panic, however, vmap is sleepable and
>>>>>> takes locks. Since drm_panic will vmap in panic handler, atomic_vmap
>>>>>> requests pages with GFP_ATOMIC and maps KVA without locks and sleep.
>>>>>
>>>>> In addition to the implicit GFP_KERNEL allocations Vlad mentioned, how
>>>>> is this supposed to work?
>>>>>
>>>>>> +  vn = addr_to_node(va->va_start);
>>>>>> +
>>>>>> +  insert_vmap_area(va, &vn->busy.root, &vn->busy.head);
>>>>>
>>>>> If someone else is holding the vn->busy.lock because they're modifying the
>>>>> busy tree, you'll corrupt the tree.  You can't just say "I can't take a
>>>>> lock here, so I won't bother".  You need to figure out how to do something
>>>>> safe without taking the lock.  For example, you could preallocate the
>>>>> page tables and reserve a vmap area when the driver loads that would
>>>>> then be usable for the panic situation.  I don't know that we have APIs
>>>>> to let you do that today, but it's something that could be added.
>>>>>
>>>> Regarding the lock, it should be possible to use the trylock() variant, and
>>>> fail if the lock is already taken. (In the panic handler, only 1 CPU remain
>>>> active, so it's unlikely the lock would be released anyway).
>>>>
>>>> If we need to pre-allocate the page table and reserve the vmap area, maybe
>>>> it would be easier to just always vmap() the primary framebuffer, so it can
>>>> be used in the panic handler?
>>>
>>> Yeah I really don't like the idea of creating some really brittle one-off
>>> core mm code just so we don't have to vmap a buffer unconditionally. I
>>> think even better would be if drm_panic can cope with non-linear buffers,
>>> it's entirely fine if the drawing function absolutely crawls and sets each
>>> individual byte ...
>>
>> It already supports some non-linear buffer, like Nvidia block-linear:
>> https://elixir.bootlin.com/linux/v6.13.5/source/drivers/gpu/drm/nouveau/dispnv50/wndw.c#L606
>>
>> And I've also sent some patches to support Intel's 4-tile and Y-tile format:
>> https://patchwork.freedesktop.org/patch/637200/?series=141936&rev=5
>> https://patchwork.freedesktop.org/patch/637202/?series=141936&rev=5
>>
>> Hopefully Color Compression can be disabled on intel's GPU, otherwise
>> that would be a bit harder to implement than tiling.
>>
>>>
>>> The only thing you're allowed to do in panic is try_lock on a raw spinlock
>>> (plus some really scare lockless tricks), imposing that on core mm sounds
>>> like a non-starter to me.
>>>
>>> Cheers, Sima
>>
> 
> Thank you all for your comments.
> I understand adding atomic_vmap is not possible as vmalloc is not compatible
> with GFP_ATOMIC. I'll re-implement this by pre-allocating the page table and
> reserve the vmap area while the kernel is alive. It'll might be
> allocated in driver
> codes so maybe I don't need to add any features in core mm code.

Maybe another way to do that, would be to atomically kmap only one page 
at a time. And when drawing the panic screen, make sure that for each 
pixel the right page is mapped.
Would kmap_local_page() fit for this purpose?

Best regards,

-- 

Jocelyn


> 
> Best regards,
> Ryosuke
> 

