Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1AA952009
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 18:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D0310E4E0;
	Wed, 14 Aug 2024 16:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aR8H+AjA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D473410E4E0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 16:32:21 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-530c2e5f4feso54736e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 09:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723653140; x=1724257940; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XTCAOV20GrU8xBJx9WKou5vLVJxQ1GrhVTpUqnVjmNE=;
 b=aR8H+AjA27+GN1RcZ8EQjrdyjb/70yGMXXuubQ+wYcSIhkJrwYgfefyFlcCmRO2jWI
 pbF6AotuRCEW17aIXsIeRlZFNweNqLhe7I0prmmnngWCukAwPQ/swSLPKhP6Hh6XKkM6
 0ugyJ7YGfcLVLU2dZfDfY95wRqJjwoaQI6v8OwrilDDZsvE0j3ZBzkUiAwXrShKxLNlS
 Ed5IdnzIhqJInAR4Tud2hJ+A6rLhUdSmWXXJCq9W5BusBCWpqddnw4Y4aUhFFNrLKrwy
 QsrSVRuTHmx1Ln4BqGSC2vThJGuzY9ceK7XZYy9VRYvSlVKbPCnY3mmekja8fG6OTj5Q
 TTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723653140; x=1724257940;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XTCAOV20GrU8xBJx9WKou5vLVJxQ1GrhVTpUqnVjmNE=;
 b=EpjSlJ69HQRgivrF4RkMNhaicdquX6IRbySjm4OycYnBXt733vBDNChBfi0E2lwZni
 bMCdDOBYJiKP2iP55zsU2hZfa0+TlYVc5UYFvfXelw92iUQp6Pk1OI3gcW7hrcU0y8iy
 5a7l6fVzTjTYVD1yKDO7wYFbGKP/bYNrn6++XxOnfH17Evbxwk68ZhByGdLWXuBv8aDQ
 kvc8hHYScwdktEtFj5yoSsSbRAL8PcU25jonjyUsGArr56I0xIHc4Sp+lVq+fAjBNbHL
 pajADs8P0pzS0G8kxZVfQ/VX2UWX09g4E+dvdW8FBELIR8FUtA0DQljeQYcFGsizKFS+
 kT9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5KvwZTu2ztLs0T5whiaAVYeA9fjwvyLnz5erQL21BaBc8dDmkI9lo++S8vMZreskZcicer209GyQLzIx8pv83O72tChrSyHtrOWtcZ2J7
X-Gm-Message-State: AOJu0Yzwyz1+iP15qSrtiCZiy5Ttow0bq3ykGDLaqRKfGlZXUXGkez86
 0a+C5iqDnptSAhhI1rS8u+1RfmYObbS0QnfBpNIE99EWGa8dx2ll
X-Google-Smtp-Source: AGHT+IG1OcUonTWO2TkZc8GvJrIyRfaMJbCVw3drbEbspP8zXw7W0KJpdlEqWQzWaQW8BC3FvJoGpg==
X-Received: by 2002:a05:6512:250c:b0:533:809:a94d with SMTP id
 2adb3069b0e04-5330809ac40mr139202e87.17.1723653138952; 
 Wed, 14 Aug 2024 09:32:18 -0700 (PDT)
Received: from [192.168.42.227] ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f414afe2sm192927466b.144.2024.08.14.09.32.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 09:32:18 -0700 (PDT)
Message-ID: <31640ff4-25a6-4115-85e6-82092ce57393@gmail.com>
Date: Wed, 14 Aug 2024 17:32:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v19 06/13] memory-provider: dmabuf devmem memory
 provider
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
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
 Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>,
 David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
References: <20240813211317.3381180-7-almasrymina@google.com>
 <de7daf80-a2e4-4451-b666-2a67ccc3649e@gmail.com>
 <CAHS8izPMC+XhXKbJOQ3ymizyKuARSOv_cO_xO+q1EG4zoy6Gig@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izPMC+XhXKbJOQ3ymizyKuARSOv_cO_xO+q1EG4zoy6Gig@mail.gmail.com>
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

On 8/14/24 15:55, Mina Almasry wrote:
> On Wed, Aug 14, 2024 at 10:11 AM Pavel Begunkov <asml.silence@gmail.com> wrote:
> ...
>>> diff --git a/net/core/devmem.c b/net/core/devmem.c
>>> index 301f4250ca82..2f2a7f4dee4c 100644
>>> --- a/net/core/devmem.c
>>> +++ b/net/core/devmem.c
>>> @@ -17,6 +17,7 @@
>>>    #include <linux/genalloc.h>
>>>    #include <linux/dma-buf.h>
>>>    #include <net/devmem.h>
>>> +#include <net/mp_dmabuf_devmem.h>
>>>    #include <net/netdev_queues.h>
>>>
>>>    #include "page_pool_priv.h"
>>> @@ -153,6 +154,10 @@ int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
>>>        if (err)
>>>                goto err_xa_erase;
>>>
>>> +     err = page_pool_check_memory_provider(dev, rxq, binding);
>>
>> Frankly, I pretty much don't like it.
>>
>> 1. We do it after reconfiguring the queue just to fail and reconfigure
>> it again.
>>
> 
> I don't see an issue with that? Or is it just me?

Not a bug, just over excessive harassing of the interface,
which can be easily be avoided.


>> 2. It should be a part of the common path like netdev_rx_queue_restart(),
>> not specific to devmem TCP.
>>
>> These two can be fixed by moving the check into
>> netdev_rx_queue_restart() just after ->ndo_queue_mem_alloc, assuming
>> that the callback where we init page pools.
>>
> 
> The only reason is that the page_pool_check_memory_provider() needs to
> know the memory provider to check for. Separating them keep
> netdev_rx_queue_restart() usable for other future use cases that don't
> expect a memory provider to be bound, but you are correct in that this
> can be easily resolved by passing the binding to
> netdev_rx_queue_restart() and doing the
> page_pool_check_memory_providers() check inside of that function.

It's already passed inside the queue.

netdev_rx_queue_restart() {
	if (rxq->mp_params && !rxq->netiov_supported)
		fail;
}

>> 3. That implicit check gives me bad feeling, instead of just getting
>> direct feedback from the driver, either it's a flag or an error
>> returned, we have to try to figure what exactly the driver did, with
>> a high chance this inference will fail us at some point.
>>
> 
> This is where I get a bit confused. Jakub did mention that it is
> desirable for core to verify that the driver did the right thing,
> instead of trusting that a driver did the right thing without
> verifying. Relying on a flag from the driver opens the door for the
> driver to say "I support this" but actually not create the mp
> page_pool. In my mind the explicit check is superior to getting
> feedback from the driver.

You can apply the same argument to anything, but not like
after each for example ->ndo_start_xmit we dig into the
interface's pending queue to make sure it was actually queued.

And even if you check that there is a page pool, the driver
can just create an empty pool that it'll never use. There
are always ways to make it wrong.

Yes, there is a difference, and I'm not against it as a
WARN_ON_ONCE after failing it in a more explicit way.

Jakub might have a different opinion on how it should look
like, and we can clarify on that, but I do believe it's a
confusing interface that can be easily made better.

> Additionally this approach lets us detect support in core using 10
> lines of code or so, rather than ask every driver that wants to
> support mp to add boilerplate code to declare support (and run into
> subtle bugs when this boilerplate is missing). There are minor pros

Right, 10 lines of some odd code, which not even clear off the
bat why it's there if we get an error code from the restart /
callbacks, vs one line of "boilerplate" per driver a la

rxq->netiov_supported = true;

that can be added while implementing the queue api. If it's
missing the user gets back not a subtle error.


> and cons to each approach; I don't see a showstopping reason to go
> with one over the other.
> 
>> And page_pool_check_memory_provider() is not that straightforward,
>> it doesn't walk through pools of a queue.
> 
> Right, we don't save the pp of a queue, only a netdev. The outer loop
> checks all the pps of the netdev to find one with the correct binding,
> and the inner loop checks that this binding is attached to the correct
> queue.

That's the thing, I doubt about the second part.

net_devmem_bind_dmabuf_to_queue() {
	err = xa_alloc(&binding->bound_rxqs, &xa_idx, rxq);
	if (err)
		return err;

	netdev_rx_queue_restart();

	// page_pool_check_memory_provider
	...
	xa_for_each(&binding->bound_rxqs, xa_idx, binding_rxq) {
		if (rxq == binding_rxq)
			return success;
}

Can't b4 the patches for some reason, but that's the highlight
from the patchset, correct me if I'm wrong. That xa_for_each
check is always true because you put the queue in there right
before it, and I don't that anyone could've erased it.

The problem here is that it seems the ->bound_rxqs state doesn't
depend on what page pools were actually created and with what mp.

So if you try to add a binding to 2 queues of the same interface,
the first succeeds and the second silently fails, then the
following net_devmem_bind_dmabuf_to_queue() for the second queue
will say that everything is fine, because there is a pool for
the first queue with the binding and the queue check is just
true.

>> Not looking too deep,
>> but it seems like the nested loop can be moved out with the same
>> effect, so it first looks for a pool in the device and the follows
>> with the bound_rxqs. And seems the bound_rxqs check would always turn
>> true, you set the binding into the map in
>> net_devmem_bind_dmabuf_to_queue() before the restart and it'll be there
>> after restart for page_pool_check_memory_provider(). Maybe I missed
>> something, but it's not super clear.
>>
>> 4. And the last thing Jakub mentioned is that we need to be prepared
>> to expose a flag to the userspace for whether a queue supports
>> netiov. Not really doable in a sane manner with such implicit
>> post configuration checks.
>>
> 
> I don't see a very strong reason to expose the flag to the userspace

I'll leave that for Jakub to answer

> now. userspace can try to bind dmabuf and get an EOPNOTSUPP if the
> operation is not supported, right? In the future if passing the flag
> to userspace becomes needed for some usecase, we do need feedback from
> the driver, and it would be trivial to add similarly to what you
> suggested.

Doable, since it wouldn't change the user api, but that means
refactoring millions drivers (ok, ok, 4-5) instead of preparing
for it from the beginning.

>> And that brings us back to the first approach I mentioned, where
>> we have a flag in the queue structure, drivers set it, and
>> netdev_rx_queue_restart() checks it before any callback. That's
>> where the thread with Jakub stopped, and it reads like at least
>> he's not against the idea.
> 
> Hmm, the netdev_rx_queue array is created in core, not by the driver,
> does the driver set this flag during initialization? We could run into
> subtle bugs with races if a code path checks for support after core
> has allocated the netdev_rx_queue array but before the driver has had
> a chance to declare support, right? Maybe a minor issue. Instead we

Which is fine, it'd just fail, how are we going to attach to a
queue that hasn't been initialised by the driver yet. Regardless,
I doubt we expose the interface before the driver has a chance
to init it, but I'd need to look it up (or defer to Jakub) to
say for sure.

> could add an ndo to the queue API that lets the driver tell us that it
> could support binding on a given rx queue, and check that in
> net_devmem_bind_dmabuf_to_queue() right before we do the bind?
> 
> But this is only if declaring support to userspace becomes needed for
> some use case. At the moment I'm under the impression that verifying
> in core that the driver did the right thing is preferred, and I'd like
> to minimize the boilerplate the driver needs to implement if possible.
> 
> Additionally this series is big and blocks multiple interesting follow
> up work; maybe going forward with an approach that works - and can
> easily be iterated on later if we run into issues - could be wise. I
> do not see an issue with adding a driver signal in the future (if
> needed) and deprecating the core check (if needed), right?

-- 
Pavel Begunkov
