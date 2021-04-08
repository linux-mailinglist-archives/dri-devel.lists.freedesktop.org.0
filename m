Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0783F357F81
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 11:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8036EA41;
	Thu,  8 Apr 2021 09:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2055.outbound.protection.outlook.com [40.107.101.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF676EA41
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 09:42:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lqt0xRiXpnp4qHDpcY2K3lj0nPo1q6HmaJevP5zmCPoi8yYeSrwSZXwKlNthylBg0uQ8k4aizoZGg57lv4/ooTLWiTRshCKfFOotOQkOzUXUefp5JvP3b2fwM9WjBDjVpvwFbixOiQm3WQzx4c3j34PaNCl6wzcEFSAhX/DuGtZq68ksaLh2LI+5K/MUPQQy0lLyqde0/Vv0y8pLgFlBOZUQnUniRlAh/QRq33V3JQRHIRZcb3jxAMm0u6h6HgLhLsLwK3TQbu2LhpOuw9qGrXv5dM/HMf2hzmzoMs/mxL+j83zQwB68t4yue8mR+TluolBc0ZMz8CVLQMse7yIQ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0YRXYKn6Gpq4bPeBJtOfKA33NghXk8m3WIVyD8wRTI=;
 b=LOmDnzFWyGlt/ZajHBNu7ntNqcrVgc+5wy9SpNyLKQcL4aApaHUKuawBjA2yK3ugHjuU/I1OHYKVsD3mFtn7jUaYXoiX5dzttaaZTuoZxYF+59yQPH8JsAEShI+C3P7TLisC4GDE5neBwsNu7OWYn8qLxCE1JddaowZSdBUb6WRQfhSoo8iNr1QVjJuzwBTxHUqtTbCBKkxpAdkOcmnoPYV8BFTyIHuPfdYMHtUhmxFCFE0ycPAGQd8ZIU1pNyVmTc/yqWXrqlWWUEzRqjwuCvBQ67lUIMLgC/17Lq/k4RW7bSo6yms85gKrTWOnLpPHQ93ghJ46k4vkYVkxCAhOOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0YRXYKn6Gpq4bPeBJtOfKA33NghXk8m3WIVyD8wRTI=;
 b=f1uL98dHP5FzM6aUSeh+WfrxRhyRIQBBwiLlFfwABjPr479LMkPW8v2RTRSUhwFNA5AInlf1jtZPkzioQyEqm6e4aNbSgFK4Gag1YY4eYu1C+T8Vtzr1x3b1u93oKHAhj9mG9vuHLPAIMGJMOtdHrgtTZA+e3wWuUS4qcPyfl+E=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4552.namprd12.prod.outlook.com (2603:10b6:208:24f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Thu, 8 Apr
 2021 09:42:06 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4020.017; Thu, 8 Apr 2021
 09:42:05 +0000
Subject: Re: [PATCH] drm/syncobj: use newly allocated stub fences
To: David Stevens <stevensd@chromium.org>
References: <20210408093448.3897988-1-stevensd@google.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <fcc2eecf-b32d-1758-11d2-bd130f5925cf@amd.com>
Date: Thu, 8 Apr 2021 11:41:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210408093448.3897988-1-stevensd@google.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:db83:c532:1fa2:b0cc]
X-ClientProxiedBy: ZR0P278CA0004.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:db83:c532:1fa2:b0cc]
 (2a02:908:1252:fb60:db83:c532:1fa2:b0cc) by
 ZR0P278CA0004.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 09:42:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce38a724-9fbb-425c-435b-08d8fa7291fc
X-MS-TrafficTypeDiagnostic: MN2PR12MB4552:
X-Microsoft-Antispam-PRVS: <MN2PR12MB455224C3188DA01F664E88FB83749@MN2PR12MB4552.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 88aAN2uT2waHcxUkQycqKFcp5fVtNe9j8MDMy3TRGuQigQc5JzVrVm9F+UHhTDh58SU+A7yiystP7uhwdIJaMNGzSBkjdh4/O527KgbG8yevHrhazX6FsQNcLVgXpSmapUghphjfLb4mxO0WXmtFnX80P892aH4urSGj7vdFWxNi9KYO+i0kwFu0d4v0yeaJ4YhvUVORlh14+fkFtboedIDJamSPqdSuvaRaXosBlO7ziU3P7tODT+jiEdXr/SNfHBdCFBcBuJQC+2jT0tdoL6tBiUhX4uRt+bhWaR1r1G+nK9TnGTqe+ClT4dzOkpAdQozU18EJUE5vm1Qk9m3m7eY4H1JYu7NBU7TyV3oLXkjDX+hh8BJpInIp1AKhoZaDaQiH/MwmnKk7HCW5jawUm4FTiOy2G7WAb52HHHnUauT1xhNiPmYJtPvgPUqlxGsil5Xmgn1cAj/fzXggs4enbBwuOYvTKYRTOeCcsdfhqzyjUZQoHdjU16Dnbqpme6nXLUa/kJY2UnGUUk9ofa08R6FGUPGX/GJn78d+sTwGiTK4XEazM/ryPW95mdR3zMFxVvmeNhGSqEKdqibWBnUi1tSjio+pT61HMqQZg02OBzUbDxfvL62/81zibhX6tNEzLtEh5zrN8LNrusdKtBtyTUlW6tvd13Ez20VgofK5/aPrtBcypfRX8lfGmYVt337vF3GLPhg939Ly4DN0pKzr059Hpql3zFJOFeCcQ3MlIwk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(66556008)(8676002)(6916009)(478600001)(66946007)(52116002)(2906002)(31696002)(8936002)(83380400001)(6666004)(36756003)(2616005)(316002)(38100700001)(186003)(54906003)(4326008)(16526019)(31686004)(6486002)(86362001)(5660300002)(7416002)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?alluSkRVblowMGJWMisrK0dEdVVzc3E5ZUpoclgzNFhOOXp6dEduNUZYRmJu?=
 =?utf-8?B?VHFXck9meThsZHJOMThVVy9NVnU5UHBSUmNudHZoTnFMVGVJRjFJVjZ4eVpI?=
 =?utf-8?B?SU9HbzdtL05hS2Z5OW84ZmIrZlorbTVNVTlHaWcwUTJkay8wTUk5NmpYbW5X?=
 =?utf-8?B?b3ppRFdDUVk0OW5aNWZLSVpZTDkzdFVVMm0wZFNKMWxzYjk3Y3Y0ZnM5UTAv?=
 =?utf-8?B?ZjdpYUhxN1plYldIMm5iOUJ0N083QTVIWWo5elBRczRpVW40Q3hVVHl1SXNF?=
 =?utf-8?B?elphc2hTSWFVQ1BBUTViOWV2SURZbXJONFdMZ1E2T3JJT1VIczE0Zm05QWNU?=
 =?utf-8?B?aDJleE1ydWEyL0trdGo1VGJpc3Rrc3RaNTl0MjNHUzFRNmNjajgwVHRDQXYz?=
 =?utf-8?B?SE4zWHVoU1hIV3ByK3JSRWlUMkJDV0VFKzdFOXZUZzJDei91RlplWkFrN3F1?=
 =?utf-8?B?NUpERGZPSkNSQXlUdTVTTU93M2ZyQjZ0ZmVCU1Yzdm9sK0JBYmRtYUJMemYy?=
 =?utf-8?B?WU43MXkxM01hM3FoeU9ZbWJTZm1PanBCZklKa05hUm9HYlhLaXhkM0NtZGRE?=
 =?utf-8?B?TzFrT1hIY1E1eXM2MW1ZMnNKRHlZS3ZtSW5lK3JEWS9mdUh4Z0kwbWI1V0NQ?=
 =?utf-8?B?b3I5UXNaSER3amJpMkdEb21KVEwzQ1dQeUtnS0lpM0pKcStqRUhtYllPaW1K?=
 =?utf-8?B?c0lweVhLcW85OGhnd1VHZ1lrVXBJVXdZWFFXdEs5WWx3ZjdudFExTlI3V21m?=
 =?utf-8?B?YUp0RG5rbnlLcUREZlRCcUJjSHk4OU9ma0g5dWhzcHVOa2wzTkwzVjUrUXpu?=
 =?utf-8?B?L2tDeVFZVi9sRSs3UU1jVnRNNG9KMTZqcE1RNFdvOGcvRmkzSExTRXJCSmdF?=
 =?utf-8?B?bWhtN2hnRkxsUnFjWkNTYldobzhiWjY3c0RQNFJtdU1UVCt3RGgyVndWbENt?=
 =?utf-8?B?VzQrTG5VdkRQTHlhZFIreGpuSlFYQ2dYY09qODN1Nit2K0xkZ3Zma1FsanRT?=
 =?utf-8?B?by83ekMyL3ZNQ3NRbFduVENmcDIzeEtmYnpxRE1VUDVtNGhsM1pXSGVEdVVF?=
 =?utf-8?B?Z2FwSWMxd1JSN1lrLytwTjJDMVo3VHN1V0JhbGNsOFdrbnpvYXpwT0w5TFFj?=
 =?utf-8?B?bHlaSFFEQ0NObHFLQWdXcUgyWkRFQk1BVEwwQ1AzQXRqUkxua2QyRGZWKy9p?=
 =?utf-8?B?V0VsVHhjTnE0ejdQYnoyWStMUy9ObWVicThtbTBvYzlvRWFJazRnM0VOc1J1?=
 =?utf-8?B?YmVuWlBDSTY5R3p3SDdDYW5POWRqcUFJdHFtQWRoM29GWE9idHJiRWJvRnc2?=
 =?utf-8?B?NTFjSnZEd2E3ODJyMW1ZZEpMb2c1aG04YmlnMmN1TkFUaUkxSG5LWDd3L3VO?=
 =?utf-8?B?S3FRWTJpMGVsYXlNc1Y4OHlKWmRDZElueUE1cEozcDM0RFBYQ0FRSzRGclor?=
 =?utf-8?B?QTVyUVQvMEZRQ25iU2hhRXRaNmlOYklETUJMTC9uRnNlQnpOazFTUXA2Y0Js?=
 =?utf-8?B?SDJQS1IwbzUzYzU1QkJKYXpUaXF5UkxYS0tRcWo5N3U4MTErV2lLTDM2QVNU?=
 =?utf-8?B?eFEvcEFpdHc0RnJtOFRRUUV4SW5MTW51VjJTZVQrdi9VVXFHdm9JVElyelMy?=
 =?utf-8?B?NWxrbjdPQktmSmVVZnVDMXgrUlFKYldRMTc1QWoyTDBiNlBVRHdhMWNLK24w?=
 =?utf-8?B?OXlITUVIMDNCRW9uYytQMTFZLys0WThYSEJYYndzUnRDWUxmZC9UNjc0RDlx?=
 =?utf-8?B?OWVDYUxKWnA2aDZDRkRMVi8zRkxBU0JhM2M3RTI5Q1MyUlRza3BNWG0rTXcy?=
 =?utf-8?B?RGMvY2xwWlZybTRIM2NrVUpTRkE4TGdwVm1oNXdROTJYdFhTNWFUU3FtOCtJ?=
 =?utf-8?Q?l9hSqwTyAcs0/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce38a724-9fbb-425c-435b-08d8fa7291fc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 09:42:05.6938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5zYHm6Vqe0I0GwMLYJu3LzvyzbZku3VXXGwHWCFNR5xmOr/iXbSS7Ref/+xCNNT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4552
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.04.21 um 11:34 schrieb David Stevens:
> From: David Stevens <stevensd@chromium.org>
>
> Allocate a new private stub fence in drm_syncobj_assign_null_handle,
> instead of using a static stub fence.
>
> When userspace creates a fence with DRM_SYNCOBJ_CREATE_SIGNALED or when
> userspace signals a fence via DRM_IOCTL_SYNCOBJ_SIGNAL, the timestamp
> obtained when the fence is exported and queried with SYNC_IOC_FILE_INFO
> should match when the fence's status was changed from the perspective of
> userspace, which is during the respective ioctl.
>
> When a static stub fence started being used in by these ioctls, this
> behavior changed. Instead, the timestamp returned by SYNC_IOC_FILE_INFO
> became the first time anything used the static stub fence, which has no
> meaning to userspace.
>
> Signed-off-by: David Stevens <stevensd@chromium.org>
> ---
>   drivers/dma-buf/dma-fence.c   | 33 ++++++++++++++++++++++++++++++++-
>   drivers/gpu/drm/drm_syncobj.c | 28 ++++++++++++++++++++--------
>   include/linux/dma-fence.h     |  1 +
>   3 files changed, 53 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index d64fc03929be..6081eb962490 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -26,6 +26,11 @@ EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
>   static DEFINE_SPINLOCK(dma_fence_stub_lock);
>   static struct dma_fence dma_fence_stub;
>   
> +struct drm_fence_private_stub {
> +	struct dma_fence base;
> +	spinlock_t lock;
> +};
> +

You can drop this. The spinlock is only used when the fence is signaled 
to avoid races between signaling and adding a callback.

And for this the global spinlock should be perfectly sufficient. Apart 
from that looks good to me.

Regards,
Christian.

>   /*
>    * fence context counter: each execution context should have its own
>    * fence context, this allows checking if fences belong to the same
> @@ -123,7 +128,9 @@ static const struct dma_fence_ops dma_fence_stub_ops = {
>   /**
>    * dma_fence_get_stub - return a signaled fence
>    *
> - * Return a stub fence which is already signaled.
> + * Return a stub fence which is already signaled. The fence's
> + * timestamp corresponds to the first time after boot this
> + * function is called.
>    */
>   struct dma_fence *dma_fence_get_stub(void)
>   {
> @@ -141,6 +148,30 @@ struct dma_fence *dma_fence_get_stub(void)
>   }
>   EXPORT_SYMBOL(dma_fence_get_stub);
>   
> +/**
> + * dma_fence_allocate_private_stub - return a private, signaled fence
> + *
> + * Return a newly allocated and signaled stub fence.
> + */
> +struct dma_fence *dma_fence_allocate_private_stub(void)
> +{
> +	struct drm_fence_private_stub *fence;
> +
> +	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
> +	if (fence == NULL)
> +		return ERR_PTR(-ENOMEM);
> +
> +	spin_lock_init(&fence->lock);
> +	dma_fence_init(&fence->base,
> +		       &dma_fence_stub_ops,
> +		       &fence->lock,
> +		       0, 0);
> +	dma_fence_signal(&fence->base);
> +
> +	return &fence->base;
> +}
> +EXPORT_SYMBOL(dma_fence_allocate_private_stub);
> +
>   /**
>    * dma_fence_context_alloc - allocate an array of fence contexts
>    * @num: amount of contexts to allocate
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 349146049849..c6125e57ae37 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -350,12 +350,15 @@ EXPORT_SYMBOL(drm_syncobj_replace_fence);
>    *
>    * Assign a already signaled stub fence to the sync object.
>    */
> -static void drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
> +static int drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
>   {
> -	struct dma_fence *fence = dma_fence_get_stub();
> +       struct dma_fence *fence = dma_fence_allocate_private_stub();
> +       if (IS_ERR(fence))
> +	       return PTR_ERR(fence);
>   
> -	drm_syncobj_replace_fence(syncobj, fence);
> -	dma_fence_put(fence);
> +       drm_syncobj_replace_fence(syncobj, fence);
> +       dma_fence_put(fence);
> +       return 0;
>   }
>   
>   /* 5s default for wait submission */
> @@ -469,6 +472,7 @@ EXPORT_SYMBOL(drm_syncobj_free);
>   int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
>   		       struct dma_fence *fence)
>   {
> +	int ret;
>   	struct drm_syncobj *syncobj;
>   
>   	syncobj = kzalloc(sizeof(struct drm_syncobj), GFP_KERNEL);
> @@ -479,8 +483,13 @@ int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
>   	INIT_LIST_HEAD(&syncobj->cb_list);
>   	spin_lock_init(&syncobj->lock);
>   
> -	if (flags & DRM_SYNCOBJ_CREATE_SIGNALED)
> -		drm_syncobj_assign_null_handle(syncobj);
> +	if (flags & DRM_SYNCOBJ_CREATE_SIGNALED) {
> +		ret = drm_syncobj_assign_null_handle(syncobj);
> +		if (ret < 0) {
> +			drm_syncobj_put(syncobj);
> +			return ret;
> +		}
> +	}
>   
>   	if (fence)
>   		drm_syncobj_replace_fence(syncobj, fence);
> @@ -1322,8 +1331,11 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
>   	if (ret < 0)
>   		return ret;
>   
> -	for (i = 0; i < args->count_handles; i++)
> -		drm_syncobj_assign_null_handle(syncobjs[i]);
> +	for (i = 0; i < args->count_handles; i++) {
> +		ret = drm_syncobj_assign_null_handle(syncobjs[i]);
> +		if (ret < 0)
> +			break;
> +	}
>   
>   	drm_syncobj_array_free(syncobjs, args->count_handles);
>   
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 9f12efaaa93a..6ffb4b2c6371 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -587,6 +587,7 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
>   }
>   
>   struct dma_fence *dma_fence_get_stub(void);
> +struct dma_fence *dma_fence_allocate_private_stub(void);
>   u64 dma_fence_context_alloc(unsigned num);
>   
>   #define DMA_FENCE_TRACE(f, fmt, args...) \

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
