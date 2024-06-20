Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 903BB90FE2B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 10:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95A010E7F7;
	Thu, 20 Jun 2024 08:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FEj5dFVG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C7B10E2CA
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718870499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=5bC7IwUmdy2ARvrdBR1TcJi0uZi1Yqbnf6ki42NJPKc=;
 b=FEj5dFVGMlI3z9ObZJPoPl3rIVIeX9re0J8is8OqtkIDpn/B+w5wtBWb91yM6g2G2dnDeM
 dMqEC+mtgive/RBywROfszlBjRrSpxWAPdaYD1RZKs4fa8hSFUJGOnN1B68pqbBlJOanAx
 ZHtOal+fxPCO5feK/xs+ypQCwFLrchM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-iql2v82kO-2DCE0_6aIOfQ-1; Thu, 20 Jun 2024 04:01:36 -0400
X-MC-Unique: iql2v82kO-2DCE0_6aIOfQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4212e2a3a1bso4384245e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 01:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718870494; x=1719475294;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5bC7IwUmdy2ARvrdBR1TcJi0uZi1Yqbnf6ki42NJPKc=;
 b=cQ6B5E6exmWDq+im20ci6oiVfamEMWNGTJyxFyVaBTmXMi7Hs+BaSNoMdpXsdK1z68
 jy3IXE6B6cTD/EIeEdB41pz6bayJuUREIsiJjz2mAyMMdIOLcOAKXZK1DyC/oSq2QB2N
 lqVsjPNo3+1cFDawyIIQPCQTJHr7AY7Q75MaZHk9z0gq2QgUzAhFOp5fHGQuvOWzAhg2
 MZT9fdWKC/Vp3xffkVBreyp/tXr8Dl9teC4QvYy6gfy2gdPRILx80OYvKIGPDFeQIBax
 7RieDz0UEGyxzjZPXwZqgEPPOlzy+2ThOxKmCwnL5tMMnx4fKBwD6yeuRzMXANMdve6D
 LWiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn6HYym/UUDEnXEvUUZZpQRKCrC2wpAhjljTvQ/VDAFk2fRUVqmQCZXpFmhq9kbWB4oFjWmg6RaZq6NlZC89N4a4QJjmvXNe7+ixCqvxWJ
X-Gm-Message-State: AOJu0Yyyj6w3Z0koYxP0T5OfBmUnuuAyo7Qs24Xmv/1SGlvlTkP8cGSa
 GFKSoHoywU35k+g0dmvF6oCTi62rRhRWffZK/Q8nQctilyzUEIPcpgOW6lAl8gDqtFmRxhTG6s1
 mUspyrqiZ7+sNbqwElu2+IlPjkDdipN/t6tillPpvduueBHzFyVWGpbJaa48xj8eREg==
X-Received: by 2002:a05:600c:1c12:b0:421:7eff:efb8 with SMTP id
 5b1f17b1804b1-42475296a9bmr31753285e9.31.1718870493804; 
 Thu, 20 Jun 2024 01:01:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNDvKEl5G1yq4b7bwWzI1hq+G1RZIXWsmrEXbHS32+QZGg/TGmcNHp+igGgBksiVHfmGC96g==
X-Received: by 2002:a05:600c:1c12:b0:421:7eff:efb8 with SMTP id
 5b1f17b1804b1-42475296a9bmr31752545e9.31.1718870492434; 
 Thu, 20 Jun 2024 01:01:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d0ca0basm15792875e9.28.2024.06.20.01.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 01:01:32 -0700 (PDT)
Date: Thu, 20 Jun 2024 10:01:31 +0200
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
Message-ID: <20240620-heretic-honored-macaque-b40f8a@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="g2s5vzajmkoakej2"
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


--g2s5vzajmkoakej2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Here's this week drm-misc-next PR

Maxime

drm-misc-next-2024-06-20:
drm-misc-next for 6.11:

UAPI Changes:
  - New monochrome TV mode variant

Cross-subsystem Changes:
  - dma heaps: Change slightly the allocation hook prototype

Core Changes:

Driver Changes:
 - ivpu: various improvements over firmware handling, clocks, power
   management, scheduling and logging.
 - mgag200: Add BMC output, enable polling
 - panfrost: Enable MT8188 support
 - tidss: drm_panic support
 - zynqmp_dp: IRQ cleanups, debugfs DP compliance testing API
 - bridge:
   - sii902x: state validation improvements
 - panel:
   - edp: Drop legacy panel compatibles
   - simple-bridge: Switch to devm_drm_bridge_add
The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-202=
4-06-20

for you to fetch changes up to b9578c49456340ca4d3c7ddbaca054ffc2b51bc1:

  dma-buf/heaps: Correct the types of fd_flags and heap_flags (2024-06-19 2=
0:05:34 +0530)

----------------------------------------------------------------
drm-misc-next for 6.11:

UAPI Changes:
  - New monochrome TV mode variant

Cross-subsystem Changes:
  - dma heaps: Change slightly the allocation hook prototype

Core Changes:

Driver Changes:
 - ivpu: various improvements over firmware handling, clocks, power
   management, scheduling and logging.
 - mgag200: Add BMC output, enable polling
 - panfrost: Enable MT8188 support
 - tidss: drm_panic support
 - zynqmp_dp: IRQ cleanups, debugfs DP compliance testing API
 - bridge:
   - sii902x: state validation improvements
 - panel:
   - edp: Drop legacy panel compatibles
   - simple-bridge: Switch to devm_drm_bridge_add

----------------------------------------------------------------
Abhinav Kumar (1):
      drm: ci: fix the xfails for apq8016

Adam Ford (2):
      drm/bridge: samsung-dsim: Set P divider based on min/max of fin pll
      drm/bridge: samsung-dsim: Fix porch calcalcuation rounding

Alex Bee (2):
      dt-bindings: display: rockchip,dw-mipi-dsi: Document RK3128 DSI
      drm/rockchip: dsi: Add support for RK3128

Amjad Ouled-Ameur (1):
      drm/arm/komeda: update DMA mask to 40 bits

Anatoliy Klymenko (3):
      drm: xlnx: zynqmp_dpsub: Fix few function comments
      drm: xlnx: zynqmp_dpsub: Fix compilation error
      drm: xlnx: zynqmp_dpsub: Enable plane in atomic update

Andrzej Kacprowski (1):
      accel/ivpu: Increase autosuspend delay to 100ms on 40xx

Andy Yan (1):
      drm/rockchip: vop2: Fix the port mux of VP2

AngeloGioacchino Del Regno (2):
      dt-bindings: gpu: mali-bifrost: Add compatible for MT8188 SoC
      drm/panfrost: Add support for Mali on the MT8188 SoC

Aradhya Bhatia (6):
      dt-bindings: vendor-prefixes: Add microtips
      dt-bindings: vendor-prefixes: Add lincolntech
      dt-bindings: display: simple: Add Microtips & Lincolntech Dual-LVDS P=
anels
      drm/panel: simple: Add Lincoln Tech Sol LCD185-101CT panel
      drm/panel: simple: Add Microtips Technology 13-101HIEBCAF0-C panel
      drm/panel: simple: Add Microtips Technology MF-103HIEB0GA0 panel

Barry Song (2):
      dma-buf: align fd_flags and heap_flags with dma_heap_allocation_data
      dma-buf/heaps: Correct the types of fd_flags and heap_flags

Chaitanya Kumar Borah (1):
      nouveau: Add missing break statement

Christian K=F6nig (1):
      dma-buf: add a warning when drv try to reserve 0 fence slots

Christophe JAILLET (3):
      dma-buf/fence-array: Add flex array to struct dma_fence_array
      drm: zynqmp_dpsub: Fix an error handling path in zynqmp_dpsub_probe()
      drm/nouveau: Constify struct nouveau_job_ops

Colin Ian King (1):
      drm/gma500: Fix spelling mistake "patter" -> "pattern"

Cong Yang (6):
      dt-bindings: display: panel: Add himax hx83102 panel bindings
      drm/panel: himax-hx83102: Break out as separate driver
      dt-bindings: display: panel: Add compatible for BOE nv110wum-l60
      drm/panel: himax-hx83102: Support for BOE nv110wum-l60 MIPI-DSI panel
      dt-bindings: display: panel: Add compatible for IVO t109nw41
      drm/panel: himax-hx83102: Support for IVO t109nw41 MIPI-DSI panel

Dave Airlie (1):
      nouveau: rip out busy fence waits

Dmitry Baryshkov (15):
      drm/panel: lg-sw43408: add missing error handling
      drm/mipi-dsi: wrap more functions for streamline handling
      drm/panel: boe-tv101wum-nl6: use wrapped MIPI DCS functions
      drm/panel: ilitek-ili9882t: use wrapped MIPI DCS functions
      drm/panel: innolux-p079zca: use mipi_dsi_dcs_nop_multi()
      drm/panel: novatek-nt36672e: use wrapped MIPI DCS functions
      drm/panel: lg-sw43408: use new streamlined MIPI DSI API
      drm/ci: validate drm/msm XML register files against schema
      drm/connector: hdmi: allow disabling Audio Infoframe
      drm/bridge-connector: switch to using drmm allocations
      drm/bridge-connector: implement glue code for HDMI connector
      drm/panel-edp: add fat warning against adding new panel compatibles
      drm/panel-edp: drop several legacy panels
      dt-bindings: display: panel-edp-legacy: drop several eDP panels
      drm/ci: mark kms_addfb_basic@addfb25-bad-modifier as passing on msm

Douglas Anderson (67):
      drm/panel-edp: Add ID for KD KD116N09-30NH-A016
      drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_dcs_write_seq()
      drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_generic_write_=
seq()
      drm/mipi-dsi: mipi_dsi_*_write functions don't need to ratelimit prin=
ts
      drm/mipi-dsi: Reduce driver bloat of mipi_dsi_*_write_seq()
      drm/mipi-dsi: Introduce mipi_dsi_*_write_seq_multi()
      drm/panel: novatek-nt36672e: Switch to mipi_dsi_dcs_write_seq_multi()
      drm/panel: boe-tv101wum-nl6: Don't use a table for initting panels
      drm/panel: ili9882t: Don't use a table for initting panels
      drm/panel: innolux-p079zca: Don't use a table for initting panels
      drm/panel: himax-hx8394: Handle errors from mipi_dsi_dcs_set_display_=
on() better
      drm/panel: boe-tv101wum-nl6: If prepare fails, disable GPIO before re=
gulators
      drm/panel: boe-tv101wum-nl6: Check for errors on the NOP in prepare()
      drm/panel: ilitek-ili9882t: If prepare fails, disable GPIO before reg=
ulators
      drm/panel: ilitek-ili9882t: Check for errors on the NOP in prepare()
      drm/panel: himax-hx83102: If prepare fails, disable GPIO before regul=
ators
      drm/panel: himax-hx83102: Check for errors on the NOP in prepare()
      drm/panel: himax-hx83102: use wrapped MIPI DCS functions
      dt-bindings: display: Reorganize legacy eDP panel bindings
      drm/panel: raydium-rm692e5: Stop tracking prepared
      drm/panel: boe-tv101wum-nl6: Stop tracking prepared
      drm/panel: boe-tv101wum-nl6: Don't call unprepare+disable at shutdown=
/remove
      drm/panel: edp: Stop tracking prepared/enabled
      drm/panel: edp: Add a comment about unprepare+disable at shutdown/rem=
ove
      drm/panel: innolux-p079zca: Stop tracking prepared/enabled
      drm/panel: innolux-p079zca: Don't call unprepare+disable at shutdown/=
remove
      drm/panel: kingdisplay-kd097d04: Stop tracking prepared/enabled
      drm/panel: kingdisplay-kd097d04: Don't call unprepare+disable at shut=
down/remove
      drm/panel: ltk050h3146w: Stop tracking prepared
      drm/panel: ltk050h3146w: Don't call unprepare+disable at shutdown/rem=
ove
      drm/panel: ltk500hd1829: Stop tracking prepared
      drm/panel: ltk500hd1829: Don't call unprepare+disable at shutdown/rem=
ove
      drm/panel: novatek-nt36672a: Stop tracking prepared
      drm/panel: novatek-nt36672a: Don't call unprepare+disable at shutdown=
/remove
      drm/panel: samsung-atna33xc20: Stop tracking prepared/enabled
      drm/panel: samsung-atna33xc20: Don't call unprepare+disable at shutdo=
wn/remove
      drm/panel: simple: Stop tracking prepared/enabled
      drm/panel: simple: Add a comment about unprepare+disable at shutdown/=
remove
      drm/panel: xinpeng-xpp055c272: Stop tracking prepared
      drm/panel: xinpeng-xpp055c272: Don't call unprepare+disable at shutdo=
wn/remove
      drm/panel: sitronix-st7703: Stop tracking prepared
      drm/panel: sitronix-st7703: Don't call disable at shutdown/remove
      drm/panel: sony-acx565akm: Don't double-check enabled state in disable
      drm/panel: sony-acx565akm: Don't call disable at remove
      drm/panel: boe-himax8279d: Stop tracking prepared/enabled
      drm/panel: boe-himax8279d: Don't call unprepare+disable at shutdown/r=
emove
      drm/panel: khadas-ts050: Stop tracking prepared/enabled
      drm/panel: khadas-ts050: Don't call unprepare+disable at shutdown/rem=
ove
      drm/panel: olimex-lcd-olinuxino: Stop tracking prepared/enabled
      drm/panel: olimex-lcd-olinuxino: Don't call unprepare+disable at remo=
ve
      drm/panel: osd-osd101t2587-53ts: Stop tracking prepared/enabled
      drm/panel: osd-osd101t2587-53ts: Don't call unprepare+disable at shut=
down/remove
      drm/panel: tdo-tl070wsh30: Stop tracking prepared
      drm/panel: tdo-tl070wsh30: Don't call unprepare+disable at shutdown/r=
emove
      drm/panel: jdi-lt070me05000: Stop tracking prepared/enabled
      drm/panel: jdi-lt070me05000: Don't call disable at shutdown/remove
      drm/panel: panasonic-vvx10f034n00: Stop tracking prepared/enabled
      drm/panel: panasonic-vvx10f034n00: Don't call disable at shutdown/rem=
ove
      drm/panel: seiko-43wvf1g: Stop tracking prepared/enabled
      drm/panel: seiko-43wvf1g: Don't call disable at shutdown/remove
      drm/panel: sharp-lq101r1sx01: Stop tracking prepared/enabled
      drm/panel: sharp-lq101r1sx01: Don't call disable at shutdown/remove
      drm/panel: sharp-ls043t1le01: Stop tracking prepared
      drm/panel: sharp-ls043t1le01: Don't call disable at shutdown/remove
      drm/panel: raydium-rm67191: Stop tracking enabled
      drm/panel: raydium-rm67191: Don't call unprepare+disable at shutdown
      drm/panel: Update TODO list item for cleaning up prepared/enabled tra=
cking

Durai Manickam KR (1):
      drm: atmel-hlcdc: Define XLCDC specific registers

Faiz Abbas (2):
      drm/arm/komeda: Fix komeda probe failing if there are no links in the=
 secondary pipeline
      drm/arm/komeda: Move pipeline prints to after the entire pipeline has=
 been enabled

Haikun Zhou (1):
      drm/panel-edp: Add CMN N116BCJ-EAK

Haoran Liu (1):
      drm/meson: plane: Add error handling

Jacek Lawrynowicz (9):
      accel/ivpu: Update VPU FW API headers
      accel/ivpu: Increase reset counter when warm boot fails
      accel/ivpu: Replace wake_thread with kfifo
      accel/ivpu: Remove suspend_reschedule_counter
      accel/ivpu: Implement DCT handling
      accel/ivpu: Make selected params read-only
      accel/ivpu: Disable MMU before checking for idle
      accel/ivpu: Remove duplicated debug messages
      accel/ivpu: Remove unused ivpu_rpm_get_if_active()

Jani Nikula (22):
      MAINTAINERS: fix LG sw43408 panel driver drm-misc git URL
      drm: deprecate driver date
      drm: use "0" instead of "" for deprecated driver date
      drm/bridge/analogix/anx6345: switch to struct drm_edid
      drm/bridge/analogix/anx78xx: switch to struct drm_edid
      drm/bridge: anx7625: use struct drm_edid more
      drm/i2c: tda998x: switch to struct drm_edid
      drm/bochs: switch to struct drm_edid
      drm/virtio: switch to struct drm_edid
      drm/edid: remove drm_do_get_edid()
      drm/nouveau: convert to using is_hdmi and has_audio from display info
      drm/radeon: convert to using is_hdmi and has_audio from display info
      drm/radeon: remove radeon_connector_edid() and stop using edid_blob_p=
tr
      drm/amdgpu: remove amdgpu_connector_edid() and stop using edid_blob_p=
tr
      drm/edid: add a helper for EDID sysfs property show
      drm/connector: update edid_blob_ptr documentation
      drm/bridge: analogix_dp: convert to struct drm_edid
      drm/hisilicon/hibmc: convert to struct drm_edid
      drm/loongson/7a1000: convert to struct drm_edid
      drm/loongson/7a2000: convert to struct drm_edid
      drm/imx/tve: convert to struct drm_edid
      drm/imx/ldb: convert to struct drm_edid

Javier Martinez Canillas (1):
      drm/tidss: Add drm_panic support

Jayesh Choudhary (3):
      drm/bridge: sii902x: Fix mode_valid hook
      drm/bridge: sii902x: Support atomic bridge APIs
      drm/bridge: sii902x: Add pixel clock check in atomic_check

Jeff Johnson (5):
      drm/tests: add missing MODULE_DESCRIPTION() macros
      drm/panel: add missing MODULE_DESCRIPTION() macros
      drm/tiny: add missing MODULE_DESCRIPTION() macros
      drm/bridge: add missing MODULE_DESCRIPTION() macros
      drm: add missing MODULE_DESCRIPTION() macros

Jiapeng Chong (1):
      drm/vmwgfx: Remove duplicate vmwgfx_vkms.h header

Jocelyn Falempe (8):
      drm/fb_dma: Add checks in drm_fb_dma_get_scanout_buffer()
      lib/fonts: Allow to select fonts for drm_panic
      Revert "drm/mgag200: Add a workaround for low-latency"
      drm/mgag200: Add an option to disable Write-Combine
      drm/panic: only draw the foreground color in drm_panic_blit()
      drm/panic: Add a set_pixel() callback to drm_scanout_buffer
      drm/panic: Add a kmsg panic screen
      drm/panic: depends on !VT_CONSOLE

Krzysztof Kozlowski (4):
      drm/tiny: ili9225: drop driver owner assignment
      drm/tiny: mi0283qt: drop driver owner assignment
      drm/tiny: panel-mipi-dbi: drop driver owner assignment
      drm/tiny: st7586: drop driver owner assignment

Kuro Chung (2):
      drm/bridge: it6505: fix hibernate to resume no display issue
      drm/bridge: it6505: update usleep_range for RC circuit charge time

Luca Ceresoli (1):
      Revert "drm/bridge: ti-sn65dsi83: Fix enable error path"

Lucas Stach (2):
      drm/bridge: analogix_dp: properly handle zero sized AUX transactions
      drm/bridge: analogix_dp: don't adjust further when clock recovery suc=
ceeded

Maciej Falkowski (2):
      accel/ivpu: Abort jobs of faulty context
      accel/ivpu: Add test mode flag for disabling timeouts

Manikandan Muralidharan (7):
      drm: atmel-hlcdc: add driver ops to differentiate HLCDC and XLCDC IP
      drm: atmel_hlcdc: replace regmap_read with regmap_read_poll_timeout
      drm: atmel_hlcdc: Add support for XLCDC using IP specific driver ops
      drm: atmel-hlcdc: add DPI mode support for XLCDC
      drm: atmel-hlcdc: add vertical and horizontal scaling support for XLC=
DC
      drm: atmel-hlcdc: add support for DSI output formats
      drm: atmel-hlcdc: add LCD controller layer definition for sam9x75

Marc Gonzalez (1):
      drm: bridge: simple-bridge: use devm_drm_bridge_add in probe

Marek Vasut (3):
      drm/bridge: tc358767: Enable FRMSYNC timing generator
      drm/bridge: tc358767: Fix comment in tc_edp_mode_valid
      drm/bridge: tc358767: Check if fully initialized before signalling HP=
D event via IRQ

MarileneGarcia (1):
      drm/dp: Fix documentation warning

Maxime Ripard (33):
      Merge drm/drm-next into drm-misc-next
      drm/connector: Introduce an HDMI connector initialization function
      drm/tests: connector: Add tests for drmm_connector_hdmi_init
      drm/connector: hdmi: Create an HDMI sub-state
      drm/connector: hdmi: Add output BPC to the connector state
      drm/mode_object: Export drm_mode_obj_find_prop_id for tests
      drm/tests: Add output bpc tests
      drm/connector: hdmi: Add support for output format
      drm/tests: Add output formats tests
      drm/display: hdmi: Add HDMI compute clock helper
      drm/tests: Add HDMI TDMS character rate tests
      drm/connector: hdmi: Calculate TMDS character rate
      drm/tests: Add TDMS character rate connector state tests
      drm/connector: hdmi: Add custom hook to filter TMDS character rate
      drm/tests: Add HDMI connector rate filter hook tests
      drm/connector: hdmi: Compute bpc and format automatically
      drm/tests: Add HDMI connector bpc and format tests
      drm/doc: Remove unused Broadcast RGB Property
      drm/connector: hdmi: Add Broadcast RGB property
      drm/tests: Add tests for Broadcast RGB property
      drm/connector: hdmi: Add RGB Quantization Range to the connector state
      drm/tests: Add RGB Quantization tests
      drm/connector: hdmi: Add Infoframes generation
      drm/tests: Add infoframes test
      drm/connector: hdmi: Create Infoframe DebugFS entries
      drm/vc4: hdmi: Switch to HDMI connector
      drm/vc4: tests: Remove vc4_dummy_plane structure
      drm/vc4: tests: Convert to plane creation helper
      drm/rockchip: inno_hdmi: Switch to HDMI connector
      drm/sun4i: hdmi: Switch to HDMI connector
      drm/sun4i: Fix compilation error
      drm/display: Fix HDMI state helper dependency
      drm/connector: hdmi: Fix kerneldoc warnings

Ma=EDra Canal (6):
      drm/v3d: Add Performance Counters descriptions for V3D 4.2 and 7.1
      drm/v3d: Different V3D versions can have different number of perfcnt
      drm/v3d: Create a new V3D parameter for the maximum number of perfcnt
      drm/v3d: Create new IOCTL to expose performance counters information
      drm/v3d: Use V3D_MAX_COUNTERS instead of V3D_PERFCNT_NUM
      drm/v3d: Deprecate the use of the Performance Counters enum

Michal Wajdeczko (5):
      drm/print: Add missing [drm] prefix to drm based WARN
      drm/print: Kill ___drm_dbg()
      drm/print: Add generic drm dev printk function
      drm/print: Improve drm_dbg_printer
      drm/i915: Don't use __func__ as prefix for drm_dbg_printer

Nick Hollinghurst (1):
      drm: Add DRM_MODE_TV_MODE_MONOCHROME

Noralf Tr=F8nnes (5):
      dt-bindings: display: panel: mipi-dbi-spi: Add a pixel format property
      drm/mipi-dbi: Remove mipi_dbi_machine_little_endian()
      drm/mipi-dbi: Make bits per word configurable for pixel transfers
      drm/mipi-dbi: Add support for DRM_FORMAT_RGB888
      drm/tiny: panel-mipi-dbi: Support the pixel format property

Ondrej Jirman (3):
      drm/sun4i: Unify sun8i_*_layer structs
      drm/sun4i: Add more parameters to sunxi_engine commit callback
      drm/sun4i: Fix layer zpos change/atomic modesetting

Pin-yen Lin (2):
      drm/panel-edp: Add support for several panels
      drm/panel-edp: Add more panels with conservative timings

Primoz Fiser (3):
      dt-bindings: vendor-prefixes: Add PrimeView
      dt-bindings: display: simple: Add PrimeView PM070WL4 panel
      drm/panel: simple: Add PrimeView PM070WL4 support

Rodrigo Vivi (1):
      drm/mm: Remove unused drm_mm_replace_node

Ryan Walklin (2):
      dt-bindings: display: panel: Add WL-355608-A8 panel
      drm: panel: nv3052c: Add WL-355608-A8 panel

Sam Ravnborg (3):
      MAINTAINERS: drm: Drop sam as panel reviewer
      drm/mediatek: Drop chain_mode_fixup call in mode_valid()
      drm/bridge: Drop drm_bridge_chain_mode_fixup

Sean Anderson (8):
      drm: xlnx: Store base pointers in zynqmp_disp directly
      drm: xlnx: Fix kerneldoc
      drm: zynqmp_dp: Downgrade log level for aux retries message
      drm: zynqmp_dp: Adjust training values per-lane
      drm: zynqmp_dpsub: Always register bridge
      drm: zynqmp_kms: Fix AUX bus not getting unregistered
      drm: zynqmp_dp: Rearrange zynqmp_dp for better padding
      drm: zynqmp_dp: Don't delay work

Sui Jingfeng (15):
      drm/debugfs: Drop conditionals around of_node pointers
      drm/panel: ili9341: Remove a superfluous else after return
      drm/drm-bridge: Drop conditionals around of_node pointers
      drm/bridge: simple-bridge: Remove a redundant check on existence of b=
ridge->encoder
      drm/bridge: tfp410: Remove a redundant check on existence of bridge->=
encoder
      drm/bridge: nxp-ptn3460: Remove a redundant check on existence of bri=
dge->encoder
      drm/bridge: panel: Remove a redundant check on existence of bridge->e=
ncoder
      drm/bridge: it6505: Remove a redundant check on existence of bridge->=
encoder
      drm/bridge: adv7511: Remove a redundant check on existence of bridge-=
>encoder
      drm/bridge: cdns-mhdp8546: Remove a redundant check on existence of b=
ridge->encoder
      drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: Remove a redundant check=
 on existence of bridge->encoder
      drm/bridge: synopsys: dw-mipi-dsi: Remove a redundant check on existe=
nce of bridge->encoder
      drm/bridge: lt9611uxc: Remove a redundant check on existence of bridg=
e->encoder
      drm/bridge: imx: Remove redundant checks on existence of bridge->enco=
der
      drm/bridge: analogix: Remove redundant checks on existence of bridge-=
>encoder

Tejas Vipin (2):
      drm/mipi-dsi: fix handling of ctx in mipi_dsi_msleep
      drm/panel: himax-hx83102: fix incorrect argument to mipi_dsi_msleep

Thomas Zimmermann (64):
      Merge drm/drm-next into drm-misc-next
      drm/fbdev-generic: Do not set physical framebuffer address
      fbdev/deferred-io: Move pageref setup into separate helper
      fbdev/deferred-io: Clean up pageref on lastclose
      fbdev/deferred-io: Test screen_buffer for vmalloc'ed memory
      fbdev/deferred-io: Test smem_start for I/O memory
      fbdev/deferred-io: Always call get_page() for framebuffer pages
      fbdev/deferred-io: Provide get_page hook in struct fb_deferred_io
      drm/fbdev: Add fbdev-shmem
      drm/ast: Use fbdev-shmem
      drm/gud: Use fbdev-shmem
      drm/hyperv: Use fbdev-shmem
      drm/mgag200: Use fbdev-shmem
      drm/solomon: Use fbdev-shmem
      drm/tiny/cirrus: Use fbdev-shmem
      drm/tiny/gm12u320: Use fbdev-shmem
      drm/tiny/ofdrm: Use fbdev-shmem
      drm/tiny/simpledrm: Use fbdev-shmem
      drm/udl: Use fbdev-shmem
      drm/virtio: Use fbdev-shmem
      drm/vkms: Use fbdev-shmem
      drm/fbdev-dma: Implement damage handling and deferred I/O
      drm/arm/komeda: Use fbdev-dma
      drm/hisilicon/kirin: Use fbdev-dma
      drm/imx/lcdc: Use fbdev-dma
      drm/ingenic: Use fbdev-dma
      drm/mediatek: Use fbdev-dma
      drm/panel/panel-ilitek-9341: Use fbdev-dma
      drm/renesas/rcar-du: Use fbdev-dma
      drm/renesas/rz-du: Use fbdev-dma
      drm/renesas/shmobile: Use fbdev-dma
      drm/rockchip: Use fbdev-dma
      drm/tiny/hx8357d: Use fbdev-dma
      drm/tiny/ili9163: Use fbdev-dma
      drm/tiny/ili9225: Use fbdev-dma
      drm/tiny/ili9341: Use fbdev-dma
      drm/tiny/ili9486: Use fbdev-dma
      drm/tiny/mi0283qt: Use fbdev-dma
      drm/tiny/panel-mipi-dbi: Use fbdev-dma
      drm/tiny/repaper: Use fbdev-dma
      drm/tiny/st7586: Use fbdev-dma
      drm/tiny/st7735r: Use fbdev-dma
      drm/fbdev-generic: Convert to fbdev-ttm
      drm/fbdev: Clean up fbdev documentation
      drm/udl: Remove DRM_CONNECTOR_POLL_HPD
      drm/udl: Move drm_dev_{enter, exit}() into udl_get_edid_block()
      drm/udl: Clean up Makefile
      drm/udl: Untangle .get_modes() and .detect_ctx()
      drm/udl: Remove struct udl_connector
      drm/fbdev-dma: Clean up deferred I/O
      drm/fbdev-shmem: Clean up deferred I/O
      drm/mgag200: Set DDC timeout in milliseconds
      drm/mgag200: Bind I2C lifetime to DRM device
      drm/mgag200: Store pointer to struct mga_device in struct mga_i2c_chan
      drm/mgag200: Allocate instance of struct mga_i2c_chan dynamically
      drm/mgag200: Inline mgag200_i2c_init()
      drm/mgag200: Replace struct mga_i2c_chan with struct mgag200_ddc
      drm/mgag200: Rename mgag200_i2c.c to mgag200_ddc.c
      drm/mgag200: Rename struct i2c_algo_bit_data callbacks
      drm/mgag200: Acquire I/O-register lock in DDC code
      drm/mgag200: Use drm_connector_helper_get_modes()
      drm/mgag200: Consolidate VGA output
      drm/mgag200: Add BMC output
      drm/mgag200: Set .detect_ctx() and enable connector polling

Timur Tabi (1):
      nouveau: add command-line GSP-RM registry support

Tomasz Rusinowicz (3):
      accel/ivpu: Add NPU profiling support
      accel/ivpu: Configure fw logging using debugfs
      accel/ivpu: Share NPU busy time in sysfs

Tvrtko Ursulin (1):
      drm/v3d: Fix perfmon build error/warning

Vignesh Raman (7):
      drm/ci: uprev mesa version
      drm/ci: add farm variable
      drm/ci: generate testlist from build
      drm/ci: uprev IGT
      drm/ci: skip driver specific tests
      drm/ci: update xfails for the new testlist
      drm/ci: add tests on vkms

Ville Syrj=E4l=E4 (14):
      drm/uapi: Move drm_color_ctm_3x4 out from drm_mode.h
      drm/amdgpu: Use drm_crtc_vblank_crtc()
      drm/hisilicon/kirin: Include linux/io.h for readl()/writel()
      drm/hisilicon/kirin: Fix 64bit divisions
      drm/hisilicon/kirin: Fix MASK(32) on 32bit architectures
      drm/hisilicon/kirin: Allow build with COMPILE_TEST=3Dy
      drm/omap: Open code phys_to_page()
      drm/omap: Allow build with COMPILE_TEST=3Dy
      drm/atmel-hlcdc: Allow build with COMPILE_TEST=3Dy
      drm/rcar-du: Allow build with COMPILE_TEST=3Dy
      drm/stm: Allow build with COMPILE_TEST=3Dy
      drm/probe-helper: Call drm_mode_validate_ycbcr420() before connector-=
>mode_valid()
      drm/sti: Include linux/io.h for devm_ioremap()
      drm/sti: Allow build with COMPILE_TEST=3Dy

Wachowski, Karol (15):
      accel/ivpu: Add sched_mode module param
      accel/ivpu: Create priority based command queues
      accel/ivpu: Implement support for preemption buffers
      accel/ivpu: Add HWS JSM messages
      accel/ivpu: Implement support for hardware scheduler
      accel/ivpu: Add resume engine support
      accel/ivpu: Add force snoop module parameter
      accel/ivpu: Split IP and buttress headers
      accel/ivpu: Split IP and buttress code
      accel/ivpu: Add wp0_during_power_up WA
      accel/ivpu: Disable disable_clock_relinquish WA for LNL B0+
      accel/ivpu: Disable clock relinquish for MMIO reset
      accel/ivpu: Update FW BOOT API headers
      accel/ivpu: Make parts of FW image read-only
      accel/ivpu: Synchronize device unbind with recovery work

Wayne Lin (1):
      drm/mst: Fix NULL pointer dereference at drm_dp_add_payload_part2

Wolfram Sang (1):
      drm/arm/komeda: don't use confusing 'timeout' variable name

Wyon Bi (1):
      drm/bridge: analogix_dp: simplify analogix_dp_{set/get}_lane_link_tra=
ining helpers

 .../bindings/display/panel/boe,tv101wum-nl6.yaml   |    2 -
 .../bindings/display/panel/himax,hx83102.yaml      |   77 +
 .../bindings/display/panel/panel-edp-legacy.yaml   |  117 +
 .../bindings/display/panel/panel-mipi-dbi-spi.yaml |   30 +
 .../panel/panel-simple-lvds-dual-ports.yaml        |    6 +
 .../bindings/display/panel/panel-simple.yaml       |   58 +-
 .../bindings/display/panel/samsung,atna33xc20.yaml |   95 +
 .../bindings/display/panel/sharp,ld-d5116z01b.yaml |   30 -
 .../bindings/display/panel/wl-355608-a8.yaml       |   60 +
 .../display/rockchip/rockchip,dw-mipi-dsi.yaml     |    2 +
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |    5 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |    6 +
 Documentation/gpu/drm-internals.rst                |   10 +-
 Documentation/gpu/drm-kms-helpers.rst              |   12 +-
 Documentation/gpu/kms-properties.csv               |    2 -
 Documentation/gpu/todo.rst                         |   72 +-
 MAINTAINERS                                        |    4 +-
 drivers/accel/ivpu/Makefile                        |   11 +-
 drivers/accel/ivpu/ivpu_debugfs.c                  |   89 +-
 drivers/accel/ivpu/ivpu_drv.c                      |  113 +-
 drivers/accel/ivpu/ivpu_drv.h                      |   62 +-
 drivers/accel/ivpu/ivpu_fw.c                       |   61 +-
 drivers/accel/ivpu/ivpu_fw.h                       |    4 +
 drivers/accel/ivpu/ivpu_gem.h                      |   13 +-
 drivers/accel/ivpu/ivpu_hw.c                       |  331 +++
 drivers/accel/ivpu/ivpu_hw.h                       |  245 +-
 drivers/accel/ivpu/ivpu_hw_37xx.c                  | 1065 --------
 drivers/accel/ivpu/ivpu_hw_37xx_reg.h              |   72 -
 drivers/accel/ivpu/ivpu_hw_40xx.c                  | 1250 ---------
 drivers/accel/ivpu/ivpu_hw_40xx_reg.h              |   94 +-
 drivers/accel/ivpu/ivpu_hw_btrs.c                  |  905 +++++++
 drivers/accel/ivpu/ivpu_hw_btrs.h                  |   50 +
 drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h          |  108 +
 drivers/accel/ivpu/ivpu_hw_btrs_mtl_reg.h          |   83 +
 drivers/accel/ivpu/ivpu_hw_ip.c                    | 1174 +++++++++
 drivers/accel/ivpu/ivpu_hw_ip.h                    |   36 +
 drivers/accel/ivpu/ivpu_ipc.c                      |   20 +-
 drivers/accel/ivpu/ivpu_ipc.h                      |    8 +-
 drivers/accel/ivpu/ivpu_job.c                      |  324 ++-
 drivers/accel/ivpu/ivpu_job.h                      |    6 +-
 drivers/accel/ivpu/ivpu_jsm_msg.c                  |  311 ++-
 drivers/accel/ivpu/ivpu_jsm_msg.h                  |   22 +-
 drivers/accel/ivpu/ivpu_mmu.c                      |   22 +-
 drivers/accel/ivpu/ivpu_mmu_context.c              |   86 +
 drivers/accel/ivpu/ivpu_mmu_context.h              |    2 +
 drivers/accel/ivpu/ivpu_ms.c                       |  309 +++
 drivers/accel/ivpu/ivpu_ms.h                       |   36 +
 drivers/accel/ivpu/ivpu_pm.c                       |  111 +-
 drivers/accel/ivpu/ivpu_pm.h                       |   10 +-
 drivers/accel/ivpu/ivpu_sysfs.c                    |   58 +
 drivers/accel/ivpu/ivpu_sysfs.h                    |   13 +
 drivers/accel/ivpu/vpu_boot_api.h                  |   16 +-
 drivers/accel/ivpu/vpu_jsm_api.h                   |   14 +-
 drivers/dma-buf/dma-fence-array.c                  |   10 +-
 drivers/dma-buf/dma-heap.c                         |    4 +-
 drivers/dma-buf/dma-resv.c                         |    7 +
 drivers/dma-buf/heaps/cma_heap.c                   |    4 +-
 drivers/dma-buf/heaps/system_heap.c                |    4 +-
 drivers/gpu/drm/Kconfig                            |   16 +-
 drivers/gpu/drm/Makefile                           |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |   16 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.h     |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |    6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |    8 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |    4 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |    4 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |    4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |    2 +-
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c   |   49 +-
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c    |    8 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.h    |    1 +
 .../gpu/drm/arm/display/komeda/komeda_pipeline.c   |    4 +-
 drivers/gpu/drm/ast/ast_drv.c                      |    4 +-
 drivers/gpu/drm/atmel-hlcdc/Kconfig                |    2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c     |  172 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |  105 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h       |  132 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c    |  391 ++-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |    5 -
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |   20 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |   28 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  168 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |   22 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  |  119 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   36 +-
 drivers/gpu/drm/bridge/analogix/anx7625.h          |   10 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |    5 -
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c        |    5 -
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |    5 -
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |    5 -
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |    5 -
 drivers/gpu/drm/bridge/ite-it6505.c                |   88 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |    1 +
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |    6 +-
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |    5 -
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |    5 -
 drivers/gpu/drm/bridge/panel.c                     |    5 -
 drivers/gpu/drm/bridge/samsung-dsim.c              |   25 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   46 +-
 drivers/gpu/drm/bridge/sii9234.c                   |    1 +
 drivers/gpu/drm/bridge/sil-sii8620.c               |    1 +
 drivers/gpu/drm/bridge/simple-bridge.c             |   18 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |    5 -
 drivers/gpu/drm/bridge/tc358767.c                  |   27 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |    5 -
 drivers/gpu/drm/ci/build-igt.sh                    |   41 +-
 drivers/gpu/drm/ci/build.sh                        |   10 +-
 drivers/gpu/drm/ci/build.yml                       |    1 +
 drivers/gpu/drm/ci/container.yml                   |   12 +-
 drivers/gpu/drm/ci/gitlab-ci.yml                   |   47 +-
 drivers/gpu/drm/ci/igt_runner.sh                   |   15 +-
 drivers/gpu/drm/ci/image-tags.yml                  |    4 +-
 drivers/gpu/drm/ci/lava-submit.sh                  |    4 +-
 drivers/gpu/drm/ci/test.yml                        |   41 +-
 drivers/gpu/drm/ci/testlist.txt                    | 2761 ----------------=
----
 drivers/gpu/drm/ci/x86_64.config                   |    1 +
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt  |   41 +-
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt |    7 +
 drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt  |   33 +-
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt      |   31 +
 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt     |    9 +
 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt      |   22 +-
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt       |   46 +-
 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt      |    6 +
 drivers/gpu/drm/ci/xfails/i915-apl-skips.txt       |   26 +-
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt       |   38 +
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt      |    6 +
 drivers/gpu/drm/ci/xfails/i915-cml-skips.txt       |   23 +
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt       |   41 +-
 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt      |    7 +
 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt       |   26 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt       |   42 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt      |    7 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt       |   36 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt       |   77 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt       |   28 +-
 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt       |   63 +-
 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt      |    6 +
 drivers/gpu/drm/ci/xfails/i915-whl-skips.txt       |   22 +-
 .../gpu/drm/ci/xfails/mediatek-mt8173-fails.txt    |   30 +-
 .../gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt   |   11 +
 .../gpu/drm/ci/xfails/mediatek-mt8173-skips.txt    |   16 +
 .../gpu/drm/ci/xfails/mediatek-mt8183-fails.txt    |   21 +-
 .../gpu/drm/ci/xfails/mediatek-mt8183-skips.txt    |   18 +
 drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt     |   24 +-
 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt     |   18 +
 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt    |   26 +-
 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt    |   15 +
 drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt    |    8 +-
 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt   |    6 +
 drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt    |   26 +-
 .../xfails/msm-sc7180-trogdor-kingoftown-fails.txt |  175 +-
 .../msm-sc7180-trogdor-kingoftown-flakes.txt       |    8 +
 .../xfails/msm-sc7180-trogdor-kingoftown-skips.txt |   19 +
 .../msm-sc7180-trogdor-lazor-limozeen-fails.txt    |  175 +-
 .../msm-sc7180-trogdor-lazor-limozeen-flakes.txt   |    6 +
 .../msm-sc7180-trogdor-lazor-limozeen-skips.txt    |   16 +
 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt     |   38 +-
 drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt    |   25 +-
 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt     |   19 +
 .../gpu/drm/ci/xfails/rockchip-rk3288-fails.txt    |   62 +-
 .../gpu/drm/ci/xfails/rockchip-rk3288-skips.txt    |   21 +-
 .../gpu/drm/ci/xfails/rockchip-rk3399-fails.txt    |   83 +-
 .../gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt   |   13 +-
 .../gpu/drm/ci/xfails/rockchip-rk3399-skips.txt    |   19 +
 drivers/gpu/drm/ci/xfails/update-xfails.py         |    4 +-
 .../gpu/drm/ci/xfails/virtio_gpu-none-fails.txt    |   94 +-
 .../gpu/drm/ci/xfails/virtio_gpu-none-skips.txt    |   20 +-
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt      |   57 +
 drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt     |   69 +
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt      |  119 +
 drivers/gpu/drm/display/Kconfig                    |    7 +
 drivers/gpu/drm/display/Makefile                   |    2 +
 drivers/gpu/drm/display/drm_hdmi_helper.c          |   61 +
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  752 ++++++
 drivers/gpu/drm/drm_atomic.c                       |   11 +
 drivers/gpu/drm/drm_atomic_uapi.c                  |    4 +
 drivers/gpu/drm/drm_bridge.c                       |   42 -
 drivers/gpu/drm/drm_bridge_connector.c             |  107 +-
 drivers/gpu/drm/drm_connector.c                    |  201 ++
 drivers/gpu/drm/drm_crtc_internal.h                |    2 +
 drivers/gpu/drm/drm_debugfs.c                      |  158 +-
 drivers/gpu/drm/drm_drv.c                          |    6 +-
 drivers/gpu/drm/drm_edid.c                         |   61 +-
 drivers/gpu/drm/drm_fb_helper.c                    |   11 +-
 drivers/gpu/drm/drm_fbdev_dma.c                    |   66 +-
 drivers/gpu/drm/drm_fbdev_shmem.c                  |  317 +++
 .../drm/{drm_fbdev_generic.c =3D> drm_fbdev_ttm.c}   |   80 +-
 drivers/gpu/drm/drm_ioctl.c                        |    5 +-
 drivers/gpu/drm/drm_mipi_dbi.c                     |   77 +-
 drivers/gpu/drm/drm_mipi_dsi.c                     |  322 +++
 drivers/gpu/drm/drm_mm.c                           |   35 -
 drivers/gpu/drm/drm_mode_object.c                  |    1 +
 drivers/gpu/drm/drm_modes.c                        |    5 +-
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |    1 +
 drivers/gpu/drm/drm_panic.c                        |  286 +-
 drivers/gpu/drm/drm_print.c                        |   72 +-
 drivers/gpu/drm/drm_probe_helper.c                 |   13 +-
 drivers/gpu/drm/drm_simple_kms_helper.c            |    1 +
 drivers/gpu/drm/drm_sysfs.c                        |   24 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |    2 +-
 drivers/gpu/drm/gud/gud_drv.c                      |    5 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |    4 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c   |   17 +-
 drivers/gpu/drm/hisilicon/kirin/Kconfig            |    2 +-
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |   11 +-
 drivers/gpu/drm/hisilicon/kirin/dw_dsi_reg.h       |    2 +
 drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h    |    2 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |    4 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |    4 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |   19 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |    2 +-
 drivers/gpu/drm/i915/gt/selftest_context.c         |    2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c                   |    1 +
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c                |   24 +-
 drivers/gpu/drm/imx/ipuv3/imx-tve.c                |   14 +-
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c                |    4 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |    4 +-
 drivers/gpu/drm/loongson/Kconfig                   |    1 +
 drivers/gpu/drm/loongson/lsdc_drv.c                |    4 +-
 drivers/gpu/drm/loongson/lsdc_output_7a1000.c      |   15 +-
 drivers/gpu/drm/loongson/lsdc_output_7a2000.c      |   15 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |    4 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   11 -
 drivers/gpu/drm/meson/meson_plane.c                |   17 +-
 drivers/gpu/drm/mgag200/Kconfig                    |   18 +-
 drivers/gpu/drm/mgag200/Makefile                   |    5 +-
 drivers/gpu/drm/mgag200/mgag200_bmc.c              |  107 +
 drivers/gpu/drm/mgag200/mgag200_ddc.c              |  179 ++
 drivers/gpu/drm/mgag200/mgag200_ddc.h              |   11 +
 drivers/gpu/drm/mgag200/mgag200_drv.c              |   27 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h              |   46 +-
 drivers/gpu/drm/mgag200/mgag200_g200.c             |   46 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh.c           |   46 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c          |   46 +-
 drivers/gpu/drm/mgag200/mgag200_g200er.c           |   46 +-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c           |   46 +-
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c          |   46 +-
 drivers/gpu/drm/mgag200/mgag200_g200se.c           |   46 +-
 drivers/gpu/drm/mgag200/mgag200_g200wb.c           |   46 +-
 drivers/gpu/drm/mgag200/mgag200_i2c.c              |  129 -
 drivers/gpu/drm/mgag200/mgag200_mode.c             |   35 +-
 drivers/gpu/drm/mgag200/mgag200_vga.c              |   72 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |    8 +-
 drivers/gpu/drm/nouveau/dispnv50/head.c            |    8 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h  |    6 +
 drivers/gpu/drm/nouveau/nouveau_bo.c               |    2 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c             |    2 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c        |    2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c             |    2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |    6 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c             |    2 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c            |   30 +-
 drivers/gpu/drm/nouveau/nouveau_fence.h            |    2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c              |    2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.h            |    4 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c             |    2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     |  364 ++-
 drivers/gpu/drm/omapdrm/Kconfig                    |    2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c                 |    4 +-
 drivers/gpu/drm/panel/Kconfig                      |    9 +
 drivers/gpu/drm/panel/Makefile                     |    1 +
 drivers/gpu/drm/panel/panel-abt-y030xx067a.c       |    1 +
 drivers/gpu/drm/panel/panel-auo-a030jtn01.c        |    1 +
 drivers/gpu/drm/panel/panel-boe-himax8279d.c       |   40 -
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     | 2745 ++++++++++------=
---
 drivers/gpu/drm/panel/panel-edp.c                  |  260 +-
 drivers/gpu/drm/panel/panel-himax-hx83102.c        |  706 +++++
 drivers/gpu/drm/panel/panel-himax-hx8394.c         |    3 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       |    7 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c      |  764 +++---
 drivers/gpu/drm/panel/panel-innolux-ej030na.c      |    1 +
 drivers/gpu/drm/panel/panel-innolux-p079zca.c      |  318 +--
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c     |   35 -
 drivers/gpu/drm/panel/panel-khadas-ts050.c         |   39 -
 drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c |   48 -
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c |   28 -
 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c |   28 -
 drivers/gpu/drm/panel/panel-lg-sw43408.c           |   74 +-
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c    |  226 ++
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c     |   29 -
 drivers/gpu/drm/panel/panel-novatek-nt36672e.c     |  643 +++--
 drivers/gpu/drm/panel/panel-novatek-nt39016.c      |    1 +
 drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c |   44 -
 drivers/gpu/drm/panel/panel-orisetech-ota5601a.c   |    1 +
 drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c |   41 +-
 .../gpu/drm/panel/panel-panasonic-vvx10f034n00.c   |   47 +-
 drivers/gpu/drm/panel/panel-raydium-rm67191.c      |   26 -
 drivers/gpu/drm/panel/panel-raydium-rm692e5.c      |   10 -
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c   |   36 -
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c        |   49 -
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c    |   63 +-
 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c    |   24 -
 drivers/gpu/drm/panel/panel-simple.c               |  185 +-
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      |   35 +-
 drivers/gpu/drm/panel/panel-sony-acx565akm.c       |    6 -
 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c       |   23 -
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c   |   28 -
 drivers/gpu/drm/panfrost/panfrost_drv.c            |   10 +
 drivers/gpu/drm/qxl/qxl_drv.c                      |    4 +-
 drivers/gpu/drm/radeon/atombios_encoders.c         |   10 +-
 drivers/gpu/drm/radeon/evergreen_hdmi.c            |    5 +-
 drivers/gpu/drm/radeon/radeon_audio.c              |   13 +-
 drivers/gpu/drm/radeon/radeon_connectors.c         |   27 +-
 drivers/gpu/drm/radeon/radeon_display.c            |    2 +-
 drivers/gpu/drm/radeon/radeon_encoders.c           |    4 +-
 drivers/gpu/drm/radeon/radeon_mode.h               |    2 -
 drivers/gpu/drm/renesas/rcar-du/Kconfig            |    2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c      |    4 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c       |    4 +-
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c   |    4 +-
 drivers/gpu/drm/rockchip/Kconfig                   |    3 +
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |   20 +
 drivers/gpu/drm/rockchip/inno_hdmi.c               |  172 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |    4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |    2 +-
 drivers/gpu/drm/solomon/ssd130x.c                  |    4 +-
 drivers/gpu/drm/sti/Kconfig                        |    2 +-
 drivers/gpu/drm/sti/sti_dvo.c                      |    1 +
 drivers/gpu/drm/stm/Kconfig                        |    2 +-
 drivers/gpu/drm/sun4i/Kconfig                      |    3 +
 drivers/gpu/drm/sun4i/sun4i_backend.c              |    4 +-
 drivers/gpu/drm/sun4i/sun4i_crtc.c                 |    2 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   83 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c                |   70 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.h                |   20 +
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c             |   85 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h             |   20 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |   86 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h             |   20 +-
 drivers/gpu/drm/sun4i/sunxi_engine.h               |   13 +-
 drivers/gpu/drm/tests/Makefile                     |    1 +
 drivers/gpu/drm/tests/drm_buddy_test.c             |    1 +
 drivers/gpu/drm/tests/drm_cmdline_parser_test.c    |    1 +
 drivers/gpu/drm/tests/drm_connector_test.c         | 1052 +++++++-
 drivers/gpu/drm/tests/drm_damage_helper_test.c     |    1 +
 drivers/gpu/drm/tests/drm_dp_mst_helper_test.c     |    1 +
 drivers/gpu/drm/tests/drm_exec_test.c              |    1 +
 drivers/gpu/drm/tests/drm_format_test.c            |    1 +
 drivers/gpu/drm/tests/drm_framebuffer_test.c       |    1 +
 drivers/gpu/drm/tests/drm_gem_shmem_test.c         |    1 +
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 1743 ++++++++++++
 drivers/gpu/drm/tests/drm_kunit_edid.h             |  484 ++++
 drivers/gpu/drm/tests/drm_kunit_helpers.c          |    1 +
 drivers/gpu/drm/tests/drm_managed_test.c           |    1 +
 drivers/gpu/drm/tests/drm_mm_test.c                |    1 +
 drivers/gpu/drm/tests/drm_modes_test.c             |    1 +
 drivers/gpu/drm/tests/drm_plane_helper_test.c      |    1 +
 drivers/gpu/drm/tests/drm_probe_helper_test.c      |    1 +
 drivers/gpu/drm/tests/drm_rect_test.c              |    1 +
 drivers/gpu/drm/tidss/tidss_plane.c                |   14 +-
 drivers/gpu/drm/tiny/bochs.c                       |   28 +-
 drivers/gpu/drm/tiny/cirrus.c                      |    5 +-
 drivers/gpu/drm/tiny/gm12u320.c                    |    5 +-
 drivers/gpu/drm/tiny/hx8357d.c                     |    4 +-
 drivers/gpu/drm/tiny/ili9163.c                     |    4 +-
 drivers/gpu/drm/tiny/ili9225.c                     |    5 +-
 drivers/gpu/drm/tiny/ili9341.c                     |    4 +-
 drivers/gpu/drm/tiny/ili9486.c                     |    4 +-
 drivers/gpu/drm/tiny/mi0283qt.c                    |    5 +-
 drivers/gpu/drm/tiny/ofdrm.c                       |    4 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c              |   60 +-
 drivers/gpu/drm/tiny/repaper.c                     |    4 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |    4 +-
 drivers/gpu/drm/tiny/st7586.c                      |    5 +-
 drivers/gpu/drm/tiny/st7735r.c                     |    4 +-
 drivers/gpu/drm/udl/Makefile                       |    8 +-
 drivers/gpu/drm/udl/udl_drv.c                      |    5 +-
 drivers/gpu/drm/udl/udl_drv.h                      |   12 +-
 drivers/gpu/drm/udl/udl_edid.c                     |   80 +
 drivers/gpu/drm/udl/udl_edid.h                     |   15 +
 drivers/gpu/drm/udl/udl_modeset.c                  |  142 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |   11 +
 drivers/gpu/drm/v3d/v3d_drv.h                      |   11 +-
 drivers/gpu/drm/v3d/v3d_perfmon.c                  |  228 +-
 drivers/gpu/drm/v3d/v3d_performance_counters.h     |   29 +
 drivers/gpu/drm/v3d/v3d_sched.c                    |    2 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c               |    4 +-
 drivers/gpu/drm/vc4/Kconfig                        |    1 +
 drivers/gpu/drm/vc4/tests/vc4_mock.c               |    6 +-
 drivers/gpu/drm/vc4/tests/vc4_mock.h               |    9 +-
 drivers/gpu/drm/vc4/tests/vc4_mock_plane.c         |   44 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  644 +----
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   44 +-
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c                 |    6 +-
 drivers/gpu/drm/virtio/virtgpu_display.c           |   10 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c               |    4 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h               |    2 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c                |   12 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |    4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c               |    1 -
 drivers/gpu/drm/xlnx/zynqmp_disp.c                 |   44 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |   62 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                |    1 +
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h                |    1 +
 drivers/gpu/drm/xlnx/zynqmp_kms.c                  |   22 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.h                  |    4 +-
 drivers/video/fbdev/core/fb_defio.c                |   82 +-
 include/drm/display/drm_dp_helper.h                |    2 +-
 include/drm/display/drm_hdmi_helper.h              |    4 +
 include/drm/display/drm_hdmi_state_helper.h        |   23 +
 include/drm/drm_bridge.h                           |   84 +-
 include/drm/drm_connector.h                        |  252 +-
 include/drm/drm_drv.h                              |    2 +-
 include/drm/drm_edid.h                             |    4 -
 include/drm/drm_fbdev_generic.h                    |   15 -
 include/drm/drm_fbdev_shmem.h                      |   15 +
 include/drm/drm_fbdev_ttm.h                        |   15 +
 include/drm/drm_mipi_dbi.h                         |   10 +
 include/drm/drm_mipi_dsi.h                         |  122 +-
 include/drm/drm_mm.h                               |    1 -
 include/drm/drm_mode_config.h                      |    4 +-
 include/drm/drm_panic.h                            |    9 +
 include/drm/drm_print.h                            |   14 +-
 include/linux/dma-fence-array.h                    |    3 +
 include/linux/dma-heap.h                           |    4 +-
 include/linux/fb.h                                 |    1 +
 include/linux/mfd/atmel-hlcdc.h                    |   10 +
 include/uapi/drm/amdgpu_drm.h                      |    9 +
 include/uapi/drm/drm_mode.h                        |    8 -
 include/uapi/drm/ivpu_accel.h                      |   69 +-
 include/uapi/drm/v3d_drm.h                         |   48 +
 include/uapi/linux/dma-heap.h                      |    2 +-
 lib/fonts/Kconfig                                  |   20 +-
 426 files changed, 19042 insertions(+), 12615 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,h=
x83102.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-e=
dp-legacy.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung=
,atna33xc20.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,l=
d-d5116z01b.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/wl-3556=
08-a8.yaml
 create mode 100644 drivers/accel/ivpu/ivpu_hw.c
 delete mode 100644 drivers/accel/ivpu/ivpu_hw_37xx.c
 delete mode 100644 drivers/accel/ivpu/ivpu_hw_40xx.c
 create mode 100644 drivers/accel/ivpu/ivpu_hw_btrs.c
 create mode 100644 drivers/accel/ivpu/ivpu_hw_btrs.h
 create mode 100644 drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h
 create mode 100644 drivers/accel/ivpu/ivpu_hw_btrs_mtl_reg.h
 create mode 100644 drivers/accel/ivpu/ivpu_hw_ip.c
 create mode 100644 drivers/accel/ivpu/ivpu_hw_ip.h
 create mode 100644 drivers/accel/ivpu/ivpu_ms.c
 create mode 100644 drivers/accel/ivpu/ivpu_ms.h
 create mode 100644 drivers/accel/ivpu/ivpu_sysfs.c
 create mode 100644 drivers/accel/ivpu/ivpu_sysfs.h
 delete mode 100644 drivers/gpu/drm/ci/testlist.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown=
-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limo=
zeen-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
 create mode 100644 drivers/gpu/drm/display/drm_hdmi_state_helper.c
 create mode 100644 drivers/gpu/drm/drm_fbdev_shmem.c
 rename drivers/gpu/drm/{drm_fbdev_generic.c =3D> drm_fbdev_ttm.c} (76%)
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_ddc.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_ddc.h
 delete mode 100644 drivers/gpu/drm/mgag200/mgag200_i2c.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_vga.c
 create mode 100644 drivers/gpu/drm/panel/panel-himax-hx83102.c
 create mode 100644 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
 create mode 100644 drivers/gpu/drm/tests/drm_kunit_edid.h
 create mode 100644 drivers/gpu/drm/udl/udl_edid.c
 create mode 100644 drivers/gpu/drm/udl/udl_edid.h
 create mode 100644 drivers/gpu/drm/v3d/v3d_performance_counters.h
 create mode 100644 include/drm/display/drm_hdmi_state_helper.h
 delete mode 100644 include/drm/drm_fbdev_generic.h
 create mode 100644 include/drm/drm_fbdev_shmem.h
 create mode 100644 include/drm/drm_fbdev_ttm.h

--g2s5vzajmkoakej2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZnPh2wAKCRDj7w1vZxhR
xapYAP4kUEkSDuuDJM2QfmUbmTtmh5wAoilYr3ltB7Z9Fm4vWgD8C2hhtmQx3p3X
eExSrQnK19rfpTM/gdlIFVzT7jXMkwU=
=JzP4
-----END PGP SIGNATURE-----

--g2s5vzajmkoakej2--

