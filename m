Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B0E8B7715
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 15:31:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3450A10E511;
	Tue, 30 Apr 2024 13:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="chr0y4Ci";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328F010E511
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 13:31:21 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a5878caeb9eso704792766b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 06:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714483879; x=1715088679; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sQkyBn4Lnt15qpQKjjn6/FTdXdojZaggT0oJDgNx33c=;
 b=chr0y4CiIvS5v4aDqfl+c9lOnqsEz9gTtcNVV6rmO8AG5fgqb91w2efr1rhQw9jtLB
 o48LB83pYcHE1G/qJbHhYskyOok1ooChgpZOrcT+nbB+Rub/8/VT/+gyAN92H0AcWBcd
 XKE8a8WI1LJETetF1eKEfT3MrftdzDzPz1kvLbbuzZcchURLGHFLL1ZgjZXDOAcKsTsU
 2UYp12WYbmW/1YpNsV16hxWL2w9lVunnRm6c6GG9qc9SrqNG9CIpghJabYWtQe2RSfIs
 FYCIrjPjc4xcvU6WU/wqwNgYnzpdnBbN6ONp2yIA+96ezkyLB+fa7OiIkLjLbIofWcSu
 UP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714483879; x=1715088679;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sQkyBn4Lnt15qpQKjjn6/FTdXdojZaggT0oJDgNx33c=;
 b=up6DqHHuEgFzgfUy74XaILRk0UhTbIz7EYtLCc7TTdVQrCm2CH0UsbblASEdxAP1Wn
 6VLz69SULKCNviJcWN22yZR+qRutVUKugMnHyS6jhdVC224Nq03dTm2hauDgyDDvIOf/
 XZZGVL7BD6CxbJVid4q9DdNP677bl2MEI6cgG7+BfR2m2dMDfAuuL+mgQfldeJXaGC+V
 yPSGuT5EGbSq7pZZmf/a2nkJy8XeDAF8YEBTD5OboZK4xKQ3q9wlic6gtucWkjtQod4u
 wIwOt6IEpAXYls7tKYmhA4AT4YBPcHZnpLzzCtkghpuohBnkw8uMAsVeYnNSKnQUl20e
 OblQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFPMFxA43uFKltq1/f7Kxeui8TJYVPwIibBKiIYrBQ1sjDERu089/3CslUm1UrvdI9/mAS07sHpi0b/wgJTYNgGLiDQdhLuuTGbe2y91hn
X-Gm-Message-State: AOJu0YzapWeGQiTP5cjGHIQqtZ2rsIdPCzbVIBue+S6du/kF6yqcyiHJ
 CLsQPDLH5BkFNbus4EV4oii4yvQZB2eZZpfgzfLn1ORl+cg1gFP7
X-Google-Smtp-Source: AGHT+IG4D9H/56/A4rQ0pU5al3G+zQuIMq1mBSgq9KUwXS9Rk/+kL4o0ZAf4JvbTFbHU0G4DNFxL/g==
X-Received: by 2002:a17:906:fb17:b0:a58:e74b:7e16 with SMTP id
 lz23-20020a170906fb1700b00a58e74b7e16mr2032608ejb.46.1714483879081; 
 Tue, 30 Apr 2024 06:31:19 -0700 (PDT)
Received: from [192.168.42.188] ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a17090615c900b00a555be38aaasm15011385ejd.164.2024.04.30.06.31.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 06:31:18 -0700 (PDT)
Message-ID: <35a79edf-e4ca-4501-99ad-231a3ab2b216@gmail.com>
Date: Tue, 30 Apr 2024 14:31:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next v8 07/14] page_pool: devmem support
To: Mina Almasry <almasrymina@google.com>, David Wei <dw@davidwei.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
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
 Breno Leitao <leitao@debian.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>
References: <20240403002053.2376017-1-almasrymina@google.com>
 <20240403002053.2376017-8-almasrymina@google.com>
 <8357256a-f0e9-4640-8fec-23341fc607db@davidwei.uk>
 <CAHS8izPeYryoLdCAQdGQU-wn7YVdtuofVKNvRFjFjhqTDsT7zA@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izPeYryoLdCAQdGQU-wn7YVdtuofVKNvRFjFjhqTDsT7zA@mail.gmail.com>
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

On 4/27/24 03:11, Mina Almasry wrote:
> On Fri, Apr 26, 2024 at 5:18 PM David Wei <dw@davidwei.uk> wrote:
>>
>> On 2024-04-02 5:20 pm, Mina Almasry wrote:
>>> @@ -69,20 +106,26 @@ net_iov_binding(const struct net_iov *niov)
>>>    */
>>>   typedef unsigned long __bitwise netmem_ref;
>>>
>>> +static inline bool netmem_is_net_iov(const netmem_ref netmem)
>>> +{
>>> +#if defined(CONFIG_PAGE_POOL) && defined(CONFIG_DMA_SHARED_BUFFER)
>>
>> I am guessing you added this to try and speed up the fast path? It's
>> overly restrictive for us since we do not need dmabuf necessarily. I
>> spent a bit too much time wondering why things aren't working only to
>> find this :(
> 
> My apologies, I'll try to put the changelog somewhere prominent, or
> notify you when I do something that I think breaks you.
> 
> Yes, this is a by-product of a discussion with regards to the
> page_pool benchmark regressions due to adding devmem. There is some
> background on why this was added and the impact on the
> bench_page_pool_simple tests in the cover letter.
> 
> For you, I imagine you want to change this to something like:
> 
> #if defined(CONFIG_PAGE_POOL)
> #if defined(CONFIG_DMA_SHARED_BUFFER) || defined(CONFIG_IOURING)
> 
> or something like that, right? Not sure if this is something I should

Feels a bit flimsy, if the argument is that you want to be able
to disable netmem overhead, then adding a netmem config option
sounds like a better way forward.

I have doubts this conditional handling is desirable in the first
place, but perhaps I missed the discussion.

> do here or if something more appropriate to be in the patches you
> apply on top.
> 
> I additionally think you may also need to run the
> page_pool_benchmark_simple tests like I do in the cover letter to see
> if you're affecting those.

-- 
Pavel Begunkov
