Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DBA95B003
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 10:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE0010E7E3;
	Thu, 22 Aug 2024 08:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="DJFcod9q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F1E10E3FD
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 08:15:59 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3719753d365so246072f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 01:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724314558; x=1724919358; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=75AbW8YCcPqvwKBFK7/SreyR9quK7zkhy+4xs4mwsXg=;
 b=DJFcod9qejYfSITIPzP1M0gpsQXgFJ9UwbQ4Aa5cUDusHBZiU4W2AYA52RYgYtKFXy
 JnT2NfN7PS5q1/dZr+G8UUFyaqrWUdhVnnMLirguebclDDpCZeu08U0/YXwi+lHaxk7t
 cSVMLdHU4VaJwmOESLvOBZjaZShspV8TCOlvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724314558; x=1724919358;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=75AbW8YCcPqvwKBFK7/SreyR9quK7zkhy+4xs4mwsXg=;
 b=kfiEWKsPWKxkXfIBMMZkUHyMxQCvHjuL1PIk6iaUdlyYuxGRSGOyHj0EzSLqyZsVnp
 E1qbJIUoGTJnlDATRGNFquK5uMI8UVQ9qJ+dnHuL9PnGyb/Jt1v5/wWOLUH+CTu/Om1q
 NFYRyi2+OWOiq74eQqj39UspUBRt2MNwDDuP7YSqeoTXhlQv/fKeWRPWoKZMLL251Qbz
 CjA9VWF9JQTmH5+DK/A2y9azX/193QumPKsGSDCo/G1M21FlzJHRlV2T+0zMylgNu8jx
 YYHgVMUHjlhKxipSSZ+0O3rCYSmLmgzdvizwQO1+2tCw0wkd/kCR6bGMMGNEXCLQDpZf
 mrYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiewKNWgwjFUTbnwYLAKvUd+GjYIumHEvp4oZofuLms8raXhjbF9sAf2sVelM//DsZx26yYkX8q8o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTkAjeICVyCndtRGnLoDDr+3easgW26GUN36lu7fwZP71DdKat
 HKuL2U5Mq5QlVkZ1ZrfOun6GyU8xjcjYjiA5Yyp9PNkJMAYiSZvpc2A7hUcrie8=
X-Google-Smtp-Source: AGHT+IEEXh+Q/+CkzsVsvEFcQ/I2Vf2dvHt8pCyu+gou90gTZKOWWPrxbLxRN1SPXddLS0cesV12Yw==
X-Received: by 2002:a5d:59a3:0:b0:368:75:2702 with SMTP id
 ffacd0b85a97d-372fd585cb3mr4553322f8f.13.1724314557765; 
 Thu, 22 Aug 2024 01:15:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42abefeaa45sm52420865e9.39.2024.08.22.01.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 01:15:57 -0700 (PDT)
Date: Thu, 22 Aug 2024 10:15:55 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: Re: [PULL] drm-misc-next
Message-ID: <Zsbzu6uDoroaWXUu@phenom.ffwll.local>
References: <20240816084109.GA229316@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816084109.GA229316@localhost.localdomain>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Fri, Aug 16, 2024 at 10:41:09AM +0200, Thomas Zimmermann wrote:
> Hi Dave, Sima,
> 
> this is the weekly PR for drm-misc-next. Mostly small cleanups and
> improvements. Rockchip received support for more modes and displays.
> 
> Best regards
> Thomas
> 
> drm-misc-next-2024-08-16:
> drm-misc-next for v6.12:
> 
> Core Changes:
> 
> ci:
> - Update dependencies
> 
> docs:
> - Cleanups
> 
> edid:
> - Improve debug logging
> - Clean up interface
> 
> fbdev emulation:
> - Remove old fbdev hooks
> - Update documentation
> 
> panic:
> - Cleanups
> 
> Driver Changes:
> 
> amdgpu:
> - Remove usage of old fbdev hooks
> - Use backlight constants
> 
> ast:
> - Fix timeout loop for DP link training
> 
> hisilicon:
> - hibmc: Cleanups
> 
> mipi-dsi:
> - Improve error handling
> - startek-kd070fhfid015: Use new error handling
> 
> nouveau:
> - Remove usage of old fbdev hooks
> 
> panel:
> - Use backlight constants
> 
> radeon:
> - Use backlight constants
> 
> rockchip:
> - Improve DP sink-capability reporting
> - Cleanups
> - dw_hdmi: Support 4k@60Hz; Cleanups
> - vop: Support RGB display on Rockchip RK3066; Support 4096px width
> 
> tilcdc:
> - Use backlight constants
> The following changes since commit 4e996697a443a214887ef81b008c344d183b5659:
> 
>   Merge tag 'drm-misc-next-2024-08-09' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next (2024-08-09 10:41:59 +0200)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2024-08-16

Pulled into drm-next, thanks!
-Sima
> 
> for you to fetch changes up to 8befe8fa5a4e4b30787b17e078d9d7b5cb92ea19:
> 
>   drm/tilcdc: Use backlight power constants (2024-08-16 09:28:01 +0200)
> 
> ----------------------------------------------------------------
> drm-misc-next for v6.12:
> 
> Core Changes:
> 
> ci:
> - Update dependencies
> 
> docs:
> - Cleanups
> 
> edid:
> - Improve debug logging
> - Clean up interface
> 
> fbdev emulation:
> - Remove old fbdev hooks
> - Update documentation
> 
> panic:
> - Cleanups
> 
> Driver Changes:
> 
> amdgpu:
> - Remove usage of old fbdev hooks
> - Use backlight constants
> 
> ast:
> - Fix timeout loop for DP link training
> 
> hisilicon:
> - hibmc: Cleanups
> 
> mipi-dsi:
> - Improve error handling
> - startek-kd070fhfid015: Use new error handling
> 
> nouveau:
> - Remove usage of old fbdev hooks
> 
> panel:
> - Use backlight constants
> 
> radeon:
> - Use backlight constants
> 
> rockchip:
> - Improve DP sink-capability reporting
> - Cleanups
> - dw_hdmi: Support 4k@60Hz; Cleanups
> - vop: Support RGB display on Rockchip RK3066; Support 4096px width
> 
> tilcdc:
> - Use backlight constants
> 
> ----------------------------------------------------------------
> Alex Bee (1):
>       drm/rockchip: vop: Allow 4096px width scaling
> 
> Andy Shevchenko (1):
>       drm: fixed: Don't use "proxy" headers
> 
> Christophe JAILLET (1):
>       drm/rockchip: Constify struct drm_encoder_helper_funcs
> 
> Cristian Ciocaltea (5):
>       drm/rockchip: Explicitly include bits header
>       drm/rockchip: dw_hdmi: Use modern drm_device based logging
>       drm/rockchip: dw_hdmi: Simplify clock handling
>       drm/rockchip: dw_hdmi: Use devm_regulator_get_enable()
>       drm/rockchip: dw_hdmi: Drop superfluous assignments of mpll_cfg, cur_ctr and phy_config
> 
> Dan Carpenter (1):
>       drm/ast: astdp: fix loop timeout check
> 
> Daniel Yang (1):
>       drm/connector: kerneldoc: Fix two missing newlines in drm_connector.c
> 
> Dragan Simic (1):
>       drm/rockchip: cdn-dp: Clean up a few logged messages
> 
> Jani Nikula (4):
>       drm/edid: reduce DisplayID log spamming
>       drm/rockchip: cdn-dp: get rid of drm_edid_raw()
>       drm/i915/gvt: stop using drm_edid_block_valid()
>       drm/edid: make drm_edid_block_valid() static
> 
> Jocelyn Falempe (5):
>       drm/panic: Remove space before "!" in panic message
>       drm/panic: Remove useless export symbols
>       drm/panic: Move drm_panic_register prototype to drm_crtc_internal.h
>       drm/panic: Move copyright notice to the top
>       drm/panic: Add panic description
> 
> Jonas Karlman (3):
>       drm/rockchip: dw_hdmi: Fix reading EDID when using a forced mode
>       drm/rockchip: dw_hdmi: Allow High TMDS Bit Rates
>       drm/rockchip: dw_hdmi: Add max_tmds_clock validation
> 
> Louis Chauvet (1):
>       drm/vkms: Formatting and typo fix
> 
> Mohammed Anees (1):
>       drm: Add missing documentation for struct drm_plane_size_hint
> 
> Tejas Vipin (2):
>       drm/mipi-dsi: add more multi functions for better error handling
>       drm/panel: startek-kd070fhfid015: transition to mipi_dsi wrapped functions
> 
> Thomas Zimmermann (18):
>       Merge drm/drm-next into drm-misc-next
>       drm: Do delayed switcheroo in drm_lastclose()
>       drm/amdgpu: Do not set struct drm_driver.lastclose
>       drm/nouveau: Do not set struct drm_driver.lastclose
>       drm/nouveau: Do not set struct drm_mode_config_funcs.output_poll_changed
>       drm/nouveau: Implement switcheroo reprobe with drm_client_dev_hotplug()
>       drm/fbdev-helper: Update documentation on obsolete callbacks
>       drm/fbdev-helper: Remove drm_fb_helper_output_poll_changed()
>       drm: Remove struct drm_driver.lastclose
>       drm: Remove struct drm_mode_config_funcs.output_poll_changed
>       drm/amdgpu: Use backlight power constants
>       drm/panel: panel-novatak-nt35510: Use backlight power constants
>       drm/panel: panel-orisetech-otm8009a: Use backlight power constants
>       drm/panel: panel-samsung-s6e63j0x03: Use backlight power constants
>       drm/panel: panel-samsung-s6e3ha2: Use backlight power constants
>       drm/panel: panel-sony-acx565akm: Use backlight power constants
>       drm/radeon: Use backlight power constants
>       drm/tilcdc: Use backlight power constants
> 
> Val Packett (2):
>       drm/rockchip: vop: clear DMA stop bit on RK3066
>       drm/rockchip: vop: enable VOP_FEATURE_INTERNAL_RGB on RK3066
> 
> Vignesh Raman (1):
>       drm/ci: uprev mesa
> 
> WangYuli (1):
>       drm/ci: Upgrade setuptools requirement to 70.0.0
> 
> Zhang Zekun (1):
>       drm/hisilicon: Remove unused delarations
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   2 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |  17 --
>  drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |   2 +-
>  drivers/gpu/drm/ast/ast_dp.c                       |  15 +-
>  drivers/gpu/drm/ci/container.yml                   |   8 +
>  drivers/gpu/drm/ci/gitlab-ci.yml                   |  22 +--
>  drivers/gpu/drm/ci/image-tags.yml                  |   8 +-
>  drivers/gpu/drm/ci/lava-submit.sh                  |   1 +
>  drivers/gpu/drm/ci/test.yml                        |   4 +-
>  drivers/gpu/drm/ci/xfails/requirements.txt         |   2 +-
>  drivers/gpu/drm/drm_connector.c                    |   4 +
>  drivers/gpu/drm/drm_crtc_internal.h                |   4 +
>  drivers/gpu/drm/drm_displayid.c                    |   3 -
>  drivers/gpu/drm/drm_edid.c                         |  22 +--
>  drivers/gpu/drm/drm_fb_helper.c                    |  37 +---
>  drivers/gpu/drm/drm_file.c                         |  32 ++--
>  drivers/gpu/drm/drm_internal.h                     |   1 -
>  drivers/gpu/drm/drm_mipi_dsi.c                     | 194 +++++++++++++++++++++
>  drivers/gpu/drm/drm_panic.c                        |  62 +++++--
>  drivers/gpu/drm/drm_probe_helper.c                 |  10 +-
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h    |   1 -
>  drivers/gpu/drm/i915/gvt/kvmgt.c                   |  18 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c            |   1 -
>  drivers/gpu/drm/nouveau/nouveau_display.c          |   1 -
>  drivers/gpu/drm/nouveau/nouveau_drm.c              |   1 -
>  drivers/gpu/drm/nouveau/nouveau_vga.c              |  10 +-
>  drivers/gpu/drm/nouveau/nouveau_vga.h              |   1 -
>  drivers/gpu/drm/panel/panel-novatek-nt35510.c      |   2 +-
>  drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   |   4 +-
>  drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      |  10 +-
>  drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c   |  10 +-
>  drivers/gpu/drm/panel/panel-sony-acx565akm.c       |   2 +-
>  .../gpu/drm/panel/panel-startek-kd070fhfid015.c    | 115 ++++--------
>  drivers/gpu/drm/radeon/atombios_encoders.c         |   2 +-
>  drivers/gpu/drm/radeon/radeon_legacy_encoders.c    |   2 +-
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |   2 +-
>  drivers/gpu/drm/rockchip/cdn-dp-core.c             |  32 ++--
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        | 107 +++++-------
>  drivers/gpu/drm/rockchip/inno_hdmi.c               |   2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |   3 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |   8 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.h        |   1 +
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |   2 +
>  drivers/gpu/drm/tilcdc/tilcdc_panel.c              |   2 +-
>  drivers/gpu/drm/vkms/vkms_drv.c                    |   6 +-
>  drivers/gpu/vga/vga_switcheroo.c                   |   3 +-
>  include/drm/drm_drv.h                              |  28 ---
>  include/drm/drm_edid.h                             |   2 -
>  include/drm/drm_fb_helper.h                        |   6 -
>  include/drm/drm_fixed.h                            |   3 +-
>  include/drm/drm_mipi_dsi.h                         |  10 ++
>  include/drm/drm_mode_config.h                      |  16 --
>  include/drm/drm_panic.h                            |  21 +--
>  include/uapi/drm/drm_mode.h                        |   2 +
>  55 files changed, 471 insertions(+), 416 deletions(-)
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
