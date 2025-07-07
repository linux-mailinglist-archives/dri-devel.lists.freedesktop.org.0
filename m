Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CF2AFB41A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 15:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B93C10E2EF;
	Mon,  7 Jul 2025 13:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GnXTMEIn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD8510E2EF;
 Mon,  7 Jul 2025 13:14:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=psyiUuxg7InYUBdwUzTyGNE7HuiNjUF1tVlgcA5SwgH6+yP6ETHN9IB7F1vza1j2RVHLSSCEuFNTXP0Eq/NGYg1KzOUtxrB+fM3o0SQmuLPmF7MmmiOX8o/Xx1K8asVvEG1wqlxV8Rl/3ydLEnzsoXLwJG0O3r734q/fFqKeFI9OGm/JPnXEuTdV0GkfWuVcWFABMrpO2EwpXMoITHkN7WFobaCMYP7AKYsTv4zRWlX3oNzOuaUT8FiCFLn49nn6aV40IAwCTptuh5ULb2hhCtjpSSwD3GvXa/zQ3CHlZ9IKAAHv9QG6zJM+EZf/qKxPfASKwWBmMsevKn+thLpCLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atx8pNMMInjioVy8UnzGEp+CWOEmfQP/mlALUMglkEc=;
 b=qJaLm5T7VcH352X/RQ55b7LUx+NYVtvq8QInMN5EnIoclaMYglCSijmFElZt1BXfp9QdV2zQMxePD/Rct0rqjY1p1i9Ed+FkHosY81IYp9ETa1o+Z0H3yHDvee75lLLJCIe+GpXdc/vpEUujZWTC/WAXmS8Df4n36cHbBXxfjKQPd1FR/VW8X6XfPwrrc0RkMghKHHCOKds2gDz6XgOBWpvEPzwMDbwCjmwEvnfKBcArtEMU40YEfpL2MXypVj+1pX0LkaTN88ew0IKddBh4poRqoydjWCA09FkqhrgKisZ/aAkZTpQlE+UP35udbEFdgZMVX2tfw/9Ulgx98PvrjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atx8pNMMInjioVy8UnzGEp+CWOEmfQP/mlALUMglkEc=;
 b=GnXTMEInBk+4b7TSGbyExEZz8bcYLRc3xkdfphzy8K7UdLTIko9nfbaHB+v4B3vdFh+6x0by1qp/XHFbxLqfcQnvQVXfBSBBuqznwb3oQjajM0nXG8lyVjh8SPKAdZgbh/tqXm1h6v6xVL06lg0juB0MZopTbz3CR5mRzLjSJgU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7022.namprd12.prod.outlook.com (2603:10b6:806:261::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 13:14:14 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 13:14:14 +0000
Message-ID: <5f24f0e1-7d61-4a1a-bfea-b17fa7af4be1@amd.com>
Date: Mon, 7 Jul 2025 15:14:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: Take a breath during dma-fence-chain subtests
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>, intel-gfx@lists.freedesktop.org,
 chris.p.wilson@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250226155534.1099538-1-nitin.r.gote@intel.com>
 <Z8Bf9HRqOg7B3W79@ashyti-mobl2.lan>
 <76445047-a5e8-4590-8e61-5570bd051b13@amd.com>
 <2191571.OBFZWjSADL@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2191571.OBFZWjSADL@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7022:EE_
X-MS-Office365-Filtering-Correlation-Id: ba4eec61-f407-4071-4d1f-08ddbd582b6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmxaeEJCQUphTkVUbXUvUTNDYnlKWHJ1UnFuKzRDYjVxZktINHVpdGcvcXJs?=
 =?utf-8?B?TUw1ekhSTndRekMzc2E5YlJqNllkOVFTT0Q1TzgzRVFvVXMxR3BETFZwYytY?=
 =?utf-8?B?Y1M3SFZwQyt4NGV4TTVxWlRhZHpGMWU3LzdtTldyQ0xwZEE0Ulp4YURhZGky?=
 =?utf-8?B?cTdTcDR2eDRxMjNCeHJaRG9GZDVvWVZzaEd6SVNpTW5NSXZMeVpMRjY1bi93?=
 =?utf-8?B?VDJ3S0JjMFdsZ01FL3NTVGlQNkg5bkpWRkQvU3NpejRMUGxuY2M0cXhBenVD?=
 =?utf-8?B?enVVejI3ckc4SWJBR2VqaWJ1T0JrSzU4K2ZaL3czbFlGcGp5MHZwY3M4aWZ2?=
 =?utf-8?B?Z3UwUmxkd0YvRXR0c2VETVppc1JFWERUMTA2anI1a1A2Nnd0ZU03YW9CdlA2?=
 =?utf-8?B?RmVVcU5JOGVudS84djJsVUwvc295blBVMHV1STF4NW5MOGhFd3EvWGFvcmQw?=
 =?utf-8?B?eW80djNoanR0QjZoZ2U4ZURIZGNvODl3NUxnOW5mZDdKVDVBaFk0OGVyZ055?=
 =?utf-8?B?bDBXYStIM3o4cEk0R1g4cHZicDl0dXM5RW8wQVkvZFZMR3lnUldvb3VwRjk3?=
 =?utf-8?B?bmNjc2w4b1FMVDhmNE5TS1NpSkVpaCtPK3AzcElDeVp2R2llditVV200OEhy?=
 =?utf-8?B?RTdXRjUvSi80ZlNKd1JpTGlueUVMbi91clJVSzBFeW1odHNQbkJTeEdNY2Ux?=
 =?utf-8?B?eVl0NXVLTmdaWkZqS01Ua3NteGNBNG14L05lL2tvcWFpREd5M0toS1J1aUw3?=
 =?utf-8?B?Y1FJd1d0VWFFeGkwSUt5RXJKY2o4SEFpSWQ0VWhXMnhkanhjQkMwS3lBWDh6?=
 =?utf-8?B?bkhScnhneG90ZEcwc3E5QldUMnJqczZvUlh6c3RHaWh6aXJ5SE5Lc0svdGEy?=
 =?utf-8?B?b05yYmlUWW5wUW42dUxGV3FxVWtaakdsTmppZHd4eFo0TWNMMW82WHhYeUZD?=
 =?utf-8?B?UFdOT29BbHlVeU43SWJHcXUzVkM0eXRMbEtNaWdUSExRRUJOVEE5VlRJaWZB?=
 =?utf-8?B?SUUzenRXb01pVzlETG5lS2duYmlvaTRaRlNhUEFTNjcraXR4LzRrU0JqSHQv?=
 =?utf-8?B?aHR6bTRlUFgrZlVtWTJJY05KK2I3QkdnU21WS3RzMVIzS3FXVGgzMGpRakZF?=
 =?utf-8?B?cEorb0RaVVFaZ3R2SW8vUVVETGhSVGdmQXVNYmd6WEVadUxIYU41U2NvTVdw?=
 =?utf-8?B?OHhCMUF5VWVsOUNHRmJYUDJGNkFucGUzZCtZYWRmaEZZL29kMkQ0RG5Ya2Q1?=
 =?utf-8?B?TndKSWZXamhjaXk1bms2aFFjakZNV1g5UEQzVTc2NVdEMDBjeEF3M0ZVeVZo?=
 =?utf-8?B?MnBiMk03bm1VSTltS3JqNFhuWVRENzBUS3RSbDVsdS9ZL2RWclNteHl6TnBi?=
 =?utf-8?B?K2pDNWEzcHNWTUQ1V2dyd1NHVG1BbjdvQVgwRFRqZTBkZnNpSDdGdEJWY0FP?=
 =?utf-8?B?Q3phQzlKajMzdkJYUWZwZmR2ME44NjE0SDN6TExuVHJsS1VNRmZLSEZieXhW?=
 =?utf-8?B?ZlNlY2N3bHBnVzhqSlpoTGJtSngvVXNiRmdlZUJEYVlXWTNBL1dqdC95OUND?=
 =?utf-8?B?YjZZYndtSmxNWW9ydzk4Mm52djNpVVVqcmNCTDgyM3dpaHY3cnM0R0l4TUpZ?=
 =?utf-8?B?V1hKZ2xJL3cxU1g4UXh5b1BmaTQxb0JFZVR4a1NMN3FlaGpJM1RNYkVzblRq?=
 =?utf-8?B?aDc3OElCZEZsMktYNXR6akdYMnNxdTdRRXZ6N0QzUjJkWnA3VGlOTjk2S0dR?=
 =?utf-8?B?MlBxY1VaMzJUdDJlLzI1WHdjVktnMVBrdGsrelZ3UzhKZ2ZWb2JiZTl5Nlly?=
 =?utf-8?B?RHcyZ2FwUmNyZXlSbEFKM2hzNmttUFpFQ3BEaGFOWkZLV2JjKzF3T1JVdTdW?=
 =?utf-8?B?ZVREaktKM1loSEQ0Q0ZjNGtxcEJnMS90RVI1eml6SW9VekR5VlFsd3NZVWto?=
 =?utf-8?Q?fq9uP8LC6tw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3p3WGV6eXV6UTZNTlR3ZXh0VGZ6c3VpSFVkbHF2YStuQnVhajJia2RzQnd2?=
 =?utf-8?B?VkszcUVCVHhnK0QxSWFtdFZZbkMrUE5tWWd1TnJCZ3FJZUJZNDlCRll2c1pX?=
 =?utf-8?B?ZW9BeldZLzZvczdCUFlZczhTTU1hRUg2UTIwNnhlNlRDK0lWOWkycGlOK1RK?=
 =?utf-8?B?ZCtwcmVvWG1OZDJ6cmk1aldaOTdrbnhKM0haREd2S3JOQkVuemp3aDVaNlZv?=
 =?utf-8?B?UW5ralRHTTdGektaeFUxazIzdmp4elpLam5zeHlrc2dkNi9KNnVQKzBPVEd0?=
 =?utf-8?B?Mk10NnhwTFptejdJL2FHbm02VSsxMmVaMStJWnFQTDRjNEJYcTlNYitORktW?=
 =?utf-8?B?TzRaMUUzSGZtc0VxN3J5cXhkR3BmZzEzcDdDWVNsM1ZwSXZZZmZ2ZkRDVFY1?=
 =?utf-8?B?ZkJIcWlBVHZ4aVJldlplVWhhajk5clMyeEl6Y3ZLRVZ2SnNTUEV3eWxvNGN0?=
 =?utf-8?B?d2U2dWpGUnJmaVpqZTNkT2p5SWFxRzlxZk8vZUhmUmJiV0t4NWVQSktIYmdX?=
 =?utf-8?B?RkYyUHgzaUZVTGpZQXZ6OStiaGFxVVVBWGNCNzl2YkQ1eDN5UjA4VEdyZGVy?=
 =?utf-8?B?dlk2RkNCc2pqWkhNSGhtV2QraitUeVIwYm1CQWJFMWl0TndpK1oyWkdCd3A5?=
 =?utf-8?B?Y0lxbzh2VWczeG9nc1lSeUU3UXdmS0tlNGhOeDJDNmFYTkp4RHljalpER3FJ?=
 =?utf-8?B?OGRlYXNPcFJYbTQzNzh6VGNidTRwdXZnZ1V1QUJZWEN3KzhsTUU1RFdBcklk?=
 =?utf-8?B?ZHd4dmtSK3JTNFl1ZU1sV0NQakRrSTVnU0NOdnc2TitSTGZnNVM3WHdsUFlx?=
 =?utf-8?B?aS81WCtLa3ZoVHpYd29SL2YvWjJ2RTNiVU1jUnpNbENabExvUHZFd0NpdEgv?=
 =?utf-8?B?TFkzaWdGZjNWanhmZVRBeWxGOGFoRjBsdGJPd1l5SFZqZ3dkM0xsODhvQnhV?=
 =?utf-8?B?RXhkWWVZTU5SQkNIRkNtK091anAxRWZuU05tWkNlbHpZMk1mVUs0aDMvUDRi?=
 =?utf-8?B?ZXBEVzJ1bTJhNHowTDQwTXFmSWhHSGpwVlZDQjN6RFltVXU1Y1VpMjRWZ3RQ?=
 =?utf-8?B?eGJVeC8xVjVhcHJtRVUwM2NTZHZyY2dWdlVSTUFZa004Y0M0UVkyWmowZkNn?=
 =?utf-8?B?Tk5TbTh1VitqV3pUaEVOZzlReEJXaDAwaUNPbkZoeWdSN2xxbGJQdzhMNzhG?=
 =?utf-8?B?Q2FtdDlVS2JDRElpcUhTSDlZaUtyOEpiNTFJdmpmK1NqaC9pc0ZiakdTZVdm?=
 =?utf-8?B?QXRtUDhvZHlNVzFmR3FlMGMxWUZqc1FRUmRnVDNITDBTTzdKQmdZNmxkN2pp?=
 =?utf-8?B?dncrMVRZU3hTbWdSV0hwQnhLZDBrVkh1N285L1A2Z0lFMFhEc3ptOFBYTVow?=
 =?utf-8?B?TWg5ZFE2TXczb0FXN1lXcVhaRkZyK1poT3gxV1Z5TnVKdDBaSCtKTHB2ZGtZ?=
 =?utf-8?B?YWxHaFZKZ1RZZ2g1MC9reGFYODVYTmZkWWY5MlVEai9yb1VhVkJNMmh6Q2Jz?=
 =?utf-8?B?Y2ZEM21DRGNCR1QzZlQyZWx6cDB3bDJiQzBsUE5iMUN1QkVBTEY1Y0hzWVpn?=
 =?utf-8?B?UDB3MjBYREtxZXUwRkhhcko3NStIODZ4LzRHVVBPeFB5UWVUK0RJdlNBYndp?=
 =?utf-8?B?a3dJZTRmaFhnNXN4WW01VzFoZTBRSzFtQzZ5VmZ5VkdyM0JXUU04WSszVXpq?=
 =?utf-8?B?MTR4TUJJQkNqR1NlbXpWMFVSVlVTUEZ4OFduMVBXeGVteFQvSUxuWWVlS1ZT?=
 =?utf-8?B?RU9ybDhEMXNiQ1lxYkxCU0xsVGVsUE0vQnBldklYN0l1enB0RUxrOVQ5WnhJ?=
 =?utf-8?B?NWdGL3J1V2RZSndLdGQwWVA1eTdSYnZNdEdaR1hLVzR4VUdIQ1JqRU9Xdnk4?=
 =?utf-8?B?WXNVWGdRaFJ0MTZnd3ZaSVlMWktlQStheHNOYmVZdXFENWhENytKMjdKb2xu?=
 =?utf-8?B?YjhEeU5VV0tUSjg1ZU5obDJVeVhZOVNlSWxzWTlmL0wyTm8vM3ZxSGdmQjlI?=
 =?utf-8?B?YTFiYkRaWDN6VnBUZHBxb29jMHFvdzl0OEIrTnlvMHl2YW9ldno3M3Z5YjVV?=
 =?utf-8?B?VEhYRGM0WWJRQ1NZeHBDUFhpclRwck5wMlVxaWpxWkpnWmxBQlU3bVNEUm9Q?=
 =?utf-8?Q?0lz7B8PrwBmJQOGLdHIgDO76J?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba4eec61-f407-4071-4d1f-08ddbd582b6e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 13:14:14.1207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5tg2WHPXVw7amC9R1aHaMiN7yDiMf82AyvBqcHpLW6Ez0yP8kJRYXA6U9Qsjt3hp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7022
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

On 07.07.25 14:25, Janusz Krzysztofik wrote:
> Hi Christian,
> 
> I've taken over that old issue and have a few questions to you.

Thanks a lot for that, something really fishy seems to be going on here.

> On Thursday, 27 February 2025 15:11:39 CEST Christian König wrote:
...
>> Question is why is the test taking 26 (busy?) seconds to complete? That 
> sounds really long even for a very old CPU.
> 
> The failing test case operates on a dma fence chain built of 4096 dma fences.   
> Am I right that a single dma_fence_signal() call may result in up to 4096 
> levels of nested sub-calls to dma_fence_chain_cb()?

No, that could only happen if the test case is broken.

See the test is to make sure that we don't overflow the kernel stack with many elements when enable_signaling is called.

The callback is always only installed on the first unsignaled fence. So when the last fence is signaled the dma_fence_chain_cb function it is called exactly once, installs itself on the second to last fence, waits for that one to signal and so on.


What could be is that test case calls enable_signaling on each of the 4096 dma_fence_chain elements individually and so each of the elements registers a dma_fence_chain_cb function, but then the test case would be rather broken and should probably be fixed.

> The test case signals 
> each fence of the chain in a loop, starting from the last one.  Then,  
> dma_fence_chain_cb() is called 4096 * (4096 + 1) / 2 (an arithmetic series) ~= 
> 8.4 milion times, isn't it?

When the test case indeed enables signaling on all 4096 elements then yes.

> 
> On most powerful gen12 machines used in CI, that test case takes slightly less 
> than 3s, on low end few years old machines -- ~ 10s.  Should we be surprised 
> that it takes over 20s on the least powerful one (gen3 PineView Atom)?  And, 
> while reproducing the issue, I've never seen any unrecoverable deadlocks.  It 
> just takes time to complete the loop.
> 
> Does that address your doubts?

No, not really.

> Assuming the commit message will be extended and provide the above 
> explanation, I can still imagine a few ways of "fixing" that issue.  We can 
> just limit the chain length and still execute all those dma_fence_signal() 
> calls without taking a breath, but why?  Or we can somehow measure expected 
> processing speed before running the exercise and limit the chain size 
> accordingly at runtime, which in turn seems an overcomplication to me.  Or, we 
> can agree that there is no point in avoiding that process being potentially 
> swapped out from the CPU and take the approach proposed by Nitin, perhaps 
> limited to this particular problematic test case.  And, I can see 
> cond_resched() still used in recent patches.
> 
> Would any of those options be acceptable for you?

No, if the test case really does what you describe here then the test is just broken and should potentially be fixed instead.

There is no reason to test enabling signaling each of the element in a loop. So there should be something like 4096 calls to the dma_fence_chain_cb function each jumping to the next unsignaled fence and re-installing the callback.

Regards,
Christian.

> 
> Thanks,
> Janusz
> 
>>
>> Do we maybe have an udelay() here which should have been an usleep() or 
> similar?
>>
>> Regards,
>> Christian.
>>
>>>
>>> Andi
>>>
>>>> ---
>>>> Hi,
>>>>
>>>> For reviewer reference, adding here watchdog issue seen on old machines
>>>> during dma-fence-chain subtests testing. This log is retrieved from 
> device
>>>> pstore log while testing dam-buf@all-tests:
>>>>
>>>> dma-buf: Running dma_fence_chain
>>>> Panic#1 Part7
>>>> <6> sizeof(dma_fence_chain)=184
>>>> <6> dma-buf: Running dma_fence_chain/sanitycheck
>>>> <6> dma-buf: Running dma_fence_chain/find_seqno
>>>> <6> dma-buf: Running dma_fence_chain/find_signaled
>>>> <6> dma-buf: Running dma_fence_chain/find_out_of_order
>>>> <6> dma-buf: Running dma_fence_chain/find_gap
>>>> <6> dma-buf: Running dma_fence_chain/find_race
>>>> <6> Completed 4095 cycles
>>>> <6> dma-buf: Running dma_fence_chain/signal_forward
>>>> <6> dma-buf: Running dma_fence_chain/signal_backward
>>>> <6> dma-buf: Running dma_fence_chain/wait_forward
>>>> <6> dma-buf: Running dma_fence_chain/wait_backward
>>>> <0> watchdog: BUG: soft lockup - CPU#2 stuck for 26s! [dmabuf:2263]
>>>> Panic#1 Part6
>>>> <4> irq event stamp: 415735
>>>> <4> hardirqs last  enabled at (415734): [<ffffffff813d3a1b>] 
> handle_softirqs+0xab/0x4d0
>>>> <4> hardirqs last disabled at (415735): [<ffffffff827c7e31>] 
> sysvec_apic_timer_interrupt+0x11/0xc0
>>>> <4> softirqs last  enabled at (415728): [<ffffffff813d3f8f>] 
> __irq_exit_rcu+0x13f/0x160
>>>> <4> softirqs last disabled at (415733): [<ffffffff813d3f8f>] 
> __irq_exit_rcu+0x13f/0x160
>>>> <4> CPU: 2 UID: 0 PID: 2263 Comm: dmabuf Not tainted 6.14.0-rc2-drm-
> next_483-g7b91683e7de7+ #1
>>>> <4> Hardware name: Intel corporation NUC6CAYS/NUC6CAYB, BIOS 
> AYAPLCEL.86A.0056.2018.0926.1100 09/26/2018
>>>> <4> RIP: 0010:handle_softirqs+0xb1/0x4d0
>>>> <4> RSP: 0018:ffffc90000154f60 EFLAGS: 00000246
>>>> <4> RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
>>>> <4> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
>>>> <4> RBP: ffffc90000154fb8 R08: 0000000000000000 R09: 0000000000000000
>>>> <4> R10: 0000000000000000 R11: 0000000000000000 R12: 000000000000000a
>>>> <4> R13: 0000000000000200 R14: 0000000000000200 R15: 0000000000400100
>>>> <4> FS:  000077521c5cd940(0000) GS:ffff888277900000(0000) 
> knlGS:0000000000000000
>>>> Panic#1 Part5
>>>> <4> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>> <4> CR2: 00005dbfee8c00c4 CR3: 0000000133d38000 CR4: 00000000003526f0
>>>> <4> Call Trace:
>>>> <4>  <IRQ>
>>>> <4>  ? show_regs+0x6c/0x80
>>>> <4>  ? watchdog_timer_fn+0x247/0x2d0
>>>> <4>  ? __pfx_watchdog_timer_fn+0x10/0x10
>>>> <4>  ? __hrtimer_run_queues+0x1d0/0x420
>>>> <4>  ? hrtimer_interrupt+0x116/0x290
>>>> <4>  ? __sysvec_apic_timer_interrupt+0x70/0x1e0
>>>> <4>  ? sysvec_apic_timer_interrupt+0x47/0xc0
>>>> <4>  ? asm_sysvec_apic_timer_interrupt+0x1b/0x20
>>>> <4>  ? handle_softirqs+0xb1/0x4d0
>>>> <4>  __irq_exit_rcu+0x13f/0x160
>>>> <4>  irq_exit_rcu+0xe/0x20
>>>> <4>  sysvec_irq_work+0xa0/0xc0
>>>> <4>  </IRQ>
>>>> <4>  <TASK>
>>>> <4>  asm_sysvec_irq_work+0x1b/0x20
>>>> <4> RIP: 0010:_raw_spin_unlock_irqrestore+0x57/0x80
>>>> <4> RSP: 0018:ffffc9000292b8f0 EFLAGS: 00000246
>>>> <4> RAX: 0000000000000000 RBX: ffff88810f235480 RCX: 0000000000000000
>>>> <4> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
>>>> <4> RBP: ffffc9000292b900 R08: 0000000000000000 R09: 0000000000000000
>>>> <4> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000246
>>>> <4> R13: 0000000000000000 R14: 0000000000000246 R15: 000000000003828c
>>>> Panic#1 Part4
>>>> <4> dma_fence_signal+0x49/0xb0
>>>> <4> wait_backward+0xf8/0x140 [dmabuf_selftests]
>>>> <4> __subtests+0x75/0x1f0 [dmabuf_selftests]
>>>> <4> dma_fence_chain+0x94/0xe0 [dmabuf_selftests]
>>>> <4> st_init+0x6a/0xff0 [dmabuf_selftests]
>>>> <4> ? __pfx_st_init+0x10/0x10 [dmabuf_selftests]
>>>> <4> do_one_initcall+0x79/0x400
>>>> <4> do_init_module+0x97/0x2a0
>>>> <4> load_module+0x2c23/0x2f60
>>>> <4> init_module_from_file+0x97/0xe0
>>>> <4> ? init_module_from_file+0x97/0xe0
>>>> <4> idempotent_init_module+0x134/0x350
>>>> <4> __x64_sys_finit_module+0x77/0x100
>>>> <4> x64_sys_call+0x1f37/0x2650
>>>> <4> do_syscall_64+0x91/0x180
>>>> <4> ? trace_hardirqs_off+0x5d/0xe0
>>>> <4> ? syscall_exit_to_user_mode+0x95/0x260
>>>> <4> ? do_syscall_64+0x9d/0x180
>>>> <4> ? do_syscall_64+0x9d/0x180
>>>> <4> ? irqentry_exit+0x77/0xb0
>>>> <4> ? sysvec_apic_timer_interrupt+0x57/0xc0
>>>> <4> entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>>> <4> RIP: 0033:0x77521e72725d
>>>>
>>>>
>>>>  drivers/dma-buf/st-dma-fence-chain.c | 14 +++++++++++---
>>>>  1 file changed, 11 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-
> dma-fence-chain.c
>>>> index ed4b323886e4..328a66ed59e5 100644
>>>> --- a/drivers/dma-buf/st-dma-fence-chain.c
>>>> +++ b/drivers/dma-buf/st-dma-fence-chain.c
>>>> @@ -505,6 +505,7 @@ static int signal_forward(void *arg)
>>>>  
>>>>  	for (i = 0; i < fc.chain_length; i++) {
>>>>  		dma_fence_signal(fc.fences[i]);
>>>> +		cond_resched();
>>>>  
>>>>  		if (!dma_fence_is_signaled(fc.chains[i])) {
>>>>  			pr_err("chain[%d] not signaled!\n", i);
>>>> @@ -537,6 +538,7 @@ static int signal_backward(void *arg)
>>>>  
>>>>  	for (i = fc.chain_length; i--; ) {
>>>>  		dma_fence_signal(fc.fences[i]);
>>>> +		cond_resched();
>>>>  
>>>>  		if (i > 0 && dma_fence_is_signaled(fc.chains[i])) {
>>>>  			pr_err("chain[%d] is signaled!\n", i);
>>>> @@ -587,8 +589,10 @@ static int wait_forward(void *arg)
>>>>  	get_task_struct(tsk);
>>>>  	yield_to(tsk, true);
>>>>  
>>>> -	for (i = 0; i < fc.chain_length; i++)
>>>> +	for (i = 0; i < fc.chain_length; i++) {
>>>>  		dma_fence_signal(fc.fences[i]);
>>>> +		cond_resched();
>>>> +	}
>>>>  
>>>>  	err = kthread_stop_put(tsk);
>>>>  
>>>> @@ -616,8 +620,10 @@ static int wait_backward(void *arg)
>>>>  	get_task_struct(tsk);
>>>>  	yield_to(tsk, true);
>>>>  
>>>> -	for (i = fc.chain_length; i--; )
>>>> +	for (i = fc.chain_length; i--; ) {
>>>>  		dma_fence_signal(fc.fences[i]);
>>>> +		cond_resched();
>>>> +	}
>>>>  
>>>>  	err = kthread_stop_put(tsk);
>>>>  
>>>> @@ -663,8 +669,10 @@ static int wait_random(void *arg)
>>>>  	get_task_struct(tsk);
>>>>  	yield_to(tsk, true);
>>>>  
>>>> -	for (i = 0; i < fc.chain_length; i++)
>>>> +	for (i = 0; i < fc.chain_length; i++) {
>>>>  		dma_fence_signal(fc.fences[i]);
>>>> +		cond_resched();
>>>> +	}
>>>>  
>>>>  	err = kthread_stop_put(tsk);
>>>>  
>>
>>
> 
> 
> 
> 

