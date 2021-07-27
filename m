Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA84C3D7589
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 15:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9E36E176;
	Tue, 27 Jul 2021 13:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77026E176
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 13:04:59 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id b7so15139588wri.8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 06:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=J1D0YAy3KCN+DKC/n4HOYEFT5Ge7h0z0gSwGvWYMl4Y=;
 b=Gpy+Hle+WikTFeHozpdX83+mwuZ9VA1xIiAAGAGdvbRKB/U6TM6Y4fRyBZJR2xygR9
 4BCkIwyAOUWMRT2hR6qqbO6ITrwLC3szr82s6QMopW90w1G3Fdn3WxuAXAxyxlsXYnJJ
 D1faNragfwDXhVIeDyJ4tkuXb8LJIitJTEeSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=J1D0YAy3KCN+DKC/n4HOYEFT5Ge7h0z0gSwGvWYMl4Y=;
 b=MzSiWvDNDHcXuIsPmj5QFMlD1Ah0kYF9+r3EVBqcCRomWgKe+Vzqhvz+CtCJPTd9yw
 fGYmyNg/bFvFI/CTEsNsTTWOXQag0P0aKFJ3yg0n3VIAXryETpir2UkZBeawcVqUPG3V
 zlgG1J1oYW7xWS54bivRic22lUe+0NsDrAhsEp9voOkCxiYW9iVXxBssJyFEPQU9WPHs
 hfgEWamefPDBlldo8+zIjSJh6GpEoEr/HSrs1sjJeh9b6PVJ5jG48C2bREkngkaFzmx9
 MWrtm/Fwyihz4a1xnFoSJ4bhtlhA2g8SJDneNA/dKOtUwndKs+hzX4JcIgFaohsa+ytX
 r19w==
X-Gm-Message-State: AOAM531Rlz5MAsDU6XELDMGhMqxjkYjjHfnFfGzVVsx+uR0VH3HSn338
 THQjA+dWy+gakMSEeg23FshkBQ==
X-Google-Smtp-Source: ABdhPJx8I7ocA2Cs3lnYDgNJH1wvGpMqM8Q/kfBbmW5XCiVmevz8H48nOi3WV7bD9VWVm88ofkhlIg==
X-Received: by 2002:a5d:6991:: with SMTP id g17mr13765368wru.253.1627391098337; 
 Tue, 27 Jul 2021 06:04:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p5sm2882911wme.2.2021.07.27.06.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 06:04:57 -0700 (PDT)
Date: Tue, 27 Jul 2021 15:04:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH v2 1/3] drm: use the lookup lock in drm_is_current_master
Message-ID: <YQAEd5UqPfOiYrih@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 intel-gfx@lists.freedesktop.org
References: <20210724111824.59266-1-desmondcheongzx@gmail.com>
 <20210724111824.59266-2-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210724111824.59266-2-desmondcheongzx@gmail.com>
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
Cc: tzimmermann@suse.de, corbet@lwn.net, airlied@linux.ie,
 gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 24, 2021 at 07:18:22PM +0800, Desmond Cheong Zhi Xi wrote:
> Inside drm_is_current_master, using the outer drm_device.master_mutex
> to protect reads of drm_file.master makes the function prone to creating
> lock hierarchy inversions. Instead, we can use the
> drm_file.master_lookup_lock that sits at the bottom of the lock
> hierarchy.
> 
> Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Applied to drm-misc-next, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/drm_auth.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index f00354bec3fb..9c24b8cc8e36 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -63,8 +63,9 @@
>  
>  static bool drm_is_current_master_locked(struct drm_file *fpriv)
>  {
> -	lockdep_assert_held_once(&fpriv->minor->dev->master_mutex);
> -
> +	/* Either drm_device.master_mutex or drm_file.master_lookup_lock
> +	 * should be held here.
> +	 */
>  	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
>  }
>  
> @@ -82,9 +83,9 @@ bool drm_is_current_master(struct drm_file *fpriv)
>  {
>  	bool ret;
>  
> -	mutex_lock(&fpriv->minor->dev->master_mutex);
> +	spin_lock(&fpriv->master_lookup_lock);
>  	ret = drm_is_current_master_locked(fpriv);
> -	mutex_unlock(&fpriv->minor->dev->master_mutex);
> +	spin_unlock(&fpriv->master_lookup_lock);
>  
>  	return ret;
>  }
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
