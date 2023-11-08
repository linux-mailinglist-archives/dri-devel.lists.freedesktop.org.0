Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D657E5978
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 15:49:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C665010E793;
	Wed,  8 Nov 2023 14:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C5410E792;
 Wed,  8 Nov 2023 14:49:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e6F/k6Xu33mcDB7++fIQ8vzaaBFqBu5TjlSoUhK1r5eMY1zIMabm+8fmILOWuCRqCXGfbtLYa2EcKE98GcmP3MP8f91SPl+NLkvtS5ZJpEz/j14xkOW6VRWk1dSPpjxp7Vog1oX13lKTcUR+U4boBKCU7yxKHrcFcWwKXNyHOBLQ3VZCizpMRN3/o5zYpJ+LDetHN1c9M69K73Z4W70vHRlMTcZ/oOa9+kXdHOk6GRF+clwux3eCXrNUKsUv3D+gbcQxvlMOewXrminTYvoh/oDChVMW/AH4fFySIyPLIpsouwd78IWXdXKGrp00SSI9c+Iw+2IwXYAAi5LSCSuZtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8XVs+CbixUD68jDiJDhAjqTni6U7nqFTDG6xFWVMvU=;
 b=du7kt19BbsK/elV+aUHOx6aR8cTcMuMRVO/su1VsNfLRGtZrmybEPmtbgA5KWHHYHlYce/girz9Qi7YVgOFdsCiMEbtLw29LOvDSlsMZo6OK9eCX6cqIULSesuKYYq4yrAJaT0QJ/CjJ9ZgCsxZJLyTx+BwNQDxML5xGRyl0ldiMXcJJGR5xMo05bYP0XY+M6KF2RqxSDwulpe+BeLse44IfdNrF1QtfMyX1+kLfyxMIfUKnNRLx/BUGVd/NbV+ipV/Z8fVYspM7vmkJKhPrW8Rgh8AYpmQe6CvS5y6DHPxZS0XzUpkgcR+43S/8XNFGIgtGOL6iZXJ2AF+OnNqPfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8XVs+CbixUD68jDiJDhAjqTni6U7nqFTDG6xFWVMvU=;
 b=3lL63r4eD9qQBiHzGutA7B/84Dhc3DrbhPP6FaLHXOpGNmF4iFt5LV9qQ3jwmSgOc35P9COfEFail3fhIaM9wg3IzQbFlp2o/QI00oGfE1LB6bBs0GHeUThXUsN4WdRyAHNdoipMrWISPN6fSTzYoB4UWnQgfQZPwOxnV1brrmY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH3PR12MB9394.namprd12.prod.outlook.com (2603:10b6:610:1cf::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 14:49:09 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6954.029; Wed, 8 Nov 2023
 14:49:09 +0000
Message-ID: <86152ebb-96eb-43a1-b244-052c42ef1024@amd.com>
Date: Wed, 8 Nov 2023 15:49:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v2] drm/ttm: Schedule delayed_delete worker closer
Content-Language: en-US
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <20231108125824.995445-1-rajneesh.bhardwaj@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231108125824.995445-1-rajneesh.bhardwaj@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH3PR12MB9394:EE_
X-MS-Office365-Filtering-Correlation-Id: c6519f5a-6086-4c05-536f-08dbe069dd57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kb8xpsCtt7IaRXi7Zumbsr73L8xBBP8w6eCVwQR5ifibR0GXXQHNnL/WzHfBD3i70ECATLPHli822MxoCs2e0cCavk4m6ORwAOdUPQonW8zXnFFUurjVBkaq9X6SmUvjkFoXy+kUTJw8FbmgIPQuecBXdqP1kl9EBxGqoMIrpiR9ksX9/wDK/NdhXOk+uiZrR0LdDjY5BUXtEsfxBki2sovVCd87nJHEffrikHvT/nRz6hfdnuZ3CAEdnXCwZeXaJGLYgB39x6ibLAmmXekz0mK6D3JkDnGWtvjQh8+lIhQLbK3UPFQIYfWUW5WrkshfD+1HyEK4PRZHynZP6whjJj4Xtjza3wZW9YNP3KPcGbreJuLMiOHLilkJaMUeWGyTYZuYk1qnBAhaFRRBVCHquTrZt+KEQ49wW0nFBnz7/giXpBrDVcmyaJDqkQv/IvmqZucisTC3XJmy2M/pokY8NXmWfVK/k95yGavGaJw6AR0CKf7xK1pNzoym2yn5CSD9Z7HglmyKoDE9s2RxiVvXtTHBaR4jir6MYzPrYPGl5lhKD43hki0HAZHCpMtK5mMoL1PbmOg8glFS8p3eQjN17X0M612PDz9uv+Pj06vmNyyfa75x/H2yYUgSsDV09dGHdRy4Ytfplm6nj9P5Nh1ylg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(136003)(366004)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(41300700001)(66476007)(450100002)(8676002)(4326008)(66946007)(8936002)(66556008)(66574015)(6486002)(31686004)(478600001)(5660300002)(316002)(2906002)(6506007)(6666004)(6512007)(2616005)(36756003)(26005)(38100700002)(83380400001)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UndqWEtxZmlNOGorelhHUEVNTWtkbG1NUDJuOC8rQ2lzcllpYjdWVUxWNFV0?=
 =?utf-8?B?RTFjVVBaOGl1VUtwMmlwQWR3YVdPQVNTTTdOelEvUTZheXhUU2pKQXFTTXZH?=
 =?utf-8?B?MGhWbER3YUc5cjdQdDFmUVdBblZPc3VWb1RtbWdiYlBCbmZweVhLY3pNR05s?=
 =?utf-8?B?emN5V2s5Mng0em1Sa24vQzRYVUF3bndWMnNOTzVCNEFHa3hQL21WakVoRnVM?=
 =?utf-8?B?eWE1RUJ5UTFJSTh5QVgxeHhZWCtVellyN1pBTWZqTnRFSFRxNzVCUFVFZmxC?=
 =?utf-8?B?d2hlOFdFMmdVR1FYWG05L2NmT0V0N0FlM1gyaGFLNDFCUFBRVjQycHlaVTgr?=
 =?utf-8?B?c3FhQ1gyVXhVSGE4WWJISzFueGIrOEpFVFBkaDJPejd3QzlwM244Q0lCVmJh?=
 =?utf-8?B?SGkwdjNHNXBUYnBGak0vaXM4eWQzdVlwZ05FMG1EeDJsTjFwOXo3dzd4eWFY?=
 =?utf-8?B?UDEvaGNKbUxFcGVEalVPNnd3Mm5iZkdXb0N6aG1LQVllVUsxaTlobnUrTktM?=
 =?utf-8?B?TDdyVW10bWU3VFlUMUhPVVkwdUp1QWxnb3dMWnVCK0o1WFo5RXozUEQ5Y09J?=
 =?utf-8?B?TmhWRTR6d2toVEkxL0RKNExCUGpRTFRjc3FtT0tJN2ZKMTlBSWJkWWRwTk8z?=
 =?utf-8?B?TGg4VDM1YTN4ZG9vY1gxSWU3L0lSa3ZwK0VqdisrdlpObHIvZlBidFNpdWVz?=
 =?utf-8?B?YUFFNUlSUmpySGEwOGI1eERadWUySUEyWUx4ZFprZ2RYdjExb0xCd1R4Snk3?=
 =?utf-8?B?OUVOZjVuVUlkNHNXTXJaUTAremp3NlpabS9yVFlPTGZQMzFYQnM1ckhpRDZx?=
 =?utf-8?B?SHhHeEdXUmI0MTFPR1N1ejY2M0RmY0tFSFZDa1pnRG9GTVQ5T1dHTmlGK0Fv?=
 =?utf-8?B?WWdOb2dYWnEvSWRURFQzYzd1enVpL2FQaTEzeGVNblFFZ3M3VHpiSGtiTW4v?=
 =?utf-8?B?dFExV3luUlFlOFh1ZmNXUk9XaWFDc0hvSzFWSmo4Y21sV0VlQUVjR1poZlo5?=
 =?utf-8?B?THEyMG5VbUFJU2Z4VDY0czFnNzVTMWpkSEtrNG5RdytMNlFYcjFmQUdLSVZR?=
 =?utf-8?B?MEl4TmFIZ1d1ZUhBSDFDNzBDRjRROVN6WWx3RFlQQVFCZTRBWldxeFhNZFA4?=
 =?utf-8?B?WUtqbXhqUE1jZlRVUHZ4WGZDTlBRb2s4TVBJcTZjM1dtcTJzdm8vMFAvZmhw?=
 =?utf-8?B?UEdVaWJHOVMvR3BzVHozOU96RmU4TnQyNVZpSVNFQnBFSjMvRGJRTVpUMXZu?=
 =?utf-8?B?UHVKVkdabkMvQlhwd0NFZU80bWdubDg1WVlSeHlETTZhMXIvL01KcFpVUFEy?=
 =?utf-8?B?ZldZdkxieEpxUThWQ1lrZ1J1ZUR3UnNDL1BSclVJc2JwMGlFR2NCTVJOY2Js?=
 =?utf-8?B?QVRjWWExZm92VENXLzE1aVZMVXdab3FSL052c2VEZEI1OVNqYmE1RC9TVFBl?=
 =?utf-8?B?RzA5QjVvRm9EU1FTZkRpK2s3azZWaFFxWmpCR2czejhUYUFMeCtsL2Rxbllq?=
 =?utf-8?B?ZVVITnVmYnNVUTFzS1JaSzhsSGorVjlpVDVhNXJyaDVMQkpsL1dCWUwrQ0R0?=
 =?utf-8?B?RTFESHpzMDFlYjZUMnN1TVorOXJ1a005Z0NVMXBsUjUvSFBrQlJBL1hJMS94?=
 =?utf-8?B?cTlqeHM5VVVFU0l6M2xIamNHeFVzVklpK3l5TXMrUTFxV3BmS2I5M2tSMmVG?=
 =?utf-8?B?RVdlZE5obTdTTldVV2RuNFFRSjFIc0gyRU1GckpZc0Q4WjB0LzNRaS9VVENC?=
 =?utf-8?B?NkdKZWM3TDJBYzIyTENXS08vcERZa0hTNDF2WlBmRUZlRGJtQisyYkxKd1c1?=
 =?utf-8?B?K0hMbGZwL0tLT2E4dGpjRHZJWjVwSXZLZ0JaZzByOHBSQVorSEJ0ZFN1di9v?=
 =?utf-8?B?SjFjclRhL05wZ05XNE1LVWJsRVcxYmNaMFpvNVZXcndwVWcxVG9WYitpSDVX?=
 =?utf-8?B?SHRnaVBCVTJvamJpdElYVmdzQ1Y1UkhXalczRXVMMC9sbTl5N1RKQVBPK3FZ?=
 =?utf-8?B?ekVWc3FFeFU2QVIvanVVSmRoV2dVL21PTXdqVHhyQVhURHRqU2hLSEE4dDRu?=
 =?utf-8?B?RUFnTWl6UTNqaWIyd1pneXl2RytOamIzbUY2eGJNeFh0MUU3TGxJbERqbnJF?=
 =?utf-8?Q?AT9Y=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6519f5a-6086-4c05-536f-08dbe069dd57
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 14:49:09.4805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jUQQs+VsjHEwK9xLIgsHeGymrSAXPto4Z/pRqyiHp/MlgyONi1ZYBStnLMcnMabS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9394
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
Cc: alexander.deucher@amd.com, felix.kuehling@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.11.23 um 13:58 schrieb Rajneesh Bhardwaj:
> Try to allocate system memory on the NUMA node the device is closest to
> and try to run delayed_delete workers on a CPU of this node as well.
>
> To optimize the memory clearing operation when a TTM BO gets freed by
> the delayed_delete worker, scheduling it closer to a NUMA node where the
> memory was initially allocated helps avoid the cases where the worker
> gets randomly scheduled on the CPU cores that are across interconnect
> boundaries such as xGMI, PCIe etc.
>
> This change helps USWC GTT allocations on NUMA systems (dGPU) and AMD
> APU platforms such as GFXIP9.4.3.
>
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Going to push this to drm-misc-next.

Thanks,
Christian.

> ---
>
> Changes in v2:
>   - Absorbed the feedback provided by Christian in the commit message and
>     the comment.
>
>   drivers/gpu/drm/ttm/ttm_bo.c     | 8 +++++++-
>   drivers/gpu/drm/ttm/ttm_device.c | 3 ++-
>   2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 5757b9415e37..6f28a77a565b 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -370,7 +370,13 @@ static void ttm_bo_release(struct kref *kref)
>   			spin_unlock(&bo->bdev->lru_lock);
>   
>   			INIT_WORK(&bo->delayed_delete, ttm_bo_delayed_delete);
> -			queue_work(bdev->wq, &bo->delayed_delete);
> +
> +			/* Schedule the worker on the closest NUMA node. This
> +			 * improves performance since system memory might be
> +			 * cleared on free and that is best done on a CPU core
> +			 * close to it.
> +			 */
> +			queue_work_node(bdev->pool.nid, bdev->wq, &bo->delayed_delete);
>   			return;
>   		}
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 43e27ab77f95..72b81a2ee6c7 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -213,7 +213,8 @@ int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
>   	bdev->funcs = funcs;
>   
>   	ttm_sys_man_init(bdev);
> -	ttm_pool_init(&bdev->pool, dev, NUMA_NO_NODE, use_dma_alloc, use_dma32);
> +
> +	ttm_pool_init(&bdev->pool, dev, dev_to_node(dev), use_dma_alloc, use_dma32);
>   
>   	bdev->vma_manager = vma_manager;
>   	spin_lock_init(&bdev->lru_lock);

