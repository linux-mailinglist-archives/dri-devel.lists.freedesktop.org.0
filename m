Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A19986E34
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 09:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B3E10EAE9;
	Thu, 26 Sep 2024 07:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j/8vVJMC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A9710EAE9
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 07:51:20 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53661ac5ba1so785876e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 00:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727337078; x=1727941878; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NHAvOI9KtDOsvvoP0nLPdvZRSpWG4zkKmMmJKwdeN1g=;
 b=j/8vVJMCgJNldgdonrSMYpBp35h+L/MmMs9OeEcznaBqS34goNpwPc4XrgxZpNd6kT
 /pC7PjOCKL9ofnTXSxYjOv6W5UxpK9s3w5kfs85PREGlFeybXDtGUMfyGfjVhhBpmqj2
 HYqDOQZQclG+Q2hN66mjyKzzv+N0LdJn4bf6+HyJH+7vpudw3l61AbQgKMXWKC64PJZ5
 oCW73WBuio1etZRG8Up0ILHFtxYUj8Wcvl+AlKliYs2NgZwXh1qHz8lKvcMrF9XoRHqN
 ZH1dVeUPiIg1Wjwqjfvf39Elb1MTCJ0VkrJnCENnYTqz5LoneL1711pmSuxNCbKOVVNj
 mYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727337078; x=1727941878;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NHAvOI9KtDOsvvoP0nLPdvZRSpWG4zkKmMmJKwdeN1g=;
 b=ZdleDGfBc+dhNIsVepsB3XACF2Wl85hp+kmBfIyBaaMQVXz94uEI1nyuBnvlS/MwGR
 PMaUyQYLd+DE3wpnUv0pkyK7Zw/+G+y0GrcRprSuNFZsGIkC1jH5YHx+5BlhoAZRWE0d
 0jK/pyUSqeLvsOk1f1PCTKhoFT25xSTp9BacmQ+5RH2owlS+wu5PDstXAkGZT6el9MBX
 a+H0gKBYMjD+o0NZCjJPJ38ber+ZZdjI7WQwxNWwgpVOFZ/FoJ9OZWhN451EZXRN5MK7
 iSljKUIe0Qm8opOTvv1D4iQdMXBlOrbd/BuHmfcLCyU9V3mzOEUcHJ87B3UedPKvpCtl
 VjbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzhDVDTCwFGKkMGFF0ruH41XOMj15yoQQH5CCbwIoIStqgS+1Gdy8C7kpij8lPrzOuftwzmL2M/xc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTUZXUhgTuQXYnK8MuJ5jhccq8M7iDdcKcD4p0HbxHvqyEbV3D
 tnXi0ky1gqiZK9huyscZZ/rIULAFDtuzKR+Kdf0wExSmn3cGxThzTxIs0rG4SrA=
X-Google-Smtp-Source: AGHT+IE+7m6XCC6v6ZYiN9hpBuRWnJx0f4RfFAHw9nxz2LmGjqyw0t5+Pl7rzPZhQiLQH5hnMVD8Bg==
X-Received: by 2002:a05:6512:3a8b:b0:530:abec:9a1b with SMTP id
 2adb3069b0e04-5387049804cmr3430821e87.13.1727337078217; 
 Thu, 26 Sep 2024 00:51:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a85e6356sm728310e87.89.2024.09.26.00.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 00:51:16 -0700 (PDT)
Date: Thu, 26 Sep 2024 10:51:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes Wu <Hermes.Wu@ite.com.tw>
Cc: Kenneth Hung <Kenneth.hung@ite.com.tw>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Allen Chen <allen.chen@ite.com.tw>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 01/11] drm/bridge: it6505: change aux max fifo size
Message-ID: <o4ecmdk52j46sa47cfah564b44rvwvebgf4fhegrefehghhve3@v6yrj7nkzpbt>
References: <20240926074755.22176-1-Hermes.Wu@ite.com.tw>
 <20240926074755.22176-2-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926074755.22176-2-Hermes.Wu@ite.com.tw>
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

On Thu, Sep 26, 2024 at 03:47:51PM GMT, Hermes Wu wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> The hardware aux fifo is 16 byte

Nit: AUX, FIFO

> 
> Change definition of AUX_FIFO_MAX_SIZE to 16
> 
> 
> 

Nit: no need for so many empty lines.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index f372c05360f2..28a8043229d3 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -300,7 +300,7 @@
>  #define MAX_CR_LEVEL 0x03
>  #define MAX_EQ_LEVEL 0x03
>  #define AUX_WAIT_TIMEOUT_MS 15
> -#define AUX_FIFO_MAX_SIZE 32
> +#define AUX_FIFO_MAX_SIZE 16
>  #define PIXEL_CLK_DELAY 1
>  #define PIXEL_CLK_INVERSE 0
>  #define ADJUST_PHASE_THRESHOLD 80000
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
