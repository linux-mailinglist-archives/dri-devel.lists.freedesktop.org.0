Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 155DB91A44B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 12:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6835F10E1EB;
	Thu, 27 Jun 2024 10:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VLuSqluA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924BD10E1A4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 10:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719485385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=uwkUQ8X382nc6aCGZmWNHNOiA2cxj/3BMElHL/RIUT0=;
 b=VLuSqluAOBkz6pb/C8GxDxFUX52Va45xFyLNMy/cnyD934OM/XKfGNpYpoMyrbfYxL73/e
 mYze/D5yfB4mqoykfk7v9FyGMJeSEysGrEktRJLTFE96h7g9/hsFXDjls92SfDbhFjfSaK
 o5KZIDrWh34CmDmJZI47ONJV4LPvLP8=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-STUncwJYO-u4C8EuMPJvrw-1; Thu, 27 Jun 2024 06:49:43 -0400
X-MC-Unique: STUncwJYO-u4C8EuMPJvrw-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2ee4573c9b5so14488581fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 03:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719485382; x=1720090182;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uwkUQ8X382nc6aCGZmWNHNOiA2cxj/3BMElHL/RIUT0=;
 b=GGNSs6Ujd58cVxNIWq+IEVUiC3kSGQumdCgaEqwmGr6LkKdOq1Qjm/ZBN2VtaPT6Hc
 ZqBd7thVfoOPbC6K7VWjgIKmGPLKXtSHST3czJWmoh747w37ppTjkE/5xxfsMa8M0LLR
 PPcHFafUsS+LJm0vsnw6qoDSWtJiM5Uob9A+IhRXxGzVmFgtpg6mq+FlTkAW9OayTOjH
 oQkTlijPHUN2vKV5XkaCWJ6FAVhBiOboaVE9uwYO/X1RgQySaDdIAMxVdJz98WmqURkf
 mjxJ1Q3oqWQBZTQ9WlVP26sjXxW530FMByzinrGdNrJFe6eetA/OhgGjGe3nhxvHxm8B
 O0ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH5W9jeSpBjjFgwX9/E2C3Ovkw2U3zRMgXJKKLYwmgGgLNqkCmKpUvZnJmZWNDbTuAhb1K6fb1V3vKR2/+vJM2JZ/9rAtRnFbPiaDsmA8H
X-Gm-Message-State: AOJu0YwV44vmJeVpNUh/Vz3VE/jWPN/uZpzfN2r/aEyEKtxgkN1mI1YB
 VlALWxvTqrJIDQmnTDw4enMEMEFYnCkdulM3RJioiQHtMBwHwVhwoNoBbo2esWRSei71BdOvBAO
 GtT4dzk1EEneyeJyqGIeFs69k3x1PhX9lVPAk3Ha98Ye/kcSefAv2gApmvmh1tsihiQ==
X-Received: by 2002:a2e:2241:0:b0:2ec:5ff1:226e with SMTP id
 38308e7fff4ca-2ec5ff12319mr86622081fa.13.1719485382060; 
 Thu, 27 Jun 2024 03:49:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIbpw9RXcp3ddkE+l37F000LWSd8gh5uPxTZAp1D70rFuZZ2tfO2FcL4T7uNAaVOV7+/DG7Q==
X-Received: by 2002:a2e:2241:0:b0:2ec:5ff1:226e with SMTP id
 38308e7fff4ca-2ec5ff12319mr86621921fa.13.1719485381470; 
 Thu, 27 Jun 2024 03:49:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c825199asm60684835e9.15.2024.06.27.03.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 03:49:41 -0700 (PDT)
Date: Thu, 27 Jun 2024 12:49:40 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-next
Message-ID: <20240627-congenial-pistachio-nyala-848cf4@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ihjij6443verd3jj"
Content-Disposition: inline
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


--ihjij6443verd3jj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here's this week drm-misc-next PR.

Maxime

drm-misc-next-2024-06-27:
drm-misc-next for $kernel-version:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - panic: Monochrome logo support, Various fixes
  - ttm: Improve the number of page faults on some platforms, Fix test
    build breakage with PREEMPT_RT, more test coverage and various test
    improvements

Driver Changes:
  - Add missing MODULE_DESCRIPTION where needed
  - ipu-v3: Various fixes
  - vc4: Monochrome TV support
  - bridge:
    - analogix_dp: Various improvements and reworks, handle AUX
      transfers timeout
    - tc358767: Fix DRM_BRIDGE_ATTACH_NO_CONNECTOR, Fix clock
      calculations
  - panels:
    - More transitions to mipi_dsi wrapped functions
    - New panels: Lincoln Technologies LCD197, Ortustech COM35H3P70ULC,
The following changes since commit b9578c49456340ca4d3c7ddbaca054ffc2b51bc1:

  dma-buf/heaps: Correct the types of fd_flags and heap_flags (2024-06-19 20:05:34 +0530)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2024-06-27

for you to fetch changes up to 61bfcd190820d1dce846e58a4c9ddca8db4751ed:

  drm/bridge: analogix_dp: handle AUX transfer timeouts (2024-06-27 11:52:19 +0200)

----------------------------------------------------------------
drm-misc-next for $kernel-version:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - panic: Monochrome logo support, Various fixes
  - ttm: Improve the number of page faults on some platforms, Fix test
    build breakage with PREEMPT_RT, more test coverage and various test
    improvements

Driver Changes:
  - Add missing MODULE_DESCRIPTION where needed
  - ipu-v3: Various fixes
  - vc4: Monochrome TV support
  - bridge:
    - analogix_dp: Various improvements and reworks, handle AUX
      transfers timeout
    - tc358767: Fix DRM_BRIDGE_ATTACH_NO_CONNECTOR, Fix clock
      calculations
  - panels:
    - More transitions to mipi_dsi wrapped functions
    - New panels: Lincoln Technologies LCD197, Ortustech COM35H3P70ULC,

----------------------------------------------------------------
Aradhya Bhatia (1):
      drm/bridge: tc358767: Add format negotiation hooks for DPI/DSI to (e)DP

Chen Ni (1):
      drm/qxl: Add check for drm_cvt_mode

Chen-Yu Tsai (1):
      drm/mediatek: select DRM_GEM_DMA_HELPER if DRM_FBDEV_EMULATION=y

Dave Stevenson (4):
      drm/vc4: Add monochrome mode to the VEC.
      drm/vc4: vec: Add the margin properties to the connector
      MAINTAINERS: drm: vc4: Add Raspberry Pi as maintainers
      MAINTAINERS: drm: vc4: Drop Emma's tree

Dmitry Baryshkov (1):
      drm/connector: hdmi: shorten too long function name

Geert Uytterhoeven (8):
      drm/panic: Fix uninitialized drm_scanout_buffer.set_pixel() crash
      drm/panic: Fix off-by-one logo size checks
      lib/fonts: Fix visiblity of SUN12x22 and TER16x32 if DRM_PANIC
      drm/panic: Spelling s/formater/formatter/
      drm/panic: Rename logo to logo_ascii
      drm/panic: Add support for drawing a monochrome graphical logo
      drm/panic: Do not select DRM_KMS_HELPER
      drm/panic: Restrict graphical logo handling to built-in

Jeff Johnson (2):
      drm/tests: add drm_hdmi_state_helper_test MODULE_DESCRIPTION()
      drm/ttm/tests: add missing MODULE_DESCRIPTION() macros

Jerome Brunet (4):
      dt-bindings: display: meson-dw-hdmi: add missing power-domain
      dt-bindings: panel-simple-dsi: add lincoln LCD197 panel bindings
      drm/mipi-dsi: add mipi_dsi_usleep_range helper
      drm/panel: add lincolntech lcd197 support

Karolina Stolarek (12):
      drm/ttm/tests: Fix a warning in ttm_bo_unreserve_bulk
      drm/ttm/tests: Delete unnecessary config option
      drm/ttm/tests: Set DMA mask in KUnit device
      drm/ttm/tests: Use an init function from the helpers lib
      drm/ttm/tests: Test simple BO creation and validation
      drm/ttm/tests: Add tests with mock resource managers
      drm/ttm/tests: Add test cases dependent on fence signaling
      drm/ttm/tests: Add eviction testing
      drm/ttm/tests: Add tests for ttm_tt_populate
      drm/ttm/tests: Add TODO file
      drm/ttm/tests: Correct modules' licenses
      drm/ttm/tests: Use u32 and u64 over uint*_t types

Lucas Stach (17):
      gpu: ipu-v3: pre: move state into struct
      gpu: ipu-v3: pre: add dynamic buffer layout reconfiguration
      gpu: ipu-v3: pre: don't use fixed timeout when waiting for safe window
      drm/bridge: analogix_dp: remove unused platform power_on_end callback
      drm/rockchip: analogix_dp: add runtime PM handling
      drm/bridge: analogix_dp: register AUX bus after enabling runtime PM
      drm/bridge: analogix_dp: handle clock via runtime PM
      drm/bridge: analogix_dp: remove unused analogix_dp_remove
      drm/bridge: analogix_dp: remove clk handling from analogix_dp_set_bridge
      drm/bridge: analogix_dp: move platform and PHY power handling into runtime PM
      drm/bridge: analogix_dp: move basic controller init into runtime PM
      drm/bridge: analogix_dp: remove PLL lock check from analogix_dp_config_video
      drm/bridge: analogix_dp: move macro reset after link bandwidth setting
      drm/bridge: analogix_dp: don't wait for PLL lock too early
      drm/bridge: analogix_dp: simplify and correct PLL lock checks
      drm/bridge: analogix_dp: only read AUX status when an error occured
      drm/bridge: analogix_dp: handle AUX transfer timeouts

Marek Vasut (8):
      dt-bindings: display: synopsys, dw-hdmi: Document ddc-i2c-bus in core
      dt-bindings: display: synopsys, dw-hdmi: Mark ddc-i2c-bus as deprecated
      dt-bindings: display: bridge: tc358767: Keep enum sorted
      drm/bridge: tc358767: Split tc_pxl_pll_en() into parameter calculation and enablement
      drm/bridge: tc358767: Use tc_pxl_pll_calc() to correct adjusted_mode clock
      drm/bridge: tc358767: Drop line_pixel_subtract
      drm/bridge: tc358767: Set LSCLK divider for SYSCLK to 1
      Revert "drm/bridge: tc358767: Set default CLRSIPO count"

Michael Walle (2):
      dt-bindings: display: panel: add Ilitek ili9806e panel controller
      drm/panel: add Ilitek ILI9806E panel driver

R Sundar (1):
      gpu: ipu-v3: pre: replace of_node_put() with __free

Sebastian Andrzej Siewior (1):
      drm/ttm/tests: Let ttm_bo_test consider different ww_mutex implementation.

Tejas Vipin (4):
      drm/panel: truly-nt35521: transition to mipi_dsi wrapped functions
      drm/panel: asus-z00t-tm5p5-n35596: transition to mipi_dsi wrapped functions
      drm/panel: raydium-rm692e5: transition to mipi_dsi wrapped functions
      drm/panel: sitronix-st7703: transition to mipi_dsi wrapped functions

Thomas Zimmermann (1):
      drm/ast: Inline drm_simple_encoder_init()

Zhu Lingshan (1):
      drm/ttm: increase ttm pre-fault value to PMD size

 .../bindings/display/amlogic,meson-dw-hdmi.yaml    |    5 +
 .../bindings/display/bridge/synopsys,dw-hdmi.yaml  |   13 +
 .../bindings/display/bridge/toshiba,tc358767.yaml  |    2 +-
 .../bindings/display/imx/fsl,imx6-hdmi.yaml        |    8 -
 .../bindings/display/panel/ilitek,ili9806e.yaml    |   63 +
 .../bindings/display/panel/panel-simple-dsi.yaml   |    2 +
 .../display/rockchip/rockchip,dw-hdmi.yaml         |    8 -
 MAINTAINERS                                        |    8 +-
 drivers/gpu/drm/Kconfig                            |    4 +-
 drivers/gpu/drm/ast/ast_mode.c                     |   45 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  197 ++--
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |    7 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  |   38 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h  |    9 +
 drivers/gpu/drm/bridge/tc358767.c                  |  112 +-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |    6 +-
 drivers/gpu/drm/drm_panic.c                        |   71 +-
 drivers/gpu/drm/exynos/exynos_dp.c                 |    5 +-
 drivers/gpu/drm/mediatek/Kconfig                   |    1 +
 drivers/gpu/drm/panel/Kconfig                      |   20 +
 drivers/gpu/drm/panel/Makefile                     |    2 +
 .../gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c   |  136 +--
 drivers/gpu/drm/panel/panel-ilitek-ili9806e.c      |  402 +++++++
 drivers/gpu/drm/panel/panel-lincolntech-lcd197.c   |  262 +++++
 drivers/gpu/drm/panel/panel-raydium-rm692e5.c      |  228 ++--
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      |  820 +++++++------
 .../gpu/drm/panel/panel-sony-tulip-truly-nt35521.c |  431 ++++---
 drivers/gpu/drm/qxl/qxl_display.c                  |    3 +
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |   26 +-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |    1 +
 drivers/gpu/drm/ttm/tests/.kunitconfig             |    1 -
 drivers/gpu/drm/ttm/tests/Makefile                 |    2 +
 drivers/gpu/drm/ttm/tests/TODO                     |   27 +
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c            |   63 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c   | 1225 ++++++++++++++++++++
 drivers/gpu/drm/ttm/tests/ttm_device_test.c        |    3 +-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c      |  178 ++-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h      |   17 +-
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c       |  234 ++++
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h       |   30 +
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c          |    9 +-
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c      |   21 +-
 drivers/gpu/drm/ttm/tests/ttm_tt_test.c            |  169 ++-
 drivers/gpu/drm/ttm/ttm_tt.c                       |    3 +
 drivers/gpu/drm/vc4/vc4_vec.c                      |   31 +-
 drivers/gpu/ipu-v3/ipu-pre.c                       |  131 ++-
 drivers/gpu/ipu-v3/ipu-prg.c                       |    2 +-
 drivers/gpu/ipu-v3/ipu-prv.h                       |    2 +-
 drivers/video/logo/Kconfig                         |    2 +
 include/drm/bridge/analogix_dp.h                   |    4 +-
 include/drm/display/drm_hdmi_state_helper.h        |    2 +-
 include/drm/drm_mipi_dsi.h                         |    7 +
 include/drm/ttm/ttm_bo.h                           |    4 +
 lib/fonts/Kconfig                                  |    6 +-
 54 files changed, 3864 insertions(+), 1244 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
 create mode 100644 drivers/gpu/drm/panel/panel-lincolntech-lcd197.c
 create mode 100644 drivers/gpu/drm/ttm/tests/TODO
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h

--ihjij6443verd3jj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZn1DxAAKCRDj7w1vZxhR
xap+AQDnyB744Iy4b9+wCSdiOzbIV3joZ/zwiSmTDyeVVtWNbgD+J6OMUuCY+V94
8G0Wwsg8tSfQ65W4XxRYeqCwBCtQcA0=
=56mu
-----END PGP SIGNATURE-----

--ihjij6443verd3jj--

