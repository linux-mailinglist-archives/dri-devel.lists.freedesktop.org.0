Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DA19688FF
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 15:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E0010E2E1;
	Mon,  2 Sep 2024 13:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Ln17nv3r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46AA210E2EB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 13:36:16 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-42c5347b2f7so19970755e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 06:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725284175; x=1725888975; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6v3FtktqquHZEtnfmY82ilNEJb6ksXTawePio7XooLM=;
 b=Ln17nv3rFjD12IrPeMhsB5ujohswHhRkZcZify0VdM230R+hiRCBR7LLH8hZpBXuEL
 i82EyxBrGSYEw08dt0gD1kjg6O2ih6aLjd2sTPXANHhY+zAH4iwzxgX/3U04c5ezloyZ
 v89+4at+UbHQEyugZnp4N95q8mMMMfhZbKS/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725284175; x=1725888975;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6v3FtktqquHZEtnfmY82ilNEJb6ksXTawePio7XooLM=;
 b=jZo012bepwlnjcG5LQeB/yunPh/jJnmSDzih9xAlQQWxV5TJBwSSFr3HxbJpWETyuX
 VuW9k9Qm/UEEbEr+0wddEWTB2arEKzKNAphtYIji1JynTJTV5XnicWIjjyoRNrg3lCAj
 JKrD3oXsY63hZJng6MBVyFSWDv9hX3Ommao+5UCesMpLKN/156bKfkx0/Z8lIgmszJJ3
 Z73ovBZAR0ZR3bI4C3Bj1+h95AmxmEvtGvUYBLGL0O+v18hGzK6Qblx8/XHQ3Bv874HK
 sSFSUTxjm2IBRym5uqzFZ9d9HT0PF/tUZKjHqF08ox4LQ/5NKyEWma9KzsgjTZtp+hj7
 lFyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgG3X2ULlxnDk7nWWt8TserO0rrU+NJaBG10msfmgPDuFQVcoqX+Az4ic2dTsUiBnwKK4LnziJNl4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZndaPF/kNcOQFnjtEe0cLU3Kvalh71U5hxrdsYRTlb1YIst8P
 SfDqn9NMFnbJPBH0FHfR13LfIzegDu6rwfnCCGV1sNVX2xkmpfazEFADRCVYk7g=
X-Google-Smtp-Source: AGHT+IFmCAd/UKn+8RiDLAzhiVps6I/r8wIzIThrxAPcZIbCaz99pcPpBKWDT6e22RdxtT79ulMxyg==
X-Received: by 2002:a05:600c:3b11:b0:429:a05:32fb with SMTP id
 5b1f17b1804b1-42bb01b4428mr88808955e9.10.1725284174404; 
 Mon, 02 Sep 2024 06:36:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c7fa443esm4065467f8f.41.2024.09.02.06.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 06:36:14 -0700 (PDT)
Date: Mon, 2 Sep 2024 15:36:11 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 quic_abhinavk@quicinc.com, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 13/21] drm/msm/dpu: Require modeset if clone mode status
 changes
Message-ID: <ZtW_S0j5AEr4g0QW@phenom.ffwll.local>
Mail-Followup-To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 quic_abhinavk@quicinc.com, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-13-502b16ae2ebb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-13-502b16ae2ebb@quicinc.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Thu, Aug 29, 2024 at 01:48:34PM -0700, Jessica Zhang wrote:
> If the clone mode enabled status is changing, a modeset needs to happen
> so that the resources can be reassigned
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 1b0cc899e8c1..99eaaca405a4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1306,6 +1306,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  	int rc = 0;
>  
>  	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
> +	bool clone_mode_requested = drm_crtc_in_clone_mode(crtc->state);
> +	bool clone_mode_enabled = drm_crtc_in_clone_mode(crtc_state);
>  
>  	/* there might be cases where encoder needs a modeset too */
>  	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
> @@ -1313,6 +1315,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  			crtc_state->mode_changed = true;
>  	}
>  
> +	if ((clone_mode_requested && !clone_mode_enabled) ||
> +			(!clone_mode_requested && clone_mode_enabled))
> +		crtc_state->mode_changed = true;

So two things, and kinda about the overall patch series:

- msm is confused about crtc_state->mode_changed, e.g. it sets it if
  crtc_state->active_changed, which is wrong. Or msm dpu code doesn't use
  drm_atomic_crtc_needs_modeset() correctly.

- changing crtc_state->mode_changed from your crtc or plane callbacks
  means you cannot use drm_atomic_helper_check directly, but need to roll
  your own that calls drm_atomic_helper_check_modesets again as needed.
  See the kerneldoc comment for drm_atomic_helper_check_modesets()

- the same holds if you set mode_changed from your encoder or bridge
  functions, but I think this doesn't apply here for this patch.

I think it'd be really good to

- review existing kerneldoc and please submit patches where it's not clear
  or detailed enough

- add checks to the atomic helper code to catch this. I think the best way
  would be to check if drm_atomic_crtc_needs_modeset() changes outside of
  areas where the helper code allows it already (essentially connector
  functions setting ->connectors_changed), and set a new
  drm_atomic_state->dirty_needs_modeset. Which
  drm_atomic_helper_check_modeset would clear, and which would result in a
  WARN_ON in drm_atomic_check if it's not yet cleared when the driver
  returns with success.

  Otherwise there's just no way I think to make sure drivers get this
  right.

Can I please sign you up for these patches?

Thanks, Sima

> +
>  	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>  		rc = dpu_crtc_assign_resources(crtc, crtc_state);
>  		if (rc < 0)
> 
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
