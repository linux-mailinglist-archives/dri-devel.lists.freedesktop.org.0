Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8986E357CEA
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 09:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE496EA14;
	Thu,  8 Apr 2021 07:03:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3716EA14
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 07:03:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLvFkJQvSBivqcv4+lH3/DWYyMVYLk0AQzyAMlTd/kCdYxj9xJSOLFaqpIP3EYz0ReXfHfI6VEzxT6NOIdtFKZJMVv47NRoJSA1ZNDFt+UOe/AgnCFXkPQ189z3gxxeTzk/Tg1HDi4iyovctFYOUqtlDk2dg2HT+UPHrlPteD4Vs3YTPDjYKU8Y1Ay7D/7S9/Mg4NNDf7XRvjNRyly6NQNc4a7CQBHIFEtC4PTILo0Q8no+jGTQSAE+PJFX2psXdfLXRSylHj99V09HLZCLQl6x3GX5bbJ3FE7Qga9O02lhOhNqYgqHNXhJXPW99dnYd7vfYCaig3iBf8Nr8SCptGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qhthWB4S+6/SbMTzVdA/jlsakJkx9AqrLe1se0moU0=;
 b=IkqDKJsHOlLNZUOv5kICn1wsTs8KOXw6CA/3cBd1jc3uFKOZ4U+8GoipJ/sk34aTmQBXr1q6H2IJT/gA7HTwL8YtiKqBT/y/HFMpRQlO9w8hp9/5T6iArqzHD91dFS2+YVOZru+ZdQqF6Ibo58IRukShZBOt/T6gHdzkdKwCPzIgNZrS6OmBjtignN1BlA17lz1Eb8FmIRAL7UW1ns0OZnKtztOpq4xLPeUbL21pArROGV5D4pYXpS5/1/XTvaO2Dw7L9aSb+5fpSmfrt7wYdKMeTL3mGnPWMtZLzOTpnCVLG/AnXe9aIw9t1QDZF1qq8KVrZEWKD06O/aowxpFYXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qhthWB4S+6/SbMTzVdA/jlsakJkx9AqrLe1se0moU0=;
 b=rmuHzawCDQKltjvHALqZvFsedrwOcylJLa+B3cnP5e/m1jvTjUSqdkSeiRJIoR8eXTadqykAw+WhnYwTf8FH/afrdsbrWRPe3zM1jeGqjK4GY3ZRMUbeLMQQxL1q8QUsmuESKmd1TMGdzZd4RAtqylc3zF8qidJ7dp8ZNaS/BiY=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4739.namprd12.prod.outlook.com (2603:10b6:208:81::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Thu, 8 Apr
 2021 07:03:00 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4020.017; Thu, 8 Apr 2021
 07:03:00 +0000
Subject: Re: [PATCH] Revert "drm/syncobj: use dma_fence_get_stub"
To: David Stevens <stevensd@chromium.org>
References: <20210408045926.3202160-1-stevensd@google.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7f22ac22-dbe0-f056-b7db-24fa60f9724e@amd.com>
Date: Thu, 8 Apr 2021 09:02:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210408045926.3202160-1-stevensd@google.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:38f:e031:7d24:433b]
X-ClientProxiedBy: AM0PR02CA0139.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::6) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:38f:e031:7d24:433b]
 (2a02:908:1252:fb60:38f:e031:7d24:433b) by
 AM0PR02CA0139.eurprd02.prod.outlook.com (2603:10a6:20b:28d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 07:02:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78be2d5b-25c9-457b-1c10-08d8fa5c5851
X-MS-TrafficTypeDiagnostic: BL0PR12MB4739:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4739EB6908E7AAE5BB81539483749@BL0PR12MB4739.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mytIJbp0cN5Px4BbT8NmTtd9sPug/NXH+WBb+nqBE3mwAgXMJ+1qWDEe/yW1bkBBTAEEFO9tpwDiBRCUiNOnUgk0M05IRoXeYTKkrUC74bQ1c0nhjFu8p1JZdGzs7oeVnJVAp9CUS0RvEC5gAbzc283E08REciYMvUGPTsELVgeHjByl3zdDVJOfj1ilhIBl2yHwI7T2Ro3dY+9aimBofkFtXFy2+teBMCxxcNen4XWFD370vb+bP7J8JJ02HwPMMo656vWshpL7ZwYCAytJEAsNcwK95fYgGJ+sgeG+xwBXfU9lSKrAhCyfd1x/Vh7QLKvNW1yvDRKPhgB69D7jAslI9EOWMANBTym466fYO1w0ThnpFOsVr/BC1UVeIxFl88iUcCtzMaa19eBo6rnGtFF3xCux/+qmH2/tCphpqdMzaeGg/mek1jcQAZdX6h1yC9dUwBF5NhJycpQIn2cphSVYo5Ldk9Jb1EtK14uRUvchP8h9kaZJhdRdcddNwiaHqei7Q+DG/jybLAIUJmCzCN5PtVDWlH0TChFwCjXD4TFNx0w4eenTiA6cuBF5NaPcrzLMczAObFRkFby80L/VtVRwg+CaRPnB/b8C/Yf7tolOByXjdeMzSo0vZY1nkHGSr7JQchTwc/td0ohDjKIkZUrUVGb/GbjA4QzLRczchyG+Prumor2AMzDh4JKcSFJMlD03aggYXu0iqii24BxY/qrQyEcsgKbstvA6XRbfIOQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(52116002)(31696002)(31686004)(36756003)(8676002)(66556008)(83380400001)(66476007)(478600001)(6486002)(6916009)(16526019)(2616005)(316002)(38100700001)(5660300002)(7416002)(6666004)(2906002)(4326008)(186003)(8936002)(66946007)(86362001)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aE00MEZwQTUzd1lxdm5MclJoTC9td1phUTBieE5tcDh2bHlURlkrekJpNUF5?=
 =?utf-8?B?bzc2Q0FvaS9OY1NXdFh4NGxDZGtXbUluTk5BeG9nMjVFUmpudTlhTm80VnJm?=
 =?utf-8?B?aDRrcWhhdDU2YXV3ZVJYL3RJTUkzMXlpeXl0bGJCeVNJd2pIakJrL3RCeGdM?=
 =?utf-8?B?WVFzaTlRN1NCdkFMK3NLNHJ3ZE1iYURpdzFhaHpuaWJIY05RaEsveHphc0lt?=
 =?utf-8?B?K1hnSWZxYklEVVk3a2NsaWRzN3VXTU1zN2wxZGFlNHhsU1Mrd2twU0JpUVJp?=
 =?utf-8?B?UldJL3o4N1RHdjJ2djdjVFo1bmNXQVE2aGRISWZ2djV6SHk2VVZ3d2VxTU9T?=
 =?utf-8?B?eGV2VGlBMmdhQUx3c0s0UzkvcmpkUVRYOWQzd015VlBLeiticTFWb3ZNbm53?=
 =?utf-8?B?ekZVWWdaUUUxck40OVc5T1k1MFRtZm5iUWswZ3NESVl5WFN6eU1TWVd1Tm1s?=
 =?utf-8?B?SmtydVpRaS9oSkRQSUU5SklKUzB2cGV6TkZYeUZub01xOW5adHBxNVRlK05H?=
 =?utf-8?B?ZnU5QWhFNjhMZzliMHI1YVB1a0x4eHdyOTM3akxwK3RFR0tDRXlLUSswOUtU?=
 =?utf-8?B?M0l5SktSNE44bE5sSU5hUElpTExQSlVONmJ4b3dJd2RSSmZlMlE2RnM3N0F5?=
 =?utf-8?B?Wk1IVUNRTXJNT2VBZWdvMmQ4Umw1N3BKME80VkV5RE9UaGpQWVBhbm5lSVBR?=
 =?utf-8?B?ZDNLU3Vxb1FpQnkzcW5wSk5uL0M3TUhXbnd4bWRMQVJ3bkQ3RTRjK0Y5SHBr?=
 =?utf-8?B?Z0JocGpRT3F6VlBoNlVjZnZnYzBJZUppb2JyaUNsNTBlamVIVVFFbFVldnlE?=
 =?utf-8?B?bGM3Y0hLcHNsTzc0aDVKR2VoZFp1N0RLZ0VzZWppL1pTRFRiVHZYbUphSEdQ?=
 =?utf-8?B?K3l6bjB5c1NtOTU5LzJOZ0FwMzdKVC9pZlRXaFYrcXF6MDFMYWRTMEFod2tO?=
 =?utf-8?B?aGZJWEhvbzJ4QnUxdlFIeFBmS3lTTUVQTndRZnpPN3FwVkVXSnRaSVdtVUpL?=
 =?utf-8?B?SERhTGxSZzNYWVJHN1ZJUWl4UkhjbFlXeXoyUXMwSzBsWUlOanFVN0lBclVv?=
 =?utf-8?B?MUNvNXVMRHVIbnZGZjZ6S0V1cDk1c1pCZ04rSjNvRlp5WE1RbkdWd25mK0tX?=
 =?utf-8?B?NTVUT1owRDB3ZTE2OFVrV1FTbGYzNkRGdS96dW5acDF4Wk0wbWZ5eGpmaDNx?=
 =?utf-8?B?dFJOTGV6R0xuZnA3TVBya0t2WGlSTlVQUXNtSStmWTFnQjhBVEo5Q3ZweHFz?=
 =?utf-8?B?OEFoZ3M0MERiRjF6RERnWXk3YUF1VmVVcm5xWHJKTDhId3N6dGl5SUdubUpL?=
 =?utf-8?B?U0c3eTQzZTBKSkxnTjJPTzNPdXhQUzRvT1pRK3FUMmVuajZvZXNJSEFyaTdv?=
 =?utf-8?B?YndaZHl0REFTdDJFOWRFZWN3S3BmamRna0lvdVRjUWxXTVRhdkVzc25RU1VT?=
 =?utf-8?B?TmMyVTY1Uml2WnJYVWpzbndXT1phRElyUFloeDJkcTNpVWlVUnpPRDZlN2p1?=
 =?utf-8?B?TmZ5SHA0UWNxSGVqVHlFWDRBenF6WkZLOEFTNG8yemMrUHpQY21BL1RSRzFP?=
 =?utf-8?B?RGJCZnFteUlyZGM4YmVCV05TYkI0eHNpRG1OR2JXUWNJT3U5bjB5RXp5anY1?=
 =?utf-8?B?M0hIRUNOMkNhSituakZIdXlQdy9GZXREaCsvdDRqVzlKWDB0cEUvYVNidVQ2?=
 =?utf-8?B?bDB5N0QyTG1lQkN0MkRZUlVYUHNkRFJxSVBjNFVWd2V4ak1SNkJUMjVmN0RL?=
 =?utf-8?B?WmxJOXg1TVQySjlwYi9JQ3h6d2RPaEZwSkhBZEIxdGR5Um9kNTFqTTJhUFFE?=
 =?utf-8?B?TDVCTlNrMUlsY2RsUDVEUDEyckgzdUJHSHdvMWlyQmNvNzRWblJOdUJxV25G?=
 =?utf-8?Q?noFFI0zBfOHe7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78be2d5b-25c9-457b-1c10-08d8fa5c5851
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 07:03:00.3808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5idLa3e+2Ueb7SJZX/SUGKXYgRXp1pzGR/xIf1CcyZkaghG+TC6Dbv0PWlccdNUV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4739
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

Am 08.04.21 um 06:59 schrieb David Stevens:
> From: David Stevens <stevensd@chromium.org>
>
> This reverts commit 86bbd89d5da66fe760049ad3f04adc407ec0c4d6.
>
> Using the singleton stub fence in drm_syncobj_assign_null_handle means
> that all syncobjs created in an already signaled state or any syncobjs
> signaled by userspace will reference the singleton fence when exported
> to a sync_file. If those sync_files are queried with SYNC_IOC_FILE_INFO,
> then the timestamp_ns value returned will correspond to whenever the
> singleton stub fence was first initialized. This can break the ability
> of userspace to use timestamps of these fences, as the singleton stub
> fence's timestamp bears no relationship to any meaningful event.

And why exactly is having the timestamp of the call to 
drm_syncobj_assign_null_handle() better?

Additional if you really need that please don't revert the patch. 
Instead provide a function which returns a newly initialized stub fence 
in the dma_fence.c code.

Regards,
Christian.

>
> Signed-off-by: David Stevens <stevensd@chromium.org>
> ---
>   drivers/gpu/drm/drm_syncobj.c | 58 ++++++++++++++++++++++++++---------
>   1 file changed, 44 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 349146049849..7cc11f1a83f4 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -211,6 +211,21 @@ struct syncobj_wait_entry {
>   static void syncobj_wait_syncobj_func(struct drm_syncobj *syncobj,
>   				      struct syncobj_wait_entry *wait);
>   
> +struct drm_syncobj_stub_fence {
> +	struct dma_fence base;
> +	spinlock_t lock;
> +};
> +
> +static const char *drm_syncobj_stub_fence_get_name(struct dma_fence *fence)
> +{
> +	return "syncobjstub";
> +}
> +
> +static const struct dma_fence_ops drm_syncobj_stub_fence_ops = {
> +	.get_driver_name = drm_syncobj_stub_fence_get_name,
> +	.get_timeline_name = drm_syncobj_stub_fence_get_name,
> +};
> +
>   /**
>    * drm_syncobj_find - lookup and reference a sync object.
>    * @file_private: drm file private pointer
> @@ -344,18 +359,24 @@ void drm_syncobj_replace_fence(struct drm_syncobj *syncobj,
>   }
>   EXPORT_SYMBOL(drm_syncobj_replace_fence);
>   
> -/**
> - * drm_syncobj_assign_null_handle - assign a stub fence to the sync object
> - * @syncobj: sync object to assign the fence on
> - *
> - * Assign a already signaled stub fence to the sync object.
> - */
> -static void drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
> +static int drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
>   {
> -	struct dma_fence *fence = dma_fence_get_stub();
> +	struct drm_syncobj_stub_fence *fence;
>   
> -	drm_syncobj_replace_fence(syncobj, fence);
> -	dma_fence_put(fence);
> +	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
> +	if (fence == NULL)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&fence->lock);
> +	dma_fence_init(&fence->base, &drm_syncobj_stub_fence_ops,
> +		       &fence->lock, 0, 0);
> +	dma_fence_signal(&fence->base);
> +
> +	drm_syncobj_replace_fence(syncobj, &fence->base);
> +
> +	dma_fence_put(&fence->base);
> +
> +	return 0;
>   }
>   
>   /* 5s default for wait submission */
> @@ -469,6 +490,7 @@ EXPORT_SYMBOL(drm_syncobj_free);
>   int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
>   		       struct dma_fence *fence)
>   {
> +	int ret;
>   	struct drm_syncobj *syncobj;
>   
>   	syncobj = kzalloc(sizeof(struct drm_syncobj), GFP_KERNEL);
> @@ -479,8 +501,13 @@ int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
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
> @@ -1322,8 +1349,11 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
