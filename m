Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B274099C972
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 13:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E4810E443;
	Mon, 14 Oct 2024 11:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JP8rkfaZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B3B10E443
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 11:53:19 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-539e690479cso1676787e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 04:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728906797; x=1729511597; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lXutyinsioeduBN1ANUedSGpi+lN6zkBNkpYVXz8SBM=;
 b=JP8rkfaZ9ZSiUpoK6P7JW9aizaCFhrOlMwBEU1EH3l9jz2k/0X9Xas6gZQWOv2tFGl
 vvLe1UTZ5bIdOIfEHR2qMlBSX00d55lYMfdM+XPUb6uzWoHD3omUupBBatHVxiCbztvO
 lL457i3Y1uJrv2i3jBx5Ns+k7uuq+7wh9ajxwGlkwHMYJ2GEloAM0d6TlP+gbcWQgKBJ
 PJHjsbsj0A5fbUXuYUPNmSsDVpvoueRMPXUgRBIQ/rCJN5s7W+t3AtJLl/XrdvDcBLOX
 1MM3pYTyLhYqUga8Vhnkrv7ShmzQgYKn81dmmA5j4mOFh6v2qhXG9KazukG1IYRLHYPI
 rN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728906797; x=1729511597;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lXutyinsioeduBN1ANUedSGpi+lN6zkBNkpYVXz8SBM=;
 b=HK4ECHnkGtG5lp08QmszdCtMg5ni91bZsFoEMr/UgUZ/ajJznQDK4DnN0Es/Vsfngz
 cUzx/iZC4pyaD508NozD9eBA/Xb1gkRljPhDJmRf+24Fg+XK9DyO6WMoqOvKy75SbHDH
 yuj6hzHLENkOB6ETQUh6PHjee9r5wGsdN8/hKge056hre7foRLbiUxElvOQi+0+4KTXc
 pcxDewxwZrzcg55+9Qhbu57sPa0WJsGVQds1QzEu4cX7gx+A9ACRnAG9WqbdRGi0mU6M
 TPUvbKTMfjkES8sH3P6k2uL2aOSjcywXgPP7jldoAJKST6w78ft6Juy0HYQzWeq35rcJ
 A7pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+2auf5KgAEQByNax84sw46vZB/tPq/bpqeN5waMCd/Uska/MdISimGBhp/xMeMkU2Np8hqYhCoQ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCYH7sEXhe5d/kcDIyV/chiF6nYow2OAHJlmZmX6ysRa6s/3V7
 AmTe5I5Dx0DqsRvePhznFE1k3kQsRTX0be4aiPNuQ/DS5aMjwVsv2Fo5B0EPn0A=
X-Google-Smtp-Source: AGHT+IGe2wtr0DTqglXGDZDAqNeDCeqKaarBInzPOg6nFlThmpKx5vXb8rTb6jYSk73JB+HKA2RlLg==
X-Received: by 2002:a05:6512:280c:b0:52e:7448:e137 with SMTP id
 2adb3069b0e04-539e54d77a1mr3345987e87.6.1728906797122; 
 Mon, 14 Oct 2024 04:53:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539e21219d0sm1146912e87.128.2024.10.14.04.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 04:53:15 -0700 (PDT)
Date: Mon, 14 Oct 2024 14:53:13 +0300
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
Subject: Re: [PATCH v5 04/10] drm/bridge: it6505: Change definition
 MAX_HDCP_DOWN_STREAM_COUNT
Message-ID: <lazvxlk24rzsdgjwk5ym5dbrr5jwtznftryzbxdxitt5i6xjv5@blhmwclr3ay6>
References: <20241001064305.32180-1-Hermes.Wu@ite.com.tw>
 <20241001064305.32180-5-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001064305.32180-5-Hermes.Wu@ite.com.tw>
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

On Tue, Oct 01, 2024 at 02:43:03PM +0800, Hermes Wu wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> A HDCP source device shall support max downstream to 127 devices.
> Change definition MAX_HDCP_DOWN_STREAM_COUNT to 127
> 
> KSVs shall save for DRM blocked devices check.
> This results in struct it6505 growth by ~0.5 KiB.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
