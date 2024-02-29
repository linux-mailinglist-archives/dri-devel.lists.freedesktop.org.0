Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC1086CEA7
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 17:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7A510E501;
	Thu, 29 Feb 2024 16:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DogMyR0C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED0810E530
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 16:19:48 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-412bc3350d0so6454835e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 08:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709223586; x=1709828386;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nKHrtZmwyOrlCcM0w35Ivkjsc9tUNE5z7Bg/X3rDKss=;
 b=DogMyR0Co8Yi82ao7Fdw9Yb8AnpxmudI4S8MOA/rycP2LKoqFmysp/nDi6XB+iMYEN
 3PrCMTZ7xveLXp0lquEAwtkkEz83f93hf5WWbYqJxnvnu7NUFmHgmCEb5Y6NxpXI7i6r
 YNak8DDoyrZM+QaAC9iHZrTpTZsvcwTCrRJ9wZrWf6HkUw8OAZFb7ZZpT+9NpNIFuRHg
 gwCow0BLKO1LuKXIy04+FksSnlTj149RvaTmtFcI/k+AUihyX9Bz/2Cz/jPiIm2p1Yvg
 Mt7n101vQJdrg9zjgO/6pNNtv7cvQ7zPaavX4PpTlHagTJvl5efhj32sfOcwQOuPaNOD
 90JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709223586; x=1709828386;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nKHrtZmwyOrlCcM0w35Ivkjsc9tUNE5z7Bg/X3rDKss=;
 b=sJ40jEna4ffcTYb4I3kPbawwk15xAIk6Mm08ypxqmOC0Fh3qx75MYl8CquiglJn66Y
 E+RkAQUJi+8QR3cbczwxt9mLc/pID3o07+wgecFAtJVG/ZmsM7QY2JX+XT+GEXGrKHMI
 8/bTzmNI6Ch9zDVTTtbl4TZf5pCS0LX+GbuBaVknMaKXG3+xoqFVwWB6e/LDAlQNpe07
 sq5c5s81y9zKFUZLn7jbDpSIvfDB7DV2c66/1Sr8YcEnp70RktvABHxry0kdk+U6gign
 zcTz9RY41VF2vOPP03nfAGxxE0zC/o9BzRNGInU3hNxcI8NdZHP+DMBXPwVtxr1CF8al
 Xahg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHBuCT31PrlQA3JOACmchI08WMuPh+uAdgRj0a+s7o9t4ivepjknIr6EiljSan1PCmZZYlOfbo0wJYS9yKkxYwE41blr6OMYi3vHHtUVnY
X-Gm-Message-State: AOJu0Yy78a/07C5CVIV+PiptrYGmT8OeEwITnlIRjjB8tJ8KvvjL/DBi
 n7JA3IpZ8TtsiBOEVz/0FEEIzhuMplW6wiZS3tQ4/tSjTJOs443BsdbbjKC2bnI=
X-Google-Smtp-Source: AGHT+IFz2WCUYBX5DJhCdxNXuLRiVGh2lf1F8VKaJLGzdKH/fRHBW/9UoCpZpLLj2DjoM7c1e7WNMQ==
X-Received: by 2002:a05:600c:468c:b0:410:85ab:67f3 with SMTP id
 p12-20020a05600c468c00b0041085ab67f3mr2296654wmo.21.1709223586474; 
 Thu, 29 Feb 2024 08:19:46 -0800 (PST)
Received: from [192.168.1.70] ([84.102.31.43])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a05600c4fc300b0041297d7e181sm2476660wmq.6.2024.02.29.08.19.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 08:19:46 -0800 (PST)
Message-ID: <65250d0c-96c1-4eb0-adbf-1d3296a7cf36@baylibre.com>
Date: Thu, 29 Feb 2024 17:19:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: ethernet: ti: am65-cpsw: Add minimal XDP support
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240223-am65-cpsw-xdp-basic-v1-1-9f0b6cbda310@baylibre.com>
 <e382df16-c78a-448d-b6d5-39a627b30652@lunn.ch>
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <e382df16-c78a-448d-b6d5-39a627b30652@lunn.ch>
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

On 2/27/24 00:18, Andrew Lunn wrote:
>> +static struct sk_buff *am65_cpsw_alloc_skb(struct net_device *ndev, unsigned int len)
>> +{
>> +	struct page *page;
>> +	struct sk_buff *skb;
>> +
>> +	page = dev_alloc_pages(0);
> You are likely to get better performance if you use the page_pool.
>
> When FEC added XDP support, the first set of changes was to make use
> of page_pool. That improved the drivers performance. Then XDP was
> added on top. Maybe you can follow that pattern.
>
>        Andrew

Hello Andrew,

Thanks for this suggestion. I've been working on it over the last days.
I encountered issues and I begin to wonder if that's a good option for
this driver. Let me explain...

This device has 3 ports:
- Port0 is the host port (internal to the subsystem and referred as CPPI
in the driver).
- Port1 and 2 are the external ethernet ports.
Each port's RX FIFO has 1 queue.

As mentioned in page_pool documentation:
https://docs.kernel.org/networking/page_pool.html
"The number of pools created MUST match the number of hardware
queues unless hardware restrictions make that impossible. This would
otherwise beat the purpose of page pool, which is allocate pages fast
from cache without locking."

So, for this driver I should use 2 page pools (for port1 and 2) if possible.

But, if I I replace any alloc_skb() with page_pool_alloc() in the original
driver, I will have to create only 1 page_pool.
This is visible in am65_cpsw_nuss_common_open(), which starts with:
"if (common->usage_count) return 0;" to ensure that subsequent code
will be executed only once even if the 2 interfaces are ndo_open'd.
IOW, skbs will be allocated for only 1 RX channel. I checked that behavior,
and that's the way it works.
This is because the host port (CPPI) has only 1 RX queue. This single
queue is used to get all the packets, from both Ports and 2 (port ID is
stored in each descriptor).

So, because of this constraint, I ended up working on the "single
page pool" option.

Questions:
1) Is the behavior described above usual for ethernet switch devices ?
2) Given that I can't use a page pool for each HW queue, is it worth
using the page pool memory model ?
3) Currently I use 2 xdp_rxq (one for port1 and another one for port2).
If an XDP program is attached to port1, my page pool dma parameter
will need to be DMA_BIDIRECTIONAL (because of XDP_TX). As a result,
even if there is no XDP program attached to port2, the setting for page
pool will need to be DMA_BIDIRECTIONAL instead of DMA_FROM_DEVICE.
In such situation, isn't it a problem for port2 ?
4) Because of 1) and 2), will page pool performance really be better for
this driver ?

I'm not familiar with network devices, so it's possible that I misunderstand
some stuffs and I might have written things that are not correct or not
consistent. If so, do not hesitate to enlighten me. :)

Julien

