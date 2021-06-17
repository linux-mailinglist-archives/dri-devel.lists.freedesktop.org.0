Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA9D3ABC79
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 21:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74F36E9A0;
	Thu, 17 Jun 2021 19:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B836E9A0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 19:17:51 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 c18-20020a05600c0ad2b02901cee262e45fso4302094wmr.4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 12:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=cyKaQCeyHLS4EathuQVksg4S7Jponx+EApTJ2kRHanM=;
 b=LlfNDK0UOBDhPM4icZWg0U1hqnlUirGnt9g8bDduYnZVgb74v7YtAJu5ZSszaIchx+
 1LglqLJkgtMk9YvpMJr3gbLNb5va96BbmIPqUbvW4vo2Xnb+kxt/1NqcRXqjks1lNgvg
 uci7OCDYW5WAFt6GYfi/zQwwZbiTt26k/coDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=cyKaQCeyHLS4EathuQVksg4S7Jponx+EApTJ2kRHanM=;
 b=efD+yFCwKANhk6u8VclNIuomWxnR9amUh8ChNJk7QZjMWN10dTgdpCffwnT5Ew5o8i
 9RM+OZtmrzXL8d8L1ecQ3QHSs+jfHlrb+AOT7NEsKNtclJl3t9KEK5tUrcEq59GnTb8R
 Ds7qWgpWypsSruZrTcptrML6HMTz5u/wN3lziHGVeYj4q3vHaZsRlLXEbEcsE49/jenn
 VccaGB9hFc9slVq3r5HHQdeUtuSqeWEndW8uk8tPo4rIHcTNshSllo2Od+tso7VfL8Wo
 +GAq8HH0cA/yCrPDOY+Y+mB1OWVxs1CPWx1TcLmwKhr3qQQTHcoU2T77qncelziixa3/
 69Jw==
X-Gm-Message-State: AOAM530VcVSNbr5HTM73kP8YpJJZQldfeXp2ZRk++1yisF3Gkgl3mEf5
 TJszMcYD3GwkrnUZcxqLuSMmdA==
X-Google-Smtp-Source: ABdhPJz9r3Zc1W04RbJHA8pEKhmLAqX+WD+p/Bg8XfAFkOoVW2zFgvW7BDV3Hpiz1ea7DIxR9MNF7Q==
X-Received: by 2002:a1c:df09:: with SMTP id w9mr3003192wmg.91.1623957470485;
 Thu, 17 Jun 2021 12:17:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w23sm9415180wmi.0.2021.06.17.12.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 12:17:50 -0700 (PDT)
Date: Thu, 17 Jun 2021 21:17:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Qiang Ma <maqianga@uniontech.com>
Subject: Re: [PATCH] drm/auth: Move master pointer from drm_device to drm_file
Message-ID: <YMuf3BHk+3ROGJ09@phenom.ffwll.local>
Mail-Followup-To: Qiang Ma <maqianga@uniontech.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210617094733.8429-1-maqianga@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617094733.8429-1-maqianga@uniontech.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 17, 2021 at 05:47:33PM +0800, Qiang Ma wrote:
> The drm_file pointer clears to zero during multi-user switching,
> so it needs to call drm_new_set_master for master pointer from drm_file.

That sounds like a bug. drm_file->master should be always the same -
either you become a new stand-alone thing, our you get linked to the
current master.

Or I'm completely missing what you're trying to fix here.
-Daniel

> 
> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
> ---
>  drivers/gpu/drm/drm_auth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index f2d46b7ac6f9..02431af6d0c5 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -302,7 +302,7 @@ int drm_master_open(struct drm_file *file_priv)
>  	/* if there is no current master make this fd it, but do not create
>  	 * any master object for render clients */
>  	mutex_lock(&dev->master_mutex);
> -	if (!dev->master)
> +	if (!file_priv->master)
>  		ret = drm_new_set_master(dev, file_priv);
>  	else
>  		file_priv->master = drm_master_get(dev->master);
> -- 
> 2.20.1
> 
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
