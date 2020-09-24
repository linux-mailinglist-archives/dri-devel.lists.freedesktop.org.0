Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF382770E6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 14:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352156EADE;
	Thu, 24 Sep 2020 12:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B696EAD5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 12:25:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5AHebKwfFVXz5YtMP31E/lPX0XcfSb/a1mAkSQJby9n48Bt5SX3WdRJutbpztAT4A0ALBsCHhleb2M30WPvUt7nwXw4x+B5lW46LEGnoZCMT+nO16l02bXGU9dKDWd8ivMvZuEd5cW9TGSTRFBYcd/0Fx3SEC6Fk9xRaZ6eW8B9dd6NVkVBDxdJcXpHojDo1rS6yX3IVjjSnwCJGaFJpB9Cb3vpCtu/eEnBN7o7jpUgC5XIaaeDZSOT/mNeLlGNtiw9G7UM3s3oRjci5DmwrGykL1XKuS8eP/XresTtr7eFFMBHRxETedmafjzA0Qg2C5drm7bEVaZMjm3Qrrap+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9Iwt8BrQ+XFWIJYTTytZehXuycQJUm/8F0Gv3z0xDk=;
 b=dH61RFIMs0GztHyD674whbA/YEdx8sKzEfHUxcUiJ6ZrqNieYuUWbcuvoEru/QxV3Bw7edx7YvettUfAyWGF0oPxvcF7hvjfOAubm0rPmBUWFk7Iy0s8CLvt0Gk07nQydKm6gxBf2IHBwAtP5A3TaSwQPe5YyE16ryytgMloqxoxru6JQ+q0LlD34iGCK6LzLpCnm3qFH5U81mTqniGDLKlCAwgjfsAuYM2BU0UCk1++Zkec6EQwNiNBDaQdhekLwF4/qOsVG96V2H1aEOajvRuhnHr83lOBhr0M2dzeHT7A+l08TPYGxOlOnagD407RogRyrrzk8k0dmZbQgtKKhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9Iwt8BrQ+XFWIJYTTytZehXuycQJUm/8F0Gv3z0xDk=;
 b=Q3ar3gJf8VD0aq0YYLTmFWWHMN3MxqJwtBc38SVQoQYJ4sh7EwdlwAvvS2XmnPn02CY2DxioLBLiiLRF/EruH2fuqIxr0N9wWZudmkkqEFgls4uEROOXTWmJh1k9yscgVgwnQh7F3cwYC1zcEeJj1zkwWpg1avL+0wB+ClT8tU8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3773.namprd12.prod.outlook.com (2603:10b6:208:164::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Thu, 24 Sep
 2020 12:25:38 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Thu, 24 Sep 2020
 12:25:38 +0000
Subject: Re: [PATCH 30/45] drm/ttm: add a new invalidate notify callback.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200924051845.397177-1-airlied@gmail.com>
 <20200924051845.397177-31-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2608ea3c-5838-8fdb-59b6-d984d18f17d9@amd.com>
Date: Thu, 24 Sep 2020 14:25:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200924051845.397177-31-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0302CA0008.eurprd03.prod.outlook.com
 (2603:10a6:205:2::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0302CA0008.eurprd03.prod.outlook.com (2603:10a6:205:2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend
 Transport; Thu, 24 Sep 2020 12:25:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d973c6db-5c20-4438-5a89-08d86084f186
X-MS-TrafficTypeDiagnostic: MN2PR12MB3773:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3773C439170985AF1DEBF05483390@MN2PR12MB3773.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WIxur3XoFc4uPJTuBG4ccBI6C3Y5TT4zYTh2El4s3TkNTYTfZv5CssaAjE4TmGEvMaPv32WBkBX0egU/Pzk2Uy70OmOaHturG1Nmo4ebtx/r0MoPbMZ56Wt7lVMbcqVeNSMiQtXm+rBtIUAvvn+kAXYC+Nk6WlJsqQqCYUhyV6o6C8Ce7wodF1BZyeDUXnwXMOZ5cdxsvhsC+COAIh3gno87Fhk5B0MzZi1HNz2iDSP+uWYUafb5cgoPG2N7ypbJyXxuF4acAGN5nFvTPQqMI1pZk1zwuoy1o2KssMxrCrjC4zp4i+o++/uhirOq3bL8mmLF8pQrv5+ULKt0VsaLKGGGAL0LXzmDLY1vI5XGl3hKyQv5SCv+GeP4MCL1HdSngVOM7LVs9/P+DqiMyAFSTfDxPmcEnS2axtt3bhH9ArSVOlxP/S+uZ/F1IJCZ8ip8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(366004)(376002)(396003)(4326008)(31686004)(83380400001)(52116002)(6666004)(478600001)(186003)(36756003)(66946007)(5660300002)(2616005)(316002)(31696002)(6486002)(86362001)(16526019)(66556008)(66476007)(8676002)(8936002)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 1/UgkuoQN0Tm/3qc6WuLggxTGDUddEwdT4AV+MqGQicN1RFg/Cca5MiqNId68ihiQeBW/CPuFjTsrUppLl/N9iIubbWuFjaVSdY3udJEID4txPrRUoRk8E0SmAXuVQcR4bHiRI4fEbvrHUS/kxo4S1OzJouLg7U5cEXn/bCgye8PUvQsiAHIYVc3aEJGxHtt8kzxCgfRFZK5a7sxvPhEcmC5L6+zjnLpTE67bvjH1tSy3ufr8Og+8363AXCOMMoTq6G3XE6SRV8uamUoLBLfv+LdGwF+O22+eCsDwM6XbxpZbw2S9TvM2mKPHHPIKebFJPl5gWGGSwf7o2tP1hmGzczsuUzbcyNVVziSlXKOCRcHjMSuhtsBrRT0cKCemuAV2uBokaPgN/Q+oabGDr+4MI929Bla4g1ZqCehR1zz183XhFxl/ZjJyz6C37mUSdWymHxEDqvpyY7botHLuDE3zOy9SUl1CMulaZmIpFoW8731m+EWmkiRjoabUklz9fEB8PowLANITid47yeWk8CDaWR3QpOE30tQwVSG/UXcVITPu8wyxkgko0II2VGYEsKR79iwCiINC31POU5u/KRWgEYf3WV9zF5TUIfSxp8F/b+gkHM9VbjNeU/ivbPw+IorwnjeAYVDkG/S+st7ypfFFVcQcykQeCW36QkGmXu0g67MhqHU93/+S47isgGC0i3P+6FJBlVLgR47ylSVNq4EJg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d973c6db-5c20-4438-5a89-08d86084f186
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 12:25:37.9877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q3bsHu6X1X2Nq0uazEZEYWAsXYQJzm9t/OnOIQoLCvWnhltccbuyWGvYeX6osuFy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3773
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
Cc: bskeggs@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.09.20 um 07:18 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>

NAK, completely unnecessary.

We should rather do the remaining accounting in the already existing 
release_notify() callback.

That makes much more sense and if I'm not completely mistaken could 
actually fix a bug in amdgpu.

Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c    | 4 +++-
>   include/drm/ttm/ttm_bo_driver.h | 7 +++++++
>   2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index a2a61a8d1394..ba69c682e53b 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -282,7 +282,9 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>   
>   static void ttm_bo_cleanup_memtype_use(struct ttm_buffer_object *bo)
>   {
> -	if (bo->bdev->driver->move_notify)
> +	if (bo->bdev->driver->invalidate_notify)
> +		bo->bdev->driver->invalidate_notify(bo);
> +	else if (bo->bdev->driver->move_notify)
>   		bo->bdev->driver->move_notify(bo, false, NULL);
>   
>   	ttm_bo_tt_destroy(bo);
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index cfb151dbb2d0..da4afe669664 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -165,6 +165,13 @@ struct ttm_bo_driver {
>   	void (*move_notify)(struct ttm_buffer_object *bo,
>   			    bool evict,
>   			    struct ttm_resource *new_mem);
> +
> +	/**
> +	 * Hook to notify driver about a bo being torn down.
> +	 * can be used for invalidation instead of move_notify.
> +	 */
> +	void (*invalidate_notify)(struct ttm_buffer_object *bo);
> +
>   	/* notify the driver we are taking a fault on this BO
>   	 * and have reserved it */
>   	int (*fault_reserve_notify)(struct ttm_buffer_object *bo);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
