Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 474919C2AFA
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 08:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B524510E0A7;
	Sat,  9 Nov 2024 07:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Be+DAcmz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD00810E0A7
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2024 07:17:31 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-53a007743e7so3663695e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 23:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731136650; x=1731741450; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EHUaeS9e58wupBTZi+unSe1iCTz6zWdP/n4haz6XM6g=;
 b=Be+DAcmzDq+cvbhqHsFUhcqInKTxfyPKMF4PVLwRFOdoq0RxzVj4eS5LEwqEgh/esj
 m7H4NFZrX1LuwZCafmVM7Ls6nYkAvf6RcJ3NmE2t2GJQ/bMzvBu4PNBYDJtLlvqT9Frn
 LEAD1ZWJZNFY8rN5HPMiKZIaSrpT+51+JGtyr+lxzh+eCSAkd9cffzLXUTWkDh4+aF8L
 5fCmx2wfeWGnwe+Pn9dydJsHHNffG5xcJH9kozUmA17pOFzPfMWeI83LnM9JRLrRFHSW
 VikTjPMfn7tE/fVO7athwCWfVvAh5mOGF0r/c3jWPm9nvNupBoDCADpEVe4qQKBh1yxS
 z1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731136650; x=1731741450;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EHUaeS9e58wupBTZi+unSe1iCTz6zWdP/n4haz6XM6g=;
 b=JpMVr+0iBViT3FkgaREJWMP6OQdOgLgMDKsG90PhPHHWGAei1Q669GCv7ZkJaQBpMY
 1yC04QPMbBOfoLZStSMaEEkSwTMDU2wbmAmVk7UylZFQoRDPKQMWE4EK9sApWETvEgRN
 n6+hXDr43UFf7DK5UCKSIwV+XXxqSRRZSejq8r7AIHFdJQTIFrid3I38l5Sk5MovHoyB
 Xy2peEkjqMIoqHNS5fnn140loZ+yzgi/LULOWVm/xlgZTV2RZLMslyCm07VcHMkhbnUS
 JQ4YiB+WS+MBEHqqIbVM2BIBPs2vTI8d94BlF0u1jHOsDIy44iafJq3BHCfZUtRnnLko
 d7wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe+QJJMf7dp+kB4eHfku/Kp0vzT5TcFY0NsfRb/5ztRZhXSq7GrW4xVJ8xUa5iPrwZP0IGPgIQTaI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLxWH4bxxnCHB4Pn5sm149U901O3dfRWiRYbmXNe/a+sNNgw+7
 XinGH194VihZAVJLNGzbDVAuArAsjlxqyYZtwrvyGBqk+kDUnYbJ9YS/TxrrkrM=
X-Google-Smtp-Source: AGHT+IF6pPVyHIuCfkrHbrnoRwNG36vLEw644YibuKEFHAGwh0LXfQaZBO+/vLKGW0b7AToo6GiOmw==
X-Received: by 2002:a05:6512:3f11:b0:539:ec87:bc7f with SMTP id
 2adb3069b0e04-53d86231c05mr2939389e87.19.1731136649659; 
 Fri, 08 Nov 2024 23:17:29 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53d8268654dsm858927e87.72.2024.11.08.23.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 23:17:28 -0800 (PST)
Date: Sat, 9 Nov 2024 09:17:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/6] drm/sun4i: use drm_hdmi_connector_mode_valid()
Message-ID: <gbn7qal7pbeizuse3ge4ecvxuwcnhuauxyb5xist27uwi7ydyw@zeqvg4j26sxn>
References: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
 <20241101-hdmi-mode-valid-v2-2-a6478fd20fa6@linaro.org>
 <20241108-gainful-lionfish-of-progress-758dcb@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108-gainful-lionfish-of-progress-758dcb@houat>
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

On Fri, Nov 08, 2024 at 03:20:48PM +0100, Maxime Ripard wrote:
> On Fri, Nov 01, 2024 at 02:25:05AM +0200, Dmitry Baryshkov wrote:
> > Use new drm_hdmi_connector_mode_valid() helper instead of a
> > module-specific copy.
> > 
> > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 12 +-----------
> >  1 file changed, 1 insertion(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> > index b3649449de3026784ae2f3466906403a0b6e3b47..54b72fe220afacc208b3fd48d5160031127ea14a 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> > @@ -205,16 +205,6 @@ static int sun4i_hdmi_connector_atomic_check(struct drm_connector *connector,
> >  	return 0;
> >  }
> >  
> > -static enum drm_mode_status
> > -sun4i_hdmi_connector_mode_valid(struct drm_connector *connector,
> > -				struct drm_display_mode *mode)
> > -{
> > -	unsigned long long rate = drm_hdmi_compute_mode_clock(mode, 8,
> > -							      HDMI_COLORSPACE_RGB);
> > -
> > -	return sun4i_hdmi_connector_clock_valid(connector, mode, rate);
> > -}
> > -
> >  static int sun4i_hdmi_get_modes(struct drm_connector *connector)
> >  {
> >  	struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
> > @@ -269,7 +259,7 @@ static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
> >  
> >  static const struct drm_connector_helper_funcs sun4i_hdmi_connector_helper_funcs = {
> >  	.atomic_check	= sun4i_hdmi_connector_atomic_check,
> > -	.mode_valid	= sun4i_hdmi_connector_mode_valid,
> > +	.mode_valid	= drm_hdmi_connector_mode_valid,
> >  	.get_modes	= sun4i_hdmi_get_modes,
> >  };
> 
> It's only slightly related, but the atomic_check implementation that
> will be the last (direct) user of sun4i_hdmi_clock_valid is wrong and
> doesn't call drm_atomic_helper_connector_hdmi_check

I can send a patch fixing this, but I can't test it.

-- 
With best wishes
Dmitry
