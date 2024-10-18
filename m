Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B04159A432F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 18:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 339D410E37A;
	Fri, 18 Oct 2024 16:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lrGiPo/j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B4410E37E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 16:05:57 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-539e8586b53so2807762e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 09:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729267555; x=1729872355; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0wYEvLE5AoTVEsvqBPjLtagcoJbMeHJO2qbYoBljMjc=;
 b=lrGiPo/jx/o7OMg59/RMSgVifLqAQkWO5t2sQ+hQ19z65kQT9/TpPhIi00FIslFCL1
 wDzcFsNEu84jc9VmgQwQc3z61A8P4LRtpAZtFD5/9/fEPEHLw97M7oWq1esu5c7ji7Il
 ZsEtSesYYYaBxNxZFbE4px0m9uWpE4uclinSy56vPGzr42vfvLmePW29vlnrcZ9MbjRd
 3BOTAKmHs+TrQR3ZpUoAhaoa3xPZLXq2N2l4gKvqiiUpHD0z1SQjH9TPAqg+JJ5x90pf
 JVmOSz++YBWZMdEnMicpgsGYRwSgpElAV1RkA7LkUCAt/dgX1QP58xh146gCUngBwzRh
 G5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729267555; x=1729872355;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0wYEvLE5AoTVEsvqBPjLtagcoJbMeHJO2qbYoBljMjc=;
 b=n2Gb9OFXaQEDe+cSH81N7NC8dp8pTjNWZKsX+27w/QV32VOJlzQuZLvyaXnAmKWx8p
 T1gUNqEtE3hLxsxLPXboLJgj16TlvZboKtPyXJPuB2+NkTmHeBi5niUWUObI5b+zHjjp
 t8ZpWH2UQyROpb1gNztYMnWrH2qzgQ+jK13mPDA3ZO/QnsuYWwwhgGu6dq5xougNZrYO
 J97wHqX1kQvm9QWLmJCFi0XPPOei2mw5/vnVDQLLCnAP8OmqOdUd1Yb1Kf0Z6pCyw9dt
 74zzW7/E8ImhY32QX7AQkRCZ062CSmVhhRvdw9oU5FAXziGp0lwwVHA8Ls/IMOfxULZa
 ds0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoRxdZDAf6feE4ZqT24trlI2qcj/FmOfvq7hH5GFhJCYYNRjXZYgDkGuG2QabSQUjdWaYk9EpF5mM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrNh4L1Qa1fDgYosngDxXW4iDDbVqP6IGBxvOJI0JLnOw6M5nA
 QbGY/+cmhlVp6nYIHeHRz6e62QUtJZ0umRD+P1zBBbn/ubJy2BtIKfXrccZGC0s=
X-Google-Smtp-Source: AGHT+IFjhdbJ7YZZcyfL2UU7JQ9UyXrDu19ycBJ6CNiQ0dGXU9v10DHjdks2qgl0GgCmrtOLG2ajIA==
X-Received: by 2002:a05:6512:33cb:b0:52f:1b08:d2d8 with SMTP id
 2adb3069b0e04-53a15844da5mr947314e87.7.1729267555106; 
 Fri, 18 Oct 2024 09:05:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a152044b8sm251517e87.221.2024.10.18.09.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 09:05:53 -0700 (PDT)
Date: Fri, 18 Oct 2024 19:05:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Arnd Bergmann <arnd@arndb.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/imx: legacy-bridge: add MODULE_DESCRIPTION
Message-ID: <7ppx4rpyxrsr7spzopocv2hojwzxivojfpc2ze4leippuvvrj5@drhmfqmajzrp>
References: <20241015073004.4066457-1-arnd@kernel.org>
 <20241015073004.4066457-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015073004.4066457-2-arnd@kernel.org>
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

On Tue, Oct 15, 2024 at 07:29:58AM +0000, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Every module should have a description, without this we get a
> build time warning.
> 
> Fixes: cc3e8a216d6b ("drm/imx: add internal bridge handling display-timings DT node")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
