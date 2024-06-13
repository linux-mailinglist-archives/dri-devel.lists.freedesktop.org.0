Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D777590659B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 09:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0471510E29F;
	Thu, 13 Jun 2024 07:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Qf6Hb3tt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9BD10E98E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 07:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718264968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=1CiLCm+pCW3IJKtEh6+/HenFU1/k8IrIRP3mdRFM3nY=;
 b=Qf6Hb3ttUoo9LRuiWfsnICWt+EpsBHVZxaA5QUDC2HN6gD9YaZcwpK2h03vAl0ZArasGib
 UKyG8WqEaDdxhyPFluVjpu5veJpPY5JIERXYr63U+nakro/W8/TLOspXo279v871eL3dUk
 5EM3Hygiqm4476RBaw2iaBfrM2tUrmQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-9Fhb9m4yNWyAq9XxuymNUA-1; Thu, 13 Jun 2024 03:49:22 -0400
X-MC-Unique: 9Fhb9m4yNWyAq9XxuymNUA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-421f43ddc2aso5057645e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 00:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718264961; x=1718869761;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1CiLCm+pCW3IJKtEh6+/HenFU1/k8IrIRP3mdRFM3nY=;
 b=o2BI7cPrYmzr0i6OOmT+VJAD12LBYg0tv8BxsvdEeX5mMAsROK25XGGAiG4PYORH68
 kZ4WvsDf2GZ79l7GlPYDrCPDYSbmsgwcHzxMN1cI4YE3RLK92f74icYcNyt2DvSh2qHd
 VVcAZPY94kJrvZsQmgFCxbl3EEkV/PmbuAkLfe4/YL+Gf8BJTZAGSOvNrGdH0A86wr5M
 xxIaUxQsipeCofPEFkoozaabpwSkuaTshUdBDDyU6tkFLGqL1B8UuxS0QfbSx6Ro+doM
 GGOGIhMS9nDfAxIFqMFnOzK1fGosmpj8TnUEK9rrg4mRKDdrKyPWt0aO4gdEQ4GZGD0W
 +PAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvFcARdDCrV5IqrG0O/Ys5k+XMCycDziPyUkNqTOqDOUYJMGQn/A3rOMfN7fF0nyxT5smUeV565qvH8aA3hzcdsY0mbdnRyaBNYOMfDECt
X-Gm-Message-State: AOJu0YxWIfYar5SGhSFIdRi5c1oOYYZ0U/rzMPi6uElJwf2WifQryUsc
 w4ytiYGdBC/tGLQcl5bKWE+V01yc48CAGTabHt99DEH31jyf6WSq30zNJXPjA1dTk3O90P7DAaY
 c+Es1+VPUyBk45Ya7KMEfegdHVZWoedEee6MLzEXUgujACQUERhgl/QC/8anymkirng==
X-Received: by 2002:a05:600c:310f:b0:421:b79:93fd with SMTP id
 5b1f17b1804b1-422863b875amr31497325e9.21.1718264960800; 
 Thu, 13 Jun 2024 00:49:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUyCnUQtN9K3FTVSxry1NJsjXSUc++X9Y4LUtQdmjBA2zAcTjzd3tsdwxjFHO73EEoAPGbqg==
X-Received: by 2002:a05:600c:310f:b0:421:b79:93fd with SMTP id
 5b1f17b1804b1-422863b875amr31496975e9.21.1718264960005; 
 Thu, 13 Jun 2024 00:49:20 -0700 (PDT)
Received: from localhost ([193.32.126.213]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f6320c16sm13426195e9.38.2024.06.13.00.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 00:49:19 -0700 (PDT)
Date: Thu, 13 Jun 2024 09:49:18 +0200
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
Message-ID: <20240613-cicada-of-infinite-unity-0955ca@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xvw4elizvenxfeu3"
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


--xvw4elizvenxfeu3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Here's this week drm-misc-next PR

Maxime

drm-misc-next-2024-06-13:
drm-misc-next for 6.11:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
 - Sprinkle MODULE_DESCRIPTIONS everywhere they are missing
 - bridge: Remove drm_bridge_chain_mode_fixup
 - ci: Require a more recent version of mesa, improve farm estup and
   test generation
 - mipi-dbi: Remove mipi_dbi_machine_little_endian, make SPI bits per
   word configurable, support RGB888, and allow pixel formats to be
   specified in the DT.
 - mm: Remove drm_mm_replace_node
 - panic: Allow to dump kmsg to the screen
 - print: Add a drm prefix to warn level messages too, remove
   ___drm_dbg, consolidate prefix handling

Driver Changes:
 - sun4i: Rework the blender setup for DE2
 - bridges:
   - bridge-connector: Plumb in the new HDMI helpers
   - samsung-dsim: Fix timings calculation
   - tc358767: Plenty of small fixes
 - panels:
   - More cleanup of prepare / enable state tracking in drivers
   - New panel: PrimeView PM070WL4,
The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-202=
4-06-13

for you to fetch changes up to a13aaf157467e694a3824d81304106b58d4c20d6:

  drm/panel: himax-hx83102: fix incorrect argument to mipi_dsi_msleep (2024=
-06-12 16:33:30 +0200)

----------------------------------------------------------------
drm-misc-next for 6.11:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
 - Sprinkle MODULE_DESCRIPTIONS everywhere they are missing
 - bridge: Remove drm_bridge_chain_mode_fixup
 - ci: Require a more recent version of mesa, improve farm estup and
   test generation
 - mipi-dbi: Remove mipi_dbi_machine_little_endian, make SPI bits per
   word configurable, support RGB888, and allow pixel formats to be
   specified in the DT.
 - mm: Remove drm_mm_replace_node
 - panic: Allow to dump kmsg to the screen
 - print: Add a drm prefix to warn level messages too, remove
   ___drm_dbg, consolidate prefix handling

Driver Changes:
 - sun4i: Rework the blender setup for DE2
 - bridges:
   - bridge-connector: Plumb in the new HDMI helpers
   - samsung-dsim: Fix timings calculation
   - tc358767: Plenty of small fixes
 - panels:
   - More cleanup of prepare / enable state tracking in drivers
   - New panel: PrimeView PM070WL4,

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

Anatoliy Klymenko (2):
      drm: xlnx: zynqmp_dpsub: Fix few function comments
      drm: xlnx: zynqmp_dpsub: Fix compilation error

Andy Yan (1):
      drm/rockchip: vop2: Fix the port mux of VP2

Aradhya Bhatia (6):
      dt-bindings: vendor-prefixes: Add microtips
      dt-bindings: vendor-prefixes: Add lincolntech
      dt-bindings: display: simple: Add Microtips & Lincolntech Dual-LVDS P=
anels
      drm/panel: simple: Add Lincoln Tech Sol LCD185-101CT panel
      drm/panel: simple: Add Microtips Technology 13-101HIEBCAF0-C panel
      drm/panel: simple: Add Microtips Technology MF-103HIEB0GA0 panel

Barry Song (1):
      dma-buf: align fd_flags and heap_flags with dma_heap_allocation_data

Chaitanya Kumar Borah (1):
      nouveau: Add missing break statement

Christian K=F6nig (1):
      dma-buf: add a warning when drv try to reserve 0 fence slots

Christophe JAILLET (1):
      dma-buf/fence-array: Add flex array to struct dma_fence_array

Colin Ian King (1):
      drm/gma500: Fix spelling mistake "patter" -> "pattern"

Cong Yang (6):
      dt-bindings: display: panel: Add himax hx83102 panel bindings
      drm/panel: himax-hx83102: Break out as separate driver
      dt-bindings: display: panel: Add compatible for BOE nv110wum-l60
      drm/panel: himax-hx83102: Support for BOE nv110wum-l60 MIPI-DSI panel
      dt-bindings: display: panel: Add compatible for IVO t109nw41
      drm/panel: himax-hx83102: Support for IVO t109nw41 MIPI-DSI panel

Dmitry Baryshkov (11):
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

Jacek Lawrynowicz (3):
      accel/ivpu: Update VPU FW API headers
      accel/ivpu: Increase reset counter when warm boot fails
      accel/ivpu: Replace wake_thread with kfifo

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

Jeff Johnson (5):
      drm/tests: add missing MODULE_DESCRIPTION() macros
      drm/panel: add missing MODULE_DESCRIPTION() macros
      drm/tiny: add missing MODULE_DESCRIPTION() macros
      drm/bridge: add missing MODULE_DESCRIPTION() macros
      drm: add missing MODULE_DESCRIPTION() macros

Jiapeng Chong (1):
      drm/vmwgfx: Remove duplicate vmwgfx_vkms.h header

Jocelyn Falempe (7):
      drm/fb_dma: Add checks in drm_fb_dma_get_scanout_buffer()
      lib/fonts: Allow to select fonts for drm_panic
      Revert "drm/mgag200: Add a workaround for low-latency"
      drm/mgag200: Add an option to disable Write-Combine
      drm/panic: only draw the foreground color in drm_panic_blit()
      drm/panic: Add a set_pixel() callback to drm_scanout_buffer
      drm/panic: Add a kmsg panic screen

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

Manikandan Muralidharan (7):
      drm: atmel-hlcdc: add driver ops to differentiate HLCDC and XLCDC IP
      drm: atmel_hlcdc: replace regmap_read with regmap_read_poll_timeout
      drm: atmel_hlcdc: Add support for XLCDC using IP specific driver ops
      drm: atmel-hlcdc: add DPI mode support for XLCDC
      drm: atmel-hlcdc: add vertical and horizontal scaling support for XLC=
DC
      drm: atmel-hlcdc: add support for DSI output formats
      drm: atmel-hlcdc: add LCD controller layer definition for sam9x75

Marek Vasut (3):
      drm/bridge: tc358767: Enable FRMSYNC timing generator
      drm/bridge: tc358767: Fix comment in tc_edp_mode_valid
      drm/bridge: tc358767: Check if fully initialized before signalling HP=
D event via IRQ

MarileneGarcia (1):
      drm/dp: Fix documentation warning

Maxime Ripard (32):
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

Sean Anderson (5):
      drm: xlnx: Store base pointers in zynqmp_disp directly
      drm: xlnx: Fix kerneldoc
      drm: zynqmp_dp: Downgrade log level for aux retries message
      drm: zynqmp_dp: Adjust training values per-lane
      drm: zynqmp_dpsub: Always register bridge

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

Thomas Zimmermann (61):
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

Timur Tabi (1):
      nouveau: add command-line GSP-RM registry support

Tomasz Rusinowicz (3):
      accel/ivpu: Add NPU profiling support
      accel/ivpu: Configure fw logging using debugfs
      accel/ivpu: Share NPU busy time in sysfs

Tvrtko Ursulin (1):
      drm/v3d: Fix perfmon build error/warning

Vignesh Raman (6):
      drm/ci: uprev mesa version
      drm/ci: add farm variable
      drm/ci: generate testlist from build
      drm/ci: uprev IGT
      drm/ci: skip driver specific tests
      drm/ci: update xfails for the new testlist

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

Wachowski, Karol (9):
      accel/ivpu: Add sched_mode module param
      accel/ivpu: Create priority based command queues
      accel/ivpu: Implement support for preemption buffers
      accel/ivpu: Add HWS JSM messages
      accel/ivpu: Implement support for hardware scheduler
      accel/ivpu: Add resume engine support
      accel/ivpu: Add force snoop module parameter
      accel/ivpu: Split IP and buttress headers
      accel/ivpu: Split IP and buttress code

Wayne Lin (1):
      drm/mst: Fix NULL pointer dereference at drm_dp_add_payload_part2

Wolfram Sang (1):
      drm/arm/komeda: don't use confusing 'timeout' variable name

Wyon Bi (1):
      drm/bridge: analogix_dp: simplify analogix_dp_{set/get}_lane_link_tra=
ining helpers

 .../bindings/display/panel/boe,tv101wum-nl6.yaml   |    2 -
 .../bindings/display/panel/himax,hx83102.yaml      |   77 +
 .../bindings/display/panel/panel-edp-legacy.yaml   |  127 +
 .../bindings/display/panel/panel-mipi-dbi-spi.yaml |   30 +
 .../panel/panel-simple-lvds-dual-ports.yaml        |    6 +
 .../bindings/display/panel/panel-simple.yaml       |   58 +-
 .../bindings/display/panel/samsung,atna33xc20.yaml |   95 +
 .../bindings/display/panel/sharp,ld-d5116z01b.yaml |   30 -
 .../bindings/display/panel/wl-355608-a8.yaml       |   60 +
 .../display/rockchip/rockchip,dw-mipi-dsi.yaml     |    2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    6 +
 Documentation/gpu/drm-internals.rst                |   10 +-
 Documentation/gpu/drm-kms-helpers.rst              |   12 +-
 Documentation/gpu/kms-properties.csv               |    2 -
 Documentation/gpu/todo.rst                         |   72 +-
 MAINTAINERS                                        |    3 +-
 drivers/accel/ivpu/Makefile                        |   11 +-
 drivers/accel/ivpu/ivpu_debugfs.c                  |   52 +-
 drivers/accel/ivpu/ivpu_drv.c                      |   76 +-
 drivers/accel/ivpu/ivpu_drv.h                      |   56 +-
 drivers/accel/ivpu/ivpu_fw.c                       |   30 +-
 drivers/accel/ivpu/ivpu_fw.h                       |    2 +
 drivers/accel/ivpu/ivpu_gem.h                      |   13 +-
 drivers/accel/ivpu/ivpu_hw.c                       |  313 +++
 drivers/accel/ivpu/ivpu_hw.h                       |  243 +-
 drivers/accel/ivpu/ivpu_hw_37xx.c                  | 1065 --------
 drivers/accel/ivpu/ivpu_hw_37xx_reg.h              |   72 -
 drivers/accel/ivpu/ivpu_hw_40xx.c                  | 1250 ---------
 drivers/accel/ivpu/ivpu_hw_40xx_reg.h              |   94 +-
 drivers/accel/ivpu/ivpu_hw_btrs.c                  |  881 +++++++
 drivers/accel/ivpu/ivpu_hw_btrs.h                  |   46 +
 drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h          |  108 +
 drivers/accel/ivpu/ivpu_hw_btrs_mtl_reg.h          |   83 +
 drivers/accel/ivpu/ivpu_hw_ip.c                    | 1174 +++++++++
 drivers/accel/ivpu/ivpu_hw_ip.h                    |   36 +
 drivers/accel/ivpu/ivpu_ipc.c                      |   17 +-
 drivers/accel/ivpu/ivpu_ipc.h                      |    4 +-
 drivers/accel/ivpu/ivpu_job.c                      |  297 ++-
 drivers/accel/ivpu/ivpu_job.h                      |    2 +
 drivers/accel/ivpu/ivpu_jsm_msg.c                  |  259 +-
 drivers/accel/ivpu/ivpu_jsm_msg.h                  |   20 +-
 drivers/accel/ivpu/ivpu_mmu.c                      |   12 +-
 drivers/accel/ivpu/ivpu_ms.c                       |  309 +++
 drivers/accel/ivpu/ivpu_ms.h                       |   36 +
 drivers/accel/ivpu/ivpu_pm.c                       |    5 +
 drivers/accel/ivpu/ivpu_sysfs.c                    |   58 +
 drivers/accel/ivpu/ivpu_sysfs.h                    |   13 +
 drivers/accel/ivpu/vpu_jsm_api.h                   |   14 +-
 drivers/dma-buf/dma-fence-array.c                  |   10 +-
 drivers/dma-buf/dma-heap.c                         |    4 +-
 drivers/dma-buf/dma-resv.c                         |    7 +
 drivers/gpu/drm/Kconfig                            |   14 +
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
 drivers/gpu/drm/bridge/sii9234.c                   |    1 +
 drivers/gpu/drm/bridge/sil-sii8620.c               |    1 +
 drivers/gpu/drm/bridge/simple-bridge.c             |    5 -
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |    5 -
 drivers/gpu/drm/bridge/tc358767.c                  |   27 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |    5 -
 drivers/gpu/drm/ci/build-igt.sh                    |   41 +-
 drivers/gpu/drm/ci/build.sh                        |    9 +-
 drivers/gpu/drm/ci/build.yml                       |    1 +
 drivers/gpu/drm/ci/container.yml                   |   12 +-
 drivers/gpu/drm/ci/gitlab-ci.yml                   |   46 +-
 drivers/gpu/drm/ci/igt_runner.sh                   |    9 +-
 drivers/gpu/drm/ci/image-tags.yml                  |    2 +-
 drivers/gpu/drm/ci/lava-submit.sh                  |    4 +-
 drivers/gpu/drm/ci/test.yml                        |   17 +-
 drivers/gpu/drm/ci/testlist.txt                    | 2761 ----------------=
----
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
 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt    |   25 +-
 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt    |   15 +
 drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt    |    7 +
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
 drivers/gpu/drm/display/Kconfig                    |    7 +
 drivers/gpu/drm/display/Makefile                   |    2 +
 drivers/gpu/drm/display/drm_hdmi_helper.c          |   61 +
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  752 ++++++
 drivers/gpu/drm/drm_atomic.c                       |   11 +
 drivers/gpu/drm/drm_atomic_uapi.c                  |    4 +
 drivers/gpu/drm/drm_bridge.c                       |   42 -
 drivers/gpu/drm/drm_bridge_connector.c             |  107 +-
 drivers/gpu/drm/drm_connector.c                    |  194 ++
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
 drivers/gpu/drm/drm_panel_orientation_quirks.c     |    1 +
 drivers/gpu/drm/drm_panic.c                        |  286 +-
 drivers/gpu/drm/drm_print.c                        |   72 +-
 drivers/gpu/drm/drm_probe_helper.c                 |    8 +-
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
 drivers/gpu/drm/mgag200/Makefile                   |    2 +-
 drivers/gpu/drm/mgag200/mgag200_ddc.c              |  179 ++
 drivers/gpu/drm/mgag200/mgag200_ddc.h              |   11 +
 drivers/gpu/drm/mgag200/mgag200_drv.c              |   27 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h              |   18 +-
 drivers/gpu/drm/mgag200/mgag200_g200.c             |   11 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh.c           |   11 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c          |   11 +-
 drivers/gpu/drm/mgag200/mgag200_g200er.c           |   11 +-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c           |   11 +-
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c          |   11 +-
 drivers/gpu/drm/mgag200/mgag200_g200se.c           |   11 +-
 drivers/gpu/drm/mgag200/mgag200_g200wb.c           |   11 +-
 drivers/gpu/drm/mgag200/mgag200_i2c.c              |  129 -
 drivers/gpu/drm/mgag200/mgag200_mode.c             |   35 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |    8 +-
 drivers/gpu/drm/nouveau/dispnv50/head.c            |    8 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h  |    6 +
 drivers/gpu/drm/nouveau/nouveau_connector.c        |    2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |    6 +-
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
 drivers/gpu/drm/panel/panel-edp.c                  |   68 +-
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
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |   25 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h                |    1 +
 drivers/gpu/drm/xlnx/zynqmp_kms.h                  |    4 +-
 drivers/video/fbdev/core/fb_defio.c                |   82 +-
 include/drm/display/drm_dp_helper.h                |    2 +-
 include/drm/display/drm_hdmi_helper.h              |    4 +
 include/drm/display/drm_hdmi_state_helper.h        |   23 +
 include/drm/drm_bridge.h                           |   84 +-
 include/drm/drm_connector.h                        |  235 +-
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
 include/linux/fb.h                                 |    1 +
 include/linux/mfd/atmel-hlcdc.h                    |   10 +
 include/uapi/drm/amdgpu_drm.h                      |    9 +
 include/uapi/drm/drm_mode.h                        |    8 -
 include/uapi/drm/ivpu_accel.h                      |   69 +-
 include/uapi/drm/v3d_drm.h                         |   48 +
 include/uapi/linux/dma-heap.h                      |    2 +-
 lib/fonts/Kconfig                                  |   20 +-
 397 files changed, 18001 insertions(+), 11974 deletions(-)
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
 create mode 100644 drivers/gpu/drm/display/drm_hdmi_state_helper.c
 create mode 100644 drivers/gpu/drm/drm_fbdev_shmem.c
 rename drivers/gpu/drm/{drm_fbdev_generic.c =3D> drm_fbdev_ttm.c} (76%)
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_ddc.c
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_ddc.h
 delete mode 100644 drivers/gpu/drm/mgag200/mgag200_i2c.c
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

--xvw4elizvenxfeu3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZmqkfgAKCRDj7w1vZxhR
xTwJAQD9OzaKC0b+JOzGRb7bCMYIOulpMf2FQKL515vPh+7HgwEA9QnuK1EgDW/D
5YiBZMpXll39F2kPA+xp/DuOI9QFcgw=
=RvtR
-----END PGP SIGNATURE-----

--xvw4elizvenxfeu3--

