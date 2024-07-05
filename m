Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4E1928540
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 11:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D095F10E8E0;
	Fri,  5 Jul 2024 09:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="f8423j8u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D841610E8E0
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 09:38:31 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-367a61bcb78so9639f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2024 02:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720172310; x=1720777110; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pT1UJ9N3pWzvcPQR7JsfhGRn7Rk+YcR2gwQuDIMWvfo=;
 b=f8423j8u9wXQW6zU8rpU7OusrAGPKnR5dOAJwsQ9BqKt4pdW4UzTQKTZapEOwXGZE4
 HKwFOb/Nh656rgyLuCvsI8REgMqnov+x77yfZD/7E117E/n/oxVnsuJzZwGRnXJ9RAni
 gdJcICEp0KtfcIcwlELzl21+b1sXRBU530jDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720172310; x=1720777110;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pT1UJ9N3pWzvcPQR7JsfhGRn7Rk+YcR2gwQuDIMWvfo=;
 b=IiB4YT5jWmdz6sBjfqRdCnYYs1Gd0CTrdxQZS5lb1mJLGnHn0PDUn0EpPz1oNoupdI
 NUdo8FSwCUih+NuFaEALO/fbhcQ8+xTPbG5C6bVBArQICLF39oXtdEHjFVCEWozhY3Ao
 qPWX8Dv4rvXKYNjeD3mnRBIklWotc5mi8YSJpiEL8kpBV5l3rFDyfWYQIvYSKFc1OIxL
 6+JjnLTSHcsGrzB0vw4Il96yxWZwiy7t8tUf4cIzRNTXtw2bi/wpr1lvQedGdGk1Cnmm
 bSkMZm70s1x543PRKG4owfvHGgq3ldjRwzPHmi/e4V6sDkcWJvUN4KZOSPVEkJfGFgpA
 oDkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpWQgCs43w34t+KO55faSVONApwBsff+YbWIO5uywmqamx3vDkGBrKSW7GrkwY7Z5YKiq7akxttyU8TuYFgZi+Xry/RirmdhKZwSdiZVAz
X-Gm-Message-State: AOJu0Yy+OMYBjCRTnD9Pu1ULhNoEfrrNsQ1WrmgMJtvfkcrSqOn4XWAv
 uIUQnce0Ylt8r8W3h9RDq1SR+30vcHzdadz0Zf9guE9UTw7lH+zSfuD/LfrnOMo=
X-Google-Smtp-Source: AGHT+IFr1VGyRFU/0u2pp78RWno1CY3Qil6jyjPg5NuX4Xxv2+lUICjs4JFYPgOwUWsfE6CcHi8F8g==
X-Received: by 2002:a5d:47a4:0:b0:367:916e:4215 with SMTP id
 ffacd0b85a97d-3679dd67d66mr2699242f8f.4.1720172310051; 
 Fri, 05 Jul 2024 02:38:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3678fefc01dsm7099182f8f.26.2024.07.05.02.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 02:38:29 -0700 (PDT)
Date: Fri, 5 Jul 2024 11:38:27 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>,
 Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Douglas Anderson <dianders@chromium.org>,
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>, 
 Michael Walle <mwalle@kernel.org>
Subject: Re: [GIT PULL] mediatek drm next for 6.11
Message-ID: <Zoe_E1eM7kb6rMsp@phenom.ffwll.local>
References: <20240628134632.28672-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240628134632.28672-1-chunkuang.hu@kernel.org>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Fri, Jun 28, 2024 at 01:46:32PM +0000, Chun-Kuang Hu wrote:
> Hi, Dave & Daniel:
> 
> This includes:
> 
> 1. Convert to platform remove callback returning void
> 2. Drop chain_mode_fixup call in mode_valid()
> 3. Fixes the errors of MediaTek display driver found by IGT.
> 4. Add display support for the MT8365-EVK board
> 5. Fix bit depth overwritten for mtk_ovl_set bit_depth()
> 6. Remove less-than-zero comparison of an unsigned value
> 7. Call drm_atomic_helper_shutdown() at shutdown time
> 8. Log errors in probe with dev_err_probe()
> 9. Fix possible_crtcs calculation
> 10. Fix spurious kfree()
> 
> Regards,
> Chun-Kuang.
> 
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.11
> 
> for you to fetch changes up to 8ad49a92cff4bab13eb2f2725243f5f31eff3f3b:
> 
>   drm/mediatek/dp: Fix spurious kfree() (2024-06-28 13:01:43 +0000)

Pulled, thanks.
-Sima

> 
> ----------------------------------------------------------------
> Mediatek DRM Next for Linux 6.11
> 
> 1. Convert to platform remove callback returning void
> 2. Drop chain_mode_fixup call in mode_valid()
> 3. Fixes the errors of MediaTek display driver found by IGT.
> 4. Add display support for the MT8365-EVK board
> 5. Fix bit depth overwritten for mtk_ovl_set bit_depth()
> 6. Remove less-than-zero comparison of an unsigned value
> 7. Call drm_atomic_helper_shutdown() at shutdown time
> 8. Log errors in probe with dev_err_probe()
> 9. Fix possible_crtcs calculation
> 10. Fix spurious kfree()
> 
> ----------------------------------------------------------------
> Alexandre Mergnat (9):
>       dt-bindings: display: mediatek: aal: add compatible for MT8365 SoC
>       dt-bindings: display: mediatek: ccorr: add compatible for MT8365 SoC
>       dt-bindings: display: mediatek: color: add compatible for MT8365 SoC
>       dt-bindings: display: mediatek: dither: add compatible for MT8365 SoC
>       dt-bindings: display: mediatek: dsi: add compatible for MT8365 SoC
>       dt-bindings: display: mediatek: dpi: add compatible for MT8365
>       dt-bindings: display: mediatek: gamma: add compatible for MT8365 SoC
>       dt-bindings: display: mediatek: ovl: add compatible for MT8365 SoC
>       dt-bindings: display: mediatek: rdma: add compatible for MT8365 SoC
> 
> Douglas Anderson (1):
>       drm/mediatek: Call drm_atomic_helper_shutdown() at shutdown time
> 
> Hsiao Chien Sung (15):
>       drm/mediatek: Add missing plane settings when async update
>       drm/mediatek: Use 8-bit alpha in ETHDR
>       drm/mediatek: Fix XRGB setting error in OVL
>       drm/mediatek: Fix XRGB setting error in Mixer
>       drm/mediatek: Fix destination alpha error in OVL
>       drm/mediatek: Turn off the layers with zero width or height
>       drm/mediatek: Add OVL compatible name for MT8195
>       drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation property
>       drm/mediatek: Add new color format MACROs in OVL
>       drm/mediatek: Set DRM mode configs accordingly
>       drm/mediatek: Support more 10bit formats in OVL
>       drm/mediatek: Support RGBA8888 and RGBX8888 in OVL on MT8195
>       drm/mediatek: Support DRM plane alpha in OVL
>       drm/mediatek: Support DRM plane alpha in Mixer
>       drm/mediatek: Remove less-than-zero comparison of an unsigned value
> 
> Jason-JH.Lin (1):
>       drm/mediatek: Fix bit depth overwritten for mtk_ovl_set bit_depth()
> 
> Michael Walle (2):
>       drm/mediatek: dpi/dsi: Fix possible_crtcs calculation
>       drm/mediatek/dp: Fix spurious kfree()
> 
> Nícolas F. R. A. Prado (1):
>       drm/mediatek: Log errors in probe with dev_err_probe()
> 
> Sam Ravnborg (1):
>       drm/mediatek: Drop chain_mode_fixup call in mode_valid()
> 
> Uwe Kleine-König (1):
>       drm/mediatek: Convert to platform remove callback returning void
> 
>  .../bindings/display/mediatek/mediatek,aal.yaml    |   1 +
>  .../bindings/display/mediatek/mediatek,ccorr.yaml  |   3 +
>  .../bindings/display/mediatek/mediatek,color.yaml  |   1 +
>  .../bindings/display/mediatek/mediatek,dither.yaml |   1 +
>  .../bindings/display/mediatek/mediatek,dpi.yaml    |   4 +
>  .../bindings/display/mediatek/mediatek,dsi.yaml    |   1 +
>  .../bindings/display/mediatek/mediatek,gamma.yaml  |   1 +
>  .../bindings/display/mediatek/mediatek,ovl.yaml    |   1 +
>  .../bindings/display/mediatek/mediatek,rdma.yaml   |   1 +
>  drivers/gpu/drm/mediatek/mtk_cec.c                 |  28 ++---
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c            | 109 ++++++++++------
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h            |   8 +-
>  drivers/gpu/drm/mediatek/mtk_disp_aal.c            |  18 ++-
>  drivers/gpu/drm/mediatek/mtk_disp_ccorr.c          |  18 ++-
>  drivers/gpu/drm/mediatek/mtk_disp_color.c          |  18 ++-
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |  18 ++-
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c          |  25 ++--
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c            | 140 +++++++++++++--------
>  drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |   6 +-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |  31 ++---
>  drivers/gpu/drm/mediatek/mtk_dp.c                  |  18 +--
>  drivers/gpu/drm/mediatek/mtk_dpi.c                 |   5 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  32 +++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   4 +
>  drivers/gpu/drm/mediatek/mtk_dsi.c                 |   5 +-
>  drivers/gpu/drm/mediatek/mtk_ethdr.c               |  46 ++++---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                |  42 ++-----
>  drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c            |  21 ++--
>  drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |  18 ++-
>  drivers/gpu/drm/mediatek/mtk_padding.c             |  25 ++--
>  drivers/gpu/drm/mediatek/mtk_plane.c               |   4 +-
>  31 files changed, 373 insertions(+), 280 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
