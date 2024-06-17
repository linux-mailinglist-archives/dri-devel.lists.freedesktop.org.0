Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB07890AFBA
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 15:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37E010E3C9;
	Mon, 17 Jun 2024 13:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MCFm7CMI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6312E10E3C9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 13:42:23 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ec0f3b9bb8so28211051fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 06:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718631741; x=1719236541; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lLq64Jy1y7qzLgBK9Is0sT9q7OKvIVCzHqdhb6LFXBE=;
 b=MCFm7CMIa7rvmU+e+dWHUAfknLMzs8Wu0Dic5VuIMwXUECYwuudSLOvp5n5DMZ1IgN
 obsKsfJj+xnTpva/xOww4wE6uuVfjx2VzytzqCS40kgiWaFBLggGaYwKRBCkiP+hC6dF
 IrDYje533+rxk5n1UNPUIw84mUYAbu9N2zSX8Ey6ubio/GjknCk222fimw3C5srLygvF
 /K1FBXcZ8OTIrMDePnm8yU3uGm6yx/5o9oPM2JMURcG1oomoidp4+KhBvEdQIY4yBIt4
 dLAUVH/k8PH/lTa7stKIFSKD6QGzvNSmEEa7IEzBL0vZvT9MHeMRUPIhCuW1CAQg+sB2
 UO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718631741; x=1719236541;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lLq64Jy1y7qzLgBK9Is0sT9q7OKvIVCzHqdhb6LFXBE=;
 b=OMp5Ism83cjyEHbCgr0YyjzKjMr+JvhkSsNPi7qqLpQ8bVaEk5MagehTYhrcbIXuAw
 AwXKha2aOjtwFCMsAjOzIXTDzazEMOXoDNpF7N6tq+iAgJukVVu+HXSaPydL/FIhUIzi
 gDqf/LAo47PuQXNeiyDyA7Am2BcnXyltW9yuQkKbXTmrVajbpXM972FF+n/e20WFVP62
 3lh2tu0BYM0/2zy5URijE2grUcS6fi6qGx/i8qRIVShF+wjCKZYVC+VzQsLXdbhZ0kAX
 V0Dtwp337Dpht7hpyTaTny8td3odmXIQhem8YsjMdzCQWxWJnCtqImrk0g0owhRdYxVa
 621w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo7HT33O6tqg+T0hSoK+wCWPGLOId1MmXUB/SVhfzFFnJBS20FvFa3Hw10aUt0VzcTbDrHmWm8nRtm8ofOQpX8m1j6erFaJSRvBurRyCeE
X-Gm-Message-State: AOJu0Yz1JA9/Mg7LlMit5/HKs3eL3pBWLUr1vmW+1JTLQjbZ9g5zkbV/
 ietvhgaI3nXirmytYU7OhJer7HVExy8+tH+7jyA7yMh3eROXaX/9acrs5fxa
X-Google-Smtp-Source: AGHT+IGqHzJEUi1a7luh9jW8SHVbZk8TdcfnJo2RG3dm48EiRHLhDHgyG2l2mawW7oSV97i58gBdzA==
X-Received: by 2002:a2e:a443:0:b0:2ec:1a8b:c380 with SMTP id
 38308e7fff4ca-2ec1a8bc478mr51361181fa.45.1718631740813; 
 Mon, 17 Jun 2024 06:42:20 -0700 (PDT)
Received: from [192.168.42.82] ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72ce12fsm6461432a12.7.2024.06.17.06.42.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 06:42:20 -0700 (PDT)
Message-ID: <8bc8c6db-e25e-42ce-8cd2-be50b4a735e2@gmail.com>
Date: Mon, 17 Jun 2024 14:42:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 04/13] netdev: netdevice devmem allocator
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Jesper Dangaard Brouer
 <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
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
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
References: <20240613013557.1169171-1-almasrymina@google.com>
 <20240613013557.1169171-5-almasrymina@google.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20240613013557.1169171-5-almasrymina@google.com>
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

On 6/13/24 02:35, Mina Almasry wrote:
> Implement netdev devmem allocator. The allocator takes a given struct
> netdev_dmabuf_binding as input and allocates net_iov from that
> binding.
> 
> The allocation simply delegates to the binding's genpool for the
> allocation logic and wraps the returned memory region in a net_iov
> struct.

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

> 
> Signed-off-by: Willem de Bruijn <willemb@google.com>
> Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> 
> ---
-- 
Pavel Begunkov
