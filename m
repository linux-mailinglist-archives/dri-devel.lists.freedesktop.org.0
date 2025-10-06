Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D051BBF087
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 20:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB63110E0EF;
	Mon,  6 Oct 2025 18:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="E7+aom7i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5EC710E0EF
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 18:55:46 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 596It2SX4119639;
 Mon, 6 Oct 2025 13:55:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1759776902;
 bh=f6pZT5lucgMcs99wvMibFb9xDLLP+hxuIJ4a3foUSyk=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=E7+aom7iEB0KO+84LbOgCmjQEvWalHvTBxZspZXJNuIHfYKoIkaEgSNVC1Ud1VvDw
 FW0KnpoiqnJ3w+jyQjkEm8kgXbllSgAY2O4SDpM4jq+TEnPgkR8lUOFLD0EFtZ41OT
 lVvVHRj2FBwtxJzi8tdV0kS+dzu9H3CyWndZKQy0=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 596It219128164
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Mon, 6 Oct 2025 13:55:02 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 6
 Oct 2025 13:55:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 6 Oct 2025 13:55:01 -0500
Received: from [10.249.131.66] ([10.249.131.66])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 596IsrfM3895037;
 Mon, 6 Oct 2025 13:54:54 -0500
Message-ID: <53cbd465-6925-4003-a13b-11fa1034819d@ti.com>
Date: Tue, 7 Oct 2025 00:24:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/6] net: ti: icssg-prueth: Add functions to
 create and destroy Rx/Tx queues
To: Jakub Kicinski <kuba@kernel.org>
CC: <namcao@linutronix.de>, <jacob.e.keller@intel.com>,
 <christian.koenig@amd.com>, <sumit.semwal@linaro.org>,
 <sdf@fomichev.me>, <john.fastabend@gmail.com>, <hawk@kernel.org>,
 <daniel@iogearbox.net>, <ast@kernel.org>, <pabeni@redhat.com>,
 <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
 <linaro-mm-sig@lists.linaro.org>, <dri-devel@lists.freedesktop.org>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Roger Quadros
 <rogerq@kernel.org>, <danishanwar@ti.com>
References: <20250901100227.1150567-1-m-malladi@ti.com>
 <20250901100227.1150567-2-m-malladi@ti.com>
 <20250903174847.5d8d1c9f@kernel.org>
Content-Language: en-US
From: "Malladi, Meghana" <m-malladi@ti.com>
In-Reply-To: <20250903174847.5d8d1c9f@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Hi Jakub,

On 9/4/2025 6:18 AM, Jakub Kicinski wrote:
> On Mon, 1 Sep 2025 15:32:22 +0530 Meghana Malladi wrote:
>>   	if (!emac->xdpi.prog && !prog)
>>   		return 0;
>>   
>> -	WRITE_ONCE(emac->xdp_prog, prog);
>> +	if (netif_running(emac->ndev)) {
>> +		prueth_destroy_txq(emac);
>> +		prueth_destroy_rxq(emac);
>> +	}
>> +
>> +	old_prog = xchg(&emac->xdp_prog, prog);
>> +	if (old_prog)
>> +		bpf_prog_put(old_prog);
>> +
>> +	if (netif_running(emac->ndev)) {
>> +		ret = prueth_create_rxq(emac);
> 
> shutting the device down and freeing all rx memory for reconfig is not
> okay. If the system is low on memory the Rx buffer allocations may fail
> and system may drop off the network. You must either pre-allocate or
> avoid freeing the memory, and just restart the queues.

So I have been working on trying to address this comment and maintain 
parity with the existing support provided by this series but looks like 
I might be missing something which is causing some regressions.

I am facing an issue with zero copy Rx, where there is some active 
traffic being received by the DUT (running in copy mode - default state)
and I switch to zero copy mode using AF-XDP_example [1], I am not able 
to receive any packets because I observe that the napi_rx_poll is not 
getting scheduled for whatever reason, ending up draining the rx 
descriptors and leading to memory leak. But if I first switch from copy 
to zero copy mode and then try sending traffic I am able to receive 
traffic on long runs without any failure or crash. I am not able to 
figure out why is this happening, so sharing my changes [2] on top of 
this series, which I made to address your comment. I am wondering if you 
could have a look and give me some pointers here. Thank you.

[1] https://github.com/xdp-project/bpf-examples/tree/main/AF_XDP-example

[2] 
https://gist.github.com/MeghanaMalladiTI/4c1cb106aee5bef4489ab372938d62d9

> 
>> +		if (ret) {
>> +			netdev_err(emac->ndev, "Failed to create RX queue: %d\n", ret);
>> +			return ret;
>> +		}
>> +
>> +		ret = prueth_create_txq(emac);
>> +		if (ret) {
>> +			netdev_err(emac->ndev, "Failed to create TX queue: %d\n", ret);
>> +			prueth_destroy_rxq(emac);
>> +			emac->xdp_prog = NULL;
>> +			return ret;
>> +		}
>> +	}
>>   
>>   	xdp_attachment_setup(&emac->xdpi, bpf);

-- 
Thanks,
Meghana Malladi

