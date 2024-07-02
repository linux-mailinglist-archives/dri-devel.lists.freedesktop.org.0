Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 239AE924151
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 16:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFD610E613;
	Tue,  2 Jul 2024 14:51:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EO3MCQJ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFAE10E613
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 14:51:22 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42573d3f7e4so28226775e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 07:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719931881; x=1720536681; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9exeTGo15NDIXtZ8CZttQ0DqkF9R2Zr4DFJbKqAaPNs=;
 b=EO3MCQJ4fid6esQcNh2t7P9me1L8yh+DC+fEIM95hEglXGOry078/x87NujI4wBmyO
 jCAQ1DDTuCf3FQPExrMmwzSzibdlKo82MeJLQAOTVMvy+2KKTOQEchb3IrVktj6T2d/j
 T0Bl9zfXvc5iYL9yHOEXD2Is63hE28tCmBYkSmPHPOEm80/DUYvzFea/JTNbVdwyPG8k
 nJCzInzvsDb5nhGZtx6hW2HDFBAR7F71zN7Bgz27EfiXJJNfejCUi0uaF3jb0tbpeYth
 TUi+tDJ44zUIDUL9NYOiDRM0HFTv1ieG/VACLUPjwpTwOQUje5BQ9f65P2TFsR5OeKkw
 cL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719931881; x=1720536681;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9exeTGo15NDIXtZ8CZttQ0DqkF9R2Zr4DFJbKqAaPNs=;
 b=Cw5zwYb9KUdxDihRswPc4So0Cri8bMMc/9EWNzL0VxyURei2fUugUQHSll1n8tnl7r
 LF56Gz4jqjjUJVtp4rKgq5t4INyEoh+jmQ9y79yvOJibKg/f63qE28ryevalXhFxY7VK
 uJ0WRVjee1dx0XOcBPCBAYHPX4RYZKWEAWK6Ee8StwfZSKe3IybYiU3+wWikW5MPCfLf
 WboUXvdXOJ/9FZCAEhnPBUB8Va8/EknigEHkpPhIfeAspiphYm/RXhJChLJ0LT9Mm+u2
 qvWl0VZJRH9kaXus+fP6UF0cVJbjH1X5C9M/HM6PorsRxdqEgrjWjGjR7uB1dcbRS5G4
 gCoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMXWGANR+ou0ilDrQvgQc+/P2G3OhLa5cc9z/aS5wCM4yNg3xKoPEWXNQSvmsCc30bgpIsUBNVa7CVmzaHKSjO7fPJVpZBIMo6smthG2XN
X-Gm-Message-State: AOJu0Yzt8p3ZpJDx2xghmRTaSFf8S1nRd+GH9dG6FQoNlpVGxW+bw0Vf
 upoN1YwlWvaxvVjJwgyj0gzE58l84J54h9OEFH61AitnFD6MPDXz
X-Google-Smtp-Source: AGHT+IGzOBc1vQHu0QBwklnUCvbjhak188JOOHMbtiFlqkhdFm9lr/bH6DiMEipX26Z4kjyu+6WAGA==
X-Received: by 2002:a5d:6c6a:0:b0:366:ead8:6019 with SMTP id
 ffacd0b85a97d-3677571b6c7mr7819432f8f.49.1719931880435; 
 Tue, 02 Jul 2024 07:51:20 -0700 (PDT)
Received: from [192.168.42.74] ([148.252.146.204])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fba0bsm13413733f8f.69.2024.07.02.07.51.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 07:51:20 -0700 (PDT)
Message-ID: <8335651b-3296-460a-b9a6-4a36a7ec8bc8@gmail.com>
Date: Tue, 2 Jul 2024 15:51:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v15 10/14] tcp: RX path for devmem TCP
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
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
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
References: <20240628003253.1694510-1-almasrymina@google.com>
 <20240628003253.1694510-11-almasrymina@google.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20240628003253.1694510-11-almasrymina@google.com>
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

On 6/28/24 01:32, Mina Almasry wrote:
> In tcp_recvmsg_locked(), detect if the skb being received by the user
> is a devmem skb. In this case - if the user provided the MSG_SOCK_DEVMEM
> flag - pass it to tcp_recvmsg_devmem() for custom handling.
> 
> tcp_recvmsg_devmem() copies any data in the skb header to the linear
> buffer, and returns a cmsg to the user indicating the number of bytes
> returned in the linear buffer.
> 
> tcp_recvmsg_devmem() then loops over the unaccessible devmem skb frags,
> and returns to the user a cmsg_devmem indicating the location of the
> data in the dmabuf device memory. cmsg_devmem contains this information:
> 
> 1. the offset into the dmabuf where the payload starts. 'frag_offset'.
> 2. the size of the frag. 'frag_size'.
> 3. an opaque token 'frag_token' to return to the kernel when the buffer
> is to be released.
> 
> The pages awaiting freeing are stored in the newly added
> sk->sk_user_frags, and each page passed to userspace is get_page()'d.
> This reference is dropped once the userspace indicates that it is
> done reading this page.  All pages are released when the socket is
> destroyed.

Already gave it in v13, but it got lost

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>

-- 
Pavel Begunkov
