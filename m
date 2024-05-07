Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA71E8BEA45
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 19:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9568510F6A0;
	Tue,  7 May 2024 17:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c3T7Wame";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36B210EF0E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 17:17:35 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-41c7ac73fddso35765105e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 10:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715102254; x=1715707054; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oJ80Ll1dX/ur3jQ8gDv1wRzdWsBKiGgm1wdEFnXS+WM=;
 b=c3T7WameAEUO3V1dL1G30afESyPBu31VYjiZ/EtFhgPyPxkRlAVBZLXkIFCYnFB22l
 2XDoMBaDmNsCE6LTLmGBn/2SrI+iJfNs3SrU+9BIZTXttIgqk5Z+oF0/cO2holJIM8fJ
 N/EwGPoaNwQmyEJKvaVaRZx5dIGrN6mbBG/VHo5BNEV7kTRyr1lW426gdf4C5SCmKvYa
 HQuyM8xwyVlFQR1qcVpT6NeXLiJ8zGgSbnwWz/jt7v0nJ+5lSGpvXbzOxGGu0tJ/PYdf
 Gv7t2kIiwusxR+DQ2RUNetsQKZFp32K+cdUCUbpKKRA/A7eGaTcK45kk/SiZ+uYhNLtf
 rvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715102254; x=1715707054;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oJ80Ll1dX/ur3jQ8gDv1wRzdWsBKiGgm1wdEFnXS+WM=;
 b=Le2jx/UiXP2YHELm54ZmlQ87zzq9WFrmVRXDo/Vcy22rLhoqKPMLgm3aMNRDw1z1yW
 E2IaJIevcGqNkWa0qOtcKZhExFT7lrnY7KpqofJUhbB/YnEVOQfBjlFIP8j68nbMeMzl
 KXPOS7tNj2BonfdY0w9I0weUDK9yXXidvUjXYQZ9uyycqFW0PXkRNxPDVzVuDwAk7zaf
 kqetG9KIik/lOyDjHw4AdIL7F71nkSJxlfHKbuh1DZP0cNOTQmGabdNXhJ1it6lwPHZ+
 9qapYJE/7osH8SpF4BAMXmfGhzJfAM3zsdLdkCSnFE4R+C6y3ffIfSs3fFWqB8CXU1YY
 yPHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRqFXyCq1HJljj/tsJTE7ZX6gQeFkJiLIvP4tJ/4Wz/0dFYc95/CeVX18lEhOppdVFPO6+Pwq+H3QavhGlnWpzCXY73UA8D2+FZIKbx0Rr
X-Gm-Message-State: AOJu0Yy9etWcTo2cfrVpBSipKi3spmLAoHrHGm3liBAqU8MyeVVw57nJ
 JCrYRrRHc3B1MNGp6RRKtAkNn+rugBrQnJr6nza9iElgk9aSL2eD
X-Google-Smtp-Source: AGHT+IHDlSuGL/qwu9xfAiJAS8LLw8j/Re0JFANbHekhpws972LyKLt2Ety9djuJuyXbW7/Wjtrm6A==
X-Received: by 2002:a05:600c:4e4f:b0:41b:e94f:1e88 with SMTP id
 5b1f17b1804b1-41f714f9859mr4326055e9.24.1715102253935; 
 Tue, 07 May 2024 10:17:33 -0700 (PDT)
Received: from [192.168.42.69] ([85.255.235.91])
 by smtp.gmail.com with ESMTPSA id
 bd23-20020a05600c1f1700b0041bfb176a87sm24024038wmb.27.2024.05.07.10.17.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 10:17:33 -0700 (PDT)
Message-ID: <b9018728-ebfd-4021-9028-991103d56702@gmail.com>
Date: Tue, 7 May 2024 18:17:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next v8 02/14] net: page_pool: create hooks for
 custom page providers
To: Mina Almasry <almasrymina@google.com>,
 Christoph Hellwig <hch@infradead.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, netdev@vger.kernel.org,
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
References: <20240403002053.2376017-1-almasrymina@google.com>
 <20240403002053.2376017-3-almasrymina@google.com>
 <ZjH1QaSSQ98mw158@infradead.org>
 <CAHS8izM0=xc2UhUxhnF_BixuFs5VaDV9W1jbso1K+Rg=35NzeA@mail.gmail.com>
 <ZjjHUh1eINPg1wkn@infradead.org>
 <20b1c2d9-0b37-414c-b348-89684c0c0998@gmail.com>
 <20240507161857.GA4718@ziepe.ca> <ZjpVfPqGNfE5N4bl@infradead.org>
 <CAHS8izPH+sRLSiZ7vbrNtRdHrFEf8XQ61XAyHuxRSL9Jjy8YbQ@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izPH+sRLSiZ7vbrNtRdHrFEf8XQ61XAyHuxRSL9Jjy8YbQ@mail.gmail.com>
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

On 5/7/24 17:42, Mina Almasry wrote:
> On Tue, May 7, 2024 at 9:24 AM Christoph Hellwig <hch@infradead.org> wrote:
>>
>> On Tue, May 07, 2024 at 01:18:57PM -0300, Jason Gunthorpe wrote:
>>> On Tue, May 07, 2024 at 05:05:12PM +0100, Pavel Begunkov wrote:
>>>>> even in tree if you give them enough rope, and they should not have
>>>>> that rope when the only sensible options are page/folio based kernel
>>>>> memory (incuding large/huge folios) and dmabuf.
>>>>
>>>> I believe there is at least one deep confusion here, considering you
>>>> previously mentioned Keith's pre-mapping patches. The "hooks" are not
>>>> that about in what format you pass memory, it's arguably the least
>>>> interesting part for page pool, more or less it'd circulate whatever
>>>> is given. It's more of how to have a better control over buffer lifetime
>>>> and implement a buffer pool passing data to users and empty buffers
>>>> back.
>>>
>>> Isn't that more or less exactly what dmabuf is? Why do you need
>>> another almost dma-buf thing for another project?
>>
>> That's the exact point I've been making since the last round of
>> the series.  We don't need to reinvent dmabuf poorly in every
>> subsystem, but instead fix the odd parts in it and make it suitable
>> for everyone.
>>
> 
> 
> FWIW the change Christoph is requesting is straight forward from my
> POV and doesn't really hurt the devmem use case. I'd basically remove
> the ops and add an if statement in the slow path where the ops are
> being used to alloc/free from dmabuf instead of alloc_pages().
> Something like (very rough, doesn't compile):
> 
> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> index 92be1aaf18ccc..2cc986455bce6 100644
> --- a/net/core/page_pool.c
> +++ b/net/core/page_pool.c
> @@ -557,8 +557,8 @@ netmem_ref page_pool_alloc_netmem(struct page_pool
> *pool, gfp_t gfp)
>                  return netmem;
> 
>          /* Slow-path: cache empty, do real allocation */
> -       if (static_branch_unlikely(&page_pool_mem_providers) && pool->mp_ops)
> -               netmem = pool->mp_ops->alloc_pages(pool, gfp);
> +       if (page_pool_is_dmabuf(pool))
> +               netmem = mp_dmabuf_devmem_alloc_pages():
>          else
>                  netmem = __page_pool_alloc_pages_slow(pool, gfp);
>          return netmem;
> 
> 
> The folks that will be negatively impacted by this are
> Jakub/Pavel/David. I think all were planning to extend the hooks for
> io_uring or other memory types.
> 
> Pavel/David, AFAICT you have these options here (but maybe you can
> think of more):
> 
> 1. Align with devmem TCP to use udmabuf for your io_uring memory. I
> think in the past you said it's a uapi you don't link but in the face
> of this pushback you may want to reconsider.

If the argument would be that we have to switch to a less efficient
and less consistent api for io_uring (fast path handling used buffers
back to kernel) just because it has to has dmabuf and without direct
relation to dmabuf, then no, it's not the way anything can be sanely
developed.

> 2. Follow the example of devmem TCP and add another if statement to
> alloc from io_uring, so something like:
> 
> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> index 92be1aaf18ccc..3545bb82c7d05 100644
> --- a/net/core/page_pool.c
> +++ b/net/core/page_pool.c
> @@ -557,8 +557,10 @@ netmem_ref page_pool_alloc_netmem(struct
> page_pool *pool, gfp_t gfp)
>                  return netmem;
> 
>          /* Slow-path: cache empty, do real allocation */
> -       if (static_branch_unlikely(&page_pool_mem_providers) && pool->mp_ops)
> -               netmem = pool->mp_ops->alloc_pages(pool, gfp);
> +       if (page_pool_is_dmabuf(pool))
> +               netmem = mp_dmabuf_devmem_alloc_pages():
> +       else if (page_pool_is_io_uring(pool))
> +               netmem = mp_io_uring_alloc_pages():
>          else
>                  netmem = __page_pool_alloc_pages_slow(pool, gfp);

I don't see why we'd do that instead instead of having a
well made function table, which is equivalent.

>          return netmem;
> 
> Note that Christoph/Jason may not like you adding non-dmabuf io_uring
> backing memory in the first place, so there may be pushback against
> this approach.

Christoph mentioned pages, we're using pages, I don't think it's
too fancy. I don't believe that's it, which would be equivalent to
"let's remove user pointers from the kernel and mandate passing
dmabuf only".


> 3. Pushback on the nack on this thread. It seems you're already
> discussing this. I'll see what happens.
> 
> To be honest the GVE queue-API has just been merged I think, so I'm
> now unblocked on sending non-RFCs of this work and I'm hoping to send
> the next version soon. I may apply these changes on the next version
> for more discussion or leave as is and carry the nack until the
> conversation converges.
> 

-- 
Pavel Begunkov
