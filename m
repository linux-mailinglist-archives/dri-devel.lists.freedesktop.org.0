Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E87668FF8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 09:03:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A1510E9A7;
	Fri, 13 Jan 2023 08:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C3210E9A7;
 Fri, 13 Jan 2023 08:03:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QD4T134ZnLGFontWp7wbH9+Y1LXnAQ3z3KcnBYaOTKLJcWcIzsSLbPJQ0DYJN1cPhGHY1tfGojySIsG63+Mumhl2uPjnYK96jIMCIaJZkCG65x1d58aubRGsVm/y2OsmTQybLEiAmAdMxVNICPFaqaSVYdVSrcEaEcO75s10pzQKVVhVI+gVCFA8XQ+RgJX/W1g+9mKNgBuTRigo9bczn1sSYHBQYvLJpa0VkaeVF2YNh/hA1VOcrdice8tpvYA83I09dd1NplMALFP9DuLHN64a44N8SRpnLnJsw9BE5odOK7TqEyKI2+PTP5v0VgbCR+tLM8E0CfA42aBeS5AWwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4N2j1ANs4AsLDr+YIClWKK+HhpzNp+gDgYA+SztpbXo=;
 b=LA1+7T63rsLpOLfy79ol8i0oR/G87qo7mwt62Qj7gYgE70wkc2PD55l1Yi0cmFIp1GtBXCn14aTfTa0RSQlMDx2vQhRDxp/NlL582jUtNVlrMFkt0N8Of90r7V2Xmq7YsTJlD13azbRzLAIjVxUtb0QB4mbfqOjc3AijhZuey9A/tkHZMXlNWkLD2dyczo9VEpVY0ocIECb2yYaLfrfRWvygtZwaFxao5Tau8cMFQ5m2zTlPopsChNPLZcNrWXQ85JwIeAAT+/uhKhlk4C6ph2RA9JlYN2r60Jxki9Uv03P27FgQ4gtSvDkJ37PTwNxI7jlYuUheNThOkOZGBMRqVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4N2j1ANs4AsLDr+YIClWKK+HhpzNp+gDgYA+SztpbXo=;
 b=ndz4+spPRxJ54WQfxhxueh4CmWl6Lzi9fCnJaiF6ueeGAxix8h/XAlAuG53AGswtZ8rnfbGAZnXZJ3u9wePxXeWGZk0QHK98gQTAh0/z+zXxkvfl9wGAMC1sjZA+UdkYjK1felMP35ddPN2RY+POLGuRT9G+NhhlVnofeml91RU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2602.namprd12.prod.outlook.com (2603:10b6:5:4a::11) by
 PH7PR12MB8053.namprd12.prod.outlook.com (2603:10b6:510:279::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 08:03:44 +0000
Received: from DM6PR12MB2602.namprd12.prod.outlook.com
 ([fe80::7418:855f:c703:f78b]) by DM6PR12MB2602.namprd12.prod.outlook.com
 ([fe80::7418:855f:c703:f78b%4]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 08:03:44 +0000
Message-ID: <662d12e7-6031-1f13-8fc2-243f84408d7b@amd.com>
Date: Fri, 13 Jan 2023 02:03:41 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 2/6] drm/amdkfd: Implement DMA buf fd export from KFD
Content-Language: en-US
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230112013157.750568-1-Felix.Kuehling@amd.com>
 <20230112013157.750568-3-Felix.Kuehling@amd.com>
From: "Chen, Xiaogang" <xiaogang.chen@amd.com>
In-Reply-To: <20230112013157.750568-3-Felix.Kuehling@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR08CA0029.namprd08.prod.outlook.com
 (2603:10b6:610:33::34) To DM6PR12MB2602.namprd12.prod.outlook.com
 (2603:10b6:5:4a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2602:EE_|PH7PR12MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: b3622b3e-c27b-4864-0e2a-08daf53cb0e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LE7peYldhBYQur15NnOg9KvERCq6kP7g04TCyoQuKyCmsHCF0fLf8g1qkq61Wfu6/MHCXq9jpF5XQsccuQAl8wjZQAx83IxHh17j88LyDgfRdydWy38/b2vzhwf6tKdmh39PWzQtYP0dPf+YB9J73zO1duk4Z6SMs6LK4xrKz8Pi1togsrSTAMKypYE5lD4WSXP2OZWqZSEkooCqT4lsbOpPspX4c971sZdGq56WafDRX3j+55fFodCk/epscIWjdXo/Upm05oTM8JWCkwQBykP7je2Y/XKI/jR49BIqmA48eOB+1kyg6TOz/owXpgGohCWDYZvbIclOJmwwhp+UMkoOpSk6tdHLY9HQwd1zbX768VGubB2arQoLaviuGy+fAEGTavpyTsnpK7rCnVWoWOSdYU4d+3SLWXIOHT6SJ5Ogyvh/VQ2PvzHNyKy3bPyADf1cGJE0YqH+PCDBJ48utkl8Ug+7294ew0GsZ/mnMSM1phmGNbGxpjpy1548wtLlrXyKXaIE13KbQEgwPh+5sGqL0EHXE94G34wY8JomoYisTucz4J8NdJ/BfuuBLEcLboqxYx9qY8Z+0zeSl5S8o9HkR2eJ1xDMbUkgdrCgEiwG57AYTqAc6hyEwN1Jw6fkhmNHP+5mHhBSEvBzWAVUlgbn4U5e4pSrnVNKTe8t+IKdynp69Xve8XLD+m7SwgtJub/SaMJM594XFBuKYH8yWq8L2isUas2E93sViGtU/61iA6dfjxq0ZlNO3/EmRc3IE4s8iJkKHQh2QiosDsAiCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2602.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(451199015)(6512007)(966005)(31686004)(186003)(26005)(478600001)(53546011)(66946007)(66556008)(316002)(2616005)(6666004)(6506007)(8676002)(450100002)(66476007)(4326008)(6486002)(38100700002)(8936002)(5660300002)(41300700001)(86362001)(83380400001)(31696002)(36756003)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzhXVVVEOXJkWjkvbDQ2dWZIbElqMStpWmR2UEJpWWxyZ2RyL3FNZVpDZVVW?=
 =?utf-8?B?S2FwOHJBcW5BUVNCOHQ3cnNWVG5SUDFFQU56YzVKVEg3SDNVMHdRRWZ6V2ZP?=
 =?utf-8?B?OUpOR252bGdrOExRVXZyWkRIa213MFZXcHFyejJpY29GS1hzWFhwZ1NQNjhi?=
 =?utf-8?B?aXFteVRLeE8wRXhMcU9rMWxGYXo0c2FvN3NyaGxpRnV5VENTUDhlVEVCZm9R?=
 =?utf-8?B?ZE1PQ0ZzWS93anJtR015RnJCYUtuUHlmaHRIRmZuM0xkUDFiaFFqNEZoRkln?=
 =?utf-8?B?RERYTjZmZzJKb01jSVBLNDNYU0k3SXZQTmJrN3hZMWlZNFpqbVVEWm9oRGdm?=
 =?utf-8?B?SjlkYUd1bE4rWXZBWVp2SFo0clVPRGFqVldXNmZvMENyNEt4Ynd2dG5WZkZP?=
 =?utf-8?B?RFExL242MHJwTEhHbmZpb2xyR2RweDBFVytNTW9UNi9YRW1UUUtnYVdVc2tF?=
 =?utf-8?B?K0dEMStrYTJBaGNMS05nL1N4UGpPN3BmTXo4d21UL3hDaUxEVTRraGZOTWwy?=
 =?utf-8?B?UXRhTTJieWVTZldoV0FHNWxmS2d6b1RNc3gxK3oxRkQxUXhyVlRxZ3VoRlBs?=
 =?utf-8?B?M1FWU2FBVDB5U3Q5b2pxKy9sNlhwR1ErNHRxeW5Fb20wZ2NGcDRQRmxRRE02?=
 =?utf-8?B?MmN6cmZaMWw4ODRxU0owM3F5em5RVDd5ZFN0YlRSMVR1WVdlaXk2S0EwT0Y2?=
 =?utf-8?B?SWFMQnZ5WnBmT0lMZ253OXpKWHpNeEVQOWhWUWNTb2NOTDVyTnlFaWxxcU1w?=
 =?utf-8?B?SWVWUUJ5bmpJQ253QzEwb1JWOW5NZFBsdFZCLzhucXZ2alhmWjF3NkFMTk5x?=
 =?utf-8?B?bmdXTGhES1JDTEt6QWhYdkJkT2NodG1BcmlWWVkydVUyWFRlbXpzVDh5YldY?=
 =?utf-8?B?SUU1YWNHMnE4b2xjM2NnSUdVYUI4MEFTQjRWVEdLTHY0UFZtK3VRUEk0OUVX?=
 =?utf-8?B?b3dxNW1QeGMrU2pDNFE2OElDSEZyeVAxV05WZVRKeWlLTXNlTXk5eThoTDJJ?=
 =?utf-8?B?bUhWa1Q3VnIwS1hEajRCSmhFaFpZSWNPbDhoQzJScXcvTk5XZ2ozenAwUFdI?=
 =?utf-8?B?RE1nbE1vODQyUkRtU1lFenpxYjNLblg3SzlJM3NLY2dOc2dqd1FPZXlUSkRW?=
 =?utf-8?B?Q0hlaFJrbGFZN2Jwa01ReXI0K0NZYzN0SGlBRnFkalA1YlBlRjZLMGtpV2FT?=
 =?utf-8?B?MmtLVTlJSmQ1OWRJcGRXQkZZLzRid3RTSVJoc1U5Y2JtTk53eDJ5dEpFb0Ix?=
 =?utf-8?B?RUZqNE83dVJEZDhaUnBXcHduc1oyKzVCR1l0WExiNjh0dCtSMXAySnc2dEVL?=
 =?utf-8?B?OXpXUzFlMi9vV0xZbFpQdVd4MFplbjYybW14VHczT1UydmRLVFYxSW9jNjl6?=
 =?utf-8?B?M1NOZ0JTVW5kaTRrSkZSQ3BhUTRQTFJLQmdaNm9yYWwzNXZNN3dKWml1N2xB?=
 =?utf-8?B?b3ZXanRXb2FsQldSZ1RQM0NtSHNGOGU1OTZZQ1NPMFhhMnNkbjhMTmtuZDJB?=
 =?utf-8?B?MFdkdkRyVTFENTEvV2RwSWg2ZmEwMjBVcE9GL2FUVHVkR0ltNEhzT3BlQ1Fk?=
 =?utf-8?B?TFVHaVJIdllKdTlETDlpOTJleUJibnc1OHVBcVVuSFA4S3FoK1dDT0hmc0FU?=
 =?utf-8?B?LzllbjMzLzY0czB4SHZmTy9wa1BWRWhYZ2lNckxqZXFuZGE4VytPUElSS2E3?=
 =?utf-8?B?YlU2VTVJTVQrQzc2VmpmaVI3Wm9uTEZLUG40b0ZZcTR6WWdCM2hYS1IwRU5L?=
 =?utf-8?B?dVU4bjR5dW8rVU01WmRXSyszNHNEb1o4SjBRYUZYSnY1TUpHMmRiNkVpbGpq?=
 =?utf-8?B?REpEWWVvSm1HbmJxVFo5S3JYaVdjOXVsdThHaHBjQ1oxQVJiMVlsMGZSZUVV?=
 =?utf-8?B?d2lHWWkxWVIwM3NhaXc4dlZpRW1HaGtvcTZSMDFlemF1YTJJN21ZZERCbXU0?=
 =?utf-8?B?R1V0MGlqUXozYjIxSExZTjVQd3h2S1hUdWt2aEM1SkQwRFh3MUpGa3N4aFRG?=
 =?utf-8?B?NzM3NnpncHY1dm44ei9OZCtWYkQzUVNFMWxoSzFwNTJsY1NOZ1hMakZhQ0dP?=
 =?utf-8?B?ZVp6QWJUd3pGYXl2V2t0Wmx1RVlyZWtqQ0NZRVAxUno2cWl2VUFPQi9LSHN0?=
 =?utf-8?Q?U+vo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3622b3e-c27b-4864-0e2a-08daf53cb0e8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2602.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 08:03:44.3062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTdfLRojFe75pJA3qWHiDk+y/faCkchLrjOqG/9WosuKlzJjb8FHaMqO1xWYRmwM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8053
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
Cc: christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Reviewed-by: Xiaogang Chen <Xiaoganng.Chen@amd.com>

Regards

Xiaogang

On 1/11/2023 7:31 PM, Felix Kuehling wrote:
> Exports a DMA buf fd of a given KFD buffer handle. This is intended for
> being able to import KFD BOs into GEM contexts to leverage the
> amdgpu_bo_va API for more flexible virtual address mappings. It will
> also be used for the new upstreamable RDMA solution coming to UCX and
> RCCL.
>
> The corresponding user mode change (Thunk API and kfdtest) is here:
> https://github.com/fxkamd/ROCT-Thunk-Interface/commits/fxkamd/dmabuf
>
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  2 +
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 45 +++++++++++----
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 55 +++++++++++++++++++
>   include/uapi/linux/kfd_ioctl.h                | 14 ++++-
>   4 files changed, 104 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> index 333780491867..01ba3589b60a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> @@ -308,6 +308,8 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
>   				      uint64_t va, void *drm_priv,
>   				      struct kgd_mem **mem, uint64_t *size,
>   				      uint64_t *mmap_offset);
> +int amdgpu_amdkfd_gpuvm_export_dmabuf(struct kgd_mem *mem,
> +				      struct dma_buf **dmabuf);
>   int amdgpu_amdkfd_get_tile_config(struct amdgpu_device *adev,
>   				struct tile_config *config);
>   void amdgpu_amdkfd_ras_poison_consumption_handler(struct amdgpu_device *adev,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index e13c3493b786..5645103beed0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -710,6 +710,21 @@ kfd_mem_dmaunmap_attachment(struct kgd_mem *mem,
>   	}
>   }
>   
> +static int kfd_mem_export_dmabuf(struct kgd_mem *mem)
> +{
> +	if (!mem->dmabuf) {
> +		struct dma_buf *ret = amdgpu_gem_prime_export(
> +			&mem->bo->tbo.base,
> +			mem->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE ?
> +				DRM_RDWR : 0);
> +		if (IS_ERR(ret))
> +			return PTR_ERR(ret);
> +		mem->dmabuf = ret;
> +	}
> +
> +	return 0;
> +}
> +
>   static int
>   kfd_mem_attach_dmabuf(struct amdgpu_device *adev, struct kgd_mem *mem,
>   		      struct amdgpu_bo **bo)
> @@ -717,16 +732,9 @@ kfd_mem_attach_dmabuf(struct amdgpu_device *adev, struct kgd_mem *mem,
>   	struct drm_gem_object *gobj;
>   	int ret;
>   
> -	if (!mem->dmabuf) {
> -		mem->dmabuf = amdgpu_gem_prime_export(&mem->bo->tbo.base,
> -			mem->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE ?
> -				DRM_RDWR : 0);
> -		if (IS_ERR(mem->dmabuf)) {
> -			ret = PTR_ERR(mem->dmabuf);
> -			mem->dmabuf = NULL;
> -			return ret;
> -		}
> -	}
> +	ret = kfd_mem_export_dmabuf(mem);
> +	if (ret)
> +		return ret;
>   
>   	gobj = amdgpu_gem_prime_import(adev_to_drm(adev), mem->dmabuf);
>   	if (IS_ERR(gobj))
> @@ -2267,6 +2275,23 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
>   	return ret;
>   }
>   
> +int amdgpu_amdkfd_gpuvm_export_dmabuf(struct kgd_mem *mem,
> +				      struct dma_buf **dma_buf)
> +{
> +	int ret;
> +
> +	mutex_lock(&mem->lock);
> +	ret = kfd_mem_export_dmabuf(mem);
> +	if (ret)
> +		goto out;
> +
> +	get_dma_buf(mem->dmabuf);
> +	*dma_buf = mem->dmabuf;
> +out:
> +	mutex_unlock(&mem->lock);
> +	return ret;
> +}
> +
>   /* Evict a userptr BO by stopping the queues if necessary
>    *
>    * Runs in MMU notifier, may be in RECLAIM_FS context. This means it
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index f79b8e964140..bcf2263927d6 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -1572,6 +1572,58 @@ static int kfd_ioctl_import_dmabuf(struct file *filep,
>   	return r;
>   }
>   
> +static int kfd_ioctl_export_dmabuf(struct file *filep,
> +				   struct kfd_process *p, void *data)
> +{
> +	struct kfd_ioctl_export_dmabuf_args *args = data;
> +	struct kfd_process_device *pdd;
> +	struct dma_buf *dmabuf;
> +	struct kfd_dev *dev;
> +	void *mem;
> +	int ret = 0;
> +
> +	dev = kfd_device_by_id(GET_GPU_ID(args->handle));
> +	if (!dev)
> +		return -EINVAL;
> +
> +	mutex_lock(&p->mutex);
> +
> +	pdd = kfd_get_process_device_data(dev, p);
> +	if (!pdd) {
> +		ret = -EINVAL;
> +		goto err_unlock;
> +	}
> +
> +	mem = kfd_process_device_translate_handle(pdd,
> +						GET_IDR_HANDLE(args->handle));
> +	if (!mem) {
> +		ret = -EINVAL;
> +		goto err_unlock;
> +	}
> +
> +	ret = amdgpu_amdkfd_gpuvm_export_dmabuf(mem, &dmabuf);
> +	mutex_unlock(&p->mutex);
> +	if (ret)
> +		goto err_out;
> +
> +	ret = dma_buf_fd(dmabuf, args->flags);
> +	if (ret < 0) {
> +		dma_buf_put(dmabuf);
> +		goto err_out;
> +	}
> +	/* dma_buf_fd assigns the reference count to the fd, no need to
> +	 * put the reference here.
> +	 */
> +	args->dmabuf_fd = ret;
> +
> +	return 0;
> +
> +err_unlock:
> +	mutex_unlock(&p->mutex);
> +err_out:
> +	return ret;
> +}
> +
>   /* Handle requests for watching SMI events */
>   static int kfd_ioctl_smi_events(struct file *filep,
>   				struct kfd_process *p, void *data)
> @@ -2754,6 +2806,9 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[] = {
>   
>   	AMDKFD_IOCTL_DEF(AMDKFD_IOC_AVAILABLE_MEMORY,
>   			kfd_ioctl_get_available_memory, 0),
> +
> +	AMDKFD_IOCTL_DEF(AMDKFD_IOC_EXPORT_DMABUF,
> +				kfd_ioctl_export_dmabuf, 0),
>   };
>   
>   #define AMDKFD_CORE_IOCTL_COUNT	ARRAY_SIZE(amdkfd_ioctls)
> diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
> index 42b60198b6c5..2da5c3ad71bd 100644
> --- a/include/uapi/linux/kfd_ioctl.h
> +++ b/include/uapi/linux/kfd_ioctl.h
> @@ -37,9 +37,10 @@
>    * - 1.9 - Add available memory ioctl
>    * - 1.10 - Add SMI profiler event log
>    * - 1.11 - Add unified memory for ctx save/restore area
> + * - 1.12 - Add DMA buf export ioctl
>    */
>   #define KFD_IOCTL_MAJOR_VERSION 1
> -#define KFD_IOCTL_MINOR_VERSION 11
> +#define KFD_IOCTL_MINOR_VERSION 12
>   
>   struct kfd_ioctl_get_version_args {
>   	__u32 major_version;	/* from KFD */
> @@ -463,6 +464,12 @@ struct kfd_ioctl_import_dmabuf_args {
>   	__u32 dmabuf_fd;	/* to KFD */
>   };
>   
> +struct kfd_ioctl_export_dmabuf_args {
> +	__u64 handle;		/* to KFD */
> +	__u32 flags;		/* to KFD */
> +	__u32 dmabuf_fd;	/* from KFD */
> +};
> +
>   /*
>    * KFD SMI(System Management Interface) events
>    */
> @@ -877,7 +884,10 @@ struct kfd_ioctl_set_xnack_mode_args {
>   #define AMDKFD_IOC_AVAILABLE_MEMORY		\
>   		AMDKFD_IOWR(0x23, struct kfd_ioctl_get_available_memory_args)
>   
> +#define AMDKFD_IOC_EXPORT_DMABUF		\
> +		AMDKFD_IOWR(0x24, struct kfd_ioctl_export_dmabuf_args)
> +
>   #define AMDKFD_COMMAND_START		0x01
> -#define AMDKFD_COMMAND_END		0x24
> +#define AMDKFD_COMMAND_END		0x25
>   
>   #endif
