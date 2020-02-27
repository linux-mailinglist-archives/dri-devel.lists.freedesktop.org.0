Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C01A171505
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 11:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA106E558;
	Thu, 27 Feb 2020 10:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813E46E558
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 10:31:43 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id v4so2619548wrs.8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 02:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=85G1mkwznv/3ivBvrNIp+8uvZlMzy0VSIWoMKgU4jMY=;
 b=Pg2rPvDKO55L2AJ5J/PVbEw5OeX2G5oMU2bl+oq3D2cKFd0ILdh4QGabYNBtdsxNM8
 VZcSjqaGTVKjCgAuoAAYVzaScEPX0AgcIjYOCCqcpUB4CF6uWzoXxYL2HjvbOQWgBOps
 F2iQYdtM0KF5quEHmUgqubb74yITE//+JGaZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=85G1mkwznv/3ivBvrNIp+8uvZlMzy0VSIWoMKgU4jMY=;
 b=BHX04vdE26Ll9JySWPtzsFld2U1Dr8JY+58V+O4iF2DsyRyiQzDht9ZdRfZi6GubNY
 uFPIDVyCdBNa4B1EJLPo9RXPDgPoC8pMaekkGoqbYoHg9jFdwDqrbTBXwiitCAgWTmw5
 gnOsz+FtqyDBNNvCU41caKURHY0ZWOLI/0tO3EsHxh40Jyt/HeZuOFgxQDXoJo0DDjp2
 QjOQEEFL8LaNGhiZj9+1Q5GAFs78l5c6u/ydrtVJsFeSWrTE8WF6gPUeNRSDDF0uYaLd
 Lgr6HS9DcInfLJ4aU6jmIX4VCEQfshAbDoMYbmTbmTIBwIdr33yxu4fnNPRklrmUacaQ
 wiAQ==
X-Gm-Message-State: APjAAAXF9Dk5wUAO1lP8foOPhjJhfzXBvQ5mQfyZ7Zy1Rw4tjctAWqJ5
 Wght0sxtc6EFslxtLuhCxF2G6A==
X-Google-Smtp-Source: APXvYqwW6R9JSV+dgIa8Oqqc9Q6mK0678QchVdrlPMh0myYaAo8XNCCi/hkPAtc6tAwI+BsfyROy/g==
X-Received: by 2002:a05:6000:14d:: with SMTP id
 r13mr4041693wrx.63.1582799502206; 
 Thu, 27 Feb 2020 02:31:42 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c26sm6961300wmb.8.2020.02.27.02.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 02:31:41 -0800 (PST)
Date: Thu, 27 Feb 2020 11:31:39 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH] drm/tidss: Add prepare_fb to the plane helper funcs
Message-ID: <20200227103139.GU2363188@phenom.ffwll.local>
References: <20200227101307.4385-1-jsarha@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227101307.4385-1-jsarha@ti.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
 g-tammana@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 27, 2020 at 12:13:07PM +0200, Jyri Sarha wrote:
> From: Gowtham Tammana <g-tammana@ti.com>
> 
> drm_gem_fb_prepare_fb() extracts fence and attaches to plane state.
> The fence info is needed if implicit fencing is used. Add this as
> prepare_fb function pointer to plane helper funcs.
> 
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> Signed-off-by: Jyri Sarha <jsarha@ti.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I still wonder what we could do to catch these kind of bugs. There's
really no good reason to ever not do this as the fallback ...

Maybe time to just make this the default prepare_fb hook if neither
prepare_fb nore cleanup_fb are provided? Then roll out the removal for all
the drivers that just set this one. Otherwise we'll keep playing
whack-a-mole here forever ...

Ofc would need a bit of review and kerneldoc update, but I think that'd be
the right approach.
-Daniel

> ---
>  drivers/gpu/drm/tidss/tidss_plane.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
> index ff99b2dd4a17..345678faaeb6 100644
> --- a/drivers/gpu/drm/tidss/tidss_plane.c
> +++ b/drivers/gpu/drm/tidss/tidss_plane.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
>  
>  #include "tidss_crtc.h"
>  #include "tidss_dispc.h"
> @@ -142,6 +143,7 @@ static void tidss_plane_atomic_disable(struct drm_plane *plane,
>  }
>  
>  static const struct drm_plane_helper_funcs tidss_plane_helper_funcs = {
> +	.prepare_fb = drm_gem_fb_prepare_fb,
>  	.atomic_check = tidss_plane_atomic_check,
>  	.atomic_update = tidss_plane_atomic_update,
>  	.atomic_disable = tidss_plane_atomic_disable,
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
