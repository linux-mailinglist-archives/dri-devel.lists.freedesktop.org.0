Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A08A7E8653
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 00:16:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F8410E2B5;
	Fri, 10 Nov 2023 23:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB8D10E2B5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 23:16:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C72B4CE16DE;
 Fri, 10 Nov 2023 23:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF495C433C7;
 Fri, 10 Nov 2023 23:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699658184;
 bh=Uzz0ofUN0GdWH6BIrAshYk7RdH6xgZcN3EjqeZ+1zb0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FTADZZ/90F/7qwZfq6DctzfUcvXxWTAoVgPB4JcKl+BMyH4buYHADpYZMdAzpAtq6
 ZkpHYO/gp4t8yqM3oNbMpeyWBT8vky55ihaponMI0vdm/liYjSt1GC4uyn0V9FVaOt
 Ci5+/YA/uVcx09vVsyYQ+9mkDz0IhRweb9Vvn0hs12m85umwqMGYXjdIZAPzcvHR87
 dipszU5QLy7d/fMOLKUiMqv3+0GQX18SNrmWTTOFuVqonSUFbv2X5QLZ0jGlVpsiRR
 /3/6wSoEMflLvU+dcVnsOv05+hwfMLIhOinjtDs49Ql7PYstp/ifr08J9Rtd/e0jlc
 jJoJdqMU03YUQ==
Date: Fri, 10 Nov 2023 15:16:22 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Subject: Re: [RFC PATCH v3 06/12] memory-provider: dmabuf devmem memory
 provider
Message-ID: <20231110151622.2f45f618@kernel.org>
In-Reply-To: <20231106024413.2801438-7-almasrymina@google.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-7-almasrymina@google.com>
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linaro-mm-sig@lists.linaro.org,
 Shakeel Butt <shakeelb@google.com>, Willem de Bruijn <willemb@google.com>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun,  5 Nov 2023 18:44:05 -0800 Mina Almasry wrote:
> +static int mp_dmabuf_devmem_init(struct page_pool *pool)
> +{
> +	struct netdev_dmabuf_binding *binding = pool->mp_priv;
> +
> +	if (!binding)
> +		return -EINVAL;
> +
> +	if (pool->p.flags & PP_FLAG_DMA_MAP ||
> +	    pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
> +		return -EOPNOTSUPP;

This looks backwards, we should _force_ the driver to use the dma
mapping built into the page pool APIs, to isolate the driver from
how the DMA addr actually gets obtained. Right?

Maybe seeing driver patches would illuminate.
