Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8E88581EF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 16:56:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1DC10E415;
	Fri, 16 Feb 2024 15:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KnlAKQIJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE2D10E415;
 Fri, 16 Feb 2024 15:56:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5kH1YhMOJN4lM/u4Ls2H3WJwAGSACcbW3yCcoUFHjAMhDXiZqA2dcoK5tTTxXlHvlPJTias5IVGAobTWMRGWdi1t208s27HywsRDPtZmapr97xtt8eXPS1SR3v49h/X12xE5sZRIEL3N4uF+clUsq+eKNWdGGQQRZpiaTkAYfH2u5QkdoB1Pbmy+bFoAN14+uQv7et8qqnIIvYFtc5W55gZbuxpmryw907zAYRGf3TM5xswran58fjR3jjHN4um97NdraiFl4FQbt6WGBxioIWhqrCcGw57dXikXEceydk5Vi9aw66plNsTS/Qe1+6IzAM8fIPg016C52drkWyFsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jM1V9javR1sENjWEM/ZkczPw5966UYcoAen65jmGfoA=;
 b=lc1FmSqGJdLbwTlIRbBJ4CSs+3dOVP4gt4oql6EcqtdcmYCaDyjPI8eq0d1dxHkCDLbbA9j3QnaKnh/mBm+cHzGSpEUYySrn70Qhfgz1mhSgg2WDIR9G3Hk7YqSLYXsyFp0bjmOI+m4QTcmDnI3XWRzXgoy/xixmpVnlgNd+AfDNrsN3nP0fDkVhZvEjiyZDkatZ/w/6NenxDOhhRxTWMUBwjk9M7ghdx3IRRxurMnP1oznIqj53L+NC0MbLIL7/BbBy1/oJKOp/UcRRvCJmaAJVSE1hj8/cE0NVgXHtZZ427sNZSVcOhjeyfxPg/NxG/QuBCqQT81fpfp/0fzKJTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jM1V9javR1sENjWEM/ZkczPw5966UYcoAen65jmGfoA=;
 b=KnlAKQIJIXJlvus4jedq8Fyxr6+f0HngjjXuSe0BzMXLB1ZxWuJxsgGYrABMSRZctHJGZcUsqa4SRDcdy1FtJTMr1oLUAHccv1nv4v0OD5QZ7IxA1LYx0m+XJ9okjk6eJHZDwm/mTSFBKuIlbijP7yoDNQOdJlPnHxTGApbi/Y4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV8PR12MB9156.namprd12.prod.outlook.com (2603:10b6:408:181::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.15; Fri, 16 Feb
 2024 15:56:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7292.022; Fri, 16 Feb 2024
 15:56:23 +0000
Message-ID: <c50125dd-7f9a-48f0-8969-7c58905d65a9@amd.com>
Date: Fri, 16 Feb 2024 16:56:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] amdgpu: use trace_dma_fence_sync_to in
 amdgpu_fence_sync
Content-Language: en-US
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Alex Deucher
 <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
References: <20240216151006.475077-1-pierre-eric.pelloux-prayer@amd.com>
 <20240216151006.475077-4-pierre-eric.pelloux-prayer@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240216151006.475077-4-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV8PR12MB9156:EE_
X-MS-Office365-Filtering-Correlation-Id: 70ec46ab-9718-4435-a7ee-08dc2f07d319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nqZ60g/P7irbZlAjJtONo26//5mpDWGS0sBe/XolSbrA5Ev0dSH/aq4QIjkiSGrtLWyox7/kH2ClQ5HZFZvlZxPkJgTEtWGwRD2KxG9fQoXXcvg/dwpHokV8c1a5O+V0VIR/2jx1wVziD7YGXySTkXkeVVe4zNEM94oQxtmsxq0Yl44f3a9cCNzsRxpMRihUSA2QlD5aj1dYMCX66sduToBd4KpD9usLACo9NeoyItuss8UVv0mlnbx10oiPJ88Ep6QP7kAjWyZfuimQg76tSnM7y5tglC5rZaze64e27O2G9ai/7laRvYPitPhz7Aj6JmjzsBl4/iN1Dm9IFnivdHPsBpGtZYbhe8arF4cyD/pDj8EdVmqvS1S8mTIrdNLn0kdR7N5NUpYrjY8izQYyn/zG/n+v5OAfGoeIYZVUtIrOmXkkrcGVTfuZj01EkN+I+1TLiqMGACHVDiJR2EBXrxO2ospR8sGeQYx3YWGFnR0atyLbhPBS8VFAeKtLZpdP0wqQRiRwCR4oBtBJRpoY79saLUjYp2CktcGNjxscYUfx1PKm+mTVVrSasgcNSHnMCrfnGRp9q6QYiEmKazhZtw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(346002)(396003)(39860400002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(5660300002)(66476007)(8676002)(66556008)(66946007)(8936002)(2906002)(83380400001)(26005)(921011)(36756003)(31696002)(86362001)(38100700002)(966005)(6512007)(6486002)(6506007)(316002)(6666004)(110136005)(2616005)(41300700001)(478600001)(31686004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VW05MFE0Y2FLRm1jdloySUg5aWl6Um1pT1VUVm9oWnRuMVQyMkdvQmdkNHhx?=
 =?utf-8?B?c202cHNLYU1sYm1ISEVWbk5mRTJhMnBxdnlBMmJnc2FVanVibFp1Njd2YkJW?=
 =?utf-8?B?MTRmT0RXUGcyN3ZtM3l3RTA2Zzh3MkI4Q01Ib1V4OUs2QzhsOEFQM2VjN1JL?=
 =?utf-8?B?YkgzWWlycGZHZHJqaWFGeDlvaXhZRVEzSGtrbTkya3B4OVJGWVF4STNkV0Z0?=
 =?utf-8?B?TW1lRllqS0t0UUVMVlYzOE95K3prNGZuK29tSkZFeHlteS9wdHBhWWNWL2d1?=
 =?utf-8?B?YVFNN1NIdzhCeVJLbm5rQUpMVWlRT2FYV0ZRcFBQUGxNZnF1bEZBYnVodmRz?=
 =?utf-8?B?MnpjdzhMaGI2UmphNmhXa2tZZ2lrSEdyM24xUm8wL00waEdtL2ZJbG5IVml4?=
 =?utf-8?B?OUJMZGNCblVGaWNIR0N2NlRldm5SK0xYZis4TWZrYVM4T1o5Ymw2TW9PSG9p?=
 =?utf-8?B?OXROZC9iaWpVaUlHVzBveWN0eVluVkdMQnRxZ0R6a3VvYi82QjRNUmxpMDQ3?=
 =?utf-8?B?eGFXcVBZcHZRUkV5TWlrbUhjaTlZeGttbm1nS010Y1prN3VKMWMvU2orU0px?=
 =?utf-8?B?aHFRa0NKVHNlS1BRbWRXalVrTitraUpkbjVVMWZiS3NYTE9pZjdrbnFVZ3J1?=
 =?utf-8?B?bnYrNzhxTkw2OEdhWTN0bEdSYklMSXZsTHZJQ3dFd3lab0g1OXFka2RrcCsw?=
 =?utf-8?B?c0xRTWRFQ2lPTUJ0eDVtV1puYmdRNWtnN0lDWjJpd3JmRXd0ZzVkY0xGVmtx?=
 =?utf-8?B?ekZYWnVWdWhIMFp4UGU0bnQ0aXpzTS9URnk4V0cyQ1MyOUJUbnR4WXJaV2pO?=
 =?utf-8?B?RDJBMDFTS1liejZnUHJhV3RjMmpYcjhTTkxkQ0pKVlIzRUdXNkkzbytpYWx0?=
 =?utf-8?B?blNrWUdWTThjN2NZa3dPNGduelZFallIRGhqR0FYTUhISWJSK2VwTDBqSnVU?=
 =?utf-8?B?SjViTUxjQWF3dEtmdS9JSE1VZnR6cTFpcmJHYlovT1FFbVBHaVVpRkFvbTNE?=
 =?utf-8?B?RjBJMmQwdnB4WW5QZHBUMUM1ZFVKb1RaMFBzRXZlaXFNWWNsRFN0MkJIMnAz?=
 =?utf-8?B?QlVUL1Z2Y0RGQTYyeVJSSy84ZFI2dnVnREJNcXl0OHQrZ3piTkNpZ0pCYnhn?=
 =?utf-8?B?Nk5LdEUyek9BVU10M2llYjdDQ2FIQkpYVUJwMHIrajdSL3dnUGJldWxIcnNs?=
 =?utf-8?B?RmtGT3NhR2FDMUdzR3IzZkExcEgwZlpDY2I4RmMxNUVqVHhjbjVqZ2IxUXc0?=
 =?utf-8?B?dk5HRnlQM29hOXYrdE0wNUdzY1VndFB1dWgxY1crYlQyUDhVYXN6V1dsdDRZ?=
 =?utf-8?B?NGo1WnJzRVRZWVRKcHQ1NTdrdUxINFMwdmRqeCsyYlIyR2ZJSWVWaVVWN2w2?=
 =?utf-8?B?dDhvVXB5YTY3bGhwNHBxYlkxNFVpL01CUVEvM0lmOTM2MTVNeDZMaDM2U1I1?=
 =?utf-8?B?WWE3bHJXT0xlbDFMNkUzL2ZLUlFtcFdhaGQ3SVR3UExBL0J0Wkx2QXZocnU4?=
 =?utf-8?B?K0Z6a2lJZ0tna2ZhUGNRcFhNQklqaGt3aGkxWGxsWGNyT2xkV09OeWNkZENw?=
 =?utf-8?B?V01NTHdXRmVON0ZJaGduaENFU09QRWF3Qkk0ZWJkL1pkVjZzRWxtZjIvckl0?=
 =?utf-8?B?eXgxc3FQTkhSK0dsbndhMHg2Sm1yU0ZxQ1RSMWczd1FuZHhOUSszMWZDWjZD?=
 =?utf-8?B?eGlpVzVsZGRiNGhOcHVzQjlWcTF6SmlDbmltNXpQa3ZsUHZ1NTZJNE05OUJC?=
 =?utf-8?B?dGtLU3ZrVkdtYzNFT3lrb2w0TldpRDBoZmprU3IyZlhHVE5Hd1dtRFJ0TDBP?=
 =?utf-8?B?WWJuZVV1MnhyT0R6c3U0MHpvVXl2aTFmb09Ld2kwYWRyYjRSc1dKMjN5MG1y?=
 =?utf-8?B?NC93Rk9xMkxHVjl6Ukk2RUpnb0FweHZFbFdZc1FVUzNCdzNvbjJ4V2FSeDYy?=
 =?utf-8?B?Mjc0ZTdsOGtqb3pQTk9XYU8rSzVxU0JEalZZZlNFRTZKTUN4UitJRDA5OVNF?=
 =?utf-8?B?dEtFZkR3UzZEQUQ3d2daeGgxSFV4NDQ4V0tZTjc3TlZyTXk3ZE9nOWJxVEdK?=
 =?utf-8?B?RXlJWE9WYTlROHlTak93elBQQkd1QlM1SDJCNWlNS1M0NW5hN1NXWHRYcHZS?=
 =?utf-8?Q?+2ZoYQa3QjWn95VROjWsiQPBQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70ec46ab-9718-4435-a7ee-08dc2f07d319
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 15:56:23.5563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H5oiWMt35wNIad/0yGvHlPoaSsvJ0NkqFnLkN9BgDxZLbNn6/lD4SaRd3qVDxyqS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9156
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

Am 16.02.24 um 16:09 schrieb Pierre-Eric Pelloux-Prayer:
> This makes it possible to understand the dependencies between jobs.
> Possible usage of this trace:
> * stuttering issues like Mesa !9189
> * incorrect synchronization: I don't have a link for this one, but having
>    these events was very useful to debug a virtio-gpu / native-context /
>    radeonsi sync issue
>
> I have prototype code using this in UMR, as can be see here:
>     https://gitlab.freedesktop.org/tomstdenis/umr/-/merge_requests/37
>
> v2: add a macro since every caller passes __func__ as the reason parameter
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 9 +++++++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h | 4 +++-
>   2 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> index 1b013a44ca99..9a3fdc4be51e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> @@ -30,6 +30,7 @@
>    */
>   
>   #include <linux/dma-fence-chain.h>
> +#include <trace/events/dma_fence.h>
>   
>   #include "amdgpu.h"
>   #include "amdgpu_trace.h"
> @@ -145,14 +146,16 @@ static bool amdgpu_sync_add_later(struct amdgpu_sync *sync, struct dma_fence *f)
>   }
>   
>   /**
> - * amdgpu_sync_fence - remember to sync to this fence
> + * amdgpu_sync_fence_with_reason - remember to sync to this fence
>    *
>    * @sync: sync object to add fence to
>    * @f: fence to sync to
> + * @reason: why do we sync to this fence
>    *
>    * Add the fence to the sync object.
>    */
> -int amdgpu_sync_fence(struct amdgpu_sync *sync, struct dma_fence *f)
> +int amdgpu_sync_fence_with_reason(struct amdgpu_sync *sync, struct dma_fence *f,
> +				  const char *reason)
>   {
>   	struct amdgpu_sync_entry *e;
>   
> @@ -166,6 +169,8 @@ int amdgpu_sync_fence(struct amdgpu_sync *sync, struct dma_fence *f)
>   	if (!e)
>   		return -ENOMEM;
>   
> +	trace_dma_fence_used_as_dependency(f, reason);
> +
>   	hash_add(sync->fences, &e->node, f->context);
>   	e->fence = dma_fence_get(f);
>   	return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h
> index cf1e9e858efd..52e7306801de 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h
> @@ -47,7 +47,9 @@ struct amdgpu_sync {
>   };
>   
>   void amdgpu_sync_create(struct amdgpu_sync *sync);
> -int amdgpu_sync_fence(struct amdgpu_sync *sync, struct dma_fence *f);
> +int amdgpu_sync_fence_with_reason(struct amdgpu_sync *sync, struct dma_fence *f,
> +				  const char *reason);
> +#define amdgpu_sync_fence(s, f) amdgpu_sync_fence_with_reason(s, f, __func__)
>   int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
>   		     struct dma_resv *resv, enum amdgpu_sync_mode mode,
>   		     void *owner);

