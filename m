Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4374870FDDD
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 20:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04A310E4D9;
	Wed, 24 May 2023 18:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F39E810E208;
 Wed, 24 May 2023 18:27:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bznFbUYNicy7I31JqvlX0qD92raHtAtL88NRoeeIKo2u6IqJGn25i34Hld/xkmA0Ytokd8XanmOXKQxtfPeyRpRqkrz7OMGz6Ckv5HBvtpOxlPsE3/jIk01Wr2e3+kIPn8k6xWoRgYIAWP2QiBIi6jAMAyFpp/vAnOGGmMPWKlWfC0D0A49IxYR0Cf9bGEiGvh6500Z9bSzVfmICT/h2bQT5QPARSWJOOnFkxz9Od08Z8wpVDX3TJ4wEzgFXztRa9RjaPxYsOIXAre9TzR9tOgo18iHnN4x21nkRHRobGw/ceacGCgbyr6mtLzb+xNBYQdVrcHwtPCOEz237nqP3iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxK8a2PyR8CJRz/t/up9caLi1QOTznoy+fWWShMd/4Q=;
 b=PTrLIrzeXJZ7iaHgxPbWZSZF5LaDODLltjwYjEDAD3+SDE6IcO9FJ4LcocAlDFwNGzJ3o2xCrAYv4WDTWHPpxUYovUyn+96iVpqKksUjefRSY2jPC656vr9uni4KfZhliwVF8revTt2etxwjubSlMByXu9iJzL0tWlrp1WaQarZHwptao46ILO5ey8zEXiH64J5AG+2UyRK1ep56KuJxEThwzIwzBr5moedaGfWN74Sjf/LkK5F36gIz6nagRJrMgqNTNisXVXrlLNLhajLMjBTSV0qsAsSWF38DOI/RV/dK2aeemPvUfnpjROKC3DrGR1m5woP8DTf2Ta9tvp/BxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxK8a2PyR8CJRz/t/up9caLi1QOTznoy+fWWShMd/4Q=;
 b=fO6h06uIiEogqQiIpLF4xxJXjq3S2zVZsmydShLB0GS53IkZCtQsDz4IYabeJwQRyiCtYFvy4gL7ZWpbDQGrIZDgqr9honyg/CHwdryCFyOvGNI/tIkMB5UBtUzQ9/9V0RfGCppFUWKX8fkmMQ13/29HSUnDpSuwmDrsQqKSezA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4879.namprd12.prod.outlook.com (2603:10b6:5:1b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 18:27:41 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e566:9ca5:28e0:a42b]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e566:9ca5:28e0:a42b%4]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 18:27:41 +0000
Message-ID: <a9fe9bc4-b6b2-444d-2a6b-500637c96906@amd.com>
Date: Wed, 24 May 2023 20:27:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] amdgpu: validate drm_amdgpu_gem_va addrs
Content-Language: en-US
To: Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230523225336.2642008-1-olvaffe@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230523225336.2642008-1-olvaffe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4879:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cccff9f-1cc8-4df9-704b-08db5c848eea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: It5V3iynb5+joXK9QpXM7xQjktLvw1M36kkxQb88p0OrnJM9HRxnkvUCAV9X6g1ANFPz0mDS1QDZJsRJ3b0RtX0S1jrmnAH5MakARAPAs/FW91f+DnXitaXQS8nm2FYHNKYYdk9YO8aNIkod0PTbLTVRxEZB099QVO45Op8VnWFD+L04XCFxJebubC0MBjf+fvD13zBO0mUdq2xa9V+uwME5T93dkoU5wPNpJ/BWQMM7Edr3kHY3MFjQ31msF8Mdp3KwD6oFTglXz/TQqz5kz/OQzdjgrtSQnYvDoSfJb/URfHUL6eh5a6ETOConJXiHTwP7d24CojR7ZBiuDyNEg3G0K9tMTsHJR2a4xWbNhfNP2cbpvaNJxgsOJAx7Gx0swWtE5nXioi0fOVSCPGEMYvdRXIElnNurTkNCLFWBmqtZVYtaz9bv0N/Xp2jlSDP2mNlr7VLkM5eQ95OfPhQGZ8wD4h457h2RyKL3XEbT33dn063+ti3cDS9tU6EDqlNmaXiSrV3LaE2UvkCCz5ptKQs72SDhuzxvBlIlXR/0270n6mLL76hYXku/67WefT3B+PAwqjTvSaqSZ8KiD9iHgxbFaOHfVV46UcfKBEsC9xBlWTDLxC6rGUexTV5lNq/0iH918MY2jpx+eamlauzBLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(451199021)(5660300002)(7416002)(8936002)(8676002)(186003)(15650500001)(2906002)(86362001)(2616005)(36756003)(83380400001)(38100700002)(31696002)(6506007)(6512007)(316002)(6666004)(4326008)(31686004)(54906003)(478600001)(66946007)(66476007)(66556008)(41300700001)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SklHNlJZRnhOc2VCUTU0ZjhxNVhyRHhKQWlJOXFtOFVMTVNCTFdxQ3V6OVhP?=
 =?utf-8?B?SmpOUTFwanVCOGdHemQza1M4MWVMUCtXbnExcE83L3RCRGpGU0llY1JzN2xN?=
 =?utf-8?B?bTZLNjZqczRDRUliU1U3eStuWUVFN3M2VFlWQlJUZFJJcjlpOTdYa3JaNFc2?=
 =?utf-8?B?MXBWVTh5bWVIWXpCdk1oWjE5NGxyem1kNC9vZGUwbXFXTzRUWVJaOHhDU3pM?=
 =?utf-8?B?OHVwTWs5akszaWRNZE9qblRFWEVSMVNjTXpudW1pU2tFT0tZT3FQL3czVGdQ?=
 =?utf-8?B?N01MZWtZdE9jNXlQQWZzNDJLU24xZUhnNkcwNGdxeXFRR0hTd2R2WS9mUnF4?=
 =?utf-8?B?MmE3NWQrdTFmZmd4N2RISmFiVFd0aEdSMWVHUVJEWFRqZ1hiY3hXUnhXWTZw?=
 =?utf-8?B?TURzZjdVLzU1c1ZMTTl3ZlRUaTMyUjJSdDJOdnRiMDNqWU1jUDc0SE53ejUw?=
 =?utf-8?B?cGFCb091N3RuMDYzaXU1UXo2SlVYTS9XT1N1RitUWk5RdUh1WGEvT1IvNnJH?=
 =?utf-8?B?Y2hjM2NqMEplalFqYUg1MnRkYUdjc3NZVTRNQytaMWdZRWJNdWRQb3BGa3o0?=
 =?utf-8?B?enNNTEp1N1VRWkhEQ3RRSlh6LzZWeTIxdGh2VjhYdnA1V2NCc0x5WHRmeDNt?=
 =?utf-8?B?Rnhic3dBaUU3MTJYMXBVYTIzZUNkY3hjVW01aFExTW9Qb04yQ2FXRElqOWF0?=
 =?utf-8?B?M2FUS1J3ODA4dEZCQlpaRG5OYzhaZkh0cGVnN2FrRm81NUlmMW9RcG1jRDhP?=
 =?utf-8?B?bUxDOWt4UDFnRE1aNjk5OVFVdUFhZWZQN1R4TTJuTWFIODk2c1F2VW5zeGVP?=
 =?utf-8?B?QW56S3o4NjVtbmh5NG9POFZ6Yk1DR3pkaERpM28zNS9GQlkwcUtoMjA4R2ZH?=
 =?utf-8?B?K3ppWmkyQzNEanVobkQ3M3BVaVhTa0lQUHRkV3QwZ2g1aU9mRWtXTzIyUUNS?=
 =?utf-8?B?RVZnbTZoWk9KUjJWWUhnN3g1SGVRdGJYVVBtQ2JHa2o5UGp5ZVlSV0Z5ZHZV?=
 =?utf-8?B?MFIxN2Z3Z2VyQXl2NGpQRlZOTjY4dHNXMHB6cjdxVElNOHVJZThnTER3V3Vj?=
 =?utf-8?B?UmYxWC9tREtVQWtuN2RFT0NoVkkyTjFhMmFOYnhoM0hoTU5xQmF2clJ5bDFp?=
 =?utf-8?B?dlZsYjFoU1FLcjh2L2hVSDdYMFh1M21VY1F1MXdqWXJzbzRjWVhPMjErU3Rt?=
 =?utf-8?B?a2tFTVZSSVZCTU5CS2dLaG42ZEkvQ3h1R01leHVMbmhpRlFYeERRR2pqdWRG?=
 =?utf-8?B?TGlCbVZFTnVSVk1Ga0FweXIzTzBRV1o1VTh1T1prbC9BaFd0clhzK05rY2RH?=
 =?utf-8?B?NXBzUDUrMzhKa0NFWE1YaW5KanVhbER2MXBHVHFndi8yLzdjOE5hNi9aWC9N?=
 =?utf-8?B?citORkpCZlc0Zjczalg2d3pNd3NMVHZzdG5NTUZKN1ZpckRTMm5MNVRWWUtY?=
 =?utf-8?B?WnRleTZSVnUyUWtDZmdId05DUTNmaU5MZXpnTnRKUkZld2RrZ1NmMGI5bk0v?=
 =?utf-8?B?UmRMaDZqNUF2ejZ0R3gxb0hVQUI0UkNER1RvR3RxM25kNFdGejRqVHFHdG5p?=
 =?utf-8?B?djJQUjhDVG5GTUorNlEvWEZnbkF2eWMwOFlBbENwZHg1akpEZSs1RDNkS0R3?=
 =?utf-8?B?UE5DVVRQYXJrRXppNEtjYWpJOExtRndESlBRbDZhUnpYazNLdElQSS9jUXRI?=
 =?utf-8?B?VmQwcjg2UHpzbjRkKzdENXNSRG1ybVNiL3FHWFZpamtwamRIc0l0ZmpPRDhX?=
 =?utf-8?B?YVE0a1dnVXlsaDBWRkY4QytyS3Z1K1Jhb1QzY04vT1JqUFJLdzNPYzM1UStR?=
 =?utf-8?B?dkVOclp3Y1RmeWp3elVSSjNvQjAxT3J5S1dPcEJvNHoyQ2RLR2xHcWw3czQy?=
 =?utf-8?B?MUV4bUk0WkM3ZWVocXU4eWNhTllJSjd4OFlhaXlzUDl6YW9zUzQ2VmtWNUda?=
 =?utf-8?B?bGV4Z2ZuMTQzbDVQdG9uTGVrd0pJVUVVWk5wQUJsaVBubzdwYkNPa0xTL2dF?=
 =?utf-8?B?aHpCTGhSUzlCU0VzcU12bU52eHRQeGlRR1F5d1R3RGVER1hybjhXRE8yTHVH?=
 =?utf-8?B?dHcxWVg2MjVmU0pFTU9NMWhPOE5NdENGRFM5QXdrb3JJaXZISDg5Vkc4UEll?=
 =?utf-8?B?bi8yREx2VGpIdExOc1JCUjlqbHNTa3BpbTZWTDF6ZWxmWFpPMXAvcTJIamlF?=
 =?utf-8?Q?irdnB+acPS9crMonQKbpuccwrPHYLCJzrp3f2Sae4OTR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cccff9f-1cc8-4df9-704b-08db5c848eea
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 18:27:41.0361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vjMJss8r8mXm9Omh94Gs/nDeD+M+pGpZ2w9DLF7EFdEnyRRak+DuoFVvgd9hHj8+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4879
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
Cc: Philip Yang <Philip.Yang@amd.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Jammy Zhou <Jammy.Zhou@amd.com>, Mukul Joshi <mukul.joshi@amd.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>, Yang Li <yang.lee@linux.alibaba.com>,
 Danijel Slivka <danijel.slivka@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.05.23 um 00:53 schrieb Chia-I Wu:
> Validate drm_amdgpu_gem_va addrs in amdgpu_gem_va_ioctl.
> amdgpu_vm_bo_replace_map no longer needs to validate (and its
> validations were insufficient either).  amdgpu_vm_bo_map has internal
> users and its validations are kept.

No, please keep all validation inside amdgpu_vm.c code.

See the offset is unused or might have a different meaning for some use 
cases, so validating it here is actually not correct.

Christian.

>
> This is motivated by OOB access in amdgpu_vm_update_range when
> offset_in_bo+map_size overflows.
>
> Userspace (radeonsi and radv) seems fine as well.
>
> v2: keep the validations in amdgpu_vm_bo_map
>
> Fixes: 9f7eb5367d00 ("drm/amdgpu: actually use the VM map parameters")
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 15 +++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  |  8 +-------
>   2 files changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index d8e683688daab..36d5adfdf0f69 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -681,6 +681,21 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
>   	uint64_t vm_size;
>   	int r = 0;
>   
> +	if (args->va_address & ~PAGE_MASK || args->offset_in_bo & ~PAGE_MASK ||
> +	    args->map_size & ~PAGE_MASK) {
> +		dev_dbg(dev->dev, "unaligned va_address 0x%LX, offset_in_bo 0x%LX, or map_size 0x%LX\n",
> +			args->va_address, args->offset_in_bo, args->map_size);
> +		return -EINVAL;
> +	}
> +
> +	if (args->map_size == 0 ||
> +	    args->va_address + args->map_size < args->va_address ||
> +	    args->offset_in_bo + args->map_size < args->offset_in_bo) {
> +		dev_dbg(dev->dev, "invalid map_size 0x%LX (va_address 0x%LX, offset_in_bo 0x%LX)\n",
> +			args->map_size, args->va_address, args->offset_in_bo);
> +		return -EINVAL;
> +	}
> +
>   	if (args->va_address < AMDGPU_VA_RESERVED_SIZE) {
>   		dev_dbg(dev->dev,
>   			"va_address 0x%LX is in reserved area 0x%LX\n",
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index b9441ab457ea7..6307baaa136cf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -1501,15 +1501,9 @@ int amdgpu_vm_bo_replace_map(struct amdgpu_device *adev,
>   	uint64_t eaddr;
>   	int r;
>   
> -	/* validate the parameters */
> -	if (saddr & ~PAGE_MASK || offset & ~PAGE_MASK ||
> -	    size == 0 || size & ~PAGE_MASK)
> -		return -EINVAL;
> -
>   	/* make sure object fit at this offset */
>   	eaddr = saddr + size - 1;
> -	if (saddr >= eaddr ||
> -	    (bo && offset + size > amdgpu_bo_size(bo)) ||
> +	if ((bo && offset + size > amdgpu_bo_size(bo)) ||
>   	    (eaddr >= adev->vm_manager.max_pfn << AMDGPU_GPU_PAGE_SHIFT))
>   		return -EINVAL;
>   

