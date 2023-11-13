Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E5A7EA5BD
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 23:11:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E9610E223;
	Mon, 13 Nov 2023 22:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F30E10E223
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 22:11:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 65D4CB810B9;
 Mon, 13 Nov 2023 22:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73772C433C8;
 Mon, 13 Nov 2023 22:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699913462;
 bh=y8SvI32OK2xraWnJ4KYO59jDyKCSgMJ4BUaSyMs0sXQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sh8VLAlu2TmvxYxt3GN/26B09B8wkV2+1djcwE8Do3NvbevLDLFLmcF4YsP/sCiHD
 NW4TAVN2626qYqQZ9gcvgaKIoHkfVe+s2AWqXNrsu8Xl0AfBnF1Vd8JWmlqeVdBKOM
 h2ru3fjERW2LWok5RGV9gkJxm2hnRvqjsTxAfYZyMO9A2PhTDH5PN+1t8UAu1SEGIZ
 NOIR0ex6iou1GQEd1NFF2ucKqLJjr9mKhphshDQXzoqdPKJhBHReb0wsywTUyCOztx
 tLE5Vxef0IOTcXVEzGS5tfTu8GIR8oCdjW0zUkV3ILeho4XhBy1idGuC8LO3I8aBdJ
 yzLBad+6UuGBg==
Date: Mon, 13 Nov 2023 17:10:58 -0500
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Subject: Re: [RFC PATCH v3 02/12] net: page_pool: create hooks for custom
 page providers
Message-ID: <20231113171058.68973860@kernel.org>
In-Reply-To: <CAHS8izPKRh7ukRytXaweKcY_76sE7F_3s1sYVgsUXYGrypK93Q@mail.gmail.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-3-almasrymina@google.com>
 <20231110151907.023c61cd@kernel.org>
 <CAHS8izPKRh7ukRytXaweKcY_76sE7F_3s1sYVgsUXYGrypK93Q@mail.gmail.com>
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

On Sun, 12 Nov 2023 19:28:52 -0800 Mina Almasry wrote:
> My issue with this is that if the driver doesn't support dmabuf then
> the driver will accidentally use the pp backed by the dmabuf, allocate
> a page from it, then call page_address() on it or something, and
> crash.
> 
> Currently I avoid that by having the driver be responsible for picking
> up the dmabuf from the netdev_rx_queue and giving it to the page pool.
> What would be the appropriate way to check for driver support in the
> netlink API? Perhaps adding something to ndo_features_check?

We need some form of capabilities. I was expecting to add that as part
of the queue API. Either a new field in struct net_device or in ndos.
I tend to put static driver caps of this nature into ops.
See for instance .supported_ring_params in ethtool ops.
