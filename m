Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22564C86D41
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 20:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8293410E072;
	Tue, 25 Nov 2025 19:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dZMrb2Il";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B12F10E072
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 19:40:20 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso25564765e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 11:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764099619; x=1764704419; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F+mYioxWgzcz5tqtizOnI1Ne46KDyU7fg8afEAzl4P4=;
 b=dZMrb2Il22sIenraaToYDrG39hge09o00yX2+eA7ndaoHSjSYu8NpxtvJ+qJZ+DyWc
 O1uq/3ioVFk/5V8oiK3M6CWWKKmc2iFgV6/aXFRBptxX/JYOQcyZgxZzol+jDdDrO1Ak
 1yQrpKGMwiAdHxFw9oXZtvxCS8njxrV3gYnLWW62d1y3/FdjQuNHAkVMlqwzpkZD1xbw
 LyZ7nn1sTgz8paz3V7eH4cMc65ZPDyjdcKsJ9KtZAUSBcEEQcPMqeLcwiwAhohh9h0kc
 bRfv5L1XQJZSZuE+wAiaSKGyvf4Wtu1W+2t40WR3aFsqlMp0kSOcL0N3P+k8Fvx6FOaP
 8vDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764099619; x=1764704419;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F+mYioxWgzcz5tqtizOnI1Ne46KDyU7fg8afEAzl4P4=;
 b=JLIJsEzFEWwQS4i3Cd1GM1uXoZXGHq2xdPzlzNEMw9ARyWHRjnCdckZMBEZRBgskjD
 WWvoPDtkQkeZ4SV06RYTGnkjWwC2dMd3LVPCTsKDQ3Jskx3a3Y2Dt/AdxDjtQwe+tv+w
 5ih73z9lVE2rH5JFH3NLPFDBmCbUollxv5v5bB8MqUrqmSC1vUHX7fjhFF6OM+K0O8ea
 om/FNBBzxTHYvz4qPxycGUmDmmajM1URjKqR7S/J0+uZIog6l2qhuu0NP46pHqwq0YXr
 2vDEEptCm2sdX43+DWz7bWEamrOUG1jru2aYmC1bK+lRUeiY5EBL9ptX/10BXnLW1YHu
 Ywdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBId9JpiEHu/zv12u3tCBjh+XPjmdXx37oJfj+3qYPyVYWNTdzFTPAIz6MEIyMzjxtDyuQ/16sUgI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzP834kxywfA7ktvEkwje1fiz6Yg4EqwIlf4KtnTUU8ifNZK/ES
 mAdakv+8KPssD/dTddTJfM5Xcy8EACChLeN/VXvtFAudUx6ZICAMrMXz
X-Gm-Gg: ASbGncuMn8qa/+bEt5gmBI+w3XdT48i5cYNlcf1VVd2lzOGuycDwmsZmiSQ+lYtDcAc
 sK59JaAp0XyGoPU4V80C8KSZSuKs7hxUX3BckP0N2BYuwDg8pCqAj6TRYVFOsQZ55FTEIGfKQ4H
 8EHMKFFbuMZDYf/ZAbcfIYuTevba/6iCDSmks0DA98x4m1iFFUif47dItuxTOGeJt/YmyxDiuA5
 +Eftah5Rx/te4s75tTQa8OpbJ5EFc4v4dfBOOTahyAGgsz26lL3LYMQCPLaElxGiEH/CW7n2JK6
 PKWY4/1ZTSHqCRewoTMDzMzVWS+xz2s8WqewjpCCqBqxfoPE6cTdJol2k6fCZzZEoGjnGCvenh5
 2FeBpq0w50ZrKspcuZLGaV6e2zOexrRODy0k533veOZqvaIjbjXly+ABA7BRHeAmgfpqiG0326p
 soEoU1TuT9hOvRfxKRAdgr8bHQHekTGhJQ5AEBBpW13zY5xh7EuyeM7nfhdV/1AA==
X-Google-Smtp-Source: AGHT+IFpWZeUDyopyguGNmEbgYIRF/Mo2eq9v5oFLJoUC93zNjBvPZO9k5dPUiOZ58x4X8B/LhlhcQ==
X-Received: by 2002:a05:600c:1c88:b0:477:9cdb:e337 with SMTP id
 5b1f17b1804b1-477c0165badmr197645055e9.7.1764099618711; 
 Tue, 25 Nov 2025 11:40:18 -0800 (PST)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c?
 ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790add608bsm5321225e9.5.2025.11.25.11.40.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 11:40:18 -0800 (PST)
Message-ID: <478ea064-3a2f-4529-81f3-ac2346fe32f0@gmail.com>
Date: Tue, 25 Nov 2025 19:40:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
 <a80a1e7d-e387-448f-8095-0aa22a07af17@gmail.com>
 <0d0d2a6a-a90c-409c-8d60-b17bad32af94@amd.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <0d0d2a6a-a90c-409c-8d60-b17bad32af94@amd.com>
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

On 11/25/25 14:21, Christian König wrote:
> On 11/25/25 14:52, Pavel Begunkov wrote:
>> On 11/24/25 14:17, Christian König wrote:
>>> On 11/24/25 12:30, Pavel Begunkov wrote:
>>>> On 11/24/25 10:33, Christian König wrote:
>>>>> On 11/23/25 23:51, Pavel Begunkov wrote:
>>>>>> Picking up the work on supporting dmabuf in the read/write path.
>>>>>
>>>>> IIRC that work was completely stopped because it violated core dma_fence and DMA-buf rules and after some private discussion was considered not doable in general.
>>>>>
>>>>> Or am I mixing something up here?
>>>>
>>>> The time gap is purely due to me being busy. I wasn't CC'ed to those private
>>>> discussions you mentioned, but the v1 feedback was to use dynamic attachments
>>>> and avoid passing dma address arrays directly.
>>>>
>>>> https://lore.kernel.org/all/cover.1751035820.git.asml.silence@gmail.com/
>>>>
>>>> I'm lost on what part is not doable. Can you elaborate on the core
>>>> dma-fence dma-buf rules?
>>>
>>> I most likely mixed that up, in other words that was a different discussion.
>>>
>>> When you use dma_fences to indicate async completion of events you need to be super duper careful that you only do this for in flight events, have the fence creation in the right order etc...
>>
>> I'm curious, what can happen if there is new IO using a
>> move_notify()ed mapping, but let's say it's guaranteed to complete
>> strictly before dma_buf_unmap_attachment() and the fence is signaled?
>> Is there some loss of data or corruption that can happen?
> 
> The problem is that you can't guarantee that because you run into deadlocks.
> 
> As soon as a dma_fence() is created and published by calling add_fence it can be memory management loops back and depends on that fence.

I think I got the idea, thanks

> So you actually can't issue any new IO which might block the unmap operation.
> 
>>
>> sg_table = map_attach()         |
>> move_notify()                   |
>>    -> add_fence(fence)           |
>>                                  | issue_IO(sg_table)
>>                                  | // IO completed
>> unmap_attachment(sg_table)      |
>> signal_fence(fence)             |
>>
>>> For example once the fence is created you can't make any memory allocations any more, that's why we have this dance of reserving fence slots, creating the fence and then adding it.
>>
>> Looks I have some terminology gap here. By "memory allocations" you
>> don't mean kmalloc, right? I assume it's about new users of the
>> mapping.
> 
> kmalloc() as well as get_free_page() is exactly what is meant here.
> 
> You can't make any memory allocation any more after creating/publishing a dma_fence.

I see, thanks

> The usually flow is the following:
> 
> 1. Lock dma_resv object
> 2. Prepare I/O operation, make all memory allocations etc...
> 3. Allocate dma_fence object
> 4. Push I/O operation to the HW, making sure that you don't allocate memory any more.
> 5. Call dma_resv_add_fence(with fence allocate in #3).
> 6. Unlock dma_resv object
> 
> If you stride from that you most likely end up in a deadlock sooner or later.
-- 
Pavel Begunkov

