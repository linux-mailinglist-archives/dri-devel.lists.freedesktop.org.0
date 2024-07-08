Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D350D929CD6
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 09:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F4810E23F;
	Mon,  8 Jul 2024 07:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EFH/9Slc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CDF10E100
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 07:14:17 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4265921b0f6so14823635e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 00:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720422856; x=1721027656; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vcpZKxffh1BIPbGttr7eH91nbmnE8KOM65bYeiW3Qyg=;
 b=EFH/9SlcnWIuV9x2q5hn9qDQjsVCd3pqofbtBOUWh5QflgQ8tspL+k5LTGftm1TQs7
 qHc8ovvH5lc3corc3yjtUwql3Pn3sQ3Y4aIpOX7r2EHKSA41R2GYgV5xW/l2AQ1ejkTN
 qiUucwrq3LIzwkP/ggz20cOe41SUe8h/yzqJ8J3Lu5Zhjog3t0ew2PNOoPOtsrEjeyLI
 S3sxlOUGNs6vJ3h8hEJ116Fh4u9tPWnuuoaUmuBadryTjUAjtQ80XS2llEiIll12LjhT
 +mg53w3tF55ChbJYgvi1M6cKjbULKXf139pXJKD2FkJx2+7m1ff49h2q7MKWq/f0g/Ev
 48nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720422856; x=1721027656;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vcpZKxffh1BIPbGttr7eH91nbmnE8KOM65bYeiW3Qyg=;
 b=Ke12pPR3rA9fTMGpcpIb0AZy49aqZ+r6PeAB+97Y7OS4AH+UNkPhmAEYPHnhKVBgDV
 v/6X9xZKp3EtkaTpCJia8ENbkxV9A3MZd7wuBALtsecuoZzv3+3Yg9QNVw2KbMLsZywb
 lkn+elIj5NJUEO8B7b7aPclrPt4gxd27P89l7cUNMkFtVAYL20uJe7StsUbuS1A2+PZI
 QeSxLCDrxsT3LIbMYjPLg6n3BghJc4F3YfVfr+xh9QJu9j5SCzaHimz1dspf2kq4TEF0
 pX3H9rTAnQazcaZAo8kTUcoDrN18/eJAyyFIx6M64jnka95jFMViybInpXarlG+woP0A
 nYWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnA8U3z6e3hQ02JTej05ffyPHVsEgQIWb4WJ3N6MFCofLWPD85wFI8alhTMci95DYoS94bea8PkkGM9t4C7FmmZVYcMVesqmoOSnYHqauS
X-Gm-Message-State: AOJu0Yx+eAJ/47DVHJQ6qNJKwzuVZPsD+cpk2KBJXobQ2QaTicMBJddL
 qPpfa+f4eCL8G70CZNm5rChpN4Z4wjA2EAuacDgb5Nnip0oFbPGn
X-Google-Smtp-Source: AGHT+IE7rimd7KEtTYGAglzE1thSHNWtvzIpA30fmoas+DNLkSTy3PEkmPXIgmyCB2YCS+utG0lcoA==
X-Received: by 2002:a05:600c:20c:b0:426:65bf:5cc2 with SMTP id
 5b1f17b1804b1-42665bf5d8bmr23951935e9.1.1720422855227; 
 Mon, 08 Jul 2024 00:14:15 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a2519a4sm151263255e9.35.2024.07.08.00.14.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 00:14:14 -0700 (PDT)
Message-ID: <41859b82-fe75-451a-9e13-fec254bdaad5@gmail.com>
Date: Mon, 8 Jul 2024 09:14:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] Re: [PATCH 0/8] dma-buf: heaps: Support
 carved-out heaps and ECC related-flags
To: Thierry Reding <thierry.reding@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, John Stultz <jstultz@google.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, "T.J. Mercier"
 <tjmercier@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
 <CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPWTyciVXMXQ@mail.gmail.com>
 <ZkXmWwmdPsqAo7VU@phenom.ffwll.local>
 <CANDhNCo5hSC-sLwdkBi3e-Ja-MzdqcGGbn-4G3XNYwCzZUwscw@mail.gmail.com>
 <ZkyOOwpM57HIiO3v@phenom.ffwll.local>
 <qy7aczeu6kumv5utemoevi7omp5ryq55zmgzxh5hrz5orf2osp@wypg66awof4n>
 <20240628-resilient-resolute-rook-0fc531@houat>
 <3e37rhrcqogix5obsu2gq7jar7bcoamx4bbd376az5z3zdkwvm@jstirwdl5efm>
 <20240704-therapeutic-maroon-coucal-f61a63@houat>
 <wapv4gl2se34tq3isycb7bui5xi3x6kxjqtyz24qhjipnkbuqu@sv4w2crksuq5>
 <ZogSxHFPt8SpOa0w@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ZogSxHFPt8SpOa0w@phenom.ffwll.local>
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

Am 05.07.24 um 17:35 schrieb Daniel Vetter:
> Just figured I'll jump in on one detail here.
>
> On Fri, Jul 05, 2024 at 04:31:34PM +0200, Thierry Reding wrote:
>> On Thu, Jul 04, 2024 at 02:24:49PM GMT, Maxime Ripard wrote:
>>> On Fri, Jun 28, 2024 at 04:42:35PM GMT, Thierry Reding wrote:
>>>> On Fri, Jun 28, 2024 at 03:08:46PM GMT, Maxime Ripard wrote:
>>>>> Hi,
>>>>>
>>>>> On Fri, Jun 28, 2024 at 01:29:17PM GMT, Thierry Reding wrote:
>>>>>> On Tue, May 21, 2024 at 02:06:19PM GMT, Daniel Vetter wrote:
>>>>>>> On Thu, May 16, 2024 at 09:51:35AM -0700, John Stultz wrote:
>>>>>>>> On Thu, May 16, 2024 at 3:56 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>>>>>>>> On Wed, May 15, 2024 at 11:42:58AM -0700, John Stultz wrote:
>>>>>>>>>> But it makes me a little nervous to add a new generic allocation flag
>>>>>>>>>> for a feature most hardware doesn't support (yet, at least). So it's
>>>>>>>>>> hard to weigh how common the actual usage will be across all the
>>>>>>>>>> heaps.
>>>>>>>>>>
>>>>>>>>>> I apologize as my worry is mostly born out of seeing vendors really
>>>>>>>>>> push opaque feature flags in their old ion heaps, so in providing a
>>>>>>>>>> flags argument, it was mostly intended as an escape hatch for
>>>>>>>>>> obviously common attributes. So having the first be something that
>>>>>>>>>> seems reasonable, but isn't actually that common makes me fret some.
>>>>>>>>>>
>>>>>>>>>> So again, not an objection, just something for folks to stew on to
>>>>>>>>>> make sure this is really the right approach.
>>>>>>>>> Another good reason to go with full heap names instead of opaque flags on
>>>>>>>>> existing heaps is that with the former we can use symlinks in sysfs to
>>>>>>>>> specify heaps, with the latter we need a new idea. We haven't yet gotten
>>>>>>>>> around to implement this anywhere, but it's been in the dma-buf/heap todo
>>>>>>>>> since forever, and I like it as a design approach. So would be a good idea
>>>>>>>>> to not toss it. With that display would have symlinks to cma-ecc and cma,
>>>>>>>>> and rendering maybe cma-ecc, shmem, cma heaps (in priority order) for a
>>>>>>>>> SoC where the display needs contig memory for scanout.
>>>>>>>> So indeed that is a good point to keep in mind, but I also think it
>>>>>>>> might re-inforce the choice of having ECC as a flag here.
>>>>>>>>
>>>>>>>> Since my understanding of the sysfs symlinks to heaps idea is about
>>>>>>>> being able to figure out a common heap from a collection of devices,
>>>>>>>> it's really about the ability for the driver to access the type of
>>>>>>>> memory. If ECC is just an attribute of the type of memory (as in this
>>>>>>>> patch series), it being on or off won't necessarily affect
>>>>>>>> compatibility of the buffer with the device.  Similarly "uncached"
>>>>>>>> seems more of an attribute of memory type and not a type itself.
>>>>>>>> Hardware that can access non-contiguous "system" buffers can access
>>>>>>>> uncached system buffers.
>>>>>>> Yeah, but in graphics there's a wide band where "shit performance" is
>>>>>>> defacto "not useable (as intended at least)".
>>>>>>>
>>>>>>> So if we limit the symlink idea to just making sure zero-copy access is
>>>>>>> possible, then we might not actually solve the real world problem we need
>>>>>>> to solve. And so the symlinks become somewhat useless, and we need to
>>>>>>> somewhere encode which flags you need to use with each symlink.
>>>>>>>
>>>>>>> But I also see the argument that there's a bit a combinatorial explosion
>>>>>>> possible. So I guess the question is where we want to handle it ...
>>>>>> Sorry for jumping into this discussion so late. But are we really
>>>>>> concerned about this combinatorial explosion in practice? It may be
>>>>>> theoretically possible to create any combination of these, but do we
>>>>>> expect more than a couple of heaps to exist in any given system?
>>>>> I don't worry too much about the number of heaps available in a given
>>>>> system, it would indeed be fairly low.
>>>>>
>>>>> My concern is about the semantics combinatorial explosion. So far, the
>>>>> name has carried what semantics we were supposed to get from the buffer
>>>>> we allocate from that heap.
>>>>>
>>>>> The more variations and concepts we'll have, the more heap names we'll
>>>>> need, and with confusing names since we wouldn't be able to change the
>>>>> names of the heaps we already have.
>>>> What I was trying to say is that none of this matters if we make these
>>>> names opaque. If these names are contextual for the given system it
>>>> doesn't matter what the exact capabilities are. It only matters that
>>>> their purpose is known and that's what applications will be interested
>>>> in.
>>> If the names are opaque, and we don't publish what the exact
>>> capabilities are, how can an application figure out which heap to use in
>>> the first place?
>> This would need to be based on conventions. The idea is to standardize
>> on a set of names for specific, well-known use-cases.
>>
>>>>>> Would it perhaps make more sense to let a platform override the heap
>>>>>> name to make it more easily identifiable? Maybe this is a naive
>>>>>> assumption, but aren't userspace applications and drivers not primarily
>>>>>> interested in the "type" of heap rather than whatever specific flags
>>>>>> have been set for it?
>>>>> I guess it depends on what you call the type of a heap. Where we
>>>>> allocate the memory from, sure, an application won't care about that.
>>>>> How the buffer behaves on the other end is definitely something
>>>>> applications are going to be interested in though.
>>>> Most of these heaps will be very specific, I would assume.
>>> We don't have any specific heap upstream at the moment, only generic
>>> ones.
>> But we're trying to add more specific ones, right?
>>
>>>> For example a heap that is meant to be protected for protected video
>>>> decoding is both going to be created in such a way as to allow that
>>>> use-case (i.e. it doesn't make sense for it to be uncached, for
>>>> example) and it's also not going to be useful for any other use-case
>>>> (i.e. there's no reason to use that heap for GPU jobs or networking,
>>>> or whatever).
>>> Right. But also, libcamera has started to use dma-heaps to allocate
>>> dma-capable buffers and do software processing on it before sending it
>>> to some hardware controller.
>>>
>>> Caches are critical here, and getting a non-cacheable buffer would be
>>> a clear regression.
>> I understand that. My point is that maybe we shouldn't try to design a
>> complex mechanism that allows full discoverability of everything that a
>> heap supports or is capable of. Instead if the camera has specific
>> requirements, it could look for a heap named "camera". Or if it can
>> share a heap with other multimedia devices, maybe call the heap
>> "multimedia".
>>
>> The idea is that heaps for these use-cases are quite specific, so you
>> would likely not find an arbitrary number of processes try to use the
>> same heap.
> Yeah the idea to sort this out was to have symlinks in sysfs from the
> device to each heap. We could then have priorities for each such link, so
> that applications can pick the "best" heap that will work with all
> devices. Or also special links for special use-cases, like for a
> display+render drm device you might want to have separate links for the
> display and the render-only use-case.
>
> I think trying to encode this all into the name of a heap without linking
> it to the device is not going to work well in general.
>
> We still have that entire "make sysfs symlinks work for dma-buf heaps" on
> our todos, and that idea is almost as old as dma-buf itself :-/

I still have the draft patches for that lying around on my harddisk 
somewhere with zero time to look into it.

If anybody wants to pick it up feel free to ping me, but be aware that 
you need to write more documentation than code.

Regards,
Christian.

> -Sima

