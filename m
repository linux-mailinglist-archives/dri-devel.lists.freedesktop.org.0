Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6B76A978D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 13:50:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E0610E5BB;
	Fri,  3 Mar 2023 12:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2069.outbound.protection.outlook.com [40.107.100.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1F110E5BB;
 Fri,  3 Mar 2023 12:50:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmY+ah/5Fjihe5ElpyhsbEELQ82/7zwVfNn8oC8aC/CpwKbwDW5wjY5miKWUdpSQSmNzSCQGDqoDM8a7UzwI2uwVs6YizFTmRpgXqVw51mE9nFQ6Cn8NuLQq2e0znNrS9/Lt1MXvMzKDu0jew40T1RhOOZT8IUuYFeB5ZFXV1e0XHxdzc8sxdhXmESVqhh+GCrwV6UvUJ3elsEAOE2GWGhQmnPS3ixbOzekIoXn4gU1E9/V93KyYlMbbrLkdUGL/4QdAdvqWZRt1yCZwu5X3BdfH2k0lUbMRWzxF2o1Ux5ONVQPr781m4MxoAjx7OAVBCHn5W9iPuv1fSTZzu7LqWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2481GQ/du3bmRlSkrFsJmMFN50fOJFxZW0MHt1sVXU=;
 b=PeDjIB0M4A4RVJrWOS5Pspnoipmma5fvcxQilY5ykuUiHkK7kEY85CjaZqEZSGHSeuxgkUSEO1yj31YrxqV7pltjqv4FbVRst5nuwmU/tzYmwmDRLvL6ZsiG5g0vyt4afpwkHFwrdbxzd3pKaRh6XbZeCQ3zGj20A71PSYpKe9U0z8B0XjvUYbVx4bmqPz3K/xduLQW4Dl8G6mquyvu5+LkrzhW8PJ2xjK7D0cK09XQgN4Myg/qMJdSut4ySjqcAAqXVs1tAh+FtMnLv4a3BRd4cwHE+IPz5C5/n8n+CXjIV8OlgHm7s8fOm1J5KsHkfasYTHO9pcqGggSNlDTAx2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2481GQ/du3bmRlSkrFsJmMFN50fOJFxZW0MHt1sVXU=;
 b=YxsOOPdPm6Y9sScZITVS21UU9IT3YhCCZuhjyUEshpUOechwvzkatfmSnXNARLzMgJy8ud2iRzU0i0s1ptEBGuyNqZybc7haoRwRNopflaRIvAgfz8HcF3mNGWaPYOP2M3xeotPq05AYID2YP+er9PHCsIoH0m5EplOLRpcfAQI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4353.namprd12.prod.outlook.com (2603:10b6:5:2a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Fri, 3 Mar
 2023 12:50:35 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6156.022; Fri, 3 Mar 2023
 12:50:35 +0000
Message-ID: <5eb593b8-3cd3-af93-d1ce-59fea6b879b9@amd.com>
Date: Fri, 3 Mar 2023 13:50:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/amdgpu: Implement mmap of imported dma-bufs
Content-Language: en-US
To: Marek Maslanka <mmaslanka@chromium.org>, dri-devel@lists.freedesktop.org, 
 Daniel Vetter <daniel@ffwll.ch>
References: <20230303110951.3777850-1-mmaslanka@chromium.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230303110951.3777850-1-mmaslanka@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4353:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d200b2a-c4b3-4de0-b5cd-08db1be5e14d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s72eyISqmY0e6JIzafAP+otT6V2Ikw9Qgqq/1hP8nIWFR6GGQZ1KcinckHEwbSGenMqsjRtli3D7yr6fvQdX+M2ifhnyc+iGP6qcov9b/QZF4JAnmtk67r4nURf4I0YsChRtjUYgjcYbIht2drf3OkPDyfQvJq5VvRWdA4IeX+vq6ILjdzCELuMBYgeI6wQhq/04dkcRyhDPm8UZ0C4Ic6ZQBj7h8Q1eyaBZP0euXuk7QcFfAFecO87DHt/RNFflZHcdP2W7iN3tcvnax2nDgf/wBTgIIU88ADCSWX2+bRxhUtGsVpRpkkoJux8JUV3ujNs1OOba+dgW5GC/xHz5weASuHkaRykXzcytjytO3vywJtQ3Ita5BiaJ7FVcOiiAn9BYLiJxPvrnF9k4Kb7nA9QigNSmZheUbgN1u3PVo1tb7KEKmjsQDTnibMeaG3Bz6aKh+ytygRGwAlWtK4FSJYugswkdMjdk7UB5bMO043g5cF9kFnkdbrqcgXvTNU0pq4YPoAWHmBkp9dNXVw72vouajlCaWI74QUl3Q8Se/JrY/WbnlBc0SdeYohaZHWtJap/6MWqctQBG6pP7o+q/c8XWJ9lczrpFn2Z1PI1FD2unRXzA7FZbc78eGLOtrlygs4c0bR4H/5mczhxauu+nSxNRxMXMsqBrl1edziDGmfxfCdc8Z+/7gEjWY342VPbRCLjV6J0l1hXvUg//KHBZQo4oskoZB9sn8l1ydU5vyn8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(451199018)(83380400001)(31686004)(38100700002)(6666004)(31696002)(36756003)(5660300002)(8936002)(478600001)(7416002)(66556008)(86362001)(186003)(6506007)(2616005)(6512007)(6486002)(8676002)(66476007)(2906002)(66946007)(316002)(41300700001)(54906003)(110136005)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3RTeVNkYjZhSko1QkRJMkNqZEFqUURiSkRpZU1oR0pGUytFdjk1bnA1Z2pR?=
 =?utf-8?B?MUxYSzZkTHA3WDd1SDdzTUsyaXVKNnh5SWdHcG5jRU51a2h2UFdHY0dxWVd0?=
 =?utf-8?B?VDYzSTA5WGMwaGFHa0xkRjV5Wk1ITWpKL2krYXhsOVR3dXIvMGt4UktWQlB6?=
 =?utf-8?B?dTJEVHdyZEplTCt1WHl6UWVLOTBBUUhqbDZHY1dGUWczSmhkWVVOZWluSjRl?=
 =?utf-8?B?a08wZmZWaFlhTkQ1Y05zNWx1MnhmdHM2bVpxazc1UHU0VHlsbm05UkhBOU5T?=
 =?utf-8?B?dkRsZndCcW1EUXdSNzNNODVrdTVlUE43UHhUS0Mzbm5BY09ZcHh3clNvWHRR?=
 =?utf-8?B?TnhSbU45ejNjMkh1Qi95bjFacnRqM1czNlhWMy9VeW1TZEpuNXJySXVEQlha?=
 =?utf-8?B?RHpkalJ4ek8zQmN4L0Z5MkFHSi9VVWNrKzFickZyR0JOeFpRYXRLUmhLUzE4?=
 =?utf-8?B?M1BpR3BCWndvcmxwY25MMk9ncHBLdWlXUThiVGNDcVBzZlp6NThxd2xBZUJQ?=
 =?utf-8?B?ZE9kU0pIMUdlUW40RmFqTWFYZHFYdzE2dUVyVXJxVDdEbEF5WGxLSjFJWmtW?=
 =?utf-8?B?V1R3aGxLRTVnUHp0TjVEMGFJdXVaU1pzbzJIRTRRdEhLNWRsUVRqT1pFOTRN?=
 =?utf-8?B?M2wxWmlMVFJRMDRvTndTNldLdXVpMEpCek9UWDZQNERNMkxhNnNEeS92NWNI?=
 =?utf-8?B?b3RrVFV4UEg5a1pMZmMvVEdMdVUzckx6d2lXNTk1TUZRNGhzQ2d0bUxENENh?=
 =?utf-8?B?MzhYWnozbmFyVjJHK3BVZ1NaZi9aT21qbVlXbElXTyt4bERCbUEwS3BEdXJr?=
 =?utf-8?B?cE5leVhOYXgxNStFQXFWZW0zQ0JTSGtkRjJCN0lDN25FRWNuVWFQdHQ4Y0dm?=
 =?utf-8?B?cG9mejdaTTJTT3dmbkVGYU9mOEYydTF1QlZYUmZrSWhsUGx2cTVMTTZlb3Vj?=
 =?utf-8?B?c0VKc2phdDVQcVFHTDQ1WVByazRZOEZFWGF5Tjk0UUVvUDhtdno4eUQzZDFi?=
 =?utf-8?B?dDU3QXFjRlU0aXN4L2t6WTBaQUMvWkFFTm1yNVlwbVpFdjRrQzJtNnNKQ2VG?=
 =?utf-8?B?OU1XN01mZWhoc1lPVW5DeXFVdmNaRWxVL2dDeCsyV3dnd3V2N0VOZC9uRktk?=
 =?utf-8?B?R0ZOdDNxeVNFOGRtblFteUNrVkNBS3I3eWhtdlhlMW4zQXZwcVExYmJBYURE?=
 =?utf-8?B?RTRXME1zU1N5T2RGZ21SZEVjTmtMaUZheUg2Ym5SdG5uTGo4MDRMRWlmbksr?=
 =?utf-8?B?aE1VNEY2TEVMaThudC9lU2p6VHJvalRPMjNHVytOdVpCSC9tQlkyQlA1OHlM?=
 =?utf-8?B?RTVMZE9PMVRCK1lVLzB0NWl6ckR2S3gyc1IvOHZXbi9LRVh6elA1ZjJqTnhG?=
 =?utf-8?B?OGZ0N09iaSt6a2ttWllJY2ZzMEFhcU1Ja2J4TURsSnhlTTdvdmVKMGR5Qjhh?=
 =?utf-8?B?Ry8zQW9EN1Z1TVYrL1U1bG5yMWV6cE1iazhIZUZEa2xnT0t5R2xrd2RVZTV3?=
 =?utf-8?B?R0tNTmw5aEhzdDMvckVCS3E1ZnVyeEdEdFlsbHF2RmIvbmpLVU5jc3BkRStT?=
 =?utf-8?B?MzArNWdTTUFQQWJBTUlNdjkrY0MxNnB4dDZQbUlBNGNEUlJvRlk4cXF6TEY2?=
 =?utf-8?B?a2tBMGhrL0lna05QZW9jS1Y4YnRjTFY5RExnbnBUSlk3azhrNjhaRUVibFNu?=
 =?utf-8?B?RndmT0RCbGNnTzEzbW9GcXhsYjJwWnd1SHl6cllrbHVJSENQNkE0Z3AzL0t4?=
 =?utf-8?B?WHVMYUVKOE5CQ3dKS2FscUlqWXErQjNYNUlBT1pNeWo4TUdrVG03TzFhcTNs?=
 =?utf-8?B?Y3VlUEYrK0NOWWpBbXZnWXRORERpWlFGa2pjZGRnZTEwUHZockJTcmduY1dw?=
 =?utf-8?B?NmJVbjVtckpubVRHaHNnNjJEUTNoWWhnU3d3VUoyajhnUnlFWHBWOGVlaFlR?=
 =?utf-8?B?MVpHQnNjeXN5VVJ5T1RaSkJWL25rZ0ViUjNhLzFLMWZtdlI1bGVLMjFSQ3Q5?=
 =?utf-8?B?QkZ5Y2g4NEhRRFBkYWF6N3lNSThPS0I0eGdiNXBVaFU2eXZxWGpKMjlEc0hh?=
 =?utf-8?B?U2UzbndvQ0JROHFSa21PS0M2OG5qbjExb3BDV2NxdmcxbTk3dVlxa2dxeTVV?=
 =?utf-8?B?UFpnSnNkM2p6cHBhMTlvZHgxaDdsK0tUNGdiWkpUZUU3ajE4NEM2eW1OK280?=
 =?utf-8?Q?L2AEAFxg+2OqdmZ9NrFj3mXeaYUat/2SPot16sKiCNob?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d200b2a-c4b3-4de0-b5cd-08db1be5e14d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 12:50:34.7609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: smY8mp08iZj1zoUlsXQj2tRWIM7sn4PeRWMCfbV34pQsYFWc75jn49JNJU2smSWO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4353
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
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Tong Liu01 <Tong.Liu01@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Guchun Chen <guchun.chen@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Dominik Behr <dbehr@chromium.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Marek Maslanka <mm@semihalf.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <mdaenzer@redhat.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Well big NAK to this!

We have discussed this extensively on the mailing list and absolutely 
don't want to allow that.

Only for some ARM drivers we failed to block that soon enough and will 
keep the functionality around to not break userspace.

Regards,
Christian.

Am 03.03.23 um 12:09 schrieb Marek Maslanka:
> Use dmabuf mmap from exporting driver to do the mapping.
>
> Signed-off-by: Marek Maslanka <mmaslanka@chromium.org>
> Signed-off-by: Dominik Behr <dbehr@chromium.org>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 46 +++++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h |  2 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     |  9 ++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  1 +
>   5 files changed, 59 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index 0c001bb8fc2b..8f22d29ba077 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -37,6 +37,7 @@
>   #include "amdgpu_dma_buf.h"
>   #include "amdgpu_xgmi.h"
>   #include <drm/amdgpu_drm.h>
> +#include <drm/drm_drv.h>
>   #include <drm/ttm/ttm_tt.h>
>   #include <linux/dma-buf.h>
>   #include <linux/dma-fence-array.h>
> @@ -275,6 +276,51 @@ const struct dma_buf_ops amdgpu_dmabuf_ops = {
>   	.vunmap = drm_gem_dmabuf_vunmap,
>   };
>   
> +int amdgpu_try_dma_buf_mmap(struct file *filp, struct vm_area_struct *vma)
> +{
> +	struct drm_file *priv = filp->private_data;
> +	struct drm_device *dev = priv->minor->dev;
> +	struct amdgpu_device *adev = drm_to_adev(dev);
> +	struct ttm_device *bdev = &adev->mman.bdev;
> +	struct ttm_buffer_object *tbo = NULL;
> +	struct amdgpu_bo *bo = NULL;
> +	struct drm_gem_object *obj = NULL;
> +	struct drm_vma_offset_node *node;
> +	int ret;
> +
> +	if (drm_dev_is_unplugged(dev))
> +		return -ENODEV;
> +
> +	drm_vma_offset_lock_lookup(bdev->vma_manager);
> +	node = drm_vma_offset_exact_lookup_locked(bdev->vma_manager,
> +						  vma->vm_pgoff,
> +						  vma_pages(vma));
> +
> +	if (likely(node)) {
> +		tbo = container_of(node, struct ttm_buffer_object,
> +				   base.vma_node);
> +		tbo = ttm_bo_get_unless_zero(tbo);
> +	}
> +	drm_vma_offset_unlock_lookup(bdev->vma_manager);
> +
> +	if (!tbo)
> +		return -EINVAL;
> +
> +	bo = ttm_to_amdgpu_bo(tbo);
> +	obj = &tbo->base;
> +
> +	if (!obj->import_attach) {
> +		ret = -EINVAL;
> +		goto done;
> +	}
> +
> +	ret = dma_buf_mmap(obj->import_attach->dmabuf, vma, 0);
> +
> +done:
> +	ttm_bo_put(tbo);
> +	return ret;
> +}
> +
>   /**
>    * amdgpu_gem_prime_export - &drm_driver.gem_prime_export implementation
>    * @gobj: GEM BO
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h
> index 3e93b9b407a9..ecf1dc32eec4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h
> @@ -25,6 +25,8 @@
>   
>   #include <drm/drm_gem.h>
>   
> +int amdgpu_try_dma_buf_mmap(struct file *filp, struct vm_area_struct *vma);
> +
>   struct dma_buf *amdgpu_gem_prime_export(struct drm_gem_object *gobj,
>   					int flags);
>   struct drm_gem_object *amdgpu_gem_prime_import(struct drm_device *dev,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 86fbb4138285..91e94342d48e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2737,7 +2737,7 @@ static const struct file_operations amdgpu_driver_kms_fops = {
>   	.flush = amdgpu_flush,
>   	.release = drm_release,
>   	.unlocked_ioctl = amdgpu_drm_ioctl,
> -	.mmap = drm_gem_mmap,
> +	.mmap = amdgpu_mmap,
>   	.poll = drm_poll,
>   	.read = drm_read,
>   #ifdef CONFIG_COMPAT
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index c5ef7f7bdc15..41944439cd6c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -61,6 +61,7 @@
>   #include "amdgpu_hmm.h"
>   #include "amdgpu_atomfirmware.h"
>   #include "amdgpu_res_cursor.h"
> +#include "amdgpu_dma_buf.h"
>   #include "bif/bif_4_1_d.h"
>   
>   MODULE_IMPORT_NS(DMA_BUF);
> @@ -1994,6 +1995,14 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
>   						   DMA_RESV_USAGE_BOOKKEEP);
>   }
>   
> +int amdgpu_mmap(struct file *filp, struct vm_area_struct *vma)
> +{
> +	if (amdgpu_try_dma_buf_mmap(filp, vma) == 0)
> +		return 0;
> +
> +	return drm_gem_mmap(filp, vma);
> +}
> +
>   int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>   		       uint64_t dst_offset, uint32_t byte_count,
>   		       struct dma_resv *resv,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index e2cd5894afc9..e4cd1bda7a2b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -152,6 +152,7 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>   			struct dma_resv *resv,
>   			struct dma_fence **fence);
>   
> +int amdgpu_mmap(struct file *filp, struct vm_area_struct *vma);
>   int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
>   void amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);
>   uint64_t amdgpu_ttm_domain_start(struct amdgpu_device *adev, uint32_t type);

