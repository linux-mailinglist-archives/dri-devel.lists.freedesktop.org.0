Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E70819F4D34
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 15:10:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5291510E22C;
	Tue, 17 Dec 2024 14:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="C5j4dnsk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE3C10E22C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 14:09:56 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5401e6efffcso6133725e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 06:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734444595; x=1735049395; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mV9n8rD9lCXVFxHRKSb6HxnIcMmuUp+M9EhLoSWf19Q=;
 b=C5j4dnskDzGEb16j13UTqonO8CkXu6nJRdaWvD4G67ShMEfBahL7hMUxtHJJ1okzcA
 DqjilpB7IUA6tpVGOMVzGUF5JvP6K17E4ynIB5npMY1vO7IRWvSkiZjQSU8ORSBYdvWv
 mfjQcccNxXR72z4SoiwpPjxM+AFzegTQ+jn4gzFR/FfwUWfGKhrWa8zXInyPCGZgtfKg
 zswjLNumm3mthQWkNnhYWnIMSsJLxSz+SUnNG2gyOVjoZKp9F0sraSYBTGXcW0M8X7rS
 P5+u657rkFtImqDGyvkvzgdlgrVEVNBI1z5X5gdNUlllKwt/fS77hn4hwOIr2spXdBuH
 XOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734444595; x=1735049395;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mV9n8rD9lCXVFxHRKSb6HxnIcMmuUp+M9EhLoSWf19Q=;
 b=OPWuiDf8/Q39bUt0pbTwFU1cVNWbuYlcDKzD0EjT/swOQr70WUSQt5nnsg/iypFF66
 0QQuuX2ZeS1Gdz1cEceQLKcr2glnKjkPo/9YMvWzNG15p1u6mDpZs5lMf2wb+tBqA5A9
 Y6yhYIanudC7lmFULjVgsG0A/8SsAliGJsGdn7WL2QOmLQs2XnHSorJTcflJo2Glsq9a
 M6XsVsY+ELYVe7nOaYcAnaA9smz+A796g3NLkVHWl86xZLhuvgNRxvqUVl47/ymEWuEm
 aKGJDlrl/JMjFOedjyTu8fxGJiEa2jRt+Ignk8fjaM7BusQP/tQbWE2+Z4fBdqr40c/z
 j73A==
X-Forwarded-Encrypted: i=1;
 AJvYcCURQv/dGrDFMX6q0JyDmTqyDGTvGxWdaA5Tp8rb2s2zxtXDJ0VYOSm0q0umq4ZKSp/8I2Xz8ed+QJU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLKRh9hanxyJMf+68Lp/4BE+9GjqNtCyar4JYG9YLwpBEm7VLM
 D0xxDdIeJIz7JRrwNUa9+pvYvS+hMR4yKjSFGyUSn+6NKOyN+gHxU+Rjgykm+GU=
X-Gm-Gg: ASbGncs1qjI///sVpoCY9uIlxhlWn9JJtcrfFDRRlGIVCdcPklsNwLWKky456O8dmoZ
 M7L9A8Q3wErOaYRPqGHDhoQQVLlNIa2V2PI9Sbm7rSEHdUqB6ZV/fgcG3O7CAbLRxz86LXwkMLv
 mmIslwFyzC6FT55TL9ldjV9M4YQuh/PVJoXkKLnEOvKgeHluSGHBs+TMFfUycq/QXFdUVMtCIf6
 1VMxU1Y4Npvi+avxNIb3u7/0rkUQK4UmFt5gFH3BU1EJOZmeWtUL69fP5XWQcT+rwjYdsHWB8/x
 gmjLuDdCQE4MjRcbVX6KKA+xI0ZfkVJZgSLo
X-Google-Smtp-Source: AGHT+IHTf5dvyD0mHW1jS/2vTroVhCSJd6opzQzzWVJuSVJWGrT5Dsv7wwpXGqTnNzyEJctFejbUSg==
X-Received: by 2002:a05:6512:3189:b0:53e:3a01:cf4d with SMTP id
 2adb3069b0e04-5409055dff5mr6856692e87.31.1734444594653; 
 Tue, 17 Dec 2024 06:09:54 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120ba9dcbsm1166017e87.73.2024.12.17.06.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 06:09:53 -0800 (PST)
Date: Tue, 17 Dec 2024 16:09:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Phong LE <ple@baylibre.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v7 00/10] drm: add DRM HDMI Codec framework
Message-ID: <kyytu3nofrjkajwatmxdyav7oekkeigrhx5amddgjtlpsdl2m5@3moqad3gfds5>
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
 <D6DZB443IQ7A.3P1135M6DMF2S@cknow.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D6DZB443IQ7A.3P1135M6DMF2S@cknow.org>
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

On Tue, Dec 17, 2024 at 01:36:29PM +0100, Diederik de Haas wrote:
> On Tue Dec 17, 2024 at 1:40 AM CET, Dmitry Baryshkov wrote:
> > This series depends on the ELD mutex series [1]
> >
> > [1] https://lore.kernel.org/r/20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org
> 
> There's a v2 of that patch series here:
> https://lore.kernel.org/all/20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org/

... and it's even merged to drm-misc-next. I dropped it from b4 deps,
but I forgot to update the cover letter.

-- 
With best wishes
Dmitry
