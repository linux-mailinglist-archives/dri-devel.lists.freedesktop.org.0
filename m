Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBF3A2D412
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 06:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4297A10E2AC;
	Sat,  8 Feb 2025 05:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wFu9PkYD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1E510E2AC
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 05:19:30 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-54505a75445so162676e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 21:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738991969; x=1739596769; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XbmEch0kSfMOKC6/rJ1doWwYVcmMwQu5vCq8pLMJYLw=;
 b=wFu9PkYDh0bCq1OBefBc+GDVQOPIC8sk7eafd3/ZIGgs+CMJqfoTBMdV9h49GuGIyF
 6W4bsaiJZ7AWOMxiUwI1fqme24tB5N84nsKIeUbrAb9sNFYunOD+02n8FlBuQS0la0gs
 tmAIZE8iVFL4Im7s75M3guyrodCMt2Pe3tBqKRR6pj6c+pHRsGyrgAMbbB6xaxSxZZvr
 RqKhRQPiFke035W/Jna2qN3ZytGhOSm/ffCG4jeT/uLhYPYQoHy+VBGu4Qwo8PBYgHYs
 rGTDx2YXjhpawSKYYwgv907ADoxJ5CqwnqQmGH6+p5Taa/gbdtFRiX+Z1XKCtKTwODeZ
 Io4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738991969; x=1739596769;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XbmEch0kSfMOKC6/rJ1doWwYVcmMwQu5vCq8pLMJYLw=;
 b=QIhd7hsvd0dczzp/m7/rKOW4qtmB2xFlJ0te3/0/fP9UMhCDWKPxBVVz4Xr0rLRydX
 38YFWjJM/UTmOs0GbqjAgq9fD7IiDIh/ApVcOLOObWTTkhOB1FqMHeGCZo6qmHFdhdx3
 VdBWbFFBjtsLuX5uf2Hvn8xczjIPDYwZAOjiJOn0fJv3wQAk69KLm1Cg0jA23nh0zIrV
 oZxu8/NRqiyWnC0Q+uJopK1wpinrpXjotNX8Avd9qBojPZCcrN3j0ej5U7DKXXA031xj
 uKLNrHHsAB15m8gu24QEvx7ogdFWCQ61trZO7O8ZoXKI2O1WP5X+5CXfBxs7qFRaiOUZ
 Sftw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvXw/+1qR9z7QlgTGL2gOD0u0lpHDGNlRzqmiVGNh4aYCYtiCzEKfgFZ7v06p6eRluLIJKpjXZYAo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXL2+CM00S7kRHZM7USrF3boLOCM93OE41hrtL/VzLFJ69fEhz
 dF8JtpRxfL6ox1kybU3j6+1W3KVUZcFJAC5a34DH2IEPp9D1HQ6jMihwQc3kV8I=
X-Gm-Gg: ASbGnctc/EoPmMrjHmF30PWKGTT+/gno2cuy5vgE5sQ6h3VZMKYbiLJaATKcDy41uVn
 7PfzxtERHBo7wS1AMLjIP+kVQqCpU6a4eEihaOaSvxPTiaAzHvfak7eq5griMjrJBcVEb4M2lW4
 d8CBrcGe/rWZDM6qAZEgkFg32nVmR1kZspaRdEzUbevxcrxu77dMbRfrbSBIL8VfHhA1otwZgZ0
 ra4SZz7PvNl8UxAXoZpnsxrqp08spp082kJYAGKz7OCfPXZVROE2Tku0v4O73BeGrp9tyfHOxgQ
 1QMSD8vR+gUs4d7h+/AyISsIDDN8RIsXonhvnVwxoSr5oS5TykfiUYPF7W/pPxm9zrD6u2g=
X-Google-Smtp-Source: AGHT+IEgvj0rP082XMOnWmPAOgxRus50LsWzxvsljRKd/lfLJp/HnL9/Ij+KWNkNuMgAahlz+FUAew==
X-Received: by 2002:a05:6512:348e:b0:542:2a28:e30f with SMTP id
 2adb3069b0e04-54414abba5bmr1913205e87.31.1738991968614; 
 Fri, 07 Feb 2025 21:19:28 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5441053ecccsm626483e87.21.2025.02.07.21.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 21:19:27 -0800 (PST)
Date: Sat, 8 Feb 2025 07:19:24 +0200
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
Subject: Re: [PATCH v2 05/35] drm/bridge: Pass full state to
 atomic_post_disable
Message-ID: <thnyq2advlb6mumnokx55x4wcpqv63bttsd3numf47tpxermpd@e7buh4vhuq57>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-5-35dd6c834e08@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-5-35dd6c834e08@kernel.org>
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

On Tue, Feb 04, 2025 at 03:57:33PM +0100, Maxime Ripard wrote:
> It's pretty inconvenient to access the full atomic state from
> drm_bridges, so let's change the atomic_post_disable hook prototype to
> pass it directly.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  6 ++----
>  drivers/gpu/drm/bridge/chipone-icn6211.c           |  2 +-
>  drivers/gpu/drm/bridge/ite-it6505.c                |  2 +-
>  drivers/gpu/drm/bridge/lontium-lt9611.c            |  5 ++---
>  drivers/gpu/drm/bridge/panel.c                     |  3 +--
>  drivers/gpu/drm/bridge/parade-ps8640.c             |  2 +-
>  drivers/gpu/drm/bridge/samsung-dsim.c              |  2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |  2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c     |  2 +-
>  drivers/gpu/drm/bridge/tc358762.c                  |  3 ++-
>  drivers/gpu/drm/bridge/ti-dlpc3433.c               |  2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  2 +-
>  drivers/gpu/drm/drm_bridge.c                       | 16 +++-------------
>  drivers/gpu/drm/mediatek/mtk_dsi.c                 |  2 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c                | 14 +++++++-------
>  drivers/gpu/drm/msm/dp/dp_drm.c                    |  5 ++---
>  drivers/gpu/drm/msm/dp/dp_drm.h                    |  2 +-
>  drivers/gpu/drm/vc4/vc4_dsi.c                      |  2 +-
>  include/drm/drm_bridge.h                           |  2 +-
>  20 files changed, 32 insertions(+), 46 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
