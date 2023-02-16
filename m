Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 307AA69A28D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 00:45:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EAAA10E3AB;
	Thu, 16 Feb 2023 23:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FEC110E390;
 Thu, 16 Feb 2023 23:45:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lqGHedpdGzeKYe9CFfgYUaCgNZ/AiMXUFHQjA9HYtt79YJi/vomDjg2SfIn9lgR9ErMALnT7ynH1tkFSKPDoN0CIREKZ97V8q7QQ6rVu1+lASB17ylzBHd+yxbTjs4evY1s1YXwOksFl/5YMD6I3tcx+Jr7c2/u0RUjc9DbH4/cq0slrPqcL7zkAItg4O5rFm2Pa+DfGsw4hSbOACnnT5PAPG/GAq06EMKu7uuilnvrGQRjy1kbyNlrdUioblttj3Rfnfnh0UBDKAW2rH2BIDfOk8Vd+wKBrTHQNc1mrSAlrQRsNZYPiYMzdC4eae7NzRi9/+zpKzL+d7tCTRr1qVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9d4UECbHwDOk75vJMfMFgJLN8pU+WoGloErYr6i0Ows=;
 b=BAgrvFJcwKOzgO5fjeRp/Y21CXwxUkrNQa5br/y+9Km4/Q2Xdgu9YxzozN4Xcf+ozs7zs2qcrfbthsyuwcmbZylUmbl43fiy4e8Qq5r8z90fvms4tQIAQ0LS6vgxslNRZ6dpUVdqpayglRCL1jMeP1xVcadnSUGnQtUm8ebArXGV+S8nnxpQ6UW4jZTWiNVeboOiB+H96XyOphgW9lvta/ODlPRBVUo6MwkGjltewXfkEt49OXp+WsI61DT0ENQx35FfMuLUERaL8REitMEphwEoAJDinXKX/UpiIFoW7VR6jE1qCQOsjtBKqkHxbwYw5UNEGiCwu6BBhYvg0asGjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9d4UECbHwDOk75vJMfMFgJLN8pU+WoGloErYr6i0Ows=;
 b=mThY2xVJKhpKuG4zyIa0M0E1YschfZyadpHP5+0f7Ox3k7MrqTGlpxAwnJIhYEVpAqi8lPiOoSCmFkDJtk5o9FAoa5wJUmlBcgm8PoI/UzdMAcqOWPAcnTbZ80oKuHN40o/vEKKHId1gYxaIxOIVwofXOEqhxsz6JchyJHwZNCQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SN7PR12MB7955.namprd12.prod.outlook.com (2603:10b6:806:34d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Thu, 16 Feb
 2023 23:45:00 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::e6ea:9231:6d39:93da]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::e6ea:9231:6d39:93da%4]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 23:45:00 +0000
Message-ID: <cd1b640c-ba59-4627-ad2f-b9593833598e@amd.com>
Date: Thu, 16 Feb 2023 18:01:40 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 07/32] drm/amdgpu: add gfx9.4.1 hw debug mode enable and
 disable calls
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-8-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230125195401.4183544-8-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0231.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::8) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SN7PR12MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: e50f1ff2-8a00-48bb-7480-08db1077d165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EmERD9nDmwFXYm+6na/KFFkPJ+mxCcCO/ZF8yZsCZppztJkZIfF0724plUQEzDra+Zz4JjZjquAXYq5jzxGKjRVIMRdut0GtZIhm9+Y++VHgbFfh0I4M7diCTIzlT7cOTZFwywW4DjDomJOxbdF1N5Yfl84k9xNhV8rbN4+dXxBH0gHpRnqiFtiwnyP5GkI+L9m2vp2ykz6Vx+DSsyr18VjXUjcFgW7z8LjzbifDcBnBbHFTeExsbyzPlitkjVK9w65UgjRgIqk8cvUCbgYwstVKGE6MXEZAIFuQlkvVlsmvruaFFyGVjJLcudHpXMVOnPEAQnXgkTkp+qtVs3ITcv7hnxe9UsW0WTwHbgFvZAKPECwHibt/qQIlZ0rb3cR28Wde4FjV9Ggnc71z5AAaPj7iGkkffRzXpOat0awq37DrqyQNGCNSqRRUyy3vyuHGWgkxFNR00Uun5+cu8cFWTgJY65gslAj55g/VyjCMNerJG5mmhyHwxLeB3z3+Ify35ovuUObi5nh1nhSo2hE00T50rYhGlmBjukma2POKTBVuIt08+Eb8kt/TatcyBqkB7QwhdVtbTtW11xdoOoTl7JE8QxsEiuuORBen+MB+VLxpLW1fzEnoq9xDYbU6qJjMEoL4t1OCZDXYem+Gm2sMQ376GV9ZH5IXejfCPG+vvx2clSWYIPk+1PBxHYEd0k3D08myvvtisw+wcJhatMewJW82SC9tkUZaVWiLOsstDBA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199018)(31686004)(8936002)(2906002)(41300700001)(36756003)(31696002)(5660300002)(44832011)(86362001)(83380400001)(38100700002)(8676002)(478600001)(6486002)(450100002)(26005)(6512007)(186003)(66946007)(66556008)(316002)(66476007)(53546011)(6506007)(2616005)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3NVdTdiaEhUdXpvV2hoRnZmYmFvd0lkT3NEZ2V5cVp3QVlKcUU3TzMrTHl4?=
 =?utf-8?B?a2tSNVFqNWE0Ty8rNTVOWTNvVTh1SkFrRUNsdmFLU2NoOElVOS9FRHdUNEgw?=
 =?utf-8?B?STUxVmFiVFFrMnliRzZ4RVV5NDFYdkd2REphTFNGTzVsR2RvZFhxcGxIaXhF?=
 =?utf-8?B?UUdTYmdQc2M0Yzk4K0U3UnJoZSs4VERibURwWlJ0V0s4UU5YVkt2Ti92OGVj?=
 =?utf-8?B?Q2d4ZWR5MWlESk1tK2JGY281TFpoSmRFWkRPdnhTeFJZNDFOcnB0c0QweVRG?=
 =?utf-8?B?Q1RwUU8weENsYkVubDJ2SG1mVnQ4TlB0QlIzcHRmTTJIc2s5K1lNTmlmbVN4?=
 =?utf-8?B?TTQyNnBMa3BuYnlhVVplVjRUUDhtVG45VEJwNDEzc3JLdDNOYkFIeEpWb01j?=
 =?utf-8?B?VVZPY1pTNUJxdStJZ3RnbStkanRJSHhNUmx4SE8zYThTVHNPRGxHSGFITUVw?=
 =?utf-8?B?MzBnbmNycWJ0VHRwZFZzU1B1d0xvcVBYcjljVEZxdmhseXRHNDlHay9rR2pX?=
 =?utf-8?B?VmVXVUZHNXVFSU9EQlNSUmFFUXpBVTFueWNiY3ZiOWdrNUFJN2Mxd0RaNG5T?=
 =?utf-8?B?Q1NpdEtQOE9jeHYzYmJHemlzWG4ySWVLYldkYkQwMUR0SldwbUhWNHFoWUs5?=
 =?utf-8?B?NmtJMnkzVXRWMHNhd1V1bTRFamJsanUycisyd2xyVUVMYUU5WWUvNk5YUjhL?=
 =?utf-8?B?VHZEWlFXVmtSRkJyUndUTkIxb0dxODFKQ3VTVE5RZ0NwT2Y1Z1JiRUV6Qk03?=
 =?utf-8?B?Q1grSGQyQWRjSG4rL2JqWU5UeVBpZGpqZUV4akV1eE1TVEtNbTZDMnRJOUFN?=
 =?utf-8?B?NnUrRjdYZzZ4VVZqRndhVmNpdm1yUWorQmdydjRZbGVwWXNNMUVrVXlOQ1lo?=
 =?utf-8?B?WkRTWkliWmsvSXhNQjBQVGMyVFE2M2kvY1ljSTBIQWtXbTZlRld3aUwreGpq?=
 =?utf-8?B?ZFd1cEJ5Z2JmT09qMWU1L05KS2pvYVN6QUE4WnNKQkpLRjl2cnpWWkZXVWZ5?=
 =?utf-8?B?eERDRHhLd2xTUEJoMDQ4RUNnY29XN1BmU20wZGVoTE1nUStidVdFQTlZYjZ6?=
 =?utf-8?B?UGN1Y3VZaHdkZTBxUERQVFh2dHhOdTV2dUFycnBTYVdoWTNwMjVZZXA1QUJr?=
 =?utf-8?B?M20zaHh2dVVVdENnTU4rZytzd2ZzaUxTK2Rub0JQb0NUbmg5elh6OGhoZlB5?=
 =?utf-8?B?M3cvZ0hoYmhsUk1rVG5SckdndHZtVmVrZUxOSnlaRUtzdFNDZWtNQnc1VHpq?=
 =?utf-8?B?YVN2TGZNYUJjNm1KRUltcmRobWxwTFd1NUJmRFFMczF1ai9UTWVpRVRGRXhK?=
 =?utf-8?B?UkNITnpvWVZLRkRnazVsYmkzYy9FdVA1QWxMc1JWbHlpemU5NGxRMUFyK3F5?=
 =?utf-8?B?cDFDOXNRWlRUVE9aK2Q3dm05djdzQjNGUFlwWGYzaEhKOHk3SEkvTU9FbDRN?=
 =?utf-8?B?TXROOS9FSjBmY0tRblphUUNSemk4dHpTSmc1RGw0a3RXUi9yUE5xTjFVb3VR?=
 =?utf-8?B?M2JpUlpON1VZcXU2Z3lkOFdXb1lOMWhQc3o3MWVRczRUSTRpWC81d1R6ck5w?=
 =?utf-8?B?cDVRa25XY29TUmswWHdubW8wNjN3dHFQUHlydDByeWFzM09maFhSeWJqNllz?=
 =?utf-8?B?cU1qY3dTTmk3V0M5MzNsOU1aYUJrTEdxMGI0Q25CaFdZWDVNd2c4M0I5M3dr?=
 =?utf-8?B?cDZHSDlKNHJzOSt2Yk9Yck1wTElFWjBuNkhXQXU5a2NVVW1JYVJOaTRrVHVT?=
 =?utf-8?B?MExBaVRMTnNjWDFaek81dXI3M3g2bnFMUElhQUFNSCt2cHF6cDhyNE5Ddkls?=
 =?utf-8?B?TmZWR28vN3BPOHZyMCtxVFpyLzZzS29nK3FYNTdwc2VGRUU4VkRhNkw5LzlJ?=
 =?utf-8?B?ZVJDbWVtTlFQOXAxMFo2QjVDaXhqZWZRZ2kxY0JqclRuNzhLY1JRbVVNV1Jt?=
 =?utf-8?B?d2VwS2MxREx4blBDejVPR1F0aHBWYy9KQUxtQ0h5T3IweTBQM3ppRDJNZWNt?=
 =?utf-8?B?TTBmNTZIOXdnNVVxK1dEYmtoRk91LytJNE5mMTdlRURiMmdKTnA1NFVjQTRv?=
 =?utf-8?B?Wmd6SGZxZ3F4TTU0d0VsZWVJTWN4WGZ2dENiUDQ4TTcvV0JQdzFzZ2VVcU1S?=
 =?utf-8?Q?KcSwUcySCXFbiKWEpdkYrZqyo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e50f1ff2-8a00-48bb-7480-08db1077d165
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 23:45:00.5484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rWfX54oRRUw+jq2Mmzi9RHpTcgbWmgjVC57DxnxPOQDGDzES6EIg6FRfT+DPe6ylDISWLx+yFKwtJyGmNKx4Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7955
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


On 2023-01-25 14:53, Jonathan Kim wrote:
> On GFX9.4.1, the implicit wait count instruction on s_barrier is
> disabled by default in the driver during normal operation for
> performance requirements.
>
> There is a hardware bug in GFX9.4.1 where if the implicit wait count
> instruction after an s_barrier instruction is disabled, any wave that
> hits an exception may step over the s_barrier when returning from the
> trap handler with the barrier logic having no ability to be
> aware of this, thereby causing other waves to wait at the barrier
> indefinitely resulting in a shader hang.  This bug has been corrected
> for GFX9.4.2 and onward.
>
> Since the debugger subscribes to hardware exceptions, in order to avoid
> this bug, the debugger must enable implicit wait count on s_barrier
> for a debug session and disable it on detach.
>
> In order to change this setting in the in the device global SQ_CONFIG
> register, the GFX pipeline must be idle.  GFX9.4.1 as a compute device
> will either dispatch work through the compute ring buffers used for
> image post processing or through the hardware scheduler by the KFD.
>
> Have the KGD suspend and drain the compute ring buffer, then suspend the
> hardware scheduler and block any future KFD process job requests before
> changing the implicit wait count setting.  Once set, resume all work.
>
> v2: remove flush on kfd suspend as that will be a general fix required
> outside of this patch series.
> comment on trap enable/disable ignored variables.
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   3 +
>   .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   | 118 +++++++++++++++++-
>   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c         |   4 +-
>   3 files changed, 122 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 872450a3a164..3c03e34c194c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1041,6 +1041,9 @@ struct amdgpu_device {
>   	struct pci_saved_state          *pci_state;
>   	pci_channel_state_t		pci_channel_state;
>   
> +	/* Track auto wait count on s_barrier settings */
> +	bool				barrier_has_auto_waitcnt;
> +
>   	struct amdgpu_reset_control     *reset_cntl;
>   	uint32_t                        ip_versions[MAX_HWIP][HWIP_MAX_INSTANCE];
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> index 4191af5a3f13..d5bb86ccd617 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> @@ -26,6 +26,7 @@
>   #include "amdgpu.h"
>   #include "amdgpu_amdkfd.h"
>   #include "amdgpu_amdkfd_arcturus.h"
> +#include "amdgpu_reset.h"
>   #include "sdma0/sdma0_4_2_2_offset.h"
>   #include "sdma0/sdma0_4_2_2_sh_mask.h"
>   #include "sdma1/sdma1_4_2_2_offset.h"
> @@ -48,6 +49,8 @@
>   #include "amdgpu_amdkfd_gfx_v9.h"
>   #include "gfxhub_v1_0.h"
>   #include "mmhub_v9_4.h"
> +#include "gc/gc_9_0_offset.h"
> +#include "gc/gc_9_0_sh_mask.h"
>   
>   #define HQD_N_REGS 56
>   #define DUMP_REG(addr) do {				\
> @@ -276,6 +279,117 @@ int kgd_arcturus_hqd_sdma_destroy(struct amdgpu_device *adev, void *mqd,
>   	return 0;
>   }
>   
> +/*
> + * Helper used to suspend/resume gfx pipe for image post process work to set
> + * barrier behaviour.
> + */
> +static int suspend_resume_compute_scheduler(struct amdgpu_device *adev, bool suspend)
> +{
> +	int i, r = 0;
> +
> +	for (i = 0; i < adev->gfx.num_compute_rings; i++) {
> +		struct amdgpu_ring *ring = &adev->gfx.compute_ring[i];
> +
> +		if (!(ring && ring->sched.thread))
> +			continue;
> +
> +		/* stop secheduler and drain ring. */
> +		if (suspend) {
> +			drm_sched_stop(&ring->sched, NULL);
> +			r = amdgpu_fence_wait_empty(ring);
> +			if (r)
> +				goto out;
> +		} else {
> +			drm_sched_start(&ring->sched, false);
> +		}
> +	}
> +
> +out:
> +	/* return on resume or failure to drain rings. */
> +	if (!suspend || r)
> +		return r;
> +
> +	return amdgpu_device_ip_wait_for_idle(adev, GC_HWIP);
> +}
> +
> +static void set_barrier_auto_waitcnt(struct amdgpu_device *adev, bool enable_waitcnt)
> +{
> +	uint32_t data;
> +
> +	WRITE_ONCE(adev->barrier_has_auto_waitcnt, enable_waitcnt);
> +
> +	if (!down_read_trylock(&adev->reset_domain->sem))
> +		return;
> +
> +	amdgpu_amdkfd_suspend(adev, false);
> +
> +	if (suspend_resume_compute_scheduler(adev, true))
> +		goto out;
> +
> +	data = RREG32(SOC15_REG_OFFSET(GC, 0, mmSQ_CONFIG));
> +	data = REG_SET_FIELD(data, SQ_CONFIG, DISABLE_BARRIER_WAITCNT,
> +						enable_waitcnt ? 0 : 1);

This could be ..., !enable_waitcnt);


> +	WREG32(SOC15_REG_OFFSET(GC, 0, mmSQ_CONFIG), data);
> +
> +out:
> +	suspend_resume_compute_scheduler(adev, false);
> +
> +	amdgpu_amdkfd_resume(adev, false);
> +
> +	up_read(&adev->reset_domain->sem);
> +}
> +
> +/**

Use /* here, since this is not a doc comment.


> + * restore_dbg_reisters is ignored here but is a general interface requirement

Typo: registers


> + * for devices that support GFXOFF and where the RLC save/restore list
> + * does not support hw registers for debugging i.e. the driver has to manually
> + * initialize the debug mode registers after it has disabled GFX off during the
> + * debug session.
> + */
> +static uint32_t kgd_arcturus_enable_debug_trap(struct amdgpu_device *adev,
> +				bool restore_dbg_registers,
> +				uint32_t vmid)
> +{
> +	mutex_lock(&adev->grbm_idx_mutex);
> +
> +	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, true);
> +
> +	set_barrier_auto_waitcnt(adev, true);
> +
> +	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), 0);
> +
> +	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, false);
> +
> +	mutex_unlock(&adev->grbm_idx_mutex);
> +
> +	return 0;
> +}
> +
> +/**

/*


> + * keep_trap_enabled is ignored here but is a general interface requirement
> + * for devices that support multi-process debugging where the performance
> + * overhead from trap temporary setup needs to be bypassed when the debug
> + * session has ended.
> + */
> +static uint32_t kgd_arcturus_disable_debug_trap(struct amdgpu_device *adev,
> +					bool keep_trap_enabled,
> +					uint32_t vmid)
> +{
> +
> +	mutex_lock(&adev->grbm_idx_mutex);
> +
> +	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, true);
> +
> +	set_barrier_auto_waitcnt(adev, false);
> +
> +	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), 0);
> +
> +	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, false);
> +
> +	mutex_unlock(&adev->grbm_idx_mutex);
> +
> +	return 0;
> +}
>   const struct kfd2kgd_calls arcturus_kfd2kgd = {
>   	.program_sh_mem_settings = kgd_gfx_v9_program_sh_mem_settings,
>   	.set_pasid_vmid_mapping = kgd_gfx_v9_set_pasid_vmid_mapping,
> @@ -294,6 +408,8 @@ const struct kfd2kgd_calls arcturus_kfd2kgd = {
>   				kgd_gfx_v9_get_atc_vmid_pasid_mapping_info,
>   	.set_vm_context_page_table_base =
>   				kgd_gfx_v9_set_vm_context_page_table_base,
> +	.enable_debug_trap = kgd_arcturus_enable_debug_trap,
> +	.disable_debug_trap = kgd_arcturus_disable_debug_trap,
>   	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
> -	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings
> +	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings,
>   };
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> index 222fe87161b7..56d25a6f1da9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> @@ -2376,8 +2376,8 @@ static void gfx_v9_0_init_sq_config(struct amdgpu_device *adev)
>   	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(9, 4, 1):
>   		tmp = RREG32_SOC15(GC, 0, mmSQ_CONFIG);
> -		tmp = REG_SET_FIELD(tmp, SQ_CONFIG,
> -					DISABLE_BARRIER_WAITCNT, 1);
> +		tmp = REG_SET_FIELD(tmp, SQ_CONFIG, DISABLE_BARRIER_WAITCNT,
> +				READ_ONCE(adev->barrier_has_auto_waitcnt) ? 0 : 1);

This could be ..., !READ_ONCE(adev->barrier_has_auto_waitcnt));

With those nit-picks fixed, the patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


>   		WREG32_SOC15(GC, 0, mmSQ_CONFIG, tmp);
>   		break;
>   	default:
