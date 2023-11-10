Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 810747E8674
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 00:19:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24EE10E2C2;
	Fri, 10 Nov 2023 23:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2C410E2C2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 23:19:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B24A1CE12C9;
 Fri, 10 Nov 2023 23:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F09C433C7;
 Fri, 10 Nov 2023 23:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699658349;
 bh=Dd3jebo4AS2ZWH3RN1miW12tLJYVseY43ijk1beJi20=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H9fRqmR1U2biaQbf9D263gpWDTf7YUhWXczhracH0Gqee0CmKA+qgzlo4rVot0AT4
 VvRnNAMYi7xL/S717i4c4IPxlDQ27Xxz57zXWvgzpQbfb74hpSm4wp2JFMaRxkOJzB
 fj+czz+E8Oyt4aBl87v8bnmzxlr/c0CbeoIEEYUAueWdb4mk+2NjoQkZEjcjQBwozh
 9LfL+qJ3dyIPJ7NWqMHfS+YwblGi8nruc0OQAmVHTOTE14qsTB3BQT468KtuRrzLAb
 UoScOA5QJtOXbeetxc/ztCQwsddpviKocGz4LIRvi4ARQsbMSMxQImFnyt701L9Nqf
 m1tE/OsABgSxA==
Date: Fri, 10 Nov 2023 15:19:07 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Subject: Re: [RFC PATCH v3 02/12] net: page_pool: create hooks for custom
 page providers
Message-ID: <20231110151907.023c61cd@kernel.org>
In-Reply-To: <20231106024413.2801438-3-almasrymina@google.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-3-almasrymina@google.com>
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
Cc: linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Eric Dumazet <edumazet@google.com>,
 Shakeel Butt <shakeelb@google.com>, linux-kselftest@vger.kernel.org,
 Praveen Kaligineedi <pkaligineedi@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun,  5 Nov 2023 18:44:01 -0800 Mina Almasry wrote:
> diff --git a/include/net/page_pool/types.h b/include/net/page_pool/types.h
> index 6fc5134095ed..d4bea053bb7e 100644
> --- a/include/net/page_pool/types.h
> +++ b/include/net/page_pool/types.h
> @@ -60,6 +60,8 @@ struct page_pool_params {
>  	int		nid;
>  	struct device	*dev;
>  	struct napi_struct *napi;
> +	u8		memory_provider;
> +	void            *mp_priv;
>  	enum dma_data_direction dma_dir;
>  	unsigned int	max_len;
>  	unsigned int	offset;

you should rebase on top of net-next

More importantly I was expecting those fields to be gone from params.
The fact that the page pool is configured to a specific provider
should be fully transparent to the driver, driver should just tell
the core what queue its creating the pool from and if there's a dmabuf
bound for that queue - out pops a pp backed by the dmabuf.

My RFC had the page pool params fields here as a hack.
