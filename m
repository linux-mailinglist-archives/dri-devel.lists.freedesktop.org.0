Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88510491E66
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 05:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308AE112A0D;
	Tue, 18 Jan 2022 04:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D668112A0D;
 Tue, 18 Jan 2022 04:10:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LHIQHlv2iHz7jAukDsOukxb4gruz1F1u/uSuSgN6+rR/ImTxWig5XIGHC3NY1Whn7kogNdxy6mb5qsiG4xUJSE0a320zBT5UUISLTPhDv1MxG4VuIxCxUgHBb1RwQEguzwteWKjgvZ0/nlz7rtVjkAip0I40iyo0O4E+8CxLCtAvu0awNTuUP5hODEd4xU+fzsHPHgbNALGD2eawFhQRXOAqDWmS1XMgKGuzPxGxaP1kUX/e5WnJbrmB6rqkGE4JJMRVuo8oZlFWbEatN3N6DQUDOnyhme8CeU8/KlFTmlzM6Et4fE8hBQNvhpCEOOcWAQiRT//BMPBUyaJb+1PiAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkM2pbbx011DLqrBydD7jqAQn17JUELheeUsfqzrxw0=;
 b=AAMxbda4S6InS6J0sn8tt2v+YcFkhUpbgItuFGJ/uQua5Ieq0XLXr0d5CiJuhMxjKoOfvvr/0WginudSzuvcBnUX/BA1bsLi9gHkgcoubJL9IUzKjuDTQ6GTZ8HwrQ7gPaLU7/DGK0Qw5U6fNHAkKeseyPTrX9A0ENmN6twuA816l7Btvm+GYmg7R4+dQEKCMvUAKoKaWBiWsDmCM5cGeCbyi/HxtEcDxlNh/QV09TKrz+J6B4ENUtemDZFzqXQcxb2qXjws6frf3Y2kFZQSb03ej+CihxqaKlAiD+1D/o2LSZvZKjABsksAsbltqXMjaZJaXMrHp7VyQ9NN1WJg2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkM2pbbx011DLqrBydD7jqAQn17JUELheeUsfqzrxw0=;
 b=SgdrlDN7oVTAgQ6Sa9IJFDd+PvKuSteI9SgZ7i2EZeHCtMtHYYll9ypf4WhV7pNOG8nasrbyxiJVO41Acj9NtZ2xwbAnO9ISBb9JY6iOlq21UsQY2vP3QgG+BWaVkDGt7JwtWldCuwiSm+nkJCn3GZV68fIaX6BeIBUebg+wwqY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (13.101.157.78) by
 DM6PR12MB3049.namprd12.prod.outlook.com (20.178.31.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.11; Tue, 18 Jan 2022 04:10:18 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 04:10:17 +0000
Subject: Re: [PATCH 1/1] Add available memory ioctl for libhsakmt
To: Daniel Phillips <daniel.phillips@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20220111013955.3214767-1-daniel.phillips@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <707cf87d-7833-c8ed-9c48-98f8c4cc91ab@amd.com>
Date: Mon, 17 Jan 2022 23:10:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220111013955.3214767-1-daniel.phillips@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT2PR01CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::12) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ee7a2e1-b239-4e5a-5f35-08d9da386fbd
X-MS-TrafficTypeDiagnostic: DM6PR12MB3049:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB30498001B35DEB0AFCE5FB9492589@DM6PR12MB3049.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pv8InyKR8M3TrzF0bqjOHc496iTyS8mOsjaTuI5oyjum4o6SdaVeErT8vuRDYkTm31VS375CMlYmVXbRaBNJNXSujvgr5HamEBFENHj/A+d7PgvhCSf0z/qJB1GgL0G7MmoHi9xxW66edWzVAfPnkDwwEMsIwcHFBmoaUitT8lZCjPa5AVc0e3euoB0TMiNnUvgJ7c4ra3h/Ztol7Pal9MyIKUf2utZlkEGAp7wgfezWDF/AZXBXsIdn6RKGlPfN1yTFbEq8t2Qs3o+rrUIhpXBarMctUR4icXWP0/VG1eDuqY9hN4hl07su312I8gWpavWCm1d+B5wMwR1r25+xscKF6T1r4/iw8w/6iiJj/teaT25st6rEpT4Dti6FNONavLHrx9bSP8Wja7oCq6VXLESTrZLe/5tbyoSK9BsGSU2p+3KyN61XhDg56tRqBtw0eiL7bceFrne5zU9jCGC0LwAUIwl+qtPhNPCgFssZDFK/1UkZffrig0hddwbVxUuuy8C6nQQr/4f+ux/+H5auWnkBa3n/16HZbq5coSCGtP0wMfmeJtwTkAowTdipL45WB4616RbUfWNAnICV2UYiAGWZxJBAJilENY2eeQlTYuyPCeskBhuOjSzh/DSEqbY72sl6X/wSjgyJTDu8rhdxb9wPhXc0aBXoxCZ7eW1fz2fWR5SuvlrPV9NTG4A/BwpH+vYmoYVJyFxed2Xq8zgItmz9tycAsAYiaejL0mt8jy+WXHzN5Qx3AkvR3lxeKRAHFyxq8fMCAcawmw00sqhkoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(66556008)(186003)(508600001)(6486002)(66946007)(83380400001)(8936002)(26005)(31696002)(316002)(8676002)(6506007)(2906002)(31686004)(450100002)(2616005)(44832011)(5660300002)(36756003)(6512007)(86362001)(966005)(38100700002)(131093003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFRuZHZvYzk2eXNxUjRIUnp1Yk55M2VkVFdML3FzZHRoeTlUdG10L2lES0o3?=
 =?utf-8?B?TUE1cG5uQno3WnYxZmJkbmxmMG5nQWlGRUhHWk00R2l4aDVNUzgvN2lqVGQw?=
 =?utf-8?B?OWpLUzZtZUZXZUFaRTJOV2ErVkJuRnJtVloxYktIT2tqSlo3d2FRdHpETEFu?=
 =?utf-8?B?YjlyMzZKV2FrMlJZTXdleFRCcEJyWm51dks1OFNvc25hV3ZjTE1sQUxUa1ZI?=
 =?utf-8?B?UWIvUGFEdW5kTHhrVEU1dmM1STNJY3EwR2Uzd3prUUVVT2hDcmgraXN3UDFp?=
 =?utf-8?B?ZEJ0NWVWRDkvYzB4VGNxOUdOeEVzUkFqVFoxK05DelgwNEpSeC9QNHlqN3A0?=
 =?utf-8?B?bG5XK0FMTUZHZVpDR1lWZE1NZWltRXY4WmtLRHA4cm5MTkN4SjlVN2NVekgx?=
 =?utf-8?B?NC9QdEkvWlZlais0a0dUWHNjWWs2bmYxVzd2N3AxMzhKdG1jRlpRN1paeGNz?=
 =?utf-8?B?TUcrS1FhQlJlRFQ2d2gxU0FxcGhmWXZGS3VCODI3Ui9EeWpQNjZHV2k1N0Nj?=
 =?utf-8?B?V0NkTGFlTjhQZDltRVNtK2xTQnJjd0p5SWdxcVpSWEVEQm42Mm1oTGZZRXdz?=
 =?utf-8?B?K2dKZjY2UWZVTjVRU0s0Y1pEN1RVZmxNVTNKQlRxRFlvSmJjUHZ2cVN0em03?=
 =?utf-8?B?R254VEEyQ1lHcm93VTBXdmY4Y3daUEFOM21xajYyRlQvaVJUMTdxN21aRXU5?=
 =?utf-8?B?Y1B1ZTBFelM5ak1URk9WNnhzeFRuNDltZnliNWdaRnVPbFhNZUZNcm1sWTBj?=
 =?utf-8?B?ODVZVVhvMnlNaFdMcGZpMTJtcU5YNklUNm9IVHBjdGU0NzJLQjkvVWhZMDJj?=
 =?utf-8?B?T2QwUk4wR2x1Zy9rUndjMmQ5cjJSeHFnWW9iQk1jaFVvUXNoRkt3KzE0K1RN?=
 =?utf-8?B?TUNvUGZNcHhBOVpGa3JIOFlHd3FPaUM5REhQOCtiUGlXY29FZlNjTU1HR0Nz?=
 =?utf-8?B?KzBUZS85dzFBMTE4cWk0RHJZek8vQ3NvYmtkZlJPYnZNMlBzN0lURjQ2MnQ0?=
 =?utf-8?B?Ujl2QkVTdHBPSjlHQlo3dmErcVJDTTlzT2FCTHdic0xVeXREc1J4QmM3L21h?=
 =?utf-8?B?M09qelhGa0hCVnkwcGxYcCt0VVdOVGIzTytybjZ4WXFGb2hmcVd2bzdJbWJD?=
 =?utf-8?B?VEdIL3ljMmdrY2Y5bmc1a0RBc1Zta1FiMUpEL25OenNybmhSeXllU3VCTE9s?=
 =?utf-8?B?d2FISWM5Qi84VG0ySTRiYlBNS05VNUxjall6Vkx3VENJRm5GcWwxOGNzN0dp?=
 =?utf-8?B?TmhVT0dBc08xNHplUE0wOW9HWEtqbC8vTWtHUS8wdzF1UGcxbU1pb2RsYStl?=
 =?utf-8?B?UWhCbVZXWU1YS1p5akJxYTRyc2FoUTJidTltYnE4V3dMVFlNbEhsbHNtVTdm?=
 =?utf-8?B?eWxTMTBST0x5WUF1bUxxNktqelludkYrdXFBK3gzVkFuTVdkZHNPTXpPZUNV?=
 =?utf-8?B?RTBGejV5WXJuV1ZPYnQ5cHlYaGtiZlNDanF4T05Hcnh0c085VnhqKzdjY3l2?=
 =?utf-8?B?c0xRVTJ0aWxOOVlYcHNkS1Z0TEhzTG4xcndnOVdMMGQ0TldHTzBQSTVEYXhx?=
 =?utf-8?B?M0VaVjhPZmtaVEh1TVNGRVJ1NFE4bnVwY3FVQ3VuU1krK08vMmtZUHE3L29z?=
 =?utf-8?B?RW5QZ3k2NG5uWXJqUm85WkhrSHJZQ1p1V0txOTBwTG1CVnJCeVB0M3RQWk1J?=
 =?utf-8?B?elByRTFZSmYxem1vNldwRFdTNjBZUGQ5WFgrTlFkTExvRk5mTnFpeWpXank3?=
 =?utf-8?B?VEZFTjNFMmNFZkZiVnV0cVdscitmaFl2ZjBMWThYZmpycm5HV05ScVYzQlFx?=
 =?utf-8?B?a3BFN1dxc29KaG1MTWo5YmJwaHYreFBndzhmaHl5OEx4ODRmM2VmQzlWYTUy?=
 =?utf-8?B?TncrTWxQcENwd0xPWWdzK2FyOU9HMWtHT1VqM3YvRE1VSXFnN0JwbXJxb2tv?=
 =?utf-8?B?dm8rZXNsU1lRdWFhRk0xQThIZUljNmRLZHUyMFBMT3NxWS81N3Bjd3Y4Z3Nj?=
 =?utf-8?B?YkFTZGFwelBzOTFUWHBkSE52dTFIaEZobDk1SDFLellLUk9ydFNHaG5TUDZ1?=
 =?utf-8?B?Ym1laTN3akZvUjByOWJXUGxpc0FnWVI4bkFRMjhIMWVoSDZmd1JIRHB3eU9l?=
 =?utf-8?B?Z1dPd21VVjIrUWxpSzlYRmlRcWNqeCtoSlJuekdVam9uY1p6czVoWTFPQndn?=
 =?utf-8?Q?Pk/ENjL6Sc7DCFV66Vm/jSY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee7a2e1-b239-4e5a-5f35-08d9da386fbd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 04:10:17.8591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /X8EK20GGiTokxOp+GWMugtNP4na6yE5GFlV5pgDuzhUdd5+hgC3Iv+u7V9RLH+KcJdVwhMYbMHQfwMRLeRWjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3049
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


Am 2022-01-10 um 8:39 p.m. schrieb Daniel Phillips:
> Add an ioctl to inquire memory available for allocation by libhsakmt
> per node, allowing for space consumed by page translation tables.
>
> This ioctl is the underlying mechanism for the new memory availability
> library call posted for review here:
>
>    https://lists.freedesktop.org/archives/amd-gfx/2022-January/073352.html
>
> Signed-off-by: Daniel Phillips <daniel.phillips@amd.com>
>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h      |  1 +
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c    | 14 ++++++++++++++
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c        | 17 +++++++++++++++++
>  include/uapi/linux/kfd_ioctl.h                  | 14 ++++++++++++--
>  4 files changed, 44 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> index fcbc8a9c9e06..64c6c36685d3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> @@ -266,6 +266,7 @@ int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct amdgpu_device *adev,
>  void amdgpu_amdkfd_gpuvm_release_process_vm(struct amdgpu_device *adev,
>  					void *drm_priv);
>  uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *drm_priv);
> +size_t amdgpu_amdkfd_get_available_memory(struct amdgpu_device *adev);
>  int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
>  		struct amdgpu_device *adev, uint64_t va, uint64_t size,
>  		void *drm_priv, struct kgd_mem **mem,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 86a1a6c109d9..b7490a659173 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -190,6 +190,20 @@ static int amdgpu_amdkfd_reserve_mem_limit(struct amdgpu_device *adev,
>  	return ret;
>  }
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
>  static void unreserve_mem_limit(struct amdgpu_device *adev,
>  		uint64_t size, u32 alloc_flag)
>  {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 4bfc0c8ab764..5c2f6d97ff1c 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -486,6 +486,20 @@ static int kfd_ioctl_get_queue_wave_state(struct file *filep,
>  	return r;
>  }
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
>  static int kfd_ioctl_set_memory_policy(struct file *filep,
>  					struct kfd_process *p, void *data)
>  {
> @@ -1959,6 +1973,9 @@ static const struct amdkfd_ioctl_desc amdkfd_ioctls[] = {
>  
>  	AMDKFD_IOCTL_DEF(AMDKFD_IOC_SET_XNACK_MODE,
>  			kfd_ioctl_set_xnack_mode, 0),
> +
> +	AMDKFD_IOCTL_DEF(AMDKFD_IOC_AVAILABLE_MEMORY,
> +			kfd_ioctl_get_available_memory, 0),
>  };
>  
>  #define AMDKFD_CORE_IOCTL_COUNT	ARRAY_SIZE(amdkfd_ioctls)
> diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
> index af96af174dc4..94a99add2432 100644
> --- a/include/uapi/linux/kfd_ioctl.h
> +++ b/include/uapi/linux/kfd_ioctl.h
> @@ -32,9 +32,10 @@
>   * - 1.4 - Indicate new SRAM EDC bit in device properties
>   * - 1.5 - Add SVM API
>   * - 1.6 - Query clear flags in SVM get_attr API
> + * - 1.7 - Add available_memory ioctl
>   */
>  #define KFD_IOCTL_MAJOR_VERSION 1
> -#define KFD_IOCTL_MINOR_VERSION 6
> +#define KFD_IOCTL_MINOR_VERSION 7
>  
>  struct kfd_ioctl_get_version_args {
>  	__u32 major_version;	/* from KFD */
> @@ -98,6 +99,12 @@ struct kfd_ioctl_get_queue_wave_state_args {
>  	__u32 pad;
>  };
>  
> +struct kfd_ioctl_get_available_memory_args {
> +	__u64 available;	/* from KFD */
> +	__u32 gpu_id;		/* to KFD */
> +	__u32 pad;
> +};
> +
>  /* For kfd_ioctl_set_memory_policy_args.default_policy and alternate_policy */
>  #define KFD_IOC_CACHE_POLICY_COHERENT 0
>  #define KFD_IOC_CACHE_POLICY_NONCOHERENT 1
> @@ -742,7 +749,10 @@ struct kfd_ioctl_set_xnack_mode_args {
>  #define AMDKFD_IOC_SET_XNACK_MODE		\
>  		AMDKFD_IOWR(0x21, struct kfd_ioctl_set_xnack_mode_args)
>  
> +#define AMDKFD_IOC_AVAILABLE_MEMORY		\
> +		AMDKFD_IOR(0x22, struct kfd_ioctl_get_available_memory_args)
> +
This needs to be AMDKFD_IOWR. Otherwise the gpu_id doesn't get copied
from user mode by kfd_ioctl.

I also updated the test (see the V2 I just sent out) and got a little
closer to having a working test. However, the test still fails on my
Fiji. The available memory reported on that card is about 4094 MB. The
card has 4GB, but 6MB of that are already used just in console mode. So
the memory allocation in the test fails. I think we need to refine the
memory limit to something more realistic, if the goal is to report
reliably the largest possible memory allocation that will succeed.

If we have to fudge the available memory number to something smaller
than the limit, then we also have to abandon the negative test that
confirms that bigger allocations will fail.

Regards,
  Felix


>  #define AMDKFD_COMMAND_START		0x01
> -#define AMDKFD_COMMAND_END		0x22
> +#define AMDKFD_COMMAND_END		0x23
>  
>  #endif
