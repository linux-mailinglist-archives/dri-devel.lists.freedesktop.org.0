Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F01F6339125
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 16:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5C56F892;
	Fri, 12 Mar 2021 15:22:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700084.outbound.protection.outlook.com [40.107.70.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E098D6F891;
 Fri, 12 Mar 2021 15:22:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4DoNmLMvx8h6NJzU54yo9jHySkTQeIjeB3Sx0D6WThFy5iWfhqpjgN5szEJLhAqZuLaN7NvrrLlnrufHmFduSWWPZ36m+xk5rZP4HvPo2dMCkVP2M/XN4+neoedWo8x++/EVNBZuNlXumLyD2IjJ1HJJY6Zy1BWbfnAUfAzAHNivvBTt37EvVTk/bB5FSVgJ2bE1QpiqplIa4gRTDCth2ffRrN5GZXebkWIRgOC0FsoU9OVlBaLOhVWFRtSLqSbCC8UL7tn/UnLwNBOhxSCpgocF0fF9bBJcGwbcJSQ8bjCRC9Lwwx5/PllJ2Iy7mbpMWQTrsY29/D1+X56dLD2Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQhL2py7RJJUwN9CI+vkCUQjijpKu7ZEk5upLHpUHeU=;
 b=KWNruQPuZbshj2jz5mw0p50wBnrjrH5cQ9l9lP9tfLYvfXu6Y1TE4U6utwXZLsiWRBrV7tLk6VDVyOTvDEvVXXpF/QF2InRx0bmdVIwVPcOqTGBcbHOB0k1d7jKCJ9PGuunzAujUCgfHfDrYSSZFPEPscQRsCrSNMT88pgZGQ6zmq+2hzdl1DUjYNrK0NdMpkNZedIDaCC59l8KnklrtOUivxtSvw7wsuvgFqembXV46KU3pbjL5jlTJwyYc+RtKkucw+YKM6a9jzo9gG0Bj1yt+/cvfOyOy2KTS8eKqJIZQH/oRsYC7bPfnTn2JX+XLCv2HGT3XBhKD8dnWk7sgZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQhL2py7RJJUwN9CI+vkCUQjijpKu7ZEk5upLHpUHeU=;
 b=Lenyi9eUIuUhFYFOcDQJRwcjrX/1Ye3/CKhblI6ZITwsuJZSz0SwQTozzwLY9cjRnUkQD9QAFCP9IYbaIqSsuUxrn3cNFCRwPA+Inw6qj9quTLOB/94+R0Kkv4PuHgnxHFeorIhEnWfe/+dOzWGMcyjuqXZQqmXRGSr/IqKnniU=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4398.namprd12.prod.outlook.com (2603:10b6:806:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 12 Mar
 2021 15:22:04 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8%6]) with mapi id 15.20.3912.031; Fri, 12 Mar 2021
 15:22:04 +0000
Subject: Re: [PATCH v2] drm/scheduler re-insert Bailing job to avoid memleak
To: Jack Zhang <Jack.Zhang1@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Christian.Koenig@amd.com, Monk.Liu@amd.com,
 Emily.Deng@amd.com
References: <20210312065025.1094934-1-Jack.Zhang1@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <01a690d2-6b09-8324-863f-babf2782c550@amd.com>
Date: Fri, 12 Mar 2021 10:22:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210312065025.1094934-1-Jack.Zhang1@amd.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:8dc6:261f:a3f0:6b7e]
X-ClientProxiedBy: YTXPR0101CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::37) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:8dc6:261f:a3f0:6b7e]
 (2607:fea8:3edf:49b0:8dc6:261f:a3f0:6b7e) by
 YTXPR0101CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.26 via Frontend Transport; Fri, 12 Mar 2021 15:22:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5a9d15e6-561a-4cbf-6c95-08d8e56a972a
X-MS-TrafficTypeDiagnostic: SA0PR12MB4398:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4398950C96FB89143E13CD36EA6F9@SA0PR12MB4398.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ML+KTCxKXgN3h92l9rbWRFW6bT5Uk4+oLNzQo28BvvfYCeiJDtnpbs8rHiDXJNJvib4GCkGagS+G2ySf0aYEIf0x3g0cPqHpEPeBE3YZPSAvUkVwOymQuKqcvoGAurNYUSuKJ1gyDgX8nQOF7hraPOKkMViSi19CiGX9GYVBS3LNYihnBNoIC4Fk6Yh+203qXecYvP8+s1q/OgVGOJPv36m7kibOk5TLrdWzpEhP8CVLfxAbAshVt/0v59Cq+5TANm6F+/iUCJGHyfUM6R2hWJ3gY5fnvvK7OyuYM9ARncN7zYQsgINszXTKCv4cP6XVhauRc1CW2plGQ8QxDLcXZnNIX6mKtUYcbbBChazYIsy7oi7ee2vK3P52VPZi6EW20b64YPf68LrEwpj+gpQ32hxDo4haEu35ykDjGlkK2E2G79BD1IiYDY81TyBIK7nXQY0EvKnUrB1SUi7G6H7kln34Un2DcyP/XkrduXGHjeWzvjxjTOK4SIu0feHu+tBj0BK1vmK3yVmDg/4zCN35lEr/eZZe2UsD/CWo+xCdqJTosCHNWHCYGt3ns4kH9Z8qed2P05SW74BqIv/wtIVRlDj2C1VO9NyXTACtru0wqLCusbzCgY1tRRLSENWmb5ELd5P1D0op+YLt0Wffb3YVGj7X3/SAM97JWuZxU9aHTzzoJnfKYWMoLm+o8s0d/3J6k9+rWZme+D3tUR9RHzNVjuJ5xpu7Ql7CQXw3hOI/h2E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(36756003)(450100002)(6636002)(5660300002)(53546011)(66946007)(6486002)(16526019)(966005)(478600001)(66476007)(316002)(186003)(66556008)(86362001)(31696002)(2906002)(8676002)(52116002)(31686004)(83380400001)(2616005)(8936002)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dWJrazlvSG5oN3NhVnNLdWZKRVFBaEVVV05EWCtxcXIwQjJ0aUU3bU9Jemt1?=
 =?utf-8?B?dUVhMktDK1c3ZktEeHFuRE44MU1BRVpERy9HSnNMV0xLeGVyV3RNTW9jNHA5?=
 =?utf-8?B?NFJhb1pPc2xBSGhTZVVSTUZrRGx0TFNGTFNHeDdpbFVrVG5UK2x5elVhRThj?=
 =?utf-8?B?VVVZM2lBVXA0SUV4NWxySmxCVURoWXJLS04ycy9WQVpISFV6bEFVa0h0V3JX?=
 =?utf-8?B?dllvR0pUcHRBczUwMWxkWXg5RTZHcTNUTkFsVVIzQUVKRzl0ZldZMnJ0RDVq?=
 =?utf-8?B?K0JQR1BzNjZ0aHc1VWN0eVYrQkRUN0tWLzVLV0c0VWtBb0RMa29oT0g5Rjhr?=
 =?utf-8?B?UDdZdkI4WUNLaVBxSEJtN2VURHg3MGR0SWdCQkdEVmYrWXROS1ZxQXl4V2pj?=
 =?utf-8?B?WjFGRE9QRVZsa1loNVhhd3RFNXM1aUdaNnpiQTNTZFU4RXFWSDdwM0hBUVEy?=
 =?utf-8?B?QktkaUx3QW03OGl5TWVWVGlhRTFrTlF6U3JPTXJHTlJHY201WHQ4MEZFUVhM?=
 =?utf-8?B?UWVpYUpaMzFzVGYvMDVTNTlrTW03dFVRWHcveW11WkNqV0I4clpuOURWcnJ2?=
 =?utf-8?B?NmM2NzJFeFE4VWpzNWlLdFE4R3NhNjhHdEFoTEg2MzFjR3hhSFVXTlA5UnlY?=
 =?utf-8?B?UWc2bzlCQkl2bFFWd1ZzaWdRMk1uODZKSXdyaFNhR1YzRVZVaXYyYjl3ZnAx?=
 =?utf-8?B?dXJmL3ZuU1N0SkVMNSsweVhJUmkwUEkwQUU2ekc5TExxTElMcno3ZHV3VjQx?=
 =?utf-8?B?Z2I3UGpyMHcwdEhiemxHemJQMHhGWmlON05FSlE1YURiajdWSHVRcVZVdUlE?=
 =?utf-8?B?WFVuejN2Q0J5bjZpSTdIN09mS1oydkRUSUsySzhxRzY5UFhVZXd6WXBabmZ1?=
 =?utf-8?B?UkNycVI5U0ZMbHpDbHl0M3lnbHc3SkkxMkpWTStNVCtVRHhCd0dJNnl1ZlFJ?=
 =?utf-8?B?bW5tTVZGWTVLdkwzZFZtc3B1ME82WkcwSGZUTmtrVXdTUzJCQzV1cGNWUitl?=
 =?utf-8?B?Z3NtTmVEMVg5YlE3NnJyZlJnQmVHV2VpVEF6c1F0M3gvRFN2SkRwbGZaREF2?=
 =?utf-8?B?S1djKzd4WXFkQ1NBQkxyd1NyUmFjMkVvUlk3VkloZkhVR3ltbkVIWGZMd0dY?=
 =?utf-8?B?MjFMNW0zR0YwZ1ltcERZa1VsR0MxdWdIVWJkaDdUNHRhM0VoODZPc1ROQlFt?=
 =?utf-8?B?bHpHd1MwWGZMdG9PbkQ3NEZzZy83eXNONXhUU0ZEbXE4dU9NaVV6d1lrN2xR?=
 =?utf-8?B?ZitrdGFDeHVYUnNPV0k3UmMyY3BKMDJBUmpuK1FNRjBQbUxpbVZkMUpyMHZo?=
 =?utf-8?B?QkM5T1o0TGhrRjg4TVBDMlRtcTU1ODJrVHN5TFBRUy9uODJHUWlHK0hLalBh?=
 =?utf-8?B?QmpkZXBRWVhTbjRJTTQ3ajI3WFJYSWRiZXlnOGl1elUxTkZwZUNWSDZuUnJE?=
 =?utf-8?B?T3U3TmxjRkR3bDNUUzIrdExlcVY3dURBY1k0Y05yeFVSWGRjeG1XUW1BcW0x?=
 =?utf-8?B?dXlQMnc0Y0tRa2RuRjVtSytnQXptVGtLKzlJVlFhZnF0SDRsbVdkRGhqRmRP?=
 =?utf-8?B?cU9BdkZTc3JJeWg1ZUdETGR3U2RjMUQ2QlZ4Ny9wREI3eTBGUkRhSlVHL1J6?=
 =?utf-8?B?MHFmZUVEY2hWZEhXbnFuaFpyOGpZbFB6bDFFSDdxeHdzN0ZjQktpb01LQ2Vn?=
 =?utf-8?B?d0doNE9lOWRpMFpyL20vbS9LYkxXM04xSWliMFJ4Y1dpdlg1L3htVTV0dmJH?=
 =?utf-8?B?L0NxbkcvQ25IMHBLOWZRRTlOd1RydjRBL0ltMUpQeXI2UVBDZXdlOGd0RExL?=
 =?utf-8?B?SkxWbXZwbzdjT3Z1Z2tSaERvL0VMK1Fja1pkdkRFZVdFWkFBV0pTdGVZeDg5?=
 =?utf-8?Q?GB5IrTupQOTfu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9d15e6-561a-4cbf-6c95-08d8e56a972a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 15:22:04.0837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AmOzrZVzTala0CaFy+WFhDdAUcdveXvHA3FprpQfFop0ReWAaCrjFHCT/bmUIdMaoAuw/zOh0lrqkrAYZJSsAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4398
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-03-12 1:50 a.m., Jack Zhang wrote:
> re-insert Bailing jobs to avoid memory leak.

Usually we put a v2:"Blha blha blha" here to explain
what was modified in v2

Also - since you make changes to another driver you should
add their maintainer and mailing list probably
(use ./scripts/get_maintainer.pl) for this

> 
> Signed-off-by: Jack Zhang <Jack.Zhang1@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 +++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    | 8 ++++++--
>   drivers/gpu/drm/panfrost/panfrost_job.c    | 2 +-
>   drivers/gpu/drm/scheduler/sched_main.c     | 8 +++++++-
>   include/drm/gpu_scheduler.h                | 1 +
>   5 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 79b9cc73763f..86463b0f936e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4815,8 +4815,10 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>   					job ? job->base.id : -1);
>   
>   		/* even we skipped this reset, still need to set the job to guilty */
> -		if (job)
> +		if (job) {
>   			drm_sched_increase_karma(&job->base);
> +			r = DRM_GPU_SCHED_STAT_BAILING;
> +		}
>   		goto skip_recovery;
>   	}
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 759b34799221..41390bdacd9e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -34,6 +34,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>   	struct amdgpu_job *job = to_amdgpu_job(s_job);
>   	struct amdgpu_task_info ti;
>   	struct amdgpu_device *adev = ring->adev;
> +	int ret;
>   
>   	memset(&ti, 0, sizeof(struct amdgpu_task_info));
>   
> @@ -52,8 +53,11 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>   		  ti.process_name, ti.tgid, ti.task_name, ti.pid);
>   
>   	if (amdgpu_device_should_recover_gpu(ring->adev)) {
> -		amdgpu_device_gpu_recover(ring->adev, job);
> -		return DRM_GPU_SCHED_STAT_NOMINAL;
> +		ret = amdgpu_device_gpu_recover(ring->adev, job);
> +		if (ret == DRM_GPU_SCHED_STAT_BAILING)
> +			return DRM_GPU_SCHED_STAT_BAILING;
> +		else
> +			return DRM_GPU_SCHED_STAT_NOMINAL;
>   	} else {
>   		drm_sched_suspend_timeout(&ring->sched);
>   		if (amdgpu_sriov_vf(adev))
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 6003cfeb1322..c372f4a38736 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -456,7 +456,7 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
>   
>   	/* Scheduler is already stopped, nothing to do. */
>   	if (!panfrost_scheduler_stop(&pfdev->js->queue[js], sched_job))
> -		return DRM_GPU_SCHED_STAT_NOMINAL;
> +		return DRM_GPU_SCHED_STAT_BAILING;

Note that there is another early termination in panfrost
at 
https://elixir.bootlin.com/linux/v5.11.1/source/drivers/gpu/drm/panfrost/panfrost_job.c#L445
So probably should also add there.

>   
>   	/* Schedule a reset if there's no reset in progress. */
>   	if (!atomic_xchg(&pfdev->reset.pending, 1))
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 92d8de24d0a1..a44f621fb5c4 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>   {
>   	struct drm_gpu_scheduler *sched;
>   	struct drm_sched_job *job;
> +	int ret;
>   
>   	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>   
> @@ -331,8 +332,13 @@ static void drm_sched_job_timedout(struct work_struct *work)
>   		list_del_init(&job->list);
>   		spin_unlock(&sched->job_list_lock);
>   
> -		job->sched->ops->timedout_job(job);
> +		ret = job->sched->ops->timedout_job(job);
>   
> +		if (ret == DRM_GPU_SCHED_STAT_BAILING) {
> +			spin_lock(&sched->job_list_lock);
> +			list_add(&job->node, &sched->ring_mirror_list);
> +			spin_unlock(&sched->job_list_lock);
> +		}

Just reiterating my comment from v1 here since u missed it -
Problem here that since you already dropped the reset locks you are
racing here now against other recovery threads as they process the same
mirror list, and yet,I think this solution makes things better then
they are now with the leak but still, it's only temporary band-aid until
the full solution to be implemented as described earlier by Christian.
Probably then worth mentioning here with a comment this it's a temporary
fix and that races are possible.

Andrey

>   		/*
>   		 * Guilty job did complete and hence needs to be manually removed
>   		 * See drm_sched_stop doc.
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 4ea8606d91fe..8093ac2427ef 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -210,6 +210,7 @@ enum drm_gpu_sched_stat {
>   	DRM_GPU_SCHED_STAT_NONE, /* Reserve 0 */
>   	DRM_GPU_SCHED_STAT_NOMINAL,
>   	DRM_GPU_SCHED_STAT_ENODEV,
> +	DRM_GPU_SCHED_STAT_BAILING,
>   };
>   
>   /**
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
