Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C18BA5A4A9
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 21:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FC410E4DD;
	Mon, 10 Mar 2025 20:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="M8WeATvQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3580E10E2BA
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 20:18:10 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30bfed67e08so27022851fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 13:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741637888; x=1742242688; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Na0+//dCirkAQ9ySuY1KKDPsWyMmAsRZj0GKZr2mXwM=;
 b=M8WeATvQmX8MuXFDWX3zoycilLC3oagmLkM6IVNUU2+W5tIgHamjpOCPDWlONlZgIE
 WXlw3X6J+T6M3WPNlQ/tRsJpcU05XNp3dkyG+VPh7ahbnxBAmaNTY/cC+9b7gmwuWKii
 aa4lbaIvrfD/0RL3Qqc26BvlG76gQkMRbXk04hCxejMXSlhY5Ixh9UGw1+gxzYbmgfkv
 ClVSZotlo9gjrRRt9GSDKvavHK/beWoJkmTJNeG+wFHTIjqV5gNYX9qXdy1TmNT/XLkR
 xeUsujPul1dVqSc/jCf8Gd1PnYxDl6mxL4OSttagQOJ0lcy6Vb/RUEZza6Wpr8m+jE9R
 5yjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741637888; x=1742242688;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Na0+//dCirkAQ9ySuY1KKDPsWyMmAsRZj0GKZr2mXwM=;
 b=rnO2zrzNKLp41nOFzaq6heacgmTm1JCT38ZidFmxXudjEgyzoCK6zgqBbthC2GXedz
 Y98MjDM/NPRYaDYv2xv6/rZJ/LbHJVFpC+6FEvcT8X31/ajFdJ6yZrNxLohnc3n4atIf
 1nw70ilKpTgTWUn7y0iXsZMDFA+Sx2VqTyes8d+OPkB0a3GB7qO9FAnZUypKIqlwxqT/
 0rzFaTzjUFLnyviSCgfLY+8uUZQ+eX31HC9aZ8N/7hpKbORkZqQTdr3HAb4XBL6WFyII
 Vg152i8cBdIqo+y2Eztg1t0FXYrBuCz/ShyercPMfgkVHYctK1DzlS1qQ13HfzQ8tUr6
 i91w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWUG5f7/UOGLPXCWBLl32KgCa8SYcqVhvg9LBnMP8uUHousY3X5g9DtuYT9RMGPSnSru7yVZpto1c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbXH5XJvw0vJU52gRRvGknkvw2P/mF2j/wCYltYtC/8tIYhGLx
 mQbPvIFYDCksog9VopWebb4gF/JYYF5DIayHwQV9cr1jrhlJLKXHtGgKvmQoRbI=
X-Gm-Gg: ASbGncuHPZZXR2u0n2iCISL8aYrcLHo0v3/vmFmmnibX9Uai3XJB2hn7+UcFJY1MbvI
 G5zwP3zwuaoPWUiHjhbwz7wWm7PTZfxpNoeNrvb/w3YpmG8Pzd4vFSXaNv1RQK8989GmrpKTpnh
 e6vxMofSFH+YkQScs00GK+bQbunL5jpWN9rBNUIPaPL4jcZAhEEdyTisbkQTGROx7cH2CRjLhBY
 LGMQQJiNQ/SSulrdBJ4vfnO/PyFoxgvsIOphtIK6O5x6NKIktcBAw2vx8fWCHjVhvPpDr1UikrY
 TfKR5K8L9IlQikavQQLd7QGIAWeXZADVa9sfEIuBM5nUHk1G0bMp48T+NDvHZI1ZE3UHdFXSNyJ
 4yLOo0WzvCI/CdqaTIzsqkta4
X-Google-Smtp-Source: AGHT+IHcA7kOtf3sam4WAbu1ps2qyynLobUE0HG0axG5MF7JuYSDH5Zq3T6DIc7mWO7eWXCbFWGVLA==
X-Received: by 2002:a05:651c:3c3:b0:30b:c569:4665 with SMTP id
 38308e7fff4ca-30bf46468dcmr39513851fa.29.1741637888405; 
 Mon, 10 Mar 2025 13:18:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30bef40f9cdsm16595941fa.48.2025.03.10.13.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 13:18:07 -0700 (PDT)
Date: Mon, 10 Mar 2025 22:18:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/4] drm/vc4: use new helper to get ACR values
Message-ID: <esgb42dyhpjixm62tfk2nfzdiygnfn4bcwq4zn7rhydmt4np2q@7v77p7kveb4e>
References: <20250309-drm-hdmi-acr-v1-0-bb9c242f4d4b@linaro.org>
 <20250309-drm-hdmi-acr-v1-3-bb9c242f4d4b@linaro.org>
 <20250310-invisible-married-firefly-945c84@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310-invisible-married-firefly-945c84@houat>
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

On Mon, Mar 10, 2025 at 03:51:53PM +0100, Maxime Ripard wrote:
> On Sun, Mar 09, 2025 at 10:13:58AM +0200, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Use drm_hdmi_acr_get_n_cts() helper instead of calculating N and CTS
> > values in the VC4 driver.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +++-------
> >  drivers/gpu/drm/vc4/vc4_hdmi.h |  7 +++++++
> >  2 files changed, 10 insertions(+), 7 deletions(-)
> > 

> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> > index e3d989ca302b72533c374dfa3fd0d5bd7fe64a82..0a775dbfe99d45521f3d0a2016555aefa81d7934 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> > @@ -211,6 +211,13 @@ struct vc4_hdmi {
> >  	 * KMS hooks. Protected by @mutex.
> >  	 */
> >  	enum hdmi_colorspace output_format;
> > +
> > +	/**
> > +	 * @tmds_char_rate: Copy of
> > +	 * @drm_connector_state.hdmi.tmds_char_rate for use outside of
> > +	 * KMS hooks. Protected by @mutex.
> > +	 */
> > +	unsigned long long tmds_char_rate;
> >  };
> 
> This should be in drm_connector_hdmi if it's useful

That would mean bringing the state to a non-state structure on the
framework level. Is it fine from your POV? Is it also fine to use
drm_connector.mutex for protecting this? Or should we be using something
like drm_connector_hdmi.infoframes.mutex (maybe after moving it from
.infoframes to the top level)?

-- 
With best wishes
Dmitry
