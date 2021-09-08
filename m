Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A442403F24
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 20:34:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362196E252;
	Wed,  8 Sep 2021 18:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0FE6E252
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 18:34:43 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id a25so6062480ejv.6
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 11:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Tu/avCrn+ABQ6q0ueHilploaye/4nQZBWOnrswc2jNo=;
 b=MH0XO9DXrxj0YkPGtwDjfBI/TJeUEMsQqtbJI/xUyK9pcQTu1C9kv9cHGT2LZbZe7O
 NkFeYDgFHmgFUFEC5+5AskYhR3F4fMF5ikXDRXgbxERQbBC+E0H//h8K7KpZOjPAlm45
 Rxog2BlbgJRFgHdBotqzInmOTfRBW/iHUDnyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Tu/avCrn+ABQ6q0ueHilploaye/4nQZBWOnrswc2jNo=;
 b=UHGiXHibDhCDLWgEVe8w8QaizMLSFAUk2YxiswaXc+WLCdWe1mR8iEpCZe4JXOVcD3
 /wPpFOXGqYCcCpkWPrta2Pu2bJqppnkgpJQ4ylkzKPlIf2gIDqGBTsfpF+fquwfhCXFQ
 dmHeKtsASKUFr8senoJLoyrWYdHB0szK5tO2sVapGbIulWSDr2zThaLdqD5X2zT3L5nr
 13iG6zEBy/RPLnB36BkNgmk5krZtksXKhxypmuYK44HuSHzpkCaMcNDAMZN07VO4jSjz
 Hhv/qZ31F2q7RKKU3MPizu1qknURLXTuGzEoOQk8tPuHQftTo99ljQ3+5lYWg3uCdeyh
 Mm5w==
X-Gm-Message-State: AOAM5313yijvk8ClS7ptE+q5D0svrISRPOjjoVNXcnKa0krfjSHU4aNw
 OBd0LvW0M9teJi7sf/5qiO5sEQ==
X-Google-Smtp-Source: ABdhPJwkQoTc7Lc/Jrnzkglj0t5YKCXtw09Pauu38dAvqHRCY8GWNetApF9YVGATFyy2VPLSMPZbRw==
X-Received: by 2002:a17:906:3498:: with SMTP id
 g24mr1363825ejb.490.1631126082090; 
 Wed, 08 Sep 2021 11:34:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b13sm1702286ede.97.2021.09.08.11.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 11:34:41 -0700 (PDT)
Date: Wed, 8 Sep 2021 20:34:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Cc: dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/plane-helper: fix uninitialized variable reference
Message-ID: <YTkCQCPwZPbhMfeF@phenom.ffwll.local>
Mail-Followup-To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>,
 dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 linux-kernel@vger.kernel.org
References: <20210907140836.323149-1-alex_y_xu.ref@yahoo.ca>
 <20210907140836.323149-1-alex_y_xu@yahoo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907140836.323149-1-alex_y_xu@yahoo.ca>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Tue, Sep 07, 2021 at 10:08:36AM -0400, Alex Xu (Hello71) wrote:
> drivers/gpu/drm/drm_plane_helper.c: In function 'drm_primary_helper_update':
> drivers/gpu/drm/drm_plane_helper.c:113:32: error: 'visible' is used uninitialized [-Werror=uninitialized]
>   113 |         struct drm_plane_state plane_state = {
>       |                                ^~~~~~~~~~~
> drivers/gpu/drm/drm_plane_helper.c:178:14: note: 'visible' was declared here
>   178 |         bool visible;
>       |              ^~~~~~~
> cc1: all warnings being treated as errors
> 
> visible is an output, not an input. in practice this use might turn out
> OK but it's still UB.
> 
> Fixes: df86af9133 ("drm/plane-helper: Add drm_plane_helper_check_state()")

I need a signed-off-by from you before I can merge this. See

https://dri.freedesktop.org/docs/drm/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

Patch lgtm otherwise.
-Daniel

> ---
>  drivers/gpu/drm/drm_plane_helper.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
> index 5b2d0ca03705..838b32b70bce 100644
> --- a/drivers/gpu/drm/drm_plane_helper.c
> +++ b/drivers/gpu/drm/drm_plane_helper.c
> @@ -123,7 +123,6 @@ static int drm_plane_helper_check_update(struct drm_plane *plane,
>  		.crtc_w = drm_rect_width(dst),
>  		.crtc_h = drm_rect_height(dst),
>  		.rotation = rotation,
> -		.visible = *visible,
>  	};
>  	struct drm_crtc_state crtc_state = {
>  		.crtc = crtc,
> -- 
> 2.33.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
