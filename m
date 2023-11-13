Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C777EA5E4
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 23:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A968825E;
	Mon, 13 Nov 2023 22:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE9610E227
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 22:17:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3D750CE0918;
 Mon, 13 Nov 2023 22:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ACAAC433C8;
 Mon, 13 Nov 2023 22:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699913845;
 bh=CxWQpMYa8YFxdmrO7alx+fTpOfQbmSEl3BDYj4zQHDQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pfTtVlCfr2biHw2W2q09MzqRYOXyxULA1cvXKH7lJgKmOoBelavwg2NXMOeLV7RUo
 hrZuG3PHE0z5OMU4LNRcYJVjk0cH2848YM8SF61BQovVnipqwkNu8pDfRo54FL/qed
 /K+B+kMd4vlsDHBN45H7bcB4/VHCJY4WQK9LS2T0cMlbtHGDade5u1H98jC04pTWwN
 KPdxdN8TpGk98s6qR3UTMZL77bOJSTg3QVyGaeJlKZR8wMv/V50rWPbz2j2fb7M3J8
 gAhCxBNq7Y1mkkatFEdAbqH0WbqHrEMgjNWtPrunbYike0UbTQowc3cHZ7MmbWmELA
 naKo5qrdJEm0Q==
Date: Mon, 13 Nov 2023 17:17:21 -0500
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Subject: Re: [RFC PATCH v3 08/12] net: support non paged skb frags
Message-ID: <20231113171721.1a6731e6@kernel.org>
In-Reply-To: <CAHS8izN7MydkJPaHfj7Pw0V+xoDBkCmEVTc1TH24=hjXm98xnQ@mail.gmail.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-9-almasrymina@google.com>
 <20231110151935.0859fd7a@kernel.org>
 <CAHS8izN7MydkJPaHfj7Pw0V+xoDBkCmEVTc1TH24=hjXm98xnQ@mail.gmail.com>
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

On Sun, 12 Nov 2023 22:05:30 -0800 Mina Almasry wrote:
> My issue here is that all these skb helpers call each other so I end
> up having to move a lot of the unrelated skb helpers to this new
> header (maybe that is acceptable but it feels weird).

Splitting pp headers again is not an option, we already split it into
types and helpers.

The series doesn't apply and it's a bit hard for me to, in between LPC
talks, figure out how to extract your patches from the GH UI to take a
proper look :(
We can defer this for now, and hopefully v4 will apply to net-next.
But it will need to get solved.
