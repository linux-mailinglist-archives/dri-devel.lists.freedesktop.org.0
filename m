Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA168CCF73
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 11:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A7E10E0F4;
	Thu, 23 May 2024 09:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Rv7gfPdE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9A910E0F4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 09:39:50 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-51f74fa2a82so7891245e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 02:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716457188; x=1717061988; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nZr+4M+DoXpeV8oSkkFyzaRfzRj8DnnoccV995epHpo=;
 b=Rv7gfPdE+zSN7KHx8GuIZIlwz3/XoDXjP7tH/ani851Xr3PHNDidy/Pmu9fd+xOvWD
 BCRk7FHESfSzL2IE6sdwdQNSUhwX1AJKERmYxqZZVuO19mDZU753d1Kwi2e9g2O5l44b
 pNs6BP6C8/bLwZj/33Sxbuw+VsuYLY86jZVJmb+0fEWRQ5o/Ewd5s7OlMCtvoq2GMB1E
 qEBP4tZKLRjph8nUuE497KyTCOVreB/BT+ltTl+rhtQXTRVNqYD2KKRY8R7AuHA4W3ub
 mjXqcubq7wa7gJpiZRIY4QyszD1+WF1Zur8iO6Wh/nd6flTQKUAboS/MT9NV18BcbMBT
 TpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716457188; x=1717061988;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nZr+4M+DoXpeV8oSkkFyzaRfzRj8DnnoccV995epHpo=;
 b=Ptg/OlcRs7Wfa6PNdpQybwuzZIPA+i2K7h3bUYbq7M0SkGhN3ef2Bu+SaRPMOitNK1
 aH/SqBlxwIp1lChp2B5lFsBuoAbAZvhZMlBsEUj0qaatE46zh2U2bEvnELI4nYrjR3PV
 BIfdJD+mMzp47YjFiUAydJL0U6jvktcygItRRgvZmHCbUvPNZTlPYN/HsxLoRc1nGmDm
 JTtySXGeA6bAiQn6OHOdiKPVHLxmNx3qeok8JVSeWRW6JZoH7pnbKYlyiUvCtUD2uVdn
 GPXqyDdJ2TFa9rInR/HisE/i3qQmAst8K71H1G3j+fc51onK24TvVeBwAp0MsiJB+a6k
 cDOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgd2fblUr7uinHcvnsMp5daU2GzlLEOO7dh6SPLws8yUm1NZLXFfZTdR8YKd5FNU3JoEZPaJQUKCT0t1EnGnaXcHhuIeb04p5tnFF+Hc5o
X-Gm-Message-State: AOJu0YwtQl+ThsGqaGvN32ynp3iGXfxj6zsElzaqyDduaLngTTHKoAcr
 hPLk1XqTcUEfI2TYnpyV8tnRHvg9eHfx1V5uniJx7Rohd5XxwDJxOpgMpcavXrA=
X-Google-Smtp-Source: AGHT+IHZxrSIuUr68retAsDGyT49V7Bjyk+0v3vLZlctFxxYj5K8ZOcu4gphFsf8YhaZBtcNl5CRiw==
X-Received: by 2002:a19:520a:0:b0:518:eef0:45c0 with SMTP id
 2adb3069b0e04-526c0a68dcbmr3895711e87.48.1716457188090; 
 Thu, 23 May 2024 02:39:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f39d2c63sm5212392e87.278.2024.05.23.02.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 02:39:47 -0700 (PDT)
Date: Thu, 23 May 2024 12:39:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v14 11/28] drm/connector: hdmi: Calculate TMDS character
 rate
Message-ID: <2drjirwwj3cwm4saboa5qnhwi7wev5gnilg24u7svz2iw3gtef@jainjgtog3uf>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-11-51950db4fedb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-11-51950db4fedb@kernel.org>
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

On Tue, May 21, 2024 at 12:13:44PM +0200, Maxime Ripard wrote:
> Most HDMI drivers have some code to calculate the TMDS character rate,
> usually to adjust an internal clock to match what the mode requires.
> 
> Since the TMDS character rates mostly depends on the resolution, whether
> we need to repeat pixels or not, the bpc count and the format, we can
> now derive it from the HDMI connector state that stores all those infos
> and remove the duplication from drivers.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 67 ++++++++++++++++++++++
>  drivers/gpu/drm/drm_atomic.c                       |  1 +
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  3 +
>  include/drm/drm_connector.h                        |  5 ++
>  4 files changed, 76 insertions(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
