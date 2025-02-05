Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46274A28232
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 03:54:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DB210E71C;
	Wed,  5 Feb 2025 02:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JXkupjbL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1EE310E71C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 02:54:19 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-305d843d925so49783441fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 18:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738724058; x=1739328858; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OYZuDPFMLQ+OLhTc7ZzIuiQKs2wek7VNQb4qjvs/Nn8=;
 b=JXkupjbLGoITwXrJLNJDoFzt3fMiOE50ZvkA/1rmcMYhr+yPpY9sE3+IGzRm8NYxLQ
 01aqMTtMFwIfxgfyD8Y1HTLGGcPszN6eMx89AWGrbg8Bp+9/qRHa6Lr/K2yif2H66kMt
 NTgWfGCsNdHEkgpMug9WQwlNOK/oIP9s2sxr2rV/6xK11A4OHwNOHCBTQCWPmlsD51Q2
 9P2E+gv2oR4M5sNFWWqkiryEa6V1xYt1fEc5QGkfORN5DrSIbRkXTdxN7gIVE0drCB7Z
 hroroeqfriPxQNHcTOAWhIUaWJzsgKaync0Dxx8RMZ+Sni6VCzQQP52t8UVrs4hw8vJK
 /KIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738724058; x=1739328858;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OYZuDPFMLQ+OLhTc7ZzIuiQKs2wek7VNQb4qjvs/Nn8=;
 b=b9qOH5Wq2gFuO4H/DKIJ9Q3Twq7x3NcEX+UFYs0yGfn+kDrks92Cxabk76qnEhzW5k
 dj6FU8LnSPRL1xJJGC66NPKEch4/g3vTr3VUm750LGbdxnttFGm5TaQjLpuxxaz80AM/
 IoiJvJGBCwqZ2/ctJ7zZYf7Hmp53RwQ8xR8peH3H73ZXqIHsZVet6Ojr3mC8dyxSfGDv
 IAoUj7EWl7TQCuqEyj9DvTG7sfnoGscwz4KcGMFEtjQ7Wg2Ess/icThHwmtEdsUH/Y83
 afB7c77QuLA8dKpMysOAi0LkU2qdQmIAJHye1JBb5Fmupzk3jHj4P83AdJMhftWLqewJ
 uREw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+nV+xpZERRUaunBoU08pmwNEHe5Ro9WQtDAD9qo5Xq1nnATlNbReM0/eyJJ4BQxZ9QiR+vZc2CwY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyA1CxNtHV7I/DQ+kXZKW1+fOxgME36DAbnXtg5akYNEPcaCpQi
 s70hTTXaWMQ5z3lqa63JruRUoga4flaEQdRvWLQWXx6SlJClkT+jdnp6BvFRbi8=
X-Gm-Gg: ASbGncthVjBANnxqN9r42G2vM1IB+Bn3xxOUvDO65fhAWMnAp8FvSTq6pbZz5pAH7kH
 jLkoYI2t7xkNKO0Gr+qKLcc5G94tYDb1PRSPBHAgWwu6D1xSEANj9eG0jGR4WzFqEJ8Llf3jPHG
 89gPz/fN58v0rHRk9GbiRiazh5PGHUASFQPhEKQs1X5wzzTg9g3XPI4SKCjWRi5DDt8oV+edoq9
 3u9QxXCsosmKjOYn90gRq0SezKFQdK0pxVXpXDbabswIWeoKPfwPyymRhYjVfLcsQbxBQIaIWj3
 JQGX5TFK3tM8km++plywwRUL0rurx6MU0QwmNX01b3O5VI6fde+P2R/q8TKKVPfLw3eCSyQ=
X-Google-Smtp-Source: AGHT+IHPVoXXLHIxl6ddc44Iw6mnopmfN70pRmNow34QqWOLsoeN3BSDLVO0cC1hibW9A/XhOv4Nzw==
X-Received: by 2002:a05:651c:220e:b0:2ff:d7cf:a6cb with SMTP id
 38308e7fff4ca-307cf2fdd34mr3899241fa.11.1738724058047; 
 Tue, 04 Feb 2025 18:54:18 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307a34288b4sm19027531fa.105.2025.02.04.18.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 18:54:16 -0800 (PST)
Date: Wed, 5 Feb 2025 04:54:14 +0200
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
Subject: Re: [PATCH v2 03/35] drm/bridge: Pass full state to atomic_enable
Message-ID: <iai7btbq23r3vkimz6c4ukfb2fjwijkdgswxiq6kvfm3pgsjhq@firhtmoa2l2z>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-3-35dd6c834e08@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-3-35dd6c834e08@kernel.org>
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

On Tue, Feb 04, 2025 at 03:57:31PM +0100, Maxime Ripard wrote:
> It's pretty inconvenient to access the full atomic state from
> drm_bridges, so let's change the atomic_enable hook prototype to pass it
> directly.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c  |  6 ++----
>  drivers/gpu/drm/bridge/analogix/anx7625.c           |  6 +++---
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c |  3 +--
>  drivers/gpu/drm/bridge/chipone-icn6211.c            |  3 +--
>  drivers/gpu/drm/bridge/fsl-ldb.c                    |  3 +--
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c        |  5 +++--
>  drivers/gpu/drm/bridge/imx/imx8qm-ldb.c             |  5 ++---
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c            |  7 +++----
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c     |  5 ++---
>  drivers/gpu/drm/bridge/ite-it6263.c                 |  6 ++----
>  drivers/gpu/drm/bridge/ite-it6505.c                 |  3 +--
>  drivers/gpu/drm/bridge/ite-it66121.c                |  3 +--
>  drivers/gpu/drm/bridge/lontium-lt9211.c             |  3 +--
>  drivers/gpu/drm/bridge/lontium-lt9611.c             |  6 ++----
>  drivers/gpu/drm/bridge/nwl-dsi.c                    |  5 ++---
>  drivers/gpu/drm/bridge/panel.c                      |  3 +--
>  drivers/gpu/drm/bridge/samsung-dsim.c               |  2 +-
>  drivers/gpu/drm/bridge/sii902x.c                    |  2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c        |  3 +--
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c           |  3 +--
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c       |  2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c      |  2 +-
>  drivers/gpu/drm/bridge/tc358762.c                   |  3 ++-
>  drivers/gpu/drm/bridge/tc358767.c                   | 10 ++++------
>  drivers/gpu/drm/bridge/ti-dlpc3433.c                |  2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c               |  2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c               |  4 ++--
>  drivers/gpu/drm/bridge/ti-tdp158.c                  |  3 ++-
>  drivers/gpu/drm/drm_bridge.c                        | 10 +---------
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c           |  2 +-
>  drivers/gpu/drm/mediatek/mtk_dp.c                   |  4 ++--
>  drivers/gpu/drm/mediatek/mtk_dsi.c                  |  2 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                 |  3 +--
>  drivers/gpu/drm/meson/meson_encoder_cvbs.c          |  3 +--
>  drivers/gpu/drm/meson/meson_encoder_dsi.c           |  3 +--
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c          |  3 +--
>  drivers/gpu/drm/msm/dp/dp_display.c                 | 12 ++++++------
>  drivers/gpu/drm/msm/dp/dp_drm.c                     |  9 ++++-----
>  drivers/gpu/drm/msm/dp/dp_drm.h                     |  2 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c                 |  3 +--
>  drivers/gpu/drm/omapdrm/dss/hdmi5.c                 |  3 +--
>  drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c         |  3 +--
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c     |  2 +-
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c      |  3 +--
>  drivers/gpu/drm/stm/lvds.c                          |  3 +--
>  drivers/gpu/drm/vc4/vc4_dsi.c                       |  2 +-
>  drivers/gpu/drm/xlnx/zynqmp_dp.c                    | 10 ++++------
>  include/drm/drm_bridge.h                            |  2 +-
>  48 files changed, 78 insertions(+), 116 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
