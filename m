Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5166191BC3D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 12:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779CE10E241;
	Fri, 28 Jun 2024 10:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BSkrMkV3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277AB10E241
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 10:10:37 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42564316479so3151925e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 03:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719569435; x=1720174235; darn=lists.freedesktop.org;
 h=mime-version:user-agent:references:message-id:date:in-reply-to
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=djRjxO/ZJBQCrIZgaI6fk/U62O19bgzxywyn0TmHo/A=;
 b=BSkrMkV3Jh7a6UgYcphbaLKnoJt1lUPSwxL56XYm27wiB2xBDirr4WiQmP9NAw670L
 633Djw7Mp5hLKoBW0Z9q6uyNa+IRxQ53DvtV1g4KqrbyU65dsMA9xakI6XzHe98ocRug
 vt0HmA5xFWk889ZKbPqUcTBudBtFV1Hriv4RP3d2WGOfOJBrBBqyt0ZokDqclaMoKiX8
 hsB8XxFyYqHxkxPv/xBveDluGK+e5oN+smHEqJEMlZEoePRUeONBTCC5yQQXP18zfkSs
 ZTOJLxzk3rd/ugLLAtLGSpTjKMVh+vB+fP1v41UFP+WdnFY1r4ZsM77AfXURpUTs+Jkb
 AIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719569435; x=1720174235;
 h=mime-version:user-agent:references:message-id:date:in-reply-to
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=djRjxO/ZJBQCrIZgaI6fk/U62O19bgzxywyn0TmHo/A=;
 b=hsyspjetfggtEMpcoZcHr9AzofIh5sSu6EbCs3qPbjEP/tP3bV9eJszXOF5vIGRqDL
 m4qIcz/TAMTawKOjQCCGXZngCzcLMwgglw8hTXteJJoaueehNsA4SGQ9MzJiX1DLKzmX
 xmgEohgx7YsNUH2g6zPD1pDWec08DeFIdTrdjBjLjP2HzHStvrwC4neQleZFbWugIHa6
 CbtvjDDXX3niZbokAXJslJuisFjNsQxim71/Xu1qrsa9r8gi5grBOiiIPfKcMMHefmPt
 AiDnG8grShTPJDSu8uafqDkeyitIdesj0o0p5L3lOn7Kcq2S5SUmHl4WqT7tAC0X3cNN
 ogew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtd6/IwbTzKDW1IsaItwmHaQFngLD37XoQPr+3cVamsVdF0o8ucDRW+xVZW73SZv1VqsAvDZq7+h9BICZhmeMRCKKIzJAYNPEllYhYKbEV
X-Gm-Message-State: AOJu0Yz0kpkczIxMyLMCp1vH3Lc+CFFlhoKddHVr0bmxl5mu1zEWSIps
 pmyEKeqKo7f1llaBUCRwxbU2IJ3/MHF9jjjm65yOZWumRlLdj9gD
X-Google-Smtp-Source: AGHT+IGTbLKuH6+lACoVW6gBGISTlFA2luNgNp0at8l17FynGxoGb7mI7uIhlXYSjVIEoYumxGZPkg==
X-Received: by 2002:a7b:cc16:0:b0:424:8e3a:d020 with SMTP id
 5b1f17b1804b1-42498ced472mr80452775e9.29.1719569435211; 
 Fri, 28 Jun 2024 03:10:35 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:49ff:2a2d:712c:9944])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b0c15f8sm26999325e9.47.2024.06.28.03.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 03:10:34 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,  linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org,  linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org,  linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org,  bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org,  linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Jonathan
 Corbet <corbet@lwn.net>,  Richard Henderson
 <richard.henderson@linaro.org>,  Ivan Kokshaysky
 <ink@jurassic.park.msu.ru>,  Matt Turner <mattst88@gmail.com>,  Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>,  "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>,  Helge Deller <deller@gmx.de>,
 Andreas Larsson <andreas@gaisler.com>,  Jesper Dangaard Brouer
 <hawk@kernel.org>,  Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>,  Masami Hiramatsu
 <mhiramat@kernel.org>,  Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>,  Arnd Bergmann <arnd@arndb.de>,  Alexei
 Starovoitov <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,  Martin KaFai Lau
 <martin.lau@linux.dev>,  Eduard Zingerman <eddyz87@gmail.com>,  Song Liu
 <song@kernel.org>,  Yonghong Song <yonghong.song@linux.dev>,  John
 Fastabend <john.fastabend@gmail.com>,  KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>,  Hao Luo <haoluo@google.com>,  Jiri
 Olsa <jolsa@kernel.org>,  Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,  David Ahern
 <dsahern@kernel.org>,  Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>,  Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,  Bagas Sanjaya
 <bagasdotme@gmail.com>,  Christoph Hellwig <hch@infradead.org>,  Nikolay
 Aleksandrov <razor@blackwall.org>,  Pavel Begunkov
 <asml.silence@gmail.com>,  David Wei <dw@davidwei.uk>,  Jason Gunthorpe
 <jgg@ziepe.ca>,  Yunsheng Lin <linyunsheng@huawei.com>,  Shailend Chand
 <shailend@google.com>,  Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,  Jeroen de Borst
 <jeroendb@google.com>,  Praveen Kaligineedi <pkaligineedi@google.com>
Subject: Re: [PATCH net-next v15 12/14] net: add devmem TCP documentation
In-Reply-To: <20240628003253.1694510-13-almasrymina@google.com> (Mina
 Almasry's message of "Fri, 28 Jun 2024 00:32:49 +0000")
Date: Fri, 28 Jun 2024 11:09:28 +0100
Message-ID: <m234oxcraf.fsf@gmail.com>
References: <20240628003253.1694510-1-almasrymina@google.com>
 <20240628003253.1694510-13-almasrymina@google.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
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

Mina Almasry <almasrymina@google.com> writes:
> +
> +The user must bind a dmabuf to any number of RX queues on a given NIC using
> +the netlink API::
> +
> +	/* Bind dmabuf to NIC RX queue 15 */
> +	struct netdev_queue *queues;
> +	queues = malloc(sizeof(*queues) * 1);
> +
> +	queues[0]._present.type = 1;
> +	queues[0]._present.idx = 1;
> +	queues[0].type = NETDEV_RX_QUEUE_TYPE_RX;
> +	queues[0].idx = 15;
> +
> +	*ys = ynl_sock_create(&ynl_netdev_family, &yerr);
> +
> +	req = netdev_bind_rx_req_alloc();
> +	netdev_bind_rx_req_set_ifindex(req, 1 /* ifindex */);
> +	netdev_bind_rx_req_set_dmabuf_fd(req, dmabuf_fd);
> +	__netdev_bind_rx_req_set_queues(req, queues, n_queue_index);
> +
> +	rsp = netdev_bind_rx(*ys, req);
> +
> +	dmabuf_id = rsp->dmabuf_id;
> +
> +
> +The netlink API returns a dmabuf_id: a unique ID that refers to this dmabuf
> +that has been bound.

The docs don't mention the unbinding behaviour. Can you add the text
from the commit message for patch 3 ?
