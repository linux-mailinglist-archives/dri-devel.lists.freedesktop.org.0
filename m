Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 902128D82D6
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 14:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C33010E0E0;
	Mon,  3 Jun 2024 12:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GmTsp7dJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A020A10E37D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 12:52:40 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-57a52dfd081so1390978a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2024 05:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717419159; x=1718023959; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yfniF8fjsy176YDZGpwH9nU2UAljfW8YFG1uj+a6gnk=;
 b=GmTsp7dJjEBRGXP/DxwIYUMQ9rRUODrtbwr1u6sj2xK1rh7/sFWFad4hvOAO8OPGU9
 OsB+aLkjI27x2Tvfy5lNw8zPDzGpexDmVWrhYVjuWkLMFoxmGVy8pYFmDthxB+hFXGqs
 82cKAP1c2gQ5vZVKLEjrwMWvhuhFN+Edp9KaE1YeR0EtiHCwnP05sDbhbeNsKAEu12O/
 PdBmPcRx+KTlRpTEFQU5jcD3Qf1kogvyJbi+sharbH6j2bR3JQdcNHFJFWkezOm098Pg
 qWMuiw+IFanA8pmHr7EiLBFuZ2jsOhdpeNYHRqSyQmPKkBgDpqGovo6Gy9EsWbXerce+
 b05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717419159; x=1718023959;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yfniF8fjsy176YDZGpwH9nU2UAljfW8YFG1uj+a6gnk=;
 b=vJJN9ntnZQM75x9ZTYfpvR6Bz+/MI1V4GChdPR5ocRLka5PjpEOBz4zf8PB8emp6iA
 X5+7I1C4IepzpllfSEKse5HUj9IDHS1pz9lwtJbDG8Ut5yNRwBDxBx8PtMU7yS4QVWmi
 tTttLr3yV20Von4Zk9jUpbCslWtYZC1JR/KFr6zUbbExoJOhoqhshQ4Cl429BTt5zacZ
 I2v0ApQsZ96mIKFkUht5ck/57Nzf3iB9Fc7SgtZ+xfSWsND60quDEUTSJeUAiIC4XYSH
 bK0lccaL6727cfz+S6+oajobjC+fXgYkszgYQwPDEVyKy6DeVsCEmuQw8BskItz3wQs6
 c4Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQj2vr0fUsMGR4hiH6qzkNyydV832j2Q8MW3ANEpDCeSB9U5h4B9bo8cAYFYSwPbiUr3kEQQUL4PtQu014v3WDpcVxhCxnH6MnE0HOEfoN
X-Gm-Message-State: AOJu0YxU9g4gqI4NR09A8zoR97sWtl0Qk6fjxEHlzPCAPuGeKTqf/YlF
 23/QCD4XnCxeIv4Ry0LqH6+YCugbDiKntNRe6oQs8rCv0xJHK/f0
X-Google-Smtp-Source: AGHT+IHWekmH9nbBwxtAyBA3aP0bAtq3ZvyaOoiHlV8Yt/cXh+LsKG2d/23Eymxd3zWFCpXjqiJUYw==
X-Received: by 2002:a50:9b19:0:b0:56e:238e:372c with SMTP id
 4fb4d7f45d1cf-57a3653a3d7mr5229810a12.26.1717419158381; 
 Mon, 03 Jun 2024 05:52:38 -0700 (PDT)
Received: from [192.168.42.59] ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57a31b990easm5173294a12.6.2024.06.03.05.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 05:52:38 -0700 (PDT)
Message-ID: <fb8fd578-96b8-45b9-b6a9-fe407157122f@gmail.com>
Date: Mon, 3 Jun 2024 13:52:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 01/14] netdev: add netdev_rx_queue_restart()
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
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
 <20240530201616.1316526-2-almasrymina@google.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20240530201616.1316526-2-almasrymina@google.com>
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

On 5/30/24 21:16, Mina Almasry wrote:
> Add netdev_rx_queue_restart() function to netdev_rx_queue.h
> 
> Signed-off-by: David Wei <dw@davidwei.uk>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> 
> ---
...
> diff --git a/net/core/netdev_rx_queue.c b/net/core/netdev_rx_queue.c
> new file mode 100644
> index 0000000000000..b3899358e5a9c
> --- /dev/null
> +++ b/net/core/netdev_rx_queue.c
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <linux/netdevice.h>
> +#include <net/netdev_queues.h>
> +#include <net/netdev_rx_queue.h>
> +
> +int netdev_rx_queue_restart(struct net_device *dev, unsigned int rxq_idx)
> +{
> +	void *new_mem, *old_mem;
> +	int err;

I believe it should also do:

if (!dev->queue_mgmt_ops)
	return -EOPNOTSUPP;

> +
> +	if (!dev->queue_mgmt_ops->ndo_queue_stop ||
> +	    !dev->queue_mgmt_ops->ndo_queue_mem_free ||
> +	    !dev->queue_mgmt_ops->ndo_queue_mem_alloc ||
> +	    !dev->queue_mgmt_ops->ndo_queue_start)
> +		return -EOPNOTSUPP;
> +
> +	DEBUG_NET_WARN_ON_ONCE(!rtnl_is_locked());

-- 
Pavel Begunkov
