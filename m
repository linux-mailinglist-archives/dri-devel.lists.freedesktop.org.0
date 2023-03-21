Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 302746C285F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 03:56:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D93510E0D0;
	Tue, 21 Mar 2023 02:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A86010E0D0;
 Tue, 21 Mar 2023 02:56:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRSZshCr2RcDnW9fGnJzp/XQgLrhv8iFT0i334gfbw8KIdjoy6F+nWWLMm/cnnfqsZRhA7wEmMjLWcut0yT/G2ZHV2fRzqyS9+KxL4+WkxhjpuigK+f3a7Owyo+PjDwgbnCXXCP+2zH1maObs8ejHB0fIlGfS+5k6C0+4vtFHlAuDY9833PMX7kT2Wgg7Oj9S4Ty41mnxl+l+PLbBIFqG1PSXA0gIACkLjZObdihj3OnYODgMjvH3jKuOJdGUaBafqTYVKNmm8ty73dbu6O/Q6XaszkUZ71vvlgHHZnaFYskKNN6CE40IL0AYky+qFXvSwkL9s+M8TLnVKaZIqWAPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aF+HTQ8gds3JND65WXm8Y2ksv6y+4cVCg0/DUiH++sA=;
 b=XC91R9OgZeIMPuIg31ahEHIm0+oC48NNcKfh3R0ioaj0/PGmkrHIlGLW0eUpoBlWku03ueH90the1yJhxC+ABCx7EPww4V1Olv6kHep7GR6X3K1LgKhjrptx0Yo/kx5UPuTggnsyjmF6J4j73DG7mTjQOv0qwYh2foZjKK8KrnCPofZ1VyK02LoBCbNAdQDSnUkyDRmqSUuvBhBaalJjyH8XFEQDK3Q6dUgII8LbJW2DVATO5h+eldpnvqt2OA30hDjQFrMmDr9VE0/+TphxaLLNA0WSKID7NTOLglF3STbCGwBn8MW5gKQKBGdAIzSnqKG8kiQzKbkV5RMcvyw63Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aF+HTQ8gds3JND65WXm8Y2ksv6y+4cVCg0/DUiH++sA=;
 b=jixEA8vKn67Gyg4e0vJxvrOCDz1riJBfsZwtGrepc/GvklrlhwcRNpnOJWc0OZo6QW+GoLynLeo1VOPYXdCPHZkfzn9xSDrQ3DWo8WJoRWzKzjITRefUPap8iR6JjnRdbUW6e3oS5sVMR7GwM4V5zebWtqa0A3q8gTfTAQHYrkI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 CY8PR12MB7217.namprd12.prod.outlook.com (2603:10b6:930:5b::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Tue, 21 Mar 2023 02:55:58 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::e43d:5bd2:7a85:d0cf]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::e43d:5bd2:7a85:d0cf%7]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 02:55:58 +0000
Message-ID: <97416541-5051-932d-c364-a7c602d54aae@amd.com>
Date: Mon, 20 Mar 2023 22:55:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 23/23] drm/sched: Add (optional) fence signaling
 annotation
Content-Language: en-CA
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230320144356.803762-1-robdclark@gmail.com>
 <20230320144356.803762-24-robdclark@gmail.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20230320144356.803762-24-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0016.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d4::29) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|CY8PR12MB7217:EE_
X-MS-Office365-Filtering-Correlation-Id: e90e4582-7dfb-4b2c-9ca7-08db29b7cc19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KZTaPI/2EcpdnMBcy7cALnvZMX5x5ho0sv4iAS1cp2EzzjYue+itKMc0EZmgvXxTJuvNqqDfnEoXD6izTIJCBoXULM+uIEBEMr8nJYJC4TqMIRNF4R5J62jhCay5+Y8NSNLgeiIyRCXv8hgFwdX+EWzRQd8pocHpPC05h98jM/gNO1HCOS5QKjICXO574kWhDwGKEy6ZUfOPxMArI2XNmShAAxDR0xd56EBUgJtTc++bMMMv8LxOXvwInow3/Ithi3TFt9mPozsDeFB4G2RoGiqzFwJbAiJtjM9ElpORKaaIVI5PgqK9KX+jKiQhQNEQhDgmreB46FVDGoIn/6eC78d9fnHNyYLjRFSv2vt83nJRh3C1kLBtkUfN0LLX/NCRuV0U/smPCaHULN2EGzK9k74ZTZLISeeJ0EB/rfqtYwhXJ6WpuE1BRIORy7fmfE3SWPWf5qJmXLJ5JWQYhk18nlKQuMAAuyg7MrKgtiCxwbEBgYcWpByXDg01fUV/VmxSodDBEVRiQk1rKcGdLTtVeLBtFduIAnqqcrLj5a/C77t31lF4fc0r8DK/IFEnwZgC6+HgSfwmoE1Y/RmNMJg0AEg++NBIcfs8V/tgUPFHOQUNeUumJaas+8DdQ+4DVkkMd9My+6fN0z3VEjJAa3k6/iruT5IKFwb5ASiCYDQxDf3xyGtfkQ/IwuDH0sgARaJ7grhx+aV0Un0izxgxlCNzcgUp54iLPRjMqh7WsMaA2Xw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(451199018)(966005)(6486002)(44832011)(38100700002)(31686004)(478600001)(7416002)(5660300002)(54906003)(316002)(86362001)(31696002)(83380400001)(66556008)(4326008)(66946007)(8676002)(2616005)(6666004)(66476007)(36756003)(8936002)(53546011)(55236004)(41300700001)(186003)(2906002)(26005)(6506007)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHlwL1dPNWRsSUVHNVlod3hhUXNZS3ZXVFpIN3VmVTJjVTBrbXA3aG5xMjls?=
 =?utf-8?B?MEhVKzVCcHg3amI4bHFCRDY0bS9YMXplL0x2RWpmdTZvRWZlbjdQbk9yd2Jh?=
 =?utf-8?B?MUVLNWNFL1VUQUxXdnJqbnY3ZEdHYW5LRmhkRHhuek9aQVNZcG00bTBQcjdE?=
 =?utf-8?B?YWdxbUp2aUdMdVNCbk5DVGdFcXRzZTcyVE9wTDdZcVdXTnNCemlrU3RleFdZ?=
 =?utf-8?B?alRKVXhHamtEd0ZlMWtuaWFSeEpIWDkvZm1PNk81YXRqOS8zVDBUY1VGMDJO?=
 =?utf-8?B?VWw5YWpFL1N3NU1kRkJabzJjZjQ1RmR5TWorSXkwaGZnWUl0RXZ2OVpMemFx?=
 =?utf-8?B?VFpvVmdFekQ0aS9XVWdpbVBvNDNCaHgxaG5KNzl5RTZXVHZlakZ1T1dtUG5y?=
 =?utf-8?B?U0Q5V3Q0ME90ZjFxMHEyekpDVFF1NjJFR0VCRmE4a1BHOHZTWVFYUjZtQUFx?=
 =?utf-8?B?UU14L1dWTFlBL2tZbXM5bHlsY0lIR1hQWVZqUWIxUW9OYitDL2ZNVHQwcXBT?=
 =?utf-8?B?aWowdHJKUGlDRUJRdG9jbE50M2piOWFkMlUyUlZ5Q3hIcGNuUU5Ha1VsNE90?=
 =?utf-8?B?U0ZGamNhSVNFeDRTQWx0dFhGNnJaNG9nSk12OEpmdDQ2eUVLSUxqcm5FL1RG?=
 =?utf-8?B?NXM5VndHbnZqWEhtOC9va2srSkFjTDJBb3dwNUxZRUh0aE1QYlZQRXZqNUM5?=
 =?utf-8?B?R1BjOGFVOEFsbiszUEJuczBGZExZdVRsTjYzOUovbnZ2SElNOFV4SVNobUxx?=
 =?utf-8?B?djgraTR0Y3ZpL1lDN0p0NVErekgxMHJFbmtiaUhJdlNXUDBjSFBrcjVtbFIv?=
 =?utf-8?B?SUZLcVRKNWgwR25xaThrMTFtbFl4TnQ2Z2tpTU5Fa1ZWaTZNS05KMTdNeEE1?=
 =?utf-8?B?U0RGekZ2c3lPblZ5MkF3aUdWbys5dklhN1ltenV4RzViSE93N1NWRUQ3R2xS?=
 =?utf-8?B?ZVc2eWdzZkd2TjdnU0Fha2JXU0hKVlpiVXlzQngrcmNjT2F6SzRlVk1HWCtl?=
 =?utf-8?B?MGlhVUhXVVU3d3pUd2ljSUdNUXNyM1dKbmNpWXhyTXdJMkhGNGs1Y2RVL1FO?=
 =?utf-8?B?Y2p3WW5UdEtPYTljdWRmTUpkQ2JBRkpzd1d2WnBxNW44UVQ0cW12VVl3aCtq?=
 =?utf-8?B?akprSEQ5b2d4MVlNUEFXV0RnazZjeDdTZFpvRFBOb09rU0pTRmRvUTRWdTBP?=
 =?utf-8?B?Z1g1VW9PZEl4WnpJekQ5d29DdDB3aWx0Z21kREZWNzZEZ210cDM5OWVIUTlz?=
 =?utf-8?B?QkhPc080VzIySHdJVGNVOHJNalYvaXI0ZVhKTW5mMzZ5S1VDWFlXR1BYWFNy?=
 =?utf-8?B?U3h4WUI3eFZ1NWxwa20vWkpwTDBDMWw4Nml3STJHUEtRZmg1YjBmREVRR3Z6?=
 =?utf-8?B?Sm5xL01NbnBhd1A0RkxuYnZMZTFqeERta0RIQ3BKWHh1T2VrdHFNSEFTemxm?=
 =?utf-8?B?L0hEQkt3TFN3TTdQWjE5bndOV3NtVkV3Q0ljQlFmSlkzc3pqdzJtMUsrNkhD?=
 =?utf-8?B?OXlPRlN5V2pCZFpVV1VCWDR5a2ZsUFV3bHRIeHJJM3NCOURNdXE0bXF5bjdO?=
 =?utf-8?B?d1lDVXZEeWVZdExtQzBVRjlZNlA1cnhZd3VXS0VneU14ejU3aGp2UGczL0lu?=
 =?utf-8?B?cmhqa3NXZnRlQlo5QU8zSm9Oc1VmWE5hdHZkRkl3bWpqSmhJdjJhZDMydDhK?=
 =?utf-8?B?TDhmc3JyQnNlK3pJVjNrL0d0SENSNVljR052cm5oSEtKbkNWNVZOOXNDQkZB?=
 =?utf-8?B?dnZ4LzBvRUJFSkZ1c2gyUzRpNnNhR0VuZitVYjRZNk5talloRk1wQTN6bnhG?=
 =?utf-8?B?TkVLdkwrbTRYUW5KRjluaWYwSmJYZkJNS2MrakdyZWh2Ny8zOE5aNDc4VW5X?=
 =?utf-8?B?K0Eyc2JHV09DM1JLOG5sUEdRKzVpb05kT3AxL2NwVFJweVkzNkd1S1NDTzJa?=
 =?utf-8?B?djFlRXA3SW81OGVZWkhKaTZkQXZqY1FVN0hDZjh2VGNqc3RHWGgwUnY5M3RG?=
 =?utf-8?B?elVqSTdQaTZIOGdBQUdTbW8yS21IYVpKdVV2TDN3eGFKU3cwNGtRSWNWV0hH?=
 =?utf-8?B?Mnllc2VMbUhjcG9JaDVvbkplR3FQNUtBNG1MZnFkczloMm93aDNjbGM1NktP?=
 =?utf-8?Q?fTRJAdpTcnACZOsTBG03cKJ4a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e90e4582-7dfb-4b2c-9ca7-08db29b7cc19
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 02:55:58.5072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zd9Y+6ZwY3jEgb7rEu8K0MVXfIyrVrFTJROdCVxbxt7MMaftoj52TmJg3uMg2jPH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7217
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is good. Hopefully it helps us catch lockdep bugs.

Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>

Regards,
Luben

On 2023-03-20 10:43, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Based on
> https://lore.kernel.org/dri-devel/20200604081224.863494-10-daniel.vetter@ffwll.ch/
> but made to be optional.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_ringbuffer.c   | 1 +
>  drivers/gpu/drm/scheduler/sched_main.c | 9 +++++++++
>  include/drm/gpu_scheduler.h            | 2 ++
>  3 files changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> index b60199184409..7e42baf16cd0 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -93,6 +93,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>  	 /* currently managing hangcheck ourselves: */
>  	sched_timeout = MAX_SCHEDULE_TIMEOUT;
>  
> +	ring->sched.fence_signaling = true;
>  	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
>  			num_hw_submissions, 0, sched_timeout,
>  			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 4e6ad6e122bc..c2ee44d6224b 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -978,10 +978,15 @@ static bool drm_sched_blocked(struct drm_gpu_scheduler *sched)
>  static int drm_sched_main(void *param)
>  {
>  	struct drm_gpu_scheduler *sched = (struct drm_gpu_scheduler *)param;
> +	const bool fence_signaling = sched->fence_signaling;
> +	bool fence_cookie;
>  	int r;
>  
>  	sched_set_fifo_low(current);
>  
> +	if (fence_signaling)
> +		fence_cookie = dma_fence_begin_signalling();
> +
>  	while (!kthread_should_stop()) {
>  		struct drm_sched_entity *entity = NULL;
>  		struct drm_sched_fence *s_fence;
> @@ -1039,6 +1044,10 @@ static int drm_sched_main(void *param)
>  
>  		wake_up(&sched->job_scheduled);
>  	}
> +
> +	if (fence_signaling)
> +		dma_fence_end_signalling(fence_cookie);
> +
>  	return 0;
>  }
>  
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 9db9e5e504ee..8f23ea522e22 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -483,6 +483,7 @@ struct drm_sched_backend_ops {
>   * @ready: marks if the underlying HW is ready to work
>   * @free_guilty: A hit to time out handler to free the guilty job.
>   * @dev: system &struct device
> + * @fence_signaling: Opt in to fence signaling annotations
>   *
>   * One scheduler is implemented for each hardware ring.
>   */
> @@ -507,6 +508,7 @@ struct drm_gpu_scheduler {
>  	bool				ready;
>  	bool				free_guilty;
>  	struct device			*dev;
> +	bool 				fence_signaling;
>  };
>  
>  int drm_sched_init(struct drm_gpu_scheduler *sched,

