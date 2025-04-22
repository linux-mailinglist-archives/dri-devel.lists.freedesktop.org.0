Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E979DA9613E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 10:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3BD210E07E;
	Tue, 22 Apr 2025 08:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ugv71S/j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24DF10E07E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 08:24:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VnjJ+YT/Ey1XbDPiQLNSvtihikkZAy5OUiARVpsOWm0R6LYM77JuBgUzc8MuzuZCYqne957HBsRyUYp20DBqX8vOVSKEcE9+Qh1ZtWdfYSae879GpD5qTz/ZY1tOCNwaE1oMwZwE/OjEHPr1Mx34QcVMiDuTyO95h+9ZKDAz0a9qXMD+AyLqGbr4dqY4cXhpeQ3fgF83QOGec7mAunJ1E/k2GIhCpfSLe4p3tOyLM+SdZNJwJv6S3/0WkdIkotY7gUGofgK9z+4X1aOuGC9WJr+T8SFiVayp9U0iAHqbqNGENBPbD9dspOQJb3kyZJf4v8gOFpSCr5M0Z826hkjBZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGIfBsoBmTE35RvPCoxDuaKU5iOM51w+3iI61XMIWjY=;
 b=QBxwpg+NeOLYXDnBisnc4tAICSsG6lKgsliqaFVuwlLnKshHVQ60ZH1Ae9paqCuPog6JNU8mo4TGnFfjcD1d+f6LfQ/5eLN1XAJOWZ+Vw/INCZNUfO96sKR4qSitpcqLtu5BBEuDMEV6frh7LZm/CHp0Z2fXASWU8juSI2ysMnNAa3YIF6bF9BPmIuRd6godWTU5EOp6TPpHs53HCYrJMH1I+z0Z3lfGU5tRGM6encvNJKR4GQ6fVlwO+rj8ToN9iHNiBb8wORA5KDNKtrzg5qIFsVKWtvSZ+0W4lfB0Bkxj7m6xT1LBuE84e5uQRaJ9rZTPCkKne3w3FoVygvgHmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGIfBsoBmTE35RvPCoxDuaKU5iOM51w+3iI61XMIWjY=;
 b=ugv71S/jzqV6/s7jj5fxbX14kL5ly0pMu9ItosfhatpFI7JViWShL23C7b+2n9IUH/5AsP5v3nGhqFKBQ+XQer+43cINKJCs2Kass9qgirUmAPixfn7JoWJTSvQbbZcUj3iswETmGNfMkYvmdAxoiKUQDM+SkSe5TlGztEIw5W0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6576.namprd12.prod.outlook.com (2603:10b6:930:40::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Tue, 22 Apr
 2025 08:24:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.8655.025; Tue, 22 Apr 2025
 08:24:53 +0000
Message-ID: <a4f72149-70a0-4bbe-bdcc-70384c152f83@amd.com>
Date: Tue, 22 Apr 2025 10:24:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: system_heap: No separate allocation for
 attachment sg_tables
To: "T.J. Mercier" <tjmercier@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20250417180943.1559755-1-tjmercier@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250417180943.1559755-1-tjmercier@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0206.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6576:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cbdf9a4-ea69-48b9-d909-08dd81772845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUhCb3pMd3BNTXFKMDV0eUg2OXhVZzFHbmRNSHJuWkkxdEc5dnlKQ0liWmE4?=
 =?utf-8?B?R1VXWTNCVTd1SnY0UUVZYUoxVVBCMnZXaDljWkw2enJ3b3dqRVo3QlZMRVlj?=
 =?utf-8?B?L1pLZEVrbHBFV0FUVGxSL1JleUROV25KdDFpOThZbDlYbEozNzQweU5XemNs?=
 =?utf-8?B?eitzNWNCUnJ5aWxwQk5TVUQ2UkhhRHpKWGRkSk1zbmZMcVQ0ZDlLSGxOZ2dq?=
 =?utf-8?B?b2F3MUVBTDJXYjRHbDlNRmYzVUdhYWFEbk5jNzVlYTROdnFNNmxzK1ptSE5s?=
 =?utf-8?B?cktNRzlnei9xSTdDNW9nWUhkL3ZVSStYZ0lKSTZHZERpdTA3OE5wclZZakZR?=
 =?utf-8?B?Tld0blhPMHVUVFlwOEljSmpXUGRTc3Zkc2NUS2xsVTF2OVdGU3BsWG8yc3pZ?=
 =?utf-8?B?aVYzMEFOQUNOVmlEeWhSZmpPQUZET0lMRHVoclAva3E3YzZqd3IvR3hxNytH?=
 =?utf-8?B?YjQ4bElJWEtXT3o0MmJUYXVoblYwbkVGNFZVR3BkTTRnaHF3aXJlNTNMalFh?=
 =?utf-8?B?NmlFKzk4WUVYazNMMXlTWTNvYm9EQi9GUjRzTE03bUZKR1V0WGR6d29EaEQ1?=
 =?utf-8?B?ZnpmRGYrWjZsbWZZODNoR3RzZVpMUW1BbW84WTRnUGt6QUkzc0NvZmtBMks2?=
 =?utf-8?B?VlJWb2VCYkErTFd1N3Uycm0zZ0VVU0ZmRzVtWVFyRElOeEZtYjBxemg2Z3M4?=
 =?utf-8?B?Vm4vRndPT3pDZ3l2WEkwdExMcU1jR1BjSkhTNU5BcDdjT1hYTUZCVmZxVTB4?=
 =?utf-8?B?dDlNanRya3NtL2RyRHhYT3pNcU9tTld6K2QxVjZWYk0wU1djS3Q0YndpZXFk?=
 =?utf-8?B?T3gvTHNnQmNkaVZ5VEIwZGd6eHFlc2wyanhuaHBtK1J1RkVObXZJMks0S2Jv?=
 =?utf-8?B?eWdRN2plcTNWeEFTR0tSS1VoQXVXVTZNb1ZXZkZjN3BtM2VzRUdFMDhIOGRO?=
 =?utf-8?B?UVpsQmNLeDBzbGRqcXlET3pUOUFLTmgvU1BYT083dlF2WDg1ZHBwU1RZVUJD?=
 =?utf-8?B?N2YyRGp0TkhZaWlTeWNpNlJyZlRQQ1ZiWmRaTnhjZmdBY0w1dzdiYnNOQWJu?=
 =?utf-8?B?czRKVmdEdmwzQWdGQTRKTWp1VFZRUjlwR1JtK0hncWJzT3Y4dWJkbTNNeUh6?=
 =?utf-8?B?Z0I5bVJLUS91czFTTU9zY2owZXh0NVJxZjJyYmVGZGpGSXQrZ3UyR1pMMmts?=
 =?utf-8?B?QVNtTHpJM0xGMTlTNDU4bFdHRUMyNEhBTDByNkdvaGlyZUp3cW95MUZaeVRZ?=
 =?utf-8?B?U0d3UTZDREp5Y1o3YkVaRTdDOVQ0aE9pbGwySmdIako0M1EvYTFMbnZCTjgz?=
 =?utf-8?B?VnAzU01LajdjR1Z2QngwOG1TSEU5NmJHRUVpdSs2cFFSUHI5T2dISTNOd3dr?=
 =?utf-8?B?Y2FtU1FHQWlTVlNuM2Y3WHl5WmFmdEo2U1B1YkhySnFVQVVPZFl5MWg3Zk41?=
 =?utf-8?B?TldvUU9vUXZqZG4xUndXQ2ZsVjZuYmQ3Q0tPRFhOZjBYMTlpcldkc1hxeXZH?=
 =?utf-8?B?RngzTEErWnd6YVFYU2FIS3pmK3lmRTdSdlNYYkhUY3hLRm1lNkU5M1VPVUFa?=
 =?utf-8?B?bkR6Nm42TmdMZVFOZ0x0TVFIbC9wTjRaQTVickFDWTVEWDh6Q1ptbkdMTmM1?=
 =?utf-8?B?WWo2SzBTdFRHSkNqMmtCbmZMeEU4VFVyUVN4QzRTYXVWeldJb1M0SVQvZzlG?=
 =?utf-8?B?Q2h6OW9UdmZzbTJzbU9CdDNZcUtTRHBsN29ScWpkNEpQOEs3V0ZJci9xdlFY?=
 =?utf-8?B?eExLNXBma2tUYmVwb3Z0MXh6ajdocENidzUyS0xrcWFNenZSem5SdWpCYTRC?=
 =?utf-8?B?SS8xdjczdytTTmFOY0RvOEI0dlFMRDBzMWpPR1RUalplellDZEJYaC96U2lW?=
 =?utf-8?B?d2NZd0ZJL1dPMzcwMXo1L01xRThRV2VKV2NBWVRXdjRqWEtwU29yc1ZTZ2w2?=
 =?utf-8?Q?2TAdnz/rqC8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmFjeE1oSjdEOHBHNkNPQTRNcUUwNW9yRW12VCtsVU9Scmp6TFAxcEtJdWZn?=
 =?utf-8?B?ck5sZGJ4SFNOdHphMUFsNW9hRUllUjFMcUp2d3dDb0ROcEJURDBWMG11ak16?=
 =?utf-8?B?TC9jeUZnWnRlaXBFb1EwUGlWSlpMeHg5ZXIyMGFhQjZnMzZlclVUYTA4cVF6?=
 =?utf-8?B?V0VzZ3gzZ2JaVEk5S2c0S0h6bHcxdUI5OGxPMTdlQUxsR3lJN2FDRkZHQ0c3?=
 =?utf-8?B?cGNRdzh0Wnoxdi9XOStlblg4QlltaStGbHVFR0RldERsZDFNL2c3R095NXpP?=
 =?utf-8?B?VFVhNXd1YjRMb25TYUdHUWJCQnZ0elgwNVdYalVQbFlDc3cyU3ovSlhJaVdl?=
 =?utf-8?B?SUs4OFNnWUpaYmZQVi95UnFPMVFsdlRGM3I0bjdSUFVvV2JDQXB4VTFTb3cw?=
 =?utf-8?B?cTgySlhuMWZ5MjVCRnlaa2VneUd1WmxZQk9ad1Q5bGpaa08vS3BxeldxLzB0?=
 =?utf-8?B?bWlXdk9ROE53UjcyU3laZ2xlMU14YnR5Yld0V1AxQzFRVlpGZWRnMWJsOUI0?=
 =?utf-8?B?T2ZwWGJubFVidm1scDhDcU9zNDVxa054MzlHbm9hQjhRRlBBSDlHdXA1UHZP?=
 =?utf-8?B?ZHgyQU9FaERIcnp1L3VodUE4dlMyN09zbldCRnFxc2xpR0J1QXhUbDE5Z1Yr?=
 =?utf-8?B?MGNVcndFVHFGMFBFMHhtMWZmL0Y5QisrK1d5U0xNSDE3Z1BsN1ZGc1cxMm1F?=
 =?utf-8?B?R3JzRUJINk1EcWp1Yk8ycWFXS2d0U0VIM2pmYTM0bDJZamUvYUMvWTExUC9Q?=
 =?utf-8?B?dlFGNnFpaW5FaTZOMHBPQ3l3SzRtQXFIc2RFNEhnamxBSkVoVW1XT0srTFQz?=
 =?utf-8?B?V0pDamZnUVUxQ2JWVlY5cnFZOGh2TW03NThHdk53cG5UQjhMNUVqaWJjVmd3?=
 =?utf-8?B?cXczNDlhUDR1eFJWek12Nmw1bEY1ZmpmdG5ZcVNsTDI4SDVjQml4Z2JrTzlu?=
 =?utf-8?B?OGZxRlJEaVpFYytFSmpPaERJaEU4bGRoc3haSmtPOG82dW5ra3BiOVEzNzZy?=
 =?utf-8?B?SWp5S25CR2I2RC9FN3c0MHl0QWZDdFBoUVUrVDc5U2NNK3RuRkxNT3JwWlp3?=
 =?utf-8?B?WWorVFlxR2V5cERxd3VibzBFeFpXdkRrSWRmY1Z0TjJ4WWRrT0JWTndnclFm?=
 =?utf-8?B?ZU9QTWxCZXp0YVVkK1JOUk9CakduZGtRQWhZZmIzOFA1bkpLZXJzVGpGVGE2?=
 =?utf-8?B?S3pubVRYUzNDVUFTR0o5bmpuL2pheUpWN1FQa2dIWk5GeU93a09jZFNjaXhG?=
 =?utf-8?B?RjBhOG56alVPZEtvMkNEdzlYdUdaVm8zSXV6UWVRTThKMHZTRVpVSVVaMGdG?=
 =?utf-8?B?TkM4UWUycERRSXl2TkwxbWhBWUNFaXZESTJzV3dkY1hMQW1GMVpMZFFSa2R6?=
 =?utf-8?B?d3pHV3ViK0dlc2ZPaStPc3BjeVlaOGkweElQZkpFNW54eFZ2NGhjTjNma1dF?=
 =?utf-8?B?Z1RXL3ZRTmdwbVdHVE1uNWplYk9mWVdnb2JSUnc5dkxRd3IzdE40OUt2SE5k?=
 =?utf-8?B?TzJvSU9RZVlGL2xjRnJUUW9VSnArcDM1TGJkbStYYmpHVUFhNVRxazdFclJ3?=
 =?utf-8?B?YUcxUzJNbk5wak11T2VxeWNJSVZFSXpsNkdnWVVQY3Q0YzBSb3huc0ZiZU1B?=
 =?utf-8?B?czRLRWdjZERrV1RZOXhBN3NkZEdlOXk4MSt3SHdJK0pDL0hnekluZkxldjVR?=
 =?utf-8?B?QlQ0aE1uTjJtSmlTcWxObU1nQ0IrZlNKVUtXTjF6Y28vNHVLcnhHeVZRcG9E?=
 =?utf-8?B?cXBjU1g1TnVXT2FoVlJ3bXBTRURpeUluTmdxRXZBRnluZEVkYXYzcldWMnZD?=
 =?utf-8?B?UDBMNjRMMW0yWXZTU1pDcncwbmN0c05LOXBBTVpmV1dKY2drVE5idkhDTmxE?=
 =?utf-8?B?UDJlcGJNbWVsTEo4aHJIV0h4R2haSjFMcFJpakxGbFJrRmlJUUFRMGxYM3RW?=
 =?utf-8?B?RmhtT0pmTzE3bFNScSs0UjRSTHlqanZhRjEwUCtsRnRxUDAzWjVoeTBWMHBo?=
 =?utf-8?B?UExTak54YjdhRHRET3E1anpGcEtUbVZYek1ldGx1ZFk0T3JNR2J0ZC9oTW9n?=
 =?utf-8?B?ZDFraUtqS3pFYjJWUFJkUnpyVFVaYnVCdkRydTlKS1lwcnFOOVBrNGU3bFhG?=
 =?utf-8?Q?9RCtbJaQdPoEzPPF5W1xNSkqh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cbdf9a4-ea69-48b9-d909-08dd81772845
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 08:24:53.6090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5Rn4J4rMn0/brI9iDZKRvpriH3gBgBnclQUnHC4WvFMtIALAnb0yCJlIdisL713
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6576
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

Am 17.04.25 um 20:09 schrieb T.J. Mercier:
> struct dma_heap_attachment is a separate allocation from the struct
> sg_table it contains, but there is no reason for this. Let's use the
> slab allocator just once instead of twice for dma_heap_attachment.
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>

I'm not *that* expert for this code, but looks totally reasonable to me.

Reviewed-by: Christian König <christian.koenig@amd.com>

Let me know if I should push that to drm-misc-next.

Regards,
Christian.

> ---
>  drivers/dma-buf/heaps/system_heap.c | 43 ++++++++++++-----------------
>  1 file changed, 17 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 26d5dc89ea16..bee10c400cf0 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -35,7 +35,7 @@ struct system_heap_buffer {
>  
>  struct dma_heap_attachment {
>  	struct device *dev;
> -	struct sg_table *table;
> +	struct sg_table table;
>  	struct list_head list;
>  	bool mapped;
>  };
> @@ -54,29 +54,22 @@ static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
>  static const unsigned int orders[] = {8, 4, 0};
>  #define NUM_ORDERS ARRAY_SIZE(orders)
>  
> -static struct sg_table *dup_sg_table(struct sg_table *table)
> +static int dup_sg_table(struct sg_table *from, struct sg_table *to)
>  {
> -	struct sg_table *new_table;
> -	int ret, i;
>  	struct scatterlist *sg, *new_sg;
> +	int ret, i;
>  
> -	new_table = kzalloc(sizeof(*new_table), GFP_KERNEL);
> -	if (!new_table)
> -		return ERR_PTR(-ENOMEM);
> -
> -	ret = sg_alloc_table(new_table, table->orig_nents, GFP_KERNEL);
> -	if (ret) {
> -		kfree(new_table);
> -		return ERR_PTR(-ENOMEM);
> -	}
> +	ret = sg_alloc_table(to, from->orig_nents, GFP_KERNEL);
> +	if (ret)
> +		return ret;
>  
> -	new_sg = new_table->sgl;
> -	for_each_sgtable_sg(table, sg, i) {
> +	new_sg = to->sgl;
> +	for_each_sgtable_sg(from, sg, i) {
>  		sg_set_page(new_sg, sg_page(sg), sg->length, sg->offset);
>  		new_sg = sg_next(new_sg);
>  	}
>  
> -	return new_table;
> +	return 0;
>  }
>  
>  static int system_heap_attach(struct dma_buf *dmabuf,
> @@ -84,19 +77,18 @@ static int system_heap_attach(struct dma_buf *dmabuf,
>  {
>  	struct system_heap_buffer *buffer = dmabuf->priv;
>  	struct dma_heap_attachment *a;
> -	struct sg_table *table;
> +	int ret;
>  
>  	a = kzalloc(sizeof(*a), GFP_KERNEL);
>  	if (!a)
>  		return -ENOMEM;
>  
> -	table = dup_sg_table(&buffer->sg_table);
> -	if (IS_ERR(table)) {
> +	ret = dup_sg_table(&buffer->sg_table, &a->table);
> +	if (ret) {
>  		kfree(a);
> -		return -ENOMEM;
> +		return ret;
>  	}
>  
> -	a->table = table;
>  	a->dev = attachment->dev;
>  	INIT_LIST_HEAD(&a->list);
>  	a->mapped = false;
> @@ -120,8 +112,7 @@ static void system_heap_detach(struct dma_buf *dmabuf,
>  	list_del(&a->list);
>  	mutex_unlock(&buffer->lock);
>  
> -	sg_free_table(a->table);
> -	kfree(a->table);
> +	sg_free_table(&a->table);
>  	kfree(a);
>  }
>  
> @@ -129,7 +120,7 @@ static struct sg_table *system_heap_map_dma_buf(struct dma_buf_attachment *attac
>  						enum dma_data_direction direction)
>  {
>  	struct dma_heap_attachment *a = attachment->priv;
> -	struct sg_table *table = a->table;
> +	struct sg_table *table = &a->table;
>  	int ret;
>  
>  	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
> @@ -164,7 +155,7 @@ static int system_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
>  	list_for_each_entry(a, &buffer->attachments, list) {
>  		if (!a->mapped)
>  			continue;
> -		dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
> +		dma_sync_sgtable_for_cpu(a->dev, &a->table, direction);
>  	}
>  	mutex_unlock(&buffer->lock);
>  
> @@ -185,7 +176,7 @@ static int system_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
>  	list_for_each_entry(a, &buffer->attachments, list) {
>  		if (!a->mapped)
>  			continue;
> -		dma_sync_sgtable_for_device(a->dev, a->table, direction);
> +		dma_sync_sgtable_for_device(a->dev, &a->table, direction);
>  	}
>  	mutex_unlock(&buffer->lock);
>  
>
> base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444

