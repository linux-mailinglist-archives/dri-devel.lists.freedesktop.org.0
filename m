Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 524AFCAA3B8
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 11:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52AD10E2C4;
	Sat,  6 Dec 2025 10:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="HcdheTRK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012000.outbound.protection.outlook.com [52.101.53.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1CA10E0F4
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 16:27:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7+/57W+Amen6X161m1P4SMfbwy9XXRKUxCsV/61Irt/Eu3iCNzKxjNocSZBfpgZq9oWQQ4DxX0Fv6JcOlsCqA3sbJcmmLaSsrgNz9WgzlVrSYTvATX5lCMVIEJheS00W2pabN+V9U6UP+DVEn5XFnsRE9G2VTL0xT26CZNo6iXZaf6LiFACDODKpYANG0LuKTtdeR+kjp43iJ8SS0+bPPtECvnZPygO+kpcj9RB80JokAj2jkWj2QiAwHmGvo02mYquYNbTq0ATRSEMuNVr+AVB5lQnMKSqfJ7pln+8oaVg7/46xPXfSf+eZbqyW3YILF4tcC2V10zzvNWiJG7vKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdKqZujOhWa4CsQXlegyNtSZ7ISvJ0jRdS63h421GNQ=;
 b=LXc9J3PPlxp9qjlVwq9kB6qt+HeWNZewpPULFMda+jdgXhaaKekvwNlPALokuU5UkXMxj2XVu8V77umP/8a0IED93LdYAUl4GRRL9VFIg/Ov00I4nHleZjefnea04MDIsq2EhdsKcoJuVOdg6djQ9sk2flnrwhcOrxxg39Hf0AcKvYGGCY3danjWOa7xCQQv43Yv/00+kvAtZn1n5d+vx7GIdTHNxRY7jleUOHE8NDQFXaMPBpYP27uXD1XnDPeG/AiSWg598nQSXhO7nVCrxz1OjKWm544hrbKjLRhjo/vZPqMvoJE0Mn926sDgMGcgsI8CZNWwXsDxqEmpQ78dXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.linaro.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdKqZujOhWa4CsQXlegyNtSZ7ISvJ0jRdS63h421GNQ=;
 b=HcdheTRKWfzVopXnVruGVLHeNxOLXdZKHUby89P7cUGurCWigiTNEiB/E2VpAtBtIUPBIh55ppkxHD67dGOiQwOVigMuFVyKPVCODemyrH8iYkkbt4PiEFEkZbGoqJ0kv1WU78aJWae7dY8CccdL6IQqve/ED50V9UN+E8R3FsE=
Received: from CH0PR03CA0441.namprd03.prod.outlook.com (2603:10b6:610:10e::34)
 by DS0PR10MB6797.namprd10.prod.outlook.com (2603:10b6:8:13d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 5 Dec
 2025 16:27:37 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:610:10e:cafe::95) by CH0PR03CA0441.outlook.office365.com
 (2603:10b6:610:10e::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Fri, 5
 Dec 2025 16:27:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 5 Dec 2025 16:27:36 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 5 Dec
 2025 10:27:30 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 5 Dec
 2025 10:27:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 5 Dec 2025 10:27:29 -0600
Received: from [10.247.23.136] (lt5cd3044tj5.dhcp.ti.com [10.247.23.136])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B5GRSQa3577388;
 Fri, 5 Dec 2025 10:27:28 -0600
Message-ID: <f0a961cb-d0ec-4f53-8c51-5b1c5bba8b1a@ti.com>
Date: Fri, 5 Dec 2025 10:27:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 5/7] net: ethernet: ti: am65-cpsw: Add AF_XDP
 zero copy for TX
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
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
References: <20251109-am65-cpsw-xdp-zc-v2-0-858f60a09d12@kernel.org>
 <20251109-am65-cpsw-xdp-zc-v2-5-858f60a09d12@kernel.org>
Content-Language: en-US
From: "Qiu, Daolin" <d-qiu@ti.com>
In-Reply-To: <20251109-am65-cpsw-xdp-zc-v2-5-858f60a09d12@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|DS0PR10MB6797:EE_
X-MS-Office365-Filtering-Correlation-Id: e1b71f4b-8070-41a5-e3e1-08de341b33c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|82310400026|376014|1800799024|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTdqQ3RLZll6SHFiYU5hRGJlTStQYStnREUzTWhheUgyb3N4V0EyZWdOSUNv?=
 =?utf-8?B?NFJzN1lqWE9LOW5qdFNDZ3VhOUZxS21Ld1A3a3BkUGV5Z215NHdBUCt5Y1d0?=
 =?utf-8?B?Z2lnVmk0YWU1SERKQTVLQUlNU0lLUjNORVpNZUF5Zi9rbWE2ZGZ1RXJqMXhj?=
 =?utf-8?B?MnhrNzdROGExZjdTV3pCT2t5MzVjSTNyeHUvQldRcDVBclU3LzNqUjRROTEr?=
 =?utf-8?B?NjVjMnd3b0tUZHhiR1FzY0grNnFjRkxMM0xFelVqVTZWOThkYWpYUFJnZUhP?=
 =?utf-8?B?MmlRQkI3ZVpFUEJwVEdJMVRDNWhsa1Jyeit2R1JoUGdlQjNzREg1eVBuZnY4?=
 =?utf-8?B?T0ZSY2R3WVk5T3FFMklIYTh6MGdXT2VXZ2sxOGdSQ2poTFR0eU5LZDgzSmlY?=
 =?utf-8?B?NUthMTBDaHl1VTlDZDBvNkFxVERGUG50SWRTbWdtb0plcTQvQ0MyVEY4N2Nu?=
 =?utf-8?B?TTBwMFo3V1ovRGovRWhrV3U0T2Z6RHBPVXRDOFk5dkpMWnRsQm4vM1l5U1Zn?=
 =?utf-8?B?bmVHMG1MbklSV3Jpb2FJdDUwSHFGQW9DRFY1eW9nVVJMU2IwSTI4SzBtbHdn?=
 =?utf-8?B?NGppL1JVMTZkUHZZRmdIdlA5MXlxNE5hdEVNSmt0Tm96b3YxbjloZW1PQUMv?=
 =?utf-8?B?QU1wS2hlcE5vdGVETDNVbVplWjNvU2FQamxETVJIclgrQlYwVmNWV0VmVGdG?=
 =?utf-8?B?emFPM0xYTEdSbmdHRmJUcHFpK3JnM2xGQzdaOW41V2xjTVBMalhKWDkwTGpQ?=
 =?utf-8?B?WkpiV01QeHpyWjZUUGhjQ0ZpYzJVZzIzQmZhdkdFSURrbEpybU5jd0p2anQr?=
 =?utf-8?B?M1FRS1ZlckV5U1F6NjVXMlV0L3lvK0VMd0FCczlhTlR1Y1o0Y0dpRFlJZzIy?=
 =?utf-8?B?RGdxditZL1dtTUM0RFcxYkNBSEZDMnFUZXpWR0x5TVZ4WG1XbHVTS1A5L3Fs?=
 =?utf-8?B?U1hmYkFMRjNnUEx3RnE0OENyK2R4dFhEOG94emdGMmNNa01JVUtuTTJPY3JZ?=
 =?utf-8?B?QU5McGg4NXlMVk9wLzlCUVYxUW4wYXJwNEhUL2FzMlhuWlNIWFBLWVIwQ2NQ?=
 =?utf-8?B?eXFrUGgrRnhOMHFIL3lTWVpsbHdWQ284OG5xZGhCcnBMYWhpV3FGd0IrUldj?=
 =?utf-8?B?V21RblJNckpobTFTcVZLSkpsV2xpdjExdmdUbHptOFRxUitqcGplQW5GT1F2?=
 =?utf-8?B?Yzd3aWthWFI3OVkwZXRldU5TZ0xVMjBBLzRzdElmQ3R5ekUwVVVnV2NJOFNH?=
 =?utf-8?B?WDMzdWJkQVJqcDlmM2ZYZGJMTFNiOWNTZGlmd3pCNitoc215RWFDdXZwTHdU?=
 =?utf-8?B?eFZlR2svbnIvWWhVT1V6WXdjNysydTJZK0lZUVhOa2JpcTJnTGlKN2VhMnpi?=
 =?utf-8?B?SVpVS25hbU1HZ2pBS0tXM3JaRzl2bWcvMk1Hb1dKRjJYQWlaV3hELzNtSFJC?=
 =?utf-8?B?TVVsWFpTeE5Ya1J4NzFNMm9relB6aFpURStsS2pJZFJ4d1YyajdYZFpTUkJC?=
 =?utf-8?B?YU1oU2lvTyttbEdFZG9jWGdmb0lwZkx6R1Q3MWRNZDA0SnNWVnp2YnhYLzNz?=
 =?utf-8?B?djJXbXJ5UGtkUm5hZWJYL2NscFB5WlBXQmhXL1M3dmVWZGwvVWRFODYrRnNr?=
 =?utf-8?B?bG83LzllL2F6Q1p4MTBoOE52RmhVVkp0dmhxU1N1RlN4T3VTekpYclMwb0U1?=
 =?utf-8?B?QktYblNJTEhZRDVjMWQ2QlVCTzV5WlcweFRadVpRazJRTTZ5MFRZNStIU1or?=
 =?utf-8?B?SUE4bEY4NnIvNi9zN0Qyb25tWXB2SktBczJCODlWQVpvTkNBN3hWTDVOK0wr?=
 =?utf-8?B?UzQvakkrUjR1b2k4YnlOZ0kxRlh4L2g3MTZpcS91d3Z6L0IxVTBaQVBYQmRw?=
 =?utf-8?B?YitUYnkrMmRXai9GRXc0YTlKN0psMTRwZ0xLVzNIOExDVE81SW8wcWt4UWdz?=
 =?utf-8?B?V0VLNEJ5YTk3b2wvR0crUWRCUmNNZGxOQlpzMXNIMDE4SnBZaFNaREpENEgy?=
 =?utf-8?B?WEtkZ1NIdnhhZHc3QlNBYlRyZ2M2VTEydEkyVVNVNVF2L3FKcXo3TnUwY2VZ?=
 =?utf-8?Q?CHv5Fa?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(7416014)(82310400026)(376014)(1800799024)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 16:27:36.9771 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b71f4b-8070-41a5-e3e1-08de341b33c6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6797
X-Mailman-Approved-At: Sat, 06 Dec 2025 10:07:49 +0000
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

My name is Daolin (a colleague of Meghana's).

This is my first time responding to a Linux Kernel mailing list so 
please be patient if I'm potentially violating any conventions or rules 
in my message.

Recently, I've encountered the same kernel crash that Meghana faced 
(https://gist.github.com/MeghanaMalladiTI/784fd2262d95b19fe9573c553c4a6a24 
) when I was testing the eth1 interface of the CPSW with your patches on 
an AM62x EVM and found a potential source of the problem (see below).

On 11/9/2025 3:37 PM, Roger Quadros wrote:
> Add zero copy support to TX path.
>
> Introduce xsk_pool and xsk_port_id to struct am65_cpsw_tx_chn.
> This way we can quickly check if the flow is setup as XSK pool
> and for which port.
>
> If the TX channel is setup as XSK pool then get the frames from
> the pool and send it to the TX channel.
>
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>   drivers/net/ethernet/ti/am65-cpsw-nuss.c | 171 ++++++++++++++++++++++++++++---
>   drivers/net/ethernet/ti/am65-cpsw-nuss.h |   5 +
>   drivers/net/ethernet/ti/am65-cpsw-xdp.c  |  11 +-
>   3 files changed, 171 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> index afc0c8836fe242d8bf47ce9bcd3e6b725ca37bf9..2e06e7df23ad5249786d081e51434f87dd2a76b5 100644
> --- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> +++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> @@ -758,6 +758,8 @@ void am65_cpsw_destroy_txq(struct am65_cpsw_common *common, int id)
>   	k3_udma_glue_reset_tx_chn(tx_chn->tx_chn, tx_chn,
>   				  am65_cpsw_nuss_tx_cleanup);
>   	k3_udma_glue_disable_tx_chn(tx_chn->tx_chn);
> +	tx_chn->xsk_pool = NULL;
> +	tx_chn->xsk_port_id = -EINVAL;
>   }
>   
>   static void am65_cpsw_destroy_txqs(struct am65_cpsw_common *common)
> @@ -786,12 +788,25 @@ static void am65_cpsw_destroy_txqs(struct am65_cpsw_common *common)
>   int am65_cpsw_create_txq(struct am65_cpsw_common *common, int id)
>   {
>   	struct am65_cpsw_tx_chn *tx_chn = &common->tx_chns[id];
> -	int ret;
> +	int port, ret;
>   
>   	ret = k3_udma_glue_enable_tx_chn(tx_chn->tx_chn);
>   	if (ret)
>   		return ret;
>   
> +	/* get first port with XSK pool & XDP program set */
> +	for (port = 0; port < common->port_num; port++) {
> +		if (!common->ports[port].ndev)
> +			continue;
> +
> +		tx_chn->xsk_pool = am65_cpsw_xsk_get_pool(&common->ports[port],
> +							  id);
> +		if (tx_chn->xsk_pool)
> +			break;
> +	}
> +
> +	tx_chn->xsk_port_id = tx_chn->xsk_pool ?
> +			      common->ports[port].port_id : -EINVAL;
>   	napi_enable(&tx_chn->napi_tx);
>   
>   	return 0;
> @@ -892,15 +907,18 @@ static void am65_cpsw_nuss_rx_cleanup(void *data, dma_addr_t desc_dma)
>   }
>   
>   static void am65_cpsw_nuss_xmit_free(struct am65_cpsw_tx_chn *tx_chn,
> -				     struct cppi5_host_desc_t *desc)
> +				     struct cppi5_host_desc_t *desc,
> +				     enum am65_cpsw_tx_buf_type buf_type)
>   {
>   	struct cppi5_host_desc_t *first_desc, *next_desc;
>   	dma_addr_t buf_dma, next_desc_dma;
>   	u32 buf_dma_len;
>   
>   	first_desc = desc;
> -	next_desc = first_desc;
> +	if (buf_type == AM65_CPSW_TX_BUF_TYPE_XSK_TX)
> +		goto free_pool;
>   
> +	next_desc = first_desc;
>   	cppi5_hdesc_get_obuf(first_desc, &buf_dma, &buf_dma_len);
>   	k3_udma_glue_tx_cppi5_to_dma_addr(tx_chn->tx_chn, &buf_dma);
>   
> @@ -923,6 +941,7 @@ static void am65_cpsw_nuss_xmit_free(struct am65_cpsw_tx_chn *tx_chn,
>   		k3_cppi_desc_pool_free(tx_chn->desc_pool, next_desc);
>   	}
>   
> +free_pool:
>   	k3_cppi_desc_pool_free(tx_chn->desc_pool, first_desc);
>   }
>   
> @@ -932,21 +951,32 @@ static void am65_cpsw_nuss_tx_cleanup(void *data, dma_addr_t desc_dma)
>   	enum am65_cpsw_tx_buf_type buf_type;
>   	struct am65_cpsw_tx_swdata *swdata;
>   	struct cppi5_host_desc_t *desc_tx;
> +	struct xsk_buff_pool *xsk_pool;
>   	struct xdp_frame *xdpf;
>   	struct sk_buff *skb;
>   
>   	desc_tx = k3_cppi_desc_pool_dma2virt(tx_chn->desc_pool, desc_dma);
>   	swdata = cppi5_hdesc_get_swdata(desc_tx);
>   	buf_type = am65_cpsw_nuss_buf_type(tx_chn, desc_dma);
> -	if (buf_type == AM65_CPSW_TX_BUF_TYPE_SKB) {
> +	switch (buf_type) {
> +	case AM65_CPSW_TX_BUF_TYPE_SKB:
>   		skb = swdata->skb;
>   		dev_kfree_skb_any(skb);
> -	} else {
> +		break;
> +	case AM65_CPSW_TX_BUF_TYPE_XDP_TX:
> +	case AM65_CPSW_TX_BUF_TYPE_XDP_NDO:
>   		xdpf = swdata->xdpf;
>   		xdp_return_frame(xdpf);
> +		break;
> +	case AM65_CPSW_TX_BUF_TYPE_XSK_TX:
> +		xsk_pool = swdata->xsk_pool;
> +		xsk_tx_completed(xsk_pool, 1);
> +		break;
> +	default:
> +		break;
>   	}
>   
> -	am65_cpsw_nuss_xmit_free(tx_chn, desc_tx);
> +	am65_cpsw_nuss_xmit_free(tx_chn, desc_tx, buf_type);
>   }
>   
>   static struct sk_buff *am65_cpsw_build_skb(void *page_addr,
> @@ -1189,6 +1219,82 @@ static int am65_cpsw_nuss_ndo_slave_open(struct net_device *ndev)
>   	return ret;
>   }
>   
> +static int am65_cpsw_xsk_xmit_zc(struct net_device *ndev,
> +				 struct am65_cpsw_tx_chn *tx_chn)
> +{
> +	struct am65_cpsw_common *common = tx_chn->common;
> +	struct xsk_buff_pool *pool = tx_chn->xsk_pool;
> +	struct xdp_desc *xdp_descs = pool->tx_descs;
> +	struct cppi5_host_desc_t *host_desc;
> +	struct am65_cpsw_tx_swdata *swdata;
> +	dma_addr_t dma_desc, dma_buf;
> +	int num_tx = 0, pkt_len;
> +	int descs_avail, ret;
> +	int i;
> +
> +	descs_avail = k3_cppi_desc_pool_avail(tx_chn->desc_pool);
> +	/* ensure that TX ring is not filled up by XDP, always MAX_SKB_FRAGS
> +	 * will be available for normal TX path and queue is stopped there if
> +	 * necessary
> +	 */
> +	if (descs_avail <= MAX_SKB_FRAGS)
> +		return 0;
> +
> +	descs_avail -= MAX_SKB_FRAGS;
> +	descs_avail = xsk_tx_peek_release_desc_batch(pool, descs_avail);
> +
> +	for (i = 0; i < descs_avail; i++) {
> +		host_desc = k3_cppi_desc_pool_alloc(tx_chn->desc_pool);
> +		if (unlikely(!host_desc))
> +			break;
> +
> +		am65_cpsw_nuss_set_buf_type(tx_chn, host_desc,
> +					    AM65_CPSW_TX_BUF_TYPE_XSK_TX);
> +		dma_buf = xsk_buff_raw_get_dma(pool, xdp_descs[i].addr);
> +		pkt_len = xdp_descs[i].len;
> +		xsk_buff_raw_dma_sync_for_device(pool, dma_buf, pkt_len);
> +
> +		cppi5_hdesc_init(host_desc, CPPI5_INFO0_HDESC_EPIB_PRESENT,
> +				 AM65_CPSW_NAV_PS_DATA_SIZE);
> +		cppi5_hdesc_set_pkttype(host_desc, AM65_CPSW_CPPI_TX_PKT_TYPE);
> +		cppi5_hdesc_set_pktlen(host_desc, pkt_len);
> +		cppi5_desc_set_pktids(&host_desc->hdr, 0,
> +				      AM65_CPSW_CPPI_TX_FLOW_ID);
> +		cppi5_desc_set_tags_ids(&host_desc->hdr, 0,
> +					tx_chn->xsk_port_id);
> +
> +		k3_udma_glue_tx_dma_to_cppi5_addr(tx_chn->tx_chn, &dma_buf);
> +		cppi5_hdesc_attach_buf(host_desc, dma_buf, pkt_len, dma_buf,
> +				       pkt_len);
> +
> +		swdata = cppi5_hdesc_get_swdata(host_desc);
> +		swdata->ndev = ndev;
> +		swdata->xsk_pool = pool;
> +
> +		dma_desc = k3_cppi_desc_pool_virt2dma(tx_chn->desc_pool,
> +						      host_desc);
> +		if (AM65_CPSW_IS_CPSW2G(common)) {
> +			ret = k3_udma_glue_push_tx_chn(tx_chn->tx_chn,
> +						       host_desc, dma_desc);
> +		} else {
> +			spin_lock_bh(&tx_chn->lock);
> +			ret = k3_udma_glue_push_tx_chn(tx_chn->tx_chn,
> +						       host_desc, dma_desc);
> +			spin_unlock_bh(&tx_chn->lock);
> +		}
> +
> +		if (ret) {
> +			ndev->stats.tx_errors++;
> +			k3_cppi_desc_pool_free(tx_chn->desc_pool, host_desc);
> +			break;
> +		}
> +
> +		num_tx++;
> +	}
> +
> +	return num_tx;
> +}
> +
>   static int am65_cpsw_xdp_tx_frame(struct net_device *ndev,
>   				  struct am65_cpsw_tx_chn *tx_chn,
>   				  struct xdp_frame *xdpf,
> @@ -1716,15 +1822,19 @@ static int am65_cpsw_nuss_tx_compl_packets(struct am65_cpsw_common *common,
>   	struct netdev_queue *netif_txq;
>   	unsigned int total_bytes = 0;
>   	struct net_device *ndev;
> +	int xsk_frames_done = 0;
>   	struct xdp_frame *xdpf;
>   	unsigned int pkt_len;
>   	struct sk_buff *skb;
>   	dma_addr_t desc_dma;
>   	int res, num_tx = 0;
> +	int xsk_tx = 0;
>   
>   	tx_chn = &common->tx_chns[chn];
>   
>   	while (true) {
> +		pkt_len = 0;
> +
>   		if (!single_port)
>   			spin_lock(&tx_chn->lock);
>   		res = k3_udma_glue_pop_tx_chn(tx_chn->tx_chn, &desc_dma);
> @@ -1746,25 +1856,36 @@ static int am65_cpsw_nuss_tx_compl_packets(struct am65_cpsw_common *common,
>   		swdata = cppi5_hdesc_get_swdata(desc_tx);
>   		ndev = swdata->ndev;
>   		buf_type = am65_cpsw_nuss_buf_type(tx_chn, desc_dma);
> -		if (buf_type == AM65_CPSW_TX_BUF_TYPE_SKB) {
> +		switch (buf_type) {
> +		case AM65_CPSW_TX_BUF_TYPE_SKB:
>   			skb = swdata->skb;
>   			am65_cpts_tx_timestamp(tx_chn->common->cpts, skb);
>   			pkt_len = skb->len;
>   			napi_consume_skb(skb, budget);
> -		} else {
> +			total_bytes += pkt_len;
> +			break;
> +		case AM65_CPSW_TX_BUF_TYPE_XDP_TX:
> +		case AM65_CPSW_TX_BUF_TYPE_XDP_NDO:
>   			xdpf = swdata->xdpf;
>   			pkt_len = xdpf->len;
> +			total_bytes += pkt_len;
>   			if (buf_type == AM65_CPSW_TX_BUF_TYPE_XDP_TX)
>   				xdp_return_frame_rx_napi(xdpf);
>   			else
>   				xdp_return_frame(xdpf);
> +			break;
> +		case AM65_CPSW_TX_BUF_TYPE_XSK_TX:
> +			pkt_len = cppi5_hdesc_get_pktlen(desc_tx);
> +			xsk_frames_done++;
> +			break;
> +		default:
> +			break;
>   		}
>   
> -		total_bytes += pkt_len;
>   		num_tx++;
> -		am65_cpsw_nuss_xmit_free(tx_chn, desc_tx);
> +		am65_cpsw_nuss_xmit_free(tx_chn, desc_tx, buf_type);
>   		dev_sw_netstats_tx_add(ndev, 1, pkt_len);
> -		if (!single_port) {
> +		if (!single_port && buf_type != AM65_CPSW_TX_BUF_TYPE_XSK_TX) {
>   			/* as packets from multi ports can be interleaved
>   			 * on the same channel, we have to figure out the
>   			 * port/queue at every packet and report it/wake queue.
> @@ -1781,6 +1902,19 @@ static int am65_cpsw_nuss_tx_compl_packets(struct am65_cpsw_common *common,
>   		am65_cpsw_nuss_tx_wake(tx_chn, ndev, netif_txq);
>   	}
>   
> +	if (tx_chn->xsk_pool) {
> +		if (xsk_frames_done)
> +			xsk_tx_completed(tx_chn->xsk_pool, xsk_frames_done);
> +
> +		if (xsk_uses_need_wakeup(tx_chn->xsk_pool))
> +			xsk_set_tx_need_wakeup(tx_chn->xsk_pool);
> +
> +		ndev = common->ports[tx_chn->xsk_port_id].ndev;

I found that the source of the crash is likely due to ndev being a null 
pointer. This can be proved by adding some print statements, see 
https://gist.github.com/dao-qiu/817e8ee1098a517eab5b2f1b1681382d for my 
print statements and the resulting log.

I noticed that when eth1 is used, the xsk_port_id is 2. I'm assuming 
common->ports[] is 0-indexed so I was wondering if the null pointer may 
be due to indexing beyond the port array size. I'm also assuming 
common->port_num will give the total expected number of ports that is 
possible for indexing common->ports[] but I haven't tried printing it 
out yet.

To test my theory, I modified "ndev = common->ports[tx_chn->xsk_port_id 
- 1].ndev;" to include the tx_chn->xsk_port_id - 1 and the crash appears 
to not happen anymore.

Along the same lines, when eth0 is used and xsk_port_id is 1, would this 
be inadvertently setting the ndev for eth1 instead? When testing eth0, 
the crash does not happen.

Please let me know if you agree if this might be the problem.

> +		netif_txq = netdev_get_tx_queue(ndev, chn);
> +		txq_trans_cond_update(netif_txq);
> +		xsk_tx = am65_cpsw_xsk_xmit_zc(ndev, tx_chn);
> +	}
> +
>   	dev_dbg(dev, "%s:%u pkt:%d\n", __func__, chn, num_tx);
>   
>   	return num_tx;
> @@ -1791,7 +1925,11 @@ static enum hrtimer_restart am65_cpsw_nuss_tx_timer_callback(struct hrtimer *tim
>   	struct am65_cpsw_tx_chn *tx_chns =
>   			container_of(timer, struct am65_cpsw_tx_chn, tx_hrtimer);
>   
> -	enable_irq(tx_chns->irq);
> +	if (tx_chns->irq_disabled) {
> +		tx_chns->irq_disabled = false;
> +		enable_irq(tx_chns->irq);
> +	}
> +
>   	return HRTIMER_NORESTART;
>   }
>   
> @@ -1811,7 +1949,8 @@ static int am65_cpsw_nuss_tx_poll(struct napi_struct *napi_tx, int budget)
>   			hrtimer_start(&tx_chn->tx_hrtimer,
>   				      ns_to_ktime(tx_chn->tx_pace_timeout),
>   				      HRTIMER_MODE_REL_PINNED);
> -		} else {
> +		} else if (tx_chn->irq_disabled) {
> +			tx_chn->irq_disabled = false;
>   			enable_irq(tx_chn->irq);
>   		}
>   	}
> @@ -1834,6 +1973,7 @@ static irqreturn_t am65_cpsw_nuss_tx_irq(int irq, void *dev_id)
>   {
>   	struct am65_cpsw_tx_chn *tx_chn = dev_id;
>   
> +	tx_chn->irq_disabled = true;
>   	disable_irq_nosync(irq);
>   	napi_schedule(&tx_chn->napi_tx);
>   
> @@ -1998,14 +2138,14 @@ static netdev_tx_t am65_cpsw_nuss_ndo_slave_xmit(struct sk_buff *skb,
>   	return NETDEV_TX_OK;
>   
>   err_free_descs:
> -	am65_cpsw_nuss_xmit_free(tx_chn, first_desc);
> +	am65_cpsw_nuss_xmit_free(tx_chn, first_desc, AM65_CPSW_TX_BUF_TYPE_SKB);
>   err_free_skb:
>   	ndev->stats.tx_dropped++;
>   	dev_kfree_skb_any(skb);
>   	return NETDEV_TX_OK;
>   
>   busy_free_descs:
> -	am65_cpsw_nuss_xmit_free(tx_chn, first_desc);
> +	am65_cpsw_nuss_xmit_free(tx_chn, first_desc, AM65_CPSW_TX_BUF_TYPE_SKB);
>   busy_stop_q:
>   	netif_tx_stop_queue(netif_txq);
>   	return NETDEV_TX_BUSY;
> @@ -2259,6 +2399,7 @@ static const struct net_device_ops am65_cpsw_nuss_netdev_ops = {
>   	.ndo_xdp_xmit		= am65_cpsw_ndo_xdp_xmit,
>   	.ndo_hwtstamp_get       = am65_cpsw_nuss_hwtstamp_get,
>   	.ndo_hwtstamp_set       = am65_cpsw_nuss_hwtstamp_set,
> +	.ndo_xsk_wakeup		= am65_cpsw_xsk_wakeup,
>   };
>   
>   static void am65_cpsw_disable_phy(struct phy *phy)
> diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.h b/drivers/net/ethernet/ti/am65-cpsw-nuss.h
> index 2bf4d12f92764706719cc1d65001dbb53da58c38..ac2d9d32e95b932665131a317df8316cb6cb7f96 100644
> --- a/drivers/net/ethernet/ti/am65-cpsw-nuss.h
> +++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.h
> @@ -72,6 +72,7 @@ enum am65_cpsw_tx_buf_type {
>   	AM65_CPSW_TX_BUF_TYPE_SKB,
>   	AM65_CPSW_TX_BUF_TYPE_XDP_TX,
>   	AM65_CPSW_TX_BUF_TYPE_XDP_NDO,
> +	AM65_CPSW_TX_BUF_TYPE_XSK_TX,
>   };
>   
>   struct am65_cpsw_host {
> @@ -97,6 +98,9 @@ struct am65_cpsw_tx_chn {
>   	unsigned char dsize_log2;
>   	char tx_chn_name[128];
>   	u32 rate_mbps;
> +	struct xsk_buff_pool *xsk_pool;
> +	int xsk_port_id;
> +	bool irq_disabled;
>   };
>   
>   struct am65_cpsw_rx_flow {
> @@ -118,6 +122,7 @@ struct am65_cpsw_tx_swdata {
>   	union {
>   		struct sk_buff *skb;
>   		struct xdp_frame *xdpf;
> +		struct xsk_buff_pool *xsk_pool;
>   	};
>   };
>   
> diff --git a/drivers/net/ethernet/ti/am65-cpsw-xdp.c b/drivers/net/ethernet/ti/am65-cpsw-xdp.c
> index 0e37c27f77720713430a3e70f6c4b3dfb048cfc0..9adf13056f70fea36d9aeac157b7da0cae2c011e 100644
> --- a/drivers/net/ethernet/ti/am65-cpsw-xdp.c
> +++ b/drivers/net/ethernet/ti/am65-cpsw-xdp.c
> @@ -109,8 +109,10 @@ int am65_cpsw_xsk_wakeup(struct net_device *ndev, u32 qid, u32 flags)
>   	struct am65_cpsw_common *common = am65_ndev_to_common(ndev);
>   	struct am65_cpsw_port *port = am65_ndev_to_port(ndev);
>   	struct am65_cpsw_rx_flow *rx_flow;
> +	struct am65_cpsw_tx_chn *tx_ch;
>   
>   	rx_flow = &common->rx_chns.flows[qid];
> +	tx_ch = &common->tx_chns[qid];
>   
>   	if (!netif_running(ndev) || !netif_carrier_ok(ndev))
>   		return -ENETDOWN;
> @@ -121,9 +123,16 @@ int am65_cpsw_xsk_wakeup(struct net_device *ndev, u32 qid, u32 flags)
>   	if (qid >= common->rx_ch_num_flows || qid >= common->tx_ch_num)
>   		return -EINVAL;
>   
> -	if (!rx_flow->xsk_pool)
> +	if (!rx_flow->xsk_pool && !tx_ch->xsk_pool)
>   		return -EINVAL;
>   
> +	if (flags & XDP_WAKEUP_TX) {
> +		if (!napi_if_scheduled_mark_missed(&tx_ch->napi_tx)) {
> +			if (likely(napi_schedule_prep(&tx_ch->napi_tx)))
> +				__napi_schedule(&tx_ch->napi_tx);
> +		}
> +	}
> +
>   	if (flags & XDP_WAKEUP_RX) {
>   		if (!napi_if_scheduled_mark_missed(&rx_flow->napi_rx)) {
>   			if (likely(napi_schedule_prep(&rx_flow->napi_rx)))

Best regards,

Daolin

Texas Instruments Sitara MPU Systems Applications

