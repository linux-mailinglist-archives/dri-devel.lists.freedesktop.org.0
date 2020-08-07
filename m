Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C124C23EDC4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 15:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21446E9D7;
	Fri,  7 Aug 2020 13:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CAD6E9D7
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 13:12:57 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f7so1652317wrw.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 06:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EBzRDQiH1juPey4CQ8iHwA0/NZ1mPhDK894jrfw/HyM=;
 b=LuPxcjJJIeC8L7mhF1I35jbCWNsWFgmY5Wb9CN3NcZtLmICRh2RdHG/R9IgP434iAf
 MFLbMr4t4UGRwAJfLNi7i2yJJHgLhXhUyf5WxLRA64fE0Xmbf9DuJ4IABpYMC3m+aWVO
 32f7FdbB+z+i1dOz6sokyFr0znDfGFCRZ8kKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EBzRDQiH1juPey4CQ8iHwA0/NZ1mPhDK894jrfw/HyM=;
 b=T+TB4zrrWHu16NHGBVNjJr5Vq2NLqCwPcmrMqPgn6qYZHoxh8JoWRJGcH9lZoDuzK4
 1vhdJB2dZU+byOjo3yBwyS2QONEUmbX7dKanZ6P9ZRyV+5HAJOknsDXMKUMCK5pFW62J
 mPipAmbzC1t7iXVJzG/Vdwnj+Dl2l26Q0vCgxlbWN67vCd3jLm8nYDu4W6scY2fQ9ir3
 +DquCHtGaQUoXZ8wOF8RnxYr5tppMJQIBRGSnv1Xx9MaHAajs9R6R/Vc4sBC57B6DnQz
 HBVM7ykP9mzG4hbGxLToVYJqJh/Vo4NYfSdsb4gAjdKkmYBz9i73Zjn/4BVYXeIAyrUI
 nNgQ==
X-Gm-Message-State: AOAM531t5tPT+DkzyPqE55NqNGnxht1YCUS6Seb/xy+AT/L16r0yd7DX
 FRmRRFyjoWHLKzYtw2cb+gRf9A==
X-Google-Smtp-Source: ABdhPJyfuf8HPb0BHZfW3OOU0WkiJMq8rdMd+jkYOY+IvDD8/p1i0hQF3xzSZrstZU5kKs5ur/ppsw==
X-Received: by 2002:adf:e9cd:: with SMTP id l13mr13330060wrn.340.1596805975885; 
 Fri, 07 Aug 2020 06:12:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k184sm10385423wme.1.2020.08.07.06.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 06:12:54 -0700 (PDT)
Date: Fri, 7 Aug 2020 15:12:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/malidp: Use struct drm_gem_object_funcs.get_sg_table
 internally
Message-ID: <20200807131252.GG2352366@phenom.ffwll.local>
References: <20200807111022.12117-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807111022.12117-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: airlied@linux.ie, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 malidp@foss.arm.com, emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 07, 2020 at 01:10:22PM +0200, Thomas Zimmermann wrote:
> The malidp driver uses GEM object functions for callbacks. Fix it to
> use them internally as well.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: ecdd6474644f ("drm/malidp: Use GEM CMA object functions")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Emil Velikov <emil.velikov@collabora.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Brian Starkey <brian.starkey@arm.com>
> ---
>  drivers/gpu/drm/arm/malidp_planes.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
> index ab45ac445045..351a85088d0e 100644
> --- a/drivers/gpu/drm/arm/malidp_planes.c
> +++ b/drivers/gpu/drm/arm/malidp_planes.c
> @@ -346,7 +346,7 @@ static bool malidp_check_pages_threshold(struct malidp_plane_state *ms,
>  		if (cma_obj->sgt)
>  			sgt = cma_obj->sgt;
>  		else
> -			sgt = obj->dev->driver->gem_prime_get_sg_table(obj);
> +			sgt = obj->funcs->get_sg_table(obj);

Uh if there's not a switch somewhere I'd just call the right function
directly. Or call the right wrapper for this, this feels a bit fishy ...
-Daniel

>  
>  		if (!sgt)
>  			return false;
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
