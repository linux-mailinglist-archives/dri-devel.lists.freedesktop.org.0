Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1106BA2DA54
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 03:03:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8286B10E1D7;
	Sun,  9 Feb 2025 02:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wO2uUGfs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E58310E1D7
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 02:03:33 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-545039b6a67so1043897e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 18:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739066612; x=1739671412; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=s3AEv+HSIyGMm7v6esZWCBtFdqZLjSMRFXdAwcjD+tU=;
 b=wO2uUGfsUSzzKJtwi3cVrufYEVuGMiDzfoZyv4ALfOg/mhCknVNG+eWSwqmwiTzSkc
 MKcECf6Y0F4zjoXCYCE+dN0vv2z43pwb8vm9fhD4j0lHN3RJyYa88WXXYKsENDWwqbnV
 XrdUDvb4h397UBAzh00prqzrXY3hEp39zsR7YCi2sbHFXTt3iCwlXMNQLdrbvjp7SXl9
 Os9b4GhzXYZ/LzIz0QazX8fE1/4YL1kh+o/L69BOtIB580Wvkf0LUp05P48HyQKIqBdm
 rM9cPI2tS+/7lwF8NLGF6PD6/X/OSBj3ZHVKjI7DZ2gPUKWGuXrPKbBoamtM6hhd3+k1
 36DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739066612; x=1739671412;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s3AEv+HSIyGMm7v6esZWCBtFdqZLjSMRFXdAwcjD+tU=;
 b=wS59nBpT0A6eSCtXv2kREnXwyKTYM/57tK5kooYdzXlH8+ZUXL7c/Ffh7Jc4r+Qm2V
 Y+3F8w9LAzuAhfdoQCWYPW2dw9mwj44dIUFa9kZQrHQyriG+dyTvP7B24D+Zj5opUouk
 ua5i+pUO/WH1ltsLIiK/ilSirAzsy91nE8jmDEthzvhEP6YgTWv6HUUqkFJBAXgT1akt
 WC/l5iTS0Ss8JLTLuLAVPpqf4SkPk8b39LFLPodNomD48CtPXdSiHUy9zp7RCEWkoWcd
 BL7EmzW3UIErc6KdXGn72R2zr0Ppv8N3LT/SkN4r/zwdgQqZfPqWpufiiW6TimLna1qY
 OVUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIJwTgJZEUomzoCUHkxahVlJVkxNS/SutYtRNuliIbIadTu+Op1b5JGs4U3MGo4HpGTGJoPdsCpXE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVbj6zpabWA7X41Ei1mLYgWrubH8+n0V7afyoWVsgrmRyuhRaO
 ESGLPuFAu4/utyh9zoVg06lxherN4+wIpQP9DSoamVvjV2UK5wTF/lqYjwYfJWA=
X-Gm-Gg: ASbGnctIHB+KebDoQpWCd9TMQTCE8x0tXXyxyqam3IRUYVFXZE7xLuXtKI3bFsOvpuR
 WM7rybgFzbD5BjKzb8uWdqpbTPNP+PRKAB+vFOwRwqiuXaBEb8EM9n13KtoMRFG6XxaX1ZoCHlX
 wVXiybcrOklw1gyL2BLX1+oI77w6v6WsztIXYJ3nqH2sGkd/xC0eThDWq28du6ItUv6ImbAo0+w
 x0dHsQMOCs9TzkF+BR0Vq0Te4icoF/BopMsvjprHrEoO2XR1ytN5JFR2w557IjIoY4iKJ2mferN
 vO3kLMqeCn/xpfP2I68zfyYDy24rcyZ4hrMA0nYJiGXoVB8VU0y3azumJqgciN5PwmJqoNg=
X-Google-Smtp-Source: AGHT+IFuNgUYuYuxDQfQ7GcGQX+uKB3srf0MZr5mCBeZD06wF/230+YnQJjKbWZ9J4J0XTQuOQozLQ==
X-Received: by 2002:a05:6512:1395:b0:544:13cd:bf2 with SMTP id
 2adb3069b0e04-54414a964f2mr2851649e87.5.1739066611243; 
 Sat, 08 Feb 2025 18:03:31 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-544105f2ef1sm854191e87.188.2025.02.08.18.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 18:03:29 -0800 (PST)
Date: Sun, 9 Feb 2025 04:03:27 +0200
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
Subject: Re: [PATCH v2 09/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_tail_rpm()
Message-ID: <acnyys2ddbxhdtigqeorltfxhobptx337kxn3tcsgslb3ehvht@ycz6nwi2kkb3>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-9-35dd6c834e08@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-9-35dd6c834e08@kernel.org>
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

On Tue, Feb 04, 2025 at 03:57:37PM +0100, Maxime Ripard wrote:
> drm_atomic_helper_commit_tail_rpm() is the final part of an atomic
> commit, and is given the state being committed as a parameter.
> 
> However, that parameter is named old_state, but documented as the "new
> modeset state" which is all super confusing.
> 
> Let's rename that parameter to state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
