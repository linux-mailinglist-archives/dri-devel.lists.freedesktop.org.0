Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70187950890
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 17:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FAE210E37B;
	Tue, 13 Aug 2024 15:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QAUBmaqk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6289A10E37B
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 15:10:46 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a7ac469e4c4so899910966b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 08:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723561844; x=1724166644; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1DL27af2hm+nu7cPx2f4++LeZQVixre2oogzMUuwPfE=;
 b=QAUBmaqkLe3Vs/wbPQ+PnQdM57UqRE6wp+PDPUoycZDRXhO1/Q1VqXb2Zf/k+qmSln
 ESRnI0y7dD9s7NKq1wDdWZtevo1pBGb19FiYLp2Ewk7s8rcQS8LsAdNM62DeebFhtr/g
 AKvJgFUpXmZZkO80cdrEU+AuoR8mQe3mv3rlc3/M/SFpwfnwfO3OFDbOrNlbfiQFZIcA
 oNpJZSJ+DILIZXYvCYEcrvKPyVGueC0J7JpCEgh7bO1+zftmoYVmOpR10zYuJRNcZVie
 3uWQrrG4l0mfB463AdT+bGQtuwfr5ACRE0cXyxXrpAE/7mLlWe7eM/jxvFFeDkXhK1pO
 DJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723561844; x=1724166644;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1DL27af2hm+nu7cPx2f4++LeZQVixre2oogzMUuwPfE=;
 b=jPq/t/fe1j53QJ30G12UVK0MT9syJwRuvUwR9KxGXNoaAjJ3pokOMEjlePNQHnL2N5
 L3CknWm0UfWRsVoqLSLMchBHx0aqPa71OGr2yfeWF3ZX2Gl2w/U+CgciK/lpEkzxhFQY
 Li05FoM5RQspzMm6k5PilYVz5L0YEKOkuBPvk/7XiCfN6GSRPfqK4sKSL7a9WUvUdJXZ
 WqQw7vgRzewMcnzxCOKn8BWkCFG9v1vGbzDsQ2382cYC0LiMkg8zdKTHhSqxRdb/H+SB
 8Tnt14ndkyAZT6JZDordwjouTuiEEyDCUO1T+9dyxmvfZ1R5mC9grXQWVEAeJAgSoVaf
 25bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY3eY5AJi2YmD+q8uN0PHaJbi2zyyh2KnsrSopnrR5aF5TnaHdBIZdXV9hNowml1kWKHY1c0OD6e+bj0izAr1Rcj0rWGVL7YObeQLr69rT
X-Gm-Message-State: AOJu0Ywmc5q+VDUZTnI9Vd3xO41hwQeNwH1AzgF9nByisTsrC3DL+EWT
 V2wVjaeEFvI4iZkoWNMCveCkj3yhtxg1oCWTjYdknhQOkn+zWihu
X-Google-Smtp-Source: AGHT+IEgp9b07/X8lBe3DTl0aD8UgrdTViu9k66B0d84BfuLitHAtBI4O1Nbqhy82P2v7UD6nlULfg==
X-Received: by 2002:a17:907:3e13:b0:a6e:f869:d718 with SMTP id
 a640c23a62f3a-a836278bc29mr290666b.21.1723561844057; 
 Tue, 13 Aug 2024 08:10:44 -0700 (PDT)
Received: from [192.168.42.131] (82-132-214-244.dab.02.net. [82.132.214.244])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f414e18csm77141966b.177.2024.08.13.08.10.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 08:10:43 -0700 (PDT)
Message-ID: <6a779dbb-ad3a-47cf-bb8e-1a50732a9694@gmail.com>
Date: Tue, 13 Aug 2024 16:11:15 +0100
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
 <5a51b11d-9c35-42a5-879b-08dc7ca2ca18@gmail.com>
 <20240813073917.690ac1cc@kernel.org>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20240813073917.690ac1cc@kernel.org>
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

On 8/13/24 15:39, Jakub Kicinski wrote:
> On Tue, 13 Aug 2024 03:31:13 +0100 Pavel Begunkov wrote:
>> I'm getting lost, so repeating myself a bit. What I think
>> would be a good approach is if we get an error back from
>> the driver if it doesn't support netiov / providers.
>>
>> netdev_rx_queue_restart() {
>> 	...
>> 	err = dev->queue_mgmt_ops->ndo_queue_mem_alloc();
>> 	if (err == -EOPNOTSUPP) // the driver doesn't support netiov
>> 		return -EOPNOTSUPP;
>> 	...
>> }
>>
>> That can be done if drivers opt in to support providers,
>> e.g. via a page pool flag.
>>
>> What I think wouldn't be a great option is getting back a
>> "success" from the driver even though it ignored
> 
> page pool params are not the right place for a supported flag.
> Sooner or later we'll want to expose this flag to user space.

Fair enough, it appeared to me that's what you was suggesting

"What comes to mind is adding an "I can gobble up net_iovs from this
pool" flag in page pool params (the struct that comes from the driver),
and then on the installation path we can check ..."

We can also move it from pp flags to queue API callbacks, however if we
want to expose it to the userspace, I'd imagine we need a queue flag set
by the driver, which then can be queried by netlink or whichever
interface is appropriate. And it can be used can be used to fail
netdev_rx_queue_restart() for queues/drivers that don't support mp.

netdev_rx_queue_restart() {
	if (rxq->mp_params && !rxq->netiov_supported)
		fail;
}

Perhaps, I don't understand what approach you contemplate, but
maybe Mina has cracked it.

-- 
Pavel Begunkov
