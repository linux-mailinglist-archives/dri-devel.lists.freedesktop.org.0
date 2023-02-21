Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 426BD69E875
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 20:40:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B5410E34D;
	Tue, 21 Feb 2023 19:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D5410E187;
 Tue, 21 Feb 2023 19:40:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwdvHTmJKX5JbLkIXhDNsHbTdrHyeDdBkT8c/Mhnlgijgl4zLtGAKyhBKI++49fpSVdrIdeiyClwvzuRgWnNYLC95jBfv9l8c2icSr/dmYQyZBFu27NbZxEw7JXvzzlvh12KQ7vB/AwztVBQ8HSYfwFWhrsK8epW8inbztGh12exqq1+hhXr20HL8h34m2k8W7VYIuWuzjmD4wEnigbASjKOBmQ27qPmUcCgzuz/f1p4CZpxnT5Jk/DoEzxi6h0N8mV2YRn+M7nLkgw2qprifrfqF0FJGokVoHV9hVh3m7u22aT5nYOWI83QvTmm+GI2OnhjZqLZmCENlxkTxEvWFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xp+gxamV+PWsFQh/1Bw1ioRLDwnPxBqbFOy78zM2XY=;
 b=cxEhYahqPAF0VPCWu7Jm91XH2gdrONlSnfvlHAMc6pY4GNJRnLIAgqe7qVR2oL18+FHUIEgH1QllJXszUq8AzamAIVVeOh+bgcVogHXG5UdDr8uWorIvnzIAdcZrWE5P2pp5rBBF7s4DhpJoPjkwcblGZkOJAilJGLUAtECqIhjiwsvWxmZok5HqxUH+gFv+ET7bAyP3W+PXTYgS1/eS4gkDbOnKpw1ck4WL5h2htHXoZGremvezZf7tcAAww9tOiIop/b5H+BFUG3xusQKXxfbsEkNn1PhdrHwIE96h019BdYBSfcLwc5Xb46c6Xguk+SI2YAyTy87vOVXN304Z4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xp+gxamV+PWsFQh/1Bw1ioRLDwnPxBqbFOy78zM2XY=;
 b=mzlHx225/FzZw1yTFrKXGNd4Qlwsyv3Z44pgoMSjyLAXcvR9f4ahafnuplPlehfzBogjgELbSfBLDjHxWVBHRXt0yrhgpn+utylQXCovYpZ3YFRrvThdJf7sh0uSMhAqpe67TvgNDfUyDk4B798zK1YtvxS76fWnqKo4a4MupWA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DM6PR12MB4436.namprd12.prod.outlook.com (2603:10b6:5:2a3::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.21; Tue, 21 Feb 2023 19:40:02 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 19:40:02 +0000
Message-ID: <1da7a010-eb22-0044-b68a-44ffd76dc471@amd.com>
Date: Tue, 21 Feb 2023 14:40:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-CA
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-9-robdclark@gmail.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v4 08/14] drm/scheduler: Add fence deadline support
In-Reply-To: <20230218211608.1630586-9-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0090.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::23) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DM6PR12MB4436:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dcf29d6-ad4b-49d8-a5d9-08db14436cc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: za94yaP9jRmjzOBxSx5Pppt3dGNWThxcjeuZonqJ2sr5npQoIv+qE0nmzxmiGwzS6Onjfk3ETV7Wrp3jM9hEztXo8fFDK6d5k5yBTRRlCUIslGwDCXhH14Fku740WK9DX2SXRXv5DtpBYNMhLRmSfrLakVLLAqtCjyvuDjv9m0sbfFHobxjlcQbUa4cxBIVWNc2dV2mNU1kp0jdNiZz5Am+Z5TZ00YE4ku3adRM0x9nDUgsy9Dfbf4ZqMTHLf6mkxkAE/RNRq3Av3z7RpU5hOwbIVZ48vhqtBvaA1lo34WpG011nvAo4E4A3N3feKJRGVCvnCO4rn7TQjD0R7J6RuhdUl2rpfxJ7SXZRtlYTGzTG5utmo9Qo91Zy4VlULUG903lxv9VEqblzEX+nYWrdqKhAAmi+7+Pu084n4icMPKEsfQEAMI1MwSHn+42Blq62WcnYaOJdVobjWgotdtgck81YlZRt+uIqwHYSGybbaOkpVlGCUY6OP2l2n3KrJCkTvEGqHx7J5osxHTwyK0SBszVRxyp2XFa4RnRmQ3e37vkFHvPXJZvH33ysyCrLqNmHGdbMZ6nmmz+gJDsK7BFDCyefJJAFRYClx2MBEZPNTRH0KaIUeEJz7fDn3TskNLd5gWr6nGJ0lRQL1vsmRbEGc06arIZjKycGuKfzk3snizeKatv61/mw08bG6xBUNDDH33q+kEn+gBMQUtLNZ/oMElET8X+1vj4wf1QuUPnLvlY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199018)(31686004)(8936002)(31696002)(36756003)(86362001)(41300700001)(5660300002)(44832011)(7416002)(2906002)(83380400001)(38100700002)(66946007)(66556008)(66476007)(478600001)(8676002)(6486002)(54906003)(316002)(26005)(55236004)(53546011)(186003)(6512007)(2616005)(4326008)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0tVU3MvWEpZVHFYb05TZ3pqRVAraWE4R0tPNWt2RGdZdHhhQlRRWGVFTFFP?=
 =?utf-8?B?VHJNdnN5cWMxTlZIanlJdUJ1dTl3bWlUMXpTZGV1cUJGTk5aUlRlbngrNUQ0?=
 =?utf-8?B?V3Q0MU12eVhJdkYybFI1SFUvVU04aGhGSzJXQmRQcUptNGNrQS9OQW9zbWJr?=
 =?utf-8?B?TE9IZWFaby9ESVIremVJenkrUWlNbnJ4TStUSnVBdFNGMkl3ZkJSa05TWERz?=
 =?utf-8?B?Q3phOE9Fb3pmM1FRTTBMdE81Tm5DbVVpYXpnSElRR3ZMMFlKdEpSM1FFTlVj?=
 =?utf-8?B?bGVjRmZpdFM0dkRzYlNOVW5uaWV4UzB2UVNIdzFIRVppMmRxZElJdjB0VUdh?=
 =?utf-8?B?UXlTSkRWeGRKRngxTVQ1UmVMaTFvYkFqdGFZWmdYaGpTbzh6REpBbFUwWUEr?=
 =?utf-8?B?MEZWbWw0SHl0d09XaXppenBIS2hHNE1MeXExN3Y0SHJNK0tPYXdhMGRMT1BJ?=
 =?utf-8?B?czFJb2lkK3QzUGRybWZSajEwS25OUmYycGEyc29hMW9yOFUwT3BOc25UV0xo?=
 =?utf-8?B?KytCSXJSRWxrMDAveExyTEJkTmFpVTBSeDVYNDE0WUxOdnFwc2RVdkpPUjlS?=
 =?utf-8?B?WEl6OFdnK25IRFlaMFYxS20zVCsyNkRRTGppQUJiRCtsTUM2R0RUdE1BbG9X?=
 =?utf-8?B?R0VRdEQwSWJSYVVRRU0xcnRFK3Q5QmtScG9oR2t2M0JIelVaOXlxRVBuRUoy?=
 =?utf-8?B?TkJpTG8zcVBSRW02MzRnOHcvS2RYT3grR1FoT0lEVzRyQlgrMmVzWkNjSTJ4?=
 =?utf-8?B?dnFtYWZQalhDZW9QZlNOTHcyeHJQa3ZQa08venZGVU1lcWM3OUNnNjNNWmgw?=
 =?utf-8?B?bWVid0V2RFByc0s1Nko5VGRFTGJFY3lwVnZWdU1Wbno2cTJCamZ2VFJkSWds?=
 =?utf-8?B?K2xwVFRPWktQNmFTZks0T1llc3lQQzRKZlJENk1kM2pYVXJvR2VnNTVJRklk?=
 =?utf-8?B?dmZTM1FqcG1FcmxFdkJ0TGs2OHk2aUZFVElBL25kc0VYamcxSEdTT25iQmtz?=
 =?utf-8?B?Qm1iTmFlWHl2eVpCaDBPUHMyUmVteWJLQ3pOMTc0UXBxbUpSM1cwczUySXVi?=
 =?utf-8?B?YlFCeW51WHp1YS9hK0FDY0xXS3Q0K0VENUFkeDA4Ly8zRlBBVDlqWmtjdS9s?=
 =?utf-8?B?NGNJa1VsdElvdDdTMER6bVV4UXpMWkw3YnI5eTU1QVorRXlKVXFlZGFtQUx0?=
 =?utf-8?B?YWI4NVp1U2IrM0NObG8xSnhkTnZxS3hJZ2pIdDJYOHpGOEJtdEE4REcvMTYr?=
 =?utf-8?B?Y1JBVy9TcnF6V29uTjdqMUlPbHNqeWxjSy9nNDN3VWlqSTYxZkp3S21wY0xp?=
 =?utf-8?B?bkduQTkvT0pIdndmMU9zUWhpTmEyZWZhUmNpSjQ2SnYycS9CTU9DUFRRbjNk?=
 =?utf-8?B?dTc2UHJ6dUF4MFdweWp6RWd1Ky9zREtGTzcrRWpSZWVzWENCRW1FZjN5aDRP?=
 =?utf-8?B?azYvQzQxelNzS2sxV1RqNUJtVGNZaWZqdFJRbFRzYURaUE80N1hNR0Q1a2Z2?=
 =?utf-8?B?M2pqWHhBaWxHNVgzWUtrNVNub1VCZ3VWV1ZTWlh0czNCZENVYlV2QmpBZW5H?=
 =?utf-8?B?RHZWQVNkN3h5dWlHSFVTaGxwaXJyd3JVRS9PbWtIdnc1V2FnVDJ6YUNpYUR3?=
 =?utf-8?B?ODJJZCtWVmZUTkZhVy9XdXRCbnNnTUtwbmUvMDJuQ1hkTEwzdDhJbEh4WnZT?=
 =?utf-8?B?YkhvY0d6QUtJZkJnVUdwRmUvbFZXbVdTS0Z1YU5ZWkpTZStkNHk1a0NyKzd3?=
 =?utf-8?B?QWozb055QU9KblpCclVCZ2luZ3JhNTM2MGxVVkoraDhVQjJIeERQbm1oY2dF?=
 =?utf-8?B?NDJMRXB4WG9hSk1WYnRiak1yTWxwbmd4RTZDTkRKQ0FwRWNGSXh1NlJlREM0?=
 =?utf-8?B?Vk9mWGdaWEZQMlIvQ1I3NkdqOTU4em9yTVRTL0dvby9PRmgza096NVF5cGtQ?=
 =?utf-8?B?VHJrZC8yK2JkSWJUcUh0VkVrc2RENzAwRFZwVzlaSjNFcm9wa3E2YnlaSFkz?=
 =?utf-8?B?dE43UjBRVFlBeEMzZkxBbXRoS1d3Q3NTbUJVcDdhbFd4ZGpWb1BoQzZDZGNj?=
 =?utf-8?B?VmtGaGVybkQ4UlBYcEJ2K0ZCRTRsVGUrUUI3ck9qdzVJK3BVaTJqTjRhNk8z?=
 =?utf-8?Q?eJUPXnmemCAW45gsZ1NZTrfKe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dcf29d6-ad4b-49d8-a5d9-08db14436cc2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 19:40:02.5148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+2/yJ+fN3SNWmkii9gfmSXnUyIRe/CjyeHugHrKqp2cUtbTDBLixBhxf4ARD1gN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4436
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-02-18 16:15, Rob Clark wrote:
> As the finished fence is the one that is exposed to userspace, and
> therefore the one that other operations, like atomic update, would
> block on, we need to propagate the deadline from from the finished
> fence to the actual hw fence.
> 
> v2: Split into drm_sched_fence_set_parent() (ckoenig)
> v3: Ensure a thread calling drm_sched_fence_set_deadline_finished() sees
>     fence->parent set before drm_sched_fence_set_parent() does this
>     test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT).
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Looks good.

This patch is Acked-by: Luben Tuikov <luben.tuikov@amd.com>
-- 
Regards,
Luben

> ---
>  drivers/gpu/drm/scheduler/sched_fence.c | 46 +++++++++++++++++++++++++
>  drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
>  include/drm/gpu_scheduler.h             |  8 +++++
>  3 files changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index 7fd869520ef2..43e2d4f5fe3b 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -123,6 +123,37 @@ static void drm_sched_fence_release_finished(struct dma_fence *f)
>  	dma_fence_put(&fence->scheduled);
>  }
>  
> +static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
> +						  ktime_t deadline)
> +{
> +	struct drm_sched_fence *fence = to_drm_sched_fence(f);
> +	struct dma_fence *parent;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&fence->lock, flags);
> +
> +	/* If we already have an earlier deadline, keep it: */
> +	if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
> +	    ktime_before(fence->deadline, deadline)) {
> +		spin_unlock_irqrestore(&fence->lock, flags);
> +		return;
> +	}
> +
> +	fence->deadline = deadline;
> +	set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
> +
> +	spin_unlock_irqrestore(&fence->lock, flags);
> +
> +	/*
> +	 * smp_load_aquire() to ensure that if we are racing another
> +	 * thread calling drm_sched_fence_set_parent(), that we see
> +	 * the parent set before it calls test_bit(HAS_DEADLINE_BIT)
> +	 */
> +	parent = smp_load_acquire(&fence->parent);
> +	if (parent)
> +		dma_fence_set_deadline(parent, deadline);
> +}
> +
>  static const struct dma_fence_ops drm_sched_fence_ops_scheduled = {
>  	.get_driver_name = drm_sched_fence_get_driver_name,
>  	.get_timeline_name = drm_sched_fence_get_timeline_name,
> @@ -133,6 +164,7 @@ static const struct dma_fence_ops drm_sched_fence_ops_finished = {
>  	.get_driver_name = drm_sched_fence_get_driver_name,
>  	.get_timeline_name = drm_sched_fence_get_timeline_name,
>  	.release = drm_sched_fence_release_finished,
> +	.set_deadline = drm_sched_fence_set_deadline_finished,
>  };
>  
>  struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
> @@ -147,6 +179,20 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
>  }
>  EXPORT_SYMBOL(to_drm_sched_fence);
>  
> +void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
> +				struct dma_fence *fence)
> +{
> +	/*
> +	 * smp_store_release() to ensure another thread racing us
> +	 * in drm_sched_fence_set_deadline_finished() sees the
> +	 * fence's parent set before test_bit()
> +	 */
> +	smp_store_release(&s_fence->parent, dma_fence_get(fence));
> +	if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
> +		     &s_fence->finished.flags))
> +		dma_fence_set_deadline(fence, s_fence->deadline);
> +}
> +
>  struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>  					      void *owner)
>  {
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 4e6ad6e122bc..007f98c48f8d 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1019,7 +1019,7 @@ static int drm_sched_main(void *param)
>  		drm_sched_fence_scheduled(s_fence);
>  
>  		if (!IS_ERR_OR_NULL(fence)) {
> -			s_fence->parent = dma_fence_get(fence);
> +			drm_sched_fence_set_parent(s_fence, fence);
>  			/* Drop for original kref_init of the fence */
>  			dma_fence_put(fence);
>  
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 9db9e5e504ee..8b31a954a44d 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -280,6 +280,12 @@ struct drm_sched_fence {
>           */
>  	struct dma_fence		finished;
>  
> +	/**
> +	 * @deadline: deadline set on &drm_sched_fence.finished which
> +	 * potentially needs to be propagated to &drm_sched_fence.parent
> +	 */
> +	ktime_t				deadline;
> +
>          /**
>           * @parent: the fence returned by &drm_sched_backend_ops.run_job
>           * when scheduling the job on hardware. We signal the
> @@ -568,6 +574,8 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>  				   enum drm_sched_priority priority);
>  bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
>  
> +void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
> +				struct dma_fence *fence);
>  struct drm_sched_fence *drm_sched_fence_alloc(
>  	struct drm_sched_entity *s_entity, void *owner);
>  void drm_sched_fence_init(struct drm_sched_fence *fence,

