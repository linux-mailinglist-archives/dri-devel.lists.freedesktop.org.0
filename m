Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B3B875C1C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 02:53:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A97112420;
	Fri,  8 Mar 2024 01:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j1e2eFrn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13870112420
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 01:52:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8805F61D7D;
 Fri,  8 Mar 2024 01:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C15C433C7;
 Fri,  8 Mar 2024 01:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709862775;
 bh=fz2pz2qjIfAAtut6NhHBeh0SUMiiU7K6EGRFxYVj02A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=j1e2eFrnn2oGzuVI3SS8F8y9zj4WESKfPCGRxrfE8ZJwdFzIUuvscskwKoFmi+DTe
 UQmZ0KaIT3FF+FRpvXC6we5R6cqKVQ7PxIT27sMixkPliMu3Q10jSkbVbV5UEqldl7
 g/9r/3K4E7HEUji3HbNPzbY8omvaOXtRxaoIHdESIZ07gj3Ebg3Tdiz+dxppi8+jVN
 BX5lADSuUgx4Ca1OlmwBB9024w6TIVf/My/1+BI6NipJq3nAC/RvlOAv/pJv1Kh/oq
 jrMd8QyNrvFBw/AxA8zJ5pfQk2+B6Nc/DvQ9ALIqVkGZAgwr5qSmd+ZDwfJUQwO1jV
 eIx8mkvdJmylw==
Date: Thu, 7 Mar 2024 17:52:51 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Richard Henderson
 <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer
 <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Arnd Bergmann
 <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, David Ahern <dsahern@kernel.org>, Willem de Bruijn
 <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, Sumit
 Semwal <sumit.semwal@linaro.org>, "Christian =?UTF-8?B?S8O2bmln?="
 <christian.koenig@amd.com>, Pavel Begunkov <asml.silence@gmail.com>, David
 Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin
 <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, Harshitha
 Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeelb@google.com>,
 Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi
 <pkaligineedi@google.com>
Subject: Re: [RFC PATCH net-next v6 14/15] net: add devmem TCP documentation
Message-ID: <20240307175251.309837e1@kernel.org>
In-Reply-To: <20240305020153.2787423-15-almasrymina@google.com>
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-15-almasrymina@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon,  4 Mar 2024 18:01:49 -0800 Mina Almasry wrote:
> +Intro
> +=====
> +
> +Device memory TCP (devmem TCP) enables receiving data directly into device
> +memory (dmabuf). The feature is currently implemented for TCP sockets.
> +
> +
> +Opportunity
> +-----------
> +
> +A large amount of data transfers have device memory as the source and/or

s/amount/number/

> +destination. Accelerators drastically increased the volume of such transfers.

s/volume/prevalence/

> +Some examples include:
> +
> +- Distributed training, where ML accelerators, such as GPUs on different hosts,
> +  exchange data among them.

s/among them//

> +- Distributed raw block storage applications transfer large amounts of data with
> +  remote SSDs, much of this data does not require host processing.
> +
> +Today, the majority of the Device-to-Device data transfers the network are

"Today" won't age well.

> +implemented as the following low level operations: Device-to-Host copy,
> +Host-to-Host network transfer, and Host-to-Device copy.
> +
> +The implementation is suboptimal, especially for bulk data transfers, and can

/The implementation/The flow involving host copies/

> +put significant strains on system resources such as host memory bandwidth and
> +PCIe bandwidth.
> +
> +Devmem TCP optimizes this use case by implementing socket APIs that enable
> +the user to receive incoming network packets directly into device memory.

> +More Info
> +---------
> +
> +  slides, video
> +    https://netdevconf.org/0x17/sessions/talk/device-memory-tcp.html
> +
> +  patchset
> +    [RFC PATCH v3 00/12] Device Memory TCP
> +    https://lore.kernel.org/lkml/20231106024413.2801438-1-almasrymina@google.com/T/

Won't age well? :)

> +Interface
> +=========
> +
> +Example
> +-------
> +
> +tools/testing/selftests/net/ncdevmem.c:do_server shows an example of setting up
> +the RX path of this API.
> +
> +NIC Setup
> +---------
> +
> +Header split, flow steering, & RSS are required features for devmem TCP.
> +
> +Header split is used to split incoming packets into a header buffer in host
> +memory, and a payload buffer in device memory.
> +
> +Flow steering & RSS are used to ensure that only flows targeting devmem land on
> +RX queue bound to devmem.
> +
> +Enable header split & flow steering:
> +
> +::

You can put the :: at the end of the text, IIRC, like this:

Enable header split & flow steering::

> +
> +	# enable header split (assuming priv-flag)
> +	ethtool --set-priv-flags eth1 enable-header-split on

Olek added the "set" in commit 50d73710715d ("ethtool: add SET for
TCP_DATA_SPLIT ringparam"), no need for the priv flag any more.
