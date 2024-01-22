Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C836835DF9
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 10:19:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF6710EBC0;
	Mon, 22 Jan 2024 09:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC99310EBBB;
 Mon, 22 Jan 2024 09:18:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsUFVqk+FBQvMy5qwMOpLGvTFDsD4Ybtz4XOeoOaJGpoMdajvpcCTdwYjUFLimrdmAIp1SO9oyW+AhryOcu/vA0INqcBj2577S9LPkd4X+RpNAZfnJcQt3emg/qvOVmTs4MCXVk1TdaSLMmEGml2z4JnnV6goNw1Y6wbEsIeXcYt7wa+Ak+bjxCWEGKOegerMJ8vLVqn0kuJerb4wibkAEEw1Vha85B52bmz/A+hX/mMtFNz8P1DHo9fXdSrgoJuEmTAOJEh/IxqVwfABnGpwOl6gpgCEHiOVi83nqB9MLFFs4xZXxwmpU9O+V0nTsagE6i3r/Vr8ZHXDoOrKvo9BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2gh3+apziccsLlRdZ6xWsvdw8dGUNSoWVXA8P4DZ2w=;
 b=crr5hbvBrHQHdYIZjNsYqcaMLY/SeaVO2t1MoClYbOCOP6lTyLFcsK1AUUobc7HkoDUgvl+RSzlG91spn5J6nBgtwNE/nVpbo34x845L5u2EdZ77Gy+ttsLHVmXnhcFaScszFrD/Uoys9Ct8//1P5LACg6naY5BJF916kV8w6x+uNH7wXAZAvTzzDo0elWU+EtxMKScVx/QLKlQKP8CiCN66qd4cybj1kOPdWpOX/5/6SECg6kcBeqotKS35TG2jymT5NKjRPrxd/GFSgEPZHXXocQX61syqelOIy6wXlW/g/KmX6/duOhy0/f9yoTbYdDLzJWIuPGRbS7Sh+xMsJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2gh3+apziccsLlRdZ6xWsvdw8dGUNSoWVXA8P4DZ2w=;
 b=qcnTZXlUjG6SIN5pqDNrFch/nvUV2q2luL40ynrPdtmYRAfc6174W/CSj554Dv4ZoOIGnDXblp/dABHpL1Ugd//knxcK8ikEP246X4Nr9EWkevcoSf+wSzd6dxoINI5Ykh5tMEwByNfQVmBewAvM8A+DTwO1ov59WpNyOB2Cc+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL1PR12MB5064.namprd12.prod.outlook.com (2603:10b6:208:30a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Mon, 22 Jan
 2024 09:18:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 09:18:20 +0000
Message-ID: <5ed7d46b-ae26-43f2-81e0-91e3cfc0218a@amd.com>
Date: Mon, 22 Jan 2024 10:18:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Remove double faults once write a device pfn
Content-Language: en-US
To: Xianrong Zhou <Xianrong.Zhou@amd.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20240122033210.713530-1-Xianrong.Zhou@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240122033210.713530-1-Xianrong.Zhou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL1PR12MB5064:EE_
X-MS-Office365-Filtering-Correlation-Id: bf46b7f7-a589-4a73-c3f1-08dc1b2b133e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HDbvOtgyAqOR07PZfrY9pDyLACUG1g6//Y6nht9/u9x5Yx4WVDIGOMKPk7irqeSuCAmMagaNpXbUmUHbicnBbC49aSyfl0dTTXlz+m20eXt/qzOCOnM8vfx7nhUZCAwL9v82BBt9NU7ZYPq8WQW2I5+p9p3s4wu+eLg+WuAyanjJw4tiemMbyj8Mrmzyuh1/S63gD0HA83+JBTSz5SwbrKmK6PwLCXdJm1Cq+Z6aecLj0kgOqGdrospiRx+drIk1jM7Z/atCIADwk4H4I4O0LCrQuX25DQVLRsywMdpQ25oELM43kJQ5zdcBrm+wvVFtSdWhydEGuMkXDnpyeZtbsASTBPH1/km6CQdDmiNeBIhtOzSKoGPnEUf2+p4e7W2wkAXCzEQD2GxCO/MP2f/FcoNNxj115AnxAf6jCn3vPXB4af8LNFScX1BCVtLxoaL5c0MA9TewMGA8Q5UhjlyKDBGZPo2zTsGZ26PUZUOAUfQGZAy1IbzcIVRhWUoc7v++ZZuoUCRKBohzrpCZ+j9gXY8OqdmT+HjI56p4jRYMLDsCsnpGNDqzWhnFjAR5dhoYSymeAdi97eoAwWgpdz9T9yZEW2C+kvxbZYi9TWHiwexutpYxY82hx/0RU0QOe5Mk7E1awYVus/2rR+czDDbjbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(346002)(376002)(396003)(366004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(31686004)(83380400001)(86362001)(31696002)(36756003)(8936002)(8676002)(4326008)(38100700002)(2616005)(26005)(5660300002)(6506007)(6666004)(6512007)(6486002)(66946007)(66556008)(316002)(66476007)(30864003)(478600001)(41300700001)(2906002)(7416002)(7406005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVVnSnNxOTNvcE9lMWE0KzErRjRGKzc0WlIzYjFtYmFCVnlwSi9hYmxvMGZ1?=
 =?utf-8?B?cGs0UnBTWk93K2MwZTcxZE1uNHhBbFdRUXRnUnhjd2NMV2U3NmxFV0QwT0lY?=
 =?utf-8?B?RzNjYThwTVNwWjc4VXFJWWVkL1Nub2d3b1o2WWVTeWhNTXNxRTd2OE13d2xj?=
 =?utf-8?B?WEVZUEFIdFByNVMrckxkMVFOWjVLdXJ2VEh0QzNyeVphN1dlc1BTQmFadWtS?=
 =?utf-8?B?OWJjTWttZHJzTlEzSndXWHdkbmFYMzR3ZmZ6MGVYRlBtbC9OVDJLckY1dHRi?=
 =?utf-8?B?QXdZTDJrZjVBQU9IVGt2Q2lzNUZPOFJycjRtdS9RaVBCYzJWbGpCUE5wZWN3?=
 =?utf-8?B?bGVNSld3M2lVRGpiSDVwdWFhLzlLYW1FMnpBaEZzcDVHU2pOQmxtUlRiQWcz?=
 =?utf-8?B?YjU5U1AwbGxSZWppaHhBSnVHZTdDaEJXNVdYQ1ZIRlJsclg2NUVibUJSSXRa?=
 =?utf-8?B?N2ZkeXJnUG5HUllRSG9vbXh0dGNNVVMrMmhONlNhbDFQUkJ2ZkxwNHlCS01h?=
 =?utf-8?B?ekpGekRERVRrdTRIL1hEMDBJek9yL0ZKZTBlUk4xWWtuakRzRVF5U1ZBb0NH?=
 =?utf-8?B?THUyT25adUtlelBnS096bTVtWCtsZ01uN2Q3clhKVW1PTGsrZU53UWdvN0pK?=
 =?utf-8?B?dE5vS1QybWhaSkJyeW8vU2pjalJWNEp6VXpCN0pWWGRqSWxEQUNCRUJ4N2JQ?=
 =?utf-8?B?Tnd0SHUzUW9qYnIvRExia1F3RmVCcmE5OGdGR3gwZmpHaGY5OVlORG5VMDh2?=
 =?utf-8?B?WDFrcnl1emJNcVFpWlFhUDFsMEUxU3VJWElKNHI1VnV3K1N1UjNEQnN4RUE4?=
 =?utf-8?B?SWVwalY3ZStoemhEaDMxZ2FEVnVzeFdqd2phUit3TE1BZ3J4U0ZZek9Tb09J?=
 =?utf-8?B?QXdESUVxTzR3TmE2Z1R3SGErcExVekZ0dm9RMVZGWlFEOTEvbGhzZ3FKZjd1?=
 =?utf-8?B?cHZ4MU8vWGNUSXlGZCtZREdob3pvcGd6THNad2FjdHBUWlZaMGsxSlExblo3?=
 =?utf-8?B?QUJyQWU1dE8wZ2pYd3BCL2tCTER2Q3lqMVF3TGdIRE85ZGdmdXRNUi9sZlFG?=
 =?utf-8?B?YkpNcWwwZ3N5WnoxQzNTallObWdUeG9tU3Q2OSs5T0dBaUtZTk9VaCtNVUNh?=
 =?utf-8?B?SHo4dWREV3VLb3dCSmkwZjcvUG9LUzlMSzdIcnBKSUQ0RGpmZmJKVEp5YlBN?=
 =?utf-8?B?azJYVHhRYTB1YUd1QStXNzZ0MnByRE9XS0YwUmlId3FQQVllTjFNMVN2Y21V?=
 =?utf-8?B?cUt1M2RISVY3OWNqbTJETFdsRjluRGpnRjU5cDhEWlhueXltZUtVM24vS3pa?=
 =?utf-8?B?Yk9LZWR0QmU0TEwwSUw3SGN3emtmeEtBOVNKVS9mcG5DNjVtRStwMUxRMmNp?=
 =?utf-8?B?YUtSNnloUFFvV0RmOVlMcTBCY1UyZ1ZBZEJ5NjdQUjhUNDF4U0xibDJMQ0My?=
 =?utf-8?B?TDR4eVpRNDdyNmxOR21icndoc0JMbmJuVHBsamFTd3hEbnpTNVplbk1MR3R0?=
 =?utf-8?B?QTRqdFlQKzhPd2dnNm9JOXZUU0RmVjNYS2xmcnFQS0xXODlCeFZvbDU4Ly9r?=
 =?utf-8?B?WFEyQUIyY3drMnZVQTE2eUcxdldFL2FEQ0k0ank3bFRZcGJzQ0RDWUt0Z2VY?=
 =?utf-8?B?eGFFYzkra3lhVHVEaGVxcFZCd0dCL09PSzJ6NFhoL1Z4RnNOcDgzbFkrZDl1?=
 =?utf-8?B?Q1AzRXFIV3lPaE9Zdkl2ZW52M29aNElEYjNpZ2lPSUpaVjUrbXFyVDNHb1ZL?=
 =?utf-8?B?bHFwdE9la2xuZ0tLdndPdThxZkZ5Wi9Tb09jWVNoTTVqWXZXQlFpTGFWMElp?=
 =?utf-8?B?QnBxaFV4T3J0S0ZUeVpHUit0U0pqWXVoL0dCOEZNNEU3dm91dlFoSnludk04?=
 =?utf-8?B?WWJ1aGpoOWNXTlVNdWdDV25aNEpiTStOMzJRaktzWDVtSFdCNGFqemlmM0RU?=
 =?utf-8?B?cGR5YlZmWWFlcjBNN01KdzhLWmtGS2M1cGMySVBlZVRYUlYzOGJTZTZpSFFt?=
 =?utf-8?B?a0Y5MHRsZWdyUjJEK0JIcm11Y0w4cXdoVG5zNWsrT0hCa2lQdzhvS3hCem1w?=
 =?utf-8?B?U0dlRlJQeUtkNWozbW5wanhIK1pHenBzZjA4MFBzZC9KWjdDSmMxYmhrYkZO?=
 =?utf-8?Q?NNdkBU9bDCcTtEGY62EM4NoI2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf46b7f7-a589-4a73-c3f1-08dc1b2b133e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 09:18:20.2116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U9gRofOrsEy0lxHwdnMICGmtFsukia7ztckzwU2wOaYg/IueMPw0Hcrxlz/mrNM4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5064
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
Cc: lee@kernel.org, kherbst@redhat.com, nouveau@lists.freedesktop.org,
 dave.hansen@linux.intel.com, dri-devel@lists.freedesktop.org,
 ray.huang@amd.com, hpa@zytor.com, airlied@gmail.com, guoqing.zhang@amd.com,
 huazeng.li@amd.com, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 mingo@redhat.com, dakr@redhat.com, matthew.auld@intel.com,
 bcm-kernel-feedback-list@broadcom.com, Philip.Yang@amd.com,
 tzimmermann@suse.de, intel-gfx@lists.freedesktop.org, bp@alien8.de,
 mripard@kernel.org, luto@kernel.org, rodrigo.vivi@intel.com,
 tglx@linutronix.de, James.Zhu@amd.com, surenb@google.com,
 tvrtko.ursulin@linux.intel.com, Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
 daniel@ffwll.ch, alexander.deucher@amd.com, akpm@linux-foundation.org,
 srinivasan.shanmugam@amd.com, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.01.24 um 04:32 schrieb Xianrong Zhou:
> The vmf_insert_pfn_prot could cause unnecessary double faults
> on a device pfn. Because currently the vmf_insert_pfn_prot does
> not make the pfn writable so the pte entry is normally read-only
> or dirty catching.

What? How do you got to this conclusion?

> The first fault only sets up the pte entry which actually is
> dirty catching. And the second immediate fault to the pfn due
> to first dirty catching when the cpu re-execute the store
> instruction.

It could be that this is done to work around some hw behavior, but not 
because of dirty catching.

> Normally if the drivers call vmf_insert_pfn_prot and also supply
> 'pfn_mkwrite' callback within vm_operations_struct which requires
> the pte to be dirty catching then the vmf_insert_pfn_prot and the
> double fault are reasonable. It is not a problem.

Well, as far as I can see that behavior absolutely doesn't make sense.

When pfn_mkwrite is requested then the driver should use PAGE_COPY, 
which is exactly what VMWGFX (the only driver using dirty tracking) is 
doing.

Everybody else uses PAGE_SHARED which should make the pte writeable 
immediately.

Regards,
Christian.

>
> However the most of drivers calling vmf_insert_pfn_prot do not
> supply the 'pfn_mkwrite' callback so that the second fault is
> unnecessary.
>
> So just like vmf_insert_mixed and vmf_insert_mixed_mkwrite pair,
> we should also supply vmf_insert_pfn_mkwrite for drivers as well.
>
> Signed-off-by: Xianrong Zhou <Xianrong.Zhou@amd.com>
> ---
>   arch/x86/entry/vdso/vma.c                  |  3 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_gem.c      |  2 +-
>   drivers/gpu/drm/radeon/radeon_gem.c        |  2 +-
>   drivers/gpu/drm/ttm/ttm_bo_vm.c            |  8 +++++---
>   drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c |  8 +++++---
>   include/drm/ttm/ttm_bo.h                   |  3 ++-
>   include/linux/mm.h                         |  2 +-
>   mm/memory.c                                | 14 +++++++++++---
>   10 files changed, 30 insertions(+), 16 deletions(-)
>
> diff --git a/arch/x86/entry/vdso/vma.c b/arch/x86/entry/vdso/vma.c
> index 7645730dc228..dd2431c2975f 100644
> --- a/arch/x86/entry/vdso/vma.c
> +++ b/arch/x86/entry/vdso/vma.c
> @@ -185,7 +185,8 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
>   		if (pvti && vclock_was_used(VDSO_CLOCKMODE_PVCLOCK)) {
>   			return vmf_insert_pfn_prot(vma, vmf->address,
>   					__pa(pvti) >> PAGE_SHIFT,
> -					pgprot_decrypted(vma->vm_page_prot));
> +					pgprot_decrypted(vma->vm_page_prot),
> +					true);
>   		}
>   	} else if (sym_offset == image->sym_hvclock_page) {
>   		pfn = hv_get_tsc_pfn();
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index 49a5f1c73b3e..adcb20d9e624 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -64,7 +64,7 @@ static vm_fault_t amdgpu_gem_fault(struct vm_fault *vmf)
>   		}
>   
>   		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> -					       TTM_BO_VM_NUM_PREFAULT);
> +					       TTM_BO_VM_NUM_PREFAULT, true);
>   
>   		drm_dev_exit(idx);
>   	} else {
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 9227f8146a58..c6f13ae6c308 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -1114,7 +1114,7 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
>   
>   	if (drm_dev_enter(dev, &idx)) {
>   		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> -					       TTM_BO_VM_NUM_PREFAULT);
> +					       TTM_BO_VM_NUM_PREFAULT, true);
>   		drm_dev_exit(idx);
>   	} else {
>   		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 49c2bcbef129..7e1453762ec9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -56,7 +56,7 @@ static vm_fault_t nouveau_ttm_fault(struct vm_fault *vmf)
>   
>   	nouveau_bo_del_io_reserve_lru(bo);
>   	prot = vm_get_page_prot(vma->vm_flags);
> -	ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT);
> +	ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT, true);
>   	nouveau_bo_add_io_reserve_lru(bo);
>   	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
>   		return ret;
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> index 3fec3acdaf28..b21cf00ae162 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -62,7 +62,7 @@ static vm_fault_t radeon_gem_fault(struct vm_fault *vmf)
>   		goto unlock_resv;
>   
>   	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> -				       TTM_BO_VM_NUM_PREFAULT);
> +				       TTM_BO_VM_NUM_PREFAULT, true);
>   	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
>   		goto unlock_mclk;
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index 4212b8c91dd4..7d14a7d267aa 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -167,6 +167,7 @@ EXPORT_SYMBOL(ttm_bo_vm_reserve);
>    * @num_prefault: Maximum number of prefault pages. The caller may want to
>    * specify this based on madvice settings and the size of the GPU object
>    * backed by the memory.
> + * @mkwrite: make the pfn or page writable
>    *
>    * This function inserts one or more page table entries pointing to the
>    * memory backing the buffer object, and then returns a return code
> @@ -180,7 +181,8 @@ EXPORT_SYMBOL(ttm_bo_vm_reserve);
>    */
>   vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>   				    pgprot_t prot,
> -				    pgoff_t num_prefault)
> +				    pgoff_t num_prefault,
> +				    bool mkwrite)
>   {
>   	struct vm_area_struct *vma = vmf->vma;
>   	struct ttm_buffer_object *bo = vma->vm_private_data;
> @@ -263,7 +265,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>   		 * at arbitrary times while the data is mmap'ed.
>   		 * See vmf_insert_pfn_prot() for a discussion.
>   		 */
> -		ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
> +		ret = vmf_insert_pfn_prot(vma, address, pfn, prot, mkwrite);
>   
>   		/* Never error on prefaulted PTEs */
>   		if (unlikely((ret & VM_FAULT_ERROR))) {
> @@ -312,7 +314,7 @@ vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot)
>   	/* Prefault the entire VMA range right away to avoid further faults */
>   	for (address = vma->vm_start; address < vma->vm_end;
>   	     address += PAGE_SIZE)
> -		ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
> +		ret = vmf_insert_pfn_prot(vma, address, pfn, prot, true);
>   
>   	return ret;
>   }
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
> index 74ff2812d66a..bb8e4b641681 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
> @@ -452,12 +452,14 @@ vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf)
>   	 * sure the page protection is write-enabled so we don't get
>   	 * a lot of unnecessary write faults.
>   	 */
> -	if (vbo->dirty && vbo->dirty->method == VMW_BO_DIRTY_MKWRITE)
> +	if (vbo->dirty && vbo->dirty->method == VMW_BO_DIRTY_MKWRITE) {
>   		prot = vm_get_page_prot(vma->vm_flags & ~VM_SHARED);
> -	else
> +		ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault, false);
> +	} else {
>   		prot = vm_get_page_prot(vma->vm_flags);
> +		ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault, true);
> +	}
>   
> -	ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault);
>   	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
>   		return ret;
>   
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 0223a41a64b2..66e293db69ee 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -386,7 +386,8 @@ vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>   			     struct vm_fault *vmf);
>   vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>   				    pgprot_t prot,
> -				    pgoff_t num_prefault);
> +				    pgoff_t num_prefault,
> +				    bool mkwrite);
>   vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf);
>   void ttm_bo_vm_open(struct vm_area_struct *vma);
>   void ttm_bo_vm_close(struct vm_area_struct *vma);
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index f5a97dec5169..f8868e28ea04 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3553,7 +3553,7 @@ int vm_map_pages_zero(struct vm_area_struct *vma, struct page **pages,
>   vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma, unsigned long addr,
>   			unsigned long pfn);
>   vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
> -			unsigned long pfn, pgprot_t pgprot);
> +			unsigned long pfn, pgprot_t pgprot, bool mkwrite);
>   vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long addr,
>   			pfn_t pfn);
>   vm_fault_t vmf_insert_mixed_mkwrite(struct vm_area_struct *vma,
> diff --git a/mm/memory.c b/mm/memory.c
> index 7e1f4849463a..2c28f1a349ff 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2195,6 +2195,7 @@ static vm_fault_t insert_pfn(struct vm_area_struct *vma, unsigned long addr,
>    * @addr: target user address of this page
>    * @pfn: source kernel pfn
>    * @pgprot: pgprot flags for the inserted page
> + * @mkwrite: make the pfn writable
>    *
>    * This is exactly like vmf_insert_pfn(), except that it allows drivers
>    * to override pgprot on a per-page basis.
> @@ -2223,7 +2224,7 @@ static vm_fault_t insert_pfn(struct vm_area_struct *vma, unsigned long addr,
>    * Return: vm_fault_t value.
>    */
>   vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
> -			unsigned long pfn, pgprot_t pgprot)
> +			unsigned long pfn, pgprot_t pgprot, bool mkwrite)
>   {
>   	/*
>   	 * Technically, architectures with pte_special can avoid all these
> @@ -2246,7 +2247,7 @@ vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
>   	track_pfn_insert(vma, &pgprot, __pfn_to_pfn_t(pfn, PFN_DEV));
>   
>   	return insert_pfn(vma, addr, __pfn_to_pfn_t(pfn, PFN_DEV), pgprot,
> -			false);
> +			mkwrite);
>   }
>   EXPORT_SYMBOL(vmf_insert_pfn_prot);
>   
> @@ -2273,10 +2274,17 @@ EXPORT_SYMBOL(vmf_insert_pfn_prot);
>   vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma, unsigned long addr,
>   			unsigned long pfn)
>   {
> -	return vmf_insert_pfn_prot(vma, addr, pfn, vma->vm_page_prot);
> +	return vmf_insert_pfn_prot(vma, addr, pfn, vma->vm_page_prot, false);
>   }
>   EXPORT_SYMBOL(vmf_insert_pfn);
>   
> +vm_fault_t vmf_insert_pfn_mkwrite(struct vm_area_struct *vma, unsigned long addr,
> +			unsigned long pfn)
> +{
> +	return vmf_insert_pfn_prot(vma, addr, pfn, vma->vm_page_prot, true);
> +}
> +EXPORT_SYMBOL(vmf_insert_pfn_mkwrite);
> +
>   static bool vm_mixed_ok(struct vm_area_struct *vma, pfn_t pfn)
>   {
>   	/* these checks mirror the abort conditions in vm_normal_page */

