Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BF1B052E6
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA7910E527;
	Tue, 15 Jul 2025 07:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="jRJpb3zk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 6903 seconds by postgrey-1.36 at gabe;
 Mon, 14 Jul 2025 11:15:44 UTC
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CA410E00E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 11:15:44 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56E9KCVD2579656;
 Mon, 14 Jul 2025 04:20:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1752484812;
 bh=VpRIsrh/SskIsYvaFioLSeLx3UZ4lfhfIHEZTyHFdm4=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=jRJpb3zkCM2TPcl/pnOSPoKvoGNKE2RRL8R3vySw8ty8MIGmfwjLeyF/u2TXmutp1
 3kg/8FTnKIMknYEV9gFX7feo6LK+SBynXsCac5zuUWnOD1argqveNGhHjY4N5Ds1IG
 V6LF4DGptIMEQl/nT4H3TZDsByJhpPtZ57s301+M=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56E9KCRv3165019
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Mon, 14 Jul 2025 04:20:12 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 14
 Jul 2025 04:20:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 14 Jul 2025 04:20:11 -0500
Received: from [172.24.26.195] (lt9560gk3.dhcp.ti.com [172.24.26.195])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56E9K55c269797;
 Mon, 14 Jul 2025 04:20:06 -0500
Message-ID: <268f6849-efc6-4663-af20-f6726bd4b78d@ti.com>
Date: Mon, 14 Jul 2025 14:50:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next 0/5] net: ethernet: ti: am65-cpsw: add AF_XDP
 zero copy support
To: Roger Quadros <rogerq@kernel.org>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard
 Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
CC: <srk@ti.com>, <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
References: <20250520-am65-cpsw-xdp-zc-v1-0-45558024f566@kernel.org>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <20250520-am65-cpsw-xdp-zc-v1-0-45558024f566@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Approved-At: Tue, 15 Jul 2025 07:24:49 +0000
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

Hi Roger,

On 5/20/2025 3:53 PM, Roger Quadros wrote:
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
> results show 0. I'm still investigating this issue.
> 
> AF_XDP performance using 64 byte packets in Kpps.
> Benchmark:	XDP-SKB		XDP-Native	XDP-Native(ZeroCopy)
> rxdrop		317		504		824
> txonly		400		405		757
> l2fwd 		207		264		0
> 
> AF_XDP performance using 1500 byte packets in Kpps.
> Benchmark:	XDP-SKB		XDP-Native	XDP-Native(ZeroCopy)
> rxdrop		82		82		82
> txonly		82		82		82
> l2fwd 		82		82		82
> 
> [1]: https://github.com/xdp-project/bpf-examples/tree/master/AF_XDP-example
> 
> To:
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>

This series crashes Linux on am64xx-hsevm, when I tried nfs boot using 
AM65-CPSW-NUSS driver:
logs: 
https://gist.github.com/MeghanaMalladiTI/d655a1c8ca88113ee7f5f57d6ab0ec4c

Seems like you have reverted the fix for the same bug which was reported 
by Siddharth and fixed by Julien: 
https://lore.kernel.org/all/7f7fb71a-6d15-46f1-b63c-b569a2e230b7@baylibre.com/

reverted lines:
		if (!common->ports[port].ndev)
		/* FIXME should we BUG here? */
			continue;

Can you please take a look at it.

> ---
> Roger Quadros (5):
>        net: ethernet: ti: am65-cpsw: fix BPF Program change on multi-port CPSW
>        net: ethernet: ti: am65-cpsw: add XSK pool helpers
>        net: ethernet: ti: am65-cpsw: Add AF_XDP zero copy for RX
>        net: ethernet: ti: am65-cpsw: Add AF_XDP zero copy for TX
>        net: ethernet: ti: am65-cpsw: enable zero copy in XDP features
> 
>   drivers/net/ethernet/ti/Makefile         |   2 +-
>   drivers/net/ethernet/ti/am65-cpsw-nuss.c | 526 +++++++++++++++++++++++++++----
>   drivers/net/ethernet/ti/am65-cpsw-nuss.h |  37 ++-
>   drivers/net/ethernet/ti/am65-cpsw-xdp.c  | 155 +++++++++
>   4 files changed, 656 insertions(+), 64 deletions(-)
> ---
> base-commit: 9f607dc39b6658ba8ea647bd99725e68c66071b7
> change-id: 20250225-am65-cpsw-xdp-zc-2af9e4be1356
> 
> Best regards,

-- 
Thanks,
Meghana Malladi

