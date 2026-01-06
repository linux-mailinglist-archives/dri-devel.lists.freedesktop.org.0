Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0301BCFAC9E
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 20:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1D310E00E;
	Tue,  6 Jan 2026 19:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="irN0wiGy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA75F10E00E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 19:51:17 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-42fb2314eb0so991094f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 11:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767729076; x=1768333876; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ovZgk8PxCrhilP9ak1FB2YkidalwKuZZczfXtCx59dw=;
 b=irN0wiGyWe/0qNcqVFa4+7AJ56+KJpneO+LuDMS8b54rhSUQQt1Fkobe3m6prYvu++
 8aAWKRcrGAJmEQ6gFkSzUfftqvwmiQ5Dst4DQY5OglPB4PyKoeqhva7fmmsYvdoaCjYm
 tCHh7szBhsQZFsw8n2ge6HFTIG8wl5gRafKIvfXG4OTYHNSv0t3Fdw5wCLzSpD6G8WKL
 Vo9CMoNKSQV5Ry34WCOheDKCLX//sNanzzjlIv7P159YVm1wcPgUxKG7u7qSZ75tavBf
 v+K1n5tzWOY3R0UKonkY2syCSQWVxwZElk1coqwvch6HY+L8e9e9F0Xl/HtqNCeCVj1R
 f1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767729076; x=1768333876;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ovZgk8PxCrhilP9ak1FB2YkidalwKuZZczfXtCx59dw=;
 b=AuzGCwgPlqLyByJc+Lmc/hTmSFhdhHNKB97hD1c0Nw++tF3Glf/YYOWL8DnZiHRLqZ
 CmwXiYKy0Fc5XGU3eu+fREHc0tZZXG6C8cACX4YFEkbDT2MrIL7ux1EMxDY15KLv++F9
 mucCzoudYbAy8JG5H9l7yPVORozbKfH4lnxThce3L+Ja9F+auCesHdGGQ90/IuEpSXJM
 HbeXSZZ/1SpNGzp2NVeYrJTmc+wV0JEs5FBP7+Dej0l+mjxSTeJ7mlG+gJAhRLNEXKvj
 6L7mvzssXtiwU2jyEFJFZ7m2ZqRuMdBZJvbCGG8nRf1x4fAQ4H77SPy03JUqn4BrH/WN
 d1pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUrQLuaB2mxgdMOY956bAkUViqwSETM6QNu3fkJV8FWoiKGEwZl7XvaB6NJ/E1bCXEHtJ+VgAU4kE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHzibH8rsiEi3bohtRXxckutUm0OD6ogwabsiRXP48e8Lxqjgj
 7ihfvibXl580hRTRGwgCoP9STJJrjMVXQCDw7Vc0rqfxJ0urZyN2+wnC
X-Gm-Gg: AY/fxX5Oje6tHx6adkEbM8OP9LsNFBBnMKbd/lyNbbt4D9zSsLc+L/GOwaY79VO7Oc2
 CTxXEdPaXl2wquAL/GuOwkmey/1MWMkrTsiLS8owDp8EvXUpusGWRsRybsO5MOiVEateJ2Xdw1j
 m6W4QH7NCf/7xYK9DdaWA0awh80C5qwn/tot7VQonfSxlDSTPesSLGCzjBg6VRg5RqBkHNwUnVO
 4iqFDGWMtutXo64S/RqJgKlUqAL5u69iwhYIG52MkJV6hwLB2/BmFumeKlIvWkhx89vwfXMW7fI
 qypHVN+d8JodkzJKxnEdxjy2meSVP9mRqXX1uQWPxQIdBQAoOfo/8iY/AHeeN4c6gT1JvBjr8Cl
 uObwDpKWVwo4jBstWwjdDSMyQ4dU8J08lFsrU0qmrE2f9HwKEHWrW8nqb1lce6fzrieptQd0hKI
 euJCZKdL4SI/T7XijMM8VuSXi/f3jo/5kmvB6iP1Tlyp/GxZmUMHLIXrhvhmeORk834Qv98V80b
 Fkh2w+O+y3jqVTJjQ93TqPGe3MLFF55i5fK2CRpM+YeKiW4fEN3Ouv3WMlyYhzf
X-Google-Smtp-Source: AGHT+IFFym+HTWb6WhRU4bKfzHds67XbzvjVQ0ncM7+fS6yOVWLogcdaslK7a3BF15xU4e7GXQY5lg==
X-Received: by 2002:a5d:5f51:0:b0:430:fdb8:8510 with SMTP id
 ffacd0b85a97d-432c3790ca4mr333772f8f.24.1767729076041; 
 Tue, 06 Jan 2026 11:51:16 -0800 (PST)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c?
 ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e19bfsm6241105f8f.18.2026.01.06.11.51.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 11:51:15 -0800 (PST)
Message-ID: <a96e327d-3fef-4d08-87e9-c65866223967@gmail.com>
Date: Tue, 6 Jan 2026 19:51:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 01/11] file: add callback for pre-mapping dmabuf
To: Ming Lei <ming.lei@redhat.com>, Christoph Hellwig <hch@lst.de>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 Vishal Verma <vishal1.verma@intel.com>, tushar.gohad@intel.com,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Sagi Grimberg <sagi@grimberg.me>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <cover.1763725387.git.asml.silence@gmail.com>
 <74d689540fa200fe37f1a930165357a92fe9e68c.1763725387.git.asml.silence@gmail.com>
 <7b2017f4-02a3-482a-a173-bb16b895c0cb@amd.com>
 <20251204110709.GA22971@lst.de>
 <0571ca61-7b17-4167-83eb-4269bd0459fe@amd.com>
 <20251204131025.GA26860@lst.de> <aVnFnzRYWC_Y5zHg@fedora>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <aVnFnzRYWC_Y5zHg@fedora>
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

On 1/4/26 01:42, Ming Lei wrote:
> On Thu, Dec 04, 2025 at 02:10:25PM +0100, Christoph Hellwig wrote:
>> On Thu, Dec 04, 2025 at 12:09:46PM +0100, Christian König wrote:
>>>> I find the naming pretty confusing a well.  But what this does is to
>>>> tell the file system/driver that it should expect a future
>>>> read_iter/write_iter operation that takes data from / puts data into
>>>> the dmabuf passed to this operation.
>>>
>>> That explanation makes much more sense.
>>>
>>> The remaining question is why does the underlying file system / driver
>>> needs to know that it will get addresses from a DMA-buf?
>>
>> This eventually ends up calling dma_buf_dynamic_attach and provides
>> a way to find the dma_buf_attachment later in the I/O path.
> 
> Maybe it can be named as ->dma_buf_attach()?  For wiring dma-buf and the
> importer side(nvme).
> 
> But I am wondering why not make it as one subsystem interface, such as nvme
> ioctl, then the whole implementation can be simplified a lot. It is reasonable
> because subsystem is exactly the side for consuming/importing the dma-buf.

It's not an nvme specific interface, and so a file op was much more
convenient. And ioctls for registering it into io_uring would also be
problematic. I simplified some of the layering for the next version,
but most of the complexity comes from handling in blk-mq-dma-token.h,
it'd be same even if made nvme specific. In fact, I had it all first
in nvme but then had to move to block/ because of sleeping.

-- 
Pavel Begunkov

