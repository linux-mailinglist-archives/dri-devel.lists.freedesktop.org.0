Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D8797375E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 14:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6573310E7AF;
	Tue, 10 Sep 2024 12:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nKiBKnFd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7991810E7AF
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 12:31:33 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53659867cbdso6879853e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 05:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725971491; x=1726576291; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AtcRhukYoCtt3zbp0P2CQXM3Yj4Vl3Xs7XXdCTCWAv4=;
 b=nKiBKnFdcKX16wKaFI5zl50T0SVMhc5Y1pBZplpDe4l/nEvTdCSI+JQm7+XwpjttQu
 VP2pk6GTsMwJqAXl1vYzc+JPkyDMG3JXCI0Dx4mxgnfGUILPz6BboHG5gCQt/0Xsg/A/
 Pxa/eheJUz34CswqPU7PkvteboREoF/g7rNnlzkBcIQkda/YNPVno/HHZag0U1LPyFB8
 Fpnl1WjB+gfVaE8VeGKxe9Dbk+Nmd0+tXgVdJ50zZNRcRYc45otpfEUAgcjzNqGEOGUX
 RCN/XhOvdkOl+WdgjvvxTeWj8vvSh48a1TF7kY7y1KybdnfnumNKB4ZmoGMHoJm+Cm5W
 LVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725971491; x=1726576291;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AtcRhukYoCtt3zbp0P2CQXM3Yj4Vl3Xs7XXdCTCWAv4=;
 b=SZyPHBxcFw62aw50ElBxE58lxZHDh+/MDBRHZrpt270tsNlNCWLhKubacgd1VcvL8H
 5THWP48IHJ18FDxw5jTX9H8wZ5/n2HuTCT/JdAlnQQ0xxgP+/+126epK/7iuLqlpbqxU
 O5/6vTT0QJsdkMu2QuugwOKyFTp7+lwZq5AlSWFA/YmdUoB8D95fOjYHL9vdr9JSTQdZ
 t49n/k52iM+BsRk/9pG+RE9l1NzTEIpO18NSopILbEI7ypAchbuZ8QBe5SEm2c6/wDxE
 u3U0LVQJh4Sci8egjXfxf8iHhxOSiR5c4xETnIibvFZ0Glya9IFLS7JP7mqpScKDA8qH
 EkoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf98ZC8w4p9ZTCCAEwqoTQG6GQIBNxjhrKjIu+zM1RMQs31JgLFzryhGGqCd0C/XZa15vZndZyNvo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/8OdSUJeuwfEDbloBKmeIRAf528pIEkBcJIN9rHZHCNgdl5xK
 ylcLZAw0EuPDV4+fYjlEj0Xz3TRMQzEkgkJqyaOXVOY3Cs8hoiXG
X-Google-Smtp-Source: AGHT+IGEVkB6nnSie3fLjpdXReDnDVW5WUCRhLkJsLhAZYuUFak44mbGNRXGfWfCij7/1bK1evFE2Q==
X-Received: by 2002:a05:6512:4021:b0:536:5810:e89 with SMTP id
 2adb3069b0e04-5365880b041mr13327012e87.49.1725971490461; 
 Tue, 10 Sep 2024 05:31:30 -0700 (PDT)
Received: from [192.168.42.252] ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d259511c0sm475844966b.62.2024.09.10.05.31.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 05:31:29 -0700 (PDT)
Message-ID: <9116f069-63a7-4cc9-b197-1f39ebfd0a57@gmail.com>
Date: Tue, 10 Sep 2024 13:31:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v25 00/13] Device Memory TCP
To: Yunsheng Lin <linyunsheng@huawei.com>,
 Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Donald Hunter <donald.hunter@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
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
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>
References: <20240909054318.1809580-1-almasrymina@google.com>
 <42c202e6-8c4c-494f-8c28-17d66ed75880@huawei.com>
 <CAHS8izMX+9F1NngbPx6w7ikKR9TgPvm+jMwZ8168NJYhFC7sVQ@mail.gmail.com>
 <95e6c282-1e4f-458b-9e40-9b626d64b3bd@huawei.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <95e6c282-1e4f-458b-9e40-9b626d64b3bd@huawei.com>
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

On 9/10/24 11:44, Yunsheng Lin wrote:
> On 2024/9/10 0:54, Mina Almasry wrote:
>> On Mon, Sep 9, 2024 at 4:21 AM Yunsheng Lin <linyunsheng@huawei.com> wrote:
>>>
>>> On 2024/9/9 13:43, Mina Almasry wrote:
>>>
>>>>
>>>> Perf - page-pool benchmark:
>>>> ---------------------------
>>>>
>>>> bench_page_pool_simple.ko tests with and without these changes:
>>>> https://pastebin.com/raw/ncHDwAbn
>>>>
>>>> AFAIK the number that really matters in the perf tests is the
>>>> 'tasklet_page_pool01_fast_path Per elem'. This one measures at about 8
>>>> cycles without the changes but there is some 1 cycle noise in some
>>>> results.
>>>>
>>>> With the patches this regresses to 9 cycles with the changes but there
>>>> is 1 cycle noise occasionally running this test repeatedly.
>>>>
>>>> Lastly I tried disable the static_branch_unlikely() in
>>>> netmem_is_net_iov() check. To my surprise disabling the
>>>> static_branch_unlikely() check reduces the fast path back to 8 cycles,
>>>> but the 1 cycle noise remains.
>>>
>>> Sorry for the late report, as I was adding a testing page_pool ko basing
>>> on [1] to avoid introducing performance regression when fixing the bug in
>>> [2].
>>> I used it to test the performance impact of devmem patchset for page_pool
>>> too, it seems there might be some noticable performance impact quite stably
>>> for the below testcases, about 5%~16% performance degradation as below in
>>> the arm64 system:
>>>
>>
>> Correct me if I'm wrong here, but on the surface here it seems that
>> you're re-reporting a known issue. Consensus seems to be that it's a
>> non-issue.
>>
>> In v6 I reported that the bench_page_pool_simple.ko test reports a 1
>> cycle regression with these patches, from 8->9 cycles. That is roughly
>> consistent with the 5-15% you're reporting.
> 
>  From the description above in the cover letter, I thought the performance
> data using the out of tree testing ko is not stable enough to justify the
> performance impact.
> 
>>
>> I root caused the reason for the regression to be the
>> netmem_is_net_iov() check in the fast path. I removed this regression
>> in v7 (see the change log) by conditionally compiling the check in
>> that function.
>>
>> In v8, Pavel/Jens/David pushed back on the ifdef check. See this
>> entire thread, but in particular this response from Jens:
> 
> It seemed the main objection is about how to enable this feature
> for the io_uring?

The pushback was that config checks as optimisation don't work in real
life, they inevitably get enabled everywhere but some niche cases.
io_uring could do another config for memory providers, but even if it's
not enabled by default (which is not a great option), distributions will
eventually turn it on.

So, if you have that "niche use case" that fully controls the kernel and
wants to shed this overhead, we can do a config structure, but if it's
about overhead for everyone in general, configs hardly help anything,
even without any io_uring in the picture.

> And it seemed that you had added the CONFIG_NET_DEVMEM for this
> devmem thing, why not use it for that?

-- 
Pavel Begunkov
