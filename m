Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B440EC3011B
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 09:53:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1B410E250;
	Tue,  4 Nov 2025 08:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="uabM0aRg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azhn15010019.outbound.protection.outlook.com [52.102.138.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A42B10E58A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 08:53:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJnqhhKGfwOL1HaZTmlyiU+b5jrbZhJmMCxIDiBN+NH7+T9PX+8j+zQl+zwzw3s67QB5lcLN+NoVydk9qDDSeqRqTJRusDbTjBNfDa/DwxlfmaG5S9MZhdSlta2Ym178MtjoS9o/DB4CmoHsKWuZgWkHud3Mfzm6F4DD7gAcWFBOOOgzhJLcFQrVdPeCPSZFPoR9wrDcoTPRq90NoyW2nzqTMgbh0lbf06N+JLUToZPiAOQ4C+EYRKjjiJRn+Py86Q1FIq1Cm01s7ZcaXzqviyZUiTeZ0Y8NBvyrkCxoht8Zt8BQpG4WsGmxUN8dXCsEAVq1c3qQmEx8i/2rY7XrJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2o+GFgh4IBx4CdLDCRMAxzEWR65gnszOF4J3iviVUVw=;
 b=CYpUoEpb3rYeMd3rOSz8QcKJ4rFjlk/Gy1gz8khKIFLud3lvBXgZZFOEAMzJKLSNJFlgkCxdPVsNT+AwyzmQZIV5//V7SWhS1V1CarAa9yvCpUlBg9OYATF2eJaL5pm3kPzk2Jg9B8wvb7h9FBb4zE+ffY2DhxLdbbFNk/NDmYEPUZ0/7lv5XUd4RJKGVoDspAZls4LkLKXqRLdGOQlVUzaiamns87SJbkyVvedekkwfWcFC0Bb+7uOmZseJniVEj0tQJ9KznbGkq3kHwWVLrXQ3rYOjfKBz2ZAAaz9Nrhp01+GSZNpolxlU/dMWiyRVtSXx06sHbPQN1ocklQgucw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2o+GFgh4IBx4CdLDCRMAxzEWR65gnszOF4J3iviVUVw=;
 b=uabM0aRg/IhwdF/Nrah0UySW1CWKB5KVq0dLKeW7SWUpIh/Ck+uU/gYE/O6tpNu08uK/+10k9ByNpsuby1eK0WpwTbj2chueSdGz4u5MXkibVWtMMBAGS74RKBgjmyg0P9XhwSuqpOnLUtWr+ZktfHZdn9ki3FoOZlERLcmZBr8=
Received: from PH8P220CA0030.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::15)
 by CY8PR10MB7315.namprd10.prod.outlook.com (2603:10b6:930:7e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 08:53:51 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:510:348:cafe::aa) by PH8P220CA0030.outlook.office365.com
 (2603:10b6:510:348::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Tue, 4
 Nov 2025 08:53:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 08:53:49 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Nov
 2025 02:53:32 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Nov
 2025 02:53:32 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 4 Nov 2025 02:53:32 -0600
Received: from [10.24.69.13] (meghana-pc.dhcp.ti.com [10.24.69.13] (may be
 forged))
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A48rPTu1678790;
 Tue, 4 Nov 2025 02:53:26 -0600
Message-ID: <c792f4da-3385-4c14-a625-e31b09675c32@ti.com>
Date: Tue, 4 Nov 2025 14:23:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH net-next v4 2/6] net: ti: icssg-prueth: Add
 XSK pool helpers
From: Meghana Malladi <m-malladi@ti.com>
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
 <ba1b48dc-b544-4c4b-be8a-d39b104cda21@ti.com>
Content-Language: en-US
In-Reply-To: <ba1b48dc-b544-4c4b-be8a-d39b104cda21@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|CY8PR10MB7315:EE_
X-MS-Office365-Filtering-Correlation-Id: afa45c00-5f65-40ef-fdf6-08de1b7fac39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|1800799024|34020700016|36860700013|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmU4YnpkdE05dTBzWC9UUDlDRzJjQzVuUTV1eDR4RlA1TUdraWl4VThmMXpD?=
 =?utf-8?B?WXRNcCtXV2hUcE1vblp3Y2NJbi80K013RVhNYnhyVUJqR0JGTWNXUFlDdExu?=
 =?utf-8?B?YW9nN2xIbU43emVxaXJFWkh2MWlqTm8rblV2M1pHUm81aGYrUzdpT3V1MHJV?=
 =?utf-8?B?elA3dGVBMng0RWpwc1BrdUoxaUVJTW9vNzMwQTlMQTA0U0M0czJ3ejdZZCtC?=
 =?utf-8?B?eVE4OWh3UFJHUXJRWXlnRkoyMUdUWXlvblhHU0JXdEUxRE1HQUdVd2wxbjJk?=
 =?utf-8?B?aDU2RTBrUlh4OHNUTkNDbFJuTFVXK0tDeFI0dmp0TjYwSUhXYzRlWU1Ydlcr?=
 =?utf-8?B?RzJnVE9NVGNOL1BnTG1jS0FhTGdvNm4xRldISzVldldBWG9rczRlVHhIWnpi?=
 =?utf-8?B?UkcyV2luQm95RXhZOFhLd3EvdjRhVTg0bEl5ZmFYaWMzNTJ5V0IrMXQvZ1BH?=
 =?utf-8?B?YW1mdmtHZ2V3ZEpTWlRxYXdUMjFHOW9UbmVKV0pXZGlLb2ljTXVFaHgwWExj?=
 =?utf-8?B?bjNsSzNlaEtlTWF3c0Q5ZWpDMlhwN2dicWp6VSs2R3B3L2RHOWZNMXBmZ08x?=
 =?utf-8?B?WW44ZFpINWYxZXZjMUh4YkRCZW5zaEhhc0RIdVgvQnhkZC9YeXNsYkRGaCtn?=
 =?utf-8?B?TGMzNTZ6Y3UrcTROZG55Vnp0WVREeFlnUzUrSjNtbTRIL25pSHF2bW1aVkE1?=
 =?utf-8?B?N042S3Z5MVF0K3p4WmwrWFJOVGpDU3VHdnFybWNHcmk2NHkvcWFMR2NOQnhw?=
 =?utf-8?B?di9DY2FCNkRGOUNxUk1qcit1K0xLbkhpbVRnMUNlY1RETlpJdWlpWWNBMG91?=
 =?utf-8?B?M2xmVEd3V2JHdkc4OHF2WE9YQWlNeTJ2ajFQakpMYnNqSlBmVzlESytNRVB0?=
 =?utf-8?B?OWlwVUs5ZlhYekZEOTlLVHJGUlNscC9DblVNRHI0QW5teE05Mm1ZdVpWNGI2?=
 =?utf-8?B?WTREWXc0NXBtMXAwMVZDRHdVbXNDWXlLS1J0RmZhaHFnWmtJUXFZeUQvRzBi?=
 =?utf-8?B?MDY1RjVOdnorUlFjbUJkdHpYZzFYUVdZckNHcXZMVzRDemYyTTQxam9yWDdI?=
 =?utf-8?B?bXEyVnVmd2d3RXFSdm9QaW94SHVFU3ZWS3c0c3VqY20rZkc3dUxobnV3dU1u?=
 =?utf-8?B?VE5tNk5OTXFzR054ejFNSWFFc0dycW9GMmJJZGZPaWtIV3RYY0g4VW1BUHMy?=
 =?utf-8?B?UGpUUFAzWklrWXdFMncwRGlmT3duaE82MWw0Tnh4SkRLL2VYWTNTUUsvZDl0?=
 =?utf-8?B?MC9hRkowaDlML055Q1ltWnhHbXJHU052TGRyREJwcnFNMGI0cWF0RnRXdjRX?=
 =?utf-8?B?SHcwSERTa1I2TXByUWVFTEREMDFjSWNaSThHZ2RRLzdvd1dSTGNsRkltRzB5?=
 =?utf-8?B?NUFrakJSelFrWmxJV1dKNjB1ZFBhaFJVQTAwd1M0c3dDN1N1RnM3dzRrc1pF?=
 =?utf-8?B?RGd6bWU4WE5FVUhiYmxCTW11MzhJc0JwNUc0bEdBalpDUGRqWEVkeFI3VzB4?=
 =?utf-8?B?eFdVaHk1ZFZDTXJsci8zZ2tQSmZub2VRVmpISU54R1hLVENGQ3R0dkdvL3hi?=
 =?utf-8?B?R0hSVHdHZWZ3L1ZiTmRRclFJNHVnaEZoaXFQTkUrZEg5WU0vVTdVdHRRTUFM?=
 =?utf-8?B?UFJZeWxBdG9MdFdXYzR4OEg1S2JZcnNOQ0hzUlIwaDRUWDk3Yys0bGZKTDRJ?=
 =?utf-8?B?eXFJRHlvc25KeVpBdm1DSUw2K2tJM3N6c0FCeDBMNXVrdHdOVzRjd1BnbFA0?=
 =?utf-8?B?MkN2cHFFUEd1SDJFMGYvbWQzK2s3cFZwTGVwbXQvZW9XZitCblBjSHdzS0lF?=
 =?utf-8?B?NkNtcUxBSnAzaUgyWlJEMlhwUm84QVJDL0krVlhKc3R0MjNQemlnd2FjaFJR?=
 =?utf-8?B?ZElKY2RVS2xkT0tncXA3b01TcEppcjVrR2ZNUXQ4dm1FNk5wL2pkbU5ia09z?=
 =?utf-8?B?U2c3VFFHS283b0w1Wkd4QUozYXZQMGNhS1U5OERtN3RDMkhxNUlpbFZYQlBI?=
 =?utf-8?B?Q0U5SHpuWFZDb1FuSE5ZZDl5OFQraG55b0xPZkZ3RmRsNUNGVXV6QVg5QkZ0?=
 =?utf-8?Q?mF4wFr?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(34020700016)(36860700013)(921020)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:53:49.6979 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afa45c00-5f65-40ef-fdf6-08de1b7fac39
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7315
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

On 10/30/25 10:13, Meghana Malladi wrote:
> Hi Paolo,
> 
> On 10/28/25 16:27, Paolo Abeni wrote:
>> On 10/23/25 11: 39 AM, Meghana Malladi wrote: > @@ -1200,6 +1218,109 
>> @@ static int emac_xdp_setup(struct prueth_emac *emac, struct 
>> netdev_bpf *bpf) > return 0; > } > > +static int 
>> prueth_xsk_pool_enable(struct prueth_emac *emac,
>> ZjQcmQRYFpfptBannerStart
>> This message was sent from outside of Texas Instruments.
>> Do not click links or open attachments unless you recognize the source 
>> of this email and know the content is safe.
>> Report Suspicious
>> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK! 
>> updqHb0lvOd6ACXFPDODXzFjW2RtkIpblpWr3zui2O2JqWTyRCLKc2i7Pa7uSMBZYpq8H7tTr-jp_nDelg_OUrmNCgZ8_m0$>
>> ZjQcmQRYFpfptBannerEnd
>>
>> On 10/23/25 11:39 AM, Meghana Malladi wrote:
>>> @@ -1200,6 +1218,109 @@ static int emac_xdp_setup(struct prueth_emac 
>>> *emac, struct netdev_bpf *bpf)
>>>      return 0;
>>>  }
>>>
>>> +static int prueth_xsk_pool_enable(struct prueth_emac *emac,
>>> +                  struct xsk_buff_pool *pool, u16 queue_id)
>>> +{
>>> +    struct prueth_rx_chn *rx_chn = &emac->rx_chns;
>>> +    u32 frame_size;
>>> +    int ret;
>>> +
>>> +    if (queue_id >= PRUETH_MAX_RX_FLOWS ||
>>> +        queue_id >= emac->tx_ch_num) {
>>> +        netdev_err(emac->ndev, "Invalid XSK queue ID %d\n", queue_id);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    frame_size = xsk_pool_get_rx_frame_size(pool);
>>> +    if (frame_size < PRUETH_MAX_PKT_SIZE)
>>> +        return -EOPNOTSUPP;
>>> +
>>> +    ret = xsk_pool_dma_map(pool, rx_chn->dma_dev, PRUETH_RX_DMA_ATTR);
>>> +    if (ret) {
>>> +        netdev_err(emac->ndev, "Failed to map XSK pool: %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    if (netif_running(emac->ndev)) {
>>> +        /* stop packets from wire for graceful teardown */
>>> +        ret = icssg_set_port_state(emac, ICSSG_EMAC_PORT_DISABLE);
>>> +        if (ret)
>>> +            return ret;
>>> +        prueth_destroy_rxq(emac);
>>> +    }
>>> +
>>> +    emac->xsk_qid = queue_id;
>>> +    prueth_set_xsk_pool(emac, queue_id);
>>> +
>>> +    if (netif_running(emac->ndev)) {
>>> +        ret = prueth_create_rxq(emac);
>>
>> It looks like this falls short of Jakub's request on v2:
>>
>> https://urldefense.com/v3/__https://lore.kernel.org/ 
>> netdev/20250903174847.5d8d1c9f@kernel.org/__;!!G3vK! 
>> TxEOF2PZA-2oagU7Gmq2PdyHrceI_sWFRSCMP2meOxVrs8eqStDUSTPi2kyzjva1rgUzQUtYbd9g$ <https://urldefense.com/v3/__https://lore.kernel.org/netdev/20250903174847.5d8d1c9f@kernel.org/__;!!G3vK!TxEOF2PZA-2oagU7Gmq2PdyHrceI_sWFRSCMP2meOxVrs8eqStDUSTPi2kyzjva1rgUzQUtYbd9g$>
>>
>> about not freeing the rx queue for reconfig.
>>
> 
> I tried honoring Jakub's comment to avoid freeing the rx memory wherever 
> necessary.
> 
> "In case of icssg driver, freeing the rx memory is necessary as the
> rx descriptor memory is owned by the cppi dma controller and can be
> mapped to a single memory model (pages/xdp buffers) at a given time.
> In order to remap it, the memory needs to be freed and reallocated."
> 

Just to make sure we are on the same page, does the above explanation 
make sense to you or do you want me to make any changes in this series 
for v5 ?

>> I think you should:
>> - stop the H/W from processing incoming packets,
>> - spool all the pending packets
>> - attach/detach the xsk_pool
>> - refill the ring
>> - re-enable the H/W
>>
> 
> Current implementation follows the same sequence:
> 1. Does a channel teardown -> stop incoming traffic
> 2. free the rx descriptors from free queue and completion queue -> spool 
> all pending packets/descriptors
> 3. attach/detach the xsk pool
> 4. allocate rx descriptors and fill the freeq after mapping them to the 
> correct memory buffers -> refill the ring
> 5. restart the NAPI - re-enable the H/W to recv the traffic
> 
> I am still working on skipping 2 and 4 steps but this will be a long 
> shot. Need to make sure all corner cases are getting covered. If this 
> approach looks doable without causing any regressions I might post it as 
> a followup patch later in the future.
> 
>> /P
>>
> 

thanks,
Meghana
