Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F9FA2DB4C
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 07:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4D210E1CF;
	Sun,  9 Feb 2025 06:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="y+eh7ljV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB7310E1CF
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 06:18:29 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-3076262bfc6so35590391fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 22:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739081908; x=1739686708; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=htkXXB7hjh9tN44FJz5MK8aOhFXrnSM1y8XrIzHSCXQ=;
 b=y+eh7ljVR2OKHW4s9/cEJjvCQVOhRS7WhVJeb0SvhN7mDvAAta2v6h6DUOXwv+lODI
 u0iQZyUNK+jGlbV+R5xmhWf4t/YkuMyyHIcnTr9YhdX+RWAohMR87czjEBfEddCeIVV3
 wjNIOYKJgWltDm+8ksu5EyS14WQZbj0zK8f7f7MogGQezrZv9brgQ72h6e+JPr+wb/jV
 W2VEXX+hO21Gu0kjZhgsKQNfl5hZbU1RdjqRS3fESq9yVWp1nBqT/yHAOyB6ue6eprO4
 B6cl4+X8YsRKiBIgHBKJkCcxpjShbenPtbBSJfJCr4nTnEY5uC6U5pX9W4fmN0bABZG1
 9EaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739081908; x=1739686708;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=htkXXB7hjh9tN44FJz5MK8aOhFXrnSM1y8XrIzHSCXQ=;
 b=KVezYACtNuCzxwLR8qzrFfKAjMOTtqyma1dTrmFqitpfbrFylFz6DEfS69K6SJJu63
 fCcAkVAP8+RHZVmKxkfdcC678RDmSeCI1E2ddCgDlR2QE/Gd+zr1lY5y9qCZcwGg622w
 jHl8NEkOT3+zPNHFUX/Ydp7/t+t4Njxamaf1VXZKBycNPhS7qUp+1L/0xN/k0cl/aAwn
 ppyprUHUsVqfzhFBDPUW2s4qsHcqfJGsQOP2Fs/UK7O8GJnr0T9d2uIDZjYn2DN/F1zW
 pgPmfFcQft1eTC6Rj9XYZnjV0mPFzDZ+fA9+cWG1evcCSRwJ1Urt+ox5+T13V8sB8Uey
 QHyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4mX0QioVqknf7pTVmYomSPMu8dE+Hr9ZBPZAry4O/wUfIFrXrrSf1x4EB2r98lTbj3WU/Hdy+eJk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzH+2Rt2nAobRwyOM4DkILSBdJMyNEt0D5cpwSAFdOnPydrm8KQ
 fZmTem8dvXjeuUdYt8XYwkRm1l0qAc1eyN5fHSxD6yLiBxzMyMVUBfLnHVn6O68=
X-Gm-Gg: ASbGncuY1iYzwVKn9pGNNCz5HeCMode0525hqNvuPsInDLFX+ZlHD14+5yKPAqJc9WX
 i51M4gnztd58XeXXtlaJGjOaRGXlkzWWK2IuL6uPkomEzZRwzd4/nJTcjNwizNmrSIP3UD5HONd
 eo4SDFKJPZewh2HCgD+7fE9IIr2I1HTx7h7laes7ut14wKTXHJoorjy0qS0iDw/UgYvXXTzv23W
 HA1sv9n6zvJbFgGQ8UHPAzL4mKwUyCqdgumkkHdCR/uR6GVSEuq0eAkUmjApM9YO0LpFsiZk9QB
 ZTxgDxPY9bcQcX4P7V+UnqWNdS3ZooctOOB+Cv9zUZ6oaWmFhN/NIunkodlWitL1HmRcKgY=
X-Google-Smtp-Source: AGHT+IGgF3szSNrfu2MbeKVhjkce8cOMaTG201Ct9UsQDHLoebAoA0gFEiDQtHl3l574oYtatynpfQ==
X-Received: by 2002:a05:651c:982:b0:307:46f3:4e92 with SMTP id
 38308e7fff4ca-307e5a8acadmr39302301fa.32.1739081907633; 
 Sat, 08 Feb 2025 22:18:27 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de2bb126sm9410501fa.72.2025.02.08.22.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 22:18:26 -0800 (PST)
Date: Sun, 9 Feb 2025 08:18:24 +0200
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
Subject: Re: [PATCH v2 27/35] drm/bridge: Add encoder parameter to
 drm_bridge_funcs.attach
Message-ID: <c32yyscbj2hjad4f4nzrod5us5zw4d5yh6jyxlhvaulg6vqxhh@7dpb3dchfcv2>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-27-35dd6c834e08@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-27-35dd6c834e08@kernel.org>
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

On Tue, Feb 04, 2025 at 03:57:55PM +0100, Maxime Ripard wrote:
> The drm_bridge structure contains an encoder pointer that is widely used
> by bridge drivers. This pattern is largely documented as deprecated in
> other KMS entities for atomic drivers.
> 
> However, one of the main use of that pointer is done in attach to just
> call drm_bridge_attach on the next bridge to add it to the bridge list.
> While this dereferences the bridge->encoder pointer, it's effectively
> the same encoder the bridge was being attached to.
> 
> We can make it more explicit by adding the encoder the bridge is
> attached to to the list of attach parameters. This also removes the need
> to dereference bridge->encoder in most drivers.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Note, tc358767.c and ti-sn65dsi86.c also has several bridge.encoder uses
in attach callbacks.

Also, we still have a lot of usecases for bridge->encoder. including
core functions like drm_bridge_get_next_bridge() and
drm_bridge_get_prev_bridge().

Maybe that's handled in a later patches.

> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c             |  3 ++-
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c       |  3 ++-
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c       |  3 ++-
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c       |  2 +-
>  drivers/gpu/drm/bridge/analogix/anx7625.c                |  3 ++-
>  drivers/gpu/drm/bridge/aux-bridge.c                      |  3 ++-
>  drivers/gpu/drm/bridge/aux-hpd-bridge.c                  |  1 +
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c           |  3 ++-
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c      |  1 +
>  drivers/gpu/drm/bridge/chipone-icn6211.c                 |  6 ++++--
>  drivers/gpu/drm/bridge/chrontel-ch7033.c                 |  5 +++--
>  drivers/gpu/drm/bridge/display-connector.c               |  1 +
>  drivers/gpu/drm/bridge/fsl-ldb.c                         |  3 ++-
>  drivers/gpu/drm/bridge/imx/imx-ldb-helper.c              |  7 +++----
>  drivers/gpu/drm/bridge/imx/imx-ldb-helper.h              |  2 +-
>  drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c           |  3 ++-
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c             |  3 ++-
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c      |  3 ++-
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c          |  3 ++-
>  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c             |  3 ++-
>  drivers/gpu/drm/bridge/ite-it6263.c                      |  7 ++++---
>  drivers/gpu/drm/bridge/ite-it6505.c                      |  1 +
>  drivers/gpu/drm/bridge/ite-it66121.c                     |  3 ++-
>  drivers/gpu/drm/bridge/lontium-lt8912b.c                 |  3 ++-
>  drivers/gpu/drm/bridge/lontium-lt9211.c                  |  3 ++-
>  drivers/gpu/drm/bridge/lontium-lt9611.c                  |  3 ++-
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c               |  3 ++-
>  drivers/gpu/drm/bridge/lvds-codec.c                      |  3 ++-
>  drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c |  1 +
>  drivers/gpu/drm/bridge/microchip-lvds.c                  |  3 ++-
>  drivers/gpu/drm/bridge/nwl-dsi.c                         |  3 ++-
>  drivers/gpu/drm/bridge/nxp-ptn3460.c                     |  5 +++--
>  drivers/gpu/drm/bridge/panel.c                           |  3 ++-
>  drivers/gpu/drm/bridge/parade-ps8622.c                   |  1 +
>  drivers/gpu/drm/bridge/parade-ps8640.c                   |  3 ++-
>  drivers/gpu/drm/bridge/samsung-dsim.c                    |  3 ++-
>  drivers/gpu/drm/bridge/sii902x.c                         |  5 +++--
>  drivers/gpu/drm/bridge/sil-sii8620.c                     |  1 +
>  drivers/gpu/drm/bridge/simple-bridge.c                   |  5 +++--
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c                |  3 ++-
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c            |  5 +++--
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c           |  5 +++--
>  drivers/gpu/drm/bridge/tc358762.c                        |  3 ++-
>  drivers/gpu/drm/bridge/tc358764.c                        |  3 ++-
>  drivers/gpu/drm/bridge/tc358767.c                        |  2 ++
>  drivers/gpu/drm/bridge/tc358768.c                        |  3 ++-
>  drivers/gpu/drm/bridge/tc358775.c                        |  3 ++-
>  drivers/gpu/drm/bridge/thc63lvd1024.c                    |  3 ++-
>  drivers/gpu/drm/bridge/ti-dlpc3433.c                     |  4 ++--
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c                    |  3 ++-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c                    |  3 ++-
>  drivers/gpu/drm/bridge/ti-tdp158.c                       |  6 ++++--
>  drivers/gpu/drm/bridge/ti-tfp410.c                       |  5 +++--
>  drivers/gpu/drm/bridge/ti-tpd12s015.c                    |  3 ++-
>  drivers/gpu/drm/drm_bridge.c                             |  2 +-
>  drivers/gpu/drm/i2c/tda998x_drv.c                        |  1 +
>  drivers/gpu/drm/imx/ipuv3/parallel-display.c             |  3 ++-
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c                |  5 +++--
>  drivers/gpu/drm/mcde/mcde_dsi.c                          |  3 ++-
>  drivers/gpu/drm/mediatek/mtk_dp.c                        |  3 ++-
>  drivers/gpu/drm/mediatek/mtk_dpi.c                       |  3 ++-
>  drivers/gpu/drm/mediatek/mtk_dsi.c                       |  3 ++-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                      |  3 ++-
>  drivers/gpu/drm/meson/meson_encoder_cvbs.c               |  3 ++-
>  drivers/gpu/drm/meson/meson_encoder_dsi.c                |  3 ++-
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c               |  3 ++-
>  drivers/gpu/drm/msm/dsi/dsi_manager.c                    |  3 ++-
>  drivers/gpu/drm/omapdrm/dss/dpi.c                        |  3 ++-
>  drivers/gpu/drm/omapdrm/dss/dsi.c                        |  3 ++-
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c                      |  3 ++-
>  drivers/gpu/drm/omapdrm/dss/hdmi5.c                      |  3 ++-
>  drivers/gpu/drm/omapdrm/dss/sdi.c                        |  3 ++-
>  drivers/gpu/drm/omapdrm/dss/venc.c                       |  3 ++-
>  drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c              |  3 ++-
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c          |  3 ++-
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c           |  3 ++-
>  drivers/gpu/drm/stm/lvds.c                               | 11 +++++------
>  drivers/gpu/drm/tidss/tidss_encoder.c                    |  3 ++-
>  drivers/gpu/drm/vc4/vc4_dsi.c                            |  3 ++-
>  drivers/gpu/drm/xlnx/zynqmp_dp.c                         |  3 ++-
>  drivers/platform/arm64/acer-aspire1-ec.c                 |  3 ++-
>  include/drm/drm_bridge.h                                 |  2 +-
>  82 files changed, 170 insertions(+), 94 deletions(-)

-- 
With best wishes
Dmitry
