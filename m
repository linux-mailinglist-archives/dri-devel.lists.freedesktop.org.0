Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CA069B011
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 17:00:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74A710F076;
	Fri, 17 Feb 2023 16:00:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::620])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F03310E2A3;
 Fri, 17 Feb 2023 16:00:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N54vqGqZQ6vKX+uoEWU7SFUlb1GLBt7TlEph4DXonJluQvgRvFuPlwjDZH17GFvPB/B3ipUh3l8bcygrJKXxqiaUpsbHuQfnul15/dFtarxCENgT0nPhoLxqvnF1tE+ckXP8mlRkkojL/XznKpfUaa5fsg1GEndO40II4XW2nG0IfL5KH4r14UimbxOHDR5oLJudnjuyK0MIp/7rG1DVU9XggGxsD9RTKZd4qP0VNjst71bl7S0EhBOf58bDq1nPXzDbhj/Gi9EEN+h9eAJrASa7hD6t/Rc1Vd32WF6tH9ZshCI6F/oW3eGCG227PDHDNjfioQK5g4hT4MAXr8Z+bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUN6019s+fMYFjsQy+cpRQiRN7BFxWmpvWngbkomfgU=;
 b=ZMumIdhsme+xKeTFkzMWdM2dP4SyZT1CkuzHSUo4ssUM9TydtvmeBu9AlXJoW5pG98RCq6tyFqk5cQiuXz6DfQ9kPPxEV8UvHqsCqqtPZ1Zd2dO/m2EEO3lV5GO6MIoxySdn+3+T5QIih7CVj9mmZwqo8tPq2XHy9/yCpaXb/lk/J83NE3xk79MN58m/96ufi/8Nvf5AX1jimIhV4rnttu9f9WlDxM8kwqcYvxv6Gmgskda5f8Hj9f9UzPVZo7SHivCTkdr1VIqPVyl7YQCAkvxlPCbhs+PoZ7YrVcpe8nNMuEl2SVD2MejyHC0Ivvi2ewD6AyTadUMhzC5CHeonIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUN6019s+fMYFjsQy+cpRQiRN7BFxWmpvWngbkomfgU=;
 b=2u8i10WYZ14jqkNidxlhJeHDu57fOvJE7ybHmEAJ1NyEGwhJkMZPsJT6ep3P/UwLnCFUEKehHEz5dVWsg1PrVq5aOuOv1QbvP+9/uAcwFBfZOBmwrM9grPqtVoAEa7ASwbaU3UhQoh5UnoWvoSWtTx9t8kVsDUqkjhtiR0bLUUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB8060.namprd12.prod.outlook.com (2603:10b6:806:343::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Fri, 17 Feb
 2023 16:00:19 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 16:00:18 +0000
Message-ID: <38ebd698-0619-6f02-7a7c-4349e5971b6a@amd.com>
Date: Fri, 17 Feb 2023 17:00:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH drm-next v2 01/16] drm: execution context for GEM buffers
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 tzimmermann@suse.de, mripard@kernel.org, corbet@lwn.net, bskeggs@redhat.com,
 Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-2-dakr@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230217134422.14116-2-dakr@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB8060:EE_
X-MS-Office365-Filtering-Correlation-Id: 14f80312-c21a-4e90-c6c2-08db11001106
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7LgyurCUU6hy4WL5erZd7P5IvejBaWTGxMYMMqakIp6OCF0ciCQJpWlsyyDfeWlCJWNn0I5Xo//3HMX5YYij9oZCxLUuFNFtXdNRPIm6TIBIYBAB+4wBuiE3MPPoLDtGpY2pK9cgbjBc1AxdgWh4fOxCrGnqaa1w3znoB4iJJ/g2lXjbM/PK0F4C93QcKdgmsqpeeELIuFFPJqvnMgT4N4vP5cK92rf32hzM8MhVMw6/JdFGPhq9E736PN7li+gITVotFDKGbd899Rke9Qqc3xFloC522FPepGB+fMmWrAzSkxDQjAmv8+Tq2L1vrJihVgGDPFHBmuNhMY5N9oTGJE5so+eXMmosUxYWGekLzii4cG8ojyUzeaPIPMeSstUSSsED1AxoYe9X4aZ3Wm183Ra5JUIkown3JESKwR1Gqj7x9GfqrLlPbhzcTYOUy0A34DwtBpYluP0CHfLJ6MuiZQaAkrs7oMjt0KwVb2vVeqWyfMXCrMugzoa5vLQ54UGHsjKtPUD0ROZDa/NShjDYqAoW3czkmeQK+f68HimXa42egQoDds81diqeDJA+cbRXdNB2/vm2Jid5E0+EnU0IYWVNkvEW7XgAVfJy1LJwaB6Ta9B043rZgfuJDhev81JesEJeyfXSmPwSMe4pZEQZNrppTAqQxXYU0lcg/lR8nQdTn2mwISXqzmMYur0KxtyyYyYqPGnc/unu1BXwFSvJTK3id4Q8R8rCJ6yW0B9NvzAVEr9wZGPtF8KJquduZGoGXIUbKW0vk3qMIiqO1hZQ4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(451199018)(186003)(2906002)(6512007)(83380400001)(36756003)(6506007)(6666004)(31696002)(66574015)(2616005)(86362001)(478600001)(6486002)(8936002)(316002)(41300700001)(921005)(31686004)(8676002)(30864003)(4326008)(66556008)(38100700002)(5660300002)(7416002)(66476007)(66946007)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0E3S1gwOTZla3RIcUNKSjJlV0RDREQ3QnlDTVZ5MDkvbXA1OUgwUnpaWWRk?=
 =?utf-8?B?all3K2lIMWhETjRJTWh4ZDQ4ay9OS2UrN1RobDkwbHJVRXE0cWNQY1podUg4?=
 =?utf-8?B?M2xDVEphdzRkSkhraGd3UGg0Ny9pR3FZK2w4eTRGQy9zMnhVQVFNaW1VYWVr?=
 =?utf-8?B?cHh4UHpkWFRLeVNwZTBaUHEySFR0UGd5VEk5WStURm1PbmpqdTBZVmhFS1RP?=
 =?utf-8?B?OTdYVTVrQjJmWWV1eVRVSzVKU2U5dGFZVkFQL0JBRjNkd2tJMEFjMWJ6cTNk?=
 =?utf-8?B?dEUyRGJhbzZVSW5PNitRZVd5VHllRWlZNlU5cUZERE0rWUpmREFRWmx3WWV6?=
 =?utf-8?B?eG9iUDZsTFZtd2g4NUNCbUQ4RXB2LzYrSVZiVnd1NEt2b2Y3WllXN0dMbHU4?=
 =?utf-8?B?N09ZZzNveGViL1lSdlNDa1laUFQyazRFeDhya0YxMWQwNGl5U0RQQ0xFdFdV?=
 =?utf-8?B?QXBsTXozaVBoT2tUVnlwWVFxUFRtVGhnd1FjSnc3ZGk5Z0N4OHcyY3diOHN4?=
 =?utf-8?B?YUN1MWU5d25VRmlGTFRoUURqc2lPVFgwK2h1Wlk2eXRrallVMkZoZHFKZHJh?=
 =?utf-8?B?RzY5a3g0bUZpRU9WUUtlQ2VUQS9NYzVON3ZqZzgydHV0c1pXSzNTZzJ5L3E0?=
 =?utf-8?B?WnFKV2RsRnhZWW1sV3p0TVhyWUY2NlY5R1Q5c2c3SmY2SkQ3emUwdkdLNnNU?=
 =?utf-8?B?dVJvRk1xTU01ZHpJVTdpWkRFWE9WSm5hSXh6K0dCY2szbnljZjFSOW5mSTJu?=
 =?utf-8?B?S2ZXZmZhbkFtM3oxbzNnUHFza0hma1AwRC8wNFJHL1NGdXcwNHF1SXVxUTg3?=
 =?utf-8?B?QTRzQnREbzFhYnYxUkRsdXdxWmJLRXA0YVRQVVJRcHB2bE5IYlgvaDNsN2FW?=
 =?utf-8?B?dnZxNDMrQ1RpYXk2aklBQ3ZPcU9ZcXRtdW1XRlV2WGFmcEZmWkVrRDVvR1o5?=
 =?utf-8?B?dU91elN1S3F0czlCOURsS01aWW5jcjBCTUMrQmJUVDh0ZG1kM3FZWEE4SGdU?=
 =?utf-8?B?Qk56SUdmc3JFMVBIeFU3a2pRTFJBajVIL1JyWFlhc1NDb2ozdFlVcEFkWk05?=
 =?utf-8?B?dGU2MFJIRFdFZGpuNnlpMWZsTWZPL3N3Yzlmdndqbyt4dXlqbGdFZFNUM1Vt?=
 =?utf-8?B?eWcxcnB3K2FWKzcvSi9pdXE0bjRrSStvQnNGNkhVbEoxc1R0UGZGNXEyN2R2?=
 =?utf-8?B?ajZFRXVpa1Y3UnJSbHNSN3c1YzNGay9OQS8vL3R4eGllM1FhMC9TeWlkdFFL?=
 =?utf-8?B?NHBpNU1CMjRGVkZ2aElFekk2VTg0bTVqT3lvMW8zcE5GL08xK3QwQWVtZXdD?=
 =?utf-8?B?aXkwTHFIejhZdmdoOWRMVWI5RHkxK3ZHVU03bFM4dDVBWlVNMW9KTGp6c3M4?=
 =?utf-8?B?Z043ZGRLb0ZTT0tOUGFNNlc3c2ZPZCs5M3BiSE1tRDVhbXp5eDFiYk0xY1Q3?=
 =?utf-8?B?ekxPZnQ3SDdlMXBYMlFyOHhkbTVkVEJrdXhFYWNEdnFNa3Bjd3Mza1NpdFZI?=
 =?utf-8?B?UFN0WmxSdGp6SnlBekVyL1pIbExyTlNROS9HYUtEZUFoZ01YeVRYbzQyYnll?=
 =?utf-8?B?TjVUNFE5bXJjaHVaWm8vTS9KQjQ0THgza2kvUEhuT3BIZUswZTJXZVIwQVMr?=
 =?utf-8?B?QlhGRjNidzJGRkhEU2ozOFRkSTE0ejB5Y0JUZmJiOFVibXlMZzVHelpIa0hS?=
 =?utf-8?B?Rk5mc1M0clJFZGxYa3ZGeFlvclMzTWhNUmZ3RkMwYlRsS3RxS3VMVWwyVHdi?=
 =?utf-8?B?cmtIT3FCMlgxeXdkaHREM2JVVkUzWWpRUU1wS2dLVTNsSDg0MFZ0dlhKcVZM?=
 =?utf-8?B?YXJUTU5IRnlCWVlUbkd6K1NTL1hrbW1HV2YrSVp0MHllMEgwNlcrSEtJUzVM?=
 =?utf-8?B?YnlVVkJSOFZaZkl0UW5vM29oUGlqQTFuWDlPRFJCNTFnRWhlRDdsRTgxK0hh?=
 =?utf-8?B?QUl5ZEhYOGgxelpoSDU4bDRuOEgwbzFWckd1dTFCREU0aVlyZWJsMUhUTG5S?=
 =?utf-8?B?NDUrQjFtbytjWXNEQmY5SXFud2tnRDJlV3JTbk9aRWRzd1pGazhpd1A5dGcy?=
 =?utf-8?B?akI4VFNrbWhtMEJMalJOZ1hEKzlNU3ZROG5nanRzN3pMWlpSdzB3cDNqdmll?=
 =?utf-8?B?UFlPVjV1aFAweVR4aFJrUFFsVmd5NlQzVE1lRmxHcm5tMEs0bWRWQWVPQjRU?=
 =?utf-8?Q?gFApyNQwM3xs/TYFs4G3+cZEhOSIAjzVTyDfwBsH6/Cc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f80312-c21a-4e90-c6c2-08db11001106
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 16:00:18.8104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NqNx421j/swYfvO7tSbS7s8Id+4/Tl9kPaU7gc21xzTFXzUGux1bkLdRffOLACD1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8060
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
Cc: linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.02.23 um 14:44 schrieb Danilo Krummrich:
> From: Christian König <christian.koenig@amd.com>
>
> This adds the infrastructure for an execution context for GEM buffers
> which is similar to the existinc TTMs execbuf util and intended to replace
> it in the long term.
>
> The basic functionality is that we abstracts the necessary loop to lock
> many different GEM buffers with automated deadlock and duplicate handling.
>
> v2: drop xarray and use dynamic resized array instead, the locking
>      overhead is unecessary and measureable.

Question for Danilo and probably others: Does Nouveau make use of the 
duplicate tracking at some point?

Background is that I only have two or three use cases for this in 
radeon/amdgpu and would like to make it an optional feature.

Going to take a look at the rest of this series next week.

Regards,
Christian.

>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   Documentation/gpu/drm-mm.rst       |  12 ++
>   drivers/gpu/drm/Kconfig            |   6 +
>   drivers/gpu/drm/Makefile           |   2 +
>   drivers/gpu/drm/amd/amdgpu/Kconfig |   1 +
>   drivers/gpu/drm/drm_exec.c         | 295 +++++++++++++++++++++++++++++
>   include/drm/drm_exec.h             | 144 ++++++++++++++
>   6 files changed, 460 insertions(+)
>   create mode 100644 drivers/gpu/drm/drm_exec.c
>   create mode 100644 include/drm/drm_exec.h
>
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index a79fd3549ff8..a52e6f4117d6 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -493,6 +493,18 @@ DRM Sync Objects
>   .. kernel-doc:: drivers/gpu/drm/drm_syncobj.c
>      :export:
>   
> +DRM Execution context
> +=====================
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_exec.c
> +   :doc: Overview
> +
> +.. kernel-doc:: include/drm/drm_exec.h
> +   :internal:
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_exec.c
> +   :export:
> +
>   GPU Scheduler
>   =============
>   
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index f42d4c6a19f2..1573d658fbb5 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -200,6 +200,12 @@ config DRM_TTM
>   	  GPU memory types. Will be enabled automatically if a device driver
>   	  uses it.
>   
> +config DRM_EXEC
> +	tristate
> +	depends on DRM
> +	help
> +	  Execution context for command submissions
> +
>   config DRM_BUDDY
>   	tristate
>   	depends on DRM
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index ab4460fcd63f..d40defbb0347 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -78,6 +78,8 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
>   #
>   # Memory-management helpers
>   #
> +#
> +obj-$(CONFIG_DRM_EXEC) += drm_exec.o
>   
>   obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
> index 5341b6b242c3..279fb3bba810 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
> @@ -11,6 +11,7 @@ config DRM_AMDGPU
>   	select DRM_SCHED
>   	select DRM_TTM
>   	select DRM_TTM_HELPER
> +	select DRM_EXEC
>   	select POWER_SUPPLY
>   	select HWMON
>   	select I2C
> diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
> new file mode 100644
> index 000000000000..ed2106c22786
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_exec.c
> @@ -0,0 +1,295 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +
> +#include <drm/drm_exec.h>
> +#include <drm/drm_gem.h>
> +#include <linux/dma-resv.h>
> +
> +/**
> + * DOC: Overview
> + *
> + * This component mainly abstracts the retry loop necessary for locking
> + * multiple GEM objects while preparing hardware operations (e.g. command
> + * submissions, page table updates etc..).
> + *
> + * If a contention is detected while locking a GEM object the cleanup procedure
> + * unlocks all previously locked GEM objects and locks the contended one first
> + * before locking any further objects.
> + *
> + * After an object is locked fences slots can optionally be reserved on the
> + * dma_resv object inside the GEM object.
> + *
> + * A typical usage pattern should look like this::
> + *
> + *	struct drm_gem_object *obj;
> + *	struct drm_exec exec;
> + *	unsigned long index;
> + *	int ret;
> + *
> + *	drm_exec_init(&exec, true);
> + *	drm_exec_while_not_all_locked(&exec) {
> + *		ret = drm_exec_prepare_obj(&exec, boA, 1);
> + *		drm_exec_continue_on_contention(&exec);
> + *		if (ret)
> + *			goto error;
> + *
> + *		ret = drm_exec_lock(&exec, boB, 1);
> + *		drm_exec_continue_on_contention(&exec);
> + *		if (ret)
> + *			goto error;
> + *	}
> + *
> + *	drm_exec_for_each_locked_object(&exec, index, obj) {
> + *		dma_resv_add_fence(obj->resv, fence, DMA_RESV_USAGE_READ);
> + *		...
> + *	}
> + *	drm_exec_fini(&exec);
> + *
> + * See struct dma_exec for more details.
> + */
> +
> +/* Dummy value used to initially enter the retry loop */
> +#define DRM_EXEC_DUMMY (void*)~0
> +
> +/* Initialize the drm_exec_objects container */
> +static void drm_exec_objects_init(struct drm_exec_objects *container)
> +{
> +	container->objects = kmalloc(PAGE_SIZE, GFP_KERNEL);
> +
> +	/* If allocation here fails, just delay that till the first use */
> +	container->max_objects = container->objects ?
> +		PAGE_SIZE / sizeof(void *) : 0;
> +	container->num_objects = 0;
> +}
> +
> +/* Cleanup the drm_exec_objects container */
> +static void drm_exec_objects_fini(struct drm_exec_objects *container)
> +{
> +	kvfree(container->objects);
> +}
> +
> +/* Make sure we have enough room and add an object the container */
> +static int drm_exec_objects_add(struct drm_exec_objects *container,
> +				struct drm_gem_object *obj)
> +{
> +	if (unlikely(container->num_objects == container->max_objects)) {
> +		size_t size = container->max_objects * sizeof(void *);
> +		void *tmp;
> +
> +		tmp = kvrealloc(container->objects, size, size + PAGE_SIZE,
> +				GFP_KERNEL);
> +		if (!tmp)
> +			return -ENOMEM;
> +
> +		container->objects = tmp;
> +		container->max_objects += PAGE_SIZE / sizeof(void *);
> +	}
> +	drm_gem_object_get(obj);
> +	container->objects[container->num_objects++] = obj;
> +	return 0;
> +}
> +
> +/* Unlock all objects and drop references */
> +static void drm_exec_unlock_all(struct drm_exec *exec)
> +{
> +	struct drm_gem_object *obj;
> +	unsigned long index;
> +
> +	drm_exec_for_each_duplicate_object(exec, index, obj)
> +		drm_gem_object_put(obj);
> +
> +	drm_exec_for_each_locked_object(exec, index, obj) {
> +		dma_resv_unlock(obj->resv);
> +		drm_gem_object_put(obj);
> +	}
> +}
> +
> +/**
> + * drm_exec_init - initialize a drm_exec object
> + * @exec: the drm_exec object to initialize
> + * @interruptible: if locks should be acquired interruptible
> + *
> + * Initialize the object and make sure that we can track locked and duplicate
> + * objects.
> + */
> +void drm_exec_init(struct drm_exec *exec, bool interruptible)
> +{
> +	exec->interruptible = interruptible;
> +	drm_exec_objects_init(&exec->locked);
> +	drm_exec_objects_init(&exec->duplicates);
> +	exec->contended = DRM_EXEC_DUMMY;
> +}
> +EXPORT_SYMBOL(drm_exec_init);
> +
> +/**
> + * drm_exec_fini - finalize a drm_exec object
> + * @exec: the drm_exec object to finilize
> + *
> + * Unlock all locked objects, drop the references to objects and free all memory
> + * used for tracking the state.
> + */
> +void drm_exec_fini(struct drm_exec *exec)
> +{
> +	drm_exec_unlock_all(exec);
> +	drm_exec_objects_fini(&exec->locked);
> +	drm_exec_objects_fini(&exec->duplicates);
> +	if (exec->contended != DRM_EXEC_DUMMY) {
> +		drm_gem_object_put(exec->contended);
> +		ww_acquire_fini(&exec->ticket);
> +	}
> +}
> +EXPORT_SYMBOL(drm_exec_fini);
> +
> +/**
> + * drm_exec_cleanup - cleanup when contention is detected
> + * @exec: the drm_exec object to cleanup
> + *
> + * Cleanup the current state and return true if we should stay inside the retry
> + * loop, false if there wasn't any contention detected and we can keep the
> + * objects locked.
> + */
> +bool drm_exec_cleanup(struct drm_exec *exec)
> +{
> +	if (likely(!exec->contended)) {
> +		ww_acquire_done(&exec->ticket);
> +		return false;
> +	}
> +
> +	if (likely(exec->contended == DRM_EXEC_DUMMY)) {
> +		exec->contended = NULL;
> +		ww_acquire_init(&exec->ticket, &reservation_ww_class);
> +		return true;
> +	}
> +
> +	drm_exec_unlock_all(exec);
> +	exec->locked.num_objects = 0;
> +	exec->duplicates.num_objects = 0;
> +	return true;
> +}
> +EXPORT_SYMBOL(drm_exec_cleanup);
> +
> +/* Track the locked object in the xa and reserve fences */
> +static int drm_exec_obj_locked(struct drm_exec_objects *container,
> +			       struct drm_gem_object *obj,
> +			       unsigned int num_fences)
> +{
> +	int ret;
> +
> +	if (container) {
> +		ret = drm_exec_objects_add(container, obj);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (num_fences) {
> +		ret = dma_resv_reserve_fences(obj->resv, num_fences);
> +		if (ret)
> +			goto error_erase;
> +	}
> +
> +	return 0;
> +
> +error_erase:
> +	if (container) {
> +		--container->num_objects;
> +		drm_gem_object_put(obj);
> +	}
> +	return ret;
> +}
> +
> +/* Make sure the contended object is locked first */
> +static int drm_exec_lock_contended(struct drm_exec *exec)
> +{
> +	struct drm_gem_object *obj = exec->contended;
> +	int ret;
> +
> +	if (likely(!obj))
> +		return 0;
> +
> +	if (exec->interruptible) {
> +		ret = dma_resv_lock_slow_interruptible(obj->resv,
> +						       &exec->ticket);
> +		if (unlikely(ret))
> +			goto error_dropref;
> +	} else {
> +		dma_resv_lock_slow(obj->resv, &exec->ticket);
> +	}
> +
> +	ret = drm_exec_obj_locked(&exec->locked, obj, 0);
> +	if (unlikely(ret))
> +		dma_resv_unlock(obj->resv);
> +
> +error_dropref:
> +	/* Always cleanup the contention so that error handling can kick in */
> +	drm_gem_object_put(obj);
> +	exec->contended = NULL;
> +	return ret;
> +}
> +
> +/**
> + * drm_exec_prepare_obj - prepare a GEM object for use
> + * @exec: the drm_exec object with the state
> + * @obj: the GEM object to prepare
> + * @num_fences: how many fences to reserve
> + *
> + * Prepare a GEM object for use by locking it and reserving fence slots. All
> + * succesfully locked objects are put into the locked container. Duplicates
> + * detected as well and automatically moved into the duplicates container.
> + *
> + * Returns: -EDEADLK if a contention is detected, -ENOMEM when memory
> + * allocation failed and zero for success.
> + */
> +int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
> +			 unsigned int num_fences)
> +{
> +	int ret;
> +
> +	ret = drm_exec_lock_contended(exec);
> +	if (unlikely(ret))
> +		return ret;
> +
> +	if (exec->interruptible)
> +		ret = dma_resv_lock_interruptible(obj->resv, &exec->ticket);
> +	else
> +		ret = dma_resv_lock(obj->resv, &exec->ticket);
> +
> +	if (unlikely(ret == -EDEADLK)) {
> +		drm_gem_object_get(obj);
> +		exec->contended = obj;
> +		return -EDEADLK;
> +	}
> +
> +	if (unlikely(ret == -EALREADY)) {
> +		struct drm_exec_objects *container = &exec->duplicates;
> +
> +		/*
> +		 * If this is the first locked GEM object it was most likely
> +		 * just contended. So don't add it to the duplicates, just
> +		 * reserve the fence slots.
> +		 */
> +		if (exec->locked.num_objects && exec->locked.objects[0] == obj)
> +			container = NULL;
> +
> +		ret = drm_exec_obj_locked(container, obj, num_fences);
> +		if (ret)
> +			return ret;
> +
> +	} else if (unlikely(ret)) {
> +		return ret;
> +
> +	} else {
> +		ret = drm_exec_obj_locked(&exec->locked, obj, num_fences);
> +		if (ret)
> +			goto error_unlock;
> +	}
> +
> +	drm_gem_object_get(obj);
> +	return 0;
> +
> +error_unlock:
> +	dma_resv_unlock(obj->resv);
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_exec_prepare_obj);
> +
> +MODULE_DESCRIPTION("DRM execution context");
> +MODULE_LICENSE("Dual MIT/GPL");
> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> new file mode 100644
> index 000000000000..f73981c6292e
> --- /dev/null
> +++ b/include/drm/drm_exec.h
> @@ -0,0 +1,144 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +
> +#ifndef __DRM_EXEC_H__
> +#define __DRM_EXEC_H__
> +
> +#include <linux/ww_mutex.h>
> +
> +struct drm_gem_object;
> +
> +/**
> + * struct drm_exec_objects - Container for GEM objects in a drm_exec
> + */
> +struct drm_exec_objects {
> +	unsigned int		num_objects;
> +	unsigned int		max_objects;
> +	struct drm_gem_object	**objects;
> +};
> +
> +/**
> + * drm_exec_objects_for_each - iterate over all the objects inside the container
> + */
> +#define drm_exec_objects_for_each(array, index, obj)		\
> +	for (index = 0, obj = (array)->objects[0];		\
> +	     index < (array)->num_objects;			\
> +	     ++index, obj = (array)->objects[index])
> +
> +/**
> + * struct drm_exec - Execution context
> + */
> +struct drm_exec {
> +	/**
> +	 * @interruptible: If locks should be taken interruptible
> +	 */
> +	bool			interruptible;
> +
> +	/**
> +	 * @ticket: WW ticket used for acquiring locks
> +	 */
> +	struct ww_acquire_ctx	ticket;
> +
> +	/**
> +	 * @locked: container for the locked GEM objects
> +	 */
> +	struct drm_exec_objects	locked;
> +
> +	/**
> +	 * @duplicates: container for the duplicated GEM objects
> +	 */
> +	struct drm_exec_objects	duplicates;
> +
> +	/**
> +	 * @contended: contended GEM object we backet of for.
> +	 */
> +	struct drm_gem_object	*contended;
> +};
> +
> +/**
> + * drm_exec_for_each_locked_object - iterate over all the locked objects
> + * @exec: drm_exec object
> + * @index: unsigned long index for the iteration
> + * @obj: the current GEM object
> + *
> + * Iterate over all the locked GEM objects inside the drm_exec object.
> + */
> +#define drm_exec_for_each_locked_object(exec, index, obj)	\
> +	drm_exec_objects_for_each(&(exec)->locked, index, obj)
> +
> +/**
> + * drm_exec_for_each_duplicate_object - iterate over all the duplicate objects
> + * @exec: drm_exec object
> + * @index: unsigned long index for the iteration
> + * @obj: the current GEM object
> + *
> + * Iterate over all the duplicate GEM objects inside the drm_exec object.
> + */
> +#define drm_exec_for_each_duplicate_object(exec, index, obj)	\
> +	drm_exec_objects_for_each(&(exec)->duplicates, index, obj)
> +
> +/**
> + * drm_exec_while_not_all_locked - loop until all GEM objects are prepared
> + * @exec: drm_exec object
> + *
> + * Core functionality of the drm_exec object. Loops until all GEM objects are
> + * prepared and no more contention exists.
> + *
> + * At the beginning of the loop it is guaranteed that no GEM object is locked.
> + */
> +#define drm_exec_while_not_all_locked(exec)	\
> +	while (drm_exec_cleanup(exec))
> +
> +/**
> + * drm_exec_continue_on_contention - continue the loop when we need to cleanup
> + * @exec: drm_exec object
> + *
> + * Control flow helper to continue when a contention was detected and we need to
> + * clean up and re-start the loop to prepare all GEM objects.
> + */
> +#define drm_exec_continue_on_contention(exec)		\
> +	if (unlikely(drm_exec_is_contended(exec)))	\
> +		continue
> +
> +/**
> + * drm_exec_break_on_contention - break a subordinal loop on contention
> + * @exec: drm_exec object
> + *
> + * Control flow helper to break a subordinal loop when a contention was detected
> + * and we need to clean up and re-start the loop to prepare all GEM objects.
> + */
> +#define drm_exec_break_on_contention(exec)		\
> +	if (unlikely(drm_exec_is_contended(exec)))	\
> +		break
> +
> +/**
> + * drm_exec_is_contended - check for contention
> + * @exec: drm_exec object
> + *
> + * Returns true if the drm_exec object has run into some contention while
> + * locking a GEM object and needs to clean up.
> + */
> +static inline bool drm_exec_is_contended(struct drm_exec *exec)
> +{
> +	return !!exec->contended;
> +}
> +
> +/**
> + * drm_exec_has_duplicates - check for duplicated GEM object
> + * @exec: drm_exec object
> + *
> + * Return true if the drm_exec object has encountered some already locked GEM
> + * objects while trying to lock them. This can happen if multiple GEM objects
> + * share the same underlying resv object.
> + */
> +static inline bool drm_exec_has_duplicates(struct drm_exec *exec)
> +{
> +	return exec->duplicates.num_objects > 0;
> +}
> +
> +void drm_exec_init(struct drm_exec *exec, bool interruptible);
> +void drm_exec_fini(struct drm_exec *exec);
> +bool drm_exec_cleanup(struct drm_exec *exec);
> +int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
> +			 unsigned int num_fences);
> +
> +#endif

