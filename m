Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3658CCB9E30
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 22:28:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FC410E368;
	Fri, 12 Dec 2025 21:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="cNFco3qX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010024.outbound.protection.outlook.com [52.101.85.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6804110E95E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 20:37:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o5ns6XR9cgJ8A9GsPaFHguSgiIHFT4yBpUCetIBjToDwwY/Wxg8eHR6uHZYFzJTzLd5LeFCqmogHDdQyGeIs2oFjcFXpEpfuA3O+NiI0CWHaRiq+msSekrro3qE7AccE64TOBDikKTNnHNjEjhZGb8iJ2g/Vj6o6jN7sPs/6jJkhmJ80jD7lb80K/SPfBTzrAvibH4jVECsJACffg941yr4JRCtQnkqUeU62nsYb/Ia5sGG2wDoArInUQjX5scxwS+2sb+DXzG1t0ped2lTTzO4Ievg2qTM1hpHUXfRDtH0F1DM+P/FWeBge6E1wOEx8IZfozdzPgLnr+zMi8e2gDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hpL+zaQVVgrHgQgJCJIsP9uWX9/wlBAdLhoHe+VD5E=;
 b=LXjJLOzeOI/h5eLJ7QqEY8ablxz4PEIU7kqq8TyqpJTfF6VrveQjNFnB0YDihqcT/abHqNRRnWBRJFy1re6wbP82T+9Bdeg6GSnh3Y3f5twsJFxiItp4JGCIPDQNNIh35cicb4+iJrN5PoDe3KY/XN1MNTmGmQkmHROPMy9iyXzvd02UhWC3PK+D1pS+Qr6bjo53Wls5Ept6CHRgRmWQ6FrQpzqf8GULncQEuq/a89b+efgYWrzt/TMw6nzLprHkjZ5c45s6IGN1T83OKvRHQlu/r4kaLuOoE/15tXrwzCfNnFhgoUVvOVgD/4exhLDUOC2OstxWtZcsJVvWlFa3tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.linaro.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hpL+zaQVVgrHgQgJCJIsP9uWX9/wlBAdLhoHe+VD5E=;
 b=cNFco3qXNBAeAPjLfpDKcj4Jc3LuTxLjhxfVUu57bGfTokOmPF1TEucAPsmjPAXRGpetw1OyDYbqerPebm6yqHcON32a35WsBbFtQCLBRoJRvu0uG781u5thm/WWIuL6h2OC31AvpsDX6X1Jv47yG7QVbuRTm2d7/+aX1VhajTU=
Received: from CH0P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::33)
 by MW4PR10MB6559.namprd10.prod.outlook.com (2603:10b6:303:228::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Fri, 12 Dec
 2025 20:37:53 +0000
Received: from DS3PEPF000099DA.namprd04.prod.outlook.com
 (2603:10b6:610:ef:cafe::85) by CH0P220CA0020.outlook.office365.com
 (2603:10b6:610:ef::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.10 via Frontend Transport; Fri,
 12 Dec 2025 20:37:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF000099DA.mail.protection.outlook.com (10.167.17.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 20:37:52 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 12 Dec
 2025 14:37:50 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 12 Dec
 2025 14:37:49 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Dec 2025 14:37:49 -0600
Received: from [10.247.31.238] (lt5cd3044tj5.dhcp.ti.com [10.247.31.238])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BCKbn0l2724558;
 Fri, 12 Dec 2025 14:37:49 -0600
Message-ID: <124a24dd-14ce-4401-ba13-b6c2acbaf829@ti.com>
Date: Fri, 12 Dec 2025 14:37:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 3/7] net: ethernet: ti: am65-cpsw: add XSK
 pool helpers
To: Roger Quadros <rogerq@kernel.org>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, "Jesper Dangaard
 Brouer" <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Stanislav Fomichev <sdf@fomichev.me>, "Simon
 Horman" <horms@kernel.org>
CC: <srk@ti.com>, Meghana Malladi <m-malladi@ti.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 "Muralidharan, Neelima" <neelima@ti.com>
References: <20251109-am65-cpsw-xdp-zc-v2-0-858f60a09d12@kernel.org>
 <20251109-am65-cpsw-xdp-zc-v2-3-858f60a09d12@kernel.org>
Content-Language: en-US
From: "Qiu, Daolin" <d-qiu@ti.com>
In-Reply-To: <20251109-am65-cpsw-xdp-zc-v2-3-858f60a09d12@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DA:EE_|MW4PR10MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: 95e2c799-5feb-4e93-1de4-08de39be52bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|36860700013|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OERpVk5nSzFLazZrelZzc3hLMVE2WTh5MlVzS3h4dENrcC9JRjVycWRuZGRx?=
 =?utf-8?B?ZGF2eHBZY2c1UktjWHp3RERLUkxGNjNHcW5LZnlob0ZET05aN2tIcjR0Vjk4?=
 =?utf-8?B?bjE4MWJteXE3RFJUcVdueVN5NWE0YXlKbm9kWWVuZFZsMUR0OEIvbmtjWW1y?=
 =?utf-8?B?OGZiNk9QOG5lVzlnQVJuMzJrK012Q3dkQmRXbXFwQ0ZvVEZXcjBjMlRRTFdO?=
 =?utf-8?B?M0hnL25RUnNSNnlhbThPQ21mTFdoRnRoakNyU3RYdHJTQnVnYkN4aGtBZ29i?=
 =?utf-8?B?eEgxTWpZeVRtR3ZURDhUWEVXTDRqN3R0c0t6MjhBZjlmeGJzS0t2aEluTGk3?=
 =?utf-8?B?OURkMkg4aW1BMXlLRDd1UkRHeTZlcVc3VGM0ZHdKcXFhRnB4NWZMbEIxOUFY?=
 =?utf-8?B?bElrT0ZjRVliSzJ6MTBwSmo3K0h4b1BCVXpyNzFyU2ZTK3lrNjNCb0d2ODBT?=
 =?utf-8?B?ZGErdmo2Qy9Ea3BGR3pMZG82TjdjZGErMUxWZTJaUG9xL29RTHEvd2VDTXRh?=
 =?utf-8?B?cTBjcVphcmIzejZnaWJQRG9KTXFWczIxbzRQVkpZaksxd1VuaGJYaVkvQzRR?=
 =?utf-8?B?b3dZb1JoVkNjbFo0b1NRdmIrTzl3MWdEejVHS0JuVUVRNHQrVkMyZFpvN0tC?=
 =?utf-8?B?OUtJTzNrU3ZpOS82WUNCNXNWL25xbzZjdlZhS2Z1YTVZeWdsTEVkYVBIVlRV?=
 =?utf-8?B?eWZuZDRwSk9xZ3FvNFdqZktHQ0NPTDAwRTBvd25zdGRneDg0TkhRck44QXdZ?=
 =?utf-8?B?OTJkU2RhVW1kcFZIZDhtVENrWVI3THREWHN3bDlqazdUNkJCb2JuUEhRZWdh?=
 =?utf-8?B?V05OeUFUME9JZ0l1bFUvaDV5aTFuamVKYkpibFlwV2FkSFVjZXBwdkY4bVZ3?=
 =?utf-8?B?SzlOT2EwNnJHN1NhanNHVnBORC9rclJJS3JlbytMKzZtakJhQ0Z3aklHZVpR?=
 =?utf-8?B?UC8wU1pBcE9qaXdMWFFPbkVKMkQxQmRWZUloNUZqTFVuWWJIYmtCdW5aNmJR?=
 =?utf-8?B?YmtBRFY4RE5ZOVNjdDJhOGdySFplSmRXQlRPWmJQcDRIcWlUUmZ3SG5kcWsr?=
 =?utf-8?B?U2pkZ0R4VzQ0Q1Rtbi9NazYzRjhQb1FDbksramtpT2xjR1VRRmIrM2k5aTAy?=
 =?utf-8?B?eE5NdE0veUJIQkxIYm15cHV1S294UWptaFkxUHdjRC83YVJzamR3azk5L0FJ?=
 =?utf-8?B?QnU2Zks5ejhHckU0UFRKVnpaZno4ZE1udHJIb2hTRWo5cjZxSW5EMTJkNzAr?=
 =?utf-8?B?Z1NsUGw3Vyt4UGJPQkN6K3M3REwwaVpRMVZ1KzExSHpWSmhFaTR2eitxaFN4?=
 =?utf-8?B?RFg1ZytzT25FMk9sMWdPS01SZUFwOVl2RDBDbXE0RFNScFIvL3RDSTdzaUtp?=
 =?utf-8?B?dFk1OHc1YXRTd3Jub0gyRFVPeXl2ZjdnLyswcHhyd0NBNkd2Y0t1UjYxSm5w?=
 =?utf-8?B?d3F5T2R5N3NmYXNGait6RkVzbWhnWlk3WDBhSkZ0SlhiQnYvM1V4ZVhRbEV5?=
 =?utf-8?B?a2Izb1hPYUQ3QUl6YXE1aHJtZmlucWlreDRqbE5FTjZiSnBRbnY2cUppdTlK?=
 =?utf-8?B?M3J5SGpPYmtyd0hDREFCNFZMQkRHMXh0Rkh6Y1JOT3VXVDBuYVlGS28rYkZN?=
 =?utf-8?B?R3ZUWkNjRk8xOVB6dVR6Ukx0RDVqUytuaVd3L2ozV2FiQXh4MmxWVnR6b2I0?=
 =?utf-8?B?VkQ4ZDZnNERLVlZNT0h0ZFhacnl6WGlNdk1IckdjZUc2QmY2UjJxd1NSZjBE?=
 =?utf-8?B?WitLWjdmaWhlb1NEc3ZKd2lic1Fmcm9VTVZBaTE0ZXdybmNyckZ1ZUNLMXpL?=
 =?utf-8?B?ZFFaUDhsTTFQQXRsTHM0cjc4TUxxb3RkZTJHN0lXUURteEpuYlRMYUxCNHNx?=
 =?utf-8?B?SkJYdFdVWkNNSWlsUmR5MmF4VTFjdDdWZ1QvMXdkZm0wRWNNU2dndm9KaUJh?=
 =?utf-8?B?d2VIczlWM21TREVrMnUxcXJmQ01oT1F2K2UrWmpuWGlUQWMwUzVnWUtlaWY5?=
 =?utf-8?B?empCUUIxMVpoM3JjbGkxZWc0QmNjQzBNdGhOQVJjd2ZtZmpZU0R0SG93R3Zh?=
 =?utf-8?B?YmVDZnlqekRhRU1OcGpUbXdtN2NoTkoyd0RyRHpPOGhSNWpFQVp5bzhvL0xt?=
 =?utf-8?Q?SKFlEjnOPRdZ9zhQDUhp3nKG/?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 20:37:52.7046 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e2c799-5feb-4e93-1de4-08de39be52bc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6559
X-Mailman-Approved-At: Fri, 12 Dec 2025 21:28:11 +0000
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

On 11/9/2025 3:37 PM, Roger Quadros wrote:
> To prepare for XSK zero copy support, add XSK pool
> helpers in a new file am65-cpsw-xdp.c
>
> As queues are shared between ports we can no longer
> support the case where zero copy (XSK Pool) is enabled
> for the queue on one port but not for other ports.
>
> Current solution is to drop the packet if Zero copy
> is not enabled for that port + queue but enabled for
> some other port + same queue.

I've been evaluating a use-case where one CPSW port is using XDP zero 
copy to pass EtherCAT frames to and from the userspace. The other CPSW 
port is a non-XDP zero copy port is used for connection to another PC 
running an IDE to monitor and configure the EtherCAT userspace 
application on the AM62x EVM.

According to the design described in this patch, I'm no longer able to 
connect to the IDE when the EtherCAT port is set up for XDP zero copy. 
Beyond just this use-case, there might be plenty of other use-cases 
where both non-XDP zero copy ports and XDP zero copy enabled ports need 
to be simultaneously used.

For this reason, I think there should be some change implemented so that 
the traffic on the non-XDP zero copy port does not get dropped. Is there 
a way to workaround the CPSW hardware limitation (shared queues between 
ports)?

One idea I was thinking is to configure multiple rx flows (enabled by 
the patch series in 
https://lore.kernel.org/all/20250514-am65-cpsw-rx-class-v4-0-5202d8119241@kernel.org/) 
and perhaps map each flow to a particular port? Since these rx flows 
aren't true hardware queues, I don't know if that would not be possible 
with the way XDP zero copy uses queues.

Please let me know what you think.

>
> xdp_zc_queues bitmap tracks if queue is setup as XSK
> pool and xsk_port_id array tracks which port the XSK
> queue is assigned to for zero copy.
>
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>   drivers/net/ethernet/ti/Makefile         |   2 +-
>   drivers/net/ethernet/ti/am65-cpsw-nuss.c |  21 ++++--
>   drivers/net/ethernet/ti/am65-cpsw-nuss.h |  20 +++++
>   drivers/net/ethernet/ti/am65-cpsw-xdp.c  | 122 +++++++++++++++++++++++++++++++
>   4 files changed, 156 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/net/ethernet/ti/Makefile b/drivers/net/ethernet/ti/Makefile
> index 93c0a4d0e33a6fb725ad61c3ec0eab87d2d3f61a..96585a28fc7d73f61b888e5d1587d5123875db31 100644
> --- a/drivers/net/ethernet/ti/Makefile
> +++ b/drivers/net/ethernet/ti/Makefile
> @@ -29,7 +29,7 @@ keystone_netcp_ethss-y := netcp_ethss.o netcp_sgmii.o netcp_xgbepcsr.o cpsw_ale.
>   obj-$(CONFIG_TI_K3_CPPI_DESC_POOL) += k3-cppi-desc-pool.o
>   
>   obj-$(CONFIG_TI_K3_AM65_CPSW_NUSS) += ti-am65-cpsw-nuss.o
> -ti-am65-cpsw-nuss-y := am65-cpsw-nuss.o cpsw_sl.o am65-cpsw-ethtool.o cpsw_ale.o
> +ti-am65-cpsw-nuss-y := am65-cpsw-nuss.o cpsw_sl.o am65-cpsw-ethtool.o cpsw_ale.o am65-cpsw-xdp.o
>   ti-am65-cpsw-nuss-$(CONFIG_TI_AM65_CPSW_QOS) += am65-cpsw-qos.o
>   ti-am65-cpsw-nuss-$(CONFIG_TI_K3_AM65_CPSW_SWITCHDEV) += am65-cpsw-switchdev.o
>   obj-$(CONFIG_TI_K3_AM65_CPTS) += am65-cpts.o
> diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> index f9e2286efa29bbb7056fda1fc82c38b479aae8bd..46523be93df27710be77b288c36c1a0f66d8ca8d 100644
> --- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> +++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> @@ -58,9 +58,6 @@
>   
>   #define AM65_CPSW_MAX_PORTS	8
>   
> -#define AM65_CPSW_MIN_PACKET_SIZE	VLAN_ETH_ZLEN
> -#define AM65_CPSW_MAX_PACKET_SIZE	2024
> -
>   #define AM65_CPSW_REG_CTL		0x004
>   #define AM65_CPSW_REG_STAT_PORT_EN	0x014
>   #define AM65_CPSW_REG_PTYPE		0x018
> @@ -505,7 +502,7 @@ static inline void am65_cpsw_put_page(struct am65_cpsw_rx_flow *flow,
>   static void am65_cpsw_nuss_rx_cleanup(void *data, dma_addr_t desc_dma);
>   static void am65_cpsw_nuss_tx_cleanup(void *data, dma_addr_t desc_dma);
>   
> -static void am65_cpsw_destroy_rxq(struct am65_cpsw_common *common, int id, bool retain_page_pool)
> +void am65_cpsw_destroy_rxq(struct am65_cpsw_common *common, int id, bool retain_page_pool)
>   {
>   	struct am65_cpsw_rx_chn *rx_chn = &common->rx_chns;
>   	struct am65_cpsw_rx_flow *flow;
> @@ -554,7 +551,7 @@ static void am65_cpsw_destroy_rxqs(struct am65_cpsw_common *common, bool retain_
>   	k3_udma_glue_disable_rx_chn(common->rx_chns.rx_chn);
>   }
>   
> -static int am65_cpsw_create_rxq(struct am65_cpsw_common *common, int id)
> +int am65_cpsw_create_rxq(struct am65_cpsw_common *common, int id)
>   {
>   	struct am65_cpsw_rx_chn *rx_chn = &common->rx_chns;
>   	struct page_pool_params pp_params = {
> @@ -663,7 +660,7 @@ static int am65_cpsw_create_rxqs(struct am65_cpsw_common *common)
>   	return ret;
>   }
>   
> -static void am65_cpsw_destroy_txq(struct am65_cpsw_common *common, int id)
> +void am65_cpsw_destroy_txq(struct am65_cpsw_common *common, int id)
>   {
>   	struct am65_cpsw_tx_chn *tx_chn = &common->tx_chns[id];
>   
> @@ -697,7 +694,7 @@ static void am65_cpsw_destroy_txqs(struct am65_cpsw_common *common)
>   		am65_cpsw_destroy_txq(common, id);
>   }
>   
> -static int am65_cpsw_create_txq(struct am65_cpsw_common *common, int id)
> +int am65_cpsw_create_txq(struct am65_cpsw_common *common, int id)
>   {
>   	struct am65_cpsw_tx_chn *tx_chn = &common->tx_chns[id];
>   	int ret;
> @@ -1327,7 +1324,7 @@ static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_rx_flow *flow,
>   	dma_unmap_single(rx_chn->dma_dev, buf_dma, buf_dma_len, DMA_FROM_DEVICE);
>   	k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
>   
> -	if (port->xdp_prog) {
> +	if (am65_cpsw_xdp_is_enabled(port)) {
>   		xdp_init_buff(&xdp, PAGE_SIZE, &port->xdp_rxq[flow->id]);
>   		xdp_prepare_buff(&xdp, page_addr, AM65_CPSW_HEADROOM,
>   				 pkt_len, false);
> @@ -1961,6 +1958,9 @@ static int am65_cpsw_ndo_bpf(struct net_device *ndev, struct netdev_bpf *bpf)
>   	switch (bpf->command) {
>   	case XDP_SETUP_PROG:
>   		return am65_cpsw_xdp_prog_setup(ndev, bpf->prog);
> +	case XDP_SETUP_XSK_POOL:
> +		return am65_cpsw_xsk_setup_pool(ndev, bpf->xsk.pool,
> +						bpf->xsk.queue_id);
>   	default:
>   		return -EINVAL;
>   	}
> @@ -3553,7 +3553,12 @@ static int am65_cpsw_nuss_probe(struct platform_device *pdev)
>   	common = devm_kzalloc(dev, sizeof(struct am65_cpsw_common), GFP_KERNEL);
>   	if (!common)
>   		return -ENOMEM;
> +
>   	common->dev = dev;
> +	common->xdp_zc_queues = devm_bitmap_zalloc(dev, AM65_CPSW_MAX_QUEUES,
> +						   GFP_KERNEL);
> +	if (!common->xdp_zc_queues)
> +		return -ENOMEM;
>   
>   	of_id = of_match_device(am65_cpsw_nuss_of_mtable, dev);
>   	if (!of_id)
> diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.h b/drivers/net/ethernet/ti/am65-cpsw-nuss.h
> index 917c37e4e89bd933d3001f6c35a62db01cd8da4c..31789b5e5e1fc96be20cce17234d0e16cdcea796 100644
> --- a/drivers/net/ethernet/ti/am65-cpsw-nuss.h
> +++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.h
> @@ -23,8 +23,14 @@ struct am65_cpts;
>   
>   #define AM65_CPSW_MAX_QUEUES	8	/* both TX & RX */
>   
> +#define AM65_CPSW_MIN_PACKET_SIZE	VLAN_ETH_ZLEN
> +#define AM65_CPSW_MAX_PACKET_SIZE	2024
> +
>   #define AM65_CPSW_PORT_VLAN_REG_OFFSET	0x014
>   
> +#define AM65_CPSW_RX_DMA_ATTR	(DMA_ATTR_SKIP_CPU_SYNC |\
> +				 DMA_ATTR_WEAK_ORDERING)
> +
>   struct am65_cpsw_slave_data {
>   	bool				mac_only;
>   	struct cpsw_sl			*mac_sl;
> @@ -190,6 +196,9 @@ struct am65_cpsw_common {
>   	unsigned char switch_id[MAX_PHYS_ITEM_ID_LEN];
>   	/* only for suspend/resume context restore */
>   	u32			*ale_context;
> +	/* XDP Zero Copy */
> +	unsigned long		*xdp_zc_queues;
> +	int			xsk_port_id[AM65_CPSW_MAX_QUEUES];
>   };
>   
>   struct am65_cpsw_ndev_priv {
> @@ -228,4 +237,15 @@ int am65_cpsw_nuss_update_tx_rx_chns(struct am65_cpsw_common *common,
>   
>   bool am65_cpsw_port_dev_check(const struct net_device *dev);
>   
> +int am65_cpsw_create_rxq(struct am65_cpsw_common *common, int id);
> +void am65_cpsw_destroy_rxq(struct am65_cpsw_common *common, int id, bool retain_page_pool);
> +int am65_cpsw_create_txq(struct am65_cpsw_common *common, int id);
> +void am65_cpsw_destroy_txq(struct am65_cpsw_common *common, int id);
> +int am65_cpsw_xsk_setup_pool(struct net_device *ndev,
> +			     struct xsk_buff_pool *pool, u16 qid);
> +int am65_cpsw_xsk_wakeup(struct net_device *ndev, u32 qid, u32 flags);
> +static inline bool am65_cpsw_xdp_is_enabled(struct am65_cpsw_port *port)
> +{
> +	return !!READ_ONCE(port->xdp_prog);
> +}
>   #endif /* AM65_CPSW_NUSS_H_ */
> diff --git a/drivers/net/ethernet/ti/am65-cpsw-xdp.c b/drivers/net/ethernet/ti/am65-cpsw-xdp.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..89f43f7c83db35dba96621bae930172e0fc85b6a
> --- /dev/null
> +++ b/drivers/net/ethernet/ti/am65-cpsw-xdp.c
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Texas Instruments K3 AM65 Ethernet Switch SubSystem Driver
> + *
> + * Copyright (C) 2025 Texas Instruments Incorporated - http://www.ti.com/
> + *
> + */
> +
> +#include <net/xsk_buff_pool.h>
> +#include <net/xdp_sock_drv.h>
> +#include "am65-cpsw-nuss.h"
> +
> +static int am65_cpsw_xsk_pool_enable(struct am65_cpsw_port *port,
> +				     struct xsk_buff_pool *pool, u16 qid)
> +{
> +	struct am65_cpsw_common *common = port->common;
> +	struct am65_cpsw_rx_chn *rx_chn;
> +	bool need_update;
> +	u32 frame_size;
> +	int ret;
> +
> +	/*
> +	 * As queues are shared between ports we can no longer
> +	 * support the case where zero copy (XSK Pool) is enabled
> +	 * for the queue on one port but not for other ports.
> +	 *
> +	 * Current solution is to drop the packet if Zero copy
> +	 * is not enabled for that port + queue but enabled for
> +	 * some other port + same queue.
> +	 */
> +	if (test_bit(qid, common->xdp_zc_queues))
> +		return -EINVAL;
> +
> +	rx_chn = &common->rx_chns;
> +	if (qid >= common->rx_ch_num_flows || qid >= common->tx_ch_num)
> +		return -EINVAL;
> +
> +	frame_size = xsk_pool_get_rx_frame_size(pool);
> +	if (frame_size < AM65_CPSW_MAX_PACKET_SIZE)
> +		return -EOPNOTSUPP;
> +
> +	ret = xsk_pool_dma_map(pool, rx_chn->dma_dev, AM65_CPSW_RX_DMA_ATTR);
> +	if (ret) {
> +		netdev_err(port->ndev, "Failed to map xsk pool\n");
> +		return ret;
> +	}
> +
> +	need_update = common->usage_count &&
> +		      am65_cpsw_xdp_is_enabled(port);
> +	if (need_update) {
> +		am65_cpsw_destroy_rxq(common, qid, true);
> +		am65_cpsw_destroy_txq(common, qid);
> +	}
> +
> +	set_bit(qid, common->xdp_zc_queues);
> +	common->xsk_port_id[qid] = port->port_id;
> +	if (need_update) {
> +		am65_cpsw_create_rxq(common, qid);
> +		am65_cpsw_create_txq(common, qid);
> +	}
> +
> +	return 0;
> +}
> +
> +static int am65_cpsw_xsk_pool_disable(struct am65_cpsw_port *port,
> +				      struct xsk_buff_pool *pool, u16 qid)
> +{
> +	struct am65_cpsw_common *common = port->common;
> +	bool need_update;
> +
> +	if (qid >= common->rx_ch_num_flows || qid >= common->tx_ch_num)
> +		return -EINVAL;
> +
> +	if (!test_bit(qid, common->xdp_zc_queues))
> +		return -EINVAL;
> +
> +	pool = xsk_get_pool_from_qid(port->ndev, qid);
> +	if (!pool)
> +		return -EINVAL;
> +
> +	need_update = common->usage_count && am65_cpsw_xdp_is_enabled(port);
> +	if (need_update) {
> +		am65_cpsw_destroy_rxq(common, qid, true);
> +		am65_cpsw_destroy_txq(common, qid);
> +		synchronize_rcu();
> +	}
> +
> +	xsk_pool_dma_unmap(pool, AM65_CPSW_RX_DMA_ATTR);
> +	clear_bit(qid, common->xdp_zc_queues);
> +	common->xsk_port_id[qid] = -EINVAL;
> +	if (need_update) {
> +		am65_cpsw_create_rxq(common, qid);
> +		am65_cpsw_create_txq(common, qid);
> +	}
> +
> +	return 0;
> +}
> +
> +int am65_cpsw_xsk_setup_pool(struct net_device *ndev,
> +			     struct xsk_buff_pool *pool, u16 qid)
> +{
> +	struct am65_cpsw_port *port = am65_ndev_to_port(ndev);
> +
> +	return pool ? am65_cpsw_xsk_pool_enable(port, pool, qid) :
> +		      am65_cpsw_xsk_pool_disable(port, pool, qid);
> +}
> +
> +int am65_cpsw_xsk_wakeup(struct net_device *ndev, u32 qid, u32 flags)
> +{
> +	struct am65_cpsw_common *common = am65_ndev_to_common(ndev);
> +	struct am65_cpsw_port *port = am65_ndev_to_port(ndev);
> +
> +	if (!netif_running(ndev) || !netif_carrier_ok(ndev))
> +		return -ENETDOWN;
> +
> +	if (!am65_cpsw_xdp_is_enabled(port))
> +		return -EINVAL;
> +
> +	if (qid >= common->rx_ch_num_flows || qid >= common->tx_ch_num)
> +		return -EINVAL;
> +
> +	return 0;
> +}

Best regards,

Daolin

Texas Instruments Sitara MPU Systems Applications

