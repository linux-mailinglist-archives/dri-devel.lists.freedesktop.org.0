Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B55874D1C2A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 16:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA1910E202;
	Tue,  8 Mar 2022 15:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B751710E202;
 Tue,  8 Mar 2022 15:44:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=byxmO93Mb3K6O15ZjKYFx+qMCc7mWwReTodPDR0ItW13D9SXCWBe5uRJGuaWneo+5FcUxMP+rDg8vysJ13+TjlZnSqc6Zv/NYogWWkkGbpzyCA4rDFwP7lkvqQTsa5j9zRuWaIbymhYS9gMnAg2f9ResfEMRUzwnpFyRRWOoML9UMwIICS0tgl7uW1wpbTmeEpNFVuzqCA8MWb2IhrpJM0evbePF8zvUanLTroIFf7BRNsaqRv5eoVrt+PJuP8Gw9kB8QYJ7DAY23zzX3TIpts59vgr35AEn7aC4oRORJycR0RoGrLulFcYB/1+9DTLvrv4KQRtQG0YEILW5bhc/rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMRkkzoKzxyDfop4pOfE1potOvwRY68Dc4MeIY/5CI8=;
 b=WVQMvAjraF0XHEwC5pZsPOeN+/1+KFcxHY+z6euUVAIJduhqsbSk5XR7RKC4aW+HkHgIzRV2GS11sRxfbELfhL7rkwAswYtaIdZnBpqoLXqXaS/4oYxUrhUapp41zHND8qRqzplHmMTo4DNpqt48h2Qj3D0TfHQEtHcS9qW403QRs111vjuBAESR1U3JioVxvpflZnk8Ukm1s5PQQ74L71u2khCyr0pxLqkTA+/uLqbFvdZScDrMP2gYqTYcuDgyonc5wjg41zwqKjBZomMxLYMgxa0T7HKzl60EEsVAw5JnE8Au7JHu0fp9uYj7nQdGx/TYijBrntFehlHyCSaKzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMRkkzoKzxyDfop4pOfE1potOvwRY68Dc4MeIY/5CI8=;
 b=N6x2iCmhmTOd+a5pxujmeaVB5OjyhQLMd5dQzCjceexEGZj/K3QKxbeEpGsG/PfHlkL1n3I74HzXgBNb/9/YEplrSO6KP6bLZVekAeTL8IV5gbCF20j1T0s/uO5TZNfI4bRJi4clQNexEtJ+sH4WCfVu758D5Jg4K3OHWzOC9YE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Tue, 8 Mar
 2022 15:44:37 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::b030:b1ba:4eb2:7fb7]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::b030:b1ba:4eb2:7fb7%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 15:44:37 +0000
Message-ID: <640bef3b-88e6-0b32-62e9-7829a5748e74@amd.com>
Date: Tue, 8 Mar 2022 10:44:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] drm/amdkfd: CRIU Refactor restore BO function
Content-Language: en-US
To: David Yat Sin <david.yatsin@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220308152812.7929-1-david.yatsin@amd.com>
 <20220308152812.7929-2-david.yatsin@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20220308152812.7929-2-david.yatsin@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::7) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9818f1d-670e-4cb2-1c09-08da011a8d27
X-MS-TrafficTypeDiagnostic: MN2PR12MB4335:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB43359375B5245B9238F1F00692099@MN2PR12MB4335.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7VcusSO23geY1nlV3v067+ABZZgpTsw77sLW8WVzlKoUQMR1tL/psvuk5c0pedKGvdHk6lOYQpCrra/yMGJ47k7/GnYdywZ3y/DOqbFiB59nbz/eMF/PR93GKrchIFEy8b7ftD/NpUZHg7vF5JVCdOvYlWvXSrPSvfK7K7l98RedkkUk7XUrsPANGsWp9pugzDHAhFaWO3vtbL2BjAQfHVzFUIoXCuCsFgx/PZ2c3gr3gjeizwXOcHkOxiTGyXLvDbNVKEU7xLvwxtC6KRMFEPo9jM0QoeOfkT48ywH7YDBojNhFowMWa39Nwvqr1KdYK4ReukqXqV4D//5gJLzPTLsd0ff9fWE9YRghgQ2VGOSIbwgC6zUktMLxyUVoxg9gKnoBWwbc1zPFDbESMOkoZftl+Bubgsva8xWteuUBeZwOWmxx6WqsSyvkaj9WbulD6qxscRoq5685ojRBYAMJFkEP5U2wRAL+TMA9w8m9GN+o9OTOfxWtX14wCnQq4BJZsElJuuEV1CqND/IPFVR8sjO4WNvq0QNVo20tevYFwyvCHf74dfUMkr7Pbx5IUkOWwBN+R4CuDqzoLUW6DsJqzYcRuAY8LFYv9kfgssZ33gh2PhVPhBxgevXu1+TcEs8Bhr58EI4JyfZ6Rc/4R7//acpJPQRq1QioxYpVMKmMUPpLMEGtoKPDyqt60Nl1qt3KNbYe9O/KVpypdc/R2gq7Kk4k3PDO0BVg7fHg3hRI0L+aOlOfZdjtI7taB7+DJ12A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(6512007)(508600001)(6486002)(38100700002)(31696002)(316002)(186003)(26005)(83380400001)(8936002)(31686004)(6506007)(5660300002)(66946007)(8676002)(66556008)(66476007)(30864003)(36756003)(44832011)(2906002)(450100002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZitvT0kyK1c0TVFLbkpkck5FRC9NUE5BVzA1M0kzWjJkK1oxWnhiQ3Q4SWtY?=
 =?utf-8?B?RVdtSi81TUlhV255RU0rZGhVK1VJVG9ZWkEyNUQ1NUNlMTJvb2FpZTMwUi9D?=
 =?utf-8?B?b1cwZVE3c0RicnVxVHExZXBjbTRSeXBjVUgyOUlQYjBFMDBCWTFOd3JWV01M?=
 =?utf-8?B?WTRGc2lDTDhRTkZMdmNHNWZ0cHMva1ZtWWg5eU9CZ1RsNFkxUGhvWjZnL3dw?=
 =?utf-8?B?Zyt2OUdVSktZOTFXTTlTVytQeTVqVW9pSVgrVUdMdlFBTFpLakZud3dZdmY4?=
 =?utf-8?B?Z3d3dllrNmhHaitpRG5BVHJIYklGNVpvRW5vTHdKM0JnYzN3VHFqSWhhQlQz?=
 =?utf-8?B?TWxrbStrbDhGMUMwNXNteDVsTkZ2N0Z0b25tWW03dnBiZEFRZk43RGI2RUFE?=
 =?utf-8?B?MnZwb0x1Q3djcEpFREdWcENjdWhmTDNDcWFFRFU0cWM4dklVTm1GbjdOMi9y?=
 =?utf-8?B?SDVRWk0xWTJoTW51OTJycUJiRzJMMlVPV1BkaWR5Z3VIV0xBckZIeUxpNFY2?=
 =?utf-8?B?U2lhR0Vwai9qNGVZTFFhZ3hMTmVrMXZuUSs5SldmNVpLQUg0OVpNbEgvWXRP?=
 =?utf-8?B?VlNIUXdJK2I1eEs1c0tPZ08wKzc5ajZCQUJCVUw2QlFJU0ZrdUtPREltNVhD?=
 =?utf-8?B?a0JZVzg1NVE4WFZvakJhN0d4RFU4bm1EVDBySXRraEtkM3I3K2pjZUJtT3Z2?=
 =?utf-8?B?Z0ZGZ0FwSFgvaVY2Q1BTUmc1c3pQWlcwVEZDczNDa1ZuTHpDbXkzZ2xrU0hM?=
 =?utf-8?B?SlgxbU5tR2pIUVRneVdHWlIxa2RidGE4SXYxM3BvNWd1KzV0czRTdm12RlhG?=
 =?utf-8?B?NEx5TTVhMGM2eHJQQ0dmRktvUWpmME93RmVhU2h4SFYxa1VvQ0lwei9SWGRS?=
 =?utf-8?B?bDB3cmpQM1ppTENlcjROUDJpQ3BtS1BFUnFvOEpLMURQMzZyRWtWNHkxNHlN?=
 =?utf-8?B?NXNjbjRYdlJ0SXNXeWdZZkxYQ2gzdTNRQzNKa3k2dWxDL0dIc2Q1dWgyOW9p?=
 =?utf-8?B?OUVBUXBrV1pNT1BVQTUxUWdyTzdUY2QwVmlsbmlBcjlMMFI4dnpta2hxRFRt?=
 =?utf-8?B?ajI0VGN5UTZSdjN3WVAxVFFMN1pYdTZhNDVOaDF3RXNPZUhSUytHemRiRjQy?=
 =?utf-8?B?YTJwcHUrVnVFb2J2b3lwa3RaUVNhaUI0U2FBOTFpUXdmSmVaTHNwdkVMS2Zz?=
 =?utf-8?B?QnQ0L2wzbGRpcGZkdnlPalVLWC9oQ2oycE5YUENYaHpKU05QUWtQVEllMW5O?=
 =?utf-8?B?dkhpMEdkTGh4dUtkbDZsQ0t6RDJUaThwT1NWSWRKd0c4K1kzcDdhSkxiUUQ3?=
 =?utf-8?B?N2lMQlJGQ2tFS3A5ODdNZ2lwZ2hBa1c4ZEVaajQ1WXZmdlBsV2NIM2h1Vldi?=
 =?utf-8?B?YUFSYWF2b003UWRiSUN1NjFIcmVISnNZVGFaZ2EyYkFPcGZFMlY4cUE0emlw?=
 =?utf-8?B?T0xzRzJ6OGM0MW9BZFNVRjcydVY3eU41bnJ3RjQyTVNpOGlpR1NGSWRKTWx0?=
 =?utf-8?B?bVVxZW42MTUrYkdzSTBadGV6dms0K0Y0UWE0Y2ZxeXg3c1RhM3pOZVpiRDk1?=
 =?utf-8?B?RjhNQ0lzclBpVUJER2pVbmtVRHlYQ01PYjNydnJ1ajZwT01UN3YxSU1mb25p?=
 =?utf-8?B?djBSQTUyOXJjRXZlbXNEYmduSTVjMVZMemhMK1d0VTRzWjljSXhsaUxINktL?=
 =?utf-8?B?dWp4S1FDdThZT3U1TUphK3h2ZjhCKzEzcXp2T0o2dHZrcEJQWnFpVTg0OCtM?=
 =?utf-8?B?U0lXSzVXYlRxd0U3b2tqQ3cyOGF2WHYxSjZHK1h5eE05MkM5UW1GUjl0VEFZ?=
 =?utf-8?B?VjB5TS9vMVFQNGVveEZQNHVYNFdJWE1YdkRHY2RyMTlaVFlLNEZST09Cd3J1?=
 =?utf-8?B?VTJsempxMGJmRHBnUm01blhCSEhmN2h0VUVGZFFmeUw4b3VlWVpUZEJWMFla?=
 =?utf-8?B?QVRTNzBIR0d2aHZjRENSOHdzSXFVdVRuWmNkcFlwbkRlaXRsRkozVTR1emhK?=
 =?utf-8?B?MUZlZnh2QnJubkNGN2FvcFBuZ1l5emZYVzFhNTAyUzQzREx2WG1WL0E3ZWxi?=
 =?utf-8?B?WGxXeld3K0xVdU90R2hOU2RXbGV5VnMyMnJ0YzVWcEFkcDJVOGd2cC9PaExT?=
 =?utf-8?B?Qm4rcUpUQTNvZUlBcVQwVXVLWkZrZ1poL0JiN2RKaE5rZ21Gc0Q5a1pCMGow?=
 =?utf-8?Q?JNDuOexsb1gINCLf04E4rwA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9818f1d-670e-4cb2-1c09-08da011a8d27
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 15:44:37.6992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6xAneKlIms4uxRGsQuMzQJ43ol5wUEiGzxdioXa05wOm+kkcz/S3YyN9F2/y94L0eJ4mpsHgvJPKfjyGXSxMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335
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

Am 2022-03-08 um 10:28 schrieb David Yat Sin:
> Refactor CRIU restore BO to reduce identation before adding support for
> IPC.
Update the commit message. There is no IPC support on the public branch. 
The refactoring is still welcome to improve the readability and 
maintainability of the code.

With that fixed, the series is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


>
> Signed-off-by: David Yat Sin <david.yatsin@amd.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 271 +++++++++++------------
>   1 file changed, 129 insertions(+), 142 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 789bdfbd3f9b..2c7d76e67ddb 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -2094,6 +2094,132 @@ static int criu_restore_devices(struct kfd_process *p,
>   	return ret;
>   }
>   
> +static int criu_restore_memory_of_gpu(struct kfd_process_device *pdd,
> +				      struct kfd_criu_bo_bucket *bo_bucket,
> +				      struct kfd_criu_bo_priv_data *bo_priv,
> +				      struct kgd_mem **kgd_mem)
> +{
> +	int idr_handle;
> +	int ret;
> +	const bool criu_resume = true;
> +	u64 offset;
> +
> +	if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL) {
> +		if (bo_bucket->size != kfd_doorbell_process_slice(pdd->dev))
> +			return -EINVAL;
> +
> +		offset = kfd_get_process_doorbells(pdd);
> +	} else if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_MMIO_REMAP) {
> +		/* MMIO BOs need remapped bus address */
> +		if (bo_bucket->size != PAGE_SIZE) {
> +			pr_err("Invalid page size\n");
> +			return -EINVAL;
> +		}
> +		offset = pdd->dev->adev->rmmio_remap.bus_addr;
> +		if (!offset) {
> +			pr_err("amdgpu_amdkfd_get_mmio_remap_phys_addr failed\n");
> +			return -ENOMEM;
> +		}
> +	} else if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_USERPTR) {
> +		offset = bo_priv->user_addr;
> +	}
> +	/* Create the BO */
> +	ret = amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(pdd->dev->adev, bo_bucket->addr,
> +						      bo_bucket->size, pdd->drm_priv, kgd_mem,
> +						      &offset, bo_bucket->alloc_flags, criu_resume);
> +	if (ret) {
> +		pr_err("Could not create the BO\n");
> +		return ret;
> +	}
> +	pr_debug("New BO created: size:0x%llx addr:0x%llx offset:0x%llx\n",
> +		 bo_bucket->size, bo_bucket->addr, offset);
> +
> +	/* Restore previous IDR handle */
> +	pr_debug("Restoring old IDR handle for the BO");
> +	idr_handle = idr_alloc(&pdd->alloc_idr, *kgd_mem, bo_priv->idr_handle,
> +			       bo_priv->idr_handle + 1, GFP_KERNEL);
> +
> +	if (idr_handle < 0) {
> +		pr_err("Could not allocate idr\n");
> +		amdgpu_amdkfd_gpuvm_free_memory_of_gpu(pdd->dev->adev, *kgd_mem, pdd->drm_priv,
> +						       NULL);
> +		return -ENOMEM;
> +	}
> +
> +	if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL)
> +		bo_bucket->restored_offset = KFD_MMAP_TYPE_DOORBELL | KFD_MMAP_GPU_ID(pdd->dev->id);
> +	if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_MMIO_REMAP) {
> +		bo_bucket->restored_offset = KFD_MMAP_TYPE_MMIO | KFD_MMAP_GPU_ID(pdd->dev->id);
> +	} else if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_GTT) {
> +		bo_bucket->restored_offset = offset;
> +	} else if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM) {
> +		bo_bucket->restored_offset = offset;
> +		/* Update the VRAM usage count */
> +		WRITE_ONCE(pdd->vram_usage, pdd->vram_usage + bo_bucket->size);
> +	}
> +	return 0;
> +}
> +
> +static int criu_restore_bo(struct kfd_process *p,
> +			   struct kfd_criu_bo_bucket *bo_bucket,
> +			   struct kfd_criu_bo_priv_data *bo_priv)
> +{
> +	struct kfd_process_device *pdd;
> +	struct kgd_mem *kgd_mem;
> +	int ret;
> +	int j;
> +
> +	pr_debug("Restoring BO size:0x%llx addr:0x%llx gpu_id:0x%x flags:0x%x idr_handle:0x%x\n",
> +		 bo_bucket->size, bo_bucket->addr, bo_bucket->gpu_id, bo_bucket->alloc_flags,
> +		 bo_priv->idr_handle);
> +
> +	pdd = kfd_process_device_data_by_id(p, bo_bucket->gpu_id);
> +	if (!pdd) {
> +		pr_err("Failed to get pdd\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = criu_restore_memory_of_gpu(pdd, bo_bucket, bo_priv, &kgd_mem);
> +	if (ret)
> +		return ret;
> +
> +	/* now map these BOs to GPU/s */
> +	for (j = 0; j < p->n_pdds; j++) {
> +		struct kfd_dev *peer;
> +		struct kfd_process_device *peer_pdd;
> +
> +		if (!bo_priv->mapped_gpuids[j])
> +			break;
> +
> +		peer_pdd = kfd_process_device_data_by_id(p, bo_priv->mapped_gpuids[j]);
> +		if (!peer_pdd)
> +			return -EINVAL;
> +
> +		peer = peer_pdd->dev;
> +
> +		peer_pdd = kfd_bind_process_to_device(peer, p);
> +		if (IS_ERR(peer_pdd))
> +			return PTR_ERR(peer_pdd);
> +
> +		ret = amdgpu_amdkfd_gpuvm_map_memory_to_gpu(peer->adev, kgd_mem, peer_pdd->drm_priv,
> +							    NULL);
> +		if (ret) {
> +			pr_err("Failed to map to gpu %d/%d\n", j, p->n_pdds);
> +			return ret;
> +		}
> +	}
> +
> +	pr_debug("map memory was successful for the BO\n");
> +	/* create the dmabuf object and export the bo */
> +	if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM) {
> +		ret = criu_get_prime_handle(&kgd_mem->bo->tbo.base, DRM_RDWR,
> +					    &bo_bucket->dmabuf_fd);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +
>   static int criu_restore_bos(struct kfd_process *p,
>   			    struct kfd_ioctl_criu_args *args,
>   			    uint64_t *priv_offset,
> @@ -2101,8 +2227,7 @@ static int criu_restore_bos(struct kfd_process *p,
>   {
>   	struct kfd_criu_bo_bucket *bo_buckets = NULL;
>   	struct kfd_criu_bo_priv_data *bo_privs = NULL;
> -	const bool criu_resume = true;
> -	int ret = 0, j = 0;
> +	int ret = 0;
>   	uint32_t i = 0;
>   
>   	if (*priv_offset + (args->num_bos * sizeof(*bo_privs)) > max_priv_data_size)
> @@ -2140,149 +2265,11 @@ static int criu_restore_bos(struct kfd_process *p,
>   
>   	/* Create and map new BOs */
>   	for (; i < args->num_bos; i++) {
> -		struct kfd_criu_bo_bucket *bo_bucket;
> -		struct kfd_criu_bo_priv_data *bo_priv;
> -		struct kfd_dev *dev;
> -		struct kfd_process_device *pdd;
> -		struct kgd_mem *kgd_mem;
> -		void *mem;
> -		u64 offset;
> -		int idr_handle;
> -
> -		bo_bucket = &bo_buckets[i];
> -		bo_priv = &bo_privs[i];
> -
> -		pr_debug("kfd restore ioctl - bo_bucket[%d]:\n", i);
> -		pr_debug("size = 0x%llx, bo_addr = 0x%llx bo_offset = 0x%llx\n"
> -			"gpu_id = 0x%x alloc_flags = 0x%x\n"
> -			"idr_handle = 0x%x\n",
> -			bo_bucket->size,
> -			bo_bucket->addr,
> -			bo_bucket->offset,
> -			bo_bucket->gpu_id,
> -			bo_bucket->alloc_flags,
> -			bo_priv->idr_handle);
> -
> -		pdd = kfd_process_device_data_by_id(p, bo_bucket->gpu_id);
> -		if (!pdd) {
> -			pr_err("Failed to get pdd\n");
> -			ret = -ENODEV;
> -			goto exit;
> -		}
> -		dev = pdd->dev;
> -
> -		if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL) {
> -			pr_debug("restore ioctl: KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL\n");
> -			if (bo_bucket->size != kfd_doorbell_process_slice(dev)) {
> -				ret = -EINVAL;
> -				goto exit;
> -			}
> -			offset = kfd_get_process_doorbells(pdd);
> -		} else if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_MMIO_REMAP) {
> -			/* MMIO BOs need remapped bus address */
> -			pr_debug("restore ioctl :KFD_IOC_ALLOC_MEM_FLAGS_MMIO_REMAP\n");
> -			if (bo_bucket->size != PAGE_SIZE) {
> -				pr_err("Invalid page size\n");
> -				ret = -EINVAL;
> -				goto exit;
> -			}
> -			offset = dev->adev->rmmio_remap.bus_addr;
> -			if (!offset) {
> -				pr_err("amdgpu_amdkfd_get_mmio_remap_phys_addr failed\n");
> -				ret = -ENOMEM;
> -				goto exit;
> -			}
> -		} else if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_USERPTR) {
> -			offset = bo_priv->user_addr;
> -		}
> -		/* Create the BO */
> -		ret = amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(dev->adev,
> -						bo_bucket->addr,
> -						bo_bucket->size,
> -						pdd->drm_priv,
> -						(struct kgd_mem **) &mem,
> -						&offset,
> -						bo_bucket->alloc_flags,
> -						criu_resume);
> +		ret = criu_restore_bo(p, &bo_buckets[i], &bo_privs[i]);
>   		if (ret) {
> -			pr_err("Could not create the BO\n");
> -			ret = -ENOMEM;
> -			goto exit;
> -		}
> -		pr_debug("New BO created: size = 0x%llx, bo_addr = 0x%llx bo_offset = 0x%llx\n",
> -			bo_bucket->size, bo_bucket->addr, offset);
> -
> -		/* Restore previuos IDR handle */
> -		pr_debug("Restoring old IDR handle for the BO");
> -		idr_handle = idr_alloc(&pdd->alloc_idr, mem,
> -				       bo_priv->idr_handle,
> -				       bo_priv->idr_handle + 1, GFP_KERNEL);
> -
> -		if (idr_handle < 0) {
> -			pr_err("Could not allocate idr\n");
> -			amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev->adev,
> -						(struct kgd_mem *)mem,
> -						pdd->drm_priv, NULL);
> -			ret = -ENOMEM;
> +			pr_debug("Failed to restore BO[%d] ret%d\n", i, ret);
>   			goto exit;
>   		}
> -
> -		if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL)
> -			bo_bucket->restored_offset = KFD_MMAP_TYPE_DOORBELL |
> -				KFD_MMAP_GPU_ID(pdd->dev->id);
> -		if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_MMIO_REMAP) {
> -			bo_bucket->restored_offset = KFD_MMAP_TYPE_MMIO |
> -				KFD_MMAP_GPU_ID(pdd->dev->id);
> -		} else if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_GTT) {
> -			bo_bucket->restored_offset = offset;
> -			pr_debug("updating offset for GTT\n");
> -		} else if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM) {
> -			bo_bucket->restored_offset = offset;
> -			/* Update the VRAM usage count */
> -			WRITE_ONCE(pdd->vram_usage, pdd->vram_usage + bo_bucket->size);
> -			pr_debug("updating offset for VRAM\n");
> -		}
> -
> -		/* now map these BOs to GPU/s */
> -		for (j = 0; j < p->n_pdds; j++) {
> -			struct kfd_dev *peer;
> -			struct kfd_process_device *peer_pdd;
> -
> -			if (!bo_priv->mapped_gpuids[j])
> -				break;
> -
> -			peer_pdd = kfd_process_device_data_by_id(p, bo_priv->mapped_gpuids[j]);
> -			if (!peer_pdd) {
> -				ret = -EINVAL;
> -				goto exit;
> -			}
> -			peer = peer_pdd->dev;
> -
> -			peer_pdd = kfd_bind_process_to_device(peer, p);
> -			if (IS_ERR(peer_pdd)) {
> -				ret = PTR_ERR(peer_pdd);
> -				goto exit;
> -			}
> -			pr_debug("map mem in restore ioctl -> 0x%llx\n",
> -				 ((struct kgd_mem *)mem)->va);
> -			ret = amdgpu_amdkfd_gpuvm_map_memory_to_gpu(peer->adev,
> -				(struct kgd_mem *)mem, peer_pdd->drm_priv, NULL);
> -			if (ret) {
> -				pr_err("Failed to map to gpu %d/%d\n", j, p->n_pdds);
> -				goto exit;
> -			}
> -		}
> -
> -		pr_debug("map memory was successful for the BO\n");
> -		/* create the dmabuf object and export the bo */
> -		kgd_mem = (struct kgd_mem *)mem;
> -		if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM) {
> -			ret = criu_get_prime_handle(&kgd_mem->bo->tbo.base,
> -						    DRM_RDWR,
> -						    &bo_bucket->dmabuf_fd);
> -			if (ret)
> -				goto exit;
> -		}
>   	} /* done */
>   
>   	/* Copy only the buckets back so user can read bo_buckets[N].restored_offset */
