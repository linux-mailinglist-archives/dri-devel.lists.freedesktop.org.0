Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7418A1B3B0
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 11:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D056E10E95D;
	Fri, 24 Jan 2025 10:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hSA0wlde";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D2D10E7DF
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 10:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737715474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9LGicVHjVXKCgFdIoAFwldRTveMxoGLLdTcV9/dVeF4=;
 b=hSA0wldeCumisQimzvfv+75K8lSiplubqmLxm8/U1yTF95Tem8kio3RUJCujr1CpoIhnGg
 G0JZveB1R2qN16AFrKo6pWieCpQxgIhJCHMgYHIxahYNgKKb6cfeWvVsqKHxmN98lmRbF8
 TZzYgKtKW25effU5Vq9S/daBr/wrKUQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-YoGYbBQ_Ok6VnSNjOBta_w-1; Fri, 24 Jan 2025 05:44:32 -0500
X-MC-Unique: YoGYbBQ_Ok6VnSNjOBta_w-1
X-Mimecast-MFC-AGG-ID: YoGYbBQ_Ok6VnSNjOBta_w
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-385dcae001fso757553f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 02:44:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737715471; x=1738320271;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9LGicVHjVXKCgFdIoAFwldRTveMxoGLLdTcV9/dVeF4=;
 b=UHCSMTOUYKZHWJ0rUz6DnW0iqQmrt9Z3aMi+K3kbrmSdglAv50Xvnl47Yp2GAEhRuO
 R1xOwnLZpHdcnFYngmk20CGPbpd4L3gQeOpvg+w4yiTSnJnKUjRbAesRbxMf6XLMCLao
 d0z8XedwirDt/xeMyde1yKZZt1ZS4sxpfbCX2Bpu1ZlRE+x0rm6Z2NKJT9uIoeWc3s9G
 5ucze8EkYJx+WxpMScJBhf39UblYX3QvurPup6oGy9RO58QLtoAarYdeICs8tX3JgdsR
 oKuD/0IOipUu4VjnC/XpzBVRYgtwLEWdIdzVr7tlcrRkM7ycYRNCe4IqmuudAh7OwVm+
 H4pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuOwDZiKU6EqqV/ah4vJtyu/OeB0f7JHRo/MebzIMg4zZbb3lYiXU6SMqHmlIgDq5ehcQ098E/HI0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHj4ACvnfHXZPlTGBDDUlncNkK5C/wjPijIxTKTGX2y0GEQnqe
 1Rfd8K5HopEJy90oJkPrLmJBzKxqshPQ1virM11+lwA2YJBM7D501bznx42Oj8RKIA9zIl5Mt3N
 eoJDYWbKuTIoIHTa97DVThdCh8rEtgE4lJyrIvWVkkI7EDJGn2O/7aWPIO9ygNF7QyQ==
X-Gm-Gg: ASbGnctXzrxYvasHUSX/+3tkE09y0KOmqxpthgj3ztqnm79tQNDa7h4hQ5SRwBq0Iia
 yEKRPmAXZ0V73ZacMZ50d7jTEmR25rN1XDrm18zmO4Kqhk3JfnZBEPbCTpgEoRDE6HEVj/NPBE1
 IQKPSVHm4vUhltYjZLgaXYPjqz3FGYO5HzR5p80KprolQZU0vbZDRj+gQkYWLaBC5QwtxsXVL2r
 HxjKui5t4YhI1DlWfETqXpSblzbNUeuTlBNH0c7T/sCg3tVGpgsE32YeM0Eoq82hEmYqOZHXpN7
 MtkVEvLImHo+jeR4AQL+W5qZoAu4
X-Received: by 2002:adf:fd84:0:b0:385:faf5:eb9f with SMTP id
 ffacd0b85a97d-38bf57c91e7mr28813766f8f.48.1737715471556; 
 Fri, 24 Jan 2025 02:44:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKstrH5UL8LgQDwA4DkXTRFLjT6VqmqvDWzIKYlE7kR/ewYGg5Hi2VcNrw25AxqdO1qrWvQg==
X-Received: by 2002:adf:fd84:0:b0:385:faf5:eb9f with SMTP id
 ffacd0b85a97d-38bf57c91e7mr28813740f8f.48.1737715471211; 
 Fri, 24 Jan 2025 02:44:31 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7?
 ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a18931esm2342703f8f.60.2025.01.24.02.44.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 02:44:30 -0800 (PST)
Message-ID: <8c6f3838-f194-4a42-845d-10011192a234@redhat.com>
Date: Fri, 24 Jan 2025 11:44:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Question] Are "device exclusive non-swap entries" / "SVM atomics
 in Nouveau" still getting used in practice?
To: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
References: <346518a4-a090-4eaa-bc04-634388fd4ca3@redhat.com>
 <Z5JbYC2-slPU0l3n@phenom.ffwll.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z5JbYC2-slPU0l3n@phenom.ffwll.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: up8NL53EKP0oBghDC7BY0SYnDKkhW-ZT-CPKovlveLQ_1737715472
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

On 23.01.25 16:08, Simona Vetter wrote:
> On Thu, Jan 23, 2025 at 11:20:37AM +0100, David Hildenbrand wrote:
>> Hi,
>>
>> I keep finding issues in our implementation of "device exclusive non-swap
>> entries", and the way it messes with mapcounts is disgusting.
>>
>> As a reminder, what we do here is to replace a PTE pointing to an anonymous
>> page by a "device exclusive non-swap entry".
>>
>> As long as the original PTE is in place, the only CPU can access it, as soon
>> as the "device exclusive non-swap entry" is in place, only the device can
>> access it. Conversion back and forth is triggered by CPU / device faults.
>>
>> I have fixes/reworks/simplifications for most things, but as there is only a
>> "real" single user in-tree of make_device_exclusive():
>>
>> 	drivers/gpu/drm/nouveau/nouveau_svm.c
>>
>> to "support SVM atomics in Nouveau [1]"
>>
>> naturally I am wondering: is this still a thing on actual hardware, or is it
>> already stale on recent hardware and not really required anymore?
>>
>>
>> [1] https://lore.kernel.org/linux-kernel//6621654.gmDyfcmpjF@nvdebian/T/
> 

Thanks for your answer!

Nvidia folks told me on a different channel that it's still getting used.

> As long as you don't have a coherent interconnect it's needed. On intel
> discrete device atomics require device memory, so they need full hmm
> migration (and hence wont use this function even once we land intel gpu
> svm code in upstream).

Makes sense.

> On integrated the gpu is tied into the coherency
> fabric, so there it's not needed.
> 
> I think the more fundamental question with both this function here and
> with forced migration to device memory is that there's no guarantee it
> will work out.

Yes, in particular with device-exclusive, it doesn't really work with 
THP and is only limited to anonymous memory. I have patches to at least 
make it work reliably with THP.

Then, we seem to give up too easily if we cannot lock the folio when 
wanting to convert to device-exclusive, which also looks rather odd. But 
well, maybe it just works good enough in the common case, or there is 
some other retry logic that makes it fly.

> At least that's my understanding. And for this gpu device
> atomics without coherent interconnect idea to work, we'd need to be able
> to guarantee that we can make any page device exclusive. So from my side I
> have some pretty big question marks on this entire thing overall.

I don't think other memory (shmem/file/...) is really feasible as soon 
as other processes (not the current process) map/write/read file pages.

We could really only handle if we converted a single PTE and that PTE is 
getting converted back again.

There are other concerns I have (what if the page is pinned and access 
outside of the user space page tables?). Maybe there was not need to 
handle these cases so far.

So best I can do is make anonymous memory more reliable with 
device-exclusive and fixup some of the problematic parts that I see 
(e.g., broken page reclaim, page migration, ...).

But before starting to cleanup+improve the existing handling of 
anonymous memory, I was wondering if this whole thing is getting used at 
all.

-- 
Cheers,

David / dhildenb

