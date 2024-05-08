Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1FE8C01B6
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 18:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31ED710FCA4;
	Wed,  8 May 2024 16:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aVlxv+X8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96EBC10FAE8
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 16:13:38 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-51f40b5e059so5442499e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 09:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715184817; x=1715789617; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8f/oNkLNRVDgyHz7SZX/CbDK9NIee4eeJWH9FsmJVO4=;
 b=aVlxv+X8ZpgdCMgg9NETy783jMsN71w1mdYZYdqH43pZy5PvJmibMzwSfcTNra5WTB
 bfrnOjUBLgWCiv3mdd0NJAwEFS7Q/laNoVGCeZ89ZwFNYovdRM4DWaG3hXfRUimqLVqE
 m7cPn3hhMJIa4D1gtoO0AOp0bfqM5EpdFKCfK+2nHTK6ie83dG0E/dIaMjc281iMwA1J
 bXI6KI52PUdCqfALe5RMYdiKli5C9hlujdGs4Dthx0DIpu02IV0tu3Grncsig2T8AjPl
 X5jb6TQdICKfkU90djJAORxlMYb2Sz1xWbu3/eKnjK9AhWA5IeEDyYgy8w5fTQKYHGoK
 l7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715184817; x=1715789617;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8f/oNkLNRVDgyHz7SZX/CbDK9NIee4eeJWH9FsmJVO4=;
 b=Zxov8wKqOLjJpAez8C06PNE8r8xZlS7n3T9F7ZPl0IvKg8aja5GXwvZAEW8+3nm2yI
 OWayEoDEeoaSlhzt3fbJy5rqQ8tA4C2F2O6fjnjYgjTZg0dJTCJwxoT8r3g8Zy3JcWLq
 5dELKKcd/E/2ZYPxwtZY7yIhVbLcTp4fJ/Ch9P5Q+nK4SwY8ZRFKg59jlKUpjdOCx6fD
 E1OIDHKD6F5rQg/vCa8GdI8/Ufcsl9jEwb9M2fgrHHcH0mwtClnlyXpzvl32eYJkffPd
 40dNDbRtr38AKCcvu2pC+PhK3A2ZYwnPl4N58kkUBTJA7WWuh9xL3AW1JxMb+FuNp/Zg
 ORMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV/m5s732xuFIQSSFeHXbTr/6yxwgfs+cki2mxUKZr1P3JOk55e1TowvCKiM9IEGV/nwANrQUZZ8D3F2t6fEQ072RQvMeuL02kh1y98AdN
X-Gm-Message-State: AOJu0YzoQjDV8HoTGpOO8NRPg2eCRKxvgRkBMh0K0nWHpTiynZMxhLwZ
 C+zhUMApSaeP8FWpnkWe81X+KlsV7R6sTiYVGN0G6dkaIM5hTLED
X-Google-Smtp-Source: AGHT+IGOsGKTobWTIXaEhASc0QNiWa87Ncv1n8+a1K7thxeRTWIrU67BwG7R0FIWXrNbhbARcUS18g==
X-Received: by 2002:a05:6512:3da6:b0:51b:f78d:c189 with SMTP id
 2adb3069b0e04-5217c3707fdmr2707077e87.14.1715184816352; 
 Wed, 08 May 2024 09:13:36 -0700 (PDT)
Received: from [192.168.42.40] ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 my37-20020a1709065a6500b00a59ae892a68sm5208655ejc.167.2024.05.08.09.13.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 May 2024 09:13:35 -0700 (PDT)
Message-ID: <710dfcb5-8489-446d-a230-0e01828dfc58@gmail.com>
Date: Wed, 8 May 2024 17:13:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next v8 02/14] net: page_pool: create hooks for
 custom page providers
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Mina Almasry <almasrymina@google.com>,
 Christoph Hellwig <hch@infradead.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
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
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert
 <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Amritha Nambiar <amritha.nambiar@intel.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Alexander Mikhalitsyn <alexander@mihalicyn.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>, Christian Brauner <brauner@kernel.org>,
 Simon Horman <horms@kernel.org>, David Howells <dhowells@redhat.com>,
 Florian Westphal <fw@strlen.de>, Yunsheng Lin <linyunsheng@huawei.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Jens Axboe <axboe@kernel.dk>,
 Arseniy Krasnov <avkrasnov@salutedevices.com>,
 Aleksander Lobakin <aleksander.lobakin@intel.com>,
 Michael Lass <bevan@bi-co.net>, Jiri Pirko <jiri@resnulli.us>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Richard Gobert <richardbgobert@gmail.com>,
 Sridhar Samudrala <sridhar.samudrala@intel.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Johannes Berg <johannes.berg@intel.com>, Abel Wu <wuyun.abel@bytedance.com>,
 Breno Leitao <leitao@debian.org>, David Wei <dw@davidwei.uk>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
References: <ZjpVfPqGNfE5N4bl@infradead.org>
 <CAHS8izPH+sRLSiZ7vbrNtRdHrFEf8XQ61XAyHuxRSL9Jjy8YbQ@mail.gmail.com>
 <20240507164838.GG4718@ziepe.ca>
 <0d5da361-cc7b-46e9-a635-9a7a4c208444@gmail.com>
 <20240507175644.GJ4718@ziepe.ca>
 <6a50d01a-b5b9-4699-9d58-94e5f8f81c13@gmail.com>
 <20240507233247.GK4718@ziepe.ca>
 <54830914-1ec9-4312-96ad-423ac0aeb233@gmail.com>
 <20240508142530.GR4718@ziepe.ca>
 <6f69694b-4281-45a6-92aa-d9d72b918df2@gmail.com>
 <20240508155813.GS4718@ziepe.ca>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20240508155813.GS4718@ziepe.ca>
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

On 5/8/24 16:58, Jason Gunthorpe wrote:
> On Wed, May 08, 2024 at 04:44:32PM +0100, Pavel Begunkov wrote:
> 
>>> like a weird and indirect way to get there. Why can't io_uring just be
>>> the entity that does the final free and not mess with the logic
>>> allocator?
>>
>> Then the user has to do a syscall (e.g. via io_uring) to return pages,
>> and there we'd need to care how to put the pages efficiently, i.e.
>> hitting the page pool's fast path, e.g. by hoping napi is scheduled and
>> scheduled for the CPU we're running on, or maybe transferring the pages
>> to the right CPU first.
>>
>> Compare it with userspace putting pages into a ring, and the allocator
>> taking from there when needed without any extra synchronisation and
>> hassle just because it's a sole consumer.
> 
> Wow, that sounds a bit terrifying for security, but I guess I can see
> your point.

Mind elaborating about security? "No synchronisation" is for grabbing
from the ring, it's napi exclusive, but it does refcounting to make sure
there are no previous net users left and the userspace doesn't try
anything funny like returning a page twice. And it's not even a page
but rather a separately refcounted buffer represented by an offset
from the userspace POV. It doesn't even have to be page sized, hw
benefits from smaller chunks.

> You are replacing the whole allocator logic if you are effectively
> putting the free list in userspace memory.
> 
> Jason

-- 
Pavel Begunkov
