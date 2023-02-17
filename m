Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8256669A98D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 12:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68E410EF63;
	Fri, 17 Feb 2023 11:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F3889755;
 Fri, 17 Feb 2023 11:01:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZUHDTbZ3n1DzpBhqEZvaxhaUDOVZBt0GiOuTsUXT+45+ZxLpXVBp6KlwDr+7EIfhoWnLwPiStWdSDDeYq7iXsU8XF2tP7sKKbVUA1LcoDDNTj/Uwdkuen60WZyOWFDwy2HiO2O0kK8HFt29W2iunZuNQPzBisTKe7iZ8E+JewpCpexR29bDjIbwd6HQD0sUydp8nbR6R8JWK/T+v7MtgQ8lSGFmZoCsis/ud4q1sA48ZAo84F3i7pF9SpRBLa89rY5BFhb+OuDFkAZ+QIxpkTYwTJ/WKT2/tOK084sn/M/s/qOf+0iB+duR+I753kwzkW/S7gJgwDrENVR6kYMIjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blhDcAa8Y8ql2HvCJqFJPDKHMWpIR8rlZ4x7vadtC6k=;
 b=JHEHf41RnuZVfONHgNCIkP0yb8ctBOFOmOqMUpi2IJTmcjZN7rW0VTEXoOkDB2yNKv4S7BZKw3T5b0wfF+v+E/Oh72SYzKtH3kRbQk/23Dn/WPqKhO5u0MpiY/TkS4giA1Zf5ag7rH6mBUU1MSO2swBgOLtrA6gz3DSh+EB287+hjZFCZf2DoGh2rtymttUSQHixD3R03TVH3GEm2Cr2z45H/IX5hOgvzhvTCVQXR1p1+glfoZaaTo+nlrbrUXXWiuw0kVt6e2Xb0YDQOiOEa2ckpdw/Tdw2FuM1LCHwuyuORtj2d2SeHgDfQFirzcrlDRO3+hrKN+0A+o2c8gX1Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blhDcAa8Y8ql2HvCJqFJPDKHMWpIR8rlZ4x7vadtC6k=;
 b=garUF4CLzqWXLqoLxiiOicpHCIvdyNhUFg65pdYKjoTcX5XHa9NVPH8TWUa3om+R3gptY9Xs0WFNtzxXruI5L4XIjDUj9/HHoEJAgfY2ZRMfAdGserNzjZDdRWOj9dvXZEz1OobfJgBnRQfEb3bLcicgmn20XivupIDM6ze2OUU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH0PR12MB7885.namprd12.prod.outlook.com (2603:10b6:510:28f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 11:01:03 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 11:01:02 +0000
Message-ID: <35ba51b1-598e-8c43-0eca-8fd538ef2659@amd.com>
Date: Fri, 17 Feb 2023 12:00:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] drm/suballoc: Introduce a generic suballocation
 manager
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230216144847.216259-1-thomas.hellstrom@linux.intel.com>
 <20230216144847.216259-2-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230216144847.216259-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH0PR12MB7885:EE_
X-MS-Office365-Filtering-Correlation-Id: e9f4b5bb-02bd-4329-257c-08db10d64221
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hWbbudmcMi9nU4UAtvnN0rIsvYXjhTpCzsE6vCGcLFE+Tr7T0dmGNZpLj1R3MT1RgyFSK4PyLRJoukUC/z6BmGgfojawAFB75ntqxWLMHmDJSnZJpvzOGmPndPj9TwaZfP0wj7J8TH9XMglU7vpAN05ymX3PIVgGBNi5VNWmyJqhzp+VZLqrp6cUemkbUDT5Nd/h2W/XPMgwxw/ei05yacB+doNfD11lq8VJPPxfspo9a04nZBrEWM0lSYIdzVOE1zY5dPu7SAXYaKxOmgfc2qasqmU23mstiClW1ue5n7Nn5E3s88/HqrOvyMZmSym2rpCEK+qnH0lyb13lrJA1Mp5sA/FfiGiiNCNjJ7d6MMfRn47MoX8AVJwWXUQHJlL8zyLZ6l4ARbhguUYbfTcNKUNDSQesja5dRTqxJnqOWzmewdSzedzZ7g5bMqrEFwcQp2+V8ZA1WuK1ALK6co3PRb+pk7o5TCc3an3LdYIKLreL9ZtqgObWoqE+qF7w4zKo8rfMKgBNLTItHXDogJ8h1K8pEPd3eqmEyktDZ52nSc9QRr6qEA41AJ7NyxR8EE+a97roRhOkiDkT4iRFZgrt91h2a2x11Vd60PSA65sc5yU/+r+IKlP7wLOpy0wp1Iff96eOf2hB5EYiH4KxZETUYtZIuhEizFFgJxNfr9vhy1J/umDndH/SvjVwhNX34GdeOFhs4DEr9Lg9c22DHnct2hzPz7540MxklDVjis3BPHMqKBpR6vKINbzi8Zn03JH+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(451199018)(83380400001)(38100700002)(36756003)(31696002)(86362001)(8936002)(5660300002)(2906002)(30864003)(6506007)(6512007)(186003)(6666004)(66574015)(2616005)(316002)(4326008)(66556008)(8676002)(66476007)(66946007)(6486002)(54906003)(41300700001)(478600001)(31686004)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RllHQ2VESHhLMHVqdHE0NmIyVVZYOXhsYnZCUlpHaElJNS9wT3pKNFdJZWlO?=
 =?utf-8?B?WXh2UHlsVmRPb1FjQXdvZTh6bXUrb0JVejhoc2NDYUNYL1d4K0J2SmxZWDVE?=
 =?utf-8?B?bi9leUl0MXgwdU45Q2NxUFhDZHNlSm5HOGxSd3VwaFk4K2JtZFpFTnlzdWM2?=
 =?utf-8?B?ZnhrMlNyL2lNMit1VW9uSndJVVR2M2hWbTVtUnZ5cWkwYWxqTWFnUWlRNUVs?=
 =?utf-8?B?TmMwbGlrNUdvRldVK0FyREZwNVhWb3pnVmFEQTNJZUVCSHJVeU1heW9jcS9Y?=
 =?utf-8?B?TnNQOWVadEl6ekhrSjdsb0Y2OHZKNlB3dEhkdXFBQnRldGFuSDRLSjRheWp5?=
 =?utf-8?B?NGhJaG1rUXVWemtsNSt4TW5DcGxVcjgxTFBZVUFSMW1pK0l5UmEyOWJQaXVh?=
 =?utf-8?B?VkxXZWppSzdyN29KRStlWittdTQvNUU4ZVJoOE5PMy84dWZqNnE5K3Z2aUIy?=
 =?utf-8?B?aWgrMFJGaVdtcHVqZ2VrbHJFbyt0MENwS1FqVVFEeE5DdXBMSnAxZWVsU1JQ?=
 =?utf-8?B?cHpOMHZoRzBucHFYU1JrWkExUS9NUlgvZkRaNld3d21QazQ3a2dTTDJtNkFu?=
 =?utf-8?B?US9DUmgzam8wUzV2RHZKZkl6ZWVlSi9zUkgrc2luUGNBZWVNc3Y1Q296aTZi?=
 =?utf-8?B?MTFZME9rems4WWdjcUY3NXNhbHFpT1RVSUtHYS85QUJBRXlMMG1xZHZXY3h1?=
 =?utf-8?B?Y3dzcjlJeERLeDhSaUI3YTNPTmRhVHlRaGV1SnI3WVB1SCs5S2Q2SnFBekll?=
 =?utf-8?B?Z2dQc3JoY3Z4SFBNaFBlanErWW1Td041VlhDdVZ3MXFyUXU4Vy91eHl4YVhP?=
 =?utf-8?B?Q00yaUszU2JrNytkd1R6cWZaWFJUZkYwSGFFYjV4T0RuLzVBYXZHcy9lK0ZD?=
 =?utf-8?B?UnRyTXd5bFB0a3p0aWNOb3NXYUFreGpTVm1tK1BLUkFDWGtTTnY2K3VQTm1k?=
 =?utf-8?B?ajNXYmdjc2Y4OG4vS0FEV1dTbkVYM1dXTnNIbEdXa3MwT09GVVBsNnFJTVBw?=
 =?utf-8?B?NURva0d3MzFHallnR2JoVG9xRE1kSkFnMzUwaStUa2FVVVd3NE1EZmpBOFl4?=
 =?utf-8?B?LzdqQWRhcWJZUmVDaklLQ2ltS3BuUkhxQWRTSU9vSGRRem1nQ2FHUjVPMWdp?=
 =?utf-8?B?QmI3ZGE4M2wwSFVLMWVROGFZanhaVWNVOSt2Zk1OcW04ZkJyM3dkOFJjK25U?=
 =?utf-8?B?NkJhZ0NYbEZzdHo2bi9wdldFTjJNNk9ZcG8zWnVON1dEVmZnRkc5Znd1bVVX?=
 =?utf-8?B?bU5rTWphRkpXSi9JNk9mTDdHbDl6dHpvSXBXQ2MwZlRUSTNIb0wvWExzb2Vl?=
 =?utf-8?B?RHNXdS9rdWRGcWVqR2VDLzJCN3UxTUs2L2xEbFpyS0lUWTl0SVcveHdYRzZZ?=
 =?utf-8?B?ekZUVkFlUnBZc0tXSFQ1aFZ2R2VSZENWaUEyN2NOREpUVDArL0F5TXZ3YmMx?=
 =?utf-8?B?YmFMUHFsNVRmQ2p3TXpCMG5rd1ZRRGw3Z0RjQUJuQy9aSGdOY1lVeXJPM2hW?=
 =?utf-8?B?MkhsaktjWWZtSnJ3RmVURHFkM1lKMWNYQ3ZQZHkvY3orajBFU0p5V1BnMkxN?=
 =?utf-8?B?SnNKOEVIalJUcVp3VGx5cXRzUm9aM1IzdTRYc1htTGd4RWF1QkJISDJNR1FM?=
 =?utf-8?B?ZmNlcTY3M1oxem1DU0FtSlZDTEdRaGovT09tKzUyalR3L1BiTDhqazhBTW5Y?=
 =?utf-8?B?SHpTdFEwb0VOdDlCbGJCcUM4Z2I3Vit3bXNZNXVyYTdWbVpSSGxIWi9mK0xM?=
 =?utf-8?B?QmR4MlZnYXN5SFBVeHl3WVN4T2txQ2ZNNnlhY1NMdHV0eFRhZ2JrcjloQ2ZF?=
 =?utf-8?B?RnFTY3BTRGJhYTNQMGlWb3JoeXZPWHRia0JoWHl1cG9MWjBlUDAxYzNQS2FY?=
 =?utf-8?B?R1g5VDNZd3RIME54UUM4RCt0MDVsQWIrL3JTeGZ1RlhUYnlSeGkyWmFhQ2FT?=
 =?utf-8?B?M041UHAvT1Q3Mk80SzEyRlErV0syRE0yazJVWHhYVWNBUDU3ZGtOTTUyMnpG?=
 =?utf-8?B?UCtWcmI3Zkh3aThHZVRHbFc5NGEwRDlyVGQ1ZWlkNHFVV3NWQXN1WjR4Mk96?=
 =?utf-8?B?dk1OaHNPelVVeXYxYldZUHU0bVoxWExTelpOTkdLY0MwU1V3b0Y2b1dOQXJU?=
 =?utf-8?B?YzRPeUdMUzZ2ZUVoS2M5bDJxNDlvc3p4T01FeUYrTk04YW5IaVk3VWlwbGpt?=
 =?utf-8?Q?MWGEshDU5wLkQI0e/jf3xKruPIFpJY3ZisQWpYcBCc+D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f4b5bb-02bd-4329-257c-08db10d64221
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 11:01:02.4227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ussmRmWSORfKs5bVlbYsqoYBLqUi8lmUaBFapg8fMnPRDHjNK+O6JMXZEc0bIQM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7885
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-xe@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.02.23 um 15:48 schrieb Thomas Hellström:
> Initially we tried to leverage the amdgpu suballocation manager.
> It turnes out, however, that it tries extremely hard not to enable
> signalling on the fences that hold the memory up for freeing, which makes
> it hard to understand and to fix potential issues with it.
>
> So in a simplification effort, introduce a drm suballocation manager as a
> wrapper around an existing allocator (drm_mm) and to avoid using queues
> for freeing, thus avoiding throttling on free which is an undesired
> feature as typically the throttling needs to be done uninterruptible.
>
> This variant is probably more cpu-hungry but can be improved at the cost
> of additional complexity. Ideas for that are documented in the
> drm_suballoc.c file.
>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Co-developed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/gpu/drm/Kconfig        |   4 +
>   drivers/gpu/drm/Makefile       |   3 +
>   drivers/gpu/drm/drm_suballoc.c | 301 +++++++++++++++++++++++++++++++++
>   include/drm/drm_suballoc.h     | 112 ++++++++++++
>   4 files changed, 420 insertions(+)
>   create mode 100644 drivers/gpu/drm/drm_suballoc.c
>   create mode 100644 include/drm/drm_suballoc.h
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index dc0f94f02a82..8fbe57407c60 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -232,6 +232,10 @@ config DRM_GEM_SHMEM_HELPER
>   	help
>   	  Choose this if you need the GEM shmem helper functions
>   
> +config DRM_SUBALLOC_HELPER
> +	tristate
> +	depends on DRM
> +
>   config DRM_SCHED
>   	tristate
>   	depends on DRM
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index ab4460fcd63f..1e04d135e866 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -88,6 +88,9 @@ obj-$(CONFIG_DRM_GEM_DMA_HELPER) += drm_dma_helper.o
>   drm_shmem_helper-y := drm_gem_shmem_helper.o
>   obj-$(CONFIG_DRM_GEM_SHMEM_HELPER) += drm_shmem_helper.o
>   
> +drm_suballoc_helper-y := drm_suballoc.o
> +obj-$(CONFIG_DRM_SUBALLOC_HELPER) += drm_suballoc_helper.o
> +
>   drm_vram_helper-y := drm_gem_vram_helper.o
>   obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
>   
> diff --git a/drivers/gpu/drm/drm_suballoc.c b/drivers/gpu/drm/drm_suballoc.c
> new file mode 100644
> index 000000000000..6e0292dea548
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_suballoc.c
> @@ -0,0 +1,301 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +
> +#include <drm/drm_suballoc.h>
> +
> +/**
> + * DOC:
> + * This suballocator intends to be a wrapper around a range allocator
> + * that is aware also of deferred range freeing with fences. Currently
> + * we hard-code the drm_mm as the range allocator.
> + * The approach, while rather simple, suffers from three performance
> + * issues that can all be fixed if needed at the tradeoff of more and / or
> + * more complex code:
> + *
> + * 1) It's cpu-hungry, the drm_mm allocator is overkill. Either code a
> + * much simpler range allocator, or let the caller decide by providing
> + * ops that wrap any range allocator. Also could avoid waking up unless
> + * there is a reasonable chance of enough space in the range manager.

That's most likely highly problematic.

The suballocator in radeon/amdgpu was designed so that it resembles a 
ring buffer and is therefor rather CPU efficient.

We could make the allocator much more trivial, but using drm_mm for this 
is a sledgehammer and therefore a pretty clear no-go.

Regards,
Christian.

> + *
> + * 2) We unnecessarily install the fence callbacks too early, forcing
> + * enable_signaling() too early causing extra driver effort. This is likely
> + * not an issue if used with the drm_scheduler since it calls
> + * enable_signaling() early anyway.
> + *
> + * 3) Long processing in irq (disabled) context. We've mostly worked around
> + * that already by using the idle_list. If that workaround is deemed to
> + * complex for little gain, we can remove it and use spin_lock_irq()
> + * throughout the manager. If we want to shorten processing in irq context
> + * even further, we can skip the spin_trylock in __drm_suballoc_free() and
> + * avoid freeing allocations from irq context altogeher. However drm_mm
> + * should be quite fast at freeing ranges.
> + *
> + * 4) Shrinker that starts processing the list items in 2) and 3) to play
> + * better with the system.
> + */
> +
> +static void drm_suballoc_process_idle(struct drm_suballoc_manager *sa_manager);
> +
> +/**
> + * drm_suballoc_manager_init() - Initialise the drm_suballoc_manager
> + * @sa_manager: pointer to the sa_manager
> + * @size: number of bytes we want to suballocate
> + * @align: alignment for each suballocated chunk
> + *
> + * Prepares the suballocation manager for suballocations.
> + */
> +void drm_suballoc_manager_init(struct drm_suballoc_manager *sa_manager,
> +			       u64 size, u64 align)
> +{
> +	spin_lock_init(&sa_manager->lock);
> +	spin_lock_init(&sa_manager->idle_list_lock);
> +	mutex_init(&sa_manager->alloc_mutex);
> +	drm_mm_init(&sa_manager->mm, 0, size);
> +	init_waitqueue_head(&sa_manager->wq);
> +	sa_manager->range_size = size;
> +	sa_manager->alignment = align;
> +	INIT_LIST_HEAD(&sa_manager->idle_list);
> +}
> +EXPORT_SYMBOL(drm_suballoc_manager_init);
> +
> +/**
> + * drm_suballoc_manager_fini() - Destroy the drm_suballoc_manager
> + * @sa_manager: pointer to the sa_manager
> + *
> + * Cleans up the suballocation manager after use. All fences added
> + * with drm_suballoc_free() must be signaled, or we cannot clean up
> + * the entire manager.
> + */
> +void drm_suballoc_manager_fini(struct drm_suballoc_manager *sa_manager)
> +{
> +	drm_suballoc_process_idle(sa_manager);
> +	drm_mm_takedown(&sa_manager->mm);
> +	mutex_destroy(&sa_manager->alloc_mutex);
> +}
> +EXPORT_SYMBOL(drm_suballoc_manager_fini);
> +
> +static void __drm_suballoc_free(struct drm_suballoc *sa)
> +{
> +	struct drm_suballoc_manager *sa_manager = sa->manager;
> +	struct dma_fence *fence;
> +
> +	/*
> +	 * In order to avoid protecting the potentially lengthy drm_mm manager
> +	 * *allocation* processing with an irq-disabling lock,
> +	 * defer touching the drm_mm for freeing until we're in task context,
> +	 * with no irqs disabled, or happen to succeed in taking the manager
> +	 * lock.
> +	 */
> +	if (!in_task() || irqs_disabled()) {
> +		unsigned long irqflags;
> +
> +		if (spin_trylock(&sa_manager->lock))
> +			goto locked;
> +
> +		spin_lock_irqsave(&sa_manager->idle_list_lock, irqflags);
> +		list_add_tail(&sa->idle_link, &sa_manager->idle_list);
> +		spin_unlock_irqrestore(&sa_manager->idle_list_lock, irqflags);
> +		wake_up(&sa_manager->wq);
> +		return;
> +	}
> +
> +	spin_lock(&sa_manager->lock);
> +locked:
> +	drm_mm_remove_node(&sa->node);
> +
> +	fence = sa->fence;
> +	sa->fence = NULL;
> +	spin_unlock(&sa_manager->lock);
> +	/* Maybe only wake if first mm hole is sufficiently large? */
> +	wake_up(&sa_manager->wq);
> +	dma_fence_put(fence);
> +	kfree(sa);
> +}
> +
> +/* Free all deferred idle allocations */
> +static void drm_suballoc_process_idle(struct drm_suballoc_manager *sa_manager)
> +{
> +	/*
> +	 * prepare_to_wait() / wake_up() semantics ensure that any list
> +	 * addition that was done before wake_up() is visible when
> +	 * this code is called from the wait loop.
> +	 */
> +	if (!list_empty_careful(&sa_manager->idle_list)) {
> +		struct drm_suballoc *sa, *next;
> +		unsigned long irqflags;
> +		LIST_HEAD(list);
> +
> +		spin_lock_irqsave(&sa_manager->idle_list_lock, irqflags);
> +		list_splice_init(&sa_manager->idle_list, &list);
> +		spin_unlock_irqrestore(&sa_manager->idle_list_lock, irqflags);
> +
> +		list_for_each_entry_safe(sa, next, &list, idle_link)
> +			__drm_suballoc_free(sa);
> +	}
> +}
> +
> +static void
> +drm_suballoc_fence_signaled(struct dma_fence *fence, struct dma_fence_cb *cb)
> +{
> +	struct drm_suballoc *sa = container_of(cb, typeof(*sa), cb);
> +
> +	__drm_suballoc_free(sa);
> +}
> +
> +static int drm_suballoc_tryalloc(struct drm_suballoc *sa, u64 size)
> +{
> +	struct drm_suballoc_manager *sa_manager = sa->manager;
> +	int err;
> +
> +	drm_suballoc_process_idle(sa_manager);
> +	spin_lock(&sa_manager->lock);
> +	err = drm_mm_insert_node_generic(&sa_manager->mm, &sa->node, size,
> +					 sa_manager->alignment, 0,
> +					 DRM_MM_INSERT_EVICT);
> +	spin_unlock(&sa_manager->lock);
> +	return err;
> +}
> +
> +/**
> + * drm_suballoc_new() - Make a suballocation.
> + * @sa_manager: pointer to the sa_manager
> + * @size: number of bytes we want to suballocate.
> + * @gfp: Allocation context.
> + * @intr: Whether to sleep interruptibly if sleeping.
> + *
> + * Try to make a suballocation of size @size, which will be rounded
> + * up to the alignment specified in specified in drm_suballoc_manager_init().
> + *
> + * Returns a new suballocated bo, or an ERR_PTR.
> + */
> +struct drm_suballoc*
> +drm_suballoc_new(struct drm_suballoc_manager *sa_manager, u64 size,
> +		 gfp_t gfp, bool intr)
> +{
> +	struct drm_suballoc *sa;
> +	DEFINE_WAIT(wait);
> +	int err = 0;
> +
> +	if (size > sa_manager->range_size)
> +		return ERR_PTR(-ENOSPC);
> +
> +	sa = kzalloc(sizeof(*sa), gfp);
> +	if (!sa)
> +		return ERR_PTR(-ENOMEM);
> +
> +	/* Avoid starvation using the alloc_mutex */
> +	if (intr)
> +		err = mutex_lock_interruptible(&sa_manager->alloc_mutex);
> +	else
> +		mutex_lock(&sa_manager->alloc_mutex);
> +	if (err) {
> +		kfree(sa);
> +		return ERR_PTR(err);
> +	}
> +
> +	sa->manager = sa_manager;
> +	err = drm_suballoc_tryalloc(sa, size);
> +	if (err != -ENOSPC)
> +		goto out;
> +
> +	for (;;) {
> +		prepare_to_wait(&sa_manager->wq, &wait,
> +				intr ? TASK_INTERRUPTIBLE :
> +				TASK_UNINTERRUPTIBLE);
> +
> +		err = drm_suballoc_tryalloc(sa, size);
> +		if (err != -ENOSPC)
> +			break;
> +
> +		if (intr && signal_pending(current)) {
> +			err = -ERESTARTSYS;
> +			break;
> +		}
> +
> +		io_schedule();
> +	}
> +	finish_wait(&sa_manager->wq, &wait);
> +
> +out:
> +	mutex_unlock(&sa_manager->alloc_mutex);
> +	if (!sa->node.size) {
> +		kfree(sa);
> +		WARN_ON(!err);
> +		sa = ERR_PTR(err);
> +	}
> +
> +	return sa;
> +}
> +EXPORT_SYMBOL(drm_suballoc_new);
> +
> +/**
> + * drm_suballoc_free() - Free a suballocation
> + * @suballoc: pointer to the suballocation
> + * @fence: fence that signals when suballocation is idle
> + * @queue: the index to which queue the suballocation will be placed on the free list.
> + *
> + * Free the suballocation. The suballocation can be re-used after @fence
> + * signals.
> + */
> +void
> +drm_suballoc_free(struct drm_suballoc *sa, struct dma_fence *fence)
> +{
> +	if (!sa)
> +		return;
> +
> +	if (!fence || dma_fence_is_signaled(fence)) {
> +		__drm_suballoc_free(sa);
> +		return;
> +	}
> +
> +	sa->fence = dma_fence_get(fence);
> +	if (dma_fence_add_callback(fence, &sa->cb, drm_suballoc_fence_signaled))
> +		__drm_suballoc_free(sa);
> +}
> +EXPORT_SYMBOL(drm_suballoc_free);
> +
> +#ifdef CONFIG_DEBUG_FS
> +
> +/**
> + * drm_suballoc_dump_debug_info() - Dump the suballocator state
> + * @sa_manager: The suballoc manager.
> + * @p: Pointer to a drm printer for output.
> + * @suballoc_base: Constant to add to the suballocated offsets on printout.
> + *
> + * This function dumps the suballocator state. Note that the caller has
> + * to explicitly order frees and calls to this function in order for the
> + * freed node to show up as protected by a fence.
> + */
> +void drm_suballoc_dump_debug_info(struct drm_suballoc_manager *sa_manager,
> +				  struct drm_printer *p, u64 suballoc_base)
> +{
> +	const struct drm_mm_node *entry;
> +
> +	spin_lock(&sa_manager->lock);
> +	drm_mm_for_each_node(entry, &sa_manager->mm) {
> +		struct drm_suballoc *sa =
> +			container_of(entry, typeof(*sa), node);
> +
> +		drm_printf(p, " ");
> +		drm_printf(p, "[0x%010llx 0x%010llx] size %8lld",
> +			   (unsigned long long)suballoc_base + entry->start,
> +			   (unsigned long long)suballoc_base + entry->start +
> +			   entry->size, (unsigned long long)entry->size);
> +
> +		if (sa->fence)
> +			drm_printf(p, " protected by 0x%016llx on context %llu",
> +				   (unsigned long long)sa->fence->seqno,
> +				   (unsigned long long)sa->fence->context);
> +
> +		drm_printf(p, "\n");
> +	}
> +	spin_unlock(&sa_manager->lock);
> +}
> +EXPORT_SYMBOL(drm_suballoc_dump_debug_info);
> +#endif
> +
> +MODULE_AUTHOR("Intel Corporation");
> +MODULE_DESCRIPTION("Simple range suballocator helper");
> +MODULE_LICENSE("GPL and additional rights");
> diff --git a/include/drm/drm_suballoc.h b/include/drm/drm_suballoc.h
> new file mode 100644
> index 000000000000..910952b3383b
> --- /dev/null
> +++ b/include/drm/drm_suballoc.h
> @@ -0,0 +1,112 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022 Intel Corporation
> + */
> +#ifndef _DRM_SUBALLOC_H_
> +#define _DRM_SUBALLOC_H_
> +
> +#include <drm/drm_mm.h>
> +
> +#include <linux/dma-fence.h>
> +#include <linux/types.h>
> +
> +/**
> + * struct drm_suballoc_manager - Wrapper for fenced range allocations
> + * @mm: The range manager. Protected by @lock.
> + * @range_size: The total size of the range.
> + * @alignment: Range alignment.
> + * @wq: Wait queue for sleeping allocations on contention.
> + * @idle_list: List of idle but not yet freed allocations. Protected by
> + * @idle_list_lock.
> + * @task: Task waiting for allocation. Protected by @lock.
> + */
> +struct drm_suballoc_manager {
> +	/** @lock: Manager lock. Protects @mm. */
> +	spinlock_t lock;
> +	/**
> +	 * @idle_list_lock: Lock to protect the idle_list.
> +	 * Disable irqs when locking.
> +	 */
> +	spinlock_t idle_list_lock;
> +	/** @alloc_mutex: Mutex to protect against stavation. */
> +	struct mutex alloc_mutex;
> +	struct drm_mm mm;
> +	u64 range_size;
> +	u64 alignment;
> +	wait_queue_head_t wq;
> +	struct list_head idle_list;
> +};
> +
> +/**
> + * struct drm_suballoc: Suballocated range.
> + * @node: The drm_mm representation of the range.
> + * @fence: dma-fence indicating whether allocation is active or idle.
> + * Assigned on call to free the allocation so doesn't need protection.
> + * @cb: dma-fence callback structure. Used for callbacks when the fence signals.
> + * @manager: The struct drm_suballoc_manager the range belongs to. Immutable.
> + * @idle_link: Link for the manager idle_list. Progected by the
> + * drm_suballoc_manager::idle_lock.
> + */
> +struct drm_suballoc {
> +	struct drm_mm_node node;
> +	struct dma_fence *fence;
> +	struct dma_fence_cb cb;
> +	struct drm_suballoc_manager *manager;
> +	struct list_head idle_link;
> +};
> +
> +void drm_suballoc_manager_init(struct drm_suballoc_manager *sa_manager,
> +			       u64 size, u64 align);
> +
> +void drm_suballoc_manager_fini(struct drm_suballoc_manager *sa_manager);
> +
> +struct drm_suballoc *drm_suballoc_new(struct drm_suballoc_manager *sa_manager,
> +				      u64 size, gfp_t gfp, bool intr);
> +
> +void drm_suballoc_free(struct drm_suballoc *sa, struct dma_fence *fence);
> +
> +/**
> + * drm_suballoc_soffset - Range start.
> + * @sa: The struct drm_suballoc.
> + *
> + * Return: The start of the allocated range.
> + */
> +static inline u64 drm_suballoc_soffset(struct drm_suballoc *sa)
> +{
> +	return sa->node.start;
> +}
> +
> +/**
> + * drm_suballoc_eoffset - Range end.
> + * @sa: The struct drm_suballoc.
> + *
> + * Return: The end of the allocated range + 1.
> + */
> +static inline u64 drm_suballoc_eoffset(struct drm_suballoc *sa)
> +{
> +	return sa->node.start + sa->node.size;
> +}
> +
> +/**
> + * drm_suballoc_size - Range size.
> + * @sa: The struct drm_suballoc.
> + *
> + * Return: The size of the allocated range.
> + */
> +static inline u64 drm_suballoc_size(struct drm_suballoc *sa)
> +{
> +	return sa->node.size;
> +}
> +
> +#ifdef CONFIG_DEBUG_FS
> +void drm_suballoc_dump_debug_info(struct drm_suballoc_manager *sa_manager,
> +				  struct drm_printer *p, u64 suballoc_base);
> +#else
> +static inline void
> +drm_suballoc_dump_debug_info(struct drm_suballoc_manager *sa_manager,
> +			     struct drm_printer *p, u64 suballoc_base)
> +{ }
> +
> +#endif
> +
> +#endif /* _DRM_SUBALLOC_H_ */

