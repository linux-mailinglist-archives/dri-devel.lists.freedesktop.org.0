Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20055758451
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 20:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE8E10E0AC;
	Tue, 18 Jul 2023 18:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393F810E0AC
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 18:15:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E8ADC616A0;
 Tue, 18 Jul 2023 18:15:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4D9C433C8;
 Tue, 18 Jul 2023 18:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689704110;
 bh=QH0xYXdTL5ojivjEzeCT3IU9wzvatahM/LtkztuvSTY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M2xJPN8NkR7qyXSRJpzqMsqZ0hj4ofVwtTavhx3nB43D9hiF17Jgg0vUBjoG6GOyZ
 NHkodP8ygOWRSS9EcGASWagCYZyhTXUHuYsu/CHwV0wazaWRQoZmVa0kpq7LXp2KEo
 28do4tKMH65/CCglk9STCpu4TQbBi/e0ydhVmLGH3TWi1Je5kii3sUONcHdZqYy8U0
 8duXFGfRsHj7lNVAeSuuI6a3XqyZcESPQZSAS3CRKS7mCfin+89r6P8xdnFUriaByd
 /8tmr35CcRgdRHefUBhC2OWYDewm1En+PQlBGS0Xnera7dOX1hV4Lo/tGRsDCtGUpg
 Kr8fgqNGjuE0g==
Date: Tue, 18 Jul 2023 11:15:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [RFC PATCH 00/10] Device Memory TCP
Message-ID: <20230718111508.6f0b9a83@kernel.org>
In-Reply-To: <ZLbUpdNYvyvkD27P@ziepe.ca>
References: <20230710223304.1174642-1-almasrymina@google.com>
 <12393cd2-4b09-4956-fff0-93ef3929ee37@kernel.org>
 <CAHS8izNPTwtk+zN7XYt-+ycpT+47LMcRrYXYh=suTXCZQ6-rVQ@mail.gmail.com>
 <ZLbUpdNYvyvkD27P@ziepe.ca>
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
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Eric Dumazet <edumazet@google.com>,
 Andy Lutomirski <luto@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 Jul 2023 15:06:29 -0300 Jason Gunthorpe wrote:
> netlink feels like a weird API choice for that, in particular it would
> be really wrong to somehow bind the lifecycle of a netlink object to a
> process.

Netlink is the right API, life cycle of objects can be easily tied to
a netlink socket.
