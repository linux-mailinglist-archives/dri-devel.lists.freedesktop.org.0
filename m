Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7D1485070
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 10:55:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBA010EAA5;
	Wed,  5 Jan 2022 09:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2077.outbound.protection.outlook.com [40.107.212.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4541D10E868;
 Wed,  5 Jan 2022 09:55:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKx5Htvz5Nuh9ZRSAHKxn4Nq3v8YJvSprzutrm4W9ZDBTmtn0p/Wi1PiPo7i+HUdHEeFwHIzIP2l40E7lkf31v6kbgHaNw0c5FWsut1ozJDXy7Om2CMlbsc17JuqAWz/hFXYPasfouTjxVRxkiupeMxk4UeRvX5VMLnXhp9FnfxJD0PlOWc0S6Cb+UMFMO4uSG3vNuX7+K1pVuUam8eZG4w1OzmpdD+ZKN5rVsOc3dbsAcYleWNtn+DNyBEhxBQpaLfbVIz4BbircTT+HAFA26pmtUlXaGdRxi38PK0tuaWWcYTfoj/TsRDUglNgdcCqQhvm/bnFtxXV13kEGofBag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSnzKjPT5D59zMr2nMpzI5b4u1jZVtVa0AXK2d9pNLk=;
 b=P0osD8XGKuet4A0IJBWr7JO9OfneybSd0mnob9cRXEUqSk5Bk8dSy/cOR+vAjJnqu9DpUTut/yYAmvm6gZy6UZuwE8Y+fIbWUV2jN2+aYUyAkOLXcgTa5Apon2J4BdZwZmcN5IQhNpXSVllfylHmuroOW3zmKFQxwPOT3I6M9lwq3dtX59a5TIjdYUMC3vjyYLifZIxJTtHeGLkY3H4BOydkKGwUCAiB6JAk8rmDHVVFh8zahfg6m2NXwEJXGOOSzm0dZ+LO85nkloJ82PL86j4qgkwa4gHZbCLyi1jF/G9TJ5olKj0w6ZriItXRmoBjfAivfXrzIHnUofWbqDBx3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSnzKjPT5D59zMr2nMpzI5b4u1jZVtVa0AXK2d9pNLk=;
 b=ZZeJSDo6NT8oT/ye10q4hktvltWpnbe+w5htHqg6TUp6i8xXw73zXZsxFtqRqEKoe9A1hPakcXxEF++YqfB1s5yYP2+/ddHa0WuT75P2LKpgrPZ2zyHrt+LNHKgjEi/JflA4O4EQyAAvDbNaISJ+Bh+sFZL43F2K6Xd8uMZsNo0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by BY5PR12MB3729.namprd12.prod.outlook.com (2603:10b6:a03:1ad::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 5 Jan
 2022 09:55:00 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::f58c:40b7:85a:45c2]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::f58c:40b7:85a:45c2%5]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 09:55:00 +0000
Message-ID: <639bd7c3-e946-65eb-afae-dd619f6429d6@amd.com>
Date: Wed, 5 Jan 2022 15:24:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [RFC v2 4/8] drm/amdgpu: Serialize non TDR gpu recovery with TDRs
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222220506.789133-5-andrey.grodzovsky@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20211222220506.789133-5-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::19) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7240ddb7-4fca-411b-2026-08d9d0316fd7
X-MS-TrafficTypeDiagnostic: BY5PR12MB3729:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB37297A8BAC53688E51B01440974B9@BY5PR12MB3729.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: svN7spbD9gVBDJsv2UeNryh89zWKMNH+wbo3lQBj4NpJxXP6d0N/VmqwT/BFIcnAj2OwWT84qCvjogTdDBRAsEG4BBkV6Ncuc6Ihv5MBr1sWvR4FyZGxmvKoZDpZ7f7gMvadb4NhBatOb8G0cnSUN4NOeLM1JOJbjAZPTXaW5H76JIWP+dH5i6i0I9GEUP2zH4GeGduxzwESiI8qzYmvNB2QNAyEpfSDixFtC0fAU87FzQVDV1Erhg+MFs95eze49hh/G5QSplF5z6EPL4WV2t26VdhkcpY+NkjLQP7LlhNsl4W4DK7Yz0V7RnQ8CX51CHi3Uzd/L3BsNWW198oYbD4piemQyrICchLlGhSZ4mMckdMSh/Fg94O/n6s93uhyd/soUFSbvKGs3PLqLGFCjczjVhaumz1ULNw75aD4WgPiQ9TwYYtUvKy9VLsM9BesDzcQNpGwIO6snNNCfageZob05lN/ODSsfQv3U9ze/kAIvusAnwx9LjpS/g5Eat6AHfFtEBG8ogqMmgRpzlTT6r27xjtOcQCAeWmYOGWSlv1ci1o4UbySAhrG61uWUULPts2ke3JBqkf2/T1TLjbvFAxHSAbGWYSoNUBSeGKbwsf2tTkX1OJGxqb3g/JbdH+vAp38yXVLElcotxmi7kCinnihjRw9E/uGz/4bNtZ1iduHsuKFGYHJsBj2bF2Uqz1Hi3db9jqx8fMEkNXMwB2e0vYrPoGT9bR5HrjJUNRuxg4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(6506007)(53546011)(6666004)(316002)(38100700002)(5660300002)(6486002)(26005)(8676002)(6512007)(36756003)(2616005)(31696002)(31686004)(8936002)(186003)(66556008)(66476007)(66946007)(508600001)(86362001)(2906002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHp1a3BhSEplaERJM0pHYXNJSm9aUWNoMVJqcW50NEtwd3Q3SGNvSXFQYW0v?=
 =?utf-8?B?TzZrL0FjRjlPY0JtTllkL2RGeTVjeUt5WHBaRllmdTQxK0VBTGNCR055TWtX?=
 =?utf-8?B?Qk5oeWtMV1BERGxKZG10TzNvcVRMV2V2KzV2aEpzZU1jeEhzQVJybVU0VTJY?=
 =?utf-8?B?b091TjRRWmtXRGZvQUZrR1hxLysvZ3JseDFXUERBUVBhUlFPeUdEVXBXSVlw?=
 =?utf-8?B?cDFEV0toNThTNG1rTkFBRWEreit1SW1mSDlpODhIQ09BOGI3SDBaZndGTGVr?=
 =?utf-8?B?QjR1bVZQekVSdVZuWmNobldseWpYWUtXL0NMbkJEQ0xvOUsxSUdyVGNjcmNF?=
 =?utf-8?B?TWpWTXRvSHBZdExHaG5VaUNOYXE2cjlqcGNQU1N2eGpLdHh4Njl2TDFaRS8r?=
 =?utf-8?B?Y1QvZWsxTk9QNTdRLzdwQVBIbVVrNDVOeDdkN0NEbTJzcGp0SGZEV3M3ZXRL?=
 =?utf-8?B?Y2F2N0NSL04yRmtRaVVBVmg4Q1Z2VHpoWWdxZWQyT2J6cWNtZFplV2FmZC9z?=
 =?utf-8?B?MFVJeEJCV3I5NHEvWmhTU2xxNlJZVmZBbVZGR21YK0pJZ296WWhOSS9nVWlk?=
 =?utf-8?B?V20vRGZINCtnTWlwQ242SUxKM2pVV0oreGlJWVNKcFpnbWp1UENEWEw4L2pI?=
 =?utf-8?B?K3hhTFBCd3N3bGNrRElQYzJ3bFVtWGtYWWQ1bCs4MGM2K3diZlJqRFAvYUNo?=
 =?utf-8?B?YVAyeXUwT2hEbTZLWDlKOXFWS0tCTXJiK0xlS3lWT2c2V0hkVlRadnlsbVN2?=
 =?utf-8?B?QzFFTmVOK0ErNlZEdE0xdGFaSFM5bGordzFiMmhQQVVsYm1OL3lneDZ0MUQz?=
 =?utf-8?B?WTgwM1hVSXBXMTM3dHN2YzRKWHo3amNHR1ozdGF4VzlBdFFtK3JJbk1uNUZQ?=
 =?utf-8?B?cExvUllSeW5USnhVVnJPSHhSMGZ2Um15amIzaWROdUJJWG1PM1U0VUkzT1RC?=
 =?utf-8?B?Z2FwczJhTkNXT3BtSi9Bd3puQnZSTGtWbWtvaWo5WDZsMUsvTVhudzczRllH?=
 =?utf-8?B?TGFIRXZCSzVkeWkvYmxqMzdPRVJic1VGbEk1ayt1VVdNNjdtaFYvKzRmYkJs?=
 =?utf-8?B?WXJ1bm5BZk5pYWVaK0ttSnZCVXhpdGxvREY4eGZReWVMWi9KNHdWVTF0elpM?=
 =?utf-8?B?eWVmWUdidVNoTjhnc1F1NnRZS0hmdFMxUkdleUFsZ0w5Y3B5UkI0aDV2L0xD?=
 =?utf-8?B?OFFvejhuYmhXY0xLd1picXBzK2tOVWxTdjNKSjI0amVpbFRhT1dHNGpqeWJS?=
 =?utf-8?B?V1N5OWxnR2hwcXpUR3lsd0NMcHVwODdFQkgyRU9WNHR3ZXFSMDNaRUlRWXZJ?=
 =?utf-8?B?SnlMTTNqbUNZK3FpSjB3VlZkVnZHT2hmdmJrSlBHditGT1BJRW9iOHFMWjJS?=
 =?utf-8?B?SmkxQkI4eVZ1eUR0RVdwSkNoWHdXRWhCMlVZOVB5aHBrQkZDNUk0WTRQYWZT?=
 =?utf-8?B?dUl4RzR5MThuN084M29NSUxZMStmSW9IdDdTZkZHdTdnZmFIUEQ1aHV4NGdS?=
 =?utf-8?B?YTVNVWRQdUhUY0ZFVEN5a3BWZndja0xxVVJEdEpEZEcvenY5eEdvQ25XRWVF?=
 =?utf-8?B?YzlYc1Z4dHRwblhxb0c3MFlNYjVGSExYcG9VWmIvbzcvT1lWbEVxUWN1c3Q4?=
 =?utf-8?B?dHR6UmpzVzYrK2hwV3lEQ0MwQ3BRRWMzM1R0S2hsYzYzY1VpM2ZHTUpDWFFa?=
 =?utf-8?B?T01sZ0l0TnpYTW8veTh5MXRCbmx5YVROb3lUTWg4NWRXTzhXZjRMVzd4SmJt?=
 =?utf-8?B?c3VEQklwVUFDQmEyL25sNTRxODQ3TFlVcmtRMGlnd29DcjNyWkttc0VJSFAw?=
 =?utf-8?B?Tm1NZGQ1QXloTmVVc3VJRTJzVk1XYjVYeHd5VmRzejdjUlNudUF5NFRzd0V5?=
 =?utf-8?B?Znl3cHJsVGRlL1RrQ0N5N01UYnpFWmdGWkRWclhORGpRUU83MFQ5aVZmb0xl?=
 =?utf-8?B?VjdJTm1aMFdIcm9YSndMV3FKaHI3cllPVVVXTDZoaXZzdmRoSVIxREhNc0ow?=
 =?utf-8?B?OGdsN3JxZUhSV0RaSHRIMkxuZmxHeGdZVVJxWG9HQ0ttZzJRUFN5cFc2bG5B?=
 =?utf-8?B?VkJ3RUM2NFlZbWFVVmFlWHJmQy9aaURrSlJMOE5zUTIvQ3crenZ5ZU1sQ0ZB?=
 =?utf-8?Q?xLys=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7240ddb7-4fca-411b-2026-08d9d0316fd7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 09:55:00.3604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: alGKcdJR272V5DMu0CQqqX8e2zKk63I+f0ykQGSWadsaxkq4mHgXl03wISCQwrkM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3729
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
Cc: horace.chen@amd.com, christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/23/2021 3:35 AM, Andrey Grodzovsky wrote:
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

The decision to schedule a reset is made at this point. Subsequent 
accesses to hardware may not be reliable. So should the flag in_reset be 
set here itself rather than waiting for the work to start execution?

Also, what about having the reset_active or in_reset flag in the 
reset_domain itself?

Thanks,
Lijo

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
> 
