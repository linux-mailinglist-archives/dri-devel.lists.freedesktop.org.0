Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3BE7E5209
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 09:37:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5941110E4E3;
	Wed,  8 Nov 2023 08:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2043.outbound.protection.outlook.com [40.107.96.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7259910E48D;
 Wed,  8 Nov 2023 08:36:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwJYsvfcFD5+ds1M+yxxX2OASR/eJevxQ7m6CJ0jbRrgGr3sP9HDckLjeXkJA84d4I1KMtMPs2mSl3xWNfDL5gbMkSFBRB9+pVAtDJAjkwX4e6RHRHCx8Du8R5Q7moZ1jejAfgwLuZsksXjpRp2hMmlMq5QXr2/24t460D+15QBkdwClu9LzPieJzb+9LqD9EcC2CcimlYf1Ute1Yg7iJR7Ek+HgMx2d1WILIdAj8gf9xae/RTVCDxYICWVVdQaBGmXpuqsS9pAcrxO5iBzlbTcZljhSUXssfiXZI1Af+WfTWcAeA8XFrAoVyMtLvFleGywIdp40L7+vpiAVSDSCmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yU65e0VtwDk9yDX2u5Vm0KtMJw+FXltIY+2MMhnUNBU=;
 b=oVBfBPeX0j0dLuBjBiIOTJLTcyOHPOJvKDwncaFwbzG4qFncUWLzwHcQAkZS7JT6e9gqMKLoXBIV6icbpah9YDvdJp+M4Tia4ehqPMZCA4jiWLZZ82eZfds1JMTrWzQ0uHFEHbX19MEATQvkVUEx8aJiCkG7rBXE1ZX8koaVZDW1eYv/YSMCMskvBmWsAmP8jcBp0+xD/5GjfYDjaDXDLp/JenCRSH/eSJ87ZfIZWG5vTqfuMG1AR+6flNKS1LubtxRS7FUxCvHlPKU5qP39PXuhJpGjDVKOxU4YJ5p1y5BoXA9ViXpqPBYoMPoSkQBBDdXzh3ssdENJL9pfsZnVWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yU65e0VtwDk9yDX2u5Vm0KtMJw+FXltIY+2MMhnUNBU=;
 b=eEXoLSyncJ+DUjc9eLtAMpXbhqvliLUn47zpAAS8SrDpazKtHq9s2DKvWSL+c8t7lgliiFQshUJ8NR6C3b6INyYbCY311hbeAbEeWdV7N6+0jC5qny2i0t34UmN+hogxZ+sQFmz/T2OHlt2WKvehaDpjCcFExYbUF6fjgXMoWDk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA1PR12MB8985.namprd12.prod.outlook.com (2603:10b6:806:377::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 08:36:55 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6954.029; Wed, 8 Nov 2023
 08:36:55 +0000
Message-ID: <8f184cd5-cf6e-4c2c-a417-140215d2cbf3@amd.com>
Date: Wed, 8 Nov 2023 09:36:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Schedule delayed_delete worker closer
Content-Language: en-US
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <20231107194554.945018-1-rajneesh.bhardwaj@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231107194554.945018-1-rajneesh.bhardwaj@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA1PR12MB8985:EE_
X-MS-Office365-Filtering-Correlation-Id: e5d2e004-899f-48b3-229f-08dbe035dd2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xtY0mRrp0HnPw/6abX88JptWWBk++LyCMzA4KBLuFRiNOylllAz0H4xIWIY4yNUTdUUygSagDGN+xNHOsl1R1Udt+XwuitnDf5sLa04IFKG/TihhwdF1jHDY5PBgB3LZ4o670uyMK6HSea1UG+stugUKfuuu9V913Y5gKYCemiz+z2UAWiSqe4awuP+f0Il4JQC5w/YE2t3obUe++jg5hi/mhgqx61O/tmTnEri6I43KXU2TrekKQnB4bniAp84XsnkUl9herL7a05dbthqbEbCWPl9b2yg8mjiytRogpMeybFrj3LXJU9HewbG+8Is1Bsdi292+XOjj3QReEcUnPcFtwUiwjkf7HOMdx88syM6/3wheV+k5fd8T0dz75gsOEVP5qHWTBUF08hAqImqrgL9sNDcz4MyR9oyqEYSHX5r0ghVMMULbwDETGJ5r6QMNZEoTK2qazuDe//fj0gBrnB1CPE0adoLAQ3L8b2i3Vw/SX1+NpmGDsTGTNBIKRjSoBZ+MVFExGMQZvDx+K7sajpUNnsh18uQY6FLlm8xdR92PFmfsoNSVI9pX5KAN7s6xxnVF3l71edYhxGhG0uQx/3GDVGC80nu/bxJqrOflH+HiB4k4WJHfqs0U4ViDyNxORt+y2Nz+slhkQCCGlG43jw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(396003)(346002)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(2906002)(8936002)(4326008)(8676002)(86362001)(31686004)(38100700002)(5660300002)(83380400001)(41300700001)(31696002)(6512007)(2616005)(316002)(66556008)(66476007)(6506007)(6666004)(66946007)(6486002)(26005)(478600001)(36756003)(450100002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUpKTmZBZjFXdjRVWXVlN3JERy84OGEwcUpiUWFrV1NyK2xZU0RudTBtWlov?=
 =?utf-8?B?Z3BMTlp2QlZRYlR1RjVCc0k1YitqSzVyQ0JRT3RlS3d2NFFQdzFLcERscGVU?=
 =?utf-8?B?WnFlaTI1R3dNdVBhT3l1UFhRSEtDb2puTkkwcUxpZTY2ajBhMGR3dTBEM0s5?=
 =?utf-8?B?QlVkRDhhQ3dzZ2x4c3FoSmxWalZlN1Z5M2xqY2hNMGlNSlhsUUdiVDFySGhl?=
 =?utf-8?B?dDlXK0NHSnd4SGxPS3N2bXZ0eHlBM2FndDB4bDV1M1YyN1lYUUV5bWhld3Uv?=
 =?utf-8?B?ektpL3BrdUNYK0RWejhWWVdGSVY4NHJPQUpTNTVPNG84VnNWeHRuL1h3WmRV?=
 =?utf-8?B?OGt5ZEc1bFRtWktVb1JWOGtGWExTRDlOcUpnYzI2UFhHT1VSUzRBMjB1b0xo?=
 =?utf-8?B?d1pCMzJmSVprYUt5M0FmNzJ1VG1ER01taVdZVWErTFNZYzBweWpxVDRoaEFh?=
 =?utf-8?B?YStwL2Q5K0pLZmJwTXdLd3EwYVloc0VCQzZmSkhwdndaOVVTMlFzbk5iWXV3?=
 =?utf-8?B?bWpaU3A4cjYwdzMzaGM3Y1ppWGhtTjJDZ0xFL25VUDg2V2h4bEc2bEQ0MDJx?=
 =?utf-8?B?Z1hsU2x2RTU4THJwQ2FFSktMVWJaWWVIbmErSlMrSmZ5SE9LK09FWkswMFdH?=
 =?utf-8?B?bWVhNTF4MFdHV0tqbHJ4VjFXY3VwR2Niak00b21Ba0FtVDNyUVhiNzNKRDJw?=
 =?utf-8?B?R1l2TUgrQTR4dG1WRlZ5M20za3hTbmQ1RS8vbTRNWkQxNXh4T0RZWnBoSHFx?=
 =?utf-8?B?aW9QTFZHUnQrRCsxV2R3Sys3SW53Um9nZUNDbkxIVXdDV0xGczF5Uk4ySjl1?=
 =?utf-8?B?WXNTMWFmeHlzdmFWenppdWZMOWhwNEp0UU9Jbzl2T1ZVNkJQaEE0Wmovc1VQ?=
 =?utf-8?B?N0JobWRTcnBxUjBNSjNMM3h1d3V2VlRPajd3Z0ZRZ2tEdjdEVTYzcWVNL29y?=
 =?utf-8?B?N3VqTmVLYWhMTHZTT3duVUl0S1RjckVPd1lVVDBtc3hzZjljSGk1Y2NJVVBj?=
 =?utf-8?B?MjdjVGQ4Z0tWTWZYNGZCMi9qZTZvMTFNbURNUzI4MG5aN01BMGlOY3JyWUxD?=
 =?utf-8?B?YnpEcUxaV0krNEpRbnNRNnQ0U0ZsbnRGeVNDSnJrcElEOVRMd0ZkeVBhSlYr?=
 =?utf-8?B?dmk0SDYvUTBjUnpCb3dhM3NHd1dEdExCQ3lVbk9Jc3ZlM3lCVm9pdDNNSGw4?=
 =?utf-8?B?c1NVOTN2bVdYdWVvbmRURFRWSDBUL2p0ZENTVVB0RU5JN1MxR3MzUWk5NVFx?=
 =?utf-8?B?WDQwT1FkUGtIMUpvODNVUlBTOWFUcHNPNUkwUmpXM0E0REZQMVBHSnNzcFlM?=
 =?utf-8?B?MnlNTFI0VnhLaDhTeG9kUEZCdGxOeExuUjBWRnN4NTlsTzl6ZkRHcGZqK1JU?=
 =?utf-8?B?dlJFSDlzbENOZ3FqU2FGenRuYzArYUtaQjE1bTFRMzVFUGZSYkpWUG0vekth?=
 =?utf-8?B?ODE0VmFXdncwcW05bk85Zktnb0tBYWpab25iRFFNVkpMcmlWMmZLOFRNOVk4?=
 =?utf-8?B?TzV6bkM0V1loTWFFZjIya2M3aFhWdk56b1VodmFpalg5VG1aWGxQcXhsVlky?=
 =?utf-8?B?bDZnbk9vMFQzZlZoc0QyTlAxU1o0UFZJUTdSWFJiSDZWQkI2eSs1cGFoaTZX?=
 =?utf-8?B?dk0wTU1aZDNsazdkWFdBYndHdmZRWDVOUjlkaEVINGRyWFBZRDJmekU0NmVS?=
 =?utf-8?B?MUQrRnZMRjVtVVZhUXV0aHVBcnBzWUQrWFV3a0hqZzRJVHlGcWpMQ1J5ZDFM?=
 =?utf-8?B?M3BGODI1MnJHcWRHMXFhekNzWEFxYVppUVRMVXpTWHVnRHNIZzFjYlhiaE5Y?=
 =?utf-8?B?QmJsN3RVd0lFb21JUTlZc25hN1dSVXVmTkkwM1A4M3d6VXdkc2xHNWRlb05N?=
 =?utf-8?B?cGZuaXdZMWhHYjhwbnIwUWYyNUF5dzNZSE0ycVo2UURMVm1jcGJnd3RYQWFC?=
 =?utf-8?B?TklMY3g1eHhtMzVGaWw5U0pNRXdRc2JuWXFvV2MxVlFYbnpQeXFBNkVCc3Jr?=
 =?utf-8?B?UFdNL3dVRXpyTzM3dnhSQzJ4Wm5NYkFEbzViOFhBUnVqeXBxaEY0ZFlFQWJU?=
 =?utf-8?B?L2pML1hCdEVHRUZVWlBtNk4rWVdhQW8wV1pINHlHVytWbUhsZWtKZnk5RlFk?=
 =?utf-8?Q?+v7qrgTem3I+yTbusgEj50sYq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d2e004-899f-48b3-229f-08dbe035dd2d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 08:36:55.5072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KHRr1mu4A0O4ni/db0o86Q8wFUypRDp0yeSivrTh1QWZC2osre8cfx5D4VNnEPJv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8985
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

Am 07.11.23 um 20:45 schrieb Rajneesh Bhardwaj:
> When a TTM BO is getting freed, to optimize the clearing operation on
> the workqueue, schedule it closer to a NUMA node where the memory was
> allocated. This avoids the cases where the ttm_bo_delayed_delete gets
> scheduled on the CPU cores that are across interconnect boundaries such
> as xGMI, PCIe etc.

This needs more background and doesn't mention that we now try to 
allocate the memory close to the device.

Something like this here should work:

Try to allocate system memory on the NUMA node the device is closest to 
and try to run delayed delete workers on a CPU of this node as well.

The background of running the delayed delete worker on a NUMA node close 
to the one of the initial allocation is that the memory might be cleared 
on free by the core memory management and that should probably be done 
on a CPU close to it.

>
> This change helps USWC GTT allocations on NUMA systems (dGPU) and AMD
> APU platforms such as GFXIP9.4.3.
>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
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
> +			/* Schedule the worker on the closest NUMA node,

>   if no
> +			 * CPUs are available, this falls back to any CPU core
> +			 * available system wide.

Mentioning that is superfluous since everybody can look at the 
implementation and that a fallback is available for a function which 
doesn't return an error is obvious.

>   This helps avoid the
> +			 * bottleneck to clear memory in cases where the worker
> +			 * is scheduled on a CPU which is remote to the node
> +			 * where the memory is getting freed.
> +			 */

Rather write something like "This improves performance since system 
memory might be cleared on free and that is best done on a CPU core 
close to it."

Regards,
Christian.

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

