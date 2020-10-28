Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2468E29CFCD
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 12:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7576EC90;
	Wed, 28 Oct 2020 11:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B886EC90
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 11:52:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ngc/7KmXIYk04s73PI91loEtkdxcSmF0GA6aOcv/bWYDmA5xs+01b1g2nlAw0cN0t2D9c6o+TsKWc/8JlktJoC7oPv42QKt1JW0Ck6xW+wcNgTvVaAueM+XLEyVSZKJElcgv0C7XW8Qv9tbWlBOinujfxPagLwy8Yzm01o5ZIkbsKHfJpk7aRDV3kg0Vo5gkCL2I5nT3+q6bd2xtsnd5pODbvJce70I5QoDAkfNyj1vjw6sh/npXKbcPf3jkn8z4lFZ5mcy1AfIWn5UWCrLTYQybl72d5TOErGLw/+dwUfpiibBdsQe4Xa+kuoUSGBxAa0ZJ035s/c9SNaVpgwYDaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLqzY5V69Fe/XN6IDRxTPm6NhwZ2Pp75dxHokjN9azo=;
 b=HyAF53KxqgnkAJqKdzg1F6f1bQOjUplGGOoYtuDp6RvvutvFqjalI9o+uh3tjp4ga1wgrkmLU5Pfbqrvb/gHyKUk2zgp42LpVFh3l7ROs93n7ArOXqDvT8wGTdMnHVnL+GjPNQZ+tG3YJui+L1DZDP5QHn9azfyOb6OQMsroD38sK8JZMnyaY5vreSZOKmV38R01ZtOUxU1fstkdrhIbzWJV8wLa4l6lsMiNdNBq9jGx1IGDFM1UyyVB0zevlrekVFvNIE0FT6Vn9P/3hAYPRC+rJNlTDAYXJ/OZc/nkiayaIHz5N9VK3PbNTyoqRdd3tFeXsvwHePTqWyvk9/ZX8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLqzY5V69Fe/XN6IDRxTPm6NhwZ2Pp75dxHokjN9azo=;
 b=FY4OxH6WJN4lNl3GuX0Fjq3m1jMDP7wm2i6U2GmgEreaRfiR20RFDh42zud0pZ/K8hOseEOLazKy9JgAy+2Xhf8tOrjgZSljMFo221WzmkEZgNNmkhpfqd3PzXnvESEICF7Tg+Xn5WfbUYs2B0YuO16i2DivCbnesh4zR0DznV8=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MWHPR1201MB0048.namprd12.prod.outlook.com (2603:10b6:301:59::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Wed, 28 Oct
 2020 11:52:02 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::b885:8b56:a460:4624]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::b885:8b56:a460:4624%11]) with mapi id 15.20.3499.018; Wed, 28 Oct
 2020 11:52:02 +0000
Date: Wed, 28 Oct 2020 19:52:18 +0800
From: Huang Rui <ray.huang@amd.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/ttm: Warn on pinning without holding a reference
Message-ID: <20201028115218.GD1767271@hr-amd>
References: <20201028113120.3641237-1-daniel.vetter@ffwll.ch>
Content-Disposition: inline
In-Reply-To: <20201028113120.3641237-1-daniel.vetter@ffwll.ch>
X-Originating-IP: [58.247.170.245]
X-ClientProxiedBy: HK2PR0302CA0021.apcprd03.prod.outlook.com
 (2603:1096:202::31) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (58.247.170.245) by
 HK2PR0302CA0021.apcprd03.prod.outlook.com (2603:1096:202::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.10 via Frontend Transport; Wed, 28 Oct 2020 11:52:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 71ba21bd-c6fc-4393-3ae1-08d87b37e264
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0048:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0048AA5FFF5F71CF806041B5EC170@MWHPR1201MB0048.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E/Fx7p17cg1jQFTd8ICl68CdBiI7qxB/dKoY1FsSSC3PU5AOiIALQkcVZiTL9NlFHreGY/g52cSd118zFyiPumMhMQsKYkidSzyUzQNGIYmkw5zKWdgQRliAPbelk97GR5qmK16mzoVZ23jSynSo7QHlqc7K8Ym7bxaFPNxlHX8MtoaCQCBev3IQ4E588Xjk0qgFGMp8PXWEphv+LEAe57vpn97yDLJon64nPOZFaefWoYZ2uLZdb6gJ9yLOw4AxZOf3Ww7Vr23kxvDtdD204Xkxs6P0YaDSBVghIx2w7mRvXnp6H4r657xC5lq+1vEMzye6uUjVmlWPzQAv1jNJxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(66946007)(66556008)(33716001)(54906003)(8936002)(66476007)(478600001)(8676002)(9686003)(5660300002)(1076003)(33656002)(4326008)(316002)(2906002)(83380400001)(186003)(6666004)(86362001)(6916009)(6496006)(956004)(26005)(55016002)(16526019)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: X3EUJznV9br9P9pN5JTzbOgR4A1D62Zx29TiE4fh3dnpkx/yqp7IDbzBhaQLzCL6YWP8v3oJE71xaOfQG/ZIqrU4mAtAFGR8jGdBV0cOxnO5JtD4BEVzrp0MeBa/O3FoATVUUK2YpBcBFXm7DJ18AjVrI7SBUBRb0CnPBdyXqlceSF2CqJGxs1cqqu/07ryZzAxUPY3dvnDDZWWEzUrMknEGZBFxR6l2Rkk6XKhFzFqSeiaBF8anO2JXZ6JK44KSM3uvj55kZucmd8I7M7xHexRstYZDsqv0wH8XAnJXAlHgYyqh9J0zdUYXRJNK6M4JJHa8oYzLhws5Ja6C5Z3YhAtT6hg02cXxyhH98G9XSE8aZ/4qDgRgxdDNoI7de8wtbwkmtuEpT3OK+8AK+vO7F1osdKKsEmxvHGVYhAK2p1Sc4UarIYka/b4IVvEv6EL+a2dpo5BYBGuJ9EGmtqINZsMnpRBWYZasR7/KybdvZ9z9IAjauIq/nha8OmUBgSVOeV/zEnqvOwbJ2KcEQQDxa8SKfM8ByfJI14fA2qQ5tFsza5C0QL+KhopWZaULZxCvkxqdU/I/7JxQ9IsWehpgZ/puUd4le3WgGECeWP9e65pPjMi0/gEK6beFhT07fe5KY19z/dM7M8aej4vnJm6ydw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71ba21bd-c6fc-4393-3ae1-08d87b37e264
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 11:52:02.6111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JIXKxE54Ojm6beeolgyRFs+KSztKTIW63ISOvLcQ5mBtQnOXuzSA8700so04ZAdsr8m1KncLhSiAmVFnhljZaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0048
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 28, 2020 at 07:31:20PM +0800, Daniel Vetter wrote:
> Not technically a problem for ttm, but very likely a driver bug and
> pretty big time confusing for reviewing code.
> 
> So warn about it, both at cleanup time (so we catch these for sure)
> and at pin/unpin time (so we know who's the culprit).
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Reviewed-by: Huang Rui <ray.huang@amd.com>

> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
>  include/drm/ttm/ttm_bo_api.h | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index f51b5e20fa17..a011072ab61d 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -509,7 +509,7 @@ static void ttm_bo_release(struct kref *kref)
>  		 * shrinkers, now that they are queued for
>  		 * destruction.
>  		 */
> -		if (bo->pin_count) {
> +		if (WARN_ON(bo->pin_count)) {
>  			bo->pin_count = 0;
>  			ttm_bo_del_from_lru(bo);
>  			ttm_bo_add_mem_to_lru(bo, &bo->mem);
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index 37102e45e496..b45aee23d7d0 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -571,6 +571,7 @@ static inline bool ttm_bo_uses_embedded_gem_object(struct ttm_buffer_object *bo)
>  static inline void ttm_bo_pin(struct ttm_buffer_object *bo)
>  {
>  	dma_resv_assert_held(bo->base.resv);
> +	WARN_ON_ONCE(!kref_read(&bo->kref));
>  	++bo->pin_count;
>  }
>  
> @@ -584,6 +585,7 @@ static inline void ttm_bo_unpin(struct ttm_buffer_object *bo)
>  {
>  	dma_resv_assert_held(bo->base.resv);
>  	WARN_ON_ONCE(!bo->pin_count);
> +	WARN_ON_ONCE(!kref_read(&bo->kref));
>  	--bo->pin_count;
>  }
>  
> -- 
> 2.28.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
