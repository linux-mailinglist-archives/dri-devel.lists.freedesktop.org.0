Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D1784FB2E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 18:41:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FBC310EB69;
	Fri,  9 Feb 2024 17:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FeECEABP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E733610EB69
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 17:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707500502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q8cXBiboRfo0of98MkHU2Vfc0DFLaOgC0qAVl8Vrox4=;
 b=FeECEABPv2A+fr+1HTWrQs/j0nkA93Xqwg3SHXXu3FA28tbZ2uwbuC+48KstdKeoxqDxJq
 VYAqu2nbY7F3iI35HjQ2noV/cmrcQOvyttndjXY3o3FxuKuUX9MStzeAzDzmb5lnsLdlF6
 0LY7Z44IDr6wGGARbZpO1MW15XY9iJs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-AMYHkW00MsK4cxnQzu_wLA-1; Fri, 09 Feb 2024 12:41:37 -0500
X-MC-Unique: AMYHkW00MsK4cxnQzu_wLA-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a357c92f241so82055966b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Feb 2024 09:41:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707500496; x=1708105296;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q8cXBiboRfo0of98MkHU2Vfc0DFLaOgC0qAVl8Vrox4=;
 b=QRoIXmYF2bXWRVwZkay87gM1KOoVLDGHzvplr2Aa9XZaBYV0RfeyHxV5qzeR3nbD93
 3ZGgNxjbHbtVhJ/fWzrD3IrIXv54bHwPYGICuSgHn8MSt0UobA6xakoITGJ/YEimzhCa
 dPJAz2FAJSri4w80dXFXP1JVHSFPElcWTBpyBSfcOjyibmF14zruW5ndBJb5Zk8JIWxa
 KsTGQq2ci9bO1uzJsoX8uF05gpLrz1MFPb77ojEWUCmZ3lfunVWOtcSBZm5ihXYQ4whp
 dQK/6xruSx0HF+WtV1WSZUI3G8oaJqaYFug7p9POBMlpx1YlxQfgKRjiu/p7L+Eu4V5j
 u8dw==
X-Gm-Message-State: AOJu0YyrL2lz7mZELBjnLGRqZ+AdW+2VfsfDd51+xgeK0qW8gHyLrPUY
 r6GGaEyqZOTVRoTCGT9c7kRJwiD8pUjRXhyujua/iJV/lQ7NanNQYz0Re4yKvJ2fW2P9aNjW+7n
 zHpPk0ZbEGL/8dulc7R/bUziGWTT/xXNrt9xiWnw0Yxd7LSOWtXnV74KmwtgnrBzNTQ==
X-Received: by 2002:a17:906:4a59:b0:a3b:b021:57de with SMTP id
 a25-20020a1709064a5900b00a3bb02157demr1622771ejv.1.1707500496144; 
 Fri, 09 Feb 2024 09:41:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4BLqGxaw+J2KCDiFAKvA8Y2np5p5tVtIPTiuNc65jwhq42iS9D8ldpllWAeE6VMNQ5GCIeQ==
X-Received: by 2002:a17:906:4a59:b0:a3b:b021:57de with SMTP id
 a25-20020a1709064a5900b00a3bb02157demr1622762ejv.1.1707500495795; 
 Fri, 09 Feb 2024 09:41:35 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWQPiLVfXpkISblVZchHlkpfuHTMzVz5Xsu9LLNgEGAJ0rfP8aJjcltB7QY0Ceflkk7aqoIkFhP8R0hEOlB8nt3KlvUgIZ4KvNFOpifEDIKVCC/phGWbXoPOmwrg+N4EWBiZw==
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a1709062cd000b00a36c3e2e52dsm968511ejr.61.2024.02.09.09.41.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Feb 2024 09:41:35 -0800 (PST)
Message-ID: <a2174cc2-ea65-4bcf-a112-f60f26b7213c@redhat.com>
Date: Fri, 9 Feb 2024 18:41:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau: offload fence uevents work to workqueue
To: Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240129015053.1687418-1-airlied@gmail.com>
 <133266ac-7239-4233-a19d-cdc7563d401c@redhat.com>
 <CAPM=9tyc3zWRhm4xSnnHprU-v7prdZ2fkkLDEfjC_t_2wM-8Kg@mail.gmail.com>
 <3d967763-8f8f-4451-9927-33395e1b4d70@redhat.com>
 <ZcI8GScBEJ0SsuA5@phenom.ffwll.local>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <ZcI8GScBEJ0SsuA5@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/6/24 15:03, Daniel Vetter wrote:
> On Mon, Feb 05, 2024 at 11:00:04PM +0100, Danilo Krummrich wrote:
>> On 2/5/24 22:08, Dave Airlie wrote:
>>> On Tue, 6 Feb 2024 at 02:22, Danilo Krummrich <dakr@redhat.com> wrote:
>>>>
>>>> On 1/29/24 02:50, Dave Airlie wrote:
>>>>> From: Dave Airlie <airlied@redhat.com>
>>>>>
>>>>> This should break the deadlock between the fctx lock and the irq lock.
>>>>>
>>>>> This offloads the processing off the work from the irq into a workqueue.
>>>>>
>>>>> Signed-off-by: Dave Airlie <airlied@redhat.com>
>>>>
>>>> Nouveau's scheduler uses a dedicated wq, hence from this perspective it's
>>>> safe deferring fence signalling to the kernel global wq. However, I wonder
>>>> if we could create deadlocks by building dependency chains into other
>>>> drivers / kernel code that, by chance, makes use of the kernel global wq as
>>>> well.
>>>>
>>>> Admittedly, even if, it's gonna be extremely unlikely given that
>>>> WQ_MAX_ACTIVE == 512. But maybe it'd be safer to use a dedicated wq.
>>>>
>>>> Also, do we need to CC stable?
>>>
>>> I pushed this to Linus at the end of last week, since the hangs in 6.7
>>> take out the complete system and I wanted it in stable.
>>>
>>> It might be safer to use a dedicated wq, is the concern someone is
>>> waiting on a fence in a workqueue somewhere else so we will never
>>> signal it?
>>
>> Yes, if some other work is waiting for this fence (or something else in the same
>> dependency chain) to signal it can prevent executing the work signaling this fence,
>> in case both are scheduled on the same wq. As mentioned, with the kernel global wq
>> this would be rather unlikely to lead to an actual stall with WQ_MAX_ACTIVE == 512,
>> but formally the race condition exists. I guess a malicious attacker could try to
>> intentionally push jobs directly or indirectly depending on this fence to a driver
>> which queues them up on a scheduler using the kernel global wq.
> 
> I think if you add dma_fence_signalling annotations (aside, there's some
> patch from iirc Thomas Hellstrom to improve them and cut down on some
> false positives, but I lost track) then I think you won't get any splats
> because the wq subsystem assumes that WC_MAX_ACTIVE is close enough to
> infinity to not matter.

As mentioned, for the kernel global wq it's 512. (Intentionally) feeding the kernel
with enough jobs to to provoke a deadlock doesn't seem impossible to me.

I think it'd be safer to just establish not to use the kernel global wq for executing
work in the fence signalling critical path.

We could also run into similar problems with a dedicated wq, e.g. when drivers share
a wq between drm_gpu_scheduler instances (see [1]), however, I'm not sure we can catch
that with lockdep.

[1] https://elixir.bootlin.com/linux/v6.8-rc3/source/drivers/gpu/drm/nouveau/nouveau_drm.c#L313

> 
> I'm not sure we should care differently, but I guess it'd be good to
> annotate it all in case the wq subsystem's idea of how much such deadlocks
> are real changes.
> 
> Also Teo is on a mission to get rid of all the global wq flushes, so there
> should also be no source of deadlocks from that kind of cross-driver
> dependency. Or at least shouldn't be in the future, I'm not sure it all
> landed.
> -Sima

