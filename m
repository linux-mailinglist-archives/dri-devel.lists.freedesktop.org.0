Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B714B9ED4BB
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 19:33:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B2D10EBE3;
	Wed, 11 Dec 2024 18:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MRlBdk87";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4205110EBE9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 18:32:56 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53ffaaeeb76so4382029e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 10:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733941974; x=1734546774; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qwjqsNH/3nF2Q3XbWudExYhlk4EBq4Q9BHCqHdvdEaI=;
 b=MRlBdk87yd5XRun6HxduAb3YdKzkUfpEMA9bIt/QJ+Kq4nAMlDgErn1RoQ6Q35yOQn
 TEWHGFQHtrGuu/dYCiAl+WSTATsibcyCpwOZnm163/j8tW9QUjvEPVhUu6tIzB59rqjm
 AcxLRhyGdmFpUhguwsbDd96u2RfhH1VyyUkDkB8mKJIFsnVnAq1ADZsxzzcDf9eM6tIX
 nb/W4apOT4tVBW3WbeVpvx77ky1vcCGddv9jewJSsfIXKjWweeJ9YDu644P8be6Rk1Lm
 Gde/cQI8Dn64FVHT3ZK9Y7uX8C8h7YXSb+Cd1wignrUFXbBLPBF15Qoi+B+8ggKL1GO5
 455g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733941974; x=1734546774;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qwjqsNH/3nF2Q3XbWudExYhlk4EBq4Q9BHCqHdvdEaI=;
 b=KKAI41ukY/KWQO1XhC98eG7inMYntW0V76h4whUiiFxtn0Oto2aMkyBoWHNz+BNl0O
 WUO7ShjY96NsVNynO4OvpprSSz1IIDx7G3PmtOxaFExsCNRxC2G0aDCriyflyZF+gtQL
 BVnmXEY+sWgqnQfsZcAkX8iiI70d6TwzKCaRlzcsUeRW4l7zFA4i6Fol7tfv1zrvG4Yl
 3hg6eO7Hj1bz46ryhMlMOkGjSzBi2DZIzgCPpppRCdyrwQdB4i3M0oVdPvRQhUwH7cQK
 p7z+xd/9jBSvRsCoAQzXdEToH7Ma3izPVPlccM/HwA6AKB8iMihM5fu2IBBb1e+v/3Hn
 YAeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtQVQ0jXqhTe4xvAb8yd/XsAEfDpWXciVXJmErGAbVlwfTZTlRrJ1Z0dPYoHlEgllLjbItV8RWMdw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeWUXUpsF82BUtcrfYBSDatXJLHcjCLtmuPGJtGthYAOk5lHAx
 00Pyb+wmvG2c49ML38wWrOy59dVrnIWs3CL9+czMhIjyfUFo1zyw0/qpEt8dmLk=
X-Gm-Gg: ASbGnct1G0tv3DQicr0w42SRWxIK3Va/QqsmT/ZYUViHE7TW8b84VIBt+ZxXxx6p7mP
 ofFgGS6qBc2rVpEQxOyak+KNSazZBvjXv99GzMvxEAqbSThMqLChXTGn3fzCCGlgTDDO9RRF850
 xd8olR16r++zgKNGIt3Ck3/6JawriyO0Kh80+ULcHYDVGCquI3z/Xy0k4BRbj6Djrmdthdcbtrx
 4xMWy9qmw7q0X3kWcaWwayZwU+samwrRX7kXlf0+FR+MmEw/nc6XV3b1rrOX8umrk8cf2SamOL8
 Hcl/9nZ4yqoy6TAc5BFxUcwlLlvJ4xcedQ==
X-Google-Smtp-Source: AGHT+IFmZdkDf94Jsx8fCrALITW/9iPuUY5e7Ad8TDSKUOMmNblYCFB7l7IPRhIdF6tMpVRDpdpenQ==
X-Received: by 2002:a05:6512:1329:b0:540:1dac:c03d with SMTP id
 2adb3069b0e04-5402f04d0ffmr331050e87.57.1733941974289; 
 Wed, 11 Dec 2024 10:32:54 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5401d2aab5csm1134637e87.168.2024.12.11.10.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 10:32:52 -0800 (PST)
Date: Wed, 11 Dec 2024 20:32:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <3omcjrgfkdmw466ok7gej2jge25vtwzaiycwz2xgejwppyvkza@rhssgk7xz4hj>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
 <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>
 <Z1mk08SHEd5_vc99@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1mk08SHEd5_vc99@hovoldconsulting.com>
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

On Wed, Dec 11, 2024 at 03:42:27PM +0100, Johan Hovold wrote:
> On Wed, Dec 11, 2024 at 03:04:12PM +0200, Abel Vesa wrote:
>  
> > +/**
> > + * drm_dp_lttpr_set_transparent_mode - set the LTTPR in transparent mode
> > + * @aux: DisplayPort AUX channel
> > + * @enable: Enable or disable transparent mode
> > + *
> > + * Returns 0 on success or a negative error code on failure.
> > + */
> > +int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable)
> > +{
> > +	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
> > +			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
> > +	int ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE, val);
> > +
> > +	return ret == 1 ? 0 : ret;
> 
> This looks correct, but I had to go look at drm_dp_dpcd_writeb() to make
> sure it never returns 0 (for short transfers).
> 
> > +}
> > +EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);
> 
> This appears to be what the driver currently uses, but why not
> EXPORT_SYMBOL_GPL?

$ git grep EXPORT_SYMBOL drivers/gpu/drm/*.c | wc -l
962
$ git grep EXPORT_SYMBOL_GPL drivers/gpu/drm/*.c | wc -l
93


-- 
With best wishes
Dmitry
