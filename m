Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 828367E8646
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 00:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063C510E00B;
	Fri, 10 Nov 2023 23:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF7E10E00B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 23:13:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0D6D4CE1736;
 Fri, 10 Nov 2023 23:13:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 311CFC433C8;
 Fri, 10 Nov 2023 23:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699658017;
 bh=3kEmglIzeVKeC89qJz186In/g6MnNvWn/X0kBCEAmR0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=urs+N/fb0zYrePTt7BfGxDX3SlOzERDJqx1nVlvFB0bjm20DEIOtlngKpII5c8iUC
 JA+a/PQoHqi7fbtMcF6+72fNv57rXF0fFdo9uGu4Ib4h2e/rh0hXSVpgxVOwgyaE18
 ZOl47igkAtH6rUtgZzs1JZI9ZKl+tQln3SdK3zFqeuuKQSad1G2Qof0r6YqS5f+K/m
 avCl0oRY/UckS2XaoWsLJL6GjlHYaQMA8DZIW6fJPMh3vDNg2oHIlMUpsvzmjp/Qf8
 KlRCpaECHCkbwoKHIiku1cErTYNEclyDVpCghn5fmL2ME3UUxI7uHtCDyIvZ2t9Hq/
 OtoukLeU9AnSw==
Date: Fri, 10 Nov 2023 15:13:35 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Subject: Re: [RFC PATCH v3 12/12] selftests: add ncdevmem, netcat for devmem
 TCP
Message-ID: <20231110151335.38a1c6ec@kernel.org>
In-Reply-To: <20231106024413.2801438-13-almasrymina@google.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-13-almasrymina@google.com>
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

My brain is slightly fried after trying to catch up on the thread 
for close to 2h. So forgive me if I'm missing something.
This applies to all emails I'm about to send :)

On Sun,  5 Nov 2023 18:44:11 -0800 Mina Almasry wrote:
> +	trigger_device_reset();

The user space must not be responsible for the reset.
We can add some temporary "recreate page pools" ndo
until the queue API is ready. 

But it should not be visible to the user in any way.

And then the kernel can issue the same reset when the netlink 
socket dies to flush device free lists.

Maybe we should also add a "allow device/all-queues reload" flag 
to the netlink API to differentiate drivers which can't implement 
full queue API later on. We want to make sure the defaults work well 
in our "target design", rather than at the first stage. And target
design will reload queues one by one.
