Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF28C7E4B80
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 23:07:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF6910E3CB;
	Tue,  7 Nov 2023 22:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::622])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21CC10E3B3;
 Tue,  7 Nov 2023 22:07:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c94Nw4fjc2cLYy8mmVshfgJITzdp+GT5G1aXOlQmjr/gm0Tfq5D5hSqb51aISwYY+wKHwfDi2GCccp0WllVaJ7ioDKUDyJ0IGx8fo97miaGrjzW+hW7ej+AqpH32O2SpAOminT4rOg1vz2NtutUrbEIfjBzW4g7aYyk0B1Krm22WU9qxK6byHtFl9cTnZlyebnhypPh26DXerxmSmZxsEo97DI5uFKQrAB3OWiwWZwLQ+sPGMDmpxInJM4nlYM+3ngQFJOk4aruJq9P+7C+4HFDNlFOmLVYcdLFWKUNvuS6RXGw7XN4ZvTR7N78zTuzAVW8xM2VL85NglqlnuiSChg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYHREXEKRLvstP48SKBAoejNPX7851KXgQjlXtOzb/Y=;
 b=McsXayaFCl+v1n58PJNU19h9iIEEyZtGsy+kZfzr0XGtUMYFAPoNH4vfZT9/gUVkBhFicbcAHXOlEctAmkxertnL0fsMcmnWhgLA8UpXvhTzShdBVlr5M5AJUprOb+SVkMBhdnTYtHXQ2+Glvx0mQjEwHZW7BgAf51Is8MuDw7mbQGVrqEAaEcF8eLgU/qa29ddNbc8F01n+VYBFwV16Zbf4XPNVGJR9HbmIlnQnN1kvEQzZyaNxIReYeAjVcq0sp+I3B/VGAI2kz8LEFkUTj4Vtr5C2zCDuMMyeXBIjp8u6cy4dIZufGqjV4zbHwyIBMelnFsLVQQBCT+IVpXYfHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYHREXEKRLvstP48SKBAoejNPX7851KXgQjlXtOzb/Y=;
 b=TImTEnJzXaJzwcLAGA2AVuzw9aJ76OA00D2cVQKbwj3HxamM3Wi3PFNCfI0boPrE+3VRNTzsIZS9a/xm91PxpVSuCF1CGAbxeptAz0UZSsyxGgUxalRb8xSZD4Fb3hm2oAcntKnRbBQUZT/EUZMOWGbMDOA9MB0a6vMuSXMdAY4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 22:07:45 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::19c3:4a94:9ddf:35aa]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::19c3:4a94:9ddf:35aa%3]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 22:07:45 +0000
Message-ID: <7ab0e34a-3c02-4c05-8c04-568c493ab1be@amd.com>
Date: Tue, 7 Nov 2023 17:07:42 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Schedule delayed_delete worker closer
Content-Language: en-US
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <20231107194554.945018-1-rajneesh.bhardwaj@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20231107194554.945018-1-rajneesh.bhardwaj@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0314.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::27) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CY8PR12MB8300:EE_
X-MS-Office365-Filtering-Correlation-Id: b7620a1e-ad3a-41f7-f877-08dbdfddf840
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tcu+fxf3+wnPIlHscd50eFaooTK9E8tfCn6+yT9/VwlfdDDRDMoCfH9+15Y//kFIXHViJ25pqae6y6XjGNiZcn6LYOmYcdiO4tflBYmwoRics/f0zXF1vMadKvqzyEFLSshs1Ceh8zpnE90/Ng0FrRqc+gDhSYJaz7KgQ5vBPSyANnO9mTzPO7tOeuiwgyrfrrhTEUTv5/7MCZyvvV2gb5ZP9GQu7f3AiTi57qhmpCkOYCreicOR/fwePGBHvI3d30g9G/3OdMPBRKlhaukmDbVB5HIrze16tY/9AB9o/wn4fTQ4FSebCHD5DUKzPtqzwY8KKl5wWOvQ3wnFK7s9vn1/TWJUxE6u0pPwDqxF0MQ+AS4PsA8HbWet1OhgDVSa2DOmm30ymFJckwaGCu3DU6UiLLNQJx9LDJysdhwcSCvGhA2uE2Bqzfw+NRULIC20Ihj+8eOcHJy/B57hT/h49xGo5+Xvuh+6GZS02xCLjqZAfhXKOXvtAD5Gs6IWvyTE4mLNs230Y/ApPDUocrH7zdIOO9RpN+S5CFwyT1BXlYfmXJhKiq7g6HgdEhcSulGAStEf8uvrPPppTOmVGGdMflZGNjrg9AX4xG7M3pl3nO8uv4glu/5em/Lz8+fzlRu+3AxLT6i005PmX3fETmSbFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(2906002)(31686004)(2616005)(44832011)(41300700001)(6512007)(31696002)(6486002)(8936002)(5660300002)(8676002)(4326008)(86362001)(38100700002)(26005)(66476007)(66556008)(316002)(450100002)(83380400001)(478600001)(66946007)(53546011)(36756003)(36916002)(6506007)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWhqVzNVQjhWenhsck9GTGxSLzFhaHd3alRhTmlWNTF4QzRFVU5uRWRTMURo?=
 =?utf-8?B?elc4OVJ1bnE5S2lMRVVzZjhpQVM1aXlhc0RzZFFTQzJmanRpRndDY1d5bmlS?=
 =?utf-8?B?K2VpelRSOVhXMWM2SXdKd05jVk5tSWgwdGlBYW1YMXlSMFBNMFg2YnhOVldF?=
 =?utf-8?B?R2luNHUray8yam5rV1BTTVhIRW9pQVpjYkVRa2NZaXVwUVlGNGJpSHR2dlB5?=
 =?utf-8?B?SnJLaGF3Zk5mQWE1b0RyWkdsWXBESk16dnk0SllPZXQvbng2NHh2MlRTTTVU?=
 =?utf-8?B?NFNaS1p0OStFb0hhSzdkbEU0ZnFLMjlqdDd6U2tiRGtURFhMTWt3THdRVWlZ?=
 =?utf-8?B?dGllbEt6YndxR2xrZmI4bG1Talh2bkkrRWpNZFUyek1CS0p2bk1OLzlLUjdE?=
 =?utf-8?B?UmVQam9QS0ZFVmc2Mi81eFc4ZDZSTVVsNDlIcmttVUdIZkgvYnhFcGZZU3lV?=
 =?utf-8?B?SnBOd2U2Rm8zUitUbmZhSFZrblhxQjZ6TGtLSHVhdDFxZ2NXTSt1K3NlY2ZQ?=
 =?utf-8?B?d1hLYUNtRnp5dVJDQ2ZueTBEYk96aE5pUEQxTHlmQm90V2xnOSt3Y0JPOXhl?=
 =?utf-8?B?enZXRWFIUXlDNHpkRWlRWmlUWjhQMGZyODg0ZHA2VW4zZXRpTFRtbGd2U003?=
 =?utf-8?B?b2MzNWpXa1YwNHlIY1EwTlIvKzRNa0FUZ0srT3ZSV0RlcHhJT20zbStuRjE4?=
 =?utf-8?B?UDdGSnJSM2h5cDBRcGpTbUk5S3NVVS9xb0d1Sk5WYlU4M2NYUHdSaVJ5YVlU?=
 =?utf-8?B?UktJOTdva3ZHZmRPREJJUjhZVWNzVFV6dTNaS1FxWENielUrZmxXWFVqY1RZ?=
 =?utf-8?B?eWFKMU5BdmNUYmEzZkNub1E1c1NRODhGajVDaVJzMVZ0aDlSV2pDdThvN2hr?=
 =?utf-8?B?SytYTjE0YzkycFlROFFlMGJxb0hpWmRkSkNXSlkybnBSWWNmKytrTHgzeFhm?=
 =?utf-8?B?OGxrbWI0N0pySDBLOVRZaG9iTWZ1ODBRcFB4c3hSdDdLK2NuYnhDbHhmS2xi?=
 =?utf-8?B?WGVpQmlkOU9TOUx4NnFpYjFmeXdoVHFSY21TRlloVGtYM21HTmlrbUVDVVlr?=
 =?utf-8?B?SU9hTi82Sk1SYVNaSkMzSmY2Y0pKdmVXait4YnArMWVrTFhsci92cSs4TDhP?=
 =?utf-8?B?QUZmaGxVSCtXSWtzYVZUVGNoRDZOYlJWRjg5SXN4NlhVRzBvKzdKK051TTdn?=
 =?utf-8?B?V0VIMWR2cUtnWVFIeXVMc2oxZWtWNTF5djF2N0pSRzYrR2VKdk1rcW0rSjAy?=
 =?utf-8?B?NktxL3MwRjZEQVBsSUpUeGZqb0Fhc2dhSUY5WU0wWC80MVgxaDFBOU11Q0Rz?=
 =?utf-8?B?VWgwQWFkMTlYZXZVQi9GdWNoOHJBQ0dLR0NDWGtIV0x5SGE2RFBDOFQ0djY0?=
 =?utf-8?B?bm90M3lJVFo4VDNVekNURjRNVkFPTWVKUFdJRmdsM0Mvd1l6T2MwcHdiR0Z1?=
 =?utf-8?B?cW9kMEdGdTMwVTVmODgxMnA0d1lpd01BNmpqZ2x6TEdVR01pYWFuVysvb3Nr?=
 =?utf-8?B?QjdpcXFDYy9YdUZ3VVpTcWR1STdzajJFbVVNWlVIbjBraFpXTndTZUJsVGp5?=
 =?utf-8?B?Y1REOERJeW5Fdyt0dXQxSEpOT25tUHN5QVRiZTJvbXljS1V2eXBnMkh6SGkx?=
 =?utf-8?B?aFVvVzR3eWhQNWVidWRnMmF4TjRBeUk0Z1BNc2MvZ3pkMXJtZ1hXK3BMRVY2?=
 =?utf-8?B?NUUvYzRpN2VJdlVIOEVVQTBvM0tpRGVINWMramhUNFIrRU9udTRCL0Z0dHNL?=
 =?utf-8?B?N2IyOVNIblMxcFVUTWt6VWZaaEtFeDBsUFdKTVpQSzhnZnJqRytkZm1jWktK?=
 =?utf-8?B?L0VTSjAzcmJXbUF2ZzNtSDl5Y3phQjVtejdRTFB4TE1SQ0xLa0VyU3ArZUZX?=
 =?utf-8?B?MDJKTzVNWHFKTFQySXhDZDJwbjRiNVhHMDJzd2tRNzkxdjM4RjV5MGt5cjN4?=
 =?utf-8?B?RnRrNkZYa2NKVmdUMXUrWUI3dDdlbTRsbnlwUEpOQ0x5UzBUUy9iMGdMUWJK?=
 =?utf-8?B?T0FXcVFNNUU2ZUE2eDdzQTl5eHQxeXJwaWdXb0dTckJkdldEM1BVbDZHekhH?=
 =?utf-8?B?Rjk2T3pya0dLZllLd1BtUGc4M1l0NUJtU05RZFlFU3dXcVRRV2hIL2J0c1R1?=
 =?utf-8?Q?kooRdURm/qvGL7nlvyhhSdIJd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7620a1e-ad3a-41f7-f877-08dbdfddf840
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 22:07:45.0312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lXwaXqcpy089B67hvkIDA3p0qtRQlCQ4gJeUiQSVvQKI4N34Oc4+6oWYpjA7J64M/DJmUtcPJdniqEdxSq0TeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8300
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-11-07 14:45, Rajneesh Bhardwaj wrote:
> When a TTM BO is getting freed, to optimize the clearing operation on
> the workqueue, schedule it closer to a NUMA node where the memory was
> allocated. This avoids the cases where the ttm_bo_delayed_delete gets
> scheduled on the CPU cores that are across interconnect boundaries such
> as xGMI, PCIe etc.
>
> This change helps USWC GTT allocations on NUMA systems (dGPU) and AMD
> APU platforms such as GFXIP9.4.3.
>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>

Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   drivers/gpu/drm/ttm/ttm_bo.c     | 10 +++++++++-
>   drivers/gpu/drm/ttm/ttm_device.c |  3 ++-
>   2 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 5757b9415e37..0d608441a112 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -370,7 +370,15 @@ static void ttm_bo_release(struct kref *kref)
>   			spin_unlock(&bo->bdev->lru_lock);
>   
>   			INIT_WORK(&bo->delayed_delete, ttm_bo_delayed_delete);
> -			queue_work(bdev->wq, &bo->delayed_delete);
> +			/* Schedule the worker on the closest NUMA node, if no
> +			 * CPUs are available, this falls back to any CPU core
> +			 * available system wide. This helps avoid the
> +			 * bottleneck to clear memory in cases where the worker
> +			 * is scheduled on a CPU which is remote to the node
> +			 * where the memory is getting freed.
> +			 */
> +
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
