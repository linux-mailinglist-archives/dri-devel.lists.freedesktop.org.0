Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FCD48A3C2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 00:38:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715E810E89A;
	Mon, 10 Jan 2022 23:38:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7449810E401;
 Mon, 10 Jan 2022 23:38:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFSQXDfGn4+ND+JTaB6x6olTpz06AjNIS7A27gHLf2M2uhjrr07eX2R/2dMV1WsWzVxJvksj/dAi7Y6LVyf0sIJDT2HwdAogkLPwr840+w/GUhye8xQauFp0hnvBMhC3E7U9bfyfqi/N8+wroTfZbSZLIIcJpn+zIMhvtXVzdWTesZk5Q8Zf/wny6XJ8NBGYt3M4fjiFYNlwKLHv5bUiG3e1HhNm76MpgqY5uysnjQe6cTxRV44wMpOyklCXTOdgmt+D/h2w3q5iG+KLorDxJh+mmGJW8CGVx9Mk1qQEaFHwoYhsXA0r08UgO4Dy/1F+ZL3rG10glFHP1enPaJMtJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LaG/9otorwk+n/PPJskk6U9uXzrhwQH/Eq6d2ioPWM=;
 b=UWPp5j+ef9DURb83kXMRNYTJGX2EgXXMFGoHghNS6oNm61uVjTGxSih/GcrO0Y6BoeUMhhET/XZVhVYQbWQILbsXuURZ730ZZ1xYxt++OIw4xT0zjLHXwWLyjCVe+TgEPggmiaft7E0eB4P/4kdu4wUOk9MrRQAjPoMf8pvK2T5vtDoP3HvOKXWHkw1UdbhWoLwNKA7EnKvT6lfTssVUMz3s/4DH+wQeeZt+VXsXvM6XIZB95PPIVrZs4TB89ghVNJl+qxyZO3++6mAvaPEgkZmvRbW+26yK+jr3w5QK96phyCyyeEdTG6L9sLQgwJEz91wMCkQpFxtjVna4E/p9+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LaG/9otorwk+n/PPJskk6U9uXzrhwQH/Eq6d2ioPWM=;
 b=3z6WvyX6ESFZcNa4xwebqR8PDv/e302IYhBIoUf4C0ZbMAF+ge11SQJh5j9Na1AN2DxmmLoNuQPqf9tNzLnPwk1zVS8irKuHtAiRrcZSiWWVdkNYhoMS0NC8JNBausSaWjig9f/9opRmQUTDi+6ve0xw8BTDFVTeeSrC8El2hGQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5194.namprd12.prod.outlook.com (2603:10b6:408:11b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 23:38:40 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 23:38:40 +0000
Subject: Re: [PATCH 1/1] Add available memory ioctl for libhsakmt
To: Daniel Phillips <daniel.phillips@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20220110205457.3165572-1-daniel.phillips@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <0b4b3127-0669-1922-7c46-0acc2e48d36c@amd.com>
Date: Mon, 10 Jan 2022 18:38:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220110205457.3165572-1-daniel.phillips@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: BL0PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:91::18) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0dcd20b-5850-41ab-1d1b-08d9d4925491
X-MS-TrafficTypeDiagnostic: BN9PR12MB5194:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB51949D045F8D93D4D532A27492509@BN9PR12MB5194.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gCFENs6BaK7gzcqOeuAkT/m9s2B30POpCbjFfRMJgI+Je2e1jazej/0GBxWvl0RmkevtdTDioSVPfkAWvv43ODqTyzxOsrkd/X2EfkKVyX904FMQ2TP/xgDXQK0GIsr0Aw9mvNjcUjCUPVA733xTV/u0EdNSVKxwye1ooBSiyVb/Ulz1ZOCx9oO6k13XRHPKDU9qXfTaL686QQ2v08CMaYVvdg0FcOyKQEn/ro7E99tY448TUY5oHuwJTjuVsre5PPOP1selywpLFyQyviskNH1624V4K1mNkSmF234itb4mFtQnqPfrNHYMme5p9BICT4atoUhN/cH1IwVyYxbawlMoAFJPk5JZHFDPfUpR6LembHZk65v7UYcY6XddE0j+sPMkgUruxyUxVUhyt/gIZ0tT1O4IvohYExzGOWfDVwJ3a07hP22ZiIVNdtwu7Bh4yMK2xmJwgwYqUOIuG986zYOdb3Y9F/L+Js/tRQr5gFUXNjR4XKKa4MFfLC3xZQRTm6iRE98ytI6c+n68tmAd+CyLvHl2ZKOiN9Tne7/a/jHMzPo7J3psiBa7znFn/wKRLGaGbX8vIuKKSkVrelKz/mqoEjWORVLitPyreokjLQz6w6D2YYkW0A0OMfHUoh2B+XQF/uxxYaPoxrdPC0ipTH7ck2ve7OaIx+UgCEHhaUZe7C/GGn452J4zApWJMyLe994AvRb40lEOjROY7cr8u9VkBm7DVT65c63CgcZpGin/XFNJcUiC3AYkV82P3pwvsJWNRzloV8wUjdNGd27GZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(2616005)(5660300002)(36756003)(66946007)(66476007)(36916002)(6486002)(31696002)(4326008)(83380400001)(6506007)(508600001)(53546011)(38100700002)(26005)(31686004)(8936002)(44832011)(450100002)(2906002)(8676002)(186003)(6512007)(86362001)(316002)(131093003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1RaSkZhVjk0ZEVYbDdlWHpCQXQrZks0dDBjZ3NCUWNmd3hOdng5N3ZWbk84?=
 =?utf-8?B?UjNEY3VwRHI4cmJ5ZkRTSkRVRm8xVDFoRGZFem0yYi8rOUVhdW42d0NGUnRV?=
 =?utf-8?B?djhObmlGeUltTHR1RWh5RDQ0V3l3Skd6c0FmYTFrV0ROM3lKM0hSVklMS2hj?=
 =?utf-8?B?UVBzTDkzR1ZldFFVa3VNNHlkWDFoV1J5MHVTVzJpSndCZUkxSzF4Vk4wdlcz?=
 =?utf-8?B?UDgwMkhzTk1hUVY0OTNPZy9uQ2laMmhSRjBTWENiMjlobk55YURqajhxYnVj?=
 =?utf-8?B?dDhpY1FLNmZ1RWplUjM2aURlUnhGR0FVb2RZWkJZNDdzTlkydE92S3d4enln?=
 =?utf-8?B?RFpyMEFPZ0tSMnZSZlNETkxURVh1WktJVjIwK2NzeC9HQkpnZERISExyZU5p?=
 =?utf-8?B?cm9qMTl0TmJ6YjM1QzJlaUptNW9BWEYza0RsTFhMc0pvWVRIR1RSdjNPQXpP?=
 =?utf-8?B?QklCbGJ3eVFvOFZWWmVGN0xuSWxJWVRjWk1WVFJQWDY5K084cHYrU1Y2cUF5?=
 =?utf-8?B?eVlsa3k0VFFIZFEwWklhc01rV3VkWUd1UStwUVFHcXBLa2JDSWRHNHVhd0Fk?=
 =?utf-8?B?MGpyZ3E4TFo3dWxsSlU0eHA0cEI0QWlYcXdHRDR6blVoaDVuaU40bG4vbksy?=
 =?utf-8?B?dTBpQXJEOVFrcXdjOFhOMUpBSmEwS053TU80S043ZTc2Qk1oZ2pHWnhHanVw?=
 =?utf-8?B?c2JEZVNSVGxIRUlaeGJQYUxiZk1uaWFzaWVPNnJhWjV6QXdKekxVRXV3QkZP?=
 =?utf-8?B?MkxCZUtCQWxjZXBOblZnUUtTbUdRT1pWYXNuUnVzRUd3b2FWMDZEZ0Q1RFIw?=
 =?utf-8?B?QjBFd2NRcnZtazJSUWNSc0RrSEZRL1QySGZlRVFicHRGSFZzZmc4T0VhN2hi?=
 =?utf-8?B?Tm82dU82WEVsVk9Rbm1XbCtxYjJ3N0xPbUVBT0gyR1hzWUtraEtVOEFIMUhk?=
 =?utf-8?B?a0lWY2Yrd09lcms2MDlDNDRDUC95ZFY3Sy82RDVlcjdOK2xxWVJKU2JtdTR2?=
 =?utf-8?B?c3BnZ3FMcFlWWDMvV0d6aXhNSmxpdGU2OThJbmsyU0ZQMjRwYWJVR1AyQnU5?=
 =?utf-8?B?eG51ajdrUWlBUWswSFpRUFZqR1hvNU00NFJWTHpHMDl1c3hZeUZqNm1EallS?=
 =?utf-8?B?QWdDRk04Z3V4Zk56dkJYNmtQZUFxN01HT0UwWHdybDRpY0xldmZBMkNocFdr?=
 =?utf-8?B?T2JudlRvSXZRYUQ5R2xzSkxhQmdxZzVqQjJaRkcwZTFRRjZNRnN5OVA2SkZ4?=
 =?utf-8?B?MTR6dEw5TzNpN2pSS1YvNEtsbE92ZjE5WTI2cnZ2Mk51ZFhMQ0ZsUUVBNEZF?=
 =?utf-8?B?YXdCNE5UUWpLU092YXN5KzlkQ0FaSHNMaGF5amxKcUxJTU9OSFltUEUwWCs4?=
 =?utf-8?B?REFjNVlmK2NNWkZPN2pKWklRc2JSQVJPbkJOWmJrTzJBWnNGM1R1MGE2K1g4?=
 =?utf-8?B?WGUxL1ZqbkI2VFNyaU0rYSt4RlNPRDZ3TytXYkp3cXA3L1doK3Axb3pSRXpm?=
 =?utf-8?B?MjFIazVTSnpLMGRRMFBIRnFSazhHd3kxNGN1OGJoTkM2WjJGci81dmtoNWYz?=
 =?utf-8?B?NkdpNmJJdENBWTFia1ZUODF5RVZCYmx0SXFWODN4a2hVTzRFVFl5NG9waTNk?=
 =?utf-8?B?dEVNOVlhQ0oyQ1JLcU5ZOTA0elN3L0JHRHQzdUNNVUhaUjhzdENWbE5pdjF2?=
 =?utf-8?B?bzNHUWJUWEczRGFRL3F3ZEpGWm1QdUtnZjd3ZlFXM0pZZnRNS1pSeXdIU2RW?=
 =?utf-8?B?ZFN2MWU2TlB0cWxDS0MzY0dNZzN6RUI0ZVBzc3Q2Y2VrcHUxK0VNWEY5b3h4?=
 =?utf-8?B?TUZjOVlZNzJPa0pCQXRBay96RVdONTNhU0I3NUpBMW9oSUgzcmpnOVNhK3Uz?=
 =?utf-8?B?NzFHczdBekNtN2JKWnZIYlNOZG9BWTRlZ1dRSXg2Mjc1dk9yanBraXhxYXNY?=
 =?utf-8?B?UnhFNXZaNjJEcmo5SkRHNW1kZjBLWSsyR3BBSHZlRVlYazRrOExmQkNpNlRX?=
 =?utf-8?B?YTE1clIxRlcwSGcxejVqWjhwWUhwd0poVXFRNWhjbjJ3WUR3Mml0ZG1QYWdz?=
 =?utf-8?B?M0FuQk5scFdyRUlQQ29tVExaUzY0dzdBMU0zNFcweUZlTDJ4UUJNTnJnVllY?=
 =?utf-8?B?OG1PRkQrcTRjdDZMQk12MEZXdzJVSWZrZVNGd2VlVjBNVGJDUCtqMXNmcWlG?=
 =?utf-8?Q?Tfp36g5CbCYAECVsZF50Q/0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0dcd20b-5850-41ab-1d1b-08d9d4925491
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 23:38:40.3757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: faLNqafDVeiiNrLEYPwUXP+pBP25Mqj+78PKGHtzKxRkpP+bTRLfvNZfbBSOR9j8AiPA2No+4XinSoYW958gNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5194
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
Cc: Daniel Phillips <dphillip@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-01-10 3:54 p.m., Daniel Phillips wrote:
> From: Daniel Phillips <dphillip@amd.com>

This is weird. Looks like you've set up the your user email in your 
.gitconfig incorrectly. Or you changed it after you commited this patch 
locally.


>
> Add an ioctl to inquire memory available for allocation by libhsakmt
> per node, allowing for space consumed by page translation tables.

Other than the missing signed-off-by, this patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h      |  1 +
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c    | 14 ++++++++++++++
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c        | 17 +++++++++++++++++
>   include/uapi/linux/kfd_ioctl.h                  | 14 ++++++++++++--
>   4 files changed, 44 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> index fcbc8a9c9e06..64c6c36685d3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> @@ -266,6 +266,7 @@ int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct amdgpu_device *adev,
>   void amdgpu_amdkfd_gpuvm_release_process_vm(struct amdgpu_device *adev,
>   					void *drm_priv);
>   uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *drm_priv);
> +size_t amdgpu_amdkfd_get_available_memory(struct amdgpu_device *adev);
>   int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
>   		struct amdgpu_device *adev, uint64_t va, uint64_t size,
>   		void *drm_priv, struct kgd_mem **mem,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 86a1a6c109d9..b7490a659173 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -190,6 +190,20 @@ static int amdgpu_amdkfd_reserve_mem_limit(struct amdgpu_device *adev,
>   	return ret;
>   }
>   
> +size_t amdgpu_amdkfd_get_available_memory(struct amdgpu_device *adev)
> +{
> +	uint64_t reserved_for_pt =
> +		ESTIMATE_PT_SIZE(amdgpu_amdkfd_total_mem_size);
> +	size_t available_memory;
> +
> +	spin_lock(&kfd_mem_limit.mem_limit_lock);
> +	available_memory =
> +		adev->gmc.real_vram_size -
> +		adev->kfd.vram_used - reserved_for_pt;
> +	spin_unlock(&kfd_mem_limit.mem_limit_lock);
> +	return available_memory;
> +}
> +
>   static void unreserve_mem_limit(struct amdgpu_device *adev,
>   		uint64_t size, u32 alloc_flag)
>   {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 4bfc0c8ab764..5c2f6d97ff1c 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -486,6 +486,20 @@ static int kfd_ioctl_get_queue_wave_state(struct file *filep,
>   	return r;
>   }
>   
> +static int kfd_ioctl_get_available_memory(struct file *filep,
> +			         struct kfd_process *p, void *data)
> +{
> +	struct kfd_ioctl_get_available_memory_args *args = data;
> +	struct kfd_dev *dev;
> +
> +	dev = kfd_device_by_id(args->gpu_id);
> +	if (!dev)
> +		return -EINVAL;
> +
> +	args->available = amdgpu_amdkfd_get_available_memory(dev->adev);
> +	return 0;
> +}
> +
>   static int kfd_ioctl_set_memory_policy(struct file *filep,
>   					struct kfd_process *p, void *data)
>   {
> @@ -1959,6 +1973,9 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[] = {
>   
>   	AMDKFD_IOCTL_DEF(AMDKFD_IOC_SET_XNACK_MODE,
>   			kfd_ioctl_set_xnack_mode, 0),
> +
> +	AMDKFD_IOCTL_DEF(AMDKFD_IOC_AVAILABLE_MEMORY,
> +			kfd_ioctl_get_available_memory, 0),
>   };
>   
>   #define AMDKFD_CORE_IOCTL_COUNT	ARRAY_SIZE(amdkfd_ioctls)
> diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
> index af96af174dc4..94a99add2432 100644
> --- a/include/uapi/linux/kfd_ioctl.h
> +++ b/include/uapi/linux/kfd_ioctl.h
> @@ -32,9 +32,10 @@
>    * - 1.4 - Indicate new SRAM EDC bit in device properties
>    * - 1.5 - Add SVM API
>    * - 1.6 - Query clear flags in SVM get_attr API
> + * - 1.7 - Add available_memory ioctl
>    */
>   #define KFD_IOCTL_MAJOR_VERSION 1
> -#define KFD_IOCTL_MINOR_VERSION 6
> +#define KFD_IOCTL_MINOR_VERSION 7
>   
>   struct kfd_ioctl_get_version_args {
>   	__u32 major_version;	/* from KFD */
> @@ -98,6 +99,12 @@ struct kfd_ioctl_get_queue_wave_state_args {
>   	__u32 pad;
>   };
>   
> +struct kfd_ioctl_get_available_memory_args {
> +	__u64 available;	/* from KFD */
> +	__u32 gpu_id;		/* to KFD */
> +	__u32 pad;
> +};
> +
>   /* For kfd_ioctl_set_memory_policy_args.default_policy and alternate_policy */
>   #define KFD_IOC_CACHE_POLICY_COHERENT 0
>   #define KFD_IOC_CACHE_POLICY_NONCOHERENT 1
> @@ -742,7 +749,10 @@ struct kfd_ioctl_set_xnack_mode_args {
>   #define AMDKFD_IOC_SET_XNACK_MODE		\
>   		AMDKFD_IOWR(0x21, struct kfd_ioctl_set_xnack_mode_args)
>   
> +#define AMDKFD_IOC_AVAILABLE_MEMORY		\
> +		AMDKFD_IOR(0x22, struct kfd_ioctl_get_available_memory_args)
> +
>   #define AMDKFD_COMMAND_START		0x01
> -#define AMDKFD_COMMAND_END		0x22
> +#define AMDKFD_COMMAND_END		0x23
>   
>   #endif
