Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7F93D222D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 12:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D997D6EDF1;
	Thu, 22 Jul 2021 10:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72BD6EDF1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 10:38:13 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id oz7so7701931ejc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 03:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Wstdp1MW7vJbJhg9S6cQf30gHHvyvOesRSnlOhoSLio=;
 b=h+h448QZAeHgdzElhjIT7EVFpu2g3yncCXFAsqDRIlSE3VCkeb8XYv1XLXU30ldtly
 DYH4gNzgye3p6+lFgsRyqYCHq9GBYVe783jE5nqDtXJZNpJjsMpO2Vwi7vCWnNl0RJkk
 S3ujNtCviEkax03zXYTgYFkpLx5jQLmG/h14o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Wstdp1MW7vJbJhg9S6cQf30gHHvyvOesRSnlOhoSLio=;
 b=PPi0IhPnk8AMS6W3+HausnvupW53Iq/yDmIaIKapSJ97ILcahr/bN0WaxVCsWDLJnW
 q+3nchH7ZcwdXMlUjLofVajugzC5tvr33zZekGrOMQ1igFKF8dhNcLIXJJQAriBETEPa
 zjySgWxBDPHHkML1/KoViPJHegyYaorjQJeRkGnr2Sdm95wNJw7OhtLz21FTZxcsNKc7
 upqRFrQDSXOAFTkpKYkKXI3EBjBWOZ51nNupnBpFkhcCD1K1OjRW33x8PZjEx45Xb1Zg
 nIHbXxOSBMpIMoeGc8s6CBjsLZ7YxKzKiGpf9kIae2ZO7HgP9wmsi88eAgSfcEuCjQtm
 xTKg==
X-Gm-Message-State: AOAM531CcHE7ySgcBMUSGEib5PrgD+hgrNjjYvAvHZPorm+KcrWUTwO4
 XwRbxrhpDkLO2pmFWA5a+UOcfg==
X-Google-Smtp-Source: ABdhPJyvNFTXUsWWogCgbPWqj36KbH0l8c92VS2Gb7tEe20TGtUFTGN7YFqOdDdDz79DMhuBpXMesA==
X-Received: by 2002:a17:906:f92:: with SMTP id
 q18mr43617437ejj.353.1626950292593; 
 Thu, 22 Jul 2021 03:38:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id cn21sm12272770edb.81.2021.07.22.03.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 03:38:11 -0700 (PDT)
Date: Thu, 22 Jul 2021 12:38:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 1/3] drm: use the lookup lock in drm_is_current_master
Message-ID: <YPlKkvelm/mcnCj0@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210722092929.244629-1-desmondcheongzx@gmail.com>
 <20210722092929.244629-2-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210722092929.244629-2-desmondcheongzx@gmail.com>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, gregkh@linuxfoundation.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 22, 2021 at 05:29:27PM +0800, Desmond Cheong Zhi Xi wrote:
> Inside drm_is_current_master, using the outer drm_device.master_mutex
> to protect reads of drm_file.master makes the function prone to creating
> lock hierarchy inversions. Instead, we can use the
> drm_file.master_lookup_lock that sits at the bottom of the lock
> hierarchy.
> 
> Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
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

Disappointing that lockdep can't check or conditions for us, a
lockdep_assert_held_either would be really neat in some cases.

Adding lockdep folks, maybe they have ideas.

On the patch:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

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
