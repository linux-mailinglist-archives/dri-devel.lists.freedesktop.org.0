Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F7C39FC3D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 18:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C616E0EC;
	Tue,  8 Jun 2021 16:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693016E0EC
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 16:20:04 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id i94so17188954wri.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 09:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=WHP+bfUpSSgGU+40YQorcw79is7T2xXrk6IDd2U02us=;
 b=c/v0NunbtdBf4Xod9Iby2PJdbikNXHp0gGbmCubNDw59u9q+q37XhdKtWUVUnFxG0D
 /mvqUjSLG6Drp3g+Jz0p8IOhe11FJ7AOkte64ETRH1iBseT1w05UpzQqgb4yyTNW+kfl
 nnFJDfxFmxYnq6Z6MOackwV895C/U/b1UD0B8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=WHP+bfUpSSgGU+40YQorcw79is7T2xXrk6IDd2U02us=;
 b=ka7QuNCJUZyNwqCl0oXFu937sKJ6P0nodW3jvWYfh67dFLSviS2/pCQso/nemOu82g
 eLY7RpN+Q/S0ku5t2WcNDj2BjYleJU9m4leo4OqB7rhGxtCMNUiJOegoBpiim7E4AvsT
 8rLRMwRBfHhm4pK4nROgvjiEwQX6NOIc9KmZ54MsSxIt3o4VqMnD+XbpZEBnIzxw8yRY
 DYkXnpnom3v8MUWJc7l9me/HjWJpTROPWjuULBoCfaMzG7O/QzDevtFwNZBQ8qaAJlbd
 ES0PzwiNbggAkJPVTaAQcdNKZPRLlMLnnHiCRE7UcoQVVp1AxcTz3LFgmyD7k1p5FkxO
 e/Fw==
X-Gm-Message-State: AOAM530jVRSb9xsvciniM6mpwj2e7u8Yi1KUPowRf+bMa9b6HoQ4+4bE
 6MeY4SjuIe/gQ2NPg3wsEsT92g==
X-Google-Smtp-Source: ABdhPJz+2SyUcy0W2KB1qYd96JVRrSCiw9s0a2u5+A255K0jX40r7indtLoxfqUrXGXSkFD91UfgkA==
X-Received: by 2002:a5d:6b0b:: with SMTP id v11mr22883654wrw.339.1623169202970; 
 Tue, 08 Jun 2021 09:20:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m37sm11891194wms.46.2021.06.08.09.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 09:20:02 -0700 (PDT)
Date: Tue, 8 Jun 2021 18:20:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH] drm: Fix use-after-free read in drm_getunique()
Message-ID: <YL+YsFUKtK5LbGex@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+c3a706cec1ea99e1c693@syzkaller.appspotmail.com
References: <20210608110436.239583-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608110436.239583-1-desmondcheongzx@gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: tzimmermann@suse.de, airlied@linux.ie, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 syzbot+c3a706cec1ea99e1c693@syzkaller.appspotmail.com,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 08, 2021 at 07:04:36PM +0800, Desmond Cheong Zhi Xi wrote:
> There is a time-of-check-to-time-of-use error in drm_getunique() due
> to retrieving file_priv->master prior to locking the device's master
> mutex.
> 
> An example can be seen in the crash report of the use-after-free error
> found by Syzbot:
> https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803
> 
> In the report, the master pointer was used after being freed. This is
> because another process had acquired the device's master mutex in
> drm_setmaster_ioctl(), then overwrote fpriv->master in
> drm_new_set_master(). The old value of fpriv->master was subsequently
> freed before the mutex was unlocked.
> 
> To fix this, we lock the device's master mutex before retrieving the
> pointer from from fpriv->master. This patch passes the Syzbot
> reproducer test.
> 
> Reported-by: syzbot+c3a706cec1ea99e1c693@syzkaller.appspotmail.com
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

Very nice debug work, thanks a lot!

> ---
> 
> In this patch, I made the assumption that dev and file_priv->master->dev
> refer to the same struct drm_device*, and from my test runs this seemed
> to be the case. If this was a wrong assumption to make, please let me
> know.

Yup that's correct.

Patch applied to drm-misc-fixes and cc: stable added so it gets
backported.

Cheers, Daniel

> 
>  drivers/gpu/drm/drm_ioctl.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index d273d1a8603a..495a4767a443 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -118,17 +118,18 @@ int drm_getunique(struct drm_device *dev, void *data,
>  		  struct drm_file *file_priv)
>  {
>  	struct drm_unique *u = data;
> -	struct drm_master *master = file_priv->master;
> +	struct drm_master *master;
>  
> -	mutex_lock(&master->dev->master_mutex);
> +	mutex_lock(&dev->master_mutex);
> +	master = file_priv->master;
>  	if (u->unique_len >= master->unique_len) {
>  		if (copy_to_user(u->unique, master->unique, master->unique_len)) {
> -			mutex_unlock(&master->dev->master_mutex);
> +			mutex_unlock(&dev->master_mutex);
>  			return -EFAULT;
>  		}
>  	}
>  	u->unique_len = master->unique_len;
> -	mutex_unlock(&master->dev->master_mutex);
> +	mutex_unlock(&dev->master_mutex);
>  
>  	return 0;
>  }
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
