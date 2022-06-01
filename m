Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E771C539EEB
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 10:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B9F113133;
	Wed,  1 Jun 2022 08:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A74E113133
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 08:02:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYbYOLeHutiOswhMwXm/YFn+SZTHPnI2nCjWnTOBW8WaK0djZnkm4mcyBrGInWy4lZDUA7bjuA7J8F6O4luvAT07tMQDCeIVgUYlZuEThu+KRDMXqQ7Q7zc/0+FIT6U8F2iLaOu+dqwHkIfcTSqACNP9ed1btUfguVbhLwSzCIJcQrRzhG0zRrsYdNPOt7G79pBwNAfkrmcYs/JEVHYTHWwpcTrSN5Ald2F0gpkh7RTkrZj7IO3uBJVMBnIPEdHPy0Ue4V8TOn0s75uCeP+aS3CdypZVmzgmXvHAfxjWS4meXEkYyKnq6lzCMDOuoGWHbkBumfds0xmi+ctDE7zWqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sn8G/wzC9J33aIyxbex7XiYUuysiTXWpeAmoFaReuII=;
 b=KqOLCnWn8a8/6FCVq7fn5BDlnZ06hruxv24ccS0pOi/q7bO0fX3FruXAAVzpcKrAuMTb/7hybCUhaHLTUI8qNX58LbEFX3ljJFJ0fjmrBiudM0z+cwJQcU5aeKpHOyxizze+rlWDmpJHcz/tI5wT1NiRlTgqeOPY4Uyy+OYhB7C5SbO5hfV9jaR7NCXuREJ9Gmh0EI1fliwfF+wxQDaJ7kUMmbWZocCEgwFPE8vHOa+hz8J+Wbk8t6VKsbtWw/tyN2dwf766v7fddyw1lAE2i5rzT4fNzOiGFt4R6ggsCxC73wrEpbVpnaptC3JDox+6uAwE76cd0iGsTTjoC9oRJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sn8G/wzC9J33aIyxbex7XiYUuysiTXWpeAmoFaReuII=;
 b=frtBDy0IvC6wWDss0zIGfJ67E29iMNdcTHyCbD1B3bo27s9ueQKUD8D+dYHRtQue9xQpbvMlHOx5CFASDgrHAbXKkuCrXn5/SyGHyoi5jedC5Fab8qIOgUzjn+zk1WfXV3E7T2ljyUn02lFS3HRrc2US9SAPpwOoQGJEtETs5Tg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY5PR12MB6323.namprd12.prod.outlook.com (2603:10b6:930:20::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 1 Jun
 2022 08:02:29 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5314.013; Wed, 1 Jun 2022
 08:02:29 +0000
Message-ID: <a5078937-a4d1-eaeb-af1b-de0482c2c78e@amd.com>
Date: Wed, 1 Jun 2022 10:02:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 1/5] drm/ttm: Refactor num_shared into usage.
Content-Language: en-US
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 dri-devel@lists.freedesktop.org
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
 <20220601004014.158247-2-bas@basnieuwenhuizen.nl>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220601004014.158247-2-bas@basnieuwenhuizen.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0009.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce8fd5af-1745-453a-4ee2-08da43a512da
X-MS-TrafficTypeDiagnostic: CY5PR12MB6323:EE_
X-Microsoft-Antispam-PRVS: <CY5PR12MB63236D0E0CED3FDE097294A383DF9@CY5PR12MB6323.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kJX+0Sk/E3UwS5gax9dd/Ze+efkjC7L1WHorEyy4m2ZoUusYMeuSN50fx8Dgq+uk6xOBGgWSFSos96r1aMR9RkWuWLLVjQQ2A0nUlP854+DMHislq5FqSRls0HZY1lnR52ao+wV8xkMa6/VaPPpT2ppxUA9iiQuVASQeiYi+jge++q03ywUaVV5io+4Al0c8un2rXGCQEv2PechisrvsT/ldNVxlOOpOaTub0XM1RHsorAdz/Hm13m8pIcDAI0MC1jPTWxy2+mbAWAnKRT2esmICBnpCawneudNGxXKRxvLzR974syS0lusZPVHn1PoJ9Ple0dSPMWhSfdSxIaL4eZbtYVMLJTUd4jq29GCcvcaHScy4wkwsE5LoB0Icr/TCx6P/bZBtNH4J3M2AnvxQJr4fBBIcIk+5MfpSuNUsx/3UUHkRVdtxMmMenSnXAdZ+1q2GNeLECDMMMZBxbpqhwBY+z0EpGcRnkQovgFVFtA/epd/L4ajGp8EUjKYDsAljjL++7qTRgaRBhGz+m/PRZxxC9uUOGn2gTc3V6My2MSYH8VpZxRqikMn83IvRbxvc7v26fdcNeALyDEQ6KeHEtkwqHeYxjTekVZRm8+Gi49U3cO5++x57W/XRgGffeglXh74Zp6UJtq6KtLfwyz1/FiNGj1jJV2TE2HqvIwyyT0IIHyXovL6o/SKBbyqXWace1mzByVVkAbJ5/0mi29IHel/ImlxSHWzKukgs/x0V57kK1bnBK8rKaXjAIVGyEboj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(316002)(83380400001)(8676002)(66476007)(8936002)(4326008)(38100700002)(26005)(66946007)(66556008)(2906002)(5660300002)(30864003)(6506007)(6486002)(508600001)(6666004)(31686004)(186003)(36756003)(86362001)(31696002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2twbUZibGlrQ2plRjVLZVNTWjRoOC9PNkFYMktQS2dHbGlDTzdyU2M0T3RL?=
 =?utf-8?B?ZUZ6OUxUVU9sRFkvMnl2cThNK09EL0Ewam5XU3pCUm9KT24zZVlhR0Y0RnNI?=
 =?utf-8?B?NjdCQTlzemxIcWhkK21pN1dzc25XSUxNT2p4YXFoeTROQndKa2ZYbWNoRHU4?=
 =?utf-8?B?U1VYQnI0UWRRRjVPdWx3SjN1RmgvMkFvMGExMGtlM3J2cTE5NVEwZ2czNkZQ?=
 =?utf-8?B?VEJkQW42SjhpdVhseXNKSyt0SGIvc1BOWEJFemRQV01obXo3ZG9TRlhxdmsy?=
 =?utf-8?B?b2lMRmVManBtWEdGNStpL3ZyT2JmaUtnNVdLeXhRTDdyTUc5VWlEdFFKL253?=
 =?utf-8?B?cUUwdGxyMDcyQTYwSFBpcGV2WUs1bjVQMHpiTkR4OHNweEJjWXpubWd5dzhr?=
 =?utf-8?B?L3FmNXV4emFOZndYVGFCU2ZoOWExdmRvazg0Q1JqUHhIZW5RdFZNY3lJZERR?=
 =?utf-8?B?b01lOTI3OVZCazFNTWJCWlJBdEVMbXFPUE9Xa0h5TDdRRWU4RDNxODZ3MjY1?=
 =?utf-8?B?bFZKb2ZsRTRKSVB5cWxTditZelg5VWZaNE9KdytlUEp1RDFYWVlnSXdia1M0?=
 =?utf-8?B?QVRjc01ycWlnWjFqR3RkYVcrOVBEcGRadmZWcVpXOWwrRkdSckl4Zyt6cDls?=
 =?utf-8?B?RG9tOWZXQmErelViMnFHRzhNalVoYUE0VUIwdHhIVUQvVkZOV2FqTHY5U3I1?=
 =?utf-8?B?RGI1S2lPNXRFdjN5a0N0ckxza05GZUVqdytNd3kvR1B3RGp3aXVodVg2ZDlQ?=
 =?utf-8?B?c1FaWWJGZlZ0cHF5eGE0ditaY0VqUVVTeGJ1SGNXcEQ0VzRGckdTM2Iwc1dV?=
 =?utf-8?B?TG9CcS9IN0hRbXFFRzdzeWVDc0REeFg1RFd0ZXRKZzduK0dNSDloaS9zTzAz?=
 =?utf-8?B?RTdKMkRGUzZPcXBKdytSWGhYUC8wY2pSckJBdS9OVnBDMit3S0pqNE5mNzA5?=
 =?utf-8?B?K05DeVUwekc4S09ZaktmaW5XMTFpckJZb29Pa0VMYXFPWXBwaEZ6NHRpQk0w?=
 =?utf-8?B?UFlOaVFMZi9EUThaZzlXSFZibk9CZWVFZ0VvZWdlODFBbm5lZTE5NWVuRnNu?=
 =?utf-8?B?TUY1WEQ1SFBhWVBFVWhObkxFTzlFaUlaREZTRGZabDcxRE9RZ2JtRVJWUFc4?=
 =?utf-8?B?Y2lsVEJ3R0dBWndHZnplQk5tU296ZHpxemdFUE9pQlloazRMTjUvNmlLK1Rm?=
 =?utf-8?B?YzYyOGQ1NkdwVDRQOEZRZlY3aW1NaVIwbG9kUXNxNm5XNVFIeVltdytDaHdi?=
 =?utf-8?B?QWlzdmwwaFRFUURDSGhrQTVXYzhTQ2pTb25ObFM5SkFIM3BhclBIRUVTUmFD?=
 =?utf-8?B?RWhnZE5yRTJtUncxcW5hQkdsWjFuZTUrRUM2YUxIR1JYMDVkSHFRcUYwK1RP?=
 =?utf-8?B?VVYvMFBlMy9yTEtwTVEzOHRieC84Q01RVU5GVCtyOFVTY0VjRitPV2loS2s1?=
 =?utf-8?B?eGNWemtGeUYyQ2JnZmo2eW5qYWIrTU94cGN4WHdFUS9adW1peVBkcGtKYzBm?=
 =?utf-8?B?U2RiaW8wUUVtR3RaRTlBZTdDeXZTdVNVazF1RjRWcGFXREVManZoaXhjRTI3?=
 =?utf-8?B?TDhNZGg4QWtuZVpKTVNwcG1MSTJQTGpIZm1TVFRTNVQ1NzhnNWM1VlFvUnE0?=
 =?utf-8?B?V0pWYlVjRjJKdkpHbnNua2dvdGFoMjJkTFk3MVZpbFlHS3JGeEtyTGhYZVEx?=
 =?utf-8?B?KzNyZWRMUEQzdzRnanB4NmZFblV4dEF3ZkNrQnJhMGUyS2ZtQ2Z0eXJIamlp?=
 =?utf-8?B?T1BwYmNNdlBZRHo2TUt3QUppQm92a0toQVRNTnJGQTYyOC9md1ZLWmVRd2JD?=
 =?utf-8?B?TDVwTkszZmlFczZ1dFBXOG5JMkhNVVo3N3pXQ2NWL0wzb1BnbnZObHpXSnFm?=
 =?utf-8?B?TEhmUytkaEVMemRwdXh2OVRFY0RrZDNZRGpNODlpY3RILzF3N2s4b3pvWjhx?=
 =?utf-8?B?TFBLNnFMQXoyWDFFZW5XWUh4dCthSFYvcFV6cWpDWEp1UWdpQmhLRENreFNT?=
 =?utf-8?B?MURIcWkrSVQwYW0rVEJaK3orR3FUa0RVSjNqT2doY3lDTXJlZXB1VGJDZFVK?=
 =?utf-8?B?RHpLeW9HVWRWZzR3TngvSStPdm9BZVlPSndoOUtpemNhKzc5TGNEODgwZUty?=
 =?utf-8?B?ZHpJRlVibkxHbnA4SkkvakwwUmsyd2Q0ZmpjN0pxcEZ2UzAwakFmbklZVDcr?=
 =?utf-8?B?cWE3bVRma2N5OS9ma3FPclQrVWZHc25pc3lkTjNKcWVtTXVPMTNoUWpoTGVO?=
 =?utf-8?B?UnRnSTl1b0dXZmExNC80ZXVaMU45YkhPeGlxSUNrU3RMYk1kd2NSR1BoZzJF?=
 =?utf-8?B?NmNkandJRkNKdUV6SW5BazJtTFpJNndVRHV4SWo1dC83Vktld3ZoUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8fd5af-1745-453a-4ee2-08da43a512da
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 08:02:29.3339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rHuwUd1XeIsfwb3u5D+N2wr1ZABmvXxQOFSsGlIassgkNAhW1fIAqXENG7X4uNfn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6323
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

Am 01.06.22 um 02:40 schrieb Bas Nieuwenhuizen:
> So that the driver can set some BOOKKEEP for explicit sync. Maybe
> some of the existing places would already make sense for that, but
> I targeted this for no functional changes.

Well first of all NAK to that one since it will totally break cases 
which need to reserve more than one fence slot.

Also as discussed with Daniel we don't want to use BOOKKEEP for implicit 
sync. We should instead use READ for that.

BOOKKEEP is for stuff userspace should never be aware of, e.g. like page 
table updates and KFD eviction fences.

Regards,
Christian.

>
> Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 10 +++++-----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c            |  8 +++-----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c           |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c           |  6 +++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c          |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c            |  3 +--
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c              |  2 +-
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
>   drivers/gpu/drm/qxl/qxl_release.c                 |  2 +-
>   drivers/gpu/drm/radeon/radeon_cs.c                |  5 +++--
>   drivers/gpu/drm/radeon/radeon_gem.c               |  2 +-
>   drivers/gpu/drm/radeon/radeon_vm.c                |  4 ++--
>   drivers/gpu/drm/ttm/ttm_execbuf_util.c            |  5 ++---
>   drivers/gpu/drm/vmwgfx/vmwgfx_resource.c          | 10 +++++-----
>   drivers/gpu/drm/vmwgfx/vmwgfx_validation.c        |  2 +-
>   include/drm/ttm/ttm_execbuf_util.h                |  3 ++-
>   16 files changed, 33 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index a4955ef76cfc..a790a089e829 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -774,7 +774,7 @@ static void add_kgd_mem_to_kfd_bo_list(struct kgd_mem *mem,
>   	struct amdgpu_bo *bo = mem->bo;
>   
>   	INIT_LIST_HEAD(&entry->head);
> -	entry->num_shared = 1;
> +	entry->usage = DMA_RESV_USAGE_READ;
>   	entry->bo = &bo->tbo;
>   	mutex_lock(&process_info->lock);
>   	if (userptr)
> @@ -918,7 +918,7 @@ static int reserve_bo_and_vm(struct kgd_mem *mem,
>   
>   	ctx->kfd_bo.priority = 0;
>   	ctx->kfd_bo.tv.bo = &bo->tbo;
> -	ctx->kfd_bo.tv.num_shared = 1;
> +	ctx->kfd_bo.tv.usage = DMA_RESV_USAGE_READ;
>   	list_add(&ctx->kfd_bo.tv.head, &ctx->list);
>   
>   	amdgpu_vm_get_pd_bo(vm, &ctx->list, &ctx->vm_pd[0]);
> @@ -981,7 +981,7 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *mem,
>   
>   	ctx->kfd_bo.priority = 0;
>   	ctx->kfd_bo.tv.bo = &bo->tbo;
> -	ctx->kfd_bo.tv.num_shared = 1;
> +	ctx->kfd_bo.tv.usage = DMA_RESV_USAGE_READ;
>   	list_add(&ctx->kfd_bo.tv.head, &ctx->list);
>   
>   	i = 0;
> @@ -2218,7 +2218,7 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
>   			    validate_list.head) {
>   		list_add_tail(&mem->resv_list.head, &resv_list);
>   		mem->resv_list.bo = mem->validate_list.bo;
> -		mem->resv_list.num_shared = mem->validate_list.num_shared;
> +		mem->resv_list.usage = mem->validate_list.usage;
>   	}
>   
>   	/* Reserve all BOs and page tables for validation */
> @@ -2417,7 +2417,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
>   
>   		list_add_tail(&mem->resv_list.head, &ctx.list);
>   		mem->resv_list.bo = mem->validate_list.bo;
> -		mem->resv_list.num_shared = mem->validate_list.num_shared;
> +		mem->resv_list.usage = mem->validate_list.usage;
>   	}
>   
>   	ret = ttm_eu_reserve_buffers(&ctx.ticket, &ctx.list,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 60ca14afb879..2ae1c0d9d33a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -55,8 +55,7 @@ static int amdgpu_cs_user_fence_chunk(struct amdgpu_cs_parser *p,
>   	bo = amdgpu_bo_ref(gem_to_amdgpu_bo(gobj));
>   	p->uf_entry.priority = 0;
>   	p->uf_entry.tv.bo = &bo->tbo;
> -	/* One for TTM and two for the CS job */
> -	p->uf_entry.tv.num_shared = 3;
> +	p->uf_entry.tv.usage = DMA_RESV_USAGE_READ;
>   
>   	drm_gem_object_put(gobj);
>   
> @@ -519,9 +518,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>   			return r;
>   	}
>   
> -	/* One for TTM and one for the CS job */
>   	amdgpu_bo_list_for_each_entry(e, p->bo_list)
> -		e->tv.num_shared = 2;
> +		e->tv.usage = DMA_RESV_USAGE_READ;
>   
>   	amdgpu_bo_list_get_list(p->bo_list, &p->validated);
>   
> @@ -1261,7 +1259,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>   
>   	/* Make sure all BOs are remembered as writers */
>   	amdgpu_bo_list_for_each_entry(e, p->bo_list)
> -		e->tv.num_shared = 0;
> +		e->tv.usage = DMA_RESV_USAGE_WRITE;
>   
>   	ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
>   	mutex_unlock(&p->adev->notifier_lock);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
> index c6d4d41c4393..71277257d94d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
> @@ -74,7 +74,7 @@ int amdgpu_map_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   	INIT_LIST_HEAD(&list);
>   	INIT_LIST_HEAD(&csa_tv.head);
>   	csa_tv.bo = &bo->tbo;
> -	csa_tv.num_shared = 1;
> +	csa_tv.usage = DMA_RESV_USAGE_READ;
>   
>   	list_add(&csa_tv.head, &list);
>   	amdgpu_vm_get_pd_bo(vm, &list, &pd);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index 84a53758e18e..7483411229f4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -207,7 +207,7 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
>   	INIT_LIST_HEAD(&duplicates);
>   
>   	tv.bo = &bo->tbo;
> -	tv.num_shared = 2;
> +	tv.usage = DMA_RESV_USAGE_READ;
>   	list_add(&tv.head, &list);
>   
>   	amdgpu_vm_get_pd_bo(vm, &list, &vm_pd);
> @@ -731,9 +731,9 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
>   		abo = gem_to_amdgpu_bo(gobj);
>   		tv.bo = &abo->tbo;
>   		if (abo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID)
> -			tv.num_shared = 1;
> +			tv.usage = DMA_RESV_USAGE_READ;
>   		else
> -			tv.num_shared = 0;
> +			tv.usage = DMA_RESV_USAGE_WRITE;
>   		list_add(&tv.head, &list);
>   	} else {
>   		gobj = NULL;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> index 5224d9a39737..f670d8473993 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> @@ -319,7 +319,7 @@ static int amdgpu_vkms_prepare_fb(struct drm_plane *plane,
>   	INIT_LIST_HEAD(&list);
>   
>   	tv.bo = &rbo->tbo;
> -	tv.num_shared = 1;
> +	tv.usage = DMA_RESV_USAGE_READ;
>   	list_add(&tv.head, &list);
>   
>   	r = ttm_eu_reserve_buffers(&ticket, &list, false, NULL);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 15184153e2b9..515be19ab279 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -633,8 +633,7 @@ void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
>   {
>   	entry->priority = 0;
>   	entry->tv.bo = &vm->root.bo->tbo;
> -	/* Two for VM updates, one for TTM and one for the CS job */
> -	entry->tv.num_shared = 4;
> +	entry->tv.usage = DMA_RESV_USAGE_READ;
>   	entry->user_pages = NULL;
>   	list_add(&entry->tv.head, validated);
>   }
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index b3fc3e958227..af844b636778 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -1395,7 +1395,7 @@ static int svm_range_reserve_bos(struct svm_validate_context *ctx)
>   		vm = drm_priv_to_vm(pdd->drm_priv);
>   
>   		ctx->tv[gpuidx].bo = &vm->root.bo->tbo;
> -		ctx->tv[gpuidx].num_shared = 4;
> +		ctx->tv[gpuidx].usage = DMA_RESV_USAGE_READ;
>   		list_add(&ctx->tv[gpuidx].head, &ctx->validate_list);
>   	}
>   
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 73423b805b54..851b7844b084 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7601,7 +7601,7 @@ static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
>   	INIT_LIST_HEAD(&list);
>   
>   	tv.bo = &rbo->tbo;
> -	tv.num_shared = 1;
> +	tv.usage = DMA_RESV_USAGE_READ;
>   	list_add(&tv.head, &list);
>   
>   	r = ttm_eu_reserve_buffers(&ticket, &list, false, NULL);
> diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
> index 368d26da0d6a..689e35192070 100644
> --- a/drivers/gpu/drm/qxl/qxl_release.c
> +++ b/drivers/gpu/drm/qxl/qxl_release.c
> @@ -183,7 +183,7 @@ int qxl_release_list_add(struct qxl_release *release, struct qxl_bo *bo)
>   
>   	qxl_bo_ref(bo);
>   	entry->tv.bo = &bo->tbo;
> -	entry->tv.num_shared = 0;
> +	entry->tv.usage = DMA_RESV_USAGE_WRITE;
>   	list_add_tail(&entry->tv.head, &release->bos);
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
> index 446f7bae54c4..30afe0c62dd9 100644
> --- a/drivers/gpu/drm/radeon/radeon_cs.c
> +++ b/drivers/gpu/drm/radeon/radeon_cs.c
> @@ -183,7 +183,8 @@ static int radeon_cs_parser_relocs(struct radeon_cs_parser *p)
>   		}
>   
>   		p->relocs[i].tv.bo = &p->relocs[i].robj->tbo;
> -		p->relocs[i].tv.num_shared = !r->write_domain;
> +		p->relocs[i].tv.usage =
> +			r->write_domain ? DMA_RESV_USAGE_WRITE : DMA_RESV_USAGE_READ;
>   
>   		radeon_cs_buckets_add(&buckets, &p->relocs[i].tv.head,
>   				      priority);
> @@ -258,7 +259,7 @@ static int radeon_cs_sync_rings(struct radeon_cs_parser *p)
>   
>   		resv = reloc->robj->tbo.base.resv;
>   		r = radeon_sync_resv(p->rdev, &p->ib.sync, resv,
> -				     reloc->tv.num_shared);
> +				     reloc->tv.usage != DMA_RESV_USAGE_WRITE);
>   		if (r)
>   			return r;
>   	}
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> index 8c01a7f0e027..eae47c709f5d 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -635,7 +635,7 @@ static void radeon_gem_va_update_vm(struct radeon_device *rdev,
>   	INIT_LIST_HEAD(&list);
>   
>   	tv.bo = &bo_va->bo->tbo;
> -	tv.num_shared = 1;
> +	tv.usage = DMA_RESV_USAGE_READ;
>   	list_add(&tv.head, &list);
>   
>   	vm_bos = radeon_vm_get_bos(rdev, bo_va->vm, &list);
> diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
> index 987cabbf1318..702627b48dae 100644
> --- a/drivers/gpu/drm/radeon/radeon_vm.c
> +++ b/drivers/gpu/drm/radeon/radeon_vm.c
> @@ -143,7 +143,7 @@ struct radeon_bo_list *radeon_vm_get_bos(struct radeon_device *rdev,
>   	list[0].preferred_domains = RADEON_GEM_DOMAIN_VRAM;
>   	list[0].allowed_domains = RADEON_GEM_DOMAIN_VRAM;
>   	list[0].tv.bo = &vm->page_directory->tbo;
> -	list[0].tv.num_shared = 1;
> +	list[0].tv.usage = DMA_RESV_USAGE_READ;
>   	list[0].tiling_flags = 0;
>   	list_add(&list[0].tv.head, head);
>   
> @@ -155,7 +155,7 @@ struct radeon_bo_list *radeon_vm_get_bos(struct radeon_device *rdev,
>   		list[idx].preferred_domains = RADEON_GEM_DOMAIN_VRAM;
>   		list[idx].allowed_domains = RADEON_GEM_DOMAIN_VRAM;
>   		list[idx].tv.bo = &list[idx].robj->tbo;
> -		list[idx].tv.num_shared = 1;
> +		list[idx].tv.usage = DMA_RESV_USAGE_READ;
>   		list[idx].tiling_flags = 0;
>   		list_add(&list[idx++].tv.head, head);
>   	}
> diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> index 0eb995d25df1..c39d8e5ac271 100644
> --- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> @@ -101,7 +101,7 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
>   			continue;
>   		}
>   
> -		num_fences = min(entry->num_shared, 1u);
> +		num_fences = entry->usage <= DMA_RESV_USAGE_WRITE ? 0u : 1u;
>   		if (!ret) {
>   			ret = dma_resv_reserve_fences(bo->base.resv,
>   						      num_fences);
> @@ -154,8 +154,7 @@ void ttm_eu_fence_buffer_objects(struct ww_acquire_ctx *ticket,
>   	list_for_each_entry(entry, list, head) {
>   		struct ttm_buffer_object *bo = entry->bo;
>   
> -		dma_resv_add_fence(bo->base.resv, fence, entry->num_shared ?
> -				   DMA_RESV_USAGE_READ : DMA_RESV_USAGE_WRITE);
> +		dma_resv_add_fence(bo->base.resv, fence, entry->usage);
>   		ttm_bo_move_to_lru_tail_unlocked(bo);
>   		dma_resv_unlock(bo->base.resv);
>   	}
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> index c6d02c98a19a..58dfff7d6c76 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> @@ -130,7 +130,7 @@ static void vmw_resource_release(struct kref *kref)
>   			struct ttm_validate_buffer val_buf;
>   
>   			val_buf.bo = bo;
> -			val_buf.num_shared = 0;
> +			val_buf.usage = DMA_RESV_USAGE_WRITE;
>   			res->func->unbind(res, false, &val_buf);
>   		}
>   		res->backup_dirty = false;
> @@ -552,7 +552,7 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
>   	INIT_LIST_HEAD(&val_list);
>   	ttm_bo_get(&res->backup->base);
>   	val_buf->bo = &res->backup->base;
> -	val_buf->num_shared = 0;
> +	val_buf->usage = DMA_RESV_USAGE_WRITE;
>   	list_add_tail(&val_buf->head, &val_list);
>   	ret = ttm_eu_reserve_buffers(ticket, &val_list, interruptible, NULL);
>   	if (unlikely(ret != 0))
> @@ -657,7 +657,7 @@ static int vmw_resource_do_evict(struct ww_acquire_ctx *ticket,
>   	BUG_ON(!func->may_evict);
>   
>   	val_buf.bo = NULL;
> -	val_buf.num_shared = 0;
> +	val_buf.usage = DMA_RESV_USAGE_WRITE;
>   	ret = vmw_resource_check_buffer(ticket, res, interruptible, &val_buf);
>   	if (unlikely(ret != 0))
>   		return ret;
> @@ -708,7 +708,7 @@ int vmw_resource_validate(struct vmw_resource *res, bool intr,
>   		return 0;
>   
>   	val_buf.bo = NULL;
> -	val_buf.num_shared = 0;
> +	val_buf.usage = DMA_RESV_USAGE_WRITE;
>   	if (res->backup)
>   		val_buf.bo = &res->backup->base;
>   	do {
> @@ -777,7 +777,7 @@ void vmw_resource_unbind_list(struct vmw_buffer_object *vbo)
>   {
>   	struct ttm_validate_buffer val_buf = {
>   		.bo = &vbo->base,
> -		.num_shared = 0
> +		.usage = DMA_RESV_USAGE_WRITE
>   	};
>   
>   	dma_resv_assert_held(vbo->base.base.resv);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> index f46891012be3..0476ba498321 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
> @@ -288,7 +288,7 @@ int vmw_validation_add_bo(struct vmw_validation_context *ctx,
>   		val_buf->bo = ttm_bo_get_unless_zero(&vbo->base);
>   		if (!val_buf->bo)
>   			return -ESRCH;
> -		val_buf->num_shared = 0;
> +		val_buf->usage = DMA_RESV_USAGE_WRITE;
>   		list_add_tail(&val_buf->head, &ctx->bo_list);
>   		bo_node->as_mob = as_mob;
>   		bo_node->cpu_blit = cpu_blit;
> diff --git a/include/drm/ttm/ttm_execbuf_util.h b/include/drm/ttm/ttm_execbuf_util.h
> index a99d7fdf2964..851961a06c27 100644
> --- a/include/drm/ttm/ttm_execbuf_util.h
> +++ b/include/drm/ttm/ttm_execbuf_util.h
> @@ -31,6 +31,7 @@
>   #ifndef _TTM_EXECBUF_UTIL_H_
>   #define _TTM_EXECBUF_UTIL_H_
>   
> +#include <linux/dma-resv.h>
>   #include <linux/list.h>
>   
>   #include "ttm_bo_api.h"
> @@ -46,7 +47,7 @@
>   struct ttm_validate_buffer {
>   	struct list_head head;
>   	struct ttm_buffer_object *bo;
> -	unsigned int num_shared;
> +	enum dma_resv_usage usage;
>   };
>   
>   /**

