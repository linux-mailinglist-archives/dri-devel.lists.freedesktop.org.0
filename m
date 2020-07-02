Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EA5212457
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 15:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA2D6E9A9;
	Thu,  2 Jul 2020 13:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC626E942
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 13:13:59 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r12so28232730wrj.13
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jul 2020 06:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=zILgKaetTBwolch6rF03SRdkX/5q6atkzkbETazvBAE=;
 b=UBVcKDgtdhC6vC/FuLh+o8LKBbatbmZ82QTPSPB4E2XeAGBQYES5PswiSDVsB1y35/
 YTn38PmXCqwZ0qnV/PV4WaldiK66HTXlVCYGArJv6UF2ZJNDOosueBQKbkTnPbw7TOdj
 Rz4iWXQLrMyp/jnasqHu//tr3/nYCwDgNE0f8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=zILgKaetTBwolch6rF03SRdkX/5q6atkzkbETazvBAE=;
 b=szSWXLBvpc80YnJokuqs7j481GCAWLH1gpVvi9dceghIz0+CtHVfNYRwtyFK3twpB4
 B5oNQ7vMNe75uAzFaQDHkKkDH70+J4argPa54BLhj3rn0gaSYLrQW/G5HkQQ5BaYtgg6
 d4kTvUKpJojQWV54XlOv5P4mP8O/L5RUs7vmcrUeFsIvaWlnsT+0kk8fQCxx5f2yDTjl
 osJrOL/0b7Mb7+0CULXQw+dbW7BewbLMVjIUSs0zbMQb3gCyw99wPwPMe7ne7DR6/lIg
 rS3Pm25MieroeL2GQGBYl+DzBegS3RcI8EaBxQXtMtn7mqMQtCduIac8B2ajie+xapvC
 7www==
X-Gm-Message-State: AOAM531YyT4pz7CC1xSjtRZ19JvNfRjn4vUVkSyIpl6MdJwLJ9hhuQgi
 5YIYT1V7F4pECTsymW+uwtE/rg==
X-Google-Smtp-Source: ABdhPJzw5CpFHu7RNQ5l+6PpSRit16K2KOdpRIIkkIx1cqWsAls2OKTWgQ6li418LbgC3qx1vw+Ehw==
X-Received: by 2002:a5d:628b:: with SMTP id k11mr31781751wru.107.1593695637756; 
 Thu, 02 Jul 2020 06:13:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c15sm348250wme.23.2020.07.02.06.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 06:13:57 -0700 (PDT)
Date: Thu, 2 Jul 2020 15:13:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sidong Yang <realwakka@gmail.com>
Subject: Re: [PATCH] drm/vkms: add wait_for_vblanks in atomic_commit_tail
Message-ID: <20200702131355.GX3278063@phenom.ffwll.local>
Mail-Followup-To: Sidong Yang <realwakka@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200701153134.4187-1-realwakka@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701153134.4187-1-realwakka@gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 01, 2020 at 03:31:34PM +0000, Sidong Yang wrote:
> there is an error when igt test is run continuously. vkms_atomic_commit_tail()
> need to call drm_atomic_helper_wait_for_vblanks() for give up ownership of
> vblank events. without this code, next atomic commit will not enable vblank
> and raise timeout error.
> 
> Signed-off-by: Sidong Yang <realwakka@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 1e8b2169d834..10b9be67a068 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -93,6 +93,8 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
>  		flush_work(&vkms_state->composer_work);
>  	}
>  
> +	drm_atomic_helper_wait_for_vblanks(dev, old_state);

Uh, we have a wait_for_flip_done right above, which should be doing
exactly the same, but more precisely: Instead of just waiting for any
vblank to happen, we wait for exactly the vblank corresponding to this
atomic commit. So no races possible. If this is papering over some issue,
then I think more debugging is needed.

What exactly is going wrong here for you?
-Daniel

> +
>  	drm_atomic_helper_cleanup_planes(dev, old_state);
>  }
>  
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
