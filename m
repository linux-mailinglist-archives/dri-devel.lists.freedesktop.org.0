Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFD77E867A
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 00:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0135410E2C3;
	Fri, 10 Nov 2023 23:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F53510E2C3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 23:19:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 62F99CE1299;
 Fri, 10 Nov 2023 23:19:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79674C433C8;
 Fri, 10 Nov 2023 23:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699658361;
 bh=1I7t6Ai+hRiLbbZt727Rjf2UhRX77+78thKzDhoeWNo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=O87Imx2q0q+m9Txp/BMMtKPySHNAC/fXEp5NddB1B31ZjSiC47SpaEs6eJBarHKXm
 +Erk7Qmwa9yVFKKwvAYiGm5AWGK5QVV9b33ahB3sp2SIc6T2CW+FOMDLZq8nL5UCqL
 TtRaBspceqey9QIfFnaplznB+rFQXDfxqixws23mVhSOk/JejjtM/hFqCymVDQ52n7
 tkXcanIIYj9S5W1AQ0IR8GD/uNZMowbqeS9hpF9JS8WIJR9L0qjPwiVrM+/FWRCsTz
 LWLgjQbjT2MJdhifaDNGqktUUGdKgMvYBKr3eMlvijg9am5zIQ3eX6QWTgNboVneoe
 5FQBROhSnrQRw==
Date: Fri, 10 Nov 2023 15:19:19 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Subject: Re: [RFC PATCH v3 10/12] tcp: RX path for devmem TCP
Message-ID: <20231110151919.4789d54b@kernel.org>
In-Reply-To: <20231106024413.2801438-11-almasrymina@google.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-11-almasrymina@google.com>
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

On Sun,  5 Nov 2023 18:44:09 -0800 Mina Almasry wrote:
> +		if (!skb_frags_not_readable(skb)) {

nit: maybe call the helper skb_frags_readable() and flip
     the polarity, avoid double negatives.
