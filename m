Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B989CA37AD
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 12:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F2C10E8EA;
	Thu,  4 Dec 2025 11:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LXEf1UeA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F5D10E8EA;
 Thu,  4 Dec 2025 11:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764848947; x=1796384947;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=XFQqQABDTYL25qV+KMl9is32qVQOmMfJ5CpAsUY1EIE=;
 b=LXEf1UeArlV/+CF8dvzIlBDJgd07NQovl1ZQocoMPAeOrLGgKpZaKQXe
 oE0X6NELjyM+goMXRpVxc7cBMDIasa4JS1EWrD8p+yKdmCNXQFBLeweN0
 EoiwmFONIGWqeMr3bKdcInUDaeiQSjxbprJfRTRbK20cixn6oIDEOpIJX
 F3qhB9HbO25F0HKu7RFqhmhWH42hx6e1Ylb+qzSMApYxeYUId1jN9Y950
 66CeUCgxxaSXYg8yrX/Ims4OxbnFloKCKcSKjq96I3YOsj6euACQnM3tg
 ClFjb3x0Q4DjNt4Hfh6x7hCp1mJpFhbnywsC7kDUB84nfUFQXApRrkjsM Q==;
X-CSE-ConnectionGUID: qqRpjbobQtuBX9yt8eYjWQ==
X-CSE-MsgGUID: On28GgDmQ0CW+nbQDF3YRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84465976"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="84465976"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 03:49:07 -0800
X-CSE-ConnectionGUID: gWE9uOCyQhSjPcuwyHISkQ==
X-CSE-MsgGUID: x6wwfiFzSGCpTyfqQBvNRg==
X-ExtLoop1: 1
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.11])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 03:49:03 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Madhur Kumar <madhurkumar004@gmail.com>, lyude@redhat.com, dakr@kernel.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, Madhur Kumar <madhurkumar004@gmail.com>
Subject: Re: [PATCH] drm/nouveau : refactor deprecated strcpy
In-Reply-To: <20251204114021.36719-1-madhurkumar004@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251204114021.36719-1-madhurkumar004@gmail.com>
Date: Thu, 04 Dec 2025 13:49:00 +0200
Message-ID: <79e3e2f047e8df3b7a1ac69a5c24016f799823d0@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 04 Dec 2025, Madhur Kumar <madhurkumar004@gmail.com> wrote:
> strcpy() has been deprecated because it performs no bounds checking on the
> destination buffer, which can lead to buffer overflows. Use the safer
> strscpy() instead.
>
> Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_fence.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index 869d4335c0f4..100c7dff4ff8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -183,11 +183,11 @@ nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_cha
>  	fctx->context = drm->runl[chan->runlist].context_base + chan->chid;
>  
>  	if (chan == drm->cechan)
> -		strcpy(fctx->name, "copy engine channel");
> +		strscpy(fctx->name, "copy engine channel", sizeof(fctx->name));
>  	else if (chan == drm->channel)
> -		strcpy(fctx->name, "generic kernel channel");
> +		strscpy(fctx->name, "generic kernel channel", sizeof(fctx->name));
>  	else
> -		strcpy(fctx->name, cli->name);
> +		strscpy(fctx->name, cli->name, sizeof(fctx->name));

I don't think you actually need the third parameter here. strscpy() is
magic, look up its definition.

BR,
Jani.

>  
>  	kref_init(&fctx->fence_ref);
>  	if (!priv->uevent)

-- 
Jani Nikula, Intel
