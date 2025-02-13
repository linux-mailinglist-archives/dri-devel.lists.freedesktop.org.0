Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A31A34A1D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:38:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5B310EB23;
	Thu, 13 Feb 2025 16:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PIih8J4X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72E310EB23
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:38:20 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-3072f8dc069so12041441fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739464699; x=1740069499; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=H7oNCp/RNw3t/6zsGfDVg/YzDuWbFw2qOHPXbSLVPyM=;
 b=PIih8J4XIb4T7NkiBHUktYqqzyYnIby+3ZWJfAZo6v879xURZrKfr8jIsayt9UrZwE
 zHbphlPiNP7HyzXZo17DOEmVZb8DbbPvTbFJEsUrRrpgxQECvbeHFh+SteNMs9vaIH0c
 7k8CXhr2WcqPo12CVIoDwnobB2MuH5HNlXXppnDA/ekWm4TiTn+RZODatAmueMi2SCwf
 60YYFKZfv6IiTtmPv5W0weHypoo7y09S63Fvx9F1EOJo0kveo9egsCP+q3V+dFZ/vBWP
 EyspZ+IFbT8tQMP611CIwxdrwoX+7qJ+i/La67S3BS1E8ekLTVhD/wAf3fGEI6FWzI6r
 Xh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464699; x=1740069499;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H7oNCp/RNw3t/6zsGfDVg/YzDuWbFw2qOHPXbSLVPyM=;
 b=lW5UQA4ylyXe1W9Qi/BnL74Yfwc2rw5EU7Er2ypA/E0DbrXADrqWdN99J+s50iK5sL
 +jRD4mVm7oKJdyMDWSpzV54wAYNRtLkZ177VSsX7ppP550MKChIGps3F4wfeSdgHOYIC
 kreyFZT6CQOoAZBT5oPOXe0AiWmXAU1vf3CGax7TR4mqiqCaPPDyaC0KxKbyukNlald4
 3QLdEydi8hASeHYHUEPrPxYuFdOTHrZewRJu1Y1JGFTfQfXp4JY4rgWvartIrEEJApT9
 5fzNGWwOBYUCpLY/rEYopmY2iOPJkJax2ibGoPbAC8tjAOn4UtzFmeGVkkuAwDHm9wKU
 wMRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTNYM8AuJvhk3/Xik7ydcV7Jgw8TdsgpXHj8nS4rrOR1cBkLRXoq8Tq3tKgFTrY5s1+fQMMnBEBd0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJSO5DF1FfcnugnDakB7lmc8vLL/rfZsJh45avXzBg0NdZ1Wag
 Ncb+ROeg5hyXbyfKI6aN/39OB0cRByLZJvfRU/eSTFo3rBJU5jhLOlk49cQzlWk=
X-Gm-Gg: ASbGnctbCIrvHrZWI6O/rBGXwKPifG7Hcve/eqQqTNmQW1jLV5sIK7cHSnb4DhEqotV
 wVNlysFEpZoMKMrOPwufciDsGQxnVaKZjbw9Smcu+CL0nftmjLINnbkWr2RZ+2fk486I7Hsf7Sb
 lAHLP+8kk35+yJNEKAov6ARCxGeE2GpvTlDtj4gsM7UD+2Vcn4WSKOYgXKV52/R7XS+hkNv69JM
 yxJH0yWgzjD1dPPSJiRPRPPc5haj+xi4p6O5lpEKJGXcFe6l8uQfzGCjMksqBSYPvhtRCfliNpm
 FlfJQLhIdviGr/AHIZbxUQIaR+rFbgWRFMXC8Krgy7DcknUgxGKXvLHVxdGLM02ngd/bOZs=
X-Google-Smtp-Source: AGHT+IGW0S6KCFdTWz+vmS0HhCwPaLiMVHP6qtL5u7XOftiqOSqmrNbkzxLuEikhD4tCSFf2PgGIuA==
X-Received: by 2002:a05:6512:3e14:b0:544:1093:ee3a with SMTP id
 2adb3069b0e04-545181165a8mr3170001e87.24.1739464699023; 
 Thu, 13 Feb 2025 08:38:19 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f09aa6csm220892e87.60.2025.02.13.08.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:38:17 -0800 (PST)
Date: Thu, 13 Feb 2025 18:38:15 +0200
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
Subject: Re: [PATCH v3 34/37] drm/bridge: tc358775: Switch to atomic commit
Message-ID: <ydee2uig6zpjzmvbprz74z2yhsxrfqh6wvtr573ajzpkx7dfqp@me5npf22nypv>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-34-e71598f49c8f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-bridge-connector-v3-34-e71598f49c8f@kernel.org>
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

On Thu, Feb 13, 2025 at 03:43:53PM +0100, Maxime Ripard wrote:
> The tc358775 driver follows the drm_encoder->crtc pointer that is
> deprecated and shouldn't be used by atomic drivers.
> 
> This was due to the fact that we did't have any other alternative to
> retrieve the CRTC pointer. Fortunately, the CRTC pointer is now provided
> in the bridge state, so we can move to atomic callbacks and drop that
> deprecated pointer usage.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/tc358775.c | 41 +++++++++++++++++----------------------
>  1 file changed, 18 insertions(+), 23 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
