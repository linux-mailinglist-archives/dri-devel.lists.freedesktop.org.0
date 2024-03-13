Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D884187B275
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 21:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E4310EA7B;
	Wed, 13 Mar 2024 20:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="W9UQb3m7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D5710E989;
 Wed, 13 Mar 2024 20:03:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNyCramj7d8ZBwZiuySnYihC9mLsl5ut6myHNwwyOrqba2HNOlEj4BirWPOdZFuQ/dap5kRSHDecRcF/VT3N3cZPqEOAqoj4ty6lq3xJ+8L/knTkt8a5RV8YvzIG/2ZbRAsDm2zTliEm5FaZleRl7k5tqDulE7TB/LKG7zdBltZnbNQUuXzqfGxCO35ACeYbYswigTZSlnEMDOoAG7Y4MZ2Ma/cmxfeT0Q4VmLpVyY76QHog9c1ewxHFUlumvQwSri1dLokfSJSjk4qA8zOKq1/5GiZy4xvJDlYyPF3qgr9QN1hG3xJd7koPM+WuYHZW6bpjY47JdHKHDZYuZTe5fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1PLlSPe5F2jSlEi6sXozzNs7J9I7H6YCGNDdaoe2Lc8=;
 b=VA9B0driMvlRTnCt0smDNMkYRFzPGWMOlDEAbhyvu8mD44TOrEWnLnXuxjeK5beEM257SwVMDgCAP0g/XdbZuqEQIOlHJr6Q6vDN78svagifin3qjBOxw50RM1pwmMshdnAULPwNF3rl/uJ4a3yIpjt6DY3uK7OY/EpaCJjM7gF9we51DlGX6y5FS4MJYNRprIhQ9hhb3PxjKACF/NMNEeQvaxZggAsFLLhmP7eErC9UslfUyco+sKw/4tqVKXZTiFMILQtKlrDxo6FKB0RKTN/wfjnVOqsmCFJG/Z3dydHiSBOJrfk2eBJ7em3JhOnwofmirBWZROfkGvVns9clcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1PLlSPe5F2jSlEi6sXozzNs7J9I7H6YCGNDdaoe2Lc8=;
 b=W9UQb3m73K6vGhGtSGXOur6yWzTJuPs6VYiHyRsqS0YcmFHBc2IRNHuL87K80SP6d3ZEkHmlr3kPrT8/m4RwDqBlGRXaof7pHk8mbJtPCgm6YtCU+5WfELB7i4VZoj6WTbRf0BnY90tyOgw7c9vMJxuyUh1qRfglof0bHem02iY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN0PR12MB5833.namprd12.prod.outlook.com (2603:10b6:208:378::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Wed, 13 Mar
 2024 20:03:41 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::8099:8c89:7b48:beed]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::8099:8c89:7b48:beed%7]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 20:03:41 +0000
Message-ID: <65d9f97b-95a8-474f-a716-32f810cbb1bc@amd.com>
Date: Wed, 13 Mar 2024 16:03:37 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH AUTOSEL 5.15 3/5] drm/amdgpu: Enable gpu reset for S3
 abort cases on Raven series
Content-Language: en-US
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Cc: Prike Liang <Prike.Liang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 Hawking.Zhang@amd.com, lijo.lazar@amd.com, le.ma@amd.com, James.Zhu@amd.com,
 shane.xiao@amd.com, sonny.jiang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20240311151424.318621-1-sashal@kernel.org>
 <20240311151424.318621-3-sashal@kernel.org>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20240311151424.318621-3-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::15) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MN0PR12MB5833:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d33c3bf-758a-49c5-4486-08dc4398adab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1/twie5rzbx/Iip+30NZ8u4TTuBIXYEZ6igdv7KQvFN18WS3mxPZlc0XwDLxgUVsYB2NSVEX3k3JErzH+zwM7EwyooB6uPoO9FY+PWIDBRsFf7z5Im9SDPfxKNRjtk9DbyF+QqZ/XmCG5ewy1lkxM1K7zL2prj3nos4ZUa22VnafbHRO24KmvszvYPs991H3EYXVC2BMe4aIaT9zbS9LoAO2VMcGJFyviIyxK42qp2G926yZ0YXd1wKLQh3vIVMWtKP3zaMFxhvFLYwuEeiWpfwXbXFC1rGDXg75ThdASmg32qBhXYmgmCPFueCYrRj/UbZQaNkQ5OF31+1tcQJwB1QxLO5Ht7IZCgMkF+OEY0ntSq59HWC8DiK0WUymD9gCqSQKL22j/94NjdjtBI3RW0LKSsmcm0bYDX1ErLNPMx/Wy2RGvZ+mB4TVjf/HFQ4ElBwx/GxadHtfzIR4GiA4pf6tyPbr+4TRd9LZb8Nug/z1lEwlFCJxn5FJNPXr9lW4pGpuLwE659T9IKN0igp7h2H3Yfu0Y07oCq+9Z616k2n7kcQErBM7eO2SjQExPvGoQh5MB5GD3hzqnQ+pHmwKdcjqJ6isr9nHYlyjTrRckTZ5YUs4zERYQUfccfc61WGsoZRa9ASD2HJbesmLPYNZMsIpxFPRwRvbyU7a9SgelVU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1hKd0FjSFNxdTIvNUNLK0dYZkxJdVg2aXdQbjRiZFN2d1NrSW4rUFJibThm?=
 =?utf-8?B?S1p0bG1Va2psQUJ2RVZZVHp2VVhEeWJ3eTJYbzlvaXF2ckdKTG1ZRTdrWEth?=
 =?utf-8?B?ZVQxaGRRdGM4UXNPemlSay9KZExSZ1liRFVjWFlPQmtzSnNaZnpLcHB3YWdq?=
 =?utf-8?B?WVVKMExxSTRYcFhDb2wvTjFSTm1iMGF4eDBhYVh5YnA2ZDdJU3dBSUg4cWsz?=
 =?utf-8?B?MURqMzgwUk1NU1pxRDdpL1UxTWZadGxrY2FEUnhrSE1KRVRPek91SDFteW9D?=
 =?utf-8?B?VjNiMTNlT29KdWFUdHA4T0FqVDdKUnBwOXRBblRNRkJRZWhZNzMrVU9qMmEx?=
 =?utf-8?B?czcwODk3bTkwamhhQXJ2OWxndE1DaUVOQ3YrREU5c2NBRGJBM0I1bGtGblpr?=
 =?utf-8?B?QUIwZXIwWjNFYW5USWFCU0R6ZWJuWGN3c2ZtcDBUalBXTTFrM21VY01Fcjlr?=
 =?utf-8?B?b3kvODN5YXNwZTdrTm9XVXR4aEtOUUdTeVNIUm5kTlpVd1BCZ1UvWDYvVnZa?=
 =?utf-8?B?MXJCalNvenhSL1RsZFdjVURYZVoydURBYlZmK01zc3l0R3ZzM1VMMEl3NWhR?=
 =?utf-8?B?eHBnN2NXQk9qc09SVCtTMjFvN1BJQTJQZG9QZkZIMGw5TjI3WXNMaVo1djVr?=
 =?utf-8?B?UElpMnczRjhqTG9OSkpxUC9HUnBlcnJtMFIrOStyRG8rWXVyRm9QRVlzT1Br?=
 =?utf-8?B?bFR6OW1tNUd0MGtDTXlsaUJHLzdjWUVBdk1RM0JmY01QKzZzSHhYK2czRGNQ?=
 =?utf-8?B?V1Z5Y0o3L1lpdXc4Zm04azMzd1RhbThFd05SakE2cW1neHZPU05RU0hFbEEr?=
 =?utf-8?B?OHdvQWlZN3R0QVNaQXhvVGFFeFpzY2Z5UUljcTUzYkNvTDRoamkySkp4OVR1?=
 =?utf-8?B?d1BtWUMzLzhrTE0zbVZQVWR0SEs0UVJIcXVpWkNDSVhTeUo1a29PKzVYaS9V?=
 =?utf-8?B?UHVUMkNUSXk4TittNG9zVVFJTW5HeVpzaVlDUGpSSXdVOW10TG1uUURDdU1B?=
 =?utf-8?B?RHpmS09LRkgrNWNJanhtbGdVTGs3ZHVKb3FWQ1JiZW1jRjR3SnJ5Q3lKLy9D?=
 =?utf-8?B?Ujk3b3IwOHFLMjJQRS9QdHdWZzB3MnUyVnZHUlRpam1UQWpvUHNiSExvT0VY?=
 =?utf-8?B?dlFDVGh0ME9wUHl3dGRYMUZXQ2V1VTBJSlQ3ZWV1NExBajNUbGR5bUsyVk9I?=
 =?utf-8?B?d2RrU3o5VzIxQ1dFMlVTVmZvUGlwNlRCVzVKa1ZseFRKY01CUWpGZlJ6NDFm?=
 =?utf-8?B?c0pIM2RNRUZtWFFLcXJFbE5lZXg0Vm15TitFK0lQejZ1R0gveDlaaEpMVXVZ?=
 =?utf-8?B?OWdCbDY1RFRYcmhOMzJYR3d5d09NenZMZXlJUEw3Y2lucVY4Z1JFcUE3Mk9N?=
 =?utf-8?B?eVpTV2lLS25SMzEzaHVZNEl6NDlvT0Q0cjVwc2g4MEM5dmJkdmlsWHhBMVdx?=
 =?utf-8?B?b2VMS3NJVVM2aEtzWjFGOGpVWkUxa2hlSlVsUDJRWmFHRC9YbXVMMTBkUkNE?=
 =?utf-8?B?NEVTbXExR2xUUDZzUjVXUjNJR1VNdEpic0NMUloxaWY2bzFPd2JLSWlhbmxC?=
 =?utf-8?B?RkdET3lWZW11VlFVeUlHU2x5N0xnRTY2NXJYeHhyQ2pvUmc4blVvOE5BV09l?=
 =?utf-8?B?VEpEb2RlT1pVaW4vSUdYS09yb2IxNFZFcThYWnZGb1ZOS0Y5RkhtZU1xUGpw?=
 =?utf-8?B?SkhBd1hydDN2VVh5Rjc3TjFEcFBGdjRmZkoyTkI2UkxwbWFmbW00a1U5YWs4?=
 =?utf-8?B?bzhMYW5rbjV1YUNVZ0lSVS9vd3p2cHN1Y3RkYTFpQ0tEcy85bnFUNVJRQmVQ?=
 =?utf-8?B?T3JYNWpsZVM2RnpRQjV4TmVWTXBUbDd4aGdqcDkwMTZVMTNmRUcwaG04Vmgr?=
 =?utf-8?B?RVI1K3N5V09jSklKSGFKRmxXQ1k0d0QzNWFwalp0ZFU1Q0xuMUhhNVVnNG9V?=
 =?utf-8?B?NmQzWC9qYXY2OU5sd2Y1eHErVEdReGNSVWh6ZG56Ui9vYk1hcS8rVjJUS3BP?=
 =?utf-8?B?MkNaZ1Z2QnJwcFBOV1BCZWN3SVBEQmxNYk5nWTJyd0xCaDdLRWNONjkxcDJ4?=
 =?utf-8?B?ajlCRnF4MjZqTjZiUThTcmhCOVdFeEpCc0ZpancrelZqNWwxV1RVWmdJOGk3?=
 =?utf-8?Q?7BE427Lvclnz3H9HcmusZXxik?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d33c3bf-758a-49c5-4486-08dc4398adab
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 20:03:40.9065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JETltVkxp6Vs85yVfNLhrIGCnZmmVCoz5D434xH3NLP+0oEMVcMn/uCKIr+ugheu6QJGnApircOUmCocdtkiug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5833
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

On 2024-03-11 11:14, Sasha Levin wrote:
> From: Prike Liang <Prike.Liang@amd.com>
>
> [ Upstream commit c671ec01311b4744b377f98b0b4c6d033fe569b3 ]
>
> Currently, GPU resets can now be performed successfully on the Raven
> series. While GPU reset is required for the S3 suspend abort case.
> So now can enable gpu reset for S3 abort cases on the Raven series.

This looks suspicious to me. I'm not sure what conditions made the GPU 
reset successful. But unless all the changes involved were also 
backported, this should probably not be applied to older kernel 
branches. I'm speculating it may be related to the removal of AMD IOMMUv2.

Regards,
   Felix


>
> Signed-off-by: Prike Liang <Prike.Liang@amd.com>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>   drivers/gpu/drm/amd/amdgpu/soc15.c | 45 +++++++++++++++++-------------
>   1 file changed, 25 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
> index 6a3486f52d698..ef5b3eedc8615 100644
> --- a/drivers/gpu/drm/amd/amdgpu/soc15.c
> +++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
> @@ -605,11 +605,34 @@ soc15_asic_reset_method(struct amdgpu_device *adev)
>   		return AMD_RESET_METHOD_MODE1;
>   }
>   
> +static bool soc15_need_reset_on_resume(struct amdgpu_device *adev)
> +{
> +	u32 sol_reg;
> +
> +	sol_reg = RREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_81);
> +
> +	/* Will reset for the following suspend abort cases.
> +	 * 1) Only reset limit on APU side, dGPU hasn't checked yet.
> +	 * 2) S3 suspend abort and TOS already launched.
> +	 */
> +	if (adev->flags & AMD_IS_APU && adev->in_s3 &&
> +			!adev->suspend_complete &&
> +			sol_reg)
> +		return true;
> +
> +	return false;
> +}
> +
>   static int soc15_asic_reset(struct amdgpu_device *adev)
>   {
>   	/* original raven doesn't have full asic reset */
> -	if ((adev->apu_flags & AMD_APU_IS_RAVEN) ||
> -	    (adev->apu_flags & AMD_APU_IS_RAVEN2))
> +	/* On the latest Raven, the GPU reset can be performed
> +	 * successfully. So now, temporarily enable it for the
> +	 * S3 suspend abort case.
> +	 */
> +	if (((adev->apu_flags & AMD_APU_IS_RAVEN) ||
> +	    (adev->apu_flags & AMD_APU_IS_RAVEN2)) &&
> +		!soc15_need_reset_on_resume(adev))
>   		return 0;
>   
>   	switch (soc15_asic_reset_method(adev)) {
> @@ -1490,24 +1513,6 @@ static int soc15_common_suspend(void *handle)
>   	return soc15_common_hw_fini(adev);
>   }
>   
> -static bool soc15_need_reset_on_resume(struct amdgpu_device *adev)
> -{
> -	u32 sol_reg;
> -
> -	sol_reg = RREG32_SOC15(MP0, 0, mmMP0_SMN_C2PMSG_81);
> -
> -	/* Will reset for the following suspend abort cases.
> -	 * 1) Only reset limit on APU side, dGPU hasn't checked yet.
> -	 * 2) S3 suspend abort and TOS already launched.
> -	 */
> -	if (adev->flags & AMD_IS_APU && adev->in_s3 &&
> -			!adev->suspend_complete &&
> -			sol_reg)
> -		return true;
> -
> -	return false;
> -}
> -
>   static int soc15_common_resume(void *handle)
>   {
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
