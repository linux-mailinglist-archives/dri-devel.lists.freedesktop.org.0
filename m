Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 131C7625674
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 10:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B38F10E7D2;
	Fri, 11 Nov 2022 09:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FCD110E7D2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 09:18:22 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id f27so11304516eje.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 01:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gAeD23JiJEiBcBvX2QeEcF5Jlw/vSsr3wDHpYwyqVn4=;
 b=KZQyTv4N29UOmqKw8sBsjTbjHMcFrA/IQb8zxcfsKLi/BU5X+JUNhUn861f/RroRAi
 Z35+zfQCT3zt8q2ytO+xk9K6E6yxzq5xdFerxsgeURnXZUdS4o455QqRWMly/UdT0687
 GtnjO+JaRS84387j5chml2FfO10ut0fxlh8HY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gAeD23JiJEiBcBvX2QeEcF5Jlw/vSsr3wDHpYwyqVn4=;
 b=3UKSIRdbGR8FnbwPxCkorqLToIqWSm2kwcUrrvXRj+8TYaPsIjahZoP7eSbnp+VosK
 l6FjEbEcnardjO5D/S7wXWT1V64T3Cvn5Tvy+lV69XdTswrvuIKyPb0zkRvqq7V2rZT4
 Kpm+YpO8A3PXRISBrw6wZfdUEbGlIIC72jsESMS2RoCNOTjnNRAe1+jXPicOPqLp1UOR
 sn7T/LgpIttvYgNrmZkW9i33+NAGw3QCl+M1YV29XjiGMDQFIC1N6KQhFeHe8mdz9h5X
 LatQmQxe2LpaD7j67XS+HiOWa8bdgIWN7hXFKEXfoavctbjEaDAG2u+mr6Rg302l4HKl
 2HTQ==
X-Gm-Message-State: ANoB5pkQWrmF67aOT8fuVYSboHtqH9jaQYxXy2EPWC/cWW1oIPv9DLbd
 YULkgtfqDReZIasopsNEF3sbMg==
X-Google-Smtp-Source: AA0mqf6NY+SknmtIRYJ88onIRfBRqar/fCP7Spcf3qPpuxxwq32RcC11htBA2WL/FHpwvKq0G/U1hQ==
X-Received: by 2002:a17:906:780e:b0:7a8:f24c:1466 with SMTP id
 u14-20020a170906780e00b007a8f24c1466mr1129934ejm.452.1668158300822; 
 Fri, 11 Nov 2022 01:18:20 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 qo14-20020a170907874e00b007a03313a78esm695221ejc.20.2022.11.11.01.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 01:18:20 -0800 (PST)
Date: Fri, 11 Nov 2022 10:18:18 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/5] drm/fb-helper: Move dirty-fb update into helper
 function
Message-ID: <Y24TWkyXvMRmHyDZ@phenom.ffwll.local>
References: <20221110135519.30029-1-tzimmermann@suse.de>
 <20221110135519.30029-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221110135519.30029-3-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 10, 2022 at 02:55:16PM +0100, Thomas Zimmermann wrote:
> Move the dirty-fb update from the damage-worker callback into the
> new helper drm_fb_helper_fb_dirty(), so that it can run outside the
> damage worker. This change will help to remove the damage worker
> entirely. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 178615565760e..be8ecb5e50b56 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -367,9 +367,8 @@ static void drm_fb_helper_resume_worker(struct work_struct *work)
>  	console_unlock();
>  }
>  
> -static void drm_fb_helper_damage_work(struct work_struct *work)
> +static void drm_fb_helper_fb_dirty(struct drm_fb_helper *helper)
>  {
> -	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper, damage_work);
>  	struct drm_device *dev = helper->dev;
>  	struct drm_clip_rect *clip = &helper->damage_clip;
>  	struct drm_clip_rect clip_copy;
> @@ -404,6 +403,13 @@ static void drm_fb_helper_damage_work(struct work_struct *work)
>  	spin_unlock_irqrestore(&helper->damage_lock, flags);
>  }
>  
> +static void drm_fb_helper_damage_work(struct work_struct *work)
> +{
> +	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper, damage_work);
> +
> +	drm_fb_helper_fb_dirty(helper);

Was pondering a bit the naming, but it fits the ->fb_dirty callback, so
at least consistent with what we have. Sometimes I'm forgetting how many
layers of indirection we have just for historical reasons :-/

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +}
> +
>  /**
>   * drm_fb_helper_prepare - setup a drm_fb_helper structure
>   * @dev: DRM device
> -- 
> 2.38.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
