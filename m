Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BBA3B3448
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 19:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC956EC5F;
	Thu, 24 Jun 2021 17:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4496EC5F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 17:03:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JfyTMrXmYwmT4r+BwLzKwow3hc93gN1c6qQ5xMmdBeLtnNLPIsTANZCQnppkJ4XbhK+XrS6Z+gFwkVIbJxEQwPL7SqxsSBNAZhNqKz9hSAUHD0mLeTMVRal3BHyuVNQ9f6cggHiODsYuMzja4amSI/tO4/A7Lg5YzWlhUoO9hvh5cEoK/TZN/djwalK2Rd/DsaYHXOGb/ojaS4QJBMMmNefk3M4J2B9zbUr2JEuw0Vc4JV6vrU+ML2Aie1VnluA9o+aDRctMiHitRh+6GdjvzeZyd9EXqz8zcy9FiejnRJk1Ag1VGLBRaKwWbMm/Jqmt9M8V4AqGnxwCBLo/VZTO7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=431rygWUZZL+aqkdiDfhKBCwLDT0NjnOcG5mMYTf0Hs=;
 b=NQLHj0ZVQPlkghyDz0XGsKdCdusHyfV8ShNNXE0UkWdT2ioGbPOEYDkxLNzt5dkl5ZDmFtbIf/+ePFaItjIptWNM99batkRpphVHIHubvin9JnX14mdKZWRctuVgqXBRPm3j5fki4xcIz1f3bcivI3lCjCXh9JamLPT/K9iBaDFGcH3SVQncgZh0SXbUr3UAKNwyLJ2xNdLpRmG9e1wZOZbLI+cIEp6zIstMqmPaIQLvtfvcQE7zW8tLsleCsRWXRHoCzH4rfCNihO2IjZVr8nLGIYvAdloTgM7Bb7Uu5BLGb71AxC1ykJY8PAg2tn9AUP7Uvv38kZaPwNkFBTODGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=431rygWUZZL+aqkdiDfhKBCwLDT0NjnOcG5mMYTf0Hs=;
 b=qbDWcGXodNCxAerOzUZvBpbDZUF8vvFK/7gyJykCdWIuH+VkXSG15CK/SB55IZTK90OMHHNSwcHPsK4owuruhp/LOvXk24bebvN5tLe6MmRPAWMgFn5qZnmwf7Z32m4oGeEsTGnWpchfrqEXsMIW58Zz4A40k2iKGKpvahotAKo=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3773.namprd12.prod.outlook.com (2603:10b6:208:164::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Thu, 24 Jun
 2021 17:03:16 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 17:03:16 +0000
Subject: Re: [PATCH 10/11] drm/scheduler: Don't store self-dependencies
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
 <20210624140025.438303-11-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <fa721d0e-46d7-b5f3-f846-560b8dad4e58@amd.com>
Date: Thu, 24 Jun 2021 19:03:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210624140025.438303-11-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:c089:94ee:b4ef:e121]
X-ClientProxiedBy: PR0P264CA0088.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:c089:94ee:b4ef:e121]
 (2a02:908:1252:fb60:c089:94ee:b4ef:e121) by
 PR0P264CA0088.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 17:03:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69980f9f-f1d6-411e-f23a-08d93731f57b
X-MS-TrafficTypeDiagnostic: MN2PR12MB3773:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3773E6FAE6E5297D45A024B883079@MN2PR12MB3773.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IVC/U8wwEjoYrX7nAxnvv0cH1VNB/5O4yLxZG+8PLnIeEFJ4yhanDkQT4uvd6wHB96plIbqKkqewWvWcyuxHUh1R97/OUKJvGpRtv7+5NClzHi0OYoVJXW8NcPt4Cjic8bZsiGIkj/MAcAj754rek687MFfjqmofOE3cpR/iBgXcRdWDrtPAAsaFPFz74orppx5YFXdfwjTZKemK2yOe57GNpWdlJF1a4CVcPKSWi1Hj4eIoTtc/Xio+TNj6kG8ChrSn9beHi9yrY5Cg2GC2lGBySISFPaaHt58FgCNjTE4roOkzE2FM98dXFq/WDDxkX4tn+UUGSYNv490Ipt0at86exUIFjFypIGLEea6uqY4Z6ten/qLrbmPnODd8HKbGX0zmvMRFip07SXAhWQIJePM2toQBSgyOV4Cz8e3BuvHsHEwAeOTyaKAhlMG2uIBMEaJmZiZwgzUEI9n+k+nm3D9PHGLUXSKM/ekxxpXCOZXjuJKc08uVckAPO6FOQy9JmdNFamruMakaf0lsUgWoRpr1zR7kDp3sd5tsZcU3jm9b0YSTbXOr5wpl0WNM/OEWzpe6vLuToWwBK3uL0BlxBM/LwRwsj7QCOIn3Y+/dhuypi8Lbj6Xf/rjghCEop+GqNW0Kxmn50YfiN8Ly8QfwEa3k6lsiGAt6klnOSO8Ty3PFP/61KK0tTnBW9C8M0aOLuB5dQ57BFG7ML7Y0tNN+CRzUl74i7RsIyEFMTy47OP6kw4r5PhcMzSe+VKgPNsaM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(6666004)(8676002)(2906002)(2616005)(4326008)(16526019)(36756003)(186003)(8936002)(31696002)(66476007)(66556008)(316002)(5660300002)(38100700002)(86362001)(31686004)(66946007)(110136005)(478600001)(6486002)(66574015)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vm1Gb3pPM2FCRG9rVTZEbFRYUGdlYVh6SWUxRFdyazlBVlFES3hPbzd3a0RL?=
 =?utf-8?B?dWdUQktrVzlVNkZTRzlDWFVQVWVhWjV5NXVkaDl0enp2cmp6b2JHSkNJcmkz?=
 =?utf-8?B?MFdvUSt3aGgxRllsVHRNMlNwWEFvaTMrV0J0d2U5ZkVYSWwyaEN4VGQ5RHRk?=
 =?utf-8?B?WDE4aDBGdUtHd3hNS2wyZkVCa1hHSUtpUzR1bXg1V29vSzdhSnh3MWRGZU1E?=
 =?utf-8?B?cXdveEJsRUNjbFdkSUJPTFFBQmI4VjJGY05Xb1pYNmFSeUlYVnRLVDhiMFBM?=
 =?utf-8?B?aDVFMGV0dnVBZGM3QzJrbG9vaWs4N1YyN0FzLzR5REhpeGJadnZDUkYvUmFX?=
 =?utf-8?B?MkNOYWEybVJWYmNCRFBYOVJRT1dEL0FqZWV5ZThVTTZCRDhPQU5tM1lGdE1R?=
 =?utf-8?B?eXN4cEVDYnQ2ZGR2YzRVSHVhSHNYbWtCYTd0NElnK01TNEJQYVlVVnpseUgw?=
 =?utf-8?B?UDE5Tzc0RGFyU3dOcTZST2lzaWt5Z1JWNDlpSjVpNytNWlE5S0cyb1FaSE1l?=
 =?utf-8?B?WEJCM2ptMjgwSkJlRTJnTnZ4MDNaVWpIY0h5L0d5bXlnUUpNeE02bytZZjNI?=
 =?utf-8?B?eGJjaUlrRzEzK3BIQ2F1UHc5em5Fcm1qNjhnQlRvTmR1R1pybmY4TlhwUDV1?=
 =?utf-8?B?ckFpYmhEakhVcXV0ZG9qWWxMWXVTRTZ4dFJTcVhVYmFRRGNlM2dhWWordlRF?=
 =?utf-8?B?c3NFaHpUVSt6SjIxaUNWRDJwcEdsOXk3R0llRHExK05Mc2djTHdicE0xYVVv?=
 =?utf-8?B?U0hqSERPQ01Rc0NRTU1meE95V01VSytSRmIzS3kwRFlsRlFFQlpoNStqeXVv?=
 =?utf-8?B?NlhUQlZLNjE3aUJvejNiZW1hQWhaMVZPVXd3b0kvN0licjJ5a1ZucW5SVllh?=
 =?utf-8?B?WHNHMllJc0E1dUhEbjY5aW10WVRzN1JhYTkvVC9ud3F0b3FLZW9FYm05c1h3?=
 =?utf-8?B?TVJpQzZHVXN0QkJJdllnUDRMblFBZis5Z0FGb0N4SmNuSDhnZUJmK2pWMEtG?=
 =?utf-8?B?V295ZWJDWEZZVFdUcGJrRXJLNjVTN1Q4amtmVTdUZGFGZkdZMnZtZnFkOEhI?=
 =?utf-8?B?b09tYXBnY1o2UncyWEloY0VqOHgvVmxEUjZIaE5tZk1jSlFSaFhKZ0tPMXZP?=
 =?utf-8?B?NmJuNXhLNmVDNnREYnMzTktrQVFpQWdyNnBvWjFwU3p1QURBTC9PRG5uUXZo?=
 =?utf-8?B?MVZJOEtrWmpHYzRLN0FtMTVtdXh2NnMrSENUeFVYNXNqUEhYQ1VoM25UZnBw?=
 =?utf-8?B?alZKbmRNZ3BuQlBRNnV1d1RVTFNUK2xvM05KUW1Tc2lWcWM0a2NjU1d3QzQy?=
 =?utf-8?B?OFZrUzFodkM1R1dqOEtWVlZCS2VVWFlZSG5XTjFuWnhPNlVZK0VTTHVHZXVh?=
 =?utf-8?B?Y25wWDRpQWk3aTBXaEhiYldxZEY3SXhPNGZNQzNvdXoxdUk2cDFZcDZzdi8y?=
 =?utf-8?B?Y3dZbHpNTkd2NnMwTGpEblltd3VpZUxzSWVFUXMvYWlBOHVGZlB6V3ZhL1pK?=
 =?utf-8?B?cGVnTTF4YmtHeDUzd2UwdmdyQnRjd3o2bDhZVTA1M01Vekc5aUQ5ZjRITGZW?=
 =?utf-8?B?UmtiTkdLdlZidmZ4SmEyRkhvSGdLeXppak1SMmFDU3hUVnlwUjNVZ2Qra1NO?=
 =?utf-8?B?YmlTbXM4SUNjem1mOER2MER0ZXA4VVB2dEdDVDRML0ZsY3VPU1g2VGYrallM?=
 =?utf-8?B?UFlZalRUVE1XRDJaeHJ4T1NtSW5kKzQ5RGN6Q0xkV0NQeXV4ZG13cEdJVThK?=
 =?utf-8?B?bS9BNDhMZE5FL1RCMVJxOGcrV2RWd0RsV1laRG85LzdVMmV4TVpRNTBHY1dQ?=
 =?utf-8?B?ZE5BWXlmeVh2bm9qODd2Q1FFSkxhNktpMFhUc1RhcVJJb1hNV3RETUdXY1hG?=
 =?utf-8?Q?cm26jGzq1yuLF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69980f9f-f1d6-411e-f23a-08d93731f57b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 17:03:16.3640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UMsmG1Vf0ZIiwVmDlx+CCl/NlL5kqAYtqQ6ExcRTWLTEJ3ZxHW97BYWGM67onyDS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3773
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Jack Zhang <Jack.Zhang1@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.06.21 um 16:00 schrieb Daniel Vetter:
> This is essentially part of drm_sched_dependency_optimized(), which
> only amdgpu seems to make use of. Use it a bit more.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Jack Zhang <Jack.Zhang1@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 370c336d383f..c31d7cf7df74 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -649,6 +649,13 @@ int drm_sched_job_await_fence(struct drm_sched_job *job,
>   	if (!fence)
>   		return 0;
>   
> +	/* if it's a fence from us it's guaranteed to be earlier */
> +	if (fence->context == job->entity->fence_context ||
> +	    fence->context == job->entity->fence_context + 1) {
> +		dma_fence_put(fence);
> +		return 0;
> +	}
> +

Well NAK. That would break Vulkan.

The problem is that Vulkan can insert dependencies between jobs which 
run on the same queue.

So we need to track those as well and if the previous job for the same 
queue/scheduler is not yet finished a pipeline synchronization needs to 
be inserted.

That's one of the reasons we wasn't able to unify the dependency 
handling yet.

Christian.

>   	/* Deduplicate if we already depend on a fence from the same context.
>   	 * This lets the size of the array of deps scale with the number of
>   	 * engines involved, rather than the number of BOs.

