Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1A6C1E606
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 05:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1547210E23C;
	Thu, 30 Oct 2025 04:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="s/6MncB8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azhn15010052.outbound.protection.outlook.com [52.102.136.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6369510E23C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 04:44:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFJLT6UOjJvtAwNYTUwMrnDnrh/GmLi/2v+4HB2pFBEgtl/JmcfpU7xR5g/1fKHYvK6LvSonuFpXqJ0o69Dk6j/UxhwGH5HJkNpVHywLPqNJzyQ49vNs16sYgn7NusqNaR3b5gxIg0t0w3iV+3+PJt2+jIGfWx9TgfLbNRS7hC0kpyoEamc9rdRxBEpFD1arWglFr32Ka8BIOfonj985aENLL5gfLvQcM1ZClI5aFbtLTMCSWnd4q8Jz6CbrmLGbkyOGacSZ0ITHI4GnCFDxPR1TtL0EJpOYPmoM/O9RIEMrXLKQ04AmympZv0ey3t4E3JeLNXM4gUNGfSTW+R9lGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpgtKhPtUjL30Fec/scLab74IjUMA05RajdEndc/YuU=;
 b=fvLIG4whZOaGJIPs+tbmWCIVDmHVTYbmZFDONjEg2dAtPcmwIb1VrGGNeIrkZMZk5I0bsc9gzsjH3fMUFam9C88Y7jaHPv13mvgfZys744Gih/eBx2VXPKHqLAivXyz+taG80VLUCTsGhlLfUkHJJTCboV0SIiNGxh+H3ihAQhMR8vbrznwHX94fPwunpP8eBqLVTiqyWi8emA41MTrTovwjYckKv0IZtifTah2SoT3MX0SxK2MmMZKPhianHT/9sxvuzJXmi9pTxALKTaZyOxIvk7rFwpkm80UwC9Fj38g2UAh9nOHTALSEP94pDKOMdS5EHDxLJ5rtojNArX0Hbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpgtKhPtUjL30Fec/scLab74IjUMA05RajdEndc/YuU=;
 b=s/6MncB8npOsupezmnmSUz3bHQQY7bGiR2tTnLThZ/pwI+Dtn8HtS4kZGpWwXIs3bi8Dt4x7nQrCJCuRX03PGqZJqkiUYGpwUhE0ZBKOagnMFapbNr+w9hzQsrY4yl5sVFR1YY9c9vA3p1XrGGB6+4UJ03lhhz27UfpkwIkSdKY=
Received: from BN0PR04CA0137.namprd04.prod.outlook.com (2603:10b6:408:ed::22)
 by BN0PR10MB4981.namprd10.prod.outlook.com (2603:10b6:408:12d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 04:44:10 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:ed:cafe::db) by BN0PR04CA0137.outlook.office365.com
 (2603:10b6:408:ed::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 04:43:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 04:44:09 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 23:43:59 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 23:43:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 23:43:59 -0500
Received: from [10.24.69.13] (meghana-pc.dhcp.ti.com [10.24.69.13] (may be
 forged))
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59U4hqLO1337117;
 Wed, 29 Oct 2025 23:43:52 -0500
Message-ID: <ba1b48dc-b544-4c4b-be8a-d39b104cda21@ti.com>
Date: Thu, 30 Oct 2025 10:13:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH net-next v4 2/6] net: ti: icssg-prueth: Add
 XSK pool helpers
To: Paolo Abeni <pabeni@redhat.com>, <horms@kernel.org>,
 <namcao@linutronix.de>, <vadim.fedorenko@linux.dev>,
 <jacob.e.keller@intel.com>, <christian.koenig@amd.com>,
 <sumit.semwal@linaro.org>, <sdf@fomichev.me>, <john.fastabend@gmail.com>,
 <hawk@kernel.org>, <daniel@iogearbox.net>, <ast@kernel.org>,
 <kuba@kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
 <andrew+netdev@lunn.ch>
CC: <linaro-mm-sig@lists.linaro.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
References: <20251023093927.1878411-1-m-malladi@ti.com>
 <20251023093927.1878411-3-m-malladi@ti.com>
 <05efdc9a-8704-476e-8179-1a9fc0ada749@redhat.com>
Content-Language: en-US
From: Meghana Malladi <m-malladi@ti.com>
In-Reply-To: <05efdc9a-8704-476e-8179-1a9fc0ada749@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|BN0PR10MB4981:EE_
X-MS-Office365-Filtering-Correlation-Id: d547939b-942c-4649-5de9-08de176ef77b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|7416014|376014|34020700016|36860700013|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUJob3ZIMlU4cFg0Zk1FSGJHUFhrTWFTbFFaeFBuU0VYcnNQVjk5VEtBTnN4?=
 =?utf-8?B?WjlhNkpIRHloK3FhbDAzc0ZtSVV2d0dNczQrYVRvcTJMUkxWdnU3UkFYNTJj?=
 =?utf-8?B?WEpwaEV2WVBzbUZvakhFYTFoWWF4SHl0NkRuSTJaQnk4VWZoNWpFUkw2V1lZ?=
 =?utf-8?B?RElLazBBZW9aZnp4aWEzMWV6VlE2dU5qM2JsenZBR2dDNElZKzM5dVRqTTl3?=
 =?utf-8?B?aThhUnJBeVVFdnpGcHBmWkYrL01BamgxMGRJOGZxK0FzNWMzcUorc0VzMjBx?=
 =?utf-8?B?cFhmaUQ5NHA0aTY4S25aVy96ZzdRNDBhUThnWE9BTXlqcmh5dWJPNnlLa3Zi?=
 =?utf-8?B?K3VBRWp0K28yS1QvVWYzYlFqNzdkKzFQN1dkU0tBdWliVTNDK3B4Mi9WV3RN?=
 =?utf-8?B?RmNXb3pybjFWbHRaZUNtcnhkbnZjWGFjbkxibktxRFh6N0ZJUWF6R1NybGQy?=
 =?utf-8?B?alcrVHJQTitabFg2ejc4ZWJ0UW1oVmVLUXZNc2R5NmMwSXp6SmNtQ3hxM0hh?=
 =?utf-8?B?TGt0Wjd0OFQyaVM1UnhwK2tMdWRNbUxMSUFHeVRIWEc2VWRISlZJVjN5RThr?=
 =?utf-8?B?SmdTNnltQnJycHhaaFpqaGFkTG1DUmRIVmVHWGRJd1NndGVjbVJDNHJ6WmFs?=
 =?utf-8?B?SmREd3BYcDVlOVBrVVI1emZCUnI3bzJXR2FpOUpNenhDdDAwVVArSkdCLzRk?=
 =?utf-8?B?QUtkd0ZpUDAzYjk2bVJHT3lvMisrVnVGVkJhY2dCeWNDQ0VnVXNhekdDVEs0?=
 =?utf-8?B?UVZWVjhUVGRCUlg1YlFPZlBIZkhWeHVDTHF3cVVlLytyQ0dEemo1cGU3bGg4?=
 =?utf-8?B?ZFRCeFNxN2lERlhsb0M2UVNZTzY1RjMrTDhsZmFNM003VXJFNFRqdFNaU2t6?=
 =?utf-8?B?bFRYdVMyT2ZSL1IvOENsOXg5RUhzYnB0QmxaY2V3dTVIdlhEU1hqUkNxdWNx?=
 =?utf-8?B?a3lHUFFjMXBhMmJhSHNBUE9mbFB3TUtaa0RHVmdkSmJ4RE10cTJtRW1FU3hK?=
 =?utf-8?B?OVRORmxtWGpkSTVOQVk2V0hSamR0OXRVTTArQkxUNDFZT2lkLzBFYzk4YVE0?=
 =?utf-8?B?YXFvajZldWVUK3JyYzVqZnNKQ3pUajhVT1JjNUdaa2xNUytBcGhDUkxsRkt0?=
 =?utf-8?B?U1Ftd3prcDdTZm9RWXBPUi9yem5VRG9yNnk4K0kzOTZXM2JYeFRpT3QxTmRn?=
 =?utf-8?B?WVU2OEo1TmhxTXcwbEl3VTNCekIvc2tOSnJXWU4rYnMwUjhqTVQ5UjRIeU9y?=
 =?utf-8?B?QWpiU2hHV3JpRWFiK0FFRWRBSlVzYzEzaHRLZ2dXbFYybTY0MzFCMSt2N1Bn?=
 =?utf-8?B?SjNsdkcyZStvTGc0Y0IvVDBmUVF3aWhZU3E3UlNtTmMrNjBnMDZUZnd3S1hD?=
 =?utf-8?B?YXVsakpwK29xcHYydVMwa3VuQ3dRYnpoQktXMFJWRjV1aWhEM1dTNXdIaDBQ?=
 =?utf-8?B?VFFhaGtnTjRwb2NxeUlCVzQ5ZFZLVDZZckFjZ08veUl6YmI4aS96MnFObEVr?=
 =?utf-8?B?UjErVHh5a0xmMjZjdWhobW15dk1HcTNRZHBsekxCT2pYUzgwUSt2Ni84L0ds?=
 =?utf-8?B?TUlrbSs2R0JMblRlZ3AxZzhrVHVZSWtjNGwvVVJFWVBPUUlPYjBsVVNtdEs3?=
 =?utf-8?B?bzFGaytzY3pIM1R6cVMzalg1NWY2M0JJU3RGaVBwZjRaV2ZHY3J4ZXYzQ1VG?=
 =?utf-8?B?S0pZUnR5SDViNE1tOHRKSGhXdEhOK3d3Z3RJSVI3Zys3QWFtY2h3RElZSGlE?=
 =?utf-8?B?d2VyUkZZMy8zeGVLRXdKYUpWVmxTanBaMEs0ak1kNFYwOXBxdjllbGVvY1NC?=
 =?utf-8?B?U0JEMmpYclFLTk8yOUJMOGw3ajN6TDJiNzY4cG1nZVdGRkJpa21LT09uS1Br?=
 =?utf-8?B?TDdkZ3RlSnNNeUU4UVhxUWZiUk5TOEN3SjRUTnlhYXgwZXFYQ0FwckdlaDNH?=
 =?utf-8?B?TFFrTDNuZXpVV0N4bkNoc1d5bHZQeWV4eG9Gc0NvY1VuLzJrc29oQ0hSdXg5?=
 =?utf-8?B?R2V1cEpaL28xajkwRFV4bjZyMDc5alR1TEk3M2o2cThoSzNDUVVUOVZSL3o5?=
 =?utf-8?Q?hIhOY/?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(34020700016)(36860700013)(921020)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:44:09.7861 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d547939b-942c-4649-5de9-08de176ef77b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4981
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

Hi Paolo,

On 10/28/25 16:27, Paolo Abeni wrote:
> On 10/23/25 11: 39 AM, Meghana Malladi wrote: > @@ -1200,6 +1218,109 @@ 
> static int emac_xdp_setup(struct prueth_emac *emac, struct netdev_bpf 
> *bpf) > return 0; > } > > +static int prueth_xsk_pool_enable(struct 
> prueth_emac *emac,
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source 
> of this email and know the content is safe.
> Report Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK! 
> updqHb0lvOd6ACXFPDODXzFjW2RtkIpblpWr3zui2O2JqWTyRCLKc2i7Pa7uSMBZYpq8H7tTr-jp_nDelg_OUrmNCgZ8_m0$>
> ZjQcmQRYFpfptBannerEnd
> 
> On 10/23/25 11:39 AM, Meghana Malladi wrote:
>> @@ -1200,6 +1218,109 @@ static int emac_xdp_setup(struct prueth_emac *emac, struct netdev_bpf *bpf)
>>  	return 0;
>>  }
>>  
>> +static int prueth_xsk_pool_enable(struct prueth_emac *emac,
>> +				  struct xsk_buff_pool *pool, u16 queue_id)
>> +{
>> +	struct prueth_rx_chn *rx_chn = &emac->rx_chns;
>> +	u32 frame_size;
>> +	int ret;
>> +
>> +	if (queue_id >= PRUETH_MAX_RX_FLOWS ||
>> +	    queue_id >= emac->tx_ch_num) {
>> +		netdev_err(emac->ndev, "Invalid XSK queue ID %d\n", queue_id);
>> +		return -EINVAL;
>> +	}
>> +
>> +	frame_size = xsk_pool_get_rx_frame_size(pool);
>> +	if (frame_size < PRUETH_MAX_PKT_SIZE)
>> +		return -EOPNOTSUPP;
>> +
>> +	ret = xsk_pool_dma_map(pool, rx_chn->dma_dev, PRUETH_RX_DMA_ATTR);
>> +	if (ret) {
>> +		netdev_err(emac->ndev, "Failed to map XSK pool: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (netif_running(emac->ndev)) {
>> +		/* stop packets from wire for graceful teardown */
>> +		ret = icssg_set_port_state(emac, ICSSG_EMAC_PORT_DISABLE);
>> +		if (ret)
>> +			return ret;
>> +		prueth_destroy_rxq(emac);
>> +	}
>> +
>> +	emac->xsk_qid = queue_id;
>> +	prueth_set_xsk_pool(emac, queue_id);
>> +
>> +	if (netif_running(emac->ndev)) {
>> +		ret = prueth_create_rxq(emac);
> 
> It looks like this falls short of Jakub's request on v2:
> 
> https://urldefense.com/v3/__https://lore.kernel.org/ 
> netdev/20250903174847.5d8d1c9f@kernel.org/__;!!G3vK! 
> TxEOF2PZA-2oagU7Gmq2PdyHrceI_sWFRSCMP2meOxVrs8eqStDUSTPi2kyzjva1rgUzQUtYbd9g$ <https://urldefense.com/v3/__https://lore.kernel.org/netdev/20250903174847.5d8d1c9f@kernel.org/__;!!G3vK!TxEOF2PZA-2oagU7Gmq2PdyHrceI_sWFRSCMP2meOxVrs8eqStDUSTPi2kyzjva1rgUzQUtYbd9g$>
> 
> about not freeing the rx queue for reconfig.
> 

I tried honoring Jakub's comment to avoid freeing the rx memory wherever 
necessary.

"In case of icssg driver, freeing the rx memory is necessary as the
rx descriptor memory is owned by the cppi dma controller and can be
mapped to a single memory model (pages/xdp buffers) at a given time.
In order to remap it, the memory needs to be freed and reallocated."

> I think you should:
> - stop the H/W from processing incoming packets,
> - spool all the pending packets
> - attach/detach the xsk_pool
> - refill the ring
> - re-enable the H/W
> 

Current implementation follows the same sequence:
1. Does a channel teardown -> stop incoming traffic
2. free the rx descriptors from free queue and completion queue -> spool 
all pending packets/descriptors
3. attach/detach the xsk pool
4. allocate rx descriptors and fill the freeq after mapping them to the 
correct memory buffers -> refill the ring
5. restart the NAPI - re-enable the H/W to recv the traffic

I am still working on skipping 2 and 4 steps but this will be a long 
shot. Need to make sure all corner cases are getting covered. If this 
approach looks doable without causing any regressions I might post it as 
a followup patch later in the future.

> /P
> 

