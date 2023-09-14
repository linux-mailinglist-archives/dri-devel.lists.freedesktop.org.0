Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AED679F883
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 04:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2747F10E4EB;
	Thu, 14 Sep 2023 02:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F188A10E4EB;
 Thu, 14 Sep 2023 02:56:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qej56RZ+AL+35FeWt419sVcS1+5WZhbqyHHJQEirh3xAxVZ/D8jg9NsB3IxWvQZbErYDfQbWvgEbA/tesMWV1DsZmQR8WJqHUgUajScOmBuXxE9CujOGhDcfmDIYh+4cMZsyzbgXbq+x8gDou5P9WQIKJ+Yt5ey7MGcRFLhBUVtQkC8nJUGSwMzyhFAC8vOHAbZSoYM9O6LBCI+GXUOI0IiaK+3lQTGeBBXdJdJ3igcQPUAbdtSI69PUJ3Xd0keOSDZr5pE5qCzznG9qNr790Lx2esfh+KzKyOabfmHtGG6oCwLBlkM5yNLImyPKd7eBGAOUzXgq7ulK2Sv+X4ag/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPmO8db4grVQSYWFwibThTUkjumOFjcTuHypimrA8pA=;
 b=IpA9FToV0xm88HkBiJNfV159XeZrwP39twXku0jJ2Mv7hoZkNwGUtqrsMIRKUJn6SUVHmlrYmCo/joghGrs28YV+b7VY3RIgryTLtWuqD6R23W2Lkzw2atXJ83Iz77U2j+cjLRcP8LnKEu2jylj1MxldDhbuLaxIkf5ETpnjekOGOzThoSoBlCClr+7H3uaF13xDqlNBP58ywloJ9TVQKPvOT2YYCdTorKSnFBQWawWDuuIrXwrIjkg6VeotxUfpcA527vQUzS28pSWsFwCIAa0Y3gIp2uczrAAHSqS3XtfXLyogtMcsq5+sZnsSZK91YGrO6jyJn++P2uBYl1lRPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPmO8db4grVQSYWFwibThTUkjumOFjcTuHypimrA8pA=;
 b=5a0M/uWTveqCS/KzCtblKWd4kqtdz7ZFUa2z/Ph2KrU5ThmB9EOkBax42Lu9h47LVQsd7phYIMZuSjt5jhK+i7KZxeOcu4z2g9/x1COqJP9/qUIZSpakBe4tSYHPesIasxCIwiPWYno5GmsCzHPIfjMU5Wo+TsRV789bdFX6SqY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 BN9PR12MB5164.namprd12.prod.outlook.com (2603:10b6:408:11d::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.19; Thu, 14 Sep 2023 02:56:14 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6768.029; Thu, 14 Sep 2023
 02:56:14 +0000
Message-ID: <ed3aca10-8a9f-4698-92f4-21558fa6cfe3@amd.com>
Date: Wed, 13 Sep 2023 22:56:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.2.2
Subject: Re: [PATCH v3 09/13] drm/sched: Submit job before starting TDR
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-10-matthew.brost@intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <20230912021615.2086698-10-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0094.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::22) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|BN9PR12MB5164:EE_
X-MS-Office365-Filtering-Correlation-Id: bf67a203-da74-4c2d-adc9-08dbb4ce28d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p+FF819T7GWmjr8HKdq69KURz+Nc2W/Xlj6hDKK7qk+e2Va2kkCXMVxDCK5TTnMuTfK/4PoHX3ru5Sup57Hj/K4/CqU+YW9SO+yk3dIPE22Vs0e9Uq4csZNLzfl74cEjEd/2wwGBTsRxwnwACDqpINW7VUNRodoXLnk2gppbfnqj++m9lpZhs40xhPml8uup+8K+vIUoq6+/C+LTHvUiGZWiv1Q9YufWnC0h5dXx8LER1mcQmc/LHvvOskRrJzA2FFsGeqgh6Whsp2iMaR+JZhv3Mk31jk0ZGXOLcM0+jIT5xflz4LCS/lixBR3URnKdmZZOmYBuJN1qHIeEOEgJrPcP5gFJt5Yb61epZFM1Izy1l09ItHAHkIcOTgE6Vi3mYKEzdx8N+KSlZXNNdJ/Z73C5UjzbNir6Su4veTqAxpZX/ylVA7hEC9HeBd2QLBvkh9UVzgvMGqmzX0sDuMcrL/kdUJItY+yxGGScGLaO3YEEaxN4lVxOakCzJ0Ym7VWc0oLj/lh5oXoEU1abpQGJpitmy7npOqXVWJXNPmmffYTm/itY5f30FfFsvQ842/aj5YZBWwXcbg0cqYyUY4xKjpwzL5P+XIx+FPJmTjEXBY3S9XOAHQ4k7DuPuDhni7ilr2t4ExoW+k73+J0mgPjAwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(376002)(396003)(136003)(186009)(1800799009)(451199024)(53546011)(6666004)(6506007)(6486002)(2906002)(6512007)(478600001)(44832011)(83380400001)(26005)(2616005)(7416002)(66556008)(66946007)(66476007)(5660300002)(316002)(4326008)(8936002)(8676002)(41300700001)(86362001)(31696002)(36756003)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVVHdThTZmZmSmRyYkM0bDRqUXBQdXg4UkM3SWJLaWk4SkhjL1R1NXVuWS9a?=
 =?utf-8?B?QmVLQW9TWDhtVElIYUhjMExyYkFBNnVNOTdGTFdjN1dtUTR0VE1yMWhuVlAz?=
 =?utf-8?B?amxwWEE0d2JmRUJEVUpWT090NUs1Uk1ic3Y2Qk5FTjR3dmRwSzVPTFdpQ2Iw?=
 =?utf-8?B?WmxtbkZuNko1eldqUTBqODF2d0gvMlkxZEhwdDN4VHlUVlFlMENscGE2cVFY?=
 =?utf-8?B?ZEJtTWV5eFhOaXJCNHEzdmFnd2RqdmM5N1lyNFFLR0RxNXJ1L05aR0NNTlJp?=
 =?utf-8?B?QVplR0p4OGlIUUdsWEpZMktiRENLV29rZUIxNTNlcm4xMUZZRzZoeDlqaDgv?=
 =?utf-8?B?cjVwSzZzV1l5L3RrTXlTbXNJNkQ3dHZ6MU9vaU44M1MzS2MxUm9kYWpCU3VR?=
 =?utf-8?B?WHM0M1VtQUh1ckpua200WERoVXIzZGg5c3MwZ1V0OUJ0Y0xWYjB6UlFFUzJF?=
 =?utf-8?B?azhCWTlCQ3p3dGNldWhxVjd5VVovTFVPdm5TZXdSaTRBa2x5eE1sTVVvUHlj?=
 =?utf-8?B?Uk1hOGZFUkx5RnJwWEV3QzdyWGV3azlMdFFYcThTMTRBQjJtZ2xTc2k5MDNh?=
 =?utf-8?B?dTJUQ0NOd1kvbmFMcmpSSTdudHNDL0dTaGd4bmRXL2dXTHQxWmlydnBWQ3Iy?=
 =?utf-8?B?U1d0Z1JCT1JBQnNSVVM1S0x1NXAyZmVVYlJUVGQrNUdwUkxkR0RkZHQ1dXZC?=
 =?utf-8?B?RUVSVzZjN0JFOHZiWit5VS9zQ2RYNzRQeHZkTTI0aktUTFo3TCtFTjkzOEpH?=
 =?utf-8?B?dUIxdEF3RXRhRk9yZkdScjVrMVJMMHllUk1vck00cVdDbU1hVk5MTGllZWdN?=
 =?utf-8?B?dGhyVjFLMXNzRlBlVzd1OUt6aFJyRk1NK1p3UTh2a3dORVBxZytPVGJxM0d3?=
 =?utf-8?B?N0p6MHEvNmNxVUF5UEROekNwL05va3orWEVDUDR5eFAybXd0eTZPVjIwMTQw?=
 =?utf-8?B?YjBobVlGT1hMK3VOWld4RzE0ZU1ZcGpaelF2SDlpR0hKTGhhUVhIUDYyeEFC?=
 =?utf-8?B?bUVIUmdUUklsaGljMW5DY1JSL2YvamF6Yy9vL1NjLzRhdUN1aHZhYW5NMWkz?=
 =?utf-8?B?blpNei9kK1duNUVnam9EVXpid2VsUUx0eDFJUXhUa2RLWTRBd1FiZjVBcWty?=
 =?utf-8?B?ZXZ5RHkvaC85RkIraU1CTnBHbWFuSnJ0S0I0cmJBNWJRMW1GWXZVZkQ4VHZk?=
 =?utf-8?B?VWlYUC9JemxkQlczUStGM2Y5aVl0eXRac0F5U2IyS1MrT04rMXhXZStjRGpH?=
 =?utf-8?B?MXNSWFBWelhQSlZJOERBdEVtblp0NjZDS2VkMmpTekhpUkRoTFk1cEdpRkZk?=
 =?utf-8?B?RHlqZVN2Zmh3VkdWeUdGR2pOazZKQ3FUaWIvNUVnOTR5SjR6OFRJd2p0TGxC?=
 =?utf-8?B?U3lhZlZqR3FRM25zanNpbkxEVmx5cHpjakY4ekRMeWhpek1QZmpRRkI1aVpa?=
 =?utf-8?B?aHZiUHo4eFBjT2Uxc3JVclAxazM3alptdlptVDFMdCtLcURNQzBSRzE4UWVu?=
 =?utf-8?B?MnJyN0hpMlJNZHIrUU5pb2htYmlPQWVzTVJYakUzeXZ3OWt0RFp6VWxnelcx?=
 =?utf-8?B?UTM0Vk9VajQxZnZHVkVDenUyWi9lZkdpcW9VeDRKcERNRUpIOUZyL1ovK0Zu?=
 =?utf-8?B?TGdjL3lsdVZoNGRJRFVsTzJkSm9ZY00yanVCVUtMWmpXY2duaFN0TGZVaVBC?=
 =?utf-8?B?MzZ3R3JSOFZJalJRdmZoWWRqZmpET2Izc3FocG8yZGxTUENSRUlMeC9PK1dG?=
 =?utf-8?B?THFNeTFyVW1HUHBDZGlxT3pYNmw4SHVpeG9GOEd6dWJKMTVPbFFsbVAydEh0?=
 =?utf-8?B?WnBqU2pmeXFVbkc2Z2hMbnFEYnlaOUM4V09WTUVKNkFPYTZMeTJ4dDNnVXFP?=
 =?utf-8?B?NmRHT2pHOU9Mbk9IYXNjaGdMVjV2WXhjcGl5cmRIS1c3UCt3cHVDWnBpMk05?=
 =?utf-8?B?MWg3MmhqUGY3ZThPYTU2enI0NHl0UFZ0MmdJWm9tY2JNSmRKQzRnanZhSy9S?=
 =?utf-8?B?QmZTemloK1VmdlIvYUd6bDVkZW5kd2VpSnJ6SytRdlNKeGt0VjQwYnFuSEZ0?=
 =?utf-8?B?aURkOFNwNS9zS2h6TnM2c2hQS0FlVjlRNWN0dEVrWXI1R256RVV3LzdQY2xM?=
 =?utf-8?Q?zjmYqE6r1zdLmDGMhm/teZtkw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf67a203-da74-4c2d-adc9-08dbb4ce28d5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 02:56:14.5541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F1BG7/WMRVMh6t9T/wlntEFb8/LIUvsDBUW41d8eNB39H/NIhlAPoS8Q6KtBFKOW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5164
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, mcanal@igalia.com,
 Liviu.Dudau@arm.com, boris.brezillon@collabora.com, donald.robson@imgtec.com,
 lina@asahilina.net, christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-09-11 22:16, Matthew Brost wrote:
> If the TDR is set to a value, it can fire before a job is submitted in
> drm_sched_main. The job should be always be submitted before the TDR
> fires, fix this ordering.
> 
> v2:
>   - Add to pending list before run_job, start TDR after (Luben, Boris)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index c627d3e6494a..9dbfab7be2c6 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -498,7 +498,6 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
>  
>  	spin_lock(&sched->job_list_lock);
>  	list_add_tail(&s_job->list, &sched->pending_list);
> -	drm_sched_start_timeout(sched);
>  	spin_unlock(&sched->job_list_lock);
>  }
>  
> @@ -1234,6 +1233,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>  		fence = sched->ops->run_job(sched_job);
>  		complete_all(&entity->entity_idle);
>  		drm_sched_fence_scheduled(s_fence, fence);
> +		drm_sched_start_timeout_unlocked(sched);
>  
>  		if (!IS_ERR_OR_NULL(fence)) {
>  			/* Drop for original kref_init of the fence */

So, sched->ops->run_job(), is a "job inflection point" from the point of view of
the DRM scheduler. After that call, DRM has relinquished control of the job to the
firmware/hardware.

Putting the job in the pending list, before submitting it to down to the firmware/hardware,
goes along with starting a timeout timer for the job. The timeout always includes
time for the firmware/hardware to get it prepped, as well as time for the actual
execution of the job (task). Thus, we want to do this:
	1. Put the job in pending list. "Pending list" means "pends in hardware".
	2. Start a timeout timer for the job.
	3. Start executing the job/task. This usually involves giving it to firmware/hardware,
	   i.e. ownership of the job/task changes to another domain. In our case this is accomplished
	   by calling sched->ops->run_job().
Perhaps move drm_sched_start_timeout() closer to sched->ops->run_job() from above and/or increase
the timeout value?
-- 
Regards,
Luben

