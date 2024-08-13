Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D5394FBC4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 04:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE8610E186;
	Tue, 13 Aug 2024 02:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GjnNYJCR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0AC910E1F4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 02:30:47 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-428163f7635so39103825e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 19:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723516246; x=1724121046; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XKrMThMFjWs/aD3lNtT8IXEfZvkhz9Tsh1qYW/MU/qc=;
 b=GjnNYJCRFU1vKMuEY1Q4We9U4ci95Zl27M5RtfaMg8vcYee7oPscHvht59S3Cmg+/Y
 FR3RGxsWeE4pktySrJZC/W29f9rzBawf31Kj6dYHJbfz3YsvgVGgExukBcSCySJ46S5l
 Lw/V7VVwYY677sHeRSYtC67ENDVrrXjujN8CKwvK6z9fl2uGYn7cXFaYNt6F8VH13NEe
 /GYa2oEkvQUHUW2f1waYplMxXaKlm4hp0fE7vnYPEZ/lqR3KGJWg9GSAO4mZp3UXwmml
 hKJDnNPvSMXG0qGOzBH+dpMFTsz3ZMwCg6uvbFJpsmlvmKcFOrdQqlKCrw9xu3PYxSzD
 wyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723516246; x=1724121046;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XKrMThMFjWs/aD3lNtT8IXEfZvkhz9Tsh1qYW/MU/qc=;
 b=OTl/pOz8aXa3cIyU+zQpKVMvJAq5RX7rRHqEwhcHayBUxj9NRjVfq1Tg/2+0IxPP3u
 PFESc8gJ7+d0Z+rrq5brfMIO3qcEci4y+VroTUnSx1HV88TbDPA23+nZEta3bZ0il2TM
 BYKffEFJgysDMY+49hGFaZCiNdyriZcWuXiDElNMg+NkTRVcvIT/rQ7+JTTEi5ZmieVU
 mNFuyIFV2xouHl74S0Sa7W+n+ztOhlIoVpPnbVlaoHzZ/0V5ZHPtrAiaXtZTXkETLrxV
 loWzsECCIQ4gsiyyknELMLC/D76i1Ri0orkZnUTT2ftdfMPtB32HgHCXlhr2+Wwcqvdb
 wpiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6WynzM7VRkuWSuxuPto88j+Mh/+UTcCNaZXOt/Ob3n43kzluqR/5UfXqHoG0OLQWqsRhlGwq2V1YU6nDqXdyRPYjR94TIM8iSt688XX3N
X-Gm-Message-State: AOJu0YwaaN2/LsyM+wR03v5AMmsHPRNCTgdtWC4qrSQ/bWFPz+uRS5d0
 d5VMzM7KBeRtKQVLY0LcgCQYTw/CAr9GD7xvnsqPpPb5ibj1U8kL
X-Google-Smtp-Source: AGHT+IFcGtH1OGYfYfxBsWgRvAXHGpU7ZE/PdqDWYMcWWlG30R+CNhYXxUTKsBTiy9zS5HWhRnTsbg==
X-Received: by 2002:a05:600c:450d:b0:428:14b6:ce32 with SMTP id
 5b1f17b1804b1-429d480c40emr16491485e9.9.1723516245973; 
 Mon, 12 Aug 2024 19:30:45 -0700 (PDT)
Received: from [192.168.42.116] ([85.255.232.227])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4290c738e01sm204324535e9.11.2024.08.12.19.30.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 19:30:45 -0700 (PDT)
Message-ID: <5a51b11d-9c35-42a5-879b-08dc7ca2ca18@gmail.com>
Date: Tue, 13 Aug 2024 03:31:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v18 07/14] memory-provider: dmabuf devmem memory
 provider
To: Jakub Kicinski <kuba@kernel.org>
Cc: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Donald Hunter <donald.hunter@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>,
 David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
References: <20240805212536.2172174-1-almasrymina@google.com>
 <20240805212536.2172174-8-almasrymina@google.com>
 <20240806135924.5bb65ec7@kernel.org>
 <CAHS8izOA80dxpB9rzOwv7Oe_1w4A7vo5S3c3=uCES8TSnjyzpg@mail.gmail.com>
 <20240808192410.37a49724@kernel.org>
 <CAHS8izMH4UhD+UDYqMjt9d=gu-wpGPQBLyewzVrCWRyoVtQcgA@mail.gmail.com>
 <fc6a8f0a-cdb4-4705-a08f-7033ef15213e@gmail.com>
 <20240809205236.77c959b0@kernel.org>
 <CAHS8izOXwZS-8sfvn3DuT1XWhjc--7-ZLjr8rMn1XHr5F+ckbA@mail.gmail.com>
 <48f3a61f-9e04-4755-b50c-8fae6e6112eb@gmail.com>
 <20240812105732.5d2845e4@kernel.org>
 <CAHS8izPb51gvEHGHeQwWTs4YmimLLamau1c4j=Z4KGM8ZJrx5g@mail.gmail.com>
 <a6747b29-ed79-49d4-9ffe-b62074db1e09@gmail.com>
 <20240812165708.33234ed6@kernel.org>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20240812165708.33234ed6@kernel.org>
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

On 8/13/24 00:57, Jakub Kicinski wrote:
> On Mon, 12 Aug 2024 20:10:39 +0100 Pavel Begunkov wrote:
>>> 1. Drivers need to be able to say "I support unreadable netmem".
>>> Failure to report unreadable netmem support should cause the netlink
>>> API to fail when the user tries to bind dmabuf/io uring memory.
>>>
>>> 2. Drivers need to be able to say "I want a header pool (with readable
>>> netmem)" or "I want a data pool (potentially with unreadable netmem)".
>>>
>>> Pavel is suggesting implementing both of these in 2 different flags.
>>>
>>> Jakub is suggesting implementing both with 1 flag which says "I can
>>> support unreadable netmem for this pool" , and guarding against #1
>>> with a refcount check to detect if a dmabuf pool should have been
>>> created but wasn't.
>>
>> That would be iffy IIUC, but I think Jakub just explicitly said
>> that the refcount trick was just for debugging purposes and not
>> for gauging errors like "providers are not supported by the driver".
>>
>> "Yup, the refcount (now: check of the page pool list) was meant
>> as a WARN_ONCE() to catch bad drivers."
> 
> Sorry, insufficient caffeine level in the morning.
> We can't WARN_ONCE(), indeed.

I'm getting lost, so repeating myself a bit. What I think
would be a good approach is if we get an error back from
the driver if it doesn't support netiov / providers.

netdev_rx_queue_restart() {
	...
	err = dev->queue_mgmt_ops->ndo_queue_mem_alloc();
	if (err == -EOPNOTSUPP) // the driver doesn't support netiov
		return -EOPNOTSUPP;
	...
}

That can be done if drivers opt in to support providers,
e.g. via a page pool flag.

What I think wouldn't be a great option is getting back a
"success" from the driver even though it ignored

netdev_rx_queue_restart() {
	...
	err = dev->queue_mgmt_ops->ndo_queue_mem_alloc();
	if (err)
		return err;

	// we get err==0 even if the driver doesn't support
	// providers, verify it is _actually_ installed
	if (rxq->mp_params) {
		// or walking pp list, same thing
		if (rxq->mp_params->refcount == 0)
			goto fail;
	}
}

And if we go with the first version, the refcount check can
also be added but as a warning. Maybe it's easier to put it
into code and discuss then.

-- 
Pavel Begunkov
