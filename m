Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F68F7EA5F6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 23:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB6110E227;
	Mon, 13 Nov 2023 22:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126DB10E3A3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 22:20:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A2A16CE1167;
 Mon, 13 Nov 2023 22:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75A0EC433C7;
 Mon, 13 Nov 2023 22:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699914024;
 bh=R+gas78q/rvPvc1kUH78XbnbTKo2Ls44dPUWBDGT9JY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H2oFoJ4JwWcow7QQVGWT7o7+6BKqYDkBpd/F37ak0T9fnxswoa5dmcnZ++ryAbVv4
 DMWx1dDwgEsJPFGxjLwOHexcnf4qA78WlQOdWo3YKehBb+iPvN8Yy8+5YkUDLvnhpL
 yWNxMyN3aw1az9HCCuvrSQ2KVZN8aFkw9VJjD9cLDvNc2XSpkh4xojMkCUpLQiMu5R
 9cdrKm4OC7qrZc32mLEQh9yYshy4htBQ9xO0ijTLRXQxUYqh6M0F+l9SBNMXPw1Dbk
 sFKGfNDJI9vFFf9ahSFoa1LCKSEmgGMnY8pl5OEK/urBfuBOE8cRS+gLIkQb2T/GKi
 qomBR0lIPTeAA==
Date: Mon, 13 Nov 2023 17:20:20 -0500
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Subject: Re: [RFC PATCH v3 12/12] selftests: add ncdevmem, netcat for devmem
 TCP
Message-ID: <20231113172020.728cdf6a@kernel.org>
In-Reply-To: <CAHS8izMQQekAdkLF7eFHfwGJJ=LFmGLHpSpOYiQeLs96ByEK7w@mail.gmail.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-13-almasrymina@google.com>
 <20231110151335.38a1c6ec@kernel.org>
 <CAHS8izNFnE8RGgBhKzxhVoKXtXgZGVQCLSdm4_dWNeH9Gx-WDQ@mail.gmail.com>
 <20231110183556.2b7b7502@kernel.org>
 <CAHS8izMQQekAdkLF7eFHfwGJJ=LFmGLHpSpOYiQeLs96ByEK7w@mail.gmail.com>
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

On Sun, 12 Nov 2023 20:08:10 -0800 Mina Almasry wrote:
> 1. For (b), would it be OK to implement a very minimal version of
> queue_[stop|start]/queue_mem_[alloc|free], which I use for the sole
> purpose of reposting buffers to an individual queue, and then later
> whoever picks up your queue API effort (maybe me) extends the
> implementation to do the rest of the things you described in your
> email? If not, what is the minimal queue API I can implement and use
> for devmem TCP?

Any form of queue API is better than a temporary ndo.
IIUC it will not bubble up into uAPI in any way so we can extend/change
it later as needed.

> 2. Since this is adding ndo, do I need to implement the ndo for 2
> drivers or is GVE sufficient?

One driver is fine, especially if we're doing this instead of the reset
hack.
