Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE9847E08D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 09:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 436F610E2A6;
	Thu, 23 Dec 2021 08:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCD610E2A5;
 Thu, 23 Dec 2021 08:41:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrYHzFRLbGR62jRinw9/zDgvr+b58QELO8yn6SWKR3+SWM4/4cISfh7HF9EOnsqErygOQcC4BRj78yAQgSoFPF5aUAA8YkdPLaxzL91fMueBDBPyK0xZ8mTaert+nuN2KYqU4QhwYPBtfd6CBo7f28z8ekBZQudTXU7BMgxiEDWtI1Jde6q2O77gM+omUxzgobgOBNlbfOmEDFy8EoOFbBQC21eCjbD6I16K47ipDdyRu17lyee5ZUUKWmpZ+K6IjpveHwy+dcIdRNZH5LyqCuyRfwLb6bB4Cm9NCqd4Nl6f5HB7VREPuuVoLUb0fLlOWTvY9OWSWDUx/XwxM02S4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQ6EWV/d0bywS66AVPQ+v08yyumLP2zEl/OY3uFeTN0=;
 b=dkSvrLr7d4v21rLQ7+YtAngSDlsF6/UPsbA3VrBLiZxzLOXrnuyl6tsw1fs7e69FkY1kESH7KoQN8kkHXp3GQun1lG2RuIDUQb2NFzAk86WRC58gB4+QFhh8mQS0/CjBvXxBMqcVemZWHj/FJIepi16aUHbZ5PM1Sd03Q5VIOC/wrnvWs8E4zOKj4aAWz//Q5HXFcxkfz9N9dDdAg9hFwMS8e7uifApl1OUO+TvV7lp+Vmr5+aUF1cDNDDsQ+U0NfhfBZZJQnpUcCHwiS7vMnmGJGBtextMwGicZu7aLRANj5d9Uge4gIi69qSEuOImEiVHaEWew3KGiP0ZRImj2ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQ6EWV/d0bywS66AVPQ+v08yyumLP2zEl/OY3uFeTN0=;
 b=qW6aVJxEbPT0yIWQKHgyevxatvWqs9xQdOeH5qMBW/9UQOPEAOuIzrOy5WvBfiMd4DYkiQw49zH2QgSMVdfE3ECshZxZ5mA54BZpQuh+4+Zahfa0VL530dw0rjB7OpTkHEs+LcwxaCNXxDEQ65lWEEUAt4HwxkvlPvBIsGDcTGc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4458.namprd12.prod.outlook.com
 (2603:10b6:303:5d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Thu, 23 Dec
 2021 08:41:42 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4823.019; Thu, 23 Dec
 2021 08:41:42 +0000
Subject: Re: [RFC v2 4/8] drm/amdgpu: Serialize non TDR gpu recovery with TDRs
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222220506.789133-5-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a648d46d-277b-71d6-58a7-c7863270124c@amd.com>
Date: Thu, 23 Dec 2021 09:41:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211222220506.789133-5-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM5PR0601CA0040.eurprd06.prod.outlook.com
 (2603:10a6:203:68::26) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 524c4f64-799a-40cb-1c70-08d9c5f00b19
X-MS-TrafficTypeDiagnostic: MW3PR12MB4458:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB4458F60741F337D60C735D96837E9@MW3PR12MB4458.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9X71jVjXFo2PLTzwG/1HbGWKD7/dr7S2b/nDn+tupc5kvHQypEEJR+OBggxYpK0IjmOe/olCiFk4kTlLe2lQTDBG9oKeRCSgsIGT4Sw2yhJmC708uym6jEF7PGbTgC6E0bkwpxac/5CCeeNbErrMeGAyg7/FUq6KE95iSrbXdoCIvELpyGJLeWIeymsK8ifIOoq2DuSHzmmnav4yzlmWEcofylWyMkA56YwrlIyq34RQrWB/Xjt8EEEyIEhLBWhn2ucFnc0PXv3kYJ6rFV0eyYdWtHCE91L9MajoxcCMi8ThlJS6mH181FPKdgVcIww2djZMgPOzJ4qRVLibi54bY5/QVqEypMQIKVlib1ROTk3j7SkEEd7jj3dbNktd5JCwIeg9PGws6X9xw56cyMWcGPonDhfmf3LOOYHGc50sC89UZ8zr+vyYsxMf42sTMAjydhizUZyC0Cucwqo6kcZRfsL+FZ0UVphVVuH12bbN/6L56bscJWhT/01kKjg3Iqsu9Z81kHdcIBX7HITPbgmHh70d1C5dvJHyCy7KyURI1zIwON5kigoQIA0IYxuQ1wFI2tRkq3+AtY+XOzMTxQ6zYi1+msyMIVhAEOa1lGZkk+lq5OYDaG25DhYEntPfWFs5o31vZHbv1t5vUUNQibayCIN4KQdVMC4UoGaZaxL2Bu+2OvqOsMwI0COcoENxQDlTcitSkJCgXkjaAIIN2ojzISzVjdlOYOehi4NEFPYqlqRNERL/XFxp+BApndIYBxrI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(6486002)(2616005)(4326008)(31686004)(5660300002)(66574015)(36756003)(8676002)(31696002)(8936002)(38100700002)(83380400001)(66476007)(6506007)(86362001)(508600001)(66556008)(26005)(66946007)(2906002)(6512007)(6666004)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGhlaDdSY3NLdlJjdXp6T0hJYnkveFQvSlV6VFEyYTBnQ3hsd291Yy9VN3U3?=
 =?utf-8?B?NlZ2OTkvYkoxNEhiV09UbHUrV1ZORzQwVlZ4NkFrbmxnYzVMcjMvZjlkRUFJ?=
 =?utf-8?B?eStwcWwveGdidHBJdGcvOHMxclZZYzVUL2thYVBkTTVDbTlmcXBBVGJZQmFV?=
 =?utf-8?B?M3B2ZWs1OWozOHZaQW1pdUdCSFdSZzcyWlVReGlNWWxQQ3BkeE5FN0Z6OWtF?=
 =?utf-8?B?ekhDaTg0RnVKaXNzNlZSd0IzWktFTlF6ZXVmMlNCaUttcjM1K1l0Rkg2ZkxY?=
 =?utf-8?B?dVdLZVp5THhKSVpsd25PQnlvNTlLQ2Q4TEJENENSbTdXWXZ5SG1CcEQ5YWRS?=
 =?utf-8?B?NVVjeFRVMCs1Q3JmR21pY2trYWZpVmJDK1RBMDRXcTVDNGJXWVA0a1QrMm1y?=
 =?utf-8?B?QnBuNVZHV0g5L3g2WmVVbGFRNm1WS01BN0Jnc3NOYXFGMmgxSzlCZEZNOHRX?=
 =?utf-8?B?bU9tT3FJNU5GaTJybXMwSU5yaGQrZ2YzekVVY1RUUVlkNmxzZ1p2YjUzOWhw?=
 =?utf-8?B?ZVVaY3NyV3pPdjdwaTdweGxzQktJY0hQRWF6OXZCbFVKeW8vS0ZGTGJYUyt6?=
 =?utf-8?B?ZlM1NUk1NVVraDNoN0FHT2tEWlM3MU5JS01JOVZlWGpkaU4vUWFDYml5Mk5x?=
 =?utf-8?B?UHVpdjdjNldPYU4zUk15VVVqcENTRTJUNHFYaDJxSHA4V3BjYzluU21LR25v?=
 =?utf-8?B?dUxkcklQbEh6eUZzMHNvY0EwaCtjMFh4ZWdLbmRoNUR1VkJCR3g2dnN0L053?=
 =?utf-8?B?Uy9vd1VSa1psaytBZGQwMDJhSWJNRlIzZDNjeEJwUWNzdnJPcTM0MHNMbXkx?=
 =?utf-8?B?V1Z1UVRmenYyV1RiWjZRM2RzZ1hTUmxxem9aS0tTQng3aW1rMTFLcTlhY1p1?=
 =?utf-8?B?NnFrUXE3Sm5BZHBlNWFCcHBBZ252dGxMODRKb0hqbE45eHV0bnBUV3h4QnFu?=
 =?utf-8?B?a1oyVDVmd0lKZVRmQzVUeU5NcEFiOEpwOVBoWjlMY01BeC9sdFAwekFFeERU?=
 =?utf-8?B?T1Jpc2hHUWVaSGJYcXRzMkszcm01Rm5sRzhPVmJZVUJWanJmK0tQRkxBRkdJ?=
 =?utf-8?B?Rys0OW5qKy9acmZmc1hRMzIxTE5HZzhJSFhPRWFpRGU2MXlMczJ4cHIvVDZZ?=
 =?utf-8?B?bEtNanFPSGU2MFFLcEl6bHNvRDRPZnVxRXQ4NmhXVFM3WFVRZldZS0FyeG9B?=
 =?utf-8?B?ekNFYmlLRDMramJMZGZvNSsyRDBvNXlqc29sUHNhMkNCL2VjaXVRQzEzc2Vq?=
 =?utf-8?B?ZW02VjBZaHU2TmQrajNaYTRjSWU3Z24rSjBZT1NzbG0yV1ZsOGFRQVFFY1U4?=
 =?utf-8?B?SGFRdDhURzRRb0h6VU5mOEpuOEpQTENtZXo1NVl4cUtwTU5TQVNDYm1lWVVw?=
 =?utf-8?B?Q2NsVUZWWGpwcC8vbWw2bkM1QTRlUUV2SzYrU1VMV3dObVNBc3o1U2lwck9J?=
 =?utf-8?B?dXpwNFV4c3JhSm9ianVEL2tOejFSdXlxS0FVdVdWTFpkRnJNNDVJMDN0ejlB?=
 =?utf-8?B?a3Z5Z3ZVUEhkcXcyMlhuU2N0dUpOcTlEM1AwVGNIM01sQ0tNSm1lS04vU05C?=
 =?utf-8?B?MTJoT0JBMDA5M05lbmFnSVFWYjdRTjh5L1g2dGlWRE9jMFFKTFFWcDdiVnFF?=
 =?utf-8?B?YUxyZEhZNWRQYm1xa0dONmNaemxkSC9Ua0p5K0puL291Z3pSYWhRWWQ4MGV5?=
 =?utf-8?B?YXlDeXhGL0o0OEo1YmJYdzhVUS9oOHlBNnFZbXZaQ1pQNDNIcGQrVGlrVFJv?=
 =?utf-8?B?bnlnUzd0dFloTkZvTWxYQkZzWHJDRDBSTUFpem5xYTdkMS9hUmNtMmFYV1B6?=
 =?utf-8?B?UUdWc2V0bUt0KytVR09CSFkrdUVjNTQ5bGJxTjQyNEZaNXNzRVVHVDhabzB2?=
 =?utf-8?B?Mkllb3hsL2lUd3EyUk9Pd3hqWVd4L25UdzJjbmVpWWM4VlpDN0pJNUQxNFRB?=
 =?utf-8?B?azR3KytncnVPdml1TXp3dUtWQkRPcUxFWmVVakd2Q3JKZHZZMGFDMlJyL09O?=
 =?utf-8?B?elpkL0d0dVdzbUZwMUxVZXZSUnhCK0xtWHJaT1JTK1NlSHlFdmY2dVNiV1RX?=
 =?utf-8?B?ckpFbG9KTUhaeld1TEhIaGFheSt2UzBQNGErQ21iSmI2NFJ0c1huYVU1dzBi?=
 =?utf-8?Q?yoas=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 524c4f64-799a-40cb-1c70-08d9c5f00b19
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 08:41:42.0383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7csKYyKsGHIIsqFMymuYOHT/8kJ5nE9FAuWQCnMNbosUFgtbnFDBMY/xvAdFR5Kf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4458
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
Cc: horace.chen@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.12.21 um 23:05 schrieb Andrey Grodzovsky:
> Use reset domain wq also for non TDR gpu recovery trigers
> such as sysfs and RAS. We must serialize all possible
> GPU recoveries to gurantee no concurrency there.
> For TDR call the original recovery function directly since
> it's already executed from within the wq. For others just
> use a wrapper to qeueue work and wait on it to finish.
>
> v2: Rename to amdgpu_recover_work_struct
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  2 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 33 +++++++++++++++++++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  2 +-
>   3 files changed, 35 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index b5ff76aae7e0..8e96b9a14452 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1296,6 +1296,8 @@ bool amdgpu_device_has_job_running(struct amdgpu_device *adev);
>   bool amdgpu_device_should_recover_gpu(struct amdgpu_device *adev);
>   int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>   			      struct amdgpu_job* job);
> +int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
> +			      struct amdgpu_job *job);
>   void amdgpu_device_pci_config_reset(struct amdgpu_device *adev);
>   int amdgpu_device_pci_reset(struct amdgpu_device *adev);
>   bool amdgpu_device_need_post(struct amdgpu_device *adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 7c063fd37389..258ec3c0b2af 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4979,7 +4979,7 @@ static void amdgpu_device_recheck_guilty_jobs(
>    * Returns 0 for success or an error on failure.
>    */
>   
> -int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
> +int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
>   			      struct amdgpu_job *job)
>   {
>   	struct list_head device_list, *device_list_handle =  NULL;
> @@ -5237,6 +5237,37 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>   	return r;
>   }
>   
> +struct amdgpu_recover_work_struct {
> +	struct work_struct base;
> +	struct amdgpu_device *adev;
> +	struct amdgpu_job *job;
> +	int ret;
> +};
> +
> +static void amdgpu_device_queue_gpu_recover_work(struct work_struct *work)
> +{
> +	struct amdgpu_recover_work_struct *recover_work = container_of(work, struct amdgpu_recover_work_struct, base);
> +
> +	recover_work->ret = amdgpu_device_gpu_recover_imp(recover_work->adev, recover_work->job);
> +}
> +/*
> + * Serialize gpu recover into reset domain single threaded wq
> + */
> +int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
> +				    struct amdgpu_job *job)
> +{
> +	struct amdgpu_recover_work_struct work = {.adev = adev, .job = job};
> +
> +	INIT_WORK(&work.base, amdgpu_device_queue_gpu_recover_work);
> +
> +	if (!queue_work(adev->reset_domain.wq, &work.base))
> +		return -EAGAIN;
> +
> +	flush_work(&work.base);
> +
> +	return work.ret;
> +}
> +
>   /**
>    * amdgpu_device_get_pcie_info - fence pcie info about the PCIE slot
>    *
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index bfc47bea23db..38c9fd7b7ad4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -63,7 +63,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>   		  ti.process_name, ti.tgid, ti.task_name, ti.pid);
>   
>   	if (amdgpu_device_should_recover_gpu(ring->adev)) {
> -		amdgpu_device_gpu_recover(ring->adev, job);
> +		amdgpu_device_gpu_recover_imp(ring->adev, job);
>   	} else {
>   		drm_sched_suspend_timeout(&ring->sched);
>   		if (amdgpu_sriov_vf(adev))

