Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DF2968E69
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 21:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF8A10E3A7;
	Mon,  2 Sep 2024 19:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z0pnexfn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E841910E3A7
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 19:20:16 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5343617fdddso7791023e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 12:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725304815; x=1725909615; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mUGAXK1hKOV3+wB8uekRhtvLfY66UbI/02mitVxdOs0=;
 b=Z0pnexfnJ825h1UN6rdZdd9KZ8Bx2+rNm8uhTAgEwL6tvZLf0LcPi3cTI+yfe9yr/a
 chC3Ip3JAdrFFG4Ezxs0nsc6uifDOl72SxZfL2Huh7fGev2bMJ/0+ta4RY4sQ6PJYb1N
 vYUThQpvIBTO9NZTK8jT6sq/odiBx0xhulXBMyKgYsY4QEpLa9aPE9vrXbI6cO3uDQwY
 hGyIXYvPGVNZVmgHz7XDMGVyzVfB5hSHfC+ieKZ7zfAZ8aOQcHEZIzzjHBbtd38mM8Ru
 jDtWCJtw6UQeY6kXH8CeKfGOY8SdpTARcAaplrS/7O7BaqHeRavsbXoJjmltw0yQXSrv
 kvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725304815; x=1725909615;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mUGAXK1hKOV3+wB8uekRhtvLfY66UbI/02mitVxdOs0=;
 b=ak9pQQHdRkzmf7mLw2FcWKIqrVG6VVFVViGkBGi6eFYBgDWfytYsZ/GF+xy8QfB73u
 QMs7yhIs0KZG4jmyjCp3L6bHdw9ZUfQpOPbbiOZgj/M2uH0EW1ckF47zQZUxbZdxtQ23
 4LX23GivgDyTWoPPltJ9u1fy8H/feWzfq9D1GC/lMqh5kyHqE+wkAL5wsdOCPC+uop1S
 4SXZfI2CmiPvVvXB+7kTCOo79j3/hx0uwo2EKEO2n7UFfWof+lWglnq8mAa0jLP1ZYFF
 eWTYjoHLokY7ZhBqc5Udb8+nPHZcicLl12SUSRVlEcTJWkefQfoQwhTYvKXbuP+sKS7p
 WRNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5I79jxbW0vP+noRrSvQE4OZ3S9w+Eb6TAKVQZKawcnX9dt5j5cBt2sJfo0tkGUz3kJoxSoogQjek=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDRkPUU1gIScAFBMPysj1zJiYipT3EYWgQ2aPZbBqPKHuF4K/3
 p2p0D2An7eyoj/QzQ3aygL3A618cN322ViqU6oOvPrSBL6sUIi4OPJPX7tcsC/Y=
X-Google-Smtp-Source: AGHT+IGGo56pov4G+ai8zQD/ZYuRwqu3sLehEJovaHclSKmZPLCymGG8vHRMwdbvoarWm4cuSQl1jg==
X-Received: by 2002:a05:6512:159d:b0:52f:cd03:a84a with SMTP id
 2adb3069b0e04-53546bde0f1mr9344200e87.39.1725304814162; 
 Mon, 02 Sep 2024 12:20:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5354084ddd9sm1747449e87.256.2024.09.02.12.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 12:20:13 -0700 (PDT)
Date: Mon, 2 Sep 2024 22:20:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com,
 Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 13/21] drm/msm/dpu: Require modeset if clone mode status
 changes
Message-ID: <zg3v3uoq2j6qqnqai4epdsdqdkd7tr36dfb3nbtggc2wrmhszl@dkfqbb2g6lun>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-13-502b16ae2ebb@quicinc.com>
 <ZtW_S0j5AEr4g0QW@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtW_S0j5AEr4g0QW@phenom.ffwll.local>
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

On Mon, Sep 02, 2024 at 03:36:11PM GMT, Daniel Vetter wrote:
> On Thu, Aug 29, 2024 at 01:48:34PM -0700, Jessica Zhang wrote:
> > If the clone mode enabled status is changing, a modeset needs to happen
> > so that the resources can be reassigned
> > 
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index 1b0cc899e8c1..99eaaca405a4 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1306,6 +1306,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
> >  	int rc = 0;
> >  
> >  	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
> > +	bool clone_mode_requested = drm_crtc_in_clone_mode(crtc->state);
> > +	bool clone_mode_enabled = drm_crtc_in_clone_mode(crtc_state);
> >  
> >  	/* there might be cases where encoder needs a modeset too */
> >  	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
> > @@ -1313,6 +1315,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
> >  			crtc_state->mode_changed = true;
> >  	}
> >  
> > +	if ((clone_mode_requested && !clone_mode_enabled) ||
> > +			(!clone_mode_requested && clone_mode_enabled))
> > +		crtc_state->mode_changed = true;
> 
> So two things, and kinda about the overall patch series:
> 
> - msm is confused about crtc_state->mode_changed, e.g. it sets it if
>   crtc_state->active_changed, which is wrong. Or msm dpu code doesn't use
>   drm_atomic_crtc_needs_modeset() correctly.

This seems to be a leftover from prehistoric times and it should be
removed or reworked. I'll take a look during the next development cycle.

> 
> - changing crtc_state->mode_changed from your crtc or plane callbacks
>   means you cannot use drm_atomic_helper_check directly, but need to roll
>   your own that calls drm_atomic_helper_check_modesets again as needed.
>   See the kerneldoc comment for drm_atomic_helper_check_modesets()
> 
> - the same holds if you set mode_changed from your encoder or bridge
>   functions, but I think this doesn't apply here for this patch.

Yes. But we have it already in dpu_encoder.c. And we didn't notice that.

We have the code in dpu_encoder.c which makes sure that the hardware
resources get reallocated if required. As we already have code in
msm_atomic.c which sets mode_changed for this purpose (before calling
drm_atomic_helper_check()) it might simply make sense to add pre-check
callbacks to msm/dpu encoder. I will try working on that during or after
the LPC if Abhinav doesn't pick up that issue.

In the end we still have debt regarding the allow_modeset in
msm_atomic_check(), I remember.

> 
> I think it'd be really good to
> 
> - review existing kerneldoc and please submit patches where it's not clear
>   or detailed enough
> 
> - add checks to the atomic helper code to catch this. I think the best way
>   would be to check if drm_atomic_crtc_needs_modeset() changes outside of
>   areas where the helper code allows it already (essentially connector
>   functions setting ->connectors_changed), and set a new
>   drm_atomic_state->dirty_needs_modeset. Which
>   drm_atomic_helper_check_modeset would clear, and which would result in a
>   WARN_ON in drm_atomic_check if it's not yet cleared when the driver
>   returns with success.
> 
>   Otherwise there's just no way I think to make sure drivers get this
>   right.
> 
> Can I please sign you up for these patches?

Ack.

Thanks a lot for pointing out the issue!

> 
> Thanks, Sima
> 
> > +
> >  	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> >  		rc = dpu_crtc_assign_resources(crtc, crtc_state);
> >  		if (rc < 0)
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
With best wishes
Dmitry
