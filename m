Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 579D595CF5D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 16:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE52E10EB57;
	Fri, 23 Aug 2024 14:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nBStq5YX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306CC10EB57
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 14:19:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 394CECE1049;
 Fri, 23 Aug 2024 14:19:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E523C32786;
 Fri, 23 Aug 2024 14:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724422754;
 bh=RpEEFLQ159mtzxH/6H1MaLPuidhuvO36wTtzFCeFT2g=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=nBStq5YXGZS3IcSjX33591s0+YfJaUGLCBUzCzSQicdSqADMwcQvGt3tFDnkxAtol
 bdGbH+eCaphHgOcZdVB9bfSa/RVclary3XVypkUaZpsXrLwD5X/Mp7bruP+kpsn/Ep
 BFujFlNZqa6OEPeW274OkkrXyToZJq5nwvgwHAPntmBOwzlJkGpwgERbg7YE56BGVr
 uNkiP8hgPgTPBmaNqSWBtCi+hHwUcbAKbe6TLGB2Ug2ADZpwAasiqpBdo+K6v30awd
 qzw6BYcYwCzlkNwQJgDMCAPzdG5XE+IKI91foJRUZX4biaGVtXLv2ovDRk35TRiz1G
 Wz4ewk+2qH0sQ==
Message-ID: <ae89be50-9cc0-43a0-8829-dd38a05a377f@kernel.org>
Date: Fri, 23 Aug 2024 17:19:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 0/3] Add minimal XDP support to TI AM65 CPSW
 Ethernet driver
From: Roger Quadros <rogerq@kernel.org>
To: Julien Panis <jpanis@baylibre.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Ratheesh Kannoth <rkannoth@marvell.com>,
 Naveen Mamindlapalli <naveenm@marvell.com>,
 Jacob Keller <jacob.e.keller@intel.com>
Cc: danishanwar@ti.com, yuehaibing@huawei.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, "Govindarajan, Sriramakrishnan" <srk@ti.com>
References: <20240223-am65-cpsw-xdp-basic-v9-0-2c194217e325@baylibre.com>
 <d2e00269-23b8-4a92-84df-959b3c3ae6f1@kernel.org>
Content-Language: en-US
In-Reply-To: <d2e00269-23b8-4a92-84df-959b3c3ae6f1@kernel.org>
Content-Type: text/plain; charset=UTF-8
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



On 23/08/2024 15:12, Roger Quadros wrote:
> Hello Julien,
> 
> On 12/04/2024 18:38, Julien Panis wrote:
>> This patch adds XDP support to TI AM65 CPSW Ethernet driver.
>>
>> The following features are implemented: NETDEV_XDP_ACT_BASIC,
>> NETDEV_XDP_ACT_REDIRECT, and NETDEV_XDP_ACT_NDO_XMIT.
>>
>> Zero-copy and non-linear XDP buffer supports are NOT implemented.
>>
>> Besides, the page pool memory model is used to get better performance.
>>
>> Signed-off-by: Julien Panis <jpanis@baylibre.com>
> 
> I've been trying to test this since I don't want my RX multi queue series [1]
> to break AF_XDP feature. However, with 6.10 I don't see AF_XDP working at all
> and even breaking basic networking on am65-cpsw.
> 
> The in kernel XDP tests have been dropped so I've been using xdp-tools [2]
> 
> My test is to try XDP_DROP with xdp-bench using skb mode first and then
> native XDP mode.
> 
> Below is the test log. You can see that skb mode works fine. The moment I try
> native XDP mode the interface seems to go down and up and then just locks up.
> 
> I can no longer ping to the remote host.
> 
> ----test log starts-----
> 
> root@am64xx-evm:~/xdp-tools/xdp-bench# ping 192.168.1.36
> PING 192.168.1.36 (192.168.1.36) 56(84) bytes of data.
> 64 bytes from 192.168.1.36: icmp_seq=1 ttl=64 time=0.801 ms
> 64 bytes from 192.168.1.36: icmp_seq=2 ttl=64 time=0.967 ms
> 64 bytes from 192.168.1.36: icmp_seq=3 ttl=64 time=0.876 ms
> ^C
> --- 192.168.1.36 ping statistics ---
> 3 packets transmitted, 3 received, 0% packet loss, time 2003ms
> rtt min/avg/max/mdev = 0.801/0.881/0.967/0.067 ms
> 
> 
> root@am64xx-evm:~/xdp-tools/xdp-bench# ./xdp-bench drop -m skb eth0
> Dropping packets on eth0 (ifindex 2; driver am65-cpsw-nuss)
> Summary                     81127 rx/s                  0 err/s        
> Summary                     81088 rx/s                  0 err/s        
> Summary                     81089 rx/s                  0 err/s        
> Summary                     53065 rx/s                  0 err/s        
> ^C
>   Packets received    : 296369    
>   Average packets/s   : 74092     
>   Rx dropped          : 296369    
> 
> root@am64xx-evm:~/xdp-tools/xdp-bench# ping 192.168.1.36
> PING 192.168.1.36 (192.168.1.36) 56(84) bytes of data.
> 64 bytes from 192.168.1.36: icmp_seq=1 ttl=64 time=1.02 ms
> 64 bytes from 192.168.1.36: icmp_seq=2 ttl=64 time=0.756 ms
> 64 bytes from 192.168.1.36: icmp_seq=3 ttl=64 time=0.963 ms
> ^C
> --- 192.168.1.36 ping statistics ---
> 3 packets transmitted, 3 received, 0% packet loss, time 2003ms
> rtt min/avg/max/mdev = 0.756/0.914/1.024/0.114 ms
> 
> 
> root@am64xx-evm:~/xdp-tools/xdp-bench# ./xdp-bench drop -m native eth0
> [  889.096851] am65-cpsw-nuss 8000000.ethernet eth0: Link is Down
> [  889.110889] am65-cpsw-nuss 8000000.ethernet eth0: PHY [8000f00.mdio:00] driver [TI DP83867] (irq=POLL)
> [  889.120377] am65-cpsw-nuss 8000000.ethernet eth0: configuring for phy/rgmii-rxid link mode
> Dropping packets on eth0 (ifindex 2; driver am65-cpsw-nuss)
> Summary                         0 rx/s                  0 err/s        
> Summary                         0 rx/s                  0 err/s        
> [  893.218318] am65-cpsw-nuss 8000000.ethernet eth0: Link is Up - 1Gbps/Full - flow control rx/tx
> Summary                       250 rx/s                  0 err/s        
> Summary                         0 rx/s                  0 err/s        
> Summary                         0 rx/s                  0 err/s        
> Summary                         0 rx/s                  0 err/s        
> ^C
> [  901.898170] am65-cpsw-nuss 8000000.ethernet eth0: Link is Down
> [  901.910292] am65-cpsw-nuss 8000000.ethernet eth0: PHY [8000f00.mdio:00] driver [TI DP83867] (irq=POLL)
> [  901.919661] am65-cpsw-nuss 8000000.ethernet eth0: configuring for phy/rgmii-rxid link mode
>   Packets received    : 250       
>   Average packets/s   : 42        
>   Rx dropped          : 250       
> root@am64xx-evm:~/xdp-tools/xdp-bench# [  906.018296] am65-cpsw-nuss 8000000.ethernet eth0: Link is Up - 1Gbps/Full - flow control rx/tx
> 
> root@am64xx-evm:~/xdp-tools/xdp-bench# ping 192.168.1.36
> PING 192.168.1.36 (192.168.1.36) 56(84) bytes of data.
> From 192.168.1.100 icmp_seq=1 Destination Host Unreachable
> From 192.168.1.100 icmp_seq=2 Destination Host Unreachable
> From 192.168.1.100 icmp_seq=3 Destination Host Unreachable
> ^C
> 
> --- 192.168.1.36 ping statistics ---
> 5 packets transmitted, 0 received, +3 errors, 100% packet loss, time 4079ms
> pipe 4
> 
> 
> ---test log ends---
> 
> I will try to test with commit 8acacc40f733 ("net: ethernet: ti: am65-cpsw: Add minimal XDP support")
> to see if it works there. If it does then I can do a bisect.

XDP_DROP doesn't work here either. I think I have found the issue.
I will comment about it on patch 3.

> 
> If you have better ideas please let me know. Thanks!
> 
> [1] https://lore.kernel.org/all/20240703-am65-cpsw-multi-rx-v3-0-f11cd860fd72@kernel.org/
> [2] https://github.com/xdp-project/xdp-tools
> 
>> ---
>> Changes in v9:
>> - In k3_cppi_desc_pool_destroy(), free memory allocated for pool.
>> - In k3_cppi_desc_pool_create_name() function, remove unnecessary
>> error messages on mem alloc failures.
>> - In k3_cppi_desc_pool_create_name() function, move desc_infos alloc
>> forward to leverage pool_name freeing in gen_pool_destroy().
>> - In k3_cppi_desc_pool_create_name() function, remove unnecessary
>> 'ret = -ENOMEM' since ret is already initialized with -ENOMEM value.
>> - For rx, do not build the skb upfront any more, Instead, give the page
>> to the HW then build the skb once HW sends a completion.
>> - Link to v8: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v8-0-f3421b58da09@baylibre.com
>>
>> Changes in v8:
>> - Fix some warnings reported by patchwork.
>> - Link to v7: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v7-0-c3857c82dadb@baylibre.com
>>
>> Changes in v7:
>> - Move xdp_do_flush() function call in am65_cpsw_nuss_rx_poll().
>> - Link to v6: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v6-0-212eeff5bd5f@baylibre.com
>>
>> Changes in v6:
>> - In k3_cppi_*() functions, use const qualifier when the content of
>> pool is not modified.
>> - Add allow_direct bool parameter to am65_cpsw_alloc_skb() function
>> for direct use by page_pool_put_full_page().
>> - Link to v5: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v5-0-bc1739170bc6@baylibre.com
>>
>> Changes in v5:
>> - In k3_cppi_desc_pool_destroy(), free memory allocated for desc_infos.
>> - Link to v4: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v4-0-2e45e5dec048@baylibre.com
>>
>> Changes in v4:
>> - Add skb_mark_for_recycle() in am65_cpsw_nuss_rx_packets() function.
>> - Specify napi page pool parameter in am65_cpsw_create_xdp_rxqs() function.
>> - Add benchmark numbers (with VS without page pool) in the commit description.
>> - Add xdp_do_flush() in am65_cpsw_run_xdp() function for XDP_REDIRECT case.
>> - Link to v3: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v3-0-5d944a9d84a0@baylibre.com
>>
>> Changes in v3:
>> - Fix a potential issue with TX buffer type, which is now set for each buffer.
>> - Link to v2: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v2-0-01c6caacabb6@baylibre.com
>>
>> Changes in v2:
>> - Use page pool memory model instead of MEM_TYPE_PAGE_ORDER0.
>> - In am65_cpsw_alloc_skb(), release reference on the page pool page
>> in case of error returned by build_skb().
>> - [nit] Cleanup am65_cpsw_nuss_common_open/stop() functions.
>> - [nit] Arrange local variables in reverse xmas tree order.
>> - Link to v1: https://lore.kernel.org/r/20240223-am65-cpsw-xdp-basic-v1-1-9f0b6cbda310@baylibre.com
>>
>> ---
>> Julien Panis (3):
>>       net: ethernet: ti: Add accessors for struct k3_cppi_desc_pool members
>>       net: ethernet: ti: Add desc_infos member to struct k3_cppi_desc_pool
>>       net: ethernet: ti: am65-cpsw: Add minimal XDP support
>>
>>  drivers/net/ethernet/ti/am65-cpsw-nuss.c    | 659 ++++++++++++++++++++++++----
>>  drivers/net/ethernet/ti/am65-cpsw-nuss.h    |  13 +
>>  drivers/net/ethernet/ti/k3-cppi-desc-pool.c |  46 +-
>>  drivers/net/ethernet/ti/k3-cppi-desc-pool.h |   6 +
>>  4 files changed, 623 insertions(+), 101 deletions(-)
>> ---
>> base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
>> change-id: 20240223-am65-cpsw-xdp-basic-4db828508b48
>>
>> Best regards,
> 

-- 
cheers,
-roger
