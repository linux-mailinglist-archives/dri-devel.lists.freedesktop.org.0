Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ED8C85418
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 14:52:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 414CA10E02B;
	Tue, 25 Nov 2025 13:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Eycvsb8I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3046A10E02B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 13:52:23 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-477b91680f8so43907485e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 05:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764078741; x=1764683541; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kHOesweq24KF358s0vEumPsOYuhj+3ibk2FmOjZUv+4=;
 b=Eycvsb8IwbHlkaoTVEhUGFr1Wuj1zje+9kriAbOKaf2NcjDdpGrA4uAzcLHvMGnIVK
 kW59jiZJS7b2K3jRe8Ci+H8AsvXBnW1ZXaRyEGd3IhHi+E+HaHEuhx734B4sexxANuWq
 4MzkFBtxyi+Ot9dxvJzCcJXQA8MoeSRpsOYK4kNrLE7W41Cj975piNO2c/89CWlIJgz/
 7KVxmZU+EF79OFjtTDw0+kNoeRwe4N1Qd8Q/Zb+gNKmgZEQuG/tmTdjUqajfFTz0RA62
 sswEX8SlL60PfXs4Wmk7eGcl3AgXjLFM+pLF1DmjgkSfDmH/caP0crwamBlMicsGFwFr
 cA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764078741; x=1764683541;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kHOesweq24KF358s0vEumPsOYuhj+3ibk2FmOjZUv+4=;
 b=fWAV5iOYNyp1ENHDz2Q1wXzSdfDUh/U3fpdE5YIZccLKRRBVOsNPOHNuygz9hlMQP+
 BWr/RpCYV4M6NbtVKahRGnI8S84HhtIDRoWgjdcqGJfOoOQ/6RBKVEGlBZuurEQVq3Uo
 BVpQ7/ekH9N8O3Jb0ekcEjUJpUK8pJYHSdKxnT1Mo9iiKAHDnlsOvQ+QSEDMIuzg3M6U
 RCCPjtqgW5bPTFMbOyjWUdsK8HIqPaET07eemi9TvgfpLPdQPUk0XFO4ZB2EMjsmu36R
 +IQCeYvJpZaBSUtpKpD6TnoravninLem23PsKUAW44pYGtFAOxtWxAwQIu8kPC+GSvmp
 tE5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjUOEQtaAge0hI9TYvmIYVlNThmuINA7aP51YyQDazr8YRPQPmlKu4YeSMd7esagHoAWcN4n44Wvk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzakI1rizZh2ekeN5b0MLJumADUnDShrjB+18luETYisdOVycSw
 jxZheGLfadPxkoCliIOIQMnK9xoz5aGAdxKxXE2xT1qUMab2EWX0vxrn
X-Gm-Gg: ASbGncsuHgddrxKieT/huvbOcGYoF3i1k1Y4mc9Nk8PF/T1chZXEWylQ3399PygihGP
 vXgql/o3LPsXgmaz+T7N+xDC/lyU6bM+t4a/l/YuEOFR9+U3GWGIe99aVfe9QM8kZ70/RTrc0Js
 cwyr2jhYTkqHW8bUVMpQBUZ5+5AP8/Y4WuStj3JAr5t2nsh8WT/7XYxawpNazR2XuVyYj0kkGMs
 RSqaRHk4qzfpUt+h/PRXX4X4Uq9yIrsAaVAIR0vSjPXTY9Db5XHvzAOmR74Vc+T3IeMrT5di5QL
 /1noN1K+fNRpi8EQ2fCFcthmdIEMpyvOeWuocLeYbQrO0MwC+gsraWeSj3ViX47N81jE/jJkKnW
 +mw6Fo+7rUiaSA9zSbYzrEsULLH/x+2tKMAMydpC3RA5cOGizUr41LlmreIZs+7ZVWyS+uLxbZ6
 oMUbGpSNYYc4gNUmXr/lNSeBQT7rJYqxmyHk99bN2iFeM0ijmyibxupDRJAfSobvVXRofaqd8g
X-Google-Smtp-Source: AGHT+IFKl0FSWbmMlOH9ZWfAZWRSmX8BD6ohJLnDHz1PIktPZZElxLDCt4b4SkoYMkjbJJn+KqrIYg==
X-Received: by 2002:a5d:5d81:0:b0:42b:3ded:298d with SMTP id
 ffacd0b85a97d-42cc1d2d5ebmr16251211f8f.32.1764078741365; 
 Tue, 25 Nov 2025 05:52:21 -0800 (PST)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c?
 ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fa3a81sm35280457f8f.26.2025.11.25.05.52.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 05:52:20 -0800 (PST)
Message-ID: <a80a1e7d-e387-448f-8095-0aa22a07af17@gmail.com>
Date: Tue, 25 Nov 2025 13:52:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Pavel Begunkov <asml.silence@gmail.com>
Subject: Re: [RFC v2 00/11] Add dmabuf read/write via io_uring
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-block@vger.kernel.org, io-uring@vger.kernel.org
Cc: Vishal Verma <vishal1.verma@intel.com>, tushar.gohad@intel.com,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <cover.1763725387.git.asml.silence@gmail.com>
 <fd10fe48-f278-4ed0-b96b-c4f5a91b7f95@amd.com>
 <905ff009-0e02-4a5b-aa8d-236bfc1a404e@gmail.com>
 <53be1078-4d67-470f-b1af-1d9ac985fbe2@amd.com>
Content-Language: en-US
In-Reply-To: <53be1078-4d67-470f-b1af-1d9ac985fbe2@amd.com>
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

On 11/24/25 14:17, Christian König wrote:
> On 11/24/25 12:30, Pavel Begunkov wrote:
>> On 11/24/25 10:33, Christian König wrote:
>>> On 11/23/25 23:51, Pavel Begunkov wrote:
>>>> Picking up the work on supporting dmabuf in the read/write path.
>>>
>>> IIRC that work was completely stopped because it violated core dma_fence and DMA-buf rules and after some private discussion was considered not doable in general.
>>>
>>> Or am I mixing something up here?
>>
>> The time gap is purely due to me being busy. I wasn't CC'ed to those private
>> discussions you mentioned, but the v1 feedback was to use dynamic attachments
>> and avoid passing dma address arrays directly.
>>
>> https://lore.kernel.org/all/cover.1751035820.git.asml.silence@gmail.com/
>>
>> I'm lost on what part is not doable. Can you elaborate on the core
>> dma-fence dma-buf rules?
> 
> I most likely mixed that up, in other words that was a different discussion.
> 
> When you use dma_fences to indicate async completion of events you need to be super duper careful that you only do this for in flight events, have the fence creation in the right order etc...

I'm curious, what can happen if there is new IO using a
move_notify()ed mapping, but let's say it's guaranteed to complete
strictly before dma_buf_unmap_attachment() and the fence is signaled?
Is there some loss of data or corruption that can happen?

sg_table = map_attach()         |
move_notify()                   |
   -> add_fence(fence)           |
                                 | issue_IO(sg_table)
                                 | // IO completed
unmap_attachment(sg_table)      |
signal_fence(fence)             |

> For example once the fence is created you can't make any memory allocations any more, that's why we have this dance of reserving fence slots, creating the fence and then adding it.

Looks I have some terminology gap here. By "memory allocations" you
don't mean kmalloc, right? I assume it's about new users of the
mapping.

>>> Since I don't see any dma_fence implementation at all that might actually be the case.
>>
>> See Patch 5, struct blk_mq_dma_fence. It's used in the move_notify
>> callback and is signaled when all inflight IO using the current
>> mapping are complete. All new IO requests will try to recreate the
>> mapping, and hence potentially wait with dma_resv_wait_timeout().
> 
> Without looking at the code that approach sounds more or less correct to me.
> 
>>> On the other hand we have direct I/O from DMA-buf working for quite a while, just not upstream and without io_uring support.
>>
>> Have any reference?
> 
> There is a WIP feature in AMDs GPU driver package for ROCm.
> 
> But that can't be used as general purpose DMA-buf approach, because it makes use of internal knowledge about how the GPU driver is using the backing store.

Got it

> BTW when you use DMA addresses from DMA-buf always keep in mind that this memory can be written by others at the same time, e.g. you can't do things like compute a CRC first, then write to backing store and finally compare CRC.

Right. The direct IO path also works with user pages, so the
constraints are similar in this regard.

-- 
Pavel Begunkov

