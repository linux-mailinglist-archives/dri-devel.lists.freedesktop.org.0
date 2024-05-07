Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 895BC8BE82B
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 18:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B743C10F673;
	Tue,  7 May 2024 16:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nQYHRvmn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2131A10F673
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 16:05:08 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2dcc8d10d39so37140111fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 09:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715097907; x=1715702707; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PSQgqNCjfPNhMe7ojJ0nUJfRe4KU5PbZ7UhYGgtrTLA=;
 b=nQYHRvmn2uqyzLOq6I4sMAOjI65AM3u0nE3BHaAzPkZymagFk1rT+czDYv58gTNaoZ
 BREM3eHXGYj2dqR/DJ4+c2mqK3jGra9RGsTtn48SYCqL9wYVrGvJoWgvJlatNB20XZvB
 j7tR/lGiczYbGXwuGaiJxfmVKqaCDBKcaJf3JGw1rh5J1aYG8JpSJVAqlTgSIAGTffa5
 b6lBjWqfKuVmyZDVLRPgPLSI1RuK8Kki4tSQaoZMzBBk1iq5TaCWc+Pq09GrVmNHyRXF
 ayCtRR24aoaSzCbpEsYIQNUQsqo45Zv4e1kNY5v1NyD80haKOlPF27TXach4b/dLrviu
 IlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715097907; x=1715702707;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PSQgqNCjfPNhMe7ojJ0nUJfRe4KU5PbZ7UhYGgtrTLA=;
 b=k2aXTTMWMYddXqJWn1NumGhubHclb/DgIC0i2eqwc9EEv/r43DVihPNITUz7wzXvu/
 vmxve7DucMzKWiXUdRGAkLRHWd3iP6LSeV3VKVlNn+/E2NX7sVYfc7yPsUkJ7aC9Bc8s
 1acUf9TwGq450wxhw97c0fO6GDtJptGIE28n48wKa+T6RMtJzP6+m+BLt3R/1sj9skM3
 8fRYkRTlnZ1Fr7BQKe1fuUUQZ4qA2L8dBkthJrStUxmT9f0hTvoJKT4IRQO6bnED7e6G
 8dS7nixZlFQYA2QoymUqEVr5k1vsx7G+EmaS07nAKHX46noQX1GG0x3R2xTRthyqvuXe
 +GBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdQIhh1a4tMTGqs/KTPZ9YwsWwFb26FdGUAyYpxqYOcRbC/SprA2+mNHf7ATJO6tFX8RyVS9F2cJ8bIzMNO++CkxU6eOC25bVoaew3h8uP
X-Gm-Message-State: AOJu0YxyRJwzKRnGGA4oKK75w5LhAttd+tUEc+sLzotjsOA/ctmw/lch
 zMKl3iWuhhYbEvUPlkwSJjUFaCXCSiFTFsF0XbkJNP8R2ljZoA8Y
X-Google-Smtp-Source: AGHT+IGNn8GJzZkbQWg++AR3CoLJpjM4EU80rGYnW6RmraNNFb9jJOD55eI48eU1CcAelZqaFIYOUA==
X-Received: by 2002:a2e:bc13:0:b0:2da:9ed:9b43 with SMTP id
 38308e7fff4ca-2e447085614mr353561fa.31.1715097906664; 
 Tue, 07 May 2024 09:05:06 -0700 (PDT)
Received: from [192.168.42.69] ([85.255.235.91])
 by smtp.gmail.com with ESMTPSA id
 bd13-20020a05600c1f0d00b0041c012ca327sm20235666wmb.45.2024.05.07.09.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 09:05:05 -0700 (PDT)
Message-ID: <20b1c2d9-0b37-414c-b348-89684c0c0998@gmail.com>
Date: Tue, 7 May 2024 17:05:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next v8 02/14] net: page_pool: create hooks for
 custom page providers
To: Christoph Hellwig <hch@infradead.org>,
 Mina Almasry <almasrymina@google.com>
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
 Breno Leitao <leitao@debian.org>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
References: <20240403002053.2376017-1-almasrymina@google.com>
 <20240403002053.2376017-3-almasrymina@google.com>
 <ZjH1QaSSQ98mw158@infradead.org>
 <CAHS8izM0=xc2UhUxhnF_BixuFs5VaDV9W1jbso1K+Rg=35NzeA@mail.gmail.com>
 <ZjjHUh1eINPg1wkn@infradead.org>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <ZjjHUh1eINPg1wkn@infradead.org>
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

On 5/6/24 13:04, Christoph Hellwig wrote:
> On Fri, May 03, 2024 at 01:10:44PM -0700, Mina Almasry wrote:
>> Is the concern still that folks may be able to hook proprietary stuff
>> into this like you mentioned before[1]?
> 
> That is on concern.  The other is that people will do stupid stuff

We're not now banning all virtual function tables because there is
a chance someone might probably conceivably do perhaps something
proprietary, aren't we? Let's just patch up all ways they might
use it if there is any left.

> even in tree if you give them enough rope, and they should not have
> that rope when the only sensible options are page/folio based kernel
> memory (incuding large/huge folios) and dmabuf.

I believe there is at least one deep confusion here, considering you
previously mentioned Keith's pre-mapping patches. The "hooks" are not
that about in what format you pass memory, it's arguably the least
interesting part for page pool, more or less it'd circulate whatever
is given. It's more of how to have a better control over buffer lifetime
and implement a buffer pool passing data to users and empty buffers
back.
It's a different from storage where a user passes a buffer before it
initiates a read, data is sent by the other socket end. TCP devmem
uses dmabuf, io_uring keeps pages (of normal user memory).


>> cp net/core/page_pool.c net/core/dmabuf_pool.c
>>
>> and then modify it such that the net stack maintains 2 page_pools?
>> There are a lot of cons to that:
> 
> No.  Just have branches for page based vs dmabuf in a few places.
> 

-- 
Pavel Begunkov
