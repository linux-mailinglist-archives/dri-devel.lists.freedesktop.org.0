Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C0175472F
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jul 2023 09:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827CA10E034;
	Sat, 15 Jul 2023 07:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C416710E034
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jul 2023 07:14:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRL6D2rKn1JJ7qtdDPKCS4Os92CdHixmkyPLmOnlIFFWApIDsO49J/8mW90ouY3A23CK+ttWDE5vA2lbKtZC1/4m8evKtwNZLRJfElkirrFiNz8m0xhS9dYukxRmzVGoPZ7A1Sj+w3z5LslFfW76P4gvE31TtGM9TQz4lHvrKIsiq2rfqFOZ9nbQudocHQmwQYvmGJN94UxJT7vtVY46ja1Q2fUKb+DPvhoiAXHQYcmWDw9lxjrMaV66rFGqTNUG0CdTjoEwL0x7sYK8BacdYc/+WMK2FxQ1DboKaLvMS6Dg+MsQf9n3IxITLlWOxE44WQ4f8yZcek8mXf4Owe3P0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04oKKV7U4+ARMpC7BdAA/IsFoC9CmOr/BUbkbSoBBpQ=;
 b=oTnDEh1ncEJwgDo9+gJ8WSMhHQsKDXWdb9AtILFsJPtwIV/pNsIe0E23FDrA56asLfK/GU9IWcobCv2bqf2QmPLoQzSA/P9ZWETosPXF5hzXhru98C/pjZWPi6erYM2FT3RrpQKDQR5GEtsrrFPgPDDRJcPcKCiwR1XaVKUUucEvtf8xS5erEVfJdc3q9NaQHV2nBjT99Qh21Nrxraduz161PhZgsd6A+0XVpCidlhpTrOmDyxQsFNuaAjSaTbqWnwHwAEDdTOeIEy6MIEWr/NZArO1cSlmCvDJm4Cx1o2O2iml1jU8Ki5kDfQFc2R1DlPKmIJNoC0jCx3M8wTl3pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04oKKV7U4+ARMpC7BdAA/IsFoC9CmOr/BUbkbSoBBpQ=;
 b=aDdUMmIX2QQGifMc5PogD0r6XNckciUkIKBr+wM7zKjLiFByeggojENzjzlv6EP/liFQl22JPAtu3lXqi0w50AUGSb/5wNJnHu09hJMXSthzdK66RVPt46EeDrZzeBiN0LytXqSkcXNxLF24zEqpofa9L3YJWxZgr4FV0yoolzA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DS0PR12MB8416.namprd12.prod.outlook.com (2603:10b6:8:ff::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.28; Sat, 15 Jul 2023 07:14:15 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::e3dd:99bb:b742:2d48]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::e3dd:99bb:b742:2d48%2]) with mapi id 15.20.6588.028; Sat, 15 Jul 2023
 07:14:14 +0000
Message-ID: <9343165f-2533-f363-4942-719ee9b7d2a4@amd.com>
Date: Sat, 15 Jul 2023 03:14:10 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/scheduler: Clean up jobs when the scheduler is
 torn down.
Content-Language: en-CA, en-US
To: Asahi Lina <lina@asahilina.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-3-c567249709f7@asahilina.net>
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
In-Reply-To: <20230714-drm-sched-fixes-v1-3-c567249709f7@asahilina.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::23)
 To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DS0PR12MB8416:EE_
X-MS-Office365-Filtering-Correlation-Id: 9efd2a40-4607-4693-5af4-08db85031846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ICZ1cfAsDfp2irzvb0+jKLzznucKKM+vyoE3SHNPht9XJZrbJMhTw5OebJhE26ypV+1z8a7zfBAUHhnvzG6R+Gdir92iKGJSUwb7QE7Qa5UaDGIgzsGsz3wGG1H98KsyuRh75a1SEk+ufPziWedFN1aUl101vcD+7LhMLcCE8dTozNsKIpVLWrpyp/aIgV29taIM0f7mn2yfXaicPPUxNS8c5hdBLYmXteeNyvlXZT9JMrA2aagAzSGe/Nihbs6Ych4AjTEAIg0agP93xQ2lDIgkQV0CbhHzeWmQLm9N6lCPFruqYUyBCakNjs3CSa2X4HYiXUgKJdVbJT+lYZb08+P7D6CGw4v/U9dN9QMbWncCMhM/4hbf0pgZqyAe5NdZsXqo0kvZbYHod0qZTWhf7NuWsD+CzQn5OkV542ikHxcHISjChbyHLTwLpueaCi19UbyXAoqe6AR6WPvRJaa4AsbWenG4s7BtkPo8pLeB2zg9hBZQ60wHpXaa4wtd2eWDJL7kAa3j3lerjGH/N09W/DzIfeuiX6BiLc0q35bCBZt6fz8wFTcn5JPxRlY+XJ1oTYGZQyDewtEPscwDkKYo2bDFCMwR3viQLp9PMSDpVav2iP5TNHo2Icc38YVCFvsze+I0dTIz4b11ePD/A2p7Vw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199021)(8676002)(5660300002)(8936002)(316002)(31686004)(41300700001)(6636002)(4326008)(110136005)(54906003)(44832011)(66946007)(2906002)(478600001)(6666004)(6486002)(6512007)(26005)(6506007)(53546011)(66899021)(186003)(7416002)(66556008)(66476007)(83380400001)(2616005)(38100700002)(36756003)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkZYOTRyRGhJT3dObDNhbEs4aTJDNHBpUTJCcDZ1RWorOEkxQVg1UUsxT2ZP?=
 =?utf-8?B?cko4ZWY5TTNDVjdtREJ0MkNKanNTdUhXV0tQdGRvSUVLWlBxbU9yU0EyTExW?=
 =?utf-8?B?eWJtZ2lRZHkrV1RqQXo3clhLQ3JWbUtaakk0dS9wc2pEd0IyOTc2ckxQbjNO?=
 =?utf-8?B?L0poZnNRNDQ5T1hKRHpHRGo4ZlREb216d2dxVjhiMldmSk5jQWVKcGR2Nzhp?=
 =?utf-8?B?Q0FEc1FmeCsrdENXQ3J4VUFHQWlrYzZSWktkaHhIL1kvd2pFMzFrTHFzaDRL?=
 =?utf-8?B?c2dSN3R6dHN6UXFKSVZ0T1pBbVRWVlR6TGM0SUFQbWJaN2J6U1B0SjZIeFNq?=
 =?utf-8?B?ak5CbWpsV2U2bHNPTzNLMUN4RWpvckJEOHJYWFkyVStQcFJIY0dwZS9SWk5S?=
 =?utf-8?B?NXlUbGMxYnh0VXRFSXlKUDR1SWhjeHBnVjk5R00wN0prZkxvMlZxQUg5UDJn?=
 =?utf-8?B?MjEvbThRTUYraG00R25ybmZDSVllSTl6S2l0OGpYV3A5c1JNeW0vd3lrc0xt?=
 =?utf-8?B?Z0RwYy9tZk1Cbm9QZmJQUC9KbUhGamtYSzF4ZndXS2Nrb0ZsMWxQVWM1aFBl?=
 =?utf-8?B?dVVZZ3A4TFhEWHRNTHN5N2V3ZjRCM1B2WkRESnhRRjhoMW9FYWk5RVRCeGJW?=
 =?utf-8?B?cExOdFVVYkw5UTZlVCt0cU05Nlo3YUpaMmN5N3c3ZGI4OE93cGk5bHlNM204?=
 =?utf-8?B?dTVDRm1IVy9yall3OUFXUnIwSHQ2K09IbE9hT2pSMFFnMDloM1J4MHVhaGFQ?=
 =?utf-8?B?anM0RzNldGtvTlFGc3dxUm00MkxhOGtvQkNvM2pld0tXQ0RxRmNKUXVlTXhL?=
 =?utf-8?B?RERzMVQ4ZnliWlFJY3Y3c2FKbElYa01aQnY2aElSdXZQZWdlR0JpL1I5ZFpW?=
 =?utf-8?B?emIvcDgvVUR1c0ExbDcvSlorN3ByWm5USnNnNkpNbUpmemVsdUtRYzdaZHVa?=
 =?utf-8?B?ckFCaWhyaE9zc25yTVdadFRyL0xXTEtuQjdlOVpFZ1BkYjFDRXU0KzlVbDRD?=
 =?utf-8?B?bDB1NVdBUkN3Z3JwSDNaRWVzUUtrWFZiTFZlUXJKQmhHWW5QY2dCSlZRY3ZC?=
 =?utf-8?B?WHBCc0kvYXRtZlZOUXcxMDkrNW52RG9DTVhmSUNWUGJQVzdKVXc1KzV2bHpt?=
 =?utf-8?B?dGZJcUc3ZU5Gb2hMM2pQejlxWjIvZkpCdXNyZlJSYUhiV3JmN0lLaXdpb1Rp?=
 =?utf-8?B?aVY2dnBZWVFGdGNsQ1RsZTRYb3NidVlURS85NHhFSkpFVVF2NjYyTmFpMkNv?=
 =?utf-8?B?TkVia1U3RFk5VW9lcHZPdGcray9NbXI2YnBkYTF3d21QVVpyQWw1V3lINVdy?=
 =?utf-8?B?Y2hXUFhQNFpyVDRuRzlpbHZET29rNkgxWTlXYW1yZkFlbDBtcHRzcmtpQ0w2?=
 =?utf-8?B?SitZeWh6VWRLSlVEVkpBc0xEZzVUZWI4VGc3QWtyWTJmOVB0VlBUNGt0V2l5?=
 =?utf-8?B?Wnd1U2VRSk5nZlEzVHpQckpSRW1HZjNBUTdxRTZYTFptemFqSGhiLzRsQXd0?=
 =?utf-8?B?aTNUS3pqVFh3OTJjeFU2R1JkWEZlNDhOZ2c3MU9HbUV1WXVNcVlXZzV3NnF3?=
 =?utf-8?B?ZUpieWJlZmNIZnJqRHZseExMMWZlelRXcnpkYUZtVytHUFZVSHFpTzl3TWJY?=
 =?utf-8?B?dDM4UzQyNW5hNkVCK0taMEU3eWVMVDZxQkU4cWRkZ1hZdXp0S2szZjRqN3FX?=
 =?utf-8?B?WUdlbHFLV0pLcWpabFZuL0s0bWcxcldiZ1VyN0o3WTFoRlpzdmx2QVQzOXFG?=
 =?utf-8?B?UzVvaUxnZms3SXBpWCsxcnNlS3g4V290WWVVSWZ3ay90aHlIVGlIME1kcUxk?=
 =?utf-8?B?aVVvTGkrSk9rZHZyU2pFTVplYkNhNkpSdVJ5N3o3ZG1DSVNSdlhBT0xyWFp0?=
 =?utf-8?B?Nm5DK09YMGRiM3FHaUtVNXNtNzNpOElGS2ZCQ1FQSmRxcGVSaFdUWDhxZzF1?=
 =?utf-8?B?S2JaaDVlcEZnUm5oWFBsNEp6cDdlajlDczhwbmozKzNJNDU4VytHdXY2SjlB?=
 =?utf-8?B?bjUwRW1BNDZWME1zM1FGMVp2WGwzRVVvZjN2TXBYRThndW56WmhrZ2plRllW?=
 =?utf-8?B?eW9QMkpEbnFZQzJlelU4bTZSSDFEa0ljWjNsYy9uOGpUTi9xL2FwNzhNRGUw?=
 =?utf-8?Q?zZ4gzujrEivxlAwmSLL/RYSVA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9efd2a40-4607-4693-5af4-08db85031846
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2023 07:14:14.4487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0yqPOyLWkvjo/K3S1S8kbUDU9Fyke+q9o7d7Ilt7tbiQ/y8ti07nqq9O7sxg/xIh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8416
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
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-07-14 04:21, Asahi Lina wrote:
> drm_sched_fini() currently leaves any pending jobs dangling, which
> causes segfaults and other badness when job completion fences are
> signaled after the scheduler is torn down.

If there are pending jobs, ideally we want to call into the driver,
so that it can release resources it may be holding for those.
The idea behind "pending" is that they are pending in the hardware
and we don't know their state until signalled/the callback called.
(Or unless the device is reset and we get a notification of that fact.)

> Explicitly detach all jobs from their completion callbacks and free
> them. This makes it possible to write a sensible safe abstraction for
> drm_sched, without having to externally duplicate the tracking of
> in-flight jobs.
> 
> This shouldn't regress any existing drivers, since calling
> drm_sched_fini() with any pending jobs is broken and this change should
> be a no-op if there are no pending jobs.

While this statement is true on its own, it kind of contradicts
the premise of the first paragraph.

> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 1f3bc3606239..a4da4aac0efd 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1186,10 +1186,38 @@ EXPORT_SYMBOL(drm_sched_init);
>  void drm_sched_fini(struct drm_gpu_scheduler *sched)
>  {
>  	struct drm_sched_entity *s_entity;
> +	struct drm_sched_job *s_job, *tmp;
>  	int i;
>  
> -	if (sched->thread)
> -		kthread_stop(sched->thread);
> +	if (!sched->thread)
> +		return;
> +
> +	/*
> +	 * Stop the scheduler, detaching all jobs from their hardware callbacks
> +	 * and cleaning up complete jobs.
> +	 */
> +	drm_sched_stop(sched, NULL);
> +
> +	/*
> +	 * Iterate through the pending job list and free all jobs.
> +	 * This assumes the driver has either guaranteed jobs are already stopped, or that
> +	 * otherwise it is responsible for keeping any necessary data structures for
> +	 * in-progress jobs alive even when the free_job() callback is called early (e.g. by
> +	 * putting them in its own queue or doing its own refcounting).
> +	 */
> +	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
> +		spin_lock(&sched->job_list_lock);
> +		list_del_init(&s_job->list);
> +		spin_unlock(&sched->job_list_lock);
> +
> +		dma_fence_set_error(&s_job->s_fence->finished, -ESRCH);
> +		drm_sched_fence_finished(s_job->s_fence);

I'd imagine it's better to rebase this on top of drm-misc-next where
drm_sched_fence_finished() takes one more parameter--the error.

> +
> +		WARN_ON(s_job->s_fence->parent);
> +		sched->ops->free_job(s_job);
> +	}
> +
> +	kthread_stop(sched->thread);
>  
>  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>  		struct drm_sched_rq *rq = &sched->sched_rq[i];
> 

Conceptually I don't mind this patch--I see what it is trying to achieve,
but technically, we want the driver to detect GPU removal and return shared
resources back, such as "jobs", which DRM is also aware of.

In the case where we're initiating the tear, we should notify the driver that
we're about to forget jobs (resources), so that it knows to return them back
or that it shouldn't notify us for them (since we've notified we're forgetting them.)

(Note also that in this latter case, traditionally, the device would be reset,
so that we can guarantee that it has forgotten all shared resources which
we are to tear up. This is somewhat more complicated with GPUs, thus the method
pointed out above.)
-- 
Regards,
Luben

