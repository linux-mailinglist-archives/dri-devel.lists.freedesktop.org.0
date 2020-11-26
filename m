Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA3B2C57D8
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 16:06:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFFF6E967;
	Thu, 26 Nov 2020 15:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AFF6E955;
 Thu, 26 Nov 2020 15:06:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJkoCxCcjcZcYVAqsqOtUdNTxokNDpnsbNJRytJ6XINshsis+AFS52G/WpZKOTLv2ZH2tVelypHe6XyYI3Z3NpA03j2YZyMe0rnRNg0kHQ29aboj2w2oyI3YImfoj8qMftRRpB9TrYBtkqs5pgTTQEXk1bV1hgU/4HA7tGYHmw05EJgiX/j1RmlUEC6A5TZkUSE88Rr2VR9k9FgBJhK54LtzAbGRFreH70i7ArdNxRDm3VKCY1hqOgLyOuvL7OqqA6lPRUhoNZS7NG48MlrVFptjvfrbGzGh0eg22VqnX9LOV7UAgykYxdfGOsukQeew+miz98XpIG08Tp/XX1N3EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTLyE3mVXGXaf6FTBrOd9k1KbdtRKshb2EVma+DInT0=;
 b=GHr5i3aHldIfZuAINLLbDDI6JfG4AP5kjIueieBykSrQXQ8QzwY9xyGOgUECiEyNwCL4CTgv8kFWOzypoJTj94rG/qbvAXRNp55cvP1sq6sGFKftKMcgIId//TeTvOM19c5G0ucVmDQYx39z+/3bI848WB1qDv0H2WD55n06pl8/By50gVr900iREGZANYBQ3rGlqyBECpFqN54BbszgOzOlcg8FG8J2E9t5+uqvHPqyreYe8Xqt2G9GTyxmRZcf0fOkC2o+MFCWH2tezIZQxJN75X+7Yla9bBrZ9wNz8nMHXasThXwWelmG+PIjn/+kwYJgmA6LfNw6I1XcYsPP4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTLyE3mVXGXaf6FTBrOd9k1KbdtRKshb2EVma+DInT0=;
 b=lkaeWRPMx9YktA0txLFkoIMPcbJ2MQ9sRTG2QjLTfC6jtPJl/ECezLjpjk1Q3bZvgeTdsiPcQuYRuVk/XM4S6/WaJgPP9qPhpFQLsgQhr0CH8bD7vHpPHEykP1JKB1LsGFc60LXd1AZdbf3AzO3R/O3hb4jQka2/RNoo3tMlzJA=
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM5PR12MB2438.namprd12.prod.outlook.com (2603:10b6:4:b5::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.25; Thu, 26 Nov 2020 15:06:48 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3589.022; Thu, 26 Nov 2020
 15:06:48 +0000
Subject: Re: [PATCH 3/6] drm/scheduler: Job timeout handler returns status
To: Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Alexander Deucher <Alexander.Deucher@amd.com>
References: <769e72ee-b2d0-d75f-cc83-a85be08e231b@amd.com>
 <20201125031708.6433-1-luben.tuikov@amd.com>
 <20201125031708.6433-4-luben.tuikov@amd.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <f44fc646-7af0-13c8-71d9-ecd2becada0b@amd.com>
Date: Thu, 26 Nov 2020 10:06:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20201125031708.6433-4-luben.tuikov@amd.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:69eb:68c9:c18d:f6e2]
X-ClientProxiedBy: YT1PR01CA0105.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::14) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:69eb:68c9:c18d:f6e2]
 (2607:fea8:3edf:49b0:69eb:68c9:c18d:f6e2) by
 YT1PR01CA0105.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Thu, 26 Nov 2020 15:06:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6d88eb45-d07c-4b48-4d62-08d8921ce5bb
X-MS-TrafficTypeDiagnostic: DM5PR12MB2438:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB243841E4A6801D6992901571EAF90@DM5PR12MB2438.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t1T95fXE7abEv+ZmrnEI99iXxshlbm+89E5KFEthDOblStTfgVziLx8FzwMZVd0JTGvpJLj+WiypFhX0QB6uXbmF3xsunISTZGDvgoCT9sa8wlAWLzOE+25XW0br3hudq361zQHnOykQD4Zhs0/JOXmey04yKah8LfhjNswHXes3L7kmSDrhCgwSZ5fmspDfzQbdERi2q+qGIQSouD0hvFxOiSuqiUIRC+4TD7RXr6S7VVeQFmlmskdK2mQB014kolnL0nzJfZndFGdn1yt2y+fIc8pVqOlMyveX04Yeofi5jsoO0kxIDMT01wPixqiAeR/lPDF3FJo3QAe/hwqLUypaTnuPXF5cc+cc9AiwzEfMrJaB5O+JdoxpFkyUmMVk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(366004)(2616005)(66556008)(316002)(6636002)(66946007)(86362001)(478600001)(31696002)(53546011)(110136005)(66476007)(2906002)(8676002)(4326008)(31686004)(6486002)(5660300002)(83380400001)(16526019)(36756003)(186003)(8936002)(52116002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dnJJVnEvVENPU0pTcmJCb2V1YUlRQkNjcVJaOGw5S04vVGhFRHN6c1BmY2Zr?=
 =?utf-8?B?M3NWUUNMN0twUjhUa2VkUFU0bnEwSjBqcVdveHljc1JNV3VEOUVQK3NKSGxi?=
 =?utf-8?B?NW9jeXZ6c0R2cjRNcmEvZE1icEd0T3dsVlBPQXFmSTdndEZtcm1HQldBRlBS?=
 =?utf-8?B?cnRYQ0Qrckw0M0lDNTJCenZReXlQdThFTVVlYWpheW1JZHVqdVY0NXRCRE04?=
 =?utf-8?B?LzF0anpSUHRaaTFOdUV2M0pEdk1VcVlvN3JLSmlWcDhGb0cwS1cvOVVQSjhL?=
 =?utf-8?B?TFBOclViY3lGcUN3UXBGK0srdm1COThrZ3pqcmMzMkVtQzFvSGhGRVRyc1Bu?=
 =?utf-8?B?OXpsZUR5M2p0YVh6QXh1MWFYM2RQNURoZWM2WWptU2phMmdZeHRVTFRXUUYv?=
 =?utf-8?B?K0RZMVRFM0RKWjdmR0ExVkQ4dXhQMWIzM0JIbXJETG1UMEIvR1pLbTZpVWgw?=
 =?utf-8?B?cUZNY3Y0V044YllqbUticmNWMDN2ZU5FeEZLU0FEVEEvRVg4anJVQlM3eG5q?=
 =?utf-8?B?QlFvUzIwb21Qd0g0aExzRGdhcDY0dS9jaWJzbTRGYlhVS2dYd00rSVpMZGpE?=
 =?utf-8?B?Ty8wL1ZkYzNyRzhtZldrMWVVdUh4VEtjN1F0Ti94VVpkTnN4WEp2NGVnRFpy?=
 =?utf-8?B?Szk2OUQzVFUxcFRoTERKaTllaHc4THdqVlpQbTdsR1d2U3hCM0tKQUx1ZGlW?=
 =?utf-8?B?WVByWDlJdkF2YWZVUGNxdmNzYkFZNU1CVUpiTVVoOXNDS3pNZ1I0ekpxNk9U?=
 =?utf-8?B?Z3p4TFlzR25Za1BBTEJ3V1Zjb1FBU2VlMVA0QmZUVUZ1anp1bThteXoyc2hM?=
 =?utf-8?B?NTdrN05NNzVyb0d1akp5NnJCQ1FFRHJybDlkejdzejRnbkRGMEtlRVhNZEFZ?=
 =?utf-8?B?SUhpNmd2NGN2YW5neWJ4S0dvc0ZNTnZiaG5XV3FOMHZBend6Zk82em5Wc3hj?=
 =?utf-8?B?TGVRV0lkNkhqa1I5Z2pmd2RKK25ZbnVsZGJ4dWV6Y0oxUGE2L1NSSXFXNzJy?=
 =?utf-8?B?ZTdkMVVEbGxMZW9ETGhwc0pTa0VpYjdQQ2tNZzlhcXVreE45bGhhWkVjU3ls?=
 =?utf-8?B?Z0R2NUJJQkYyVjMvNWQyb2xtRVc4Qk9wVXUxOFc2RkFCUWVxZTMxZVRGQjB6?=
 =?utf-8?B?RlFUTjRvNUxKVWc4eEJuYzNBMFNDenZEcHU3NlVTQlFsMEVJa0RBamo0Ylov?=
 =?utf-8?B?bUwzaUhVaXNXdzN2ck1PcFVTL0FIS3RzNnBXY3lRRUpjUkR4VXF4VjdIb2Zj?=
 =?utf-8?B?alNVVHN5bUdyT3dhTVB0UlZESHk2cFJiOHdHd2pTUW9VbCtxNEpKUXVGRnBZ?=
 =?utf-8?B?SmhVWEtKNms1N1JzeEdRL1JSbnRieHVxcTJ1V08ybTlwK0JtRXlNNlFPb09X?=
 =?utf-8?B?a1h2Q2tXMnR2TVZ5YWhtbkFnemQ3THdlYXd0RnUyM0JZTjJWdjEveW85WG9i?=
 =?utf-8?Q?ZVwSHE4k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d88eb45-d07c-4b48-4d62-08d8921ce5bb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2020 15:06:48.5813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MNd9BTtUbShU7yMCMCsqC6OAHsLJxAY1INaDeJXF+veagQJMWFi9ihw3Ne5uBa7NctqqBD5Z8XdNSx0M5apdBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2438
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
Cc: Emily Deng <Emily.Deng@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/24/20 10:17 PM, Luben Tuikov wrote:
> The job timeout handler now returns status
> indicating back to the DRM layer whether the job
> was successfully cancelled or whether more time
> should be given to the job to complete.
>
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c |  6 ++++--
>   include/drm/gpu_scheduler.h             | 13 ++++++++++---
>   2 files changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index ff48101bab55..81b73790ecc6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -28,7 +28,7 @@
>   #include "amdgpu.h"
>   #include "amdgpu_trace.h"
>   
> -static void amdgpu_job_timedout(struct drm_sched_job *s_job)
> +static int amdgpu_job_timedout(struct drm_sched_job *s_job)
>   {
>   	struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
>   	struct amdgpu_job *job = to_amdgpu_job(s_job);
> @@ -41,7 +41,7 @@ static void amdgpu_job_timedout(struct drm_sched_job *s_job)
>   	    amdgpu_ring_soft_recovery(ring, job->vmid, s_job->s_fence->parent)) {
>   		DRM_ERROR("ring %s timeout, but soft recovered\n",
>   			  s_job->sched->name);
> -		return;
> +		return 0;
>   	}
>   
>   	amdgpu_vm_get_task_info(ring->adev, job->pasid, &ti);
> @@ -53,10 +53,12 @@ static void amdgpu_job_timedout(struct drm_sched_job *s_job)
>   
>   	if (amdgpu_device_should_recover_gpu(ring->adev)) {
>   		amdgpu_device_gpu_recover(ring->adev, job);
> +		return 0;


For amdgpu specifically - not that amdgpu_device_gpu_recover returns a value 
which is 0 for successful GPU reset
meaning we reset the GPU and resubmitted to HW the job that triggered the 
timeout to HW (guilty).
It means the job is still should be considered part of pending list and so a non 
zero value
should be returned. I think only if we reset the GPU and don't submit back the 
guilty job then
it can be considered 'aborted' - but I don't think we even do this.

Andrey


>   	} else {
>   		drm_sched_suspend_timeout(&ring->sched);
>   		if (amdgpu_sriov_vf(adev))
>   			adev->virt.tdr_debug = true;
> +		return 1;
>   	}
>   }
>   
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 2e0c368e19f6..61f7121e1c19 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -230,10 +230,17 @@ struct drm_sched_backend_ops {
>   	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
>   
>   	/**
> -         * @timedout_job: Called when a job has taken too long to execute,
> -         * to trigger GPU recovery.
> +	 * @timedout_job: Called when a job has taken too long to execute,
> +	 * to trigger GPU recovery.
> +	 *
> +	 * Return 0, if the job has been aborted successfully and will
> +	 * never be heard of from the device. Return non-zero if the
> +	 * job wasn't able to be aborted, i.e. if more time should be
> +	 * given to this job. The result is not "bool" as this
> +	 * function is not a predicate, although its result may seem
> +	 * as one.
>   	 */
> -	void (*timedout_job)(struct drm_sched_job *sched_job);
> +	int (*timedout_job)(struct drm_sched_job *sched_job);
>   
>   	/**
>            * @free_job: Called once the job's finished fence has been signaled
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
