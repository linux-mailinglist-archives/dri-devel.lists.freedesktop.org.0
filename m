Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD03C5CC82
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 12:13:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836DE10EA3C;
	Fri, 14 Nov 2025 11:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="X+fcgGzZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013012.outbound.protection.outlook.com
 [40.93.201.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D2710EA3C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 11:13:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fs8V3FCMs1KGmhNdXtjLVAx1kwG8c/KolmMXX0xuDZUhZsYKufzExicr2ClnawSfDItcWwPsyLwRnwuMkH8NuL6QTND/FmZ4ICrn0gDCMUfp8wVPYfC1CV9/Ltm5nweUpsC1cjL40TEGbzVk8RF1Q2ESb27Fb/SF3a0EFgDM8uvDLjvH8avsUrz9J0WM2QDh+x49YA03SORafdI58V5zh6x4fnLoFCxMVRiQELpDDkGQBdu1mbDY3baMQ23E5FMw6ekoRUlWW8kTukaojveH4apJ9IJAhkwdMpIqK/NQDCa9mk4AaPVRDNzXPWMgrut3seuaKjqPxvWoH7XmRpVgwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMzKjTcHJWDpvDIK0bqX2/DAOrIti20vcVW2pwyhm7s=;
 b=YEtJRvjpkQIWjz1LwdaW5+f68SrDTQfJ+OYYoqBvn0+hpG2f/B0N6VHNKqlRNc/FSmDJdYGsRqXAJf+k52+NXuyAv5i4smRIcxUhoF3s+avEtmuYcWePTTSLlVXXAA5IVZ2HA8jhHy9EsXUX/dguU+AtEFmQtELD3bUfgnjdUBYyABM/l7sWdZKjA0NI2/dVTdu53w4ZQNyu3m2yNFy/zC1i77P73U/jobAdRil3esTmrni27wEvX5K/0lgL8+LsSUoVJDiv9SaTNELbx6Hd0izYHe9Iw3K5QFZcy3uQ4VIFJLLhUo8WbraP1Y78E/WtjcJOUTGsYEpQg2ZzZyn0Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMzKjTcHJWDpvDIK0bqX2/DAOrIti20vcVW2pwyhm7s=;
 b=X+fcgGzZWMpprUT6aP21UyGjmZ8Iql+mtEoCDHshFhHkXICu3akJOTb+lew0iuht26TmvtoeljgkpBLTSgb/l9hUtDy/rrt3UHVZoioVhGMiC5M5t2/a+YA6hX9Zs0luNvHP4m8HQjn6x6mNI+CUf3dtDA9FTM8XPKzaDoe/Kj8=
Received: from BN9PR03CA0906.namprd03.prod.outlook.com (2603:10b6:408:107::11)
 by PH3PPF077CE0592.namprd10.prod.outlook.com (2603:10b6:518:1::785)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Fri, 14 Nov
 2025 11:13:36 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:107:cafe::e3) by BN9PR03CA0906.outlook.office365.com
 (2603:10b6:408:107::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Fri,
 14 Nov 2025 11:13:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 11:13:33 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 05:13:29 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 05:13:28 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 14 Nov 2025 05:13:28 -0600
Received: from [10.24.69.13] (meghana-pc.dhcp.ti.com [10.24.69.13] (may be
 forged))
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AEBDLRH1893172;
 Fri, 14 Nov 2025 05:13:22 -0600
Message-ID: <3737a9bf-e95b-4ea8-b16b-418b777f407c@ti.com>
Date: Fri, 14 Nov 2025 16:43:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 1/6] net: ti: icssg-prueth: Add functions to
 create and destroy Rx/Tx queues
To: Simon Horman <horms@kernel.org>
CC: <namcao@linutronix.de>, <vadim.fedorenko@linux.dev>,
 <jacob.e.keller@intel.com>, <christian.koenig@amd.com>,
 <sumit.semwal@linaro.org>, <sdf@fomichev.me>, <john.fastabend@gmail.com>,
 <hawk@kernel.org>, <daniel@iogearbox.net>, <ast@kernel.org>,
 <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
 <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
 <linaro-mm-sig@lists.linaro.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
References: <20251111101523.3160680-1-m-malladi@ti.com>
 <20251111101523.3160680-2-m-malladi@ti.com>
 <aRcGMTRzDFwe23NV@horms.kernel.org>
Content-Language: en-US
From: Meghana Malladi <m-malladi@ti.com>
In-Reply-To: <aRcGMTRzDFwe23NV@horms.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|PH3PPF077CE0592:EE_
X-MS-Office365-Filtering-Correlation-Id: 19158132-7084-4256-0eb1-08de236ed9b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFBkaWdIUzJTNno5Tzk3NTNrdG9OaGRDMElIcWI3ZHdsM1lxT0x6TG9OTWto?=
 =?utf-8?B?emY2VVpiVDFQS2dkV1lQa09yOC9JQmZHWVNocFVaMEdBWFFMNlFrZWFHL005?=
 =?utf-8?B?VXJTaTVSTjdPRTFTNG0wVkYwMEt2NEIxVG1leHNpdEwwdVRNMVBGSVVSNmJK?=
 =?utf-8?B?My9GQVY2bGlnTENoZllaNjUrRG13anJGSGtNTjNMUE8vM3YxQ2RoTmlvMlRo?=
 =?utf-8?B?UVFiQmRxaGdjeUxuVEF0Y0JBT09LbU52WHh2cEtIcW03L2h4ZUR3MWgxNHFj?=
 =?utf-8?B?UkxmQ29FRGp1VXp1bmRwMUNJM2FhbGo4WFVSSU1iTWhaTGVpY2tiUjVGbVh3?=
 =?utf-8?B?eXNXUUt6M3d1dHlQVk9pVktpZ0Z5ZzREVnVsUWZmRGRRbEdZZlNsUG5nczNV?=
 =?utf-8?B?VFJzQ3VoU2ZPMUl5ZHJ0QUh5WDV5ZEVDNzVFVDV2M3VrdXVMQkIvcGxrSEhE?=
 =?utf-8?B?L3o0aW5tK2hwNkNnamQwT1VYRTI4ZzFWeFo0anNvaWgrdmlDUncxckZzc1NK?=
 =?utf-8?B?K0dDeTJDVHVZQTJpNGJyQnBOVytWbDFvOVVrcW4wYXNTNytDbnhTQ1Q2TUEx?=
 =?utf-8?B?VU5sYTZSYW8xNWVUWHFCMHdmUlF4VGVBNnNBd3U1VEFGNWJJU1RRVVIxVzE1?=
 =?utf-8?B?YnQ5K3hnMDMwNnJKSFJhalNINmxILys2Y1BjZExJTjdvWTFhQk9ERk9sSTk5?=
 =?utf-8?B?eHdHZlEwNndqeGFUQS9yaFU5QWdWS1NKcEdHVDJmU2JzZXl5NUhWNm9PZndl?=
 =?utf-8?B?UGh2TU1DRUY4UVl1dXpQeGJoYlQyYlhPZnNETW9kdTNzNHVlczRsUGFtNjlK?=
 =?utf-8?B?RmxWRFVqSlN4WmlIWnYzRmxwcUJDbmt5MkMxL2JJNDRvWE9JMlE4dEhidXNy?=
 =?utf-8?B?VElqRS80eUpFdjJ6ZnRCMEFRMElsMmhGdFBFTEc3b05yWXFJb3lqQTFOMzVu?=
 =?utf-8?B?dXZwcU81N2lsbFZLUTF6Y2g5R1NJL251MkQvL3N3aGlPdlVmOGJOUFlvZHVa?=
 =?utf-8?B?OVB6djhOUDVYS2tUQW54M0xxWEh2Mkk1YUV2amdOclhlWm40bHNSOGYwaU1W?=
 =?utf-8?B?VDlRYUE5WERnOGJOWEcxYkJzQ2lYb0NlUHdOMGRneUxZNzArVnVpeFAwbkNk?=
 =?utf-8?B?SFJPSWpKZXgwcEFUeThCMVFLT09qWmZuY2dpM0Ntay9TV1ptdnNXTG9rR3B6?=
 =?utf-8?B?cy9sTytLTDJVODVUc05LbUtZNjJhRzJrVDRacWRFaTJjc1lqZS9qeS9Ea2JB?=
 =?utf-8?B?ak1VYVlqMXc5RXhqTWwyelRNblFNZVVvN0ZtSEs0YllOS2tqTWNZeWVGekVq?=
 =?utf-8?B?K2ZFNUFxcjRzSXo4TDhPdEIzdDFYZzIxUUdSMnhrNis2b3RBb1dNS2UwbS9z?=
 =?utf-8?B?UXUvTDJIN2dkRlNGNWpUQTlWWHRsVzA3TnQwdTN6RzB0UW9qYVNROVNIdStn?=
 =?utf-8?B?VlRyVko3TDJhYkpxKzhuZk4yZ1RTWCtROTNPQkZqbW1ZSWQwS0VTN0hCeVRO?=
 =?utf-8?B?THZPTkc0TEJDbDZIakdmbnFtTk9JZW5vcllqUEx0eExxQzRybWlHNmVjeUI1?=
 =?utf-8?B?c05LWTdmS0lUR0QwODBzN3ZCVGM1SkYwMXRWenN4aUNmREFMQnp0WHhMeXBr?=
 =?utf-8?B?bXk4N2ZJZXl0M3BhMEIyZmRIVkZzQ3IySTR4OER3R2ZWYnFJRnJucWtsbk1X?=
 =?utf-8?B?Z2d3eGhwVFJlQ29WczdEUnMwZFRsQjI4RGVFWktiNkFoYXc2OHhUQjhhQTZx?=
 =?utf-8?B?MEtWRGtkZTRJemhWbVpyZ3F2K2VpTnkyUEFEdmRrNnBQRXpIU0FwcmpYK21i?=
 =?utf-8?B?ZzBTaGxUWHF4QW1tODR5Q0EzeTlaSkgrY2J6clQ4SW9TT1luRkxIYVNYaGlk?=
 =?utf-8?B?RExMNDc5N1JvbHBwa1Y0dVowcDN5QWk2UXQxbHd1MWs1KzNkWndEWVd5YkFU?=
 =?utf-8?B?WWptbFBTKzBleUs2S0F2Y0xkbDhJY3JCQ2pEZlY4RXl4Q2p1L1A4NlQyRWZB?=
 =?utf-8?B?MDZpSDZLSGxwcU9PWmtpdGlySmptdWJINXJpWEc0UkRMMVR3NFlTK25aUFVp?=
 =?utf-8?B?VzlGMmRlL01KTzBya2gweEs3c2c0UE15MDVpTFg0Y253KzlKVDBxSUJ4QzYr?=
 =?utf-8?Q?TEsw=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 11:13:33.7891 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19158132-7084-4256-0eb1-08de236ed9b3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF077CE0592
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

Hi Simon,

On 11/14/25 16:06, Simon Horman wrote:
> On Tue, Nov 11, 2025 at 03:45:18PM +0530, Meghana Malladi wrote:
> 
> ...
> 
>> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
>> index 57a7d1ceab08..b66ffbfb499c 100644
>> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
>> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
>> @@ -735,6 +735,114 @@ static int icssg_update_vlan_mcast(struct net_device *vdev, int vid,
>>   	return 0;
>>   }
>>   
>> +static void prueth_destroy_txq(struct prueth_emac *emac)
>> +{
>> +	int ret, i;
>> +
>> +	atomic_set(&emac->tdown_cnt, emac->tx_ch_num);
>> +	/* ensure new tdown_cnt value is visible */
>> +	smp_mb__after_atomic();
>> +	/* tear down and disable UDMA channels */
>> +	reinit_completion(&emac->tdown_complete);
>> +	for (i = 0; i < emac->tx_ch_num; i++)
>> +		k3_udma_glue_tdown_tx_chn(emac->tx_chns[i].tx_chn, false);
>> +
>> +	ret = wait_for_completion_timeout(&emac->tdown_complete,
>> +					  msecs_to_jiffies(1000));
>> +	if (!ret)
>> +		netdev_err(emac->ndev, "tx teardown timeout\n");
>> +
>> +	for (i = 0; i < emac->tx_ch_num; i++) {
>> +		napi_disable(&emac->tx_chns[i].napi_tx);
>> +		hrtimer_cancel(&emac->tx_chns[i].tx_hrtimer);
>> +		k3_udma_glue_reset_tx_chn(emac->tx_chns[i].tx_chn,
>> +					  &emac->tx_chns[i],
>> +					  prueth_tx_cleanup);
>> +		k3_udma_glue_disable_tx_chn(emac->tx_chns[i].tx_chn);
>> +	}
>> +}
>> +
>> +static void prueth_destroy_rxq(struct prueth_emac *emac)
>> +{
>> +	int i, ret;
>> +
>> +	/* tear down and disable UDMA channels */
>> +	reinit_completion(&emac->tdown_complete);
>> +	k3_udma_glue_tdown_rx_chn(emac->rx_chns.rx_chn, true);
>> +
>> +	/* When RX DMA Channel Teardown is initiated, it will result in an
>> +	 * interrupt and a Teardown Completion Marker (TDCM) is queued into
>> +	 * the RX Completion queue. Acknowledging the interrupt involves
>> +	 * popping the TDCM descriptor from the RX Completion queue via the
>> +	 * RX NAPI Handler. To avoid timing out when waiting for the TDCM to
>> +	 * be popped, schedule the RX NAPI handler to run immediately.
>> +	 */
>> +	if (!napi_if_scheduled_mark_missed(&emac->napi_rx)) {
>> +		if (napi_schedule_prep(&emac->napi_rx))
>> +			__napi_schedule(&emac->napi_rx);
>> +	}
>> +
>> +	ret = wait_for_completion_timeout(&emac->tdown_complete,
>> +					  msecs_to_jiffies(1000));
>> +	if (!ret)
>> +		netdev_err(emac->ndev, "rx teardown timeout\n");
>> +
>> +	for (i = 0; i < PRUETH_MAX_RX_FLOWS; i++) {
>> +		napi_disable(&emac->napi_rx);
>> +		hrtimer_cancel(&emac->rx_hrtimer);
> 
> Hi Meghana,
> 
> Is it intentional that the napi_disable() and hrtimer_cancel()
> are made once for each (possible) flow, rather than just once
> as was the case before this patch?
> 
> Maybe the tx code, which does the same, was used as a template here
> in error?
> 

Currently there is only one flow per Rx channel. But we can enable 
support to add multiple flows to a given given channel. In that case 
napi_disable() and hrtimer_cancel() will be invoked per flow. That being 
said, though right now this for loop is redundant this is a intentional 
change for multiple flows.

> Flagged by Claude Code with https://github.com/masoncl/review-prompts/
> 
>> +		k3_udma_glue_reset_rx_chn(emac->rx_chns.rx_chn, i,
>> +					  &emac->rx_chns,
>> +					  prueth_rx_cleanup);
>> +	}
>> +
>> +	prueth_destroy_xdp_rxqs(emac);
>> +	k3_udma_glue_disable_rx_chn(emac->rx_chns.rx_chn);
>> +}
> 
> ...
> 
>> @@ -905,32 +988,8 @@ static int emac_ndo_stop(struct net_device *ndev)
>>   	else
>>   		__dev_mc_unsync(ndev, icssg_prueth_del_mcast);
>>   
>> -	atomic_set(&emac->tdown_cnt, emac->tx_ch_num);
>> -	/* ensure new tdown_cnt value is visible */
>> -	smp_mb__after_atomic();
>> -	/* tear down and disable UDMA channels */
>> -	reinit_completion(&emac->tdown_complete);
>> -	for (i = 0; i < emac->tx_ch_num; i++)
>> -		k3_udma_glue_tdown_tx_chn(emac->tx_chns[i].tx_chn, false);
>> -
>> -	ret = wait_for_completion_timeout(&emac->tdown_complete,
>> -					  msecs_to_jiffies(1000));
>> -	if (!ret)
>> -		netdev_err(ndev, "tx teardown timeout\n");
>> -
>> -	prueth_reset_tx_chan(emac, emac->tx_ch_num, true);
>> -	for (i = 0; i < emac->tx_ch_num; i++) {
>> -		napi_disable(&emac->tx_chns[i].napi_tx);
>> -		hrtimer_cancel(&emac->tx_chns[i].tx_hrtimer);
>> -	}
>> -
>> -	max_rx_flows = PRUETH_MAX_RX_FLOWS;
>> -	k3_udma_glue_tdown_rx_chn(emac->rx_chns.rx_chn, true);
>> -
>> -	prueth_reset_rx_chan(&emac->rx_chns, max_rx_flows, true);
>> -	prueth_destroy_xdp_rxqs(emac);
>> -	napi_disable(&emac->napi_rx);
>> -	hrtimer_cancel(&emac->rx_hrtimer);
>> +	prueth_destroy_txq(emac);
>> +	prueth_destroy_rxq(emac);
>>   
>>   	cancel_work_sync(&emac->rx_mode_work);
>>   
>> @@ -943,10 +1002,10 @@ static int emac_ndo_stop(struct net_device *ndev)
>>   
>>   	free_irq(emac->tx_ts_irq, emac);
>>   
>> -	free_irq(emac->rx_chns.irq[rx_flow], emac);
>> +	free_irq(emac->rx_chns.irq[PRUETH_RX_FLOW_DATA], emac);
>>   	prueth_ndev_del_tx_napi(emac, emac->tx_ch_num);
>>   
>> -	prueth_cleanup_rx_chns(emac, &emac->rx_chns, max_rx_flows);
>> +	prueth_cleanup_rx_chns(emac, &emac->rx_chns, PRUETH_MAX_RX_FLOWS);
>>   	prueth_cleanup_tx_chns(emac);
>>   
>>   	prueth->emacs_initialized--;
> 
> ...

