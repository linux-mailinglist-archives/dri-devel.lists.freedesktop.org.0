Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC94C5035C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 02:30:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE47F10E677;
	Wed, 12 Nov 2025 01:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z2wWr4nQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B5310E677
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 01:30:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 076C24434E;
 Wed, 12 Nov 2025 01:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ABC7C116D0;
 Wed, 12 Nov 2025 01:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762911021;
 bh=75PIuoHEXowMg/7egDgGlJsGW/yk5CKxaEHvNzexu6E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Z2wWr4nQGufj/mfHfSS5vL/+HsWpj9VwvHN61lPeN3wnv673+R/gZnT9a3gn3GrD0
 /svl20KP4/RbOadwddhv2UO2SZwJmSeL84cmiPbj9+c7v3EN/K0mjOH2ZAhaPafZXe
 yfpvgIERk9bIaYusDYzqTDonJzYE5LKKOb/EYMkSl6W3sGHa3vOuE8yqNwB38j15Fb
 0K4I3/zcqU67oXSlIAwLATwlp+xfoD1/26uBODoPzQikcYqP5mxRMuagFSEZPd9hPK
 JuAsEUsQK86luC7uuYq6Srdmvxbh98Qy7EDu7XOCY/JBQd9hu+v9+zPtGT+K6/lhFs
 JeN8MvvVKAKgA==
Date: Tue, 11 Nov 2025 17:30:20 -0800
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
Subject: Re: [PATCH net-next v2 4/7] net: ethernet: ti: am65-cpsw: Add
 AF_XDP zero copy for RX
Message-ID: <20251111173020.360b1066@kernel.org>
In-Reply-To: <20251109-am65-cpsw-xdp-zc-v2-4-858f60a09d12@kernel.org>
References: <20251109-am65-cpsw-xdp-zc-v2-0-858f60a09d12@kernel.org>
 <20251109-am65-cpsw-xdp-zc-v2-4-858f60a09d12@kernel.org>
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

On Sun, 09 Nov 2025 23:37:54 +0200 Roger Quadros wrote:
> +			ndev->stats.rx_dropped++;

AFAIU the device is multi-queue so using per-device stats looks racy.
Please create your own per queue stats.
