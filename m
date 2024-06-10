Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D2E901929
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 03:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B83E10E2C6;
	Mon, 10 Jun 2024 01:12:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A8LyAVsC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC2110E2C6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 01:12:28 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4218180a122so4707635e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jun 2024 18:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717981947; x=1718586747; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lNJduADeWsFPxp+m1I5nZ3f95BR1hPfUvUg61woS5Tg=;
 b=A8LyAVsCUw1wlrm0sD3vlEky9za3OZ06snG8CJ9IbY3wXlln6QOEo6tR5MdttoGoqr
 ly8CEs3WqAzVyDZqrJhnM1YD02MfVjmVRI4bT6oHZk/l1vK+e2bNcpz3gQ8Dtuzqb7TH
 gRUVdeQ3HmBGDQBq3x0GJxNs+Q0kllDa06e3/9/mjN0NQ2Ejzaxmwl2gKWxwDp5mPL9S
 3fQgSDoNyEYDz1wpRBAiZdaLKox+G+Hho3Tk3rig+8i0YQ3EmL/AuaiD5P+Iw4nUgWoe
 QelI39TR/s6XuxO0mTcpl5fGx/m2PooFXdhbh4fnMr78c/SGZtFkRCP270NGLJptAG43
 rZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717981947; x=1718586747;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lNJduADeWsFPxp+m1I5nZ3f95BR1hPfUvUg61woS5Tg=;
 b=WdR54iLPxF5vJfYKURmjjdxcRQOD2tg0G7VxMvPVy2raunhtukAhc1f4XqjqFXjEss
 MJzln3amoyKhB48cKJhK4cp/Iu3TwktcR5GUGeaNuN+eS7UfquBzWtzldj+sRuJcmjMM
 f2BAvjqHMl6Q8PEVn2coybG8n1sR4IabiKfrAmM6CpEqAJFO/n7vE8KRdQlzG4QWtiw3
 0YMOoqXSKIeV3GqJ2aCBPbhVsGJEL416hJ95brS1x7vss6hEL8uZqKr1Lsz7dp7XzbE6
 8PxZ8XvNXSU+N/Wd6f/LRuN61FTPvEupUFk489ScWNZevnbnA7H3U8Af3FSKNC9/tBpI
 xVHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/nsS9BgTT0uG+6X2ZCba77OrBdaRfuU2SNJkmXpwa030yZkRfO8KTtsWmZiX/fLyZGzw3dr68sedjSpJ9TI9sj/5rcD+RNfDMy1ckLwdz
X-Gm-Message-State: AOJu0Yz4Hw/41l4ykqyAy4n46hQ//76WpLBLBwrr0fflKGR/JLGDKmCH
 MMzunmoG09DdC3Iyo9ZE12QVHauQkQ6mI9cNtAPHa4er7OgOWjA1
X-Google-Smtp-Source: AGHT+IHDaD1xgXKiE70wxK20VeOXv7YAKZBIIZIbJBgPUlJwOc+Otz/U6x6lGExUj8MSrU2BCjmLtQ==
X-Received: by 2002:a05:600c:5113:b0:421:f346:6b06 with SMTP id
 5b1f17b1804b1-421f3466f07mr3105805e9.28.1717981946528; 
 Sun, 09 Jun 2024 18:12:26 -0700 (PDT)
Received: from [192.168.42.136] ([148.252.129.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215814f141sm158668365e9.42.2024.06.09.18.12.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jun 2024 18:12:26 -0700 (PDT)
Message-ID: <5cc208d6-6116-4e9d-a48e-67290adc573a@gmail.com>
Date: Mon, 10 Jun 2024 02:12:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 02/14] net: page_pool: create hooks for
 custom page providers
To: Mina Almasry <almasrymina@google.com>
Cc: David Ahern <dsahern@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
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
 <8f44ca2a-8910-418f-b4a6-ca1e051484ba@gmail.com>
 <a8df4459-30bf-4414-aeca-2f67c461adc4@gmail.com>
 <CAHS8izNcYMsSpTNVSGRJHK6u+kDxnFab5Km1rYy8b++0FeUNgA@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izNcYMsSpTNVSGRJHK6u+kDxnFab5Km1rYy8b++0FeUNgA@mail.gmail.com>
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

On 6/7/24 17:59, Mina Almasry wrote:
> On Fri, Jun 7, 2024 at 8:47 AM Pavel Begunkov <asml.silence@gmail.com> wrote:
>>
>> On 6/7/24 16:42, Pavel Begunkov wrote:
>>> On 6/7/24 15:27, David Ahern wrote:
>>>> On 6/7/24 7:42 AM, Pavel Begunkov wrote:
>>>>> I haven't seen any arguments against from the (net) maintainers so
>>>>> far. Nor I see any objection against callbacks from them (considering
>>>>> that either option adds an if).
>>>>
>>>> I have said before I do not understand why the dmabuf paradigm is not
>>>> sufficient for both device memory and host memory. A less than ideal
>>>> control path to put hostmem in a dmabuf wrapper vs extra checks and
>>>> changes in the datapath. The former should always be preferred.
>>>
>>> If we're talking about types of memory specifically, I'm not strictly
>>> against wrapping into dmabuf in kernel, but that just doesn't give
>>> anything.
>>
>> And the reason I don't have too strong of an opinion on that is
>> mainly because it's just setup/cleanup path.
>>
> 
> I agree wrapping io uring in dmabuf seems to be an unnecessary detour.
> I never understood the need or upside to do that, but it could be a
> lack of understanding on my part.
> 
> However, the concern that David brings up may materialize. I've had to
> spend a lot of time minimizing or justifying checks to the code with
> page pool benchmarks that detect even 1 cycle regressions. You may be
> asked to run the same benchmarks and minimize similar overhead.
> 
> The benchmark in question is Jesper's bench_page_pool_simple. I've
> forked it and applied it on top of net-next here:
> https://github.com/mina/linux/commit/927596f87ab5791a8a6ba8597ba2189747396e54
> 
> As io_uring ZC comes close to merging, I suspect it would be good to
> run this to understand the regression in the fast path, if any. If
> there are no to little regressions, I have no concerns over io uring
> memory not being wrapped in dmabufs, and David may agree as well.

That's the easiest part as io_uring only reusing call points
you added for devmem and thus doesn't add anything new on top
to hot paths.

-- 
Pavel Begunkov
