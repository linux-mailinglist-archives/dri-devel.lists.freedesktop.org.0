Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B3BA323E9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 11:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4737110E84A;
	Wed, 12 Feb 2025 10:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="E4nt1Iw2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E0B10E84A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 10:51:54 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-54504a6955aso3715915e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 02:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739357513; x=1739962313; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uwMEgQxoUHmLZtuKQ7OktGqb6xfp8P5Cp0GfVd//gwo=;
 b=E4nt1Iw2k6JOEgQcWEKMczpCULiqS0CyiEbGkMH5+D9MCXH7oBdbuEFsVv0yGFZmMG
 voTvoiz+mRW2p+POKdK81M5kHD+3AWEVw4Mndehbp1r9ommcM9T9EMS1MHNJWSEwlC7d
 a0gfNIXESLadzw+gR1kukZ6gyTav8SJwlJWsZ6ZA4G9llsgQiSirylP4B9orAu/cLq/p
 IkpLejNqHY8RvWSqfjcjkTDMBhCykSDapZn4KlHJqqPej1ZRq1l1gN/5LvsneVMvejfb
 Y6uQ5Vp9fby87Oc/ATeIEPcB9tlwi/vDQcsONS2eAZf+oR0DrxN3HtTDBaYZDRt+Rjb3
 ZWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739357513; x=1739962313;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uwMEgQxoUHmLZtuKQ7OktGqb6xfp8P5Cp0GfVd//gwo=;
 b=MCjwkCi8fds/Wl06PwDZXnfpO8eCs6b2EncqV0gIMYWvUKMyTPzhHV426+iv2dy96X
 iHfItWSZQtOXumDOIwxSvEtbwLNer7ohCuGGRxvV/4pvsTjJHk011DGVQNwJ+j7k6WdU
 S922d7pF3hYmb8FEREMMAM8eWAZKx5f5VqsUq82OjM7ydBvh/YWozVVTYsn4chVOX+b6
 DIOazRvhJSsDi3JHF6hlJ/b/1I7nGp8t5yHJ1BCejR9u8mczjqpSPeG0BAfTTFRdjREG
 7yJyEPNiyY4rJ/OUqsVIB+qwOUGf+RyttvRNBV2pT8eIcdRfpQCbcznPhGFf0ehEGxj+
 ViIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJOWj+jWFuave6yz4iWzr9x3hptOQW919h/KIJlu1UVtgwGR21emRdiNiXUNXdyx60xoGInV0M2/s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+pleI26lt1JCKSF7dJEd8bQClJtdTJzW5jjl0Pw6P//4a7nPE
 SlxaFu2iwnAY+G4piPcqI43y+7DLjPpW/TfDV9M+9anEX1rlZG4lOOJeaGRbOH1gnSxCKq1C1os
 CoFs=
X-Gm-Gg: ASbGncvwFcJvcbrylFogBgRUO5axaS/uSALRNG6+iEPhN9XU0aWpHdc801LUGgbg/u1
 lmClYCJyZHwjPUEa0zRuccqrt025Ei+TiSv/o69Dw12uQR5v+f7OSxGbM57NTX0qCPmIdg8Kxqo
 7oAUp870ladUCeTVE8eV7NUhTRdLD3ocN0Juxv4pD8Zhha4KJUE3sBRBRmP724kyI+1nYJ9d1EA
 jKqDgcg9fnqflTlyem6XTqSZsmMlVnUs4Uksrs13nU6pHhZYVGw5uZrdC9rejTpxWslZr5IlpvS
 qO++UkyGp+haJEcMhSIIO+8MsEhiEcvQuctTq3YrwSkm0umoH4SDLPEwaTsrm8egqAPTMHQ=
X-Google-Smtp-Source: AGHT+IEKUeDThVJ/lnz2Tru7gCIU188oezABVqDXzxKcHI8yaF3qfkwLQfpmjpdp11HB4DwHxistqw==
X-Received: by 2002:a05:6512:e9e:b0:545:e2e:8425 with SMTP id
 2adb3069b0e04-5451818b3b0mr773873e87.39.1739357512796; 
 Wed, 12 Feb 2025 02:51:52 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450654c5d6sm1230593e87.34.2025.02.12.02.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 02:51:52 -0800 (PST)
Date: Wed, 12 Feb 2025 12:51:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 34/35] drm/bridge: tc358768: Convert to atomic helpers
Message-ID: <pbeqsf7buhgbrxybexhcxzdwitcb2ioa3as7itp2mxj2hybuji@sbh744trp3au>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-34-35dd6c834e08@kernel.org>
 <nbghrrl74xsuzomp7d6qjfosxfiooezipppjhxkx2ibnlpi6rj@b6ovgosmpuhl>
 <20250211-solemn-meticulous-angelfish-85d1ce@houat>
 <btehhpvkv6iqd4pofumspqbxzr5gxwp6vs5oh7vflbcmzqj5wz@s6yem2ryw6vs>
 <20250212-versatile-donkey-of-thunder-0894ec@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-versatile-donkey-of-thunder-0894ec@houat>
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

On Wed, Feb 12, 2025 at 09:24:21AM +0100, Maxime Ripard wrote:
> On Wed, Feb 12, 2025 at 02:38:52AM +0200, Dmitry Baryshkov wrote:
> > On Tue, Feb 11, 2025 at 03:33:58PM +0100, Maxime Ripard wrote:
> > > On Sun, Feb 09, 2025 at 09:13:36AM +0200, Dmitry Baryshkov wrote:
> > > > On Tue, Feb 04, 2025 at 03:58:02PM +0100, Maxime Ripard wrote:
> > > > > The tc358768 driver follows the drm_encoder->crtc pointer that is
> > > > > deprecated and shouldn't be used by atomic drivers.
> > > > > 
> > > > > This was due to the fact that we did't have any other alternative to
> > > > > retrieve the CRTC pointer. Fortunately, the crtc pointer is now provided
> > > > > in the bridge state, so we can move to atomic callbacks and drop that
> > > > > deprecated pointer usage.
> > > > > 
> > > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > > ---
> > > > >  drivers/gpu/drm/bridge/tc358768.c | 30 +++++++++++++++++++++++-------
> > > > >  1 file changed, 23 insertions(+), 7 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> > > > > index 6db18d1e8824dd7d387211d6d1e668645cf88bbe..6ff6b29e8075d7c6fa0b74b4fec83c5230512d96 100644
> > > > > --- a/drivers/gpu/drm/bridge/tc358768.c
> > > > > +++ b/drivers/gpu/drm/bridge/tc358768.c
> > > > > @@ -601,17 +601,29 @@ static void tc358768_bridge_disable(struct drm_bridge *bridge)
> > > > >  	ret = tc358768_clear_error(priv);
> > > > >  	if (ret)
> > > > >  		dev_warn(priv->dev, "Software disable failed: %d\n", ret);
> > > > >  }
> > > > >  
> > > > > +static void tc358768_bridge_atomic_disable(struct drm_bridge *bridge,
> > > > > +					   struct drm_atomic_state *state)
> > > > > +{
> > > > > +	tc358768_bridge_disable(bridge);
> > > > > +}
> > > > > +
> > > > 
> > > > Please change corresponding functions into atomic_disable() and
> > > > atomic_post_disable(). Calling sites have access to the atomic state, so
> > > > there is no need to have yet another wrapper.
> > > 
> > > It's pretty hard to do (at least without the hardware), both
> > > tc358768_bridge_disable() and tc358768_bridge_post_disable() have
> > > multiple call sites in the driver, and passing a state enabling the
> > > bridge doesn't make sense for those.
> > 
> > I think it makes sense. The function knows that the bridge needs to be
> > disabled. The state is totally unused (or it can be used to get
> > connectors / CRTC / etc).
> 
> That's the thing though, if we were to pass the state, it would be a
> state where the bridge is enabled, like, it would have an active CRTC.
> In a disable path, you wouldn't have it.
> 
> Another idea would be to just drop the call to disable the bridge, the
> assumption is that we can't fail in atomic_enable, so no driver actually
> tries to mitigate a failure. I'm not sure why this one would need to.

SGTM too.

-- 
With best wishes
Dmitry
