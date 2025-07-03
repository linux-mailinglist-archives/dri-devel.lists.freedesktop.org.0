Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D41AF6C8E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 10:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49D310E7E9;
	Thu,  3 Jul 2025 08:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bk0LpGN/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D469D10E7E7
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 08:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751530378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=mzAmqCrGzYULhQVmt+vI7C3IoCgpWDVmftXFyp55eVc=;
 b=bk0LpGN/Yee7JuQIiB1K6cAb7ot9nrb/5+GturBzua+0qLt351JRKE0DG9wuW1S6KTQf41
 1NGONsVQA1q6GDydZ8ZOhF16rQBR+dzC43bKv6am99kvvKAO0sP8wDpwNl15hVFUzmTODW
 XejZBVZwhuvwleCtz+n3DJzawRc0BnI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-LovFcKEFMgaaZn3l4fFzNQ-1; Thu, 03 Jul 2025 04:12:56 -0400
X-MC-Unique: LovFcKEFMgaaZn3l4fFzNQ-1
X-Mimecast-MFC-AGG-ID: LovFcKEFMgaaZn3l4fFzNQ_1751530375
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a4f7f1b932so3390419f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 01:12:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751530375; x=1752135175;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mzAmqCrGzYULhQVmt+vI7C3IoCgpWDVmftXFyp55eVc=;
 b=TF7BFxCGlrdeXmAqPdSLj9HFKfIswhuJeZ8G3qw2Jlt48wfF2/rEw8SR489Thd4/7Q
 7rwLRFAkNA6SUlhi68IcPNQYIjFN7qdWzAhTBeneWg6BJiUB4tV6jZ2ktEyPFMpZqdll
 03m+V0EXAerbVDUElcrvLBQv5LzZJcqVda3KioY4RgNJMDe3LymJbPIVJaPD0E8TOXFS
 9PsUq8/N2+h3oU9cvPmrmGgYbuJ/BY/a3sYzyTlW0g42EsnsWqn1UPiO2/tXoupTubgR
 Zz2Gtxo+w5DtC2hvOB4CSw2tTeOMhezVBr7b5xh7f+Zr1SaWWByIcq3ijWYBE9AU0amR
 6hfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB8oqFA12btywZ5D8KFsFZc1CdGi0uMKudcY+yzejXqPiFGoB/yS67DzL8c38FGZBnZXPQfS5eNQc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4RThbQpyAO/OKcOmxBcDHhA/VkyAYXzcloohvJ+e2HypNJUMu
 YT0Lfb2kQkdLaOZ2DJYHP4aRdLmbzqzFYiOLDcwYYTQP1WqrWc5ZxZHwMkTNGd1ycaA+RAos29z
 JUgfOkYN7Mvftk3yDDmGuPCpnIo9QnWP8wcOcFUoKH3lMkGJxvV+vSSHDGsw7h+nyAGaWyA==
X-Gm-Gg: ASbGnctC3pS1vRdJslSTkOW6O3XAgfusVi8EWUyejJc+XZaOnce+hMhKhHOKGuzI4ds
 1rXpOqA/eJIqvrZtLGV9DtBh/ptRJEesEanPAsHskL7w+L0mfbSdCYYzLC/4QicyDu3g8/6rA6d
 ISO3w0rfoX6nUuq4kjKq6eseM3ef+NM6AqCrV7izl5d1mdyMAowJ+c5Vfss0c8fkFBCpyK8wQM9
 1rNQQvOaP2SUFeEK21nE8rukHSdfJirQak0huRC2LNf7YbUCXe5M9JeJWuK3RO9p+y/Y+xuZg==
X-Received: by 2002:a5d:5e8b:0:b0:3a5:21c8:af31 with SMTP id
 ffacd0b85a97d-3b1fe5c067dmr4442965f8f.16.1751530374818; 
 Thu, 03 Jul 2025 01:12:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDcXfywmSwHnD3z1m8BOw6GCi85VOLyS0ttvCNc9dVnElOHZKb4TySP8/H6efhpYYSfVuudg==
X-Received: by 2002:a5d:5e8b:0:b0:3a5:21c8:af31 with SMTP id
 ffacd0b85a97d-3b1fe5c067dmr4442932f8f.16.1751530374266; 
 Thu, 03 Jul 2025 01:12:54 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a99bc81esm19247315e9.33.2025.07.03.01.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 01:12:53 -0700 (PDT)
Date: Thu, 3 Jul 2025 10:12:53 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Dave Airlie <airlied@gmail.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>
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
Message-ID: <20250703-chirpy-lilac-dalmatian-2c5838@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="plgjvafs56cq34fd"
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


--plgjvafs56cq34fd
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PULL] drm-misc-next
MIME-Version: 1.0

Hi,

Here's this week drm-misc-next PR

Maxime

drm-misc-next-2025-07-03:
drm-misc-next for 6.17:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:

- bridge: More reference counting
- dp: Implement backlight control helpers
- fourcc: Add half-float and 32b float formats, RGB161616, BGR161616
- mipi-dsi: Drop MIPI_DSI_MODE_VSYNC_FLUSH flag
- ttm: Improve eviction

Driver Changes:
- i915: Use backlight control helpers for eDP
- tidss: Add AM65x OLDI bridge support

- panels:
  - panel-edp: Add CMN N116BCJ-EAK support
  - raydium-rm67200: misc cleanups, optional reset
  - new panel: DJN HX83112B
The following changes since commit d6b93bfa5d1eba452e494d3a05d6bef65bc569b7:

  drm/nouveau/disp: Use dev->dev to get the device (2025-06-25 20:07:03 +02=
00)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-202=
5-07-03

for you to fetch changes up to b4cd18f485687a2061ee7a0ce6833851fc4438da:

  drm/dp: Add documentation for luminance_set (2025-07-02 16:26:07 +0530)

----------------------------------------------------------------
drm-misc-next for 6.17:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:

- bridge: More reference counting
- dp: Implement backlight control helpers
- fourcc: Add half-float and 32b float formats, RGB161616, BGR161616
- mipi-dsi: Drop MIPI_DSI_MODE_VSYNC_FLUSH flag
- ttm: Improve eviction

Driver Changes:
- i915: Use backlight control helpers for eDP
- tidss: Add AM65x OLDI bridge support

- panels:
  - panel-edp: Add CMN N116BCJ-EAK support
  - raydium-rm67200: misc cleanups, optional reset
  - new panel: DJN HX83112B

----------------------------------------------------------------
Andy Shevchenko (1):
      firmware: sysfb: Don't use "proxy" headers

Andy Yan (4):
      dt-bindings: display: panel: Make reset-gpio as optional for Raydium =
RM67200
      drivers/panel: raydium-rm67200: Make reset-gpio optional
      drm/panel: raydium-rm67200: Move initialization from enable() to prep=
are stage
      drm/panel: raydium-rm67200: Add missing drm_display_mode flags

Aradhya Bhatia (4):
      dt-bindings: display: ti,am65x-dss: Re-indent the example
      dt-bindings: display: ti: Add schema for AM625 OLDI Transmitter
      drm/tidss: Mark AM65x OLDI code separately
      drm/tidss: Add OLDI bridge support

Bartosz Golaszewski (1):
      drm/bridge: ti-sn65dsi86: remove unnecessary GPIO line direction check

Christian K=F6nig (1):
      drm/vmwgfx: drop printing the TTM refcount for debugging

Cristian Ciocaltea (1):
      dt-bindings: display: vop2: Add optional PLL clock property for rk3576

Jacopo Mondi (1):
      drm/fourcc: Add RGB161616 and BGR161616 formats

Javier Martinez Canillas (1):
      MAINTAINERS: Add missing sysfb files to firmware framebuffers entry

Langyan Ye (1):
      drm/panel-edp: Add CMN N116BCJ-EAK

Luca Ceresoli (3):
      drm/bridge: get/put the bridge reference in drm_bridge_add/remove()
      drm/bridge: get/put the bridge reference in drm_bridge_attach/detach()
      drm/bridge: add warning for bridges not using devm_drm_bridge_alloc()

Luca Weiss (3):
      dt-bindings: vendor-prefixes: document Shenzhen DJN Optronics Technol=
ogy
      dt-bindings: display: panel: Add Himax HX83112B
      drm/panel: Add driver for DJN HX83112B LCD panel

Philipp Stanner (1):
      drm/sched/tests: Make timedout_job callback a better role model

Philipp Zabel (6):
      drm/bridge: samsung-dsim: use while loop in samsung_dsim_transfer_sta=
rt
      drm/bridge: samsung-dsim: Use HZ_PER_MHZ macro from units.h
      drm/bridge: samsung-dsim: Always flush display FIFO on vsync pulse
      drm/panel: samsung-s6d7aa0: Drop MIPI_DSI_MODE_VSYNC_FLUSH flag
      drm/panel: samsung-s6e8aa0: Drop MIPI_DSI_MODE_VSYNC_FLUSH flag
      drm/mipi-dsi: Drop MIPI_DSI_MODE_VSYNC_FLUSH flag

Rob Clark (2):
      drm/fourcc: Add missing half-float formats
      drm/fourcc: Add 32b float formats

Steven Price (1):
      drm/panthor: Wait for _READY register when powering on

Suraj Kandpal (14):
      drm/dp: Introduce new member in drm_backlight_info
      drm/dp: Add argument in drm_edp_backlight_init
      drm/dp: Add argument for max luminance in drm_edp_backlight_init
      drm/dp: Move from u16 to u32 for max in drm_edp_backlight_info
      drm/dp: Change current_level argument type to u32
      drm/dp: Modify drm_edp_probe_state
      drm/dp: Change argument type for drm_edp_backlight_set_level
      drm/dp: Modify drm_edp_backlight_set_level
      drm/dp: Change argument type of drm_edp_backlight_enable
      drm/dp: Enable backlight control using luminance
      drm/i915/backlight: Use drm helper to initialize edp backlight
      drm/i915/backlight: Use drm helper to set edp backlight
      drm/i915/backlight: Use drm_edp_backlight_enable
      drm/dp: Add documentation for luminance_set

Thomas Hellstr=F6m (3):
      drm/ttm: Use a struct for the common part of struct ttm_lru_walk and =
struct ttm_bo_lru_cursor
      drm/ttm, drm/xe: Modify the struct ttm_bo_lru_walk_cursor initializat=
ion
      drm/ttm, drm_xe, Implement ttm_lru_walk_for_evict() using the guarded=
 LRU iteration

Thomas Zimmermann (1):
      drm/format-helper: Split off byte swapping from drm_fb_xrgb8888_to_rg=
b565()

 .../bindings/display/panel/himax,hx83112b.yaml     |  73 +++
 .../bindings/display/panel/raydium,rm67200.yaml    |   1 -
 .../bindings/display/rockchip/rockchip-vop2.yaml   |  56 +-
 .../bindings/display/ti/ti,am625-oldi.yaml         |  79 +++
 .../bindings/display/ti/ti,am65x-dss.yaml          | 199 ++++++-
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   3 +
 drivers/gpu/drm/bridge/samsung-dsim.c              |  79 ++-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   5 -
 drivers/gpu/drm/display/drm_dp_helper.c            |  92 +++-
 drivers/gpu/drm/drm_bridge.c                       |  24 +-
 drivers/gpu/drm/drm_format_helper.c                |  68 ++-
 drivers/gpu/drm/drm_format_internal.h              |   6 +
 drivers/gpu/drm/drm_fourcc.c                       |   8 +
 drivers/gpu/drm/drm_mipi_dbi.c                     |   8 +-
 drivers/gpu/drm/gud/gud_pipe.c                     |   9 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  | 142 ++---
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |   2 +-
 drivers/gpu/drm/nouveau/nouveau_backlight.c        |   7 +-
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-edp.c                  |   1 +
 drivers/gpu/drm/panel/panel-himax-hx83112b.c       | 430 +++++++++++++++
 drivers/gpu/drm/panel/panel-raydium-rm67200.c      |  39 +-
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c      |   2 +-
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c      |   2 +-
 drivers/gpu/drm/panthor/panthor_gpu.c              |   5 +-
 drivers/gpu/drm/scheduler/tests/mock_scheduler.c   |  26 +-
 drivers/gpu/drm/tests/drm_format_helper_test.c     |   8 +-
 drivers/gpu/drm/tidss/Makefile                     |   3 +-
 drivers/gpu/drm/tidss/tidss_dispc.c                |  92 ++--
 drivers/gpu/drm/tidss/tidss_dispc.h                |   7 +-
 drivers/gpu/drm/tidss/tidss_dispc_regs.h           |  29 +-
 drivers/gpu/drm/tidss/tidss_drv.c                  |   9 +
 drivers/gpu/drm/tidss/tidss_drv.h                  |   5 +
 drivers/gpu/drm/tidss/tidss_kms.c                  |   2 +-
 drivers/gpu/drm/tidss/tidss_oldi.c                 | 598 +++++++++++++++++=
++++
 drivers/gpu/drm/tidss/tidss_oldi.h                 |  43 ++
 drivers/gpu/drm/ttm/ttm_bo.c                       |  24 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  | 202 +++----
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                |   5 +-
 drivers/gpu/drm/xe/xe_shrinker.c                   |   8 +-
 include/drm/display/drm_dp_helper.h                |  11 +-
 include/drm/drm_format_helper.h                    |   6 +-
 include/drm/drm_mipi_dsi.h                         |   2 -
 include/drm/ttm/ttm_bo.h                           |  44 +-
 include/linux/sysfb.h                              |   6 +-
 include/uapi/drm/drm_fourcc.h                      |  20 +-
 48 files changed, 2030 insertions(+), 473 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,h=
x83112b.yaml
 create mode 100644 Documentation/devicetree/bindings/display/ti/ti,am625-o=
ldi.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-himax-hx83112b.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_oldi.c
 create mode 100644 drivers/gpu/drm/tidss/tidss_oldi.h

--plgjvafs56cq34fd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaGY7hAAKCRAnX84Zoj2+
dkbZAYDGUWhUpzA9gJIn/pzK351TmwaNVjwOonWBtOAZyQl0+L1RRVV8xLCKVWDi
tP59DZ0BgIsEp/RxP15QJaBDJ9A8pPEfrzUR3NOYjLxi7M7x7drm/Q1/Rp0r/Czj
fjqFNwZ2XA==
=5YlA
-----END PGP SIGNATURE-----

--plgjvafs56cq34fd--

