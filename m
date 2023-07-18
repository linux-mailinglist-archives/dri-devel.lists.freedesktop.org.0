Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE917588AB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 00:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3EE610E3CA;
	Tue, 18 Jul 2023 22:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C18010E3CA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 22:45:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AAB02612CF;
 Tue, 18 Jul 2023 22:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73956C433C9;
 Tue, 18 Jul 2023 22:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689720305;
 bh=QPRDZN417wjG3/qI9dDTrKSyuqoeFrA3S2sudllzHvw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=I7ocP0MTAirrwG4O3BO3sgJtAZf1AJsUW77twR7BAnv8XpKWfEiykdbxMVfJitMQz
 wsO9R5ARS30sZ610w8glfUqSp2ATk8XKuYDTOzbCrBdafDcnsXZAs1mURzqD6ROGQS
 oC/bzDXWaeXLzVz14Pz2NEZwox6r1Jq4t4LrfLeMLvi2XoFw7Fyi4DlO0VaF4qdICI
 BzPyOlM+XEviMn/WFmV6C00aKMV99Sqm/uyXjIqhbqAEJ8BLdzqi0fVaFTXzBJshI6
 Zs4+zXH8p0XWCVCAu77Oj41p/FZCoid5iSNxgf4LxA128Zmt79ALiEDRVuAms9Zzam
 lCnJHtFJp0Rqg==
Date: Tue, 18 Jul 2023 15:45:03 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: David Ahern <dsahern@kernel.org>
Subject: Re: [RFC PATCH 00/10] Device Memory TCP
Message-ID: <20230718154503.0421b4cd@kernel.org>
In-Reply-To: <eb34f812-a866-a1a3-9f9b-7d5054d17609@kernel.org>
References: <20230710223304.1174642-1-almasrymina@google.com>
 <12393cd2-4b09-4956-fff0-93ef3929ee37@kernel.org>
 <CAHS8izNPTwtk+zN7XYt-+ycpT+47LMcRrYXYh=suTXCZQ6-rVQ@mail.gmail.com>
 <ZLbUpdNYvyvkD27P@ziepe.ca> <20230718111508.6f0b9a83@kernel.org>
 <35f3ec37-11fe-19c8-9d6f-ae5a789843cb@kernel.org>
 <20230718112940.2c126677@kernel.org>
 <eb34f812-a866-a1a3-9f9b-7d5054d17609@kernel.org>
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
Cc: Mina Almasry <almasrymina@google.com>, linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 linux-kselftest@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Eric Dumazet <edumazet@google.com>, Andy Lutomirski <luto@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 Jul 2023 16:35:17 -0600 David Ahern wrote:
> I do not see how 1 RSS context (or more specifically a h/w Rx queue) can
> be used properly with memory from different processes (or dma-buf
> references). When the process dies, that memory needs to be flushed from
> the H/W queues. Queues with interlaced submissions make that more
> complicated.

Agreed, one process, one control path socket.

FWIW the rtnetlink use of netlink is very basic. genetlink already has
some infra which allows associate state with a user socket and cleaning
it up when the socket gets closed. This needs some improvements. A bit
of a chicken and egg problem, I can't make the improvements until there
are families making use of it, and nobody will make use of it until
it's in tree... But the basics are already in place and I can help with
building it out.

> I guess the devil is in the details; I look forward to the evolution of
> the patches.

+1
