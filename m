Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 320E32056EB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 18:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0D66E152;
	Tue, 23 Jun 2020 16:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9216E152
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 16:17:45 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r12so3853441wrj.13
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 09:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=mtC3PJGWDMIcehgxPBpR+PLKV5Q1ssV6CDNH3+eOQLw=;
 b=AgZt1w4gGD2RpEAMlnkEkOstZUnDRyAAjz/EQMmp6yPl3Lis6UbhheQUte9x7A3Sl8
 INAAavAqBXoG8u813E9qRNezIwY3TA/qTfYzBEtibXtlJot3xHssjhseNF9Iko9zdxlZ
 gSBzxiH+ouRSdrfa366RTmwgZ2QRhz5Frxqn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=mtC3PJGWDMIcehgxPBpR+PLKV5Q1ssV6CDNH3+eOQLw=;
 b=cZrTyLQwKfVkNlKLpX5v2Nvo1C42H8k2ZYrburaK0GDPHS1TbQngfuGOCm4XI/Ge9L
 j1jqLaEImFOi5moiH9clm5xrr5IAJiRNcUbSyPvKgy9BGsv9bXrXaMaQB1aBBIf/CNEW
 AJ+UqAxxbXdBaKT5KurWKucdST2EcZ+3p0aqeov38c/SYCrVYEeuaZXLm8cbmC6mjD5P
 bnLUb2OHQ8E06TjhccauYMvaTS57tUwPljyyxFICazKL9q168OAJFr9Uv+o5iCDFRET/
 9lX8GqqfxBz2rucTzvfVJGV5g9419vg40wtMYDqe8RBvqwKuMHtFraRZy5SRyvZXysFA
 FxjQ==
X-Gm-Message-State: AOAM531meKX6RAiXZXoF26w+vJ9eOftsuj9YEe7e1zqLhMreFjuqMzRD
 ptKC/FWpWxNRk6WKEWg+CYqEMA==
X-Google-Smtp-Source: ABdhPJyWm7Jfm7MiyZs5D80QWQxf/J5hWl6QhbRvpHGCjtbEL/+fbiu5ejjrpoum+qf6AjPPBpCveg==
X-Received: by 2002:adf:e38d:: with SMTP id e13mr5383859wrm.304.1592929064445; 
 Tue, 23 Jun 2020 09:17:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y19sm4146273wmi.6.2020.06.23.09.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 09:17:43 -0700 (PDT)
Date: Tue, 23 Jun 2020 18:17:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [RFC v5 01/10] drm/vblank: Register drmm cleanup action once per
 drm_vblank_crtc
Message-ID: <20200623161741.GN20149@phenom.ffwll.local>
Mail-Followup-To: Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>
References: <20200622200730.120716-1-lyude@redhat.com>
 <20200622200730.120716-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200622200730.120716-2-lyude@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 22, 2020 at 04:07:21PM -0400, Lyude Paul wrote:
> Since we'll be allocating resources for kthread_create_worker() in the
> next commit (which could fail and require us to clean up the mess),
> let's simplify the cleanup process a bit by registering a
> drm_vblank_init_release() action for each drm_vblank_crtc so they're
> still cleaned up if we fail to initialize one of them.
> =

> Changes since v3:
> * Use drmm_add_action_or_reset() - Daniel Vetter
> =

> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/drm_vblank.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 85e5f2db16085..ce5c1e1d29963 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -492,16 +492,12 @@ static void vblank_disable_fn(struct timer_list *t)
>  =

>  static void drm_vblank_init_release(struct drm_device *dev, void *ptr)
>  {
> -	unsigned int pipe;
> -
> -	for (pipe =3D 0; pipe < dev->num_crtcs; pipe++) {
> -		struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> +	struct drm_vblank_crtc *vblank =3D ptr;
>  =

> -		drm_WARN_ON(dev, READ_ONCE(vblank->enabled) &&
> -			    drm_core_check_feature(dev, DRIVER_MODESET));
> +	drm_WARN_ON(dev, READ_ONCE(vblank->enabled) &&
> +		    drm_core_check_feature(dev, DRIVER_MODESET));
>  =

> -		del_timer_sync(&vblank->disable_timer);
> -	}
> +	del_timer_sync(&vblank->disable_timer);
>  }
>  =

>  /**
> @@ -511,7 +507,7 @@ static void drm_vblank_init_release(struct drm_device=
 *dev, void *ptr)
>   *
>   * This function initializes vblank support for @num_crtcs display pipel=
ines.
>   * Cleanup is handled automatically through a cleanup function added with
> - * drmm_add_action().
> + * drmm_add_action_or_reset().
>   *
>   * Returns:
>   * Zero on success or a negative error code on failure.
> @@ -530,10 +526,6 @@ int drm_vblank_init(struct drm_device *dev, unsigned=
 int num_crtcs)
>  =

>  	dev->num_crtcs =3D num_crtcs;
>  =

> -	ret =3D drmm_add_action(dev, drm_vblank_init_release, NULL);
> -	if (ret)
> -		return ret;
> -
>  	for (i =3D 0; i < num_crtcs; i++) {
>  		struct drm_vblank_crtc *vblank =3D &dev->vblank[i];
>  =

> @@ -542,6 +534,11 @@ int drm_vblank_init(struct drm_device *dev, unsigned=
 int num_crtcs)
>  		init_waitqueue_head(&vblank->queue);
>  		timer_setup(&vblank->disable_timer, vblank_disable_fn, 0);
>  		seqlock_init(&vblank->seqlock);
> +
> +		ret =3D drmm_add_action_or_reset(dev, drm_vblank_init_release,
> +					       vblank);
> +		if (ret)
> +			return ret;
>  	}
>  =

>  	return 0;

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> -- =

> 2.26.2
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
