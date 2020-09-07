Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DBF260444
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 20:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644C96E523;
	Mon,  7 Sep 2020 18:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0956E51B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 18:08:35 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j2so16635123wrx.7
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 11:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=LyC2hdr432eimG+v9CNZwHQUaeAr5ZvsQoUp02RMXgk=;
 b=IGRDLxJCQoA5wn8W4Fh4ZFsBr0p2ZRTFU/tGv89LVnsHf1JwVn2tK1EYmtAKPGb0HK
 OIjD+kSK51lDshKeYrP5FCoFK+oaC2TmxZb7cjSag8EBFxWang1LH6lu5K0JO480n/S3
 7qZuMeLRQ4kfw7L/1fth4+DDjocRltjNce7B4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LyC2hdr432eimG+v9CNZwHQUaeAr5ZvsQoUp02RMXgk=;
 b=IkLooA+n9AcsBNfqC357t+q9EJFfLC5eUK74tCv7xQS1BRiKhUAmNQ1HXpJ6WDTNzu
 eABNDCnWA2fUfPMOW9s8ToOjYFTMsEytYqYW7BfSvTlU15FJwZH0gA7fkeya8Zx50D9h
 x/HsQp6tqr1mFVe03XU3INiSB4YwKTTEFiXWyRnBt5scOKGO7oWk4FBPdHcVAM9UqQup
 p0F1LvffrVvfzUB5frhBhRjgn4evUwIzrQwAL+EKPWdVOhqT6D871XjAFnsKtZ5/F1RQ
 zjBGD84Wywh8OqwZvAZlL4RfcQVrBleHcKvN9tcD25fKatsVaBJnQYyzLQd7Dk4oCVf7
 sByg==
X-Gm-Message-State: AOAM530sJ1jMFRGFVAJFH1pH+cuMzdsTWGt8xu4YeWIGd/qFpl/y7TS/
 +l9ZvBWbj/oxFa6XhdxBgPSr9TlcwbhTAQFK
X-Google-Smtp-Source: ABdhPJzf9iasfMyP69kS/BjMba1lWNCMlHAfC9BSwlYkOWCFyKNaAafYVRb7ysuEZ7jgu9jwg6k4bQ==
X-Received: by 2002:a5d:67cd:: with SMTP id n13mr22354183wrw.51.1599502113991; 
 Mon, 07 Sep 2020 11:08:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b76sm28335064wme.45.2020.09.07.11.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 11:08:33 -0700 (PDT)
Date: Mon, 7 Sep 2020 20:08:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/atomic-helper: Extract
 drm_atomic_helper_calc_timestamping_constants()
Message-ID: <20200907180831.GA2352366@phenom.ffwll.local>
References: <20200907120026.6360-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907120026.6360-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 07, 2020 at 03:00:24PM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Put the vblank timestamping constants update loop into its own
> function. It has no business living inside
> drm_atomic_helper_update_legacy_modeset_state() so we'll be wanting
> to move it out entirely. As a first step we'll still call it
> from drm_atomic_helper_update_legacy_modeset_state().
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 22 +++++++++++++++++++++-
>  include/drm/drm_atomic_helper.h     |  3 +++
>  2 files changed, 24 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c
> index 9e1ad493e689..673e3fc282d9 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1186,13 +1186,33 @@ drm_atomic_helper_update_legacy_modeset_state(str=
uct drm_device *dev,
>  			crtc->x =3D new_plane_state->src_x >> 16;
>  			crtc->y =3D new_plane_state->src_y >> 16;
>  		}
> +	}
>  =

> +	drm_atomic_helper_calc_timestamping_constants(old_state);
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_update_legacy_modeset_state);
> +
> +/**
> + * drm_atomic_helper_calc_timestamping_constants - update vblank timesta=
mping constants
> + * @state: atomic state object
> + *
> + * Updates the timestamping constants used for precise vblank timestamps
> + * by calling drm_calc_timestamping_constants() for all enabled crtcs in=
 @state.
> + */
> +void drm_atomic_helper_calc_timestamping_constants(struct drm_atomic_sta=
te *state)
> +{
> +	struct drm_crtc_state *new_crtc_state;
> +	struct drm_crtc *crtc;
> +	int i;
> +
> +	/* set legacy state in the crtc structure */
> +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
>  		if (new_crtc_state->enable)
>  			drm_calc_timestamping_constants(crtc,
>  							&new_crtc_state->adjusted_mode);
>  	}
>  }
> -EXPORT_SYMBOL(drm_atomic_helper_update_legacy_modeset_state);
> +EXPORT_SYMBOL(drm_atomic_helper_calc_timestamping_constants);
>  =

>  static void
>  crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *old_state)
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_hel=
per.h
> index b268180c97eb..85df04c8e62f 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -74,6 +74,9 @@ void
>  drm_atomic_helper_update_legacy_modeset_state(struct drm_device *dev,
>  					      struct drm_atomic_state *old_state);
>  =

> +void
> +drm_atomic_helper_calc_timestamping_constants(struct drm_atomic_state *s=
tate);
> +
>  void drm_atomic_helper_commit_modeset_disables(struct drm_device *dev,
>  					       struct drm_atomic_state *state);
>  void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
> -- =

> 2.26.2
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
