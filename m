Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE7E8BE9D3
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 18:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9949112528;
	Tue,  7 May 2024 16:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gCQ3tTUp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9368511252E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 16:55:05 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-41bab13ca81so35593355e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 09:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715100904; x=1715705704; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dF9l/kgRlz0B5vWAs2atat+U+Sdoi0d3PjFaa8gJGnw=;
 b=gCQ3tTUpicvuD55gjYy8piPzXWshwQNb/xmfdTDaMHFmGqqj96w4LVCoc09OKO13sQ
 v+ssEoB91GXNxc4zeSUc/7HSxLzkpLWRsr0m4ELkZgGZW+UQ+UuovVt9d45uw7Pez0Ie
 tLOfb/ByuKzt3WU9W+WIa3ZgDhalMySNIoySG2SkxKFL35EGjRfdfztN0UapGFm+229D
 YSsFdPmdwdUOEN0lZf6/uyJvuWnvE9E87lPE0HjPiDYALBvGV6Kmj7P2u4hUn+tVFycB
 YJanmAGGWZ7oUqfTPZsQCRAIPPgqrM9ZUtUDThW+xfANbGiHd5lhrSuER5r9XjJtB49z
 24vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715100904; x=1715705704;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dF9l/kgRlz0B5vWAs2atat+U+Sdoi0d3PjFaa8gJGnw=;
 b=sukNUmK8oyqJNZl9o0rJO4QFbMbxtfpuWzBUpgeZefHpAd/41CmdcF5+vem3PLkgGi
 rIOLFD5UnVuBOEeiGPTAPH/kMZ78t3nHuXszgRsECejnMzyPz4nkUjkg2xGmmgh3vnSa
 R8TpLbxoBLpc96L9xnCE12bTm81QVWBSN80jIVt7XZoOAwnIbbJbJVKDGdsPHOfePJli
 XB7RlduiaUiRjTi7gAME/m+7bCpP/vQEFDCKiekbDxt05uvg+Jdycrb5SJTtoy0jO2np
 ahGrCe4br5UlQZDALOcBGcnTyEZZQXqu4ikyeirP8/bDirIkPCNjorgHs7qXDsMxkZtE
 hUUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnxv96eNl/dhJpFfHb/YTvGsOw9ByX2V5gfO9FOx9v12VTI6c957FQap37w8cy9/jbPSkBW8VkiDIqDUY4Qz/KNI3oSqlAE2zNqiVorP8F
X-Gm-Message-State: AOJu0YxQQSYshwIdLpKoinfvM+0OXT6ge7mKQZl4bRK7w5o3ddmjBJMU
 fSr2XgKaG0I9fbz5FAgq5i4mFjkdUeJGduvfodCzgVzYEEx6s2Vb
X-Google-Smtp-Source: AGHT+IH7DHe6/ECg4cq2RKtLIjPPmczYwSJQD4jpcfKG6nOXnELQiScPGDQJbCXwTIzCZULoDPCQXg==
X-Received: by 2002:a05:600c:4747:b0:41c:2313:da8d with SMTP id
 5b1f17b1804b1-41f7093c658mr4744345e9.0.1715100903326; 
 Tue, 07 May 2024 09:55:03 -0700 (PDT)
Received: from [192.168.42.69] ([85.255.235.91])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a05600c359100b0041adf358058sm20132504wmq.27.2024.05.07.09.54.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 09:55:03 -0700 (PDT)
Message-ID: <54b1bf11-0f9a-4e9e-9e5c-7d81e066fc7c@gmail.com>
Date: Tue, 7 May 2024 17:55:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next v8 02/14] net: page_pool: create hooks for
 custom page providers
To: Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
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
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <ZjpVfPqGNfE5N4bl@infradead.org>
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

On 5/7/24 17:23, Christoph Hellwig wrote:
> On Tue, May 07, 2024 at 01:18:57PM -0300, Jason Gunthorpe wrote:
>> On Tue, May 07, 2024 at 05:05:12PM +0100, Pavel Begunkov wrote:
>>>> even in tree if you give them enough rope, and they should not have
>>>> that rope when the only sensible options are page/folio based kernel
>>>> memory (incuding large/huge folios) and dmabuf.
>>>
>>> I believe there is at least one deep confusion here, considering you
>>> previously mentioned Keith's pre-mapping patches. The "hooks" are not
>>> that about in what format you pass memory, it's arguably the least
>>> interesting part for page pool, more or less it'd circulate whatever
>>> is given. It's more of how to have a better control over buffer lifetime
>>> and implement a buffer pool passing data to users and empty buffers
>>> back.
>>
>> Isn't that more or less exactly what dmabuf is? Why do you need
>> another almost dma-buf thing for another project?
> 
> That's the exact point I've been making since the last round of
> the series.  We don't need to reinvent dmabuf poorly in every
> subsystem, but instead fix the odd parts in it and make it suitable
> for everyone.

Someone would need to elaborate how dma-buf is like that addition
to page pool infra. The granularity here is usually 4K and less
(hw dictated), what user receives cannot be guaranteed to be
contiguous in memory. Having thousands of dma-buf instances is
not an option, so a completion would need to include a range
where data sits. Then who controls lifetime of buffers? If it's
dma-buf, then at least it needs to track what sub-buffers are
handed to user and what are currently in the kernel. How it would be
accounted? ioctl_return_subrange(dmabuf, [range]), sounds like
a bad idea for performance. To cover user memory it'd also need
to be read from userspace, ioctl here wouldn't be an option, but
let's say it's somehow done in the kernel.

That's not all the list, but in short, even though I haven't been
following dma-buf developments too closely, I have hard time seeing
how it can be a replacement here.

-- 
Pavel Begunkov
