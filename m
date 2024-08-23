Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4F895C594
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 08:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6016510EB4F;
	Fri, 23 Aug 2024 06:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uzWMNuN5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC5510EB4F;
 Fri, 23 Aug 2024 06:37:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZXnksddkOHhlPhAw6W+3GtxZMDwv1BO0odsoRqd2ic79uXrNqOAPglZy4u9bXLTcEYqu+xgNMh1WA+HViFTUfiHwgVn5gQJYyNu2WjgaBDpyICxEq/6F7Bco8LiqANB5nvDuVv++142DCpqt8CpAKZio+P3FxBZNL7YZmC5npIgYI0e4zzMy0hH35iRHE2/pJFFdQz7i4DGt7MczuICKSneJa/aeiMlBqR6JgVdUKcfVpXsPwnKOn8Yn1NG6XCaldDDyAevPxKTNrPtnTtJOmeE3lj8BttbSqDbSEWij2itk44nJDijEVNyqCaeUv6TOh+v+nV8gacNSkpmc9Cd2Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wervN8UJv/bgoorqo6KgVws2qrm3OiNHAJ/NtmK7Gkg=;
 b=yCwdc9VkbMNfrdT/nTGTEQ/rSBgQ79rKcvqAEReoQscXkSV2usoxbOs7p7c58b7+6kCTh+2qpcgmPdRBw2ZipjCLhxUYbi6guEgMC/kvnjt125tUaFxUdbjOiaLzVbeCyicBQOzPmp8VtcJZbFe/JPY3bZIb5Yi8beEeqEDD4f0jLVq+XOwFZ01qLlStrbRbEoNOSyhmcTrgcx/giEz26fDvm/8B6peuDHlTLCfS8FHxKlgPZjUvF7n/MmNpN8868OtK1mV3ndHo+OT5W0NaCnKUpuXuyv2sf9Arl6ah1tPdDPQ+fOwyXcKYeULKxRw6Szm+xSy1FBBXWc4hdIymCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wervN8UJv/bgoorqo6KgVws2qrm3OiNHAJ/NtmK7Gkg=;
 b=uzWMNuN50HVRlAj4saTSxQvyY53guJOHPZVM9Wo/VsEFJ1HkmRUXsPZh4noGb+d2YMspItbvXy7u1/OLtxZEr4H+Maj2uMIiOQVE4kfSt7xnFzYXJcC3NBaECCSMNo6lHtbGrIgf2eXm4aHdzTDBRkTOOLNuLOmhbxhyYvGMZi0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB8191.namprd12.prod.outlook.com (2603:10b6:208:3f3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Fri, 23 Aug
 2024 06:37:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7875.019; Fri, 23 Aug 2024
 06:37:36 +0000
Message-ID: <f7fcb678-afb2-428e-abad-af9892823e60@amd.com>
Date: Fri, 23 Aug 2024 08:37:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dma-buf: Split out dma fence array create into
 alloc and arm functions
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org, daniel@ffwll.ch
References: <20240823045443.2132118-1-matthew.brost@intel.com>
 <20240823045443.2132118-2-matthew.brost@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240823045443.2132118-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0270.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB8191:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ae69936-90c0-49eb-e395-08dcc33e13b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVJqQkFKTFBXWk81VzdSTGRtRDJtZ0E4bGF2MTBoT3pDdmM5dDRKOC9qRUti?=
 =?utf-8?B?OHA3SU5CbTdWL2E1Y29XcEQ4ZXhTemVBdXMxMGhUSDNnKzNKa0pTMForMllD?=
 =?utf-8?B?Q1FKT0ltWDM2eUJVQmhxQU9FNHFUSXFPTjFyQ3RJejZMYnFGNXpqRWtiNStv?=
 =?utf-8?B?RVJab3Q4MGtFcDdiYlRGSDQvMmlxU0pXc0FIcnNqdGNqdTFqbkpBTzdiZXJl?=
 =?utf-8?B?UTN3L1ZrR09TTlU4OUIzeklSckNIS2JNeWV1ZVNzNktTWG9DNFBLV0dBSGNv?=
 =?utf-8?B?K0wwa1lYWE5GNktNMWlBMHkwelBRbWkzd2xZTUZwdDVZdlpQRXF0Zlp6K2Z6?=
 =?utf-8?B?OUY0YW1rYWo0TGFabDBQbjMrMGFNdkFtanJXVE9vS1hmak9INFF0aGtUODBq?=
 =?utf-8?B?TmRPUUpGUXhBazBnaTZWQjJEcWcrb1dJdGdrWUg5T3F2a1d5L1hhSmplQ0pI?=
 =?utf-8?B?RmJ0V2lVTnFzQXVYUWk2T1czMHRFWUVhWFNiOHVOa3FDRGJWNmluL253K3dS?=
 =?utf-8?B?bENnOEtGcFcwVVNjaGZFSFE1VUU1VE5iemtPdjIwOGN5eFdLODZMVTEyNlFM?=
 =?utf-8?B?RllIb1YrdVZOamdCdHFjRUhWL2huZFVVL0xBeHRzalRPL2hySm41UW0zTEFQ?=
 =?utf-8?B?cS9rZFBRUEZMdUtxY0lmWFowVm4xcWhBbFhyM2x4TTY2TXdlUHZwQzdDazNT?=
 =?utf-8?B?VSttTzdoZDdNTTN3S3pVMUFyRUovVUYyWm1WNXJqd0hXbXVjWWNaYTJRcjht?=
 =?utf-8?B?cEV5aVRnUUFibUZxd3V6RStucTVIa3RsMERjS2RIc0RiWm5sdmZVZXRFVWpt?=
 =?utf-8?B?N3RLZzY3VGZaVVh3QitxT2pXdHNWUXpUT2Z6U1Vxb1hTd0RFaVh1RjJyZFI2?=
 =?utf-8?B?b1NhaHB4d2tlUm9JRHVoOEV6NnNMMWU5WmdnMlZadXJhQnYyTVIzUFdHRm55?=
 =?utf-8?B?Q2prdHA3Nld5SDBQdkt5YjlkbGhDRFArOURYQ1NIa01YdGVIMk11OHRXMGZZ?=
 =?utf-8?B?NnhBTkZUQkl3L0lhQWV6djNzR2U3R1VhdGlSamlUM2VFUm5Eak9TaEhBYjlZ?=
 =?utf-8?B?MTE3SU1NeHk3QlhKK0dVb3hRcWtVNVZuMTAydndYL0NvL0piazcvS3RTbHVS?=
 =?utf-8?B?OVR1UHlDb0hSd05zcHZBUm8rRUtuRFlrTUVkdjNqYm9zSWNUTkFsenBqa3Bv?=
 =?utf-8?B?Y3pFVHJpOUR2REx1UGI4bEVYWHJ0YW9Tb0orMnZ6ajFaV1FjKy9CRkpSNGx0?=
 =?utf-8?B?UnhBeEtPUllIM2IxL0xkSStFUTQ0MW5VNndPQVlVclJOclVjN3RJa3o5OTVK?=
 =?utf-8?B?L1d3QzZJQ2FkQ2NhRlQ5WEloTVhkNXNBeSs1Mk56bUNYNzJRdlJLSDE4S0hR?=
 =?utf-8?B?UVViTERhbkdCVGh5cmZ3ejB3ZmhneCtYTzVHL3FORklzNncrUWtQd3dzaDds?=
 =?utf-8?B?NEtHTnRwSGI0djFFdWpRczJuMDJFYkJPRXBiVG5ua2tBczdHN2RkOU1hQzJF?=
 =?utf-8?B?dmkzY1VOa2hHbEcxQVVzUFdMUWJTTlNZOG9WTlE0SGFuN0JTM2lnWmlkMnBn?=
 =?utf-8?B?bnBPcXc4V1lKY1pwTGoydXBxYmRrSFZxdERTUmx6VFNoTG1uQWl3ZWo4eWhn?=
 =?utf-8?B?ZWZob05NbHZlYWJUbXVMMjgzankxeU5RR3ZvOEd1OEpvTWVvSmp4Ui85QWtU?=
 =?utf-8?B?OWwwcjY0UWF5R0EvSTFsaGxDOUQ4T1pCZnZZcU5CSkh2NXFSYlh5dHByRTU5?=
 =?utf-8?B?VHhnNm1icXcwazltQ2lOZkJMOVRhY3lVY1ZWOFdQb1lyZ3ZnQlFWS3JkWGRN?=
 =?utf-8?B?SFB2b2pWTHJBRVltak1QUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2FYOW1mOE15bEx3TmlDN25iRjMrb0lFTHEwSXlCanIzdXZFejdUQktaZjYw?=
 =?utf-8?B?WGdXN3hoMXI4L1NFcExacVRxaVdYaUU4Zk9xYkpnMXdyMFhsSE1QdE1uMi9F?=
 =?utf-8?B?WFNjS01vYTk4ZnVwV1lVWlZsMDM1R1dDck51OWdtbEFRQUdKVUxncUg1eld2?=
 =?utf-8?B?RW1SUkFwdFFnK2NpZ3pxdVVrbUxzRFJtQ0hEOUw0OEpoTW81ZFE0cVdTM3Ry?=
 =?utf-8?B?NnU3UDMvblZXbHhJOWc3bUpDR2RaMVE4UkxabEVzN1dpNC96Q0FUdEJhUFkv?=
 =?utf-8?B?MzN6OVphTXhoc1NUbDBiTDl4dHJheDFTak9tM2NBcUYvRHJrNHhGTG4wajRr?=
 =?utf-8?B?dHVOcEFzT01ReUFFdUJ4dElRV1F1dG1ST3JrS1hzYW5iVE1GRDFGNHZRLzdO?=
 =?utf-8?B?cTlLOGk0L2lWREFSeEE4My9rdUpLLzRWMzBsMDhPS25lNkQwM1JJYWFtTlE0?=
 =?utf-8?B?M0xhUHdUZmVlTS9IVUs5TWRpR1VkV1pLVVZuWnNkNjNTRzk3d0prMXQ4M2du?=
 =?utf-8?B?aWJkWkhSajNVU2Jva3lGZmV3dUh0M2lKNDd5REJLbkJ5T2FaTnJYclRsdUNh?=
 =?utf-8?B?WjVqWGNWT1lxbm4remlaUlI2T1ZoZXlnRTdpa01pTzlVTkM3TUZ2Uzd5dC9N?=
 =?utf-8?B?a1M5VTFoRnBTeUtUZGZIZTI2bnh2ZWlSeUpJM3hBM0Nwd21mNy83bEMrUlRY?=
 =?utf-8?B?UDFSTXRTTWRYcFF2TGxuMERZaXpIdlJIakVhZW1jQmtYTUN4TXFxOEFHWVVy?=
 =?utf-8?B?OXFwbzhrNUxvbWVCMFI2YlNkM1NjR3FjRmw2bXJucXFFUXRreXd6d3NheFhU?=
 =?utf-8?B?REpQcTJBZ0tQTG1DZTdIRnJTbzJPR1RXKzVQa1ZyamhHV25jTEdGdmx6TnhR?=
 =?utf-8?B?dXRYKzNvY3hQbjhZTlRycDg1aHB6NnVobG01S2ZVWTVPbFY2VVNhR2ZxcmZL?=
 =?utf-8?B?U0sxZWhGZ2VSRVZNQytXdC85L0FUZjlUUldjaWFFYzhiWFdRS0hvcjAxdFdj?=
 =?utf-8?B?NlFJOFVKaDlPSFE2czhqbThnN1k4akxrWU9kVVU0eWY0d1l1UzFsc1U5SklK?=
 =?utf-8?B?M29lWXNZMnhvcVFCK0RaNnJlRDBJR29rWEtwdllnQ3NqYlE1cDhUR0hWYkdq?=
 =?utf-8?B?MlZkaDVINkY0RXNPVDFPZldWamRXVUgxU3lneVh2TE1HWEppMnJXNFR5K2Zq?=
 =?utf-8?B?ZUJFcWZLRGpseGowTzJQZzdodlh1cTlIZVd6MklLN3BNSm1ZVlA3cDdsVStG?=
 =?utf-8?B?enNMa3hTWEVFRnVoZ0k5YkpPV3ZwV2V3N0NVNmJXRUYza0R6VFpqcFhtWlBX?=
 =?utf-8?B?OE9mZW5VaXZzMzJKOWJTbjVPMHJCR0xFbjRqNHkrclF4NmF6V2Y2SzJXRkxL?=
 =?utf-8?B?Y0FxYit4UU4vVUlwNUx3UFNsNkpQMk1xczV2bEgwYWZJajlRUWc1dE42MlVL?=
 =?utf-8?B?N01lUDE0Z01kRVlzUmRxdm4vTGlIbC9RamNnYmpSdkh1UGY3aVRwTVlJSFcz?=
 =?utf-8?B?bjFJcW4wbG9lWDlOWEx5NnJ4a0dhbGs0U2s1bjlmenlpNmk4ZjhlQmd6NXZ0?=
 =?utf-8?B?RXgzRm52bVNKWkFGVjE4UHU2aU85NjZsQWprNHhDd04wZkNVT1pZRmN3L3dH?=
 =?utf-8?B?YmtaWVJpU1RwKzVwVTUwU0xBSnlHQStlQnN0eFJFRzNxMVFjcld4SkVvcVZQ?=
 =?utf-8?B?OHRVb00zY2xnYlBnbXM3bkh6L3dJdUxnRFc1YjVYR05jbis3TEpKclRFNTlx?=
 =?utf-8?B?SDRRZVFwaGQwRW5RQlJ4UUxEbVBFU2ZwQ3dlT2hCY21NQXdjWjlDY1F0bllF?=
 =?utf-8?B?bVpaZlp6WGwwVnJ5QTVwOFZabWs0UUlFK0N0UUhJYnRkN0NVdEZRbTRFMkZQ?=
 =?utf-8?B?Qkg4UTUyK2NnTi9HWDJydzFpQm4rWlUxVy9PUzZTbEcrcVlOYnVqOUlwQU5s?=
 =?utf-8?B?OFRUWFNQODBhUWxzZXJ0Y2d6em5MemlIR3RlTWxTUDFmUmNueFZMVUtQMUZO?=
 =?utf-8?B?NjJVaHFSYmUreEFZUlZEUHo2N01waGNtSzg1ZitVUys5NFdGU1ptM0VnbjQ4?=
 =?utf-8?B?alM2ekVLbWlOelBxNVZUTFJxbGUvZlFaajU0VTRBY1Vtb1JqQ3NFbTczMHp0?=
 =?utf-8?Q?7GA4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae69936-90c0-49eb-e395-08dcc33e13b3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 06:37:36.8324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5rWq3Xs0y7Pzfii+IIcxYO0K8FJkKIqK5QCmYdyJH9R0leecmmYxcTXPbwZUHNF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8191
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

Am 23.08.24 um 06:54 schrieb Matthew Brost:
> Useful to preallocate dma fence array and then arm in path of reclaim or
> a dma fence.

Exactly that was rejected before because it allows to create circle 
dependencies.

You would need a really really good argument why that is necessary.

Regards,
Christian.

>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/dma-buf/dma-fence-array.c | 81 ++++++++++++++++++++++---------
>   include/linux/dma-fence-array.h   |  7 +++
>   2 files changed, 66 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index c74ac197d5fe..b03e0a87a5cd 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -144,36 +144,38 @@ const struct dma_fence_ops dma_fence_array_ops = {
>   EXPORT_SYMBOL(dma_fence_array_ops);
>   
>   /**
> - * dma_fence_array_create - Create a custom fence array
> + * dma_fence_array_alloc - Allocate a custom fence array
> + * @num_fences:		[in]	number of fences to add in the array
> + *
> + * Return dma fence array on success, NULL on failure
> + */
> +struct dma_fence_array *dma_fence_array_alloc(int num_fences)
> +{
> +	struct dma_fence_array *array;
> +
> +	return kzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
> +}
> +EXPORT_SYMBOL(dma_fence_array_alloc);
> +
> +/**
> + * dma_fence_array_arm - Arm a custom fence array
> + * @array:		[in]	dma fence array to arm
>    * @num_fences:		[in]	number of fences to add in the array
>    * @fences:		[in]	array containing the fences
>    * @context:		[in]	fence context to use
>    * @seqno:		[in]	sequence number to use
>    * @signal_on_any:	[in]	signal on any fence in the array
>    *
> - * Allocate a dma_fence_array object and initialize the base fence with
> - * dma_fence_init().
> - * In case of error it returns NULL.
> - *
> - * The caller should allocate the fences array with num_fences size
> - * and fill it with the fences it wants to add to the object. Ownership of this
> - * array is taken and dma_fence_put() is used on each fence on release.
> - *
> - * If @signal_on_any is true the fence array signals if any fence in the array
> - * signals, otherwise it signals when all fences in the array signal.
> + * Implementation of @dma_fence_array_create without allocation. Useful to arm a
> + * preallocated dma fence fence in the path of reclaim or dma fence signaling.
>    */
> -struct dma_fence_array *dma_fence_array_create(int num_fences,
> -					       struct dma_fence **fences,
> -					       u64 context, unsigned seqno,
> -					       bool signal_on_any)
> +void dma_fence_array_arm(struct dma_fence_array *array,
> +			 int num_fences,
> +			 struct dma_fence **fences,
> +			 u64 context, unsigned seqno,
> +			 bool signal_on_any)
>   {
> -	struct dma_fence_array *array;
> -
> -	WARN_ON(!num_fences || !fences);
> -
> -	array = kzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
> -	if (!array)
> -		return NULL;
> +	WARN_ON(!array || !num_fences || !fences);
>   
>   	array->num_fences = num_fences;
>   
> @@ -200,6 +202,41 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
>   	 */
>   	while (num_fences--)
>   		WARN_ON(dma_fence_is_container(fences[num_fences]));
> +}
> +EXPORT_SYMBOL(dma_fence_array_arm);
> +
> +/**
> + * dma_fence_array_create - Create a custom fence array
> + * @num_fences:		[in]	number of fences to add in the array
> + * @fences:		[in]	array containing the fences
> + * @context:		[in]	fence context to use
> + * @seqno:		[in]	sequence number to use
> + * @signal_on_any:	[in]	signal on any fence in the array
> + *
> + * Allocate a dma_fence_array object and initialize the base fence with
> + * dma_fence_init().
> + * In case of error it returns NULL.
> + *
> + * The caller should allocate the fences array with num_fences size
> + * and fill it with the fences it wants to add to the object. Ownership of this
> + * array is taken and dma_fence_put() is used on each fence on release.
> + *
> + * If @signal_on_any is true the fence array signals if any fence in the array
> + * signals, otherwise it signals when all fences in the array signal.
> + */
> +struct dma_fence_array *dma_fence_array_create(int num_fences,
> +					       struct dma_fence **fences,
> +					       u64 context, unsigned seqno,
> +					       bool signal_on_any)
> +{
> +	struct dma_fence_array *array;
> +
> +	array = dma_fence_array_alloc(num_fences);
> +	if (!array)
> +		return NULL;
> +
> +	dma_fence_array_arm(array, num_fences, fences,
> +			    context, seqno, signal_on_any);
>   
>   	return array;
>   }
> diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
> index 29c5650c1038..3466ffc4b803 100644
> --- a/include/linux/dma-fence-array.h
> +++ b/include/linux/dma-fence-array.h
> @@ -79,6 +79,13 @@ to_dma_fence_array(struct dma_fence *fence)
>   	for (index = 0, fence = dma_fence_array_first(head); fence;	\
>   	     ++(index), fence = dma_fence_array_next(head, index))
>   
> +struct dma_fence_array *dma_fence_array_alloc(int num_fences);
> +void dma_fence_array_arm(struct dma_fence_array *array,
> +			 int num_fences,
> +			 struct dma_fence **fences,
> +			 u64 context, unsigned seqno,
> +			 bool signal_on_any);
> +
>   struct dma_fence_array *dma_fence_array_create(int num_fences,
>   					       struct dma_fence **fences,
>   					       u64 context, unsigned seqno,

