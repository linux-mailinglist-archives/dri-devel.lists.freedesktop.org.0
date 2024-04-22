Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE34C8ACCBC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 14:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152E710F506;
	Mon, 22 Apr 2024 12:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CToBFdOu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0892710F506
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 12:27:50 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-516d2600569so5416994e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 05:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713788868; x=1714393668; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=12I/hmJ2u76lJqmqa2dDrAg2aVkMUhxeNf6XkgcF6r4=;
 b=CToBFdOuzGr3gqvpDeiBvLWkxHAh1i5u9Bu9+BBnb+eM1ntM9eceUtZVaaLBqcJCko
 t3FisrIjIwWOL/+qz9ZCgzlnBND/GJappZoBPg7npc/pKW3RVh4KNlU84zSChgCeus7S
 viHOGuQcaJda43zQPQWeZNhEfHkh/U+3e6X4Ph7FCdq5LrIDpOru8Uo8LLEN9oT8bR2N
 nonjulQSYknXTYxDHUzolgw5HbOAUPMypdKMQY7aC2BS6yan40erCev7JjlhuUUdLRXO
 JY+dqo4GyAMrmVxxgpH5OIOuaBAAKhJlqQokVIYqtoiilq324oYPw7KUtvDkEPZUd75s
 mTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713788868; x=1714393668;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=12I/hmJ2u76lJqmqa2dDrAg2aVkMUhxeNf6XkgcF6r4=;
 b=Xu1At0+QCqQ3qzWNLHwO+hZa+Dyu3gfR839pJi4YlkmucifVslxj+aq1yhnQJ5VNLW
 VSGZNXmK+q/b8FSABfkIkeiMIG/j3EXT46dEuCc3aWsJl9oS/S4BI4WXLc9EKagGddas
 oAX3ChgumJK8LnEuAx/W5aODp7XCwSWOgMDawZN2so4Tn65J+c8lclEtY9mLM7UOJR1M
 BTdmoktExJegKDaJOTEN5stnOoC31uB4GvcVKTgf1PAHeN6AO8LcqlnNQFWqkPP5Lv4p
 lQls5Kj7dgzuSqCiZdTAu3NtiR1C2VyqqyV367fYprFTuFcFWzccLUnSvcFcUhealxnL
 gF9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRX7fyCbRALaTv0ubub8/CA3WHsTcoLkCd7cObTCdKYFAZN5O0B7SXUgERilrhBCTa4b8SAmEdiN01kQL5mdYLCMkpKVHgYqY5/36jTcx0
X-Gm-Message-State: AOJu0YxBMQytjB0Y8jDsPEDRMktsEt3pJIkLqB3DgqIG73Dp8M0khNi+
 Klq1HUjbbNZy+yAYU30aQjY25khqYhW1p/IvAGXqWu6e5Mea9u4C05QV1QfCwpM=
X-Google-Smtp-Source: AGHT+IHVVaGOnbVBC2sXkZB/sTSuTYbDmcWOHVAaQJnXB4GCRg5Rj303uKct+4WAPf2X2LSbc+ER+A==
X-Received: by 2002:ac2:58ca:0:b0:51b:396e:2880 with SMTP id
 u10-20020ac258ca000000b0051b396e2880mr1328427lfo.63.1713788867880; 
 Mon, 22 Apr 2024 05:27:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l29-20020ac2555d000000b0051929ed7b08sm1727333lfk.140.2024.04.22.05.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 05:27:47 -0700 (PDT)
Date: Mon, 22 Apr 2024 15:27:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/11] drm: Restore helper usability
Message-ID: <xf4bhhmf6jxnnkvc3g4gs7mdup3cxtnrjrkp2pipnvgx3odx7h@ewkr7jbcs36u>
References: <cover.1713780345.git.geert+renesas@glider.be>
 <87il09ty4u.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87il09ty4u.fsf@intel.com>
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

On Mon, Apr 22, 2024 at 02:50:09PM +0300, Jani Nikula wrote:
> On Mon, 22 Apr 2024, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > 	Hi all,
> >
> > As discussed on IRC with Maxime and Arnd, this series reverts the
> > conversion of select to depends for various DRM helpers in series
> > "[PATCH v3 00/13] drm/display: Convert helpers Kconfig symbols to
> > depends on"[1], and various fixes for it.  This conversion introduced a
> > big usability issue when configuring a kernel and enabling DRM drivers
> > that use DRM helper code: as drivers now depend on helpers, the user
> > needs to know which helpers to enable, before the driver he is
> > interested even becomes visible.  The user should not need to know that,
> > and drivers should select the helpers they need.
> >
> > Hence revert back to what we had before, where drivers selected the
> > helpers (and any of their dependencies, if they can be met) they need.
> > In general, when a symbol selects another symbol, it should just make
> > sure the dependencies of the target symbol are met, which may mean
> > adding dependencies to the source symbol.
> 
> I still disagree with this, because fundamentally the source symbol
> really should not have to care about the dependencies of the target
> symbol.

I'd agree with you, but if the driver depends on helpers it becomes
ridiculous. So, it seems, we need a different solution for the original
problem.

> That said, I'm not going to keep arguing against this. Whatever.
> 
> 
> BR,
> Jani.
> 
> 
> >
> > Thanks for applying!
> >
> > [1] https://lore.kernel.org/r/20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org/
> >
> > Geert Uytterhoeven (11):
> >   Revert "drm: fix DRM_DISPLAY_DP_HELPER dependencies, part 2"
> >   Revert "drm/display: Select DRM_KMS_HELPER for DP helpers"
> >   Revert "drm/bridge: dw-hdmi: Make DRM_DW_HDMI selectable"
> >   Revert "drm: fix DRM_DISPLAY_DP_HELPER dependencies"
> >   Revert "drm: Switch DRM_DISPLAY_HDMI_HELPER to depends on"
> >   Revert "drm: Switch DRM_DISPLAY_HDCP_HELPER to depends on"
> >   Revert "drm: Switch DRM_DISPLAY_DP_HELPER to depends on"
> >   Revert "drm: Switch DRM_DISPLAY_DP_AUX_BUS to depends on"
> >   Revert "drm: Switch DRM_DISPLAY_HELPER to depends on"
> >   Revert "drm: Make drivers depends on DRM_DW_HDMI"
> >   Revert "drm/display: Make all helpers visible and switch to depends
> >     on"
> >
> >  drivers/gpu/drm/Kconfig                 |  8 +++----
> >  drivers/gpu/drm/amd/amdgpu/Kconfig      | 12 ++++------
> >  drivers/gpu/drm/bridge/Kconfig          | 28 +++++++++++-----------
> >  drivers/gpu/drm/bridge/analogix/Kconfig | 18 +++++++-------
> >  drivers/gpu/drm/bridge/cadence/Kconfig  |  8 +++----
> >  drivers/gpu/drm/bridge/imx/Kconfig      |  4 ++--
> >  drivers/gpu/drm/bridge/synopsys/Kconfig |  6 ++---
> >  drivers/gpu/drm/display/Kconfig         | 32 ++++++++++---------------
> >  drivers/gpu/drm/exynos/Kconfig          |  4 ++--
> >  drivers/gpu/drm/i915/Kconfig            |  8 +++----
> >  drivers/gpu/drm/imx/ipuv3/Kconfig       |  5 ++--
> >  drivers/gpu/drm/ingenic/Kconfig         |  2 +-
> >  drivers/gpu/drm/mediatek/Kconfig        |  6 ++---
> >  drivers/gpu/drm/meson/Kconfig           |  2 +-
> >  drivers/gpu/drm/msm/Kconfig             |  8 +++----
> >  drivers/gpu/drm/nouveau/Kconfig         | 10 ++++----
> >  drivers/gpu/drm/panel/Kconfig           | 32 ++++++++++++-------------
> >  drivers/gpu/drm/radeon/Kconfig          |  8 +++----
> >  drivers/gpu/drm/renesas/rcar-du/Kconfig |  2 +-
> >  drivers/gpu/drm/rockchip/Kconfig        | 10 ++++----
> >  drivers/gpu/drm/sun4i/Kconfig           |  2 +-
> >  drivers/gpu/drm/tegra/Kconfig           |  8 +++----
> >  drivers/gpu/drm/vc4/Kconfig             | 10 ++++----
> >  drivers/gpu/drm/xe/Kconfig              | 13 ++++------
> >  drivers/gpu/drm/xlnx/Kconfig            |  8 +++----
> >  25 files changed, 116 insertions(+), 138 deletions(-)
> 
> -- 
> Jani Nikula, Intel

-- 
With best wishes
Dmitry
