Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3057E8657
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 00:16:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C4910E2BB;
	Fri, 10 Nov 2023 23:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0F310E2BB
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 23:16:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E3DB6B823C2;
 Fri, 10 Nov 2023 23:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D168C433C8;
 Fri, 10 Nov 2023 23:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699658191;
 bh=lp6MUfcnlWg0MaE5+BDw4kORckYukPsXO/JArSSKHJ0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iVuzaAhclFKl7LeZxL1NI8Ry5+2sm28Vs5NzEPoZdxbe3go12IaDJWLkU1qciBkSM
 whBYgKfAUNPBSEhJE4QJ7XezrNh7jGDkV5xIkVM0WEaslaTziGDnt7EcXARHStWAV+
 X6UvXOaaioy3gynvYEIjRXId9KFFQwsnC44K5pRX/XKXmzuJmcbveiUyk5oASlRWGl
 kJorEGqFqwRuYuDjtmNfv3ReaToE+lgcd+/1MwmRx/qDbHlD4itRI3rUiLvAhgRsE6
 /3K9PErcilfL1+yDjqcvhNbjPdvssNyP6Hk78Zm7WjFtgVSVlPYeMoU0i4fqtJVGeA
 dQ6M9ylbMVj5Q==
Date: Fri, 10 Nov 2023 15:16:29 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Subject: Re: [RFC PATCH v3 03/12] net: netdev netlink api to bind dma-buf to
 a net device
Message-ID: <20231110151629.047b1389@kernel.org>
In-Reply-To: <20231106024413.2801438-4-almasrymina@google.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-4-almasrymina@google.com>
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
Cc: dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linaro-mm-sig@lists.linaro.org,
 Shakeel Butt <shakeelb@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun,  5 Nov 2023 18:44:02 -0800 Mina Almasry wrote:
> +      -
> +        name: queues
> +        doc: receive queues to bind the dma-buf to.
> +        type: u32
> +        multi-attr: true

I think that you should throw in the queue type.
I know you made the op imply RX:

> +    -
> +      name: bind-rx

but if we decide to create a separate "type" for some magic 
queue type one day we'll have to ponder how to extend this API

IMHO queue should be identified by a <type, id> tuple, always.
