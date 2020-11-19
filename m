Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FD42B9630
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 16:27:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3276E536;
	Thu, 19 Nov 2020 15:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA40D6E536
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 15:27:25 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j7so6890292wrp.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 07:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PA/3b5KXp9vhHS5mGJihuvT1B2ae9XcYdoZ2Rj3T9qE=;
 b=SuhqRNzAa/nIbd8iTZB29AVF9ML+PXHRxpZwsHuJ2O/K6Ni09filqpm/i3O439bMug
 rYS6TvlVMjYH6WFBYASjr784GkeAvnVihg5vt+VB0ReSzHpJc+TFEGThOVikOqr0NUdU
 TUiuhJoaP9iAJs8AvAW0pU2gELSBKmP73q0sM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PA/3b5KXp9vhHS5mGJihuvT1B2ae9XcYdoZ2Rj3T9qE=;
 b=FYO1PfhNL9vSWGbXpYvm4uMLiuHPc8Lh948EokrGX/cjWwFIevrdykpy+WpWY15pSN
 xiS/7zCJr4eDg7zeFC3LZ8Xr7fdYX6sMEEKeMt0jA4l5FBzP5gegxZSPZGEnL8cejjaI
 3KbEfP3adJmq1O/EZk7Cn2+Epr3VI7BgKk+FjBSPRgLML0AFqGxEbvz76Am2SGnNriFy
 6ZGm61VVW+dvm188hY13IdMntG84Aim2ni3k1EB9xgXaP6+t38OnTmsk3185bBiXeI+9
 AS7r3/O2H2wqIJz8SlFMcV6dCMOleR2NbWEgl1rDCJpoUAgXtE/NCX05wH6USlQHJl3V
 bRqw==
X-Gm-Message-State: AOAM531J5gB8XHa9h/pxBZxzRFxXyn5PzEL/kzSXDCpYsgdBJgtk3QOQ
 Ybo8XA9X+A2Kwl9tPRK+QIZb0A==
X-Google-Smtp-Source: ABdhPJyWWijoaKonsTRKUBHbxozVn1JcEimf1QZTU72Z5U83SlnnzdaF8Mrz20VIXXSIUVO9OmAo0Q==
X-Received: by 2002:adf:cd02:: with SMTP id w2mr10632651wrm.3.1605799644651;
 Thu, 19 Nov 2020 07:27:24 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j71sm340530wmj.10.2020.11.19.07.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 07:27:23 -0800 (PST)
Date: Thu, 19 Nov 2020 16:27:21 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: James Qian Wang <james.qian.wang@arm.com>
Subject: Re: [PATCH] drm/komeda: Correct the sequence of hw_done() and
 flip_done()
Message-ID: <20201119152721.GC401619@phenom.ffwll.local>
References: <20201119013948.2866343-1-james.qian.wang@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119013948.2866343-1-james.qian.wang@arm.com>
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
Cc: carsten.haitzler@foss.arm.com, nd@arm.com, Liviu.Dudau@arm.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 19, 2020 at 09:39:48AM +0800, James Qian Wang wrote:
> From: "James Qian Wang (Arm Technology China)" <james.qian.wang@arm.com>
> 
> Komeda HW has no special, program the update to HW is done first,
> then flip happens. So correct the sequence to hw_done() first then
> flip_done().
> 
> Reported-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: James Qian Wang <james.qian.wang@arm.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_kms.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> index 6b99df696384..034ee08482e0 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> @@ -81,10 +81,10 @@ static void komeda_kms_commit_tail(struct drm_atomic_state *old_state)
>  
>  	drm_atomic_helper_commit_modeset_enables(dev, old_state);
>  
> -	drm_atomic_helper_wait_for_flip_done(dev, old_state);
> -
>  	drm_atomic_helper_commit_hw_done(old_state);
>  
> +	drm_atomic_helper_wait_for_flip_done(dev, old_state);
> +
>  	drm_atomic_helper_cleanup_planes(dev, old_state);
>  }
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
