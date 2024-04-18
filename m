Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 217BB8A98D6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 13:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFA6113BE0;
	Thu, 18 Apr 2024 11:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="RsOBlq/6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 974 seconds by postgrey-1.36 at gabe;
 Thu, 18 Apr 2024 11:42:11 UTC
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BB4113BE2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 11:42:11 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43IBPJCZ117586;
 Thu, 18 Apr 2024 06:25:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1713439519;
 bh=ILDNju0o0Gp9TIqLKVSPNzABvK9adaPpRims5XNw4t8=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=RsOBlq/6MUG7S3kgqzZ/ioTisRm/WA1en24YrVwJ28xOBxbAtTfRQbHQsU8hGpDzn
 Ql1AgPUPlVxvbA4vLMuJdlll423tocugH62VzbPvUVrXpgjNykiWu8WR0wLh4fa3lv
 KBWMsmODfzdprNGpLolX7Zhg6vZPia5iH2EEZFcM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43IBPJEr017250
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 18 Apr 2024 06:25:19 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 Apr 2024 06:25:19 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 18 Apr 2024 06:25:19 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.9])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43IBPINQ105647;
 Thu, 18 Apr 2024 06:25:19 -0500
Date: Thu, 18 Apr 2024 16:55:18 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Julien Panis <jpanis@baylibre.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Russell King
 <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Simon Horman
 <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Ratheesh Kannoth
 <rkannoth@marvell.com>, Naveen Mamindlapalli <naveenm@marvell.com>, Jacob
 Keller <jacob.e.keller@intel.com>, <danishanwar@ti.com>,
 <yuehaibing@huawei.com>, <rogerq@kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH net-next v9 0/3] Add minimal XDP support to TI AM65 CPSW
 Ethernet driver
Message-ID: <1da48c7e-ba87-4f7a-b6d1-d35961005ab0@ti.com>
References: <20240223-am65-cpsw-xdp-basic-v9-0-2c194217e325@baylibre.com>
 <260d258f-87a1-4aac-8883-aab4746b32d8@ti.com>
 <08319f88-36a9-445a-9920-ad1fba666b6a@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <08319f88-36a9-445a-9920-ad1fba666b6a@baylibre.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

On Thu, Apr 18, 2024 at 01:17:47PM +0200, Julien Panis wrote:
> On 4/18/24 13:00, Siddharth Vadapalli wrote:
> > On 12-04-2024 21:08, Julien Panis wrote:
> > > This patch adds XDP support to TI AM65 CPSW Ethernet driver.
> > > 
> > > The following features are implemented: NETDEV_XDP_ACT_BASIC,
> > > NETDEV_XDP_ACT_REDIRECT, and NETDEV_XDP_ACT_NDO_XMIT.
> > > 
> > > Zero-copy and non-linear XDP buffer supports are NOT implemented.
> > > 
> > > Besides, the page pool memory model is used to get better performance.
> > > 
> > > Signed-off-by: Julien Panis <jpanis@baylibre.com>
> > Hello Julien,
> > 
> > This series crashes Linux on AM62ax SoC which also uses the
> > AM65-CPSW-NUSS driver:
> > https://gist.github.com/Siddharth-Vadapalli-at-TI/5ed0e436606001c247a7da664f75edee
> > 
> > Regards,
> > Siddharth.
> 
> Hello Siddharth.
> 
> Thanks for the log. I can read:
> [    1.966094] Missing net_device from driver
> 
> Did you check that nodes exist in the device tree for the net devices ?

Yes it exists. The device-tree used was also built with linux-next
tagged next-20240417. The node corresponding to eth0 is cpsw_port1 which
is present and enabled in the device-tree:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts?h=next-20240417#n644

Regards,
Siddharth.
