Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F3590B8ED
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 20:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3B310E104;
	Mon, 17 Jun 2024 18:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FtvT50Y3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E65310E104
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 18:04:45 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a6f1da33826so638128466b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 11:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718647484; x=1719252284; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HQyicpxwAULydNdPul5CanbOSkDhlTf845qwPFgw1wc=;
 b=FtvT50Y3OXOfIRMCYYPjTlscjURZRpMFtDFOCLrXwiDpIElSlIfbiAELDaQDOH3HzR
 cArlQv63UfeB6VYO+0ZLITXBT0q/vL9/F2PLX4D0zVONVf7TuL5aVx0aARFT3/RkrEVV
 nstvjUEVzSOlmi6cU2y0U8pFvoRhdh+w+A7LMv+ypO72rFGrxdT9jGHAb6Mz7pMiz9I1
 d6PPSSDsUdxF8ytLU2WTh1P29jzse1G3QwkOat7UsN7K78irGuDg07+hWcQNIiEA7CSQ
 bXwm2pcn5Acyj4MaOWTlOyRTGOcsHG0AG82DBfoKbA55aQUhF9Pa19lnHK3nLb6KszU+
 E2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718647484; x=1719252284;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HQyicpxwAULydNdPul5CanbOSkDhlTf845qwPFgw1wc=;
 b=iY/UcipuNmV1Ib9r2lR+/XirKjfgvzA8rDX03X0kCTSU6wDFZ3QcvfwoRC1NhrmL8g
 baF/fEeDu5xde2Wut/18A2OMgtqx2DSIhpHUMdBkJ3AwzBwFUEDpD5t0KyVDUf/JNeG8
 KC0kxasH39woUq6fMEgdACoqcOf/7gNS5rbk0tTuzMGFPiSEaj/QC/s8oa4pbjxL1fOe
 lG2TlQj5xlukrCF7IiMFTUgMAfeV2QSBkZoyBxkEq5ulMPh7ipoW+AQx0aTNvESjRobg
 IjgM+vrOkgdFV3zovjxRAGmRBioOEcANA3wdLCTSxV7B4e7vBAcLKg5TkPZDxawizPZN
 X+DQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS4jj7/9kxz/j49YB6V+8fB1wyZ2k5WibwNvnU0Bl8r2Uc1x81hClDnxD7AK43ay0aJSPUN4rOYP8b5NsrALr1FgA6y1wavtZ0f7pxp51U
X-Gm-Message-State: AOJu0Yyg1eGEJ82HxYwPW/tmfRcVP9BYPJOS+5rIN3efS8BUiPar49+n
 gNHtPAwOgMr6LZhDyuNWsq9hyyixT19TnvVlCrTFLY4+QZWJKcwY
X-Google-Smtp-Source: AGHT+IEQqAbEKNSe2wLoBHNV8O+lFcqmwSNfGoItySBVqd4bPLItaNT2RIOOF/IoJpNrae6EG5ULKQ==
X-Received: by 2002:a17:907:d30c:b0:a6f:7c2d:475d with SMTP id
 a640c23a62f3a-a6f7c2d49d6mr537069166b.58.1718647483541; 
 Mon, 17 Jun 2024 11:04:43 -0700 (PDT)
Received: from [192.168.42.223] ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f63f7e9d8sm429037566b.182.2024.06.17.11.04.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 11:04:43 -0700 (PDT)
Message-ID: <8ca3e144-75f3-4e57-9ae0-cc88f245094e@gmail.com>
Date: Mon, 17 Jun 2024 19:04:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 02/14] net: page_pool: create hooks for
 custom page providers
To: Christoph Hellwig <hch@infradead.org>
Cc: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
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
 David Ahern <dsahern@kernel.org>,
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
 <ZmAgszZpSrcdHtyl@infradead.org>
 <ee9a55cd-7541-4865-ab2a-9e860b88c9e4@gmail.com>
 <Zmfv6_uWAVavYJNj@infradead.org>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <Zmfv6_uWAVavYJNj@infradead.org>
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

On 6/11/24 07:34, Christoph Hellwig wrote:
> On Fri, Jun 07, 2024 at 02:45:55PM +0100, Pavel Begunkov wrote:
>> On 6/5/24 09:24, Christoph Hellwig wrote:
>>> On Mon, Jun 03, 2024 at 03:52:32PM +0100, Pavel Begunkov wrote:
>>>> The question for Christoph is what exactly is the objection here? Why we
>>>> would not be using well defined ops when we know there will be more
>>>> users?
>>>
>>> The point is that there should be no more users.  If you need another
>>
>> Does that "No more" stops after devmem tcp?
> 
> There should be no other memory source other than the page allocator
> and dmabuf.  If you need different life time control for your
> zero copy proposal don't mix that up with the contol of the memory
> source.

No idea how I'm mixing it up when I was explaining exactly this
all along as well as that the callback (and presumably the call
site in general) you was so eager to nack is used exactly to
implement the life time control.

-- 
Pavel Begunkov
