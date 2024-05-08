Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 394448BFBFC
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 13:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AF010FB21;
	Wed,  8 May 2024 11:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CXVAvN1K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74ECD10FB21
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 11:30:02 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a59c5c9c6aeso887778066b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 04:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715167801; x=1715772601; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3OIqwzAifyFyoLgyrgDnMDOezHmps93bJkTuXZ4CdWs=;
 b=CXVAvN1KTTRnexiNT2vT8pc9iArrgJshd5B5fs1fZxytKUEqkDgmqDAAjyPQtr8+yZ
 mIm8IcHg1fKlr24pcFvzf8FcynzYU84Ql5raXoWHCvj9s6KKXhY3mI1LMRtf8H2fDiS/
 SDYvTtZcVN7SjwAup/wxbpjqNvx79xXwJVsugc2QfX0jyxfHSNXLdw7qv1s7OAvFbJM+
 Lq7xG/CZcxe9dzSWz8KxpBWGqgh5ibmh2nCwwl/6lcA7TgPfHhluM1yz1kY9B4EwIHso
 3+pNAmXQSic8KMtpmCQqwCuPlWwhFqAP1VizJSyiM8vnXwdKmdtjShPeOdf8dxKb0S9h
 OjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715167801; x=1715772601;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3OIqwzAifyFyoLgyrgDnMDOezHmps93bJkTuXZ4CdWs=;
 b=IeKpEhsmaI0NUlYOSJWndsShHfEOkB4Du2N0Ra3dyjoi/E29hn4n4jsca3dUduVW6K
 4nc+XiMTjXAFGvmUpD/ijcOWpl0OzEeDujRNWF5ZWocdMvf5fLE9TGvFyjLB3OtEXIf6
 /G8CmNFUTTrvXfRDiMRVdlRRHGlMa9eMiuqhRc51Ni6vtDxxkVMlExo2eN7tFw+0nvfQ
 FLzuuH4ZTDu552jnGTJbp2AZ/lVg85gpiBBZ9ylBhlOZixjK7k5P9EbLLZoeMRkP8nwr
 uh0/0H5ImW2IzDHZ4pnGJJUM3n3sFyyVBjipbe6O/yk9cQEKv4xvyG7CV8D0qGFE7wPU
 JWcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZnb+cKOShdz0573/6ZNtn+rzk9vE2XJ4BulP9gXlAAJSATQo0uvKj+/lr0o0oUYdBwYCrImkioYoFZ30h6T7T91nL0q0bR3Uch+UewBxf
X-Gm-Message-State: AOJu0Ywv/cwfJdswRR55a0vFOvyJhs+zvKcZO+1WLFVSZ6mFIEggzE55
 DO3bUl6yfzXYZESs+oh8uRHdd4ZnwiRcPgC4811Y6ANBsSp0nftu
X-Google-Smtp-Source: AGHT+IEBCSS9yz2TLoxpJSv9wB1C02lZToMUPdrmRCsf8QV6Km9boW/BeDcdlJbFciMxAmm6cw9vRg==
X-Received: by 2002:a17:906:2b1b:b0:a58:a0b8:2a64 with SMTP id
 a640c23a62f3a-a59fb94b152mr153051866b.5.1715167800381; 
 Wed, 08 May 2024 04:30:00 -0700 (PDT)
Received: from [192.168.42.217] ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 kh24-20020a170906f81800b00a59bf40ba6dsm4449273ejb.7.2024.05.08.04.29.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 May 2024 04:29:59 -0700 (PDT)
Message-ID: <54830914-1ec9-4312-96ad-423ac0aeb233@gmail.com>
Date: Wed, 8 May 2024 12:30:07 +0100
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
References: <CAHS8izM0=xc2UhUxhnF_BixuFs5VaDV9W1jbso1K+Rg=35NzeA@mail.gmail.com>
 <ZjjHUh1eINPg1wkn@infradead.org>
 <20b1c2d9-0b37-414c-b348-89684c0c0998@gmail.com>
 <20240507161857.GA4718@ziepe.ca> <ZjpVfPqGNfE5N4bl@infradead.org>
 <CAHS8izPH+sRLSiZ7vbrNtRdHrFEf8XQ61XAyHuxRSL9Jjy8YbQ@mail.gmail.com>
 <20240507164838.GG4718@ziepe.ca>
 <0d5da361-cc7b-46e9-a635-9a7a4c208444@gmail.com>
 <20240507175644.GJ4718@ziepe.ca>
 <6a50d01a-b5b9-4699-9d58-94e5f8f81c13@gmail.com>
 <20240507233247.GK4718@ziepe.ca>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20240507233247.GK4718@ziepe.ca>
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

On 5/8/24 00:32, Jason Gunthorpe wrote:
> On Tue, May 07, 2024 at 08:35:37PM +0100, Pavel Begunkov wrote:
>> On 5/7/24 18:56, Jason Gunthorpe wrote:
>>> On Tue, May 07, 2024 at 06:25:52PM +0100, Pavel Begunkov wrote:
>>>> On 5/7/24 17:48, Jason Gunthorpe wrote:
>>>>> On Tue, May 07, 2024 at 09:42:05AM -0700, Mina Almasry wrote:
>>>>>
>>>>>> 1. Align with devmem TCP to use udmabuf for your io_uring memory. I
>>>>>> think in the past you said it's a uapi you don't link but in the face
>>>>>> of this pushback you may want to reconsider.
>>>>>
>>>>> dmabuf does not force a uapi, you can acquire your pages however you
>>>>> want and wrap them up in a dmabuf. No uapi at all.
>>>>>
>>>>> The point is that dmabuf already provides ops that do basically what
>>>>> is needed here. We don't need ops calling ops just because dmabuf's
>>>>> ops are not understsood or not perfect. Fixup dmabuf.
>>>>
>>>> Those ops, for example, are used to efficiently return used buffers
>>>> back to the kernel, which is uapi, I don't see how dmabuf can be
>>>> fixed up to cover it.
>>>
>>> Sure, but that doesn't mean you can't use dma buf for the other parts
>>> of the flow. The per-page lifetime is a different topic than the
>>> refcounting and access of the entire bulk of memory.
>>
>> Ok, so if we're leaving uapi (and ops) and keep per page/sub-buffer as
>> is, the rest is resolving uptr -> pages, and passing it to page pool in
>> a convenient to page pool format (net_iov).
> 
> I'm not going to pretend to know about page pool details, but dmabuf
> is the way to get the bulk of pages into a pool within the net stack's
> allocator and keep that bulk properly refcounted while.> 
> An object like dmabuf is needed for the general case because there are
> not going to be per-page references or otherwise available.

They are already pinned, memory is owned by the provider, io_uring
in this case, and it should not be freed circumventing io_uring,
and at this stage calling release_pages() is not such a hassle,
especially comparing to introducing an additional object.

My question is how having an intermediary dmabuf benefits the net
stack or io_uring ? For now IMO it doesn't solve anything but adds
extra complexity. Adding dmabuf for the sake of adding dmabuf is
not a great choice.

> What you seem to want is to alter how the actual allocation flow works
> from that bulk of memory and delay the free. It seems like a different
For people who jumped here without looking what this patchset is
about, that's the entire point of the io_uring zero copy approach
as well as this set. Instead of using kernel private pages that you
have no other option but to copy/mmap (and then free), it hands
buffers to the user while using memory accessible/visible in some
way by the user.

That "delay free" is taking a reference while user is reading data
(slightly different for devmem tcp). And note, it's not a page/dmabuf
reference, kernel can forcibly take it back and release pages.

> topic to me, and honestly hacking into the allocator free function
> seems a bit weird..

Do you also think that DMA_BUF_IOCTL_SYNC is a weird hack, because
it "delays free" by pinning the dmabuf object and letting the user
read memory instead of copying it? I can find many examples

-- 
Pavel Begunkov
