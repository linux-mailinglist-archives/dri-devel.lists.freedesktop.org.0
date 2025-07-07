Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1164EAFB795
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 17:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EE810E328;
	Mon,  7 Jul 2025 15:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iYaB3JRg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E222C10E4C1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 15:39:57 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-60c01f70092so5206804a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 08:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751902796; x=1752507596; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ezjQuXHd5Rf3mpNjV8Fq8zwJgH75aSXDhZDfm3b1TCM=;
 b=iYaB3JRg6puNNa/ZrKTlNNCN127NYJgYUxTykKxkKwkcw88yuz+Pb3ApowQrsit+Sj
 8z9gLPQGJx5ytTTVmP4isxDElzs6VDZ7XF2TqRmSJa7PoNwB260V2RzYWHnEp3sENJ1y
 xwaMwVNmOorZ/F17PNJVXi82sTdJmUiwerDQeDDgUs3cJJCaJZpq/sfQ9gWQ4hIySzK4
 h8CMpKcOjNVD+UOuvzmWEIUIcc+99SG9oHj3mwOK1w91SR3El/uJoEKwZBbYuGL3BR43
 C1kKp5HNwNSg+cWIDXPjAzTY9x2HiTu+l/j8jbQvL5MiARAkqJNqKjfpctgQckthYE7h
 LxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751902796; x=1752507596;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ezjQuXHd5Rf3mpNjV8Fq8zwJgH75aSXDhZDfm3b1TCM=;
 b=bijcnF8KyqSSe7qlGqRGplgy73E6J9ne1jeAp56M2uBa+4EUWm0p+LtJ9/N3z4eXWz
 f1k2YxOpvC+5b/hPdVC71Nxm7LOjOV6iiMhh9C9BEZQjfioSC1C3LMPLu87h7cxJLls7
 SuydaAPyGmFYl/GYx02sj/Z96KnJ263yCcW7CBQ4Q63gRsKw0bamB3yc/Bij3cs72no0
 mdr9AxnS+cOCJCOj0PfFyJy1equ7yp35Sn0gW96lcGcWa8Mfk/RCbvqW93UkgTIGwBre
 /lVjRx4eAy2RKx+JI4KB1bCencViG+/Svb9asAnlPBjy7RvIwPIBaRCHuoOn+CJIGrgI
 w1vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9b6+UFzF0uA5eZVeByof8DPF/luzTfGbJGVOUx68ZUAzgLXG+A3jdkEaLg3H9RkE622Lyd6TiOrA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtnZ+r6LaZ8Dz2MHk4ZG5ui5Mu3JskMPuxViSJSpTFpGXg6z3i
 d5BXZKOMFm6/MypyrbtgewTwUpyjVT/5EDjvlIUPhu1pGAeT93tB5j5o
X-Gm-Gg: ASbGncvScZ2592SPDG7ctflePplzp7LXt/0Xj34RXh3LclGUwqvSuPFwgp1FCsCBbFm
 jJjTXGNy2/APLhGuinNBrgpWLUTsjc2+W8ltolVWZwdYMiYUgupNtwvDognr+JkZL372yJAILNU
 t6KUkR+REgRYzocPLatkclReap62u4SBmUxb+Ureajs6QSyDGeMzYZAhWfqMk8G8EZoC6utSv84
 LfmA4tnls3K8Z5QmC62RZFZzFW0bJ1PS/Lw2rtYr4zKslXqGv+ZCq6RzS5hsiGx2af1Ppn7PIb8
 2wvLIZTGoxXtMzfjgxaYgVSiRoLrHx74VSiSUjhyeDeEdnhBU7NiniEeIoqtoeJJfog3YqoBQ+D
 aGWtFsOw=
X-Google-Smtp-Source: AGHT+IECUz+0dR+mX/jDHZopafgoqx5arH4cJ6TohfaPi6RZy5DB6VxRs0wsEPpg/JVzP6t3CV7CTA==
X-Received: by 2002:a17:907:c29:b0:ad5:78ca:2126 with SMTP id
 a640c23a62f3a-ae4109062f9mr811114166b.59.1751902795974; 
 Mon, 07 Jul 2025 08:39:55 -0700 (PDT)
Received: from [192.168.8.100] ([148.252.146.232])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60fcb0c78efsm5939890a12.44.2025.07.07.08.39.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 08:39:55 -0700 (PDT)
Message-ID: <e210595b-d01f-4405-9b5d-a486ddca49ed@gmail.com>
Date: Mon, 7 Jul 2025 16:41:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 00/12] io_uring dmabuf read/write support
To: Christoph Hellwig <hch@infradead.org>
Cc: io-uring@vger.kernel.org, linux-block@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, David Wei <dw@davidwei.uk>,
 Vishal Verma <vishal1.verma@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <cover.1751035820.git.asml.silence@gmail.com>
 <aGaSb5rpLD9uc1IK@infradead.org>
 <f2216c30-6540-4b1a-b798-d9a3f83547b2@gmail.com>
 <aGveLlLDcsyCBKuU@infradead.org>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <aGveLlLDcsyCBKuU@infradead.org>
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

On 7/7/25 15:48, Christoph Hellwig wrote:
> On Mon, Jul 07, 2025 at 12:15:54PM +0100, Pavel Begunkov wrote:
>>> to attach to / detach from a dma_buf, and then have an iter that
>>> specifies a dmabuf and offsets into.  That way the code behind the
>>> file operations can forward the attachment to all the needed
>>> devices (including more/less while it remains attached to the file)
>>> and can pick the right dma address for each device.
>>
>> By "iter that specifies a dmabuf" do you mean an opaque file-specific
>> structure allocated inside the new fop?
> 
> I mean a reference the actual dma_buf (probably indirect through the file
> * for it, but listen to the dma_buf experts for that and not me).

My expectation is that io_uring would pass struct dma_buf to the
file during registration, so that it can do a bunch of work upfront,
but iterators will carry sth already pre-attached and pre dma mapped,
probably in a file specific format hiding details for multi-device
support, and possibly bundled with the dma-buf pointer if necessary.
(All modulo move notify which I need to look into first).

>> Akin to what Keith proposed back
>> then. That sounds good and has more potential for various optimisations.
>> My concern would be growing struct iov_iter by an extra pointer:
> 
>> struct iov_iter {
>> 	union {
>> 		struct iovec *iov;
>> 		struct dma_seg *dmav;
>> 		...
>> 	};
>> 	void *dma_token;	
>> };
>>
>> But maybe that's fine. It's 40B -> 48B,
> 
> Alternatively we could the union point to a struct that has the dma buf
> pointer and a variable length array of dma_segs. Not sure if that would
> create a mess in the callers, though.

Iteration helpers adjust the pointer, so either it needs to store
the pointer directly in iter or keep the current index. It could rely
solely on offsets, but that'll be a mess with nested loops (where the
inner one would walk some kind of sg table).

>> and it'll get back to
>> 40 when / if xarray_start / ITER_XARRAY is removed.
> 
> Would it?  At least for 64-bit architectures nr_segs is the same size.

Ah yes

-- 
Pavel Begunkov

