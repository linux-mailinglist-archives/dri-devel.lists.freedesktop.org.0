Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3F88BECA2
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 21:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D23710F754;
	Tue,  7 May 2024 19:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k+oyR43l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D0A10F754
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 19:35:33 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-41bab13ca80so26424345e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 12:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715110531; x=1715715331; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0MsVmwcc7IjdJ/e1qKc5IeNtKIDJim+5sn115KirsXM=;
 b=k+oyR43lmKaWSCCxRxdt6d3u/SE+8Jc+14XmX7RKHUS3LQ4qEQ2Kz5AR/i6RLoNIlf
 6zkUCDDOHWY92OSE6QZx/FF+XYlGKAAdud07PJkgSd81Q3Q/fynoPSlH1yApNmoIRdeW
 Q9LIgk5T37Ueg9xgySBqKAR5Jq6hKHaLlHhGVszI7xK9vmSmY3J8TaQRKZOqSWwdShN1
 ayiBlFmvb+5SImVvIkG4arDML1SA0X4ODEImPTYGBTECgXqrezCgLOrH4AKiW8LPv9oi
 io6h1ovMfgP3UwcEDbjbrgH7cJW62dHdPgy/NR8kIOi9bXAI5qwo3PIUP44B+6nz7l2S
 Dnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715110531; x=1715715331;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0MsVmwcc7IjdJ/e1qKc5IeNtKIDJim+5sn115KirsXM=;
 b=Bj+JsBACrycrd1g+LSpAa7ELf00hPxfqJzk2gytk6jfHJlbBgUsK+PFIDDvbytjvGp
 jduRKkTNJ/IgQY1jfoKMOd3xknPqH8/BSh4uaWUQqj8+P8rzFtjZa9jKOdrC2YRmb2hl
 m+wxd67r+fDZzzHgLIng0tz92kE5a/2YGrLht15YWtgumhizF/DDNVYKnk+yBIGRZbQ0
 qje0qHWz602T4OJnd6tSoxhL2euaW+kYkRHaAIUhWCuMDp5Lpi/UqTBZq0z5lhtsHEOa
 2xfaXuRGPusYbCIl5Ow2DLAgf4gPjh4oygOogKGaiywGIlWMvuL4MtltOVT4kL1iGi2P
 fGww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl8tuGOrxRqErUSSrxMxhtkiODqp1REc3jUz/x/1h15OLpMp2fkP/1xWsKnf9jOj71wJGNT4jeUAl98xe5H26MI/QwZRCjnEbIqw3GRm+o
X-Gm-Message-State: AOJu0YxkwqKZl+/ApdJMbX+Az/Yl6xh8sNCMHN0uaWD+htXsN5MjIjXK
 coCShRaPtA7Nfy16aekWZYCVDSE/jxfjJRSxIwDwMH2eR4qVhJFB
X-Google-Smtp-Source: AGHT+IEykirY9gyWc0Q9cAc6TvBa0+t0xp9ehEp+M4lSOcYK9DTE6BwXpCm/3e/UtlGIJu+qNRFaFg==
X-Received: by 2002:a05:600c:3583:b0:418:ed13:302d with SMTP id
 5b1f17b1804b1-41f723a1a0amr5612735e9.26.1715110531198; 
 Tue, 07 May 2024 12:35:31 -0700 (PDT)
Received: from [192.168.42.69] ([85.255.235.91])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0041bd85cd3f2sm20447278wmp.19.2024.05.07.12.35.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 12:35:30 -0700 (PDT)
Message-ID: <6a50d01a-b5b9-4699-9d58-94e5f8f81c13@gmail.com>
Date: Tue, 7 May 2024 20:35:37 +0100
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
References: <20240403002053.2376017-3-almasrymina@google.com>
 <ZjH1QaSSQ98mw158@infradead.org>
 <CAHS8izM0=xc2UhUxhnF_BixuFs5VaDV9W1jbso1K+Rg=35NzeA@mail.gmail.com>
 <ZjjHUh1eINPg1wkn@infradead.org>
 <20b1c2d9-0b37-414c-b348-89684c0c0998@gmail.com>
 <20240507161857.GA4718@ziepe.ca> <ZjpVfPqGNfE5N4bl@infradead.org>
 <CAHS8izPH+sRLSiZ7vbrNtRdHrFEf8XQ61XAyHuxRSL9Jjy8YbQ@mail.gmail.com>
 <20240507164838.GG4718@ziepe.ca>
 <0d5da361-cc7b-46e9-a635-9a7a4c208444@gmail.com>
 <20240507175644.GJ4718@ziepe.ca>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20240507175644.GJ4718@ziepe.ca>
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

On 5/7/24 18:56, Jason Gunthorpe wrote:
> On Tue, May 07, 2024 at 06:25:52PM +0100, Pavel Begunkov wrote:
>> On 5/7/24 17:48, Jason Gunthorpe wrote:
>>> On Tue, May 07, 2024 at 09:42:05AM -0700, Mina Almasry wrote:
>>>
>>>> 1. Align with devmem TCP to use udmabuf for your io_uring memory. I
>>>> think in the past you said it's a uapi you don't link but in the face
>>>> of this pushback you may want to reconsider.
>>>
>>> dmabuf does not force a uapi, you can acquire your pages however you
>>> want and wrap them up in a dmabuf. No uapi at all.
>>>
>>> The point is that dmabuf already provides ops that do basically what
>>> is needed here. We don't need ops calling ops just because dmabuf's
>>> ops are not understsood or not perfect. Fixup dmabuf.
>>
>> Those ops, for example, are used to efficiently return used buffers
>> back to the kernel, which is uapi, I don't see how dmabuf can be
>> fixed up to cover it.
> 
> Sure, but that doesn't mean you can't use dma buf for the other parts
> of the flow. The per-page lifetime is a different topic than the
> refcounting and access of the entire bulk of memory.

Ok, so if we're leaving uapi (and ops) and keep per page/sub-buffer as
is, the rest is resolving uptr -> pages, and passing it to page pool in
a convenient to page pool format (net_iov). I don't see how dmabuf would
help here. Adding dmabuf in the middle (internally wrapping pages) would
add more setup code with the same final result, that is a format that
page pool can work with. And for io_uring it's normal user memory. We'll
have to use dmabuf when we'd want to extend to peer-to-peer and all that
fun, but that's a small fraction of it, and we'll hopefully reuse some
setup helpers from devmem tcp.

-- 
Pavel Begunkov
