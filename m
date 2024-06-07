Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3F0900963
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 17:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172FE10ECB7;
	Fri,  7 Jun 2024 15:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SmkxiBh6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFF010ECB7
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 15:42:43 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52bc29c79fdso605335e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2024 08:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717774962; x=1718379762; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6ztEfaA9QN5DY5F1t7l1AL7LIdxxv5aD3SKdILYYcZ0=;
 b=SmkxiBh67UbsMqn/kJ5g3TvJW1qEqaCbWUMyuccZlL9ghrE660H+1cqvZNej188EJV
 AI6kGJAqe5iyN21z3/T5N942pXopPkeGTQgcl3ki2DXHzOQpRMx9CKRjyp9aQ6mhVHQY
 hMTWTCmKEZ2raUhptLl0fevPWOELus90yyHSEQ0eiHgIVsormgiOUc0ehifdqjwKSJOY
 inM2PEY5hgVUQ8V4DrwWYfxN2nba0F8S0QqhAH3kBfGnWRHPQiy5CKXM4Imku04k61wa
 82CM9UBH9mNJNqvcOGLrJCr6CLcvf5vXcCnZ2RlC54q2+WU+IuTP7t9XKbBSgxhN/eRL
 pdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717774962; x=1718379762;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6ztEfaA9QN5DY5F1t7l1AL7LIdxxv5aD3SKdILYYcZ0=;
 b=Wg8fxYVSmDokZp7hhq/hpZi3R1UiWMNe5ePc0HpSlHld5qLHs7dZOPDj6UCSuDZxha
 KcGUwQi63K1cholvdRjJ+6DSiLIx+3fOSZxFX7KjwojNmuUdU97YXjIL+S80YU1bae3+
 k6FincGc7SQmvZNRwJRSzZwb6SB553BS81AboQ1KW8ksrSAqMGEL3ywueMCzzqlmIrdz
 mGC6Ra58egpf1BuutuOUH9r0+/9uJbayICBbxLoL8AL0z/DtjTPmLL549IAsnnMwGTQd
 g74Kil+3hWFYZ6xiruDtn7iUZ6VqnLONxfWgcJ1AJ6GrAy92bUufu6FGYyLF1FxHtNwz
 f47Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWONZBKrkGVcLB1Q6gopdNpzn9oMEevcpF+aQ85NR6PsXlOM/J5iQ8vKwJkuB4fJ0jj54RKgtUdrcAy189nsoXwr++9A565qtQVQvxTG4z/
X-Gm-Message-State: AOJu0YxkXf2PyNCxDgrQzyunf57jbWqku7vFvB5yCsBqxqqSN4g+8/Md
 XdCoDznYH+/hgxRHHmn/z+pC20Akht/7jHXbJoVSWITJyBhUeznx
X-Google-Smtp-Source: AGHT+IEFn+6+A9/ic4XpRfGuUMADB8GJccpGu+nMUZFNqtplHU80DwYmmylA2YOXqYyEGugmrIA8hA==
X-Received: by 2002:a19:430f:0:b0:52b:7b8a:2d2f with SMTP id
 2adb3069b0e04-52bb9f62745mr2133552e87.2.1717774961414; 
 Fri, 07 Jun 2024 08:42:41 -0700 (PDT)
Received: from [192.168.42.206] ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6c80582335sm264164166b.39.2024.06.07.08.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jun 2024 08:42:40 -0700 (PDT)
Message-ID: <8f44ca2a-8910-418f-b4a6-ca1e051484ba@gmail.com>
Date: Fri, 7 Jun 2024 16:42:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 02/14] net: page_pool: create hooks for
 custom page providers
To: David Ahern <dsahern@kernel.org>, Mina Almasry <almasrymina@google.com>
Cc: Christoph Hellwig <hch@infradead.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
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
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
References: <20240530201616.1316526-1-almasrymina@google.com>
 <20240530201616.1316526-3-almasrymina@google.com>
 <ZlqzER_ufrhlB28v@infradead.org>
 <CAHS8izMU_nMEr04J9kXiX6rJqK4nQKA+W-enKLhNxvK7=H2pgA@mail.gmail.com>
 <5aee4bba-ca65-443c-bd78-e5599b814a13@gmail.com>
 <CAHS8izNmT_NzgCu1pY1RKgJh+kP2rCL_90Gqau2Pkd3-48Q1_w@mail.gmail.com>
 <eb237e6e-3626-4435-8af5-11ed3931b0ac@gmail.com>
 <be2d140f-db0f-4d15-967c-972ea6586b5c@kernel.org>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <be2d140f-db0f-4d15-967c-972ea6586b5c@kernel.org>
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

On 6/7/24 15:27, David Ahern wrote:
> On 6/7/24 7:42 AM, Pavel Begunkov wrote:
>> I haven't seen any arguments against from the (net) maintainers so
>> far. Nor I see any objection against callbacks from them (considering
>> that either option adds an if).
> 
> I have said before I do not understand why the dmabuf paradigm is not
> sufficient for both device memory and host memory. A less than ideal
> control path to put hostmem in a dmabuf wrapper vs extra checks and
> changes in the datapath. The former should always be preferred.

If we're talking about types of memory specifically, I'm not strictly
against wrapping into dmabuf in kernel, but that just doesn't give
anything.
But the main reason for allocations there is the difference in
approaches to the api. With io_uring the allocation callback is
responsible for getting buffers back from the user (via a shared
ring). No locking for the ring, and buffers are already in the
context (napi) where they would be consumed from. Removes some
headaches for the user (like batching before returning buffers),
and should go better with smaller buffers and such.

> I also do not understand why the ifq cache 

I'm not sure what you mean by ifq cache. Can you elaborate?

> and overloading xdp functions

Assuming it's about setup via xdp, it was marked for remaking in
RFCs for longer than desired but it's gone now in our tree (but
maybe not in the latest series).

> have stuck around; I always thought both were added by Jonathan to
> simplify kernel ports during early POC days.

-- 
Pavel Begunkov
