Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F171A54404B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 02:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4701F10E8BC;
	Thu,  9 Jun 2022 00:05:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2060.outbound.protection.outlook.com [40.107.212.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB71C10E8BC;
 Thu,  9 Jun 2022 00:05:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tce57ri689Gu4/s2oYewgyzrtFtlcMt+PyrMe0MsuvPuQc/TkikDkqRqVr49LP9lxsDxcxovF/aKL/jxVOg73VOYYBcL5gNb0c/NVltaKhzJLL55fDGrDj+YfCi4kQRVeWetbD7iFxRX90tnEwPU5xUxliIMLIk4ZjUXy4eEHTRGOF6xYQ7PntNSGRM1jq7StS7Tp7fpn/xzxxoZJaG4YsKql/yS/A9vVHZUax5xG7HXh6G1fY5IaMCMpkdMxsqJ+7WxjB//NwhhVGpEUx5SYI6894boRlanWrluihXlC8pi5G/5tuyJa8JP5CjsdCmKdil5W7DWZ3HYpo8zapbaYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94YQ8ce43YkJtS89IHfdHs9hycJ6PU89tcVbyoG+gR4=;
 b=lKFikeey7jeBVvwDy1F4MV/S8pt/F+icN4HA+TapWAIyzbkk+tjOlf9jufJnG8gc1qILf3AFeSpWKMQzx2NQ0RHQdgn7oCXiL10+X1AKOF2BsMyM8RTsiwRy/hCUkR38wYgzEVV1hQPIF+NXDHcEokroJMw/pzCipl5ydCd4oNLPgZNKrSN07heZy7IrHG/tXAzA319oC7wFw/fYcFBDmpWwgIk9oNThoNYgsSjPVKrsy1sWSPs588GwKnsaLl/Xw+WSdZ8Sd2bv6nJKMA6mpKx0TIW1WBchmGDY3igrcWlyN5ftRZI6iEICcEqQgrJeQHoac8CFVvrSNgzstKRhRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94YQ8ce43YkJtS89IHfdHs9hycJ6PU89tcVbyoG+gR4=;
 b=Nl6Bkdi69E1wfFpL6mz07Zt9iWnye/J971ARp6RtkCyZL9dqL1O67e8Ht4fu5EX9QKVo9ZF5FpX0XjWxJW3qGzURETeY85k7UpDEMCQ/9ybhHWaSOkfxx8Q+toup8Q6KdgGykJB8vlCyA9HoulTh88kyK3WIEOTB3oV7lODhLI0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA1PR12MB6091.namprd12.prod.outlook.com (2603:10b6:208:3ed::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Thu, 9 Jun
 2022 00:05:13 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::1cf6:2a9d:41d6:e8c3]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::1cf6:2a9d:41d6:e8c3%4]) with mapi id 15.20.5332.012; Thu, 9 Jun 2022
 00:05:12 +0000
Message-ID: <9ef430d2-1748-10eb-7708-ae8ad9d47804@amd.com>
Date: Wed, 8 Jun 2022 20:05:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/8] drm: execution context for GEM buffers v2
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 daniel@ffwll.ch
References: <20220504074739.2231-1-christian.koenig@amd.com>
 <20220504074739.2231-2-christian.koenig@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20220504074739.2231-2-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR14CA0004.namprd14.prod.outlook.com
 (2603:10b6:610:60::14) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fe94160-f737-408a-12a0-08da49abb994
X-MS-TrafficTypeDiagnostic: IA1PR12MB6091:EE_
X-Microsoft-Antispam-PRVS: <IA1PR12MB6091C37C78D0C4D1714E23DE92A79@IA1PR12MB6091.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N4lUsBHsne1l81AL4RjeULlwF/3TVDXGDPoME35xZ87yliDA57P+ME9FllkW4fhkoUTLEyLewroJJA7VNhHiuDOpsnjor/RuMxuTd3V3b8h/YgmtHWzz/U6vXid3ROYG5Ski5wUzwZ8tvwoTmVEuagr/K3ZXD4a7h0VF7JVHqqULcqc0xJARfM+lpgik2EgdiCGSS3rbuoFCIrIL/N/9nA3cBpiyk6NzuTl2PwNsls0s0TRa1lIns1p2TUxdQpwsGdpjvzbZzJiwt9a57UqBiMdVFrwC5vEq2RzgZw/zNeZcJk7jROZ7lX6C7LqHn9Ddc2FJeB7akA5p26kpbq8aQxErzTaKNM3ZGfKzcuMyzGRZ20P4KR7Xs29WGI/l6zR61UbGoXAFwXxeZdEqC8oDrR1Cb9LXfyi+jEcEQXJSU9nqWDEo/KOURE6PkyvGEdZKd9sWFyDTCAlounFqdE4nIBaxaI/VdizKw9zJtcg8mkegZO/aPK47+bcmPoUpTI0ZvhnsHncIDjw4E8YNQifjUHgDdVzlLKwrj2UIoCgRhqCcCFvpMu7EoBuAR5V67UEWJ9/8Gb4f0eL+X9LDpVH2FjwMJfNJciMRHEFUHCeLHb/TRkLhdxXtwYXf5QFDgKwvxQEynH9qeJkJjBqkBXtm4YVljJZuTeUWW1B5njB8ZURTooBovm15Juok8MIMAsvd76dL1p61h9Z4GgMOd+g9ubF7Rs/2LXED8tS/x5+c+CbD17M1pXXS6C1HGeP26cM05BiiAPyBFLD5WnjLQQpR4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(86362001)(5660300002)(38100700002)(316002)(66476007)(31686004)(31696002)(66946007)(30864003)(44832011)(4326008)(186003)(8936002)(8676002)(66556008)(83380400001)(36756003)(66574015)(26005)(53546011)(6512007)(2616005)(2906002)(508600001)(6506007)(36916002)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWtVczFXSjdEendyNVZoK3hqVE44RTNJN3ZDSXRHMFJYM21BSndlYmYwU0Jn?=
 =?utf-8?B?TGZzNjFWc0RpYWxwdDAraGo5TDRUeDlmc1dsTG04ZjAwTGV5MGZlZ0dZVCts?=
 =?utf-8?B?V3lhVXZZb29ST01uWW9KT0Foekh4RnJibzE5N1hkcVcrT3U3QUZ5c3ZKWFMr?=
 =?utf-8?B?Ykx1UlR1T1Rrb0NxMDQ5RGQwT1B3bVNIY05SeFFIS3hDdVFIQjdjTkxkZjZt?=
 =?utf-8?B?ZExCUUVrcnBPcW1jVDE5Tk1vcEtPL2ZucVNtVm0xeFhyY2s0OVhOQ0hGZWxZ?=
 =?utf-8?B?U1NlVm9YQjBiK2RNRStINXRkL0djZWZGdnN4VWZQdGwrSFZYQ1c3ay94bHFo?=
 =?utf-8?B?MXVOcDhqSU9nNGJKVFBhZnRtTDRqeW5OVEZYQ3RBcW1kSWVqRERoYmRiQldZ?=
 =?utf-8?B?UWR0NU11ODRBL0U4N1B4UlEzUDRaaGxtaHY2M0tXMUJ1NlYwRWZFYnErc05z?=
 =?utf-8?B?eDFaRksrK2hLSGJ4RmZpTlVxREszSEt0ZTUyWXJaT3lwTVBlUExVaFkrMkkv?=
 =?utf-8?B?YW1wUDFGVHJWV2VzUWpmdjIzY3VlbnYrZSs5a3ZOZWlwMFlFZE00VEhFUDdC?=
 =?utf-8?B?R0ltMERZTnRXMDZJNll6a2xsd1YxZ0Rkc0JOSGViNWF6clh3a2tXMmpOVXEr?=
 =?utf-8?B?RUI3dVhlMzJmemtiOGVYYkFTa1ptOWlaOGZlR2xJbkdRTUp3Q3F3ZFV6QkVj?=
 =?utf-8?B?N0J4UmNOZ1R2bzVHNkFQbzNEdEFiUCtrU1lpWndVVStUSVQrTWJQaHd0K20w?=
 =?utf-8?B?Q2pQRS9KOEVvYUN5VFVmRUdWMFpLa21mNDFXSHFINDNlTHMxNklGUFIraGNG?=
 =?utf-8?B?akdtMWltL1IvUFFQR3ljbjVvK1UyZWs2SzVHYWR1RWg2eHh5UDFTY2tmTkpo?=
 =?utf-8?B?cnc1cnZQMXp3L2JkR2pvVUhqMC9vcmxuN3pUTyt2TUtQTFlIWEtpaFZZK3dD?=
 =?utf-8?B?T2xiSFg0c1NEdFBsWksyWis3TTVraWg1UDRoczRONWhDUjVTTTNDTWhETEh2?=
 =?utf-8?B?Y2FXemUwU2VqZU9mYUZ1L0VTbzlEY0gzcENDN0kyMldnQVYya3Y3SkdjNnhD?=
 =?utf-8?B?em1xQkR5OWhzR0RJb1RtakQ1S3dlNE0weWd5L1U0WkZKK2VVQ293MHhqTjJ2?=
 =?utf-8?B?eGR6SVZtQm5jZEt3WFVFc3VRc0RqL2NBRjB1aVdCZUdMQlUzTlMyMDE2Z0dp?=
 =?utf-8?B?YU05a0duejlhZHJWWFBENXJKUFAzdnJBaDgrTEtpTGFFY2N3Zml3WWF1M052?=
 =?utf-8?B?bHZUc3NBeXF5OWUva29qQ2VBeEJDWHhsSElCZTlySWlHYnVsaU1YUHlKcFAy?=
 =?utf-8?B?SEozWnNacGRHOVlkai9vOUorZFVWeUNtdjB3T2RxVHRuSjhnblcvZnBMQ0kr?=
 =?utf-8?B?RUNnaE9YcjZKVVlwRndJdE5BZnN1Ym4xTi9OMmlGSW02ZmljWUZnTGp0YUNl?=
 =?utf-8?B?Z0puVFVBNkEvYlVhVTBZNEJyYmhvcS9CZTNqV2ZPby94SjkvWDRQUnJqUDJ5?=
 =?utf-8?B?bnNzLzRDY1JqYnpuVUVMdHRydHF3azBhc0RkN0xhN2I1VHhYMTZ3NXZWUjQ2?=
 =?utf-8?B?UTBzQ1BmU2lERnhJOFY0ck9RZEdRU3hiZi8zYWU0cW1DWEY1U3VtaXNuL1dR?=
 =?utf-8?B?OEpFaGk4b00xaUNmTnVJMFpUK3lhRzJidXJSKzZBWTBkL01jWm43M0dhWitt?=
 =?utf-8?B?bzN0VExGME1uK213bHE1R01BdVFiVFo5Q3V0WnI3V0pVK3UrTnFhS2lRNmw2?=
 =?utf-8?B?cURKOHp4MVFyRFFwRUZIa0FjVCt5KzFYTExrTTUzdWI0U1hObTNucGFQWURj?=
 =?utf-8?B?aEkyeER2TzZYYk5tdFh5S0RYVkhWWkcyTGoxQ3dKQnF5Y2liN0Fyanh3Qysz?=
 =?utf-8?B?WUpzN0doWDFIRVBsN3lxckViQ3ZUQVppQktvdktia2FXR2F2YnpJZ1ptUk14?=
 =?utf-8?B?ZHZqMFFWK1IxM3dYU2tYUmJzOWxwR1RSK081bE9JQWZ4VDdpbDJSSGJVUm9O?=
 =?utf-8?B?VFBsZEdldG5tZndhYjY1VEFETHhoU1F0U1EyVGJDQmlGYThwZnJiZEhXTkVw?=
 =?utf-8?B?cmNBOHc4MUhBVkc4YXRseVpINTBPR3V3dUU1Y0lkM00rakJsWDBLZ1FpYWph?=
 =?utf-8?B?WDVCWCtqRDluYzBuUm1PRjF2dFdTaDlVeW93VnNQV2doVXcwREJ6b05mZytS?=
 =?utf-8?B?VnNJVFZmWnNNTlpmM2lIVFFya21ML1lkRURpTE1iSGYveW9pWW04eGRQMkJl?=
 =?utf-8?B?eGFsOVp3RGNMK3N0cXJrSktuSDdyWkhId01tRXVNUG9zOHMvSUlEeTNDdXFl?=
 =?utf-8?B?UldUN0JSUFhSekVGSktQTlBqQVpmRmRMTEF4SUNFTlp5UFVHSTg4QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe94160-f737-408a-12a0-08da49abb994
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 00:05:12.9163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lj/6pW3PmoW8fIARbOW7CqUWZIOzc5ZIxn6mZWU5BcBmnQANQxGN3dKdW51BDhoaU01tIDsO3npkTxSlQ4YRgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6091
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-05-04 03:47, Christian König wrote:
> This adds the infrastructure for an execution context for GEM buffers
> which is similar to the existinc TTMs execbuf util and intended to replace
> it in the long term.
>
> The basic functionality is that we abstracts the necessary loop to lock
> many different GEM buffers with automated deadlock and duplicate handling.
>
> v2: drop xarray and use dynamic resized array instead, the locking
>      overhead is unecessary and measureable.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>

I finally got around to catching up with this thread. See some questions 
and comments inline.


> ---
>   Documentation/gpu/drm-mm.rst |  12 ++
>   drivers/gpu/drm/Kconfig      |   7 +
>   drivers/gpu/drm/Makefile     |   2 +
>   drivers/gpu/drm/drm_exec.c   | 295 +++++++++++++++++++++++++++++++++++
>   include/drm/drm_exec.h       | 144 +++++++++++++++++
>   5 files changed, 460 insertions(+)
>   create mode 100644 drivers/gpu/drm/drm_exec.c
>   create mode 100644 include/drm/drm_exec.h
>
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index f32ccce5722d..bf7dd2a78e9b 100644
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
> index e88c497fa010..1b35c10df263 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -179,6 +179,12 @@ config DRM_TTM
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
> @@ -252,6 +258,7 @@ config DRM_AMDGPU
>   	select DRM_SCHED
>   	select DRM_TTM
>   	select DRM_TTM_HELPER
> +	select DRM_EXEC
>   	select POWER_SUPPLY
>   	select HWMON
>   	select BACKLIGHT_CLASS_DEVICE
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 15fe3163f822..ee8573b683f3 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -37,6 +37,8 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
>   #
>   # Memory-management helpers
>   #
> +#
> +obj-$(CONFIG_DRM_EXEC) += drm_exec.o
>   
>   obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
>   
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

Where is drm_exec_lock? It's not in this patch.


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

Should this be kvmalloc? You're using kvrealloc and kvfree elsewhere.


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

If this succeeds, it won't reserve any fence slots for object. Is that a 
problem?


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

I don't understand this. Seems a bit arbitrary. Is it even legal to try 
to add the same object twice? I thought duplicates was for different 
objects that share the same reservation, not actually the same object on 
the same list twice.

Maybe you meant to compare with 
exec->locked.objects[exec->locked.num_objects-1], assuming that 
drm_exec_lock_contended just succeeded locking a previously contended 
object, and the caller retried locking that same object again?


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

The container already gets a reference to obj. What is this extra 
reference for? And where does it get dropped?

Regards,
   Felix


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
