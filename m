Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B2599C964
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 13:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBE910E440;
	Mon, 14 Oct 2024 11:51:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hFk382Ae";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A35110E440
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 11:51:38 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-539f72c913aso895668e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 04:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728906696; x=1729511496; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=V1xWMt3UTvAd/JjpHzhIgfyaHO9/VjAl/Sg2CqO7Ryw=;
 b=hFk382AeTFK8Yk3B0FQDJy44PtuPQHTsBiRLy3ytpQ2tJNikuxEJ8MtxaqtCAEGhm8
 Bm4wdOMFtyxZtYsRMXQhjmoVlPfxkrwmrLrKCdROfZfDSFNL+m0qynF7SJBDAvJVVGSk
 TFvuCL39l+VQjGGX1pkncJxctC7m9q1nCO6YmZ3sPy0GKgx4SHadVn9y3N8LatWFiBNW
 H3BmO7ZGw8rUBeab+BDugSjsw/pzrvKSi3/ba+1lKneaOJpeGTEl6Jy/HZany+A5dwW8
 EzP9BK8/vUgHlWnmJfMOGtGxlitUlyzGReBEP4WA4hgu+wIyIQ5L6LBIdsv585oh757M
 d7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728906696; x=1729511496;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V1xWMt3UTvAd/JjpHzhIgfyaHO9/VjAl/Sg2CqO7Ryw=;
 b=h+9jJdxEySSZJiBe2Lftatjs7GlLzmV7iFULvBG1gk6EzHZfw1pGc4QzB7EcpwesXR
 5XHvK4Tl/tM08an6j6J0UMwdoDAcVECfelNGAXu/ChznTN3AMmkd2x8lPS5qjf2FoY7U
 uIiEdbo6ndgfI5U5hjQPzWlpr2n/GtGKkPNJfIfV74NYHuDknRvEpcac94XMtMwX8Gsa
 pxWDeUZ54YWskKIA+4OHjHBpi1BhMw/4Yrl4KY9O2my+NKZjDDN2RJ1eJxTPLrdnMtTB
 HuprZA1m4PtVYjwRXPak5Uz3kFNgMSHKCpq65wwqHM2ZOWeGFU0EefdPSNvofX8kFwV0
 Ws6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuE5A4PAyksoihZXZzlAJ1WRGPjcvZ5qHelGqAIzaIUMrlscNpDDmi7NVUYLaOVLJt59uA1uVrzY0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/UpjfesWWM7wFihc/s3CsDI1YcIzQoAg3ZRED3SbmljDUSUQw
 UC4npwvNgS6t+jFfLlXYCcKfrVCDGzfnzdXwSJ9B83y9GKtNggPPXDeY+JeUa9g=
X-Google-Smtp-Source: AGHT+IHHuAMIoaQuFwnEb6QkDi1r5lPPQLpCWZGzSTxE9JYStKerl0AiV8ueiqeqgLDWlOoq82aTTQ==
X-Received: by 2002:a05:6512:2302:b0:52e:9b9e:a6cb with SMTP id
 2adb3069b0e04-539da3c649dmr5594953e87.15.1728906696406; 
 Mon, 14 Oct 2024 04:51:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539e85ccaedsm874894e87.58.2024.10.14.04.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 04:51:34 -0700 (PDT)
Date: Mon, 14 Oct 2024 14:51:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes Wu <Hermes.Wu@ite.com.tw>
Cc: Pin-yen Lin <treapking@chromium.org>, 
 Kenneth Hung <Kenneth.hung@ite.com.tw>, Pet Weng <Pet.Weng@ite.com.tw>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 02/10] drm/bridge: it6505: improve AUX operation for
 edid read
Message-ID: <e5slvrvg5es5bzb6jfqph53o4lylsqyytcjvopkkp6tasfya6p@iht5n3cqedfk>
References: <20241001064305.32180-1-Hermes.Wu@ite.com.tw>
 <20241001064305.32180-3-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001064305.32180-3-Hermes.Wu@ite.com.tw>
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

On Tue, Oct 01, 2024 at 02:43:01PM +0800, Hermes Wu wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> The original AUX operation using data registers is limited to 4 bytes.
> The AUX operation command CMD_AUX_I2C_EDID_READ uses AUX FIFO and is capable of reading 16 bytes.
> This improves the speed of EDID read.

Nit: Improve the speed of EDID reads by using CMD_AUX_I2C_EDID_READ.

> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
