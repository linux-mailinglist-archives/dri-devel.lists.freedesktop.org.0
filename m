Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E13A34A1B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:38:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C5310EB22;
	Thu, 13 Feb 2025 16:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VK0goeOH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE3F10EB22
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:37:59 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-30613802a04so11588691fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739464677; x=1740069477; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=i2OJO2GugyrIDT84GECqN9j4PJ39hKLweHZ/9c9DZPE=;
 b=VK0goeOHZdgDqYAidYO1GympLhIm184uzzxivS1PLlqaBUQwcnAU8naklaZiHuMEa+
 GdYghUB7vMozFe60hzcJ9emMlmmS5Rs6q15ITTuAVGX/4LZGh0s8aX7Y7W/dFJT1FKn5
 GMS4u01C8ObD0FORdgIh2W9FUqAFk+CUjmSdWrf6ZrLNiwuDgeYu825FNNF513GcImQv
 hFka7wAC3NIrIc5kUYfHrNXhy6Pi6I7ymXqyy9l85ONHdpLS5sKuwwupsKVgU64JcJRD
 ZuIDwEw1HbXKRz+cbfKQqRtZc/uYhka3yCsdqiXD7s/3DzKc+lNmMuTUTP+6vnuP+pFX
 hP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464677; x=1740069477;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i2OJO2GugyrIDT84GECqN9j4PJ39hKLweHZ/9c9DZPE=;
 b=BSBxxZUBwS8p6sX8FbmzfCI9GGsdMz7EOZcyWs5fWDroEzS9XzfkP94Vb/TftrSDyU
 zSi8osssaCLXMytic/OQHYM9GGHKLA70i8ASXVtrcgDNQOIa/lZTE+J+a4v56J2WYNWv
 XYI7SESAZOPxjPKdi+5OYFd9SoBvOI8QoERaLQOsUo1DPWOBag5Qwf6SxLGypsXtWiyS
 HLn5pBUMDbh1XHxQZ6veHbQ3NxapZnQvKv92LJJ9sphX0lWhgIbFQl708toQoZPHFjAz
 XFaP7xCRp80GNnpuBODQegobA8Mtqf3YCylTeNN/Bv5o7sVmESr3BtePfwQ/IB6bpjIg
 SiIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgopuuhZ/nXcQpC+eGEX3ivctCSwk4LOkhToXZzvGD/xMIAAu2UR6RSOwCdNuJroXzPv2QpIjAqQE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuC7y+X9/9uWsTZ3mkWaSeSgouYp9yWWAD2d1zcWIseRdvqed5
 17YWf72yjCKdRXD+nf2U4SLyJWEkKcG30NPGeuCLjMzE5FfHNZnaTB+p4LduMXw=
X-Gm-Gg: ASbGncvoS8gUB8PgwmhCiKcq7mKY2ZUN9/u4ztqT2/X0K8g8O7w4T4O6FQ7e64wIpgE
 4Qs6m5B2E0oyF8hYqWJhEyq+PYaiXYRHBtsdLQ6JjuvyTQk0y//XpGC+KKLH/fbli+AJzVZFg7g
 +3CqiIxRJSQYOdtHEZKKdCwmgPX5nv3LbE9/pTyQfqnDu7tPzI83/J1cQkOAzmzVNzJdmaVSiW+
 sNTfBZ+8P2Nk9dDogzPNVOo72wdfYG/cJG6pSM9R/cRRzYVG2zoF5LQuIX4qTR1PvtZU12nYi3L
 ZLUgc/6Zo7kiQRXj5llJ4KlBu2SOrbJkogu4rAgURkVbDWYrH3P7UI9aChLljfB8wmx0fhs=
X-Google-Smtp-Source: AGHT+IEYPr8PatrnM+bo756o01wElcjGGflpyRxlOCKGCeLdga6SpFD3q+R7NLU0ZfCSCaUqAuY7lg==
X-Received: by 2002:a05:651c:154b:b0:307:dc28:750b with SMTP id
 38308e7fff4ca-309037c134cmr27597481fa.13.1739464677494; 
 Thu, 13 Feb 2025 08:37:57 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309100c643fsm2502811fa.17.2025.02.13.08.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:37:56 -0800 (PST)
Date: Thu, 13 Feb 2025 18:37:53 +0200
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
Subject: Re: [PATCH v3 36/37] drm/bridge: tc358768: Convert to atomic helpers
Message-ID: <hydowq7gzniv4m2ynsswtn7iarh25gl6tvkpooflpq3dwck7up@ea5rudjawzrd>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-36-e71598f49c8f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-bridge-connector-v3-36-e71598f49c8f@kernel.org>
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

On Thu, Feb 13, 2025 at 03:43:55PM +0100, Maxime Ripard wrote:
> The tc358768 driver follows the drm_encoder->crtc pointer that is
> deprecated and shouldn't be used by atomic drivers.
> 
> This was due to the fact that we did't have any other alternative to
> retrieve the CRTC pointer. Fortunately, the crtc pointer is now provided
> in the bridge state, so we can move to atomic callbacks and drop that
> deprecated pointer usage.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/tc358768.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
