Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC60189F416
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 15:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82EFB10E9F6;
	Wed, 10 Apr 2024 13:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Eaok+4aH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0468010E9E3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 13:24:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 59A7DCE286D;
 Wed, 10 Apr 2024 13:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 937DEC433C7;
 Wed, 10 Apr 2024 13:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712755453;
 bh=WNjHEnZYwyX9uPtDNGEk3WQ8G2R5IDZTvmlqm+KjAj0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Eaok+4aHCN8wUZsm/y/+J4rMX5hOhpAUn+GHi2BkviKOJj4O6qyRbFsHL0J9wQuCZ
 560bix0pr3PEB/C9zVVqMNGYqnP4ZoKcqkWr1p2f+nFAGK8cJ7spiwTQOswhxqvExb
 Ryx/qOriQaDG4VeHIrGx1qnyG/YSzsFgGkQWmBGyL4UaIR7rjlnyS7aLURSgStOPRY
 SCieJNwJtB9OYFZ1/2Go6Ge3afIsIHlWx3mV25b1kHMwjmywQ6pefbCWzol/PP87Y/
 P/+zK//v1smceidm0Nxh1TQiamFqM5w8nkfg9wUQRY2J0yhk0TLMGTRXQjBMLJpTLZ
 4KB0dvQbOnRlg==
Date: Wed, 10 Apr 2024 06:24:11 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Julien Panis <jpanis@baylibre.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell King
 <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>, Ratheesh Kannoth <rkannoth@marvell.com>, Naveen
 Mamindlapalli <naveenm@marvell.com>, danishanwar@ti.com,
 yuehaibing@huawei.com, rogerq@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH net-next v8 2/3] net: ethernet: ti: Add desc_infos
 member to struct k3_cppi_desc_pool
Message-ID: <20240410062411.1096c881@kernel.org>
In-Reply-To: <6f356fec-4384-4367-8812-a18b71156116@baylibre.com>
References: <20240223-am65-cpsw-xdp-basic-v8-0-f3421b58da09@baylibre.com>
 <20240223-am65-cpsw-xdp-basic-v8-2-f3421b58da09@baylibre.com>
 <20240409173948.66abe6fa@kernel.org>
 <6f356fec-4384-4367-8812-a18b71156116@baylibre.com>
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

On Wed, 10 Apr 2024 10:36:16 +0200 Julien Panis wrote:
> Also, about mem alloc failures, shouldn't we free 'pool' on kstrdup_const()
> error at the beginning of k3_cppi_desc_pool_create_name() ?
> I mean, it's not visible in my patch but I now wonder if this was done
> properly even before I modify the file.

Yes, it uses managed memory (devm_*) but prueth (I didn't check other
callers) calls it from .ndo_open. So while not technically a full leak
we can accumulate infinite memory by repeatedly failing here :S
