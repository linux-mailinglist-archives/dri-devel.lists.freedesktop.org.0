Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A1594FB77
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 03:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49C710E029;
	Tue, 13 Aug 2024 01:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kqGUqK30";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B0D10E029
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 01:56:24 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-428e1915e18so34406835e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 18:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723514183; x=1724118983; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GSibsKkWXPTZsPGOBJp3Fcm/0om9Gy4boGmfKowM9D4=;
 b=kqGUqK30CPjoOlK8SuAzXsT/6DiTJuRYJKP0AvyVTS2AbZ6UTxx28FgsFNGZwzAHt4
 ZiDt9NEW4TtJWhTOkK3St/ekirvS4hqnfRPsnCFv8GpvxDEWpA5hPcuUZN/J9ys1Eng1
 glhF27kgFmaqGr6QtSYunitk3o8DLxv6pDPUSe8/KuOzOX5QuU1UJcOBm5GnsB1mFI7q
 OsJ512cPiZDoxmOvFNpBrXOoPQleZWsjAUXQA6dh5R0mUCRCJUjHhkNmfq6TgV/cwtpk
 MAA/pUaSVgpu7JS5+Pv1eJT/DC9u7OeaNgNEyUQI733mPi4cjzns9hiJnMJltiIpK20N
 y25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723514183; x=1724118983;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GSibsKkWXPTZsPGOBJp3Fcm/0om9Gy4boGmfKowM9D4=;
 b=t4Lp8dOWtMpEUF++Fu/2H9cstMoyvSTAO50o91PIFkHqna6MesdEX47eU9JjFUvg7b
 nMmgUyV7SDQoNGg83b88ry7GG40y3amHlYL0HTIJ+HnhNxbnQgNDo2WJSvLGJQ0IiDce
 +sZs3VnwyaviQpk60S+UdrdXbGpnVkr1tfnfUUhOT2H9xNBYVxYcwjrBRbbmEa7lV6rn
 vw4DWzok/Oh6OKZuTh16/jrIN5ZdaJbzOOC+6WW+OtC9TLrC+xalxb5MyFXLLUzpgdYJ
 sZXlzrxxhx6wS33Dj0gf0BmUvaaNMBumVnJSv3spzwc2mKGNl+Qfrz+6v0f+QmCxhpHF
 JrBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU42TQeuF/N/KS2ztwvflJoaxf9WzWGzGlPEsRCDt3ULCvZb4i5CLDOG3u3YJWtk1Kx3ylZ4v2sssURotaIOfOOoGRSTgQ5VDt8cnQgtTZR
X-Gm-Message-State: AOJu0YzrU09GXojfo2LSo59DhPiW4FQyoFnY+KWW325+BAO9P0KlRjpa
 waN7LV6s5xytD7kUiA5mxl3005/ueSaT5NId6Y8yHAONtEjOSI+B
X-Google-Smtp-Source: AGHT+IG2cxhEUGEjchcaIrhqVTsKQUiFNfY0aoBbKWG/+9xydhrcFsfo82Q+iGvABQKDqUAFqalXDg==
X-Received: by 2002:a05:600c:4fc5:b0:426:5dca:50a with SMTP id
 5b1f17b1804b1-429d481da7bmr14330075e9.21.1723514182757; 
 Mon, 12 Aug 2024 18:56:22 -0700 (PDT)
Received: from [192.168.42.116] ([85.255.232.227])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4290c7618b9sm209629205e9.30.2024.08.12.18.56.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 18:56:22 -0700 (PDT)
Message-ID: <23be8495-53d1-469a-bd9d-4dc2295be71f@gmail.com>
Date: Tue, 13 Aug 2024 02:56:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v18 07/14] memory-provider: dmabuf devmem memory
 provider
To: Jakub Kicinski <kuba@kernel.org>
Cc: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Donald Hunter <donald.hunter@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
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
 Arnd Bergmann <arnd@arndb.de>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>,
 David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
References: <20240805212536.2172174-1-almasrymina@google.com>
 <20240805212536.2172174-8-almasrymina@google.com>
 <20240806135924.5bb65ec7@kernel.org>
 <CAHS8izOA80dxpB9rzOwv7Oe_1w4A7vo5S3c3=uCES8TSnjyzpg@mail.gmail.com>
 <20240808192410.37a49724@kernel.org>
 <CAHS8izMH4UhD+UDYqMjt9d=gu-wpGPQBLyewzVrCWRyoVtQcgA@mail.gmail.com>
 <fc6a8f0a-cdb4-4705-a08f-7033ef15213e@gmail.com>
 <20240809205236.77c959b0@kernel.org>
 <CAHS8izOXwZS-8sfvn3DuT1XWhjc--7-ZLjr8rMn1XHr5F+ckbA@mail.gmail.com>
 <48f3a61f-9e04-4755-b50c-8fae6e6112eb@gmail.com>
 <20240812105732.5d2845e4@kernel.org>
 <7e2ffe62-032a-4c5e-953b-b7117ab076be@gmail.com>
 <71260e3c-dee4-4bf0-b257-cdabd8cff3f1@gmail.com>
 <20240812171548.509ca539@kernel.org>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20240812171548.509ca539@kernel.org>
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

On 8/13/24 01:15, Jakub Kicinski wrote:
> On Mon, 12 Aug 2024 20:04:41 +0100 Pavel Begunkov wrote:
>>>> Also don't see the upside of the explicit "non-capable" flag,
>>>> but I haven't thought of that. Is there any use?
>>
>> Or maybe I don't get what you're asking, I explained
>> why to have that "PP_IGNORE_PROVIDERS" on top of the flag
>> saying that it's supported.
>>
>> Which "non-capable" flag you have in mind? A page pool create
>> flag or one facing upper layers like devmem tcp?
> 
> Let me rephrase - what's the point of having both PP_PROVIDERS_SUPPORTED
> and PP_IGNORE_PROVIDERS at the page pool level? PP_CAP_NET(MEM|IOV),
> and it's either there or it's not.

The second flag solves a problem with initializing page pools
with headers, but let's forget about it for now, it's rather a
small nuance, would probably reappear when someone would try to
use pp_params->queue for purposes different from memory providers.

> If you're thinking about advertising the support all the way to the
> user, I'm not sure if page pool is the right place to do so. It's more
> of a queue property.

Nope. Only the first "SUPPORTED" flag serves that purpose in a way
by failing setup like netlink devmem dmabuf binding and returning
the error back to user.

> BTW, Mina, the core should probably also check that XDP isn't installed
> before / while the netmem is bound to a queue.

-- 
Pavel Begunkov
