Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A8CC502FC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 02:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1844710E675;
	Wed, 12 Nov 2025 01:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TLPc63+d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B364E10E675
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 01:18:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 701A94048B;
 Wed, 12 Nov 2025 01:18:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B678C4CEF5;
 Wed, 12 Nov 2025 01:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762910330;
 bh=97xU45qdEBpW2fivb5PGMD/llcOzvONkpb6RqID0mCE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TLPc63+dMvlBPnRfG3N925Xo9BAPQn4nhuvICt7vX/ogkcFEEN5FSjfLzWsafcs3B
 GdGLo8ylkJMcxrzw6Z5FZjYEDnhTUV4BCC5ciI2Dg3rRy2pW1UTw+wzO58PyzHh5UD
 Yiib+/YdGwGcgVHWYD3oDSt9AESHDpAGpZV5Odn0t7wEK7GmXVhwxO3IQEcKKIvpmQ
 xFNI1jij7O84TF632Q+3tOuHvTo2QLvYzhtrsXvwRBzslAj3FMI/vvvORx8/g2xkIU
 woBXRh6PHna01qzjnYUi+jWSguds+VpSYdCzIKALeSux0JOr2HiFoNcBpvdASddpVL
 gt7o9OCHfd7KA==
Date: Tue, 11 Nov 2025 17:18:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend
 <john.fastabend@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Stanislav
 Fomichev <sdf@fomichev.me>, Simon Horman <horms@kernel.org>, srk@ti.com,
 Meghana Malladi <m-malladi@ti.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH net-next v2 0/7] net: ethernet: ti: am65-cpsw: add
 AF_XDP zero copy support
Message-ID: <20251111171848.1a4c8c03@kernel.org>
In-Reply-To: <20251109-am65-cpsw-xdp-zc-v2-0-858f60a09d12@kernel.org>
References: <20251109-am65-cpsw-xdp-zc-v2-0-858f60a09d12@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 09 Nov 2025 23:37:50 +0200 Roger Quadros wrote:
> This series adds AF_XDP zero coppy support to am65-cpsw driver.
> 
> Tests were performed on AM62x-sk with xdpsock application [1].
> 
> A clear improvement is seen in 64 byte packets on Transmit (txonly)
> and receive (rxdrop).
> 1500 byte test seems to be limited by line rate (1G link) so no
> improvement seen there in packet rate. A test on higher speed link
> (or PHY-less setup) might be worthwile.
> 
> There is some issue during l2fwd with 64 byte packets and benchmark
> results show 0. This issue needs to be debugged further.
> A 512 byte l2fwd test result has been added to compare instead.

It appears that the drivers/net/ethernet/ti/am65-* files do not fall
under any MAINTAINERS entry. Please add one or extend the existing CPSW
entry as the first patch of the series.
