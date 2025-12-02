Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADBBC9B5D7
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 12:51:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4DB10E634;
	Tue,  2 Dec 2025 11:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="A3ug4RSc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010045.outbound.protection.outlook.com [52.101.85.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E604F10E633;
 Tue,  2 Dec 2025 11:51:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZmHmFhP/DrXW6HegeYRyNc1CfbCqxNyjof8zdOI7LvkCYbPBUraN+LxAwsfG3jPiPezWVHuNZCbveeHqcunZcA+LMRyjq8/RJWIA1QXliSQhC6f373DGo/222ABt1fkjJX6Qs8etQHQ6z0u/nvk68MH3AwrLAwkgvrm4RHBTk4u3HKhrlEEvivf7BvlU0THq6qHkOI7owzibHcY6YrwuinBOJEC+oZO86vrJYsby1kThQrsZcUoBQj5E976NJkoHc9RSIQoL8oP6zBS2gZsZuIpGYGBAxF0sYGd0fbBYXmrc3ecS454pVoo2VwoRMBIrTqF1r5/Ut6/5+qEsmeuaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKUGpcCtKIc8rAPCgm5xg3x+RaQUwH5/NKTX83mwGls=;
 b=rtFwc2RDj0RORvs7TQMXHEFcZjNUmLOymb8ufnjnDDJirlK30JzXMXrzVl9uzbuToENJPLS7kKAvc8ZBGqMv0KVTKL8nU+x8DMuysYByfxAS11cLYGCzwfrNhC7Z66jFF3qokkEqT7gKh7p8b730v2Q0Ccx6Xv6pGx9xDEDgf0O2o6v7euaJRGJ0X8XepL0mg/rXXfJdqhzbfldF2VylDppF6NBwN0TL/hpUHbaOHQRLqOkjIHrROVDeK9kIi4xBHlcCLoY3fw1SMykBCKsbG5/50qXzC59NhF73CMYGV0oRmqUlKIP0pVpDkT0Qb5Hn9bag5vfJjU9JeXasZk87KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKUGpcCtKIc8rAPCgm5xg3x+RaQUwH5/NKTX83mwGls=;
 b=A3ug4RScVUKZybufMfUa6I2kb7i0ZLrwFaph7MPMr+1MmjnW8l4Mp/YwbruA8dushBDvDBhqKjuwWFdl6zdfYQH3gQx9jKegkq6zwL33M7/sdPPkhXoI+imEJzSM+KsDkYO7YCkDj+/zN7CS+HuTb9nMdcT8AKjmsmTSAwEIac8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB9007.namprd12.prod.outlook.com (2603:10b6:a03:541::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 11:51:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 11:51:25 +0000
Message-ID: <c0075907-44ab-4797-b710-70d974b3db76@amd.com>
Date: Tue, 2 Dec 2025 12:51:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/13] drm/amdgpu: add missing lock in
 amdgpu_benchmark_do_move
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251202094738.15614-1-pierre-eric.pelloux-prayer@amd.com>
 <20251202094738.15614-9-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251202094738.15614-9-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::19) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB9007:EE_
X-MS-Office365-Filtering-Correlation-Id: e1fa6740-1b6b-499d-d068-08de31991ea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjA3ZSt1dTN0VGZSVERqWVRrcWZJUEsrcTVyTzJqWTB3MGoxWHZadEc1WEd3?=
 =?utf-8?B?QzNnL2pUdjJYczNXVHRDVGZtbGw5ZDRrbGdkVEpBbnM2OGFBbGhlZEh1Qllx?=
 =?utf-8?B?WnZvMCtQajJ2eEpLWDYweDFtRk5jVDRLSGZIQmt6N2RlSHR4ZlhEOGJRdVFD?=
 =?utf-8?B?UzFIbnRuRU82dDVxZUozR1ZGQmNpV01kR2lIMWp4L2U0aUZRclBHZ1Q0b3Zx?=
 =?utf-8?B?Y2RvditzTTRBa2V4MWJ0c294Vmk5STN6Z2lQZWJvSEtsb2xwZnlyVUQ2dktZ?=
 =?utf-8?B?TCtiSVlFQUNxTGFSdTVuUDR1T3RURFh6MFhoOFdMc2JwRmFtMUY3cnpPSXlq?=
 =?utf-8?B?ZDBDQzZxeEJlMlVtSldaa2tSeTB5cThDaUViQ3J5andZVWFQRE9ES2RzWUhK?=
 =?utf-8?B?bmZPZEZNY0JVZmkyL0kxbmZYMmV2WkZoZlJsQ2Jydkg2STVVa3RCOXVadjVr?=
 =?utf-8?B?YTJNNS9qYXY5RjhUZ2RleU9WZ2ZIOFZOcVVhMlU0TlE5VGVadFBERFhVeUhU?=
 =?utf-8?B?dHh3bE1UZnl6c2lHd3c3R1J3ZzB0Y2s5ZTBEcWhaN3IrbFB0V1h1VTkyVTU4?=
 =?utf-8?B?S3NBajIvRmJyNUpxM0FPWEV3V1VJRWE4d05kMjYxcWFPYkJQVHhvTXpXWmRT?=
 =?utf-8?B?LzB1WUJna3ViSVlXNVkzSHNKZHprd1VjeEZXK3VDbkxxWGFmZVNqSHVZQkVM?=
 =?utf-8?B?MUltZVI3NmZmZGFGbmNDMndHekFhQTNyODArOTRUeEVpcWd0WFpYcWtsdTFx?=
 =?utf-8?B?RkFaNitVZFlsckNnYmVPU3ZsbFBTWW9FVW84clZCdi9DaXAyN05CcjRkTXA3?=
 =?utf-8?B?b0REWFFONzVia3NUdElaeXVKTEl5L3ByRDYvY1Z4MFYybm9lWjY3MUhGaDBy?=
 =?utf-8?B?MmpxWUdqbTBpVlpvODVMbEFVd2FRS1FzN0xaNmVCMEtyTTNWT3dodlBFaXNB?=
 =?utf-8?B?UUhXVDA0bERmWTBmTndCRCt6cUlsVktza1RtbTJVbnN3aVV3ZFZ1bkJEbGtC?=
 =?utf-8?B?bjljS2s4Q0RhMllOWHVyd2pnN1lOaGhHQ0V3SHZEZnFnZlhxN3VIcGNGd2dI?=
 =?utf-8?B?NTg1VUNGOFJ1WHpuMWtPclJWZHJ1YThhc2dHMEpRdFpKWTkzV3E3OHp4Smkw?=
 =?utf-8?B?cGF4ZlQvbWs2M0lnalk1ZnFUM29jY2YvTkh2VnBTM0NtVlJ6UmVoWWhTRUZ4?=
 =?utf-8?B?T1ZhaVA5UXVuNVRPV3I1c1FHelEzMkQwMVdnUUNCT1lIWStxRmswVTIzZ2Ft?=
 =?utf-8?B?NitBaDR4VnZMYnRTMzREdmNmNklxbEtkOXhPam5pZ1d3eXNYZEJXUCtlNEdr?=
 =?utf-8?B?Q05oOUZlTUFJcVk2dFF5dDh1ZytKczh3dWlwSStFeEVyYk5LbFNrMEFMaFJz?=
 =?utf-8?B?cXQreWtMWXpXelBUT2NnT0tmRUJIQTdRNnZBS05lT2pSYzl6K0c4R1ZQTDlO?=
 =?utf-8?B?aXFQQklXWFlDc0ZyN2FpVnUyNmlKRWMzS1RubU5zanUwOWdGdlc5SGlnSHUy?=
 =?utf-8?B?V1Q0cnl4WENnYUZ6Z2NJUXFjeDJIeXZ3aEFMSG9OTlFNK2J0MTdXdHBvYXky?=
 =?utf-8?B?bTI1ZGNBVGJIbFM4RTE5UmdaMHhJYjR6WTBwRXB3b3IrSXl1MUFTTTN6Y0JK?=
 =?utf-8?B?ekVCampET3RZZG9RQ2dOcEVjV1JtbFVEZVI2ZlRpc1crNmxUcklKYzBHNDJC?=
 =?utf-8?B?NG5CTGFzY3ppRGYvc2pyQ3QzRjQ3NUNpWmVQS1pvcVp2MlMwOU5kc21UMkZU?=
 =?utf-8?B?NzFEOFlJb0EwT0RTMVRXRlZ2ZlRiWmxmQnExSFJTcjNzaGVkNXVWOGp0SGlM?=
 =?utf-8?B?K2dxc3J4WUVaRCtoUWRlRzN5SlJKMnVTRkZoTkxGSElJQ3N3WlVwdjhzb01I?=
 =?utf-8?B?Y2h1Vy8yaHlhWUZSL0M0VjhEVWdhNVFCbnpHa2w0RE5kZlhzN0NTWUNSakNX?=
 =?utf-8?Q?nZ+fgmmnGiCVjaHoNBKaxgHUy0gG/pyA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0p6ZlBQNDlMajV0YW11UHJSQUZjOFBFTit6Q0VOVFpOV0t3Uk9HakEwbG93?=
 =?utf-8?B?VEY3Q0x4NDlLWk9VYTQwdGJQNlBVOCt4OGJnNHFoWGp4SFlOZEpGQnVzMzRH?=
 =?utf-8?B?cnRkelBTVlhVS1I1WkdueWNVV0RDSXdhK0ZIZjBzRHZDUFJQVU4rMUsrRjVj?=
 =?utf-8?B?RmpCSnZrNURiNkkvSXc3WmVDNFpsRHdJdXUrNEphMHpHczhuN0l1cWpubkUr?=
 =?utf-8?B?WWdKeHdOV2VRaDdONEMwQm53d2ZIVTd4SEkwWHEvZTMyUEs2TDZneVdmNzhi?=
 =?utf-8?B?NXdweUZ6VGI5MHI1WlBieVlZWXkyTC9QMG40YkYxcHV3WDBDL21nMFZFcVdq?=
 =?utf-8?B?bmw0c2w1V2l3THh2TzRZaE0xSndwSWFIS25BWlJDdmxwSGs4ejhabm0rNUM0?=
 =?utf-8?B?YmFnaGdLQ2FwdllVNmRpZUZLWXdnWjdQeTkwTXlMK21sRkp2clFacVV1RUZk?=
 =?utf-8?B?RW1kZE9Ra2RkU29lVitzM24zSWdWTEI1c0xZU2l1Q21yUUlVWERnVzZtTU9y?=
 =?utf-8?B?cXFJcUY0WVZ3dDdhMVVWTGtPWTJ4TU54eTl3TEF6VlVpaDlhRG9yWTQzL01w?=
 =?utf-8?B?TDQ1a2lZdkNMZTlzQTBXOW5kcUFwRFhGdnc3UkY2a1FYOVIvaTdhdWZxc2w5?=
 =?utf-8?B?c1ZsVnJISkNlLyt4QUc3V29iNTFKUDNEZDh3aGFaT29uMFdLV3loeXFPRjlp?=
 =?utf-8?B?em4vMVI2eGU1UkxKc21teWlCeFdWa3RkVS85YklpbExmaEFNUnNsVkJTRFF1?=
 =?utf-8?B?dU42Yk11cnFjVFRkUEpaUlJRay90c2Q4WEY2Z2gxb0VBMlc1blZjWXdua3pV?=
 =?utf-8?B?UFJFZ3RWRmFLdDhTOTAwTnFzTFEwZUJkYXl4OWcvaU9XK2IyS0xjck44VjNN?=
 =?utf-8?B?WXAwWmswL2c4OWlSUG5VQzVwRXJ0d1dQcnFmMmhsdFJHWGhZODhOWFNVcFM3?=
 =?utf-8?B?OEU3NEpLWmdldmFOcGlEM2U0SzgrN3hpWEhWaUNsRTBRZWdFT0M2R1dvVmRm?=
 =?utf-8?B?N2lyY3VrYnNLWEtmOTBaOWp1VWUyK3hnVEJkbDRMS2hRY1lob09ESkZJaWVH?=
 =?utf-8?B?R3ZYaDhQSFEwL0htMVRRekduTGkrSTlUSjRmZWRBanNxVFVlMWxEZE1OUXNr?=
 =?utf-8?B?TVlMb2JRS0tyQWcrL05FQm9aS3VCMGpRRExyeHlmM2xXOTFIa0JSWitMWEZh?=
 =?utf-8?B?ZHFEMm1QWmJZY0t3ckk0WVRrOTVHa1MwM0Y5NXozVDU1K2JQNUt4QTU5VUJK?=
 =?utf-8?B?bnBPV3hNRGpRdzFWM0lCNVhMNFdZbktPRlJxREhXMFJvMHVlcXgzNUhTRnFB?=
 =?utf-8?B?Uy9JNTJLNDgreFVBTTJHU1F3eW54QjliQm9sTmNyNy8xU0NpWUpxMks2Y3py?=
 =?utf-8?B?cVR0eHVFUEhtMDcyR3lZb2ZORG9EYk5uTWxrVzNpSlptMDFrZW5zQk9BbnM2?=
 =?utf-8?B?YXZhb29LTUJMR2s2YWZKdFZCQW1aM3hsYU5iQVMxKzlwQ2JSd00zeWYrTi9E?=
 =?utf-8?B?dmkwZUVrVnVVYm1QZGVVcTMxWFFzbWhWUXFyNXlnckRSNjdSUVJTNGgwTDln?=
 =?utf-8?B?WkM0SWdHaEowdnZoRVYrV1J1L0N3ZEtTWStCVG04bDRYbGFaeEViNDhTdUty?=
 =?utf-8?B?aWR4MHFIT241VWhKRjkzdUJXTnFHUTlTZlFSR09zU0JwTXp2Q2YvdWYvWjgy?=
 =?utf-8?B?V1VPcUVDMy9kZm9TT1ZiN1FSbW1hT09TZDNWQ0hxUTh4TGE2ZEJVZlVrYldH?=
 =?utf-8?B?OUMvRi83OVh3ZG84MFc1K3ZuUzV3NlEvZ0FwTEk2VkhydlBydHZNTWM2TitQ?=
 =?utf-8?B?UjZHVmtQS1JiK1BMRDhZNWg1SHFlNHp2SVgzcE5OcUNNNElpeUVVSlJraEVI?=
 =?utf-8?B?Nk0vRzU5eU5CN3g4RVg0MGlYM0lWSDNGWEJOM1BMVDRUcU53MTdYeEg4ZFJt?=
 =?utf-8?B?Y2ZQS0lHaDE5Yk85YmhKZjNyVUZtTEYzZFhHQTBEREMzcVlRUFdrVFNsTzBh?=
 =?utf-8?B?OVRyejZXSU9VczJiMmwzKytPR1UvS1ErRldxVzdXUE9DdThBcHlNWmMzMHk2?=
 =?utf-8?B?dlpRSThNcjRpc2Z4TExwWGdDWHpGZEs5aU9qaVkzbkh2ODhFMGFvT3RBV2p6?=
 =?utf-8?Q?wZ97Lj6S3ZkMQ6ggCvwctey11?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1fa6740-1b6b-499d-d068-08de31991ea2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 11:51:25.2266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6DJnN6zP3fc8dRGjYLcKrG5K5jproKKy2BtzgSWKhCLY/b+tgiSqvu7uvlJRp7K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9007
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

On 12/2/25 10:47, Pierre-Eric Pelloux-Prayer wrote:
> Taking the entity lock is required to guarantee the ordering of
> execution. The next commit will add a check that the lock is
> held.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> index a050167e76a4..832d9ae101f0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> @@ -35,6 +35,7 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
>  	struct dma_fence *fence;
>  	int i, r;
>  
> +	mutex_lock(&adev->mman.default_entity.lock);
>  	stime = ktime_get();
>  	for (i = 0; i < n; i++) {
>  		r = amdgpu_copy_buffer(adev, &adev->mman.default_entity,
> @@ -47,6 +48,7 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
>  		if (r)
>  			goto exit_do_move;
>  	}
> +	mutex_unlock(&adev->mman.default_entity.lock);
>  
>  exit_do_move:
>  	etime = ktime_get();

