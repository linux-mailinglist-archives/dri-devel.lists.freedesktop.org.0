Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A006E6A9925
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 15:11:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766E010E5F8;
	Fri,  3 Mar 2023 14:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9791910E5EB;
 Fri,  3 Mar 2023 14:11:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkppTobpGNC82vSYjXaPcr8+3/CfRnpJwAx9s/Hc9m+SQg0RAq1JQlMxhI776M2DT01A2QLEjn5fKz/f7v5ysOV/504t7W0CmlckNg+QE1JOJ4RvlANUGOsDj06rJQdxpyLbR8rlXNlEPIfZ9+8/NUSdhoWBgUSkhEoUXlLL308MZSIoP9DQskPEWO4hjFZLScGbmSTDYFomPzU0vjIQmgUSH93yVDAHotzakN8A41pgKn175y/j0pr/uxwjvK45Fd8eAin7y4V0gXZOxE6+O4QbGDjJvfQmwGUISlsup6WznK9N0aHjByK8ifLKzDX+IJmAJNN9Gu3goqnDmT9zsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRv2QwsnakhUUDVgK7s2QQriSqW2pswMmXsEamU3Xvc=;
 b=SlxG3hl07/Ta4sTXl9K3TP0+enUtQQXPyiDCC+GyB/ClpAbsw0kHQs6f9M8hPGKs2rooAHFrQ83pslowOUBRfwKLUCVXsjxWXbEpoZQ9Esw82Vl9nx9fTNl0iyPk960+df9DomYhXjVfSSJXYfMnXebJH/RFJzP4gO6AOAjNIgItRcz5mP7INQXJrneljvHZ2uGspEZa0RVcefZUCc+VKtA06PBmE0zlDuSmLKO3BCGf1ivwAMlFfFhA0FBOFNzYEksTdRIDQlB9cgZM1qc0JCGoqVTxCtUz1BsIZLUSM8NL41CANty9ZbIhJurVnzgvItdDLRbtgPvQ7ZAHFBW4hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mRv2QwsnakhUUDVgK7s2QQriSqW2pswMmXsEamU3Xvc=;
 b=nEdn5LwlTlt4HHSkq+mWWeMn02TWOSCpqPd3wxI+f+jdx+X/vQGJM5nqIV8T1zzMiw2QWfoLST4dqt+7ZN6+WjL7QZ4+yqbC8jAxTR6QKiL7Qxdxf1PCSJAvgUEABg2Ow8V9V7KmT8EczNgMV5yuRcBzGXDRSolWuaVxeK7tLfY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 IA1PR12MB6236.namprd12.prod.outlook.com (2603:10b6:208:3e4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Fri, 3 Mar
 2023 14:11:42 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::e43d:5bd2:7a85:d0cf]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::e43d:5bd2:7a85:d0cf%4]) with mapi id 15.20.6156.018; Fri, 3 Mar 2023
 14:11:42 +0000
Message-ID: <5b3e46a7-b5fe-43de-a271-fe4c1bab30bb@amd.com>
Date: Fri, 3 Mar 2023 09:11:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230228083406.1720795-1-christian.koenig@amd.com>
 <20230228083406.1720795-2-christian.koenig@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH 1/9] drm: execution context for GEM buffers v3
In-Reply-To: <20230228083406.1720795-2-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0150.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ac::17) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|IA1PR12MB6236:EE_
X-MS-Office365-Filtering-Correlation-Id: b945b847-e8fb-438f-6991-08db1bf13660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tUz3YeAdZOVegMohknrx8Ls8zdlgbF/tk8rEW396nWzj3k0bZzeYe8roYjjXyJc0gahe4YK7P12vd7DDV6FdTn9d4tYMYiy9COH3pYR4dG6c00vKiRPKR4L4uuQDGvg1rS+VAzzH68VuKPYq7e4xSRMajh1N7trso7He62VMUVfRQNYgFHo9/qx7Pz5RQ08L0QKjADjK1y2TqWsEsx1TI/EvCt0nhPh0x6jEI0XrKog3tZGqQ3V4rD7+zpPN1lkMCFoZSiWAqs9dvjQoindtfMseoWeUiI6hz0RS5c21/BaKolqxq8VmMeDmYkiT55dJ1D4nmR4toK89MmOSF42+9q70axuyjDOvaAKHx0oIkCvndO4qGU7bFSg/GhxFnDuSX2+y9CL4TGqG/lnKbeIKphX9IxAQ5H8eh6JKo5iVyQMmotC68Axi4Vh1LomMRb/mWAWnnXd1eM9JA8Im/q2w0soH6IY3DdDAfY/07JeW5Iw25VTjWApfnf0aFZbmRNc0dbZGxWSPlXglfwd/DLQsj8NT78mcmAQ6fi/ICk/IB4w5S9mgtBmz3TrG5L4mWT2mncKIOjJdmp4D6g+K1gzrOresSi7uosZjWgrNA323h7BEhtXs5SS8vrAfKkyH5V59f8R/lc+l+i/HXY3kWheTNve8Jud7f2f1HHsNczv9bv35lO4C39OsR6R5Hzwzihx9raYCZcukHnTNsVgzg/Dh5RFMuKKcQmUJmWULIT5nnvU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(451199018)(36756003)(6666004)(66574015)(6506007)(53546011)(55236004)(6512007)(26005)(6486002)(66476007)(2616005)(186003)(316002)(41300700001)(4326008)(66556008)(2906002)(8676002)(30864003)(44832011)(478600001)(5660300002)(8936002)(38100700002)(86362001)(31696002)(66946007)(31686004)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2d3eGhjZ3hZeEZUSVdFLzVnZnhnTGJaNTRNa1ROY1JvM0tVQ0xSQm1WS0FG?=
 =?utf-8?B?VUcwMGh2VlQ1dUFJR3V3SzF4Ry9EWWN2ZmREYXVEVlhFYTI2aUdDSDNHb0Fx?=
 =?utf-8?B?dU5ML29EcGpuT2U2UWhwNTdydlc2UFg3dUh2eGJhYjh6SzcwNU8xU3VJY2Y4?=
 =?utf-8?B?NXJXQnhZZ0NGaStsbzlpanRQTXlrTjgrM0oxRURHbnFYVUkrOUtFYlg0Tllj?=
 =?utf-8?B?cHJMcDk2VnNrVS9WVkVLM0lpdFB3ZXpycW1NYm9VY0VIRzVoWXgwRTNjNU1k?=
 =?utf-8?B?dGlIU3N5VW0vM1NMTnBlV1RQZUJudVZadndNTXF4dzlXTE52eTN6UmJFaWdP?=
 =?utf-8?B?N1pmNlNzbGtUQkJVSjNRenZhTHJybEZUVkxHbHVZU21KUWxsYVUvRXl2c29C?=
 =?utf-8?B?cFd5eG4yRVBGVFNDTGZHMzZPbEVRUEcyUTdrbmtKOTFxZVpaVmIvSlJSTEFU?=
 =?utf-8?B?TkdlWERzL2hqSmpISUh6OGpRdG1Pdm1ja2JFbHRkcTV2S05YRkNJRWxKTnlZ?=
 =?utf-8?B?RUJWWk5hbVVXajRuSHBLQTdPTHg3bzVzSmVMdDFYRmlxaTRKcTlFRFo3SVFK?=
 =?utf-8?B?L2pTYlF2Q1YvVEU2cDUwNGk4dFZnd2hsM3pldjlnb1A5b3A5T0JseHRHZ2gr?=
 =?utf-8?B?T3dmc3JHRWhCVTBHcGJCWXRKSngrUXFJQkJKOE5uSHppSy9CYk5IK1BwV0dj?=
 =?utf-8?B?a1huaHFSaXlTL3dnNWlBK0l6dUxLVUhHR3FKbHpCNTBpLy8ydFpCd3h5eWJO?=
 =?utf-8?B?NFVTdVVIOEN6THdyVTExc0daSTlkaHFheXcvUk4rSFB0SEtyM2s4ZElZcGIy?=
 =?utf-8?B?Znc5ekJ0dEZHRHgyVWp6UVpaODIrb0Npd3N5TUdpM3RnK29wMjBxbUI2THhI?=
 =?utf-8?B?ZXNBWCtEaUlvY1QrS1NRaExXaTVodVRtTDlISjRJOWZiZTUvcUZ0ekJTTDR2?=
 =?utf-8?B?ZnhTSGVqSFhmWGdDYUdYTFdLMHV4TkNTSXkyUWV2OG9OVGpEdXMvaDdaanV0?=
 =?utf-8?B?cktQVjBNUVdqaUllY2pCUjZyWlRTSktTZW5XT1FBaFB1dmF2OHljUFgzMEdl?=
 =?utf-8?B?MXBLcW0rRXY1MlhKdkJCRndrRVdFb3MrdUJpVzhBbGVuTVJLSC9QTFlKd012?=
 =?utf-8?B?VGxRNXlCTTNDTElCckVOUTU4aUJVdzVhYlJqT05GL1pDaCswRnVsNXM2YlRu?=
 =?utf-8?B?bU82UjZnLzJUdERsSUt0YTVINC9ZKzBlMHlQQWFJREdSQklKV0JvSjhCZUZt?=
 =?utf-8?B?VDZCejZEdXQxbzlFTTlrdTh2aTQ1NXhiLzV4VXlpTFpsRFhtMUVsaGJhajlu?=
 =?utf-8?B?ZHVxa3o3NDhkOGJId21CUy8vRldXMXVHWlhNYTRXZGJUVUlzUkQ0V0Z5MmRE?=
 =?utf-8?B?MjlQRWZ0bGU2dmJCa25pZnpHRkVLTDc2MFRDQkNDRi80YmNtdjZTMGJNNnQw?=
 =?utf-8?B?NmhnWVFaMmx5d1VISmNLUXE3NWZZWjVYRlFyR2o4OGdyRkVsZEprWW5GZnFk?=
 =?utf-8?B?Y2NaeDhkRlkyYVdnR2k1dENCMXZQeCtBaXZyTXFvT2hjS242czNRME9BaHYx?=
 =?utf-8?B?YytIK29JUEYxUksxNkdDcEpaem1iYlhNY3M3REpZUzJZQTJzN1gybWdIajhz?=
 =?utf-8?B?c1RYVExpS3FZdjZDeTJwTmFtU1dIeXo0cGtDOVc5N0dmTzAzNExsQ2V0ZVZi?=
 =?utf-8?B?a3Y2a1ZXcmRFWXhWcGRXZUtramdDR002N1BwQkJOSEc0ZjMzUkR5T2ZQdDlG?=
 =?utf-8?B?OUtxbFBUeXFWRy9UTVY5YUp5d1l3UGpTQjVoZ3NGd2I1a1lyM2RWUnJidHBN?=
 =?utf-8?B?bDBvdGI4YWI2MDZ1eHQ0VytlN3h2S2lnSi9qNHlTZk9SNGcvVHdGeDFYMHIz?=
 =?utf-8?B?VFdoaGsxSG9yRTNVQ0EvQnEyZlZHU1JYOUFTcVg3emFKVXpWZ1pCSjUvSTc2?=
 =?utf-8?B?TVJIUFZkcWlSVDVOVTM0ZHArWUFJOXh5SWZiK1gzUFJpb2tHWmQ5YWs0YXZG?=
 =?utf-8?B?VEVac1VBOXU2L0xxTjhaQmlzaVlMQVR5WFZ2VkZpT0RYZWpWeWU3SXNlS2Ur?=
 =?utf-8?B?OFQzUlVOZnllSHVqemxuL21TL0FTcDV6VnU2TlNwZWFLWWR3cmRPa2RhK0hn?=
 =?utf-8?Q?bXkpB5U90jHGNYlqhctW/38lw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b945b847-e8fb-438f-6991-08db1bf13660
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 14:11:41.8132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kv43/rRTwCuWC6g86KBDnpzKiH/MFMMWqlwlWsMAq/KYtUFfXW6y9SV1xQjgolbc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6236
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
Cc: dakr@redhat.com, arunpravin.paneerselvam@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-02-28 03:33, Christian König wrote:
> This adds the infrastructure for an execution context for GEM buffers
> which is similar to the existinc TTMs execbuf util and intended to replace
> it in the long term.
> 
> The basic functionality is that we abstracts the necessary loop to lock
> many different GEM buffers with automated deadlock and duplicate handling.
> 
> v2: drop xarray and use dynamic resized array instead, the locking
>     overhead is unecessary and measureable.
> v3: drop duplicate tracking, radeon is really the only one needing that.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  Documentation/gpu/drm-mm.rst |  12 ++
>  drivers/gpu/drm/Kconfig      |   6 +
>  drivers/gpu/drm/Makefile     |   2 +
>  drivers/gpu/drm/drm_exec.c   | 249 +++++++++++++++++++++++++++++++++++
>  include/drm/drm_exec.h       | 115 ++++++++++++++++
>  5 files changed, 384 insertions(+)
>  create mode 100644 drivers/gpu/drm/drm_exec.c
>  create mode 100644 include/drm/drm_exec.h
> 
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index a79fd3549ff8..a52e6f4117d6 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -493,6 +493,18 @@ DRM Sync Objects
>  .. kernel-doc:: drivers/gpu/drm/drm_syncobj.c
>     :export:
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
>  GPU Scheduler
>  =============
>  
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 17d252dc25e2..84a5fc28c48d 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -200,6 +200,12 @@ config DRM_TTM
>  	  GPU memory types. Will be enabled automatically if a device driver
>  	  uses it.
>  
> +config DRM_EXEC
> +	tristate
> +	depends on DRM
> +	help
> +	  Execution context for command submissions
> +
>  config DRM_BUDDY
>  	tristate
>  	depends on DRM
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index ab4460fcd63f..d40defbb0347 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -78,6 +78,8 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
>  #
>  # Memory-management helpers
>  #
> +#
> +obj-$(CONFIG_DRM_EXEC) += drm_exec.o
>  
>  obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
>  
> diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
> new file mode 100644
> index 000000000000..df546cc5a227
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_exec.c
> @@ -0,0 +1,249 @@
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

Maybe add the error: label here to show how recovery is to be had.

> + *
> + * See struct dma_exec for more details.
> + */
> +
> +/* Dummy value used to initially enter the retry loop */
> +#define DRM_EXEC_DUMMY (void*)~0
> +
> +/* Unlock all objects and drop references */
> +static void drm_exec_unlock_all(struct drm_exec *exec)
> +{
> +	struct drm_gem_object *obj;
> +	unsigned long index;
> +
> +	drm_exec_for_each_locked_object(exec, index, obj) {
> +		dma_resv_unlock(obj->resv);
> +		drm_gem_object_put(obj);
> +	}
> +
> +	if (exec->prelocked) {
> +		dma_resv_unlock(exec->prelocked->resv);
> +		drm_gem_object_put(exec->prelocked);
> +		exec->prelocked = NULL;
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
> +	exec->objects = kmalloc(PAGE_SIZE, GFP_KERNEL);
> +
> +	/* If allocation here fails, just delay that till the first use */
> +	exec->max_objects = exec->objects ? PAGE_SIZE / sizeof(void *) : 0;

I didn't see a subsequent allocation for objects. Does it make
sense to continue here if we weren't able to allocate? It seems
that the "first use" is most likely immediately after drm_exec_init(),
and if kmalloc() failed, perhaps things are only about to get worse.

(Pet peeve :-) "till" --> "until".)

> +	exec->num_objects = 0;
> +	exec->contended = DRM_EXEC_DUMMY;
> +	exec->prelocked = NULL;
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
> +	kvfree(exec->objects);
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
> +	exec->num_objects = 0;
> +	return true;
> +}
> +EXPORT_SYMBOL(drm_exec_cleanup);
> +
> +/* Track the locked object in the xa and reserve fences */
> +static int drm_exec_obj_locked(struct drm_exec *exec,
> +			       struct drm_gem_object *obj)
> +{
> +	if (unlikely(exec->num_objects == exec->max_objects)) {
> +		size_t size = exec->max_objects * sizeof(void *);
> +		void *tmp;
> +
> +		tmp = kvrealloc(exec->objects, size, size + PAGE_SIZE,
> +				GFP_KERNEL);
> +		if (!tmp)
> +			return -ENOMEM;
> +
> +		exec->objects = tmp;
> +		exec->max_objects += PAGE_SIZE / sizeof(void *);
> +	}
> +	drm_gem_object_get(obj);
> +	exec->objects[exec->num_objects++] = obj;
> +
> +	return 0;
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
> +	ret = drm_exec_obj_locked(exec, obj);
> +	if (unlikely(ret)) {
> +		dma_resv_unlock(obj->resv);
> +		goto error_dropref;
> +	}
> +
> +	swap(exec->prelocked, obj);
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
> +	if (exec->prelocked == obj) {
> +		drm_gem_object_put(exec->prelocked);
> +		exec->prelocked = NULL;
> +
> +		return dma_resv_reserve_fences(obj->resv, num_fences);
> +	}
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
> +	if (unlikely(ret))
> +		return ret;
> +
> +	ret = drm_exec_obj_locked(exec, obj);
> +	if (ret)
> +		goto error_unlock;
> +
> +	/* Keep locked when reserving fences fails */
> +	return dma_resv_reserve_fences(obj->resv, num_fences);
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
> index 000000000000..65e518c01db3
> --- /dev/null
> +++ b/include/drm/drm_exec.h
> @@ -0,0 +1,115 @@
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
> +	 * @num_objects: number of objects locked
> +	 */
> +	unsigned int		num_objects;

"num_objects" may be confused with the size of "objects" array.
Maybe "num_locked" would be clearer?

> +
> +	/**
> +	 * @max_objects: maximum objects in array
> +	 */
> +	unsigned int		max_objects;
> +
> +	/**
> +	 * @objects: array of the locked objects
> +	 */
> +	struct drm_gem_object	**objects;
> +
> +	/**
> +	 * @contended: contended GEM object we backet of for
> +	 */
> +	struct drm_gem_object	*contended;

Perhaps "backed off for" in the comment?

> +
> +	/**
> +	 * @prelocked: already locked GEM object because of contention
> +	 */
> +	struct drm_gem_object *prelocked;

Could this be a subset of the objects array as opposed to a single object?
-- 
Regards,
Luben

