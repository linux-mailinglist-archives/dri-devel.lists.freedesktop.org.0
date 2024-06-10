Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C33902924
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 21:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A91810E41E;
	Mon, 10 Jun 2024 19:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lERkhyU4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7DC010E310
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 19:20:13 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-35f27eed98aso338507f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 12:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718047212; x=1718652012; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ds39/wk1Vz6prMfj1gC31qm8pnLcqbnW8HnwNU8zLQg=;
 b=lERkhyU4A9SQ0xyOBPfAcjHzXGChNkvUVGuA+Tyw6QBE+t2r6QE/a83dQtNEfNHXN1
 i0MM3W1FejtBbANaOdMFg/1tyNpoK/8lu6H/TLuQoQh0LXt0WtRWhj9xoJ7PuGoJlkbM
 AtEMBoaBSMiRy7WTxJetMOsK3G+f/w4Lxlko1qXVeStMDWbPL1A5jfzM1Z+Rp8xIUMy9
 ovy+6A0+caydggshFdm/diA8uz8kJsWL6CjOmUFZHaPWiSQnRzg13emi9JjDMTgTaPUp
 /a2o+yiL+/Vz1/sTa+XA7FLGPBmd2XoKjMzm4TSRkT12xXHHHsT/wXAJ+5kuQyWzSmux
 N5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718047212; x=1718652012;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ds39/wk1Vz6prMfj1gC31qm8pnLcqbnW8HnwNU8zLQg=;
 b=Kz3zBBemiZ5AB3yMNbp1gpp11z9ITon/1HuzQW1A0v2hjqgY8U5pJDZoozFq3Om7f0
 ETnjvV3xLc95s2BkzMS8QBUhd/FBNOILAwhETUypUmiZzQDmPM7noQB6Zchr0bGA8JM+
 xfDZNA0QZD6ZhncGjigx1+02bt0Cr58/xaaLglSq8p3iiG0sTIBm/eSlKKQ5tPRSPNAh
 EZ9GOKWevhDwXILshPTcnyXACj57qVp2/Wsc0ecyLx7ItJnnyJamj+HnewedtvH+Dewn
 hujODrmUUTMFSBx+e7cRR0at1J0xU+VTj90j16ttLmegGuk2Mdf4nfP3XsLNfSZMo4Dt
 BVuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPL2dfEcX1N2BBWIoS0ekSgDNz1N7lah3AfGU6YarpmL0nXm9XfO+D2TWsmUTf7GqR9reatE3LnxnIl8XIqfn4q+aJx8EQKloNu6en+w1Y
X-Gm-Message-State: AOJu0Yyoh02QK07gvXRxQM6AxK63/RIFrVsp7OKcOr8ssS5kLEtXJ7zD
 cNgX/++dnJwslhS9bt2C3bup/zrXtWzjsEMuwZ20vN/dybpIFzTf
X-Google-Smtp-Source: AGHT+IHtyedrk98ou29Kg6rNsqOMEn95U01t7gSYrXBTrHwwR/KGG9pYFlYAQ/YJ7hVTZ+llph15Ng==
X-Received: by 2002:a5d:4383:0:b0:35f:2af3:7843 with SMTP id
 ffacd0b85a97d-35f2af37959mr455787f8f.48.1718047211545; 
 Mon, 10 Jun 2024 12:20:11 -0700 (PDT)
Received: from [192.168.42.64] ([148.252.129.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f0d512556sm8313077f8f.29.2024.06.10.12.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 12:20:11 -0700 (PDT)
Message-ID: <00c67cf0-2bf3-4eaf-b200-ffe00d91593b@gmail.com>
Date: Mon, 10 Jun 2024 20:20:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 02/14] net: page_pool: create hooks for
 custom page providers
To: David Ahern <dsahern@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: David Wei <dw@davidwei.uk>, Mina Almasry <almasrymina@google.com>,
 Christoph Hellwig <hch@infradead.org>, netdev@vger.kernel.org,
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
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
References: <20240530201616.1316526-3-almasrymina@google.com>
 <ZlqzER_ufrhlB28v@infradead.org>
 <CAHS8izMU_nMEr04J9kXiX6rJqK4nQKA+W-enKLhNxvK7=H2pgA@mail.gmail.com>
 <5aee4bba-ca65-443c-bd78-e5599b814a13@gmail.com>
 <CAHS8izNmT_NzgCu1pY1RKgJh+kP2rCL_90Gqau2Pkd3-48Q1_w@mail.gmail.com>
 <eb237e6e-3626-4435-8af5-11ed3931b0ac@gmail.com>
 <be2d140f-db0f-4d15-967c-972ea6586b5c@kernel.org>
 <20240607145247.GG791043@ziepe.ca>
 <45803740-442c-4298-b47e-2d87ae5a6012@davidwei.uk>
 <54975459-7a5a-46ff-a9ae-dc16ceffbab4@gmail.com>
 <20240610121625.GI791043@ziepe.ca>
 <59443d14-1f1d-42bb-8be3-73e6e4a0b683@kernel.org>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <59443d14-1f1d-42bb-8be3-73e6e4a0b683@kernel.org>
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

On 6/10/24 16:16, David Ahern wrote:
> On 6/10/24 6:16 AM, Jason Gunthorpe wrote:
>> On Mon, Jun 10, 2024 at 02:07:01AM +0100, Pavel Begunkov wrote:
>>> On 6/10/24 01:37, David Wei wrote:
>>>> On 2024-06-07 17:52, Jason Gunthorpe wrote:
>>>>> IMHO it seems to compose poorly if you can only use the io_uring
>>>>> lifecycle model with io_uring registered memory, and not with DMABUF
>>>>> memory registered through Mina's mechanism.
>>>>
>>>> By this, do you mean io_uring must be exclusively used to use this
>>>> feature?
>>>>
>>>> And you'd rather see the two decoupled, so userspace can register w/ say
>>>> dmabuf then pass it to io_uring?
>>>
>>> Personally, I have no clue what Jason means. You can just as
>>> well say that it's poorly composable that write(2) to a disk
>>> cannot post a completion into a XDP ring, or a netlink socket,
>>> or io_uring's main completion queue, or name any other API.
>>
>> There is no reason you shouldn't be able to use your fast io_uring
>> completion and lifecycle flow with DMABUF backed memory. Those are not
>> widly different things and there is good reason they should work
>> together.

Let's not mix up devmem TCP and dmabuf specifically, as I see it
your question was concerning the latter: "... DMABUF memory registered
through Mina's mechanism". io_uring's zcrx can trivially get dmabuf
support in future, as mentioned it's mostly the setup side. ABI,
buffer workflow and some details is a separate issue, and I don't
see how further integration aside from what we're already sharing
is beneficial, on opposite it'll complicate things.

>> Pretending they are totally different just because two different
>> people wrote them is a very siloed view.
io_uring zcrx and devmem? They are not, nobody is saying otherwise,
_very_ similar approaches if anything but with different API, which
is the reason we already use common infra.

>>> The devmem TCP callback can implement it in a way feasible to
>>> the project, but it cannot directly post events to an unrelated
>>> API like io_uring. And devmem attaches buffers to a socket,
>>> for which a ring for returning buffers might even be a nuisance.
>>
>> If you can't compose your io_uring completion mechanism with a DMABUF
>> provided backing store then I think it needs more work.

As per above, it conflates devmem TCP with dmabuf.

> exactly. io_uring, page_pool, dmabuf - all kernel building blocks for
> solutions. This why I was pushing for Mina's set not to be using the
> name `devmem` - it is but one type of memory and with dmabuf it should
> not matter if it is gpu or host (or something else later on - cxl?).

-- 
Pavel Begunkov
