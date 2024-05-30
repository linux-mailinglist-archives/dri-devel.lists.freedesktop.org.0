Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 413CB8D49A1
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 12:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F21510E05C;
	Thu, 30 May 2024 10:26:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="i16ghgus";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7632A10E05C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 10:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717064797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=MByii4eFvgwgG6gllodWoRgKhRjIjy0CPjLPrRcVVzE=;
 b=i16ghgus2bZC9KuPH8Oe2hsDQGtN2HC8kq/+loYljfhzoCr4KqbM2AkeVdk1VdF8zDzDea
 YzZpJksvpmlVKcdP9W5AVJx8Xpi/hEa4V9jA3qr3290W7sCeVRHIpmaFukDRptzqNdeXqh
 fou8cNGXLUnwEgBe+YuEQqTdVmKMjg0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-nZjZv2dDNH2aP3_Y_YcCjw-1; Thu, 30 May 2024 06:26:35 -0400
X-MC-Unique: nZjZv2dDNH2aP3_Y_YcCjw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-357766bb14fso529141f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 03:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717064794; x=1717669594;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MByii4eFvgwgG6gllodWoRgKhRjIjy0CPjLPrRcVVzE=;
 b=samG7weizTDq5E/cq8AOruqApPNSRqmaal0Mn/KzXYMWoXj6t8r93qKpSNY8emtADt
 rfl7HdodfVOhMlpkGR0bfI5qrErs9a3kz0uPxGH4SfMehqDc501wjfOh3MNUYC4lqIGP
 rG8nehvV+qCAe61iV6uXl0g3GMSdzW0UMt52kz6XV/qHl8xEDzBWx9dMtP543wdTE0dx
 exe+oc2QIgQLPlUC869AAOUkpIuONShgGXS4cr2sLs4iAT+0WNWtcvXJ3WCovkRzFqhW
 fss89yUbXXc6Yp/CVVLb9BxHDdKDKProFOD3z+yHMlhUMVMd1+yG9HoKRPT+w87RhLRp
 31rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt3hlvLe4OXSvlcVsQvcd86n57NZ+lf9GVbqjjs57KKOFINBdsGq36Q9T7pxXuZW817PVGe9Wcbk/eYWaBtukFDIrXusflhwSq7VwVJrbc
X-Gm-Message-State: AOJu0YwTibimzcWAAhnW5KIH1rmAXwmcqYCghr1Vy05DlFXlBRLf6Rmg
 /AejiRhrQ/vLmZz4dgifMzwcne7kcaLgBCjBLi1APna8xHAIDO+ajMjD+0sKIL5ePPSffQzAIYE
 a3CchapA6ubUUcEbmMQWH8sJYaI20Ob3qrp8dXXBv2olupYsCjnZRFn8MDt/4ZX5Dcg==
X-Received: by 2002:a05:6000:bca:b0:35a:9bce:4722 with SMTP id
 ffacd0b85a97d-35dc009a4c4mr1151078f8f.30.1717064793574; 
 Thu, 30 May 2024 03:26:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU0F//KTjKGYOll3UuDlW9Npcs//Xljx2Jrsw1JyEHfMzWnXHZSUG5j1yNujh7Jt4VLwBNXw==
X-Received: by 2002:a05:6000:bca:b0:35a:9bce:4722 with SMTP id
 ffacd0b85a97d-35dc009a4c4mr1151054f8f.30.1717064792844; 
 Thu, 30 May 2024 03:26:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3557a1c9530sm16982098f8f.81.2024.05.30.03.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 03:26:32 -0700 (PDT)
Date: Thu, 30 May 2024 12:26:32 +0200
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
Message-ID: <20240530-hilarious-flat-magpie-5fa186@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="vqjsa2enejcntlin"
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


--vqjsa2enejcntlin
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Here's the first drm-misc-next PR for 6.11

Maxime

drm-misc-next-2024-05-30:
drm-misc-next for 6.11:

UAPI Changes:
  - Deprecate DRM date and return a 0 date in DRM_IOCTL_VERSION

Core Changes:
  - connector: Create a set of helpers to help with HDMI support
  - fbdev: Create memory manager optimized fbdev emulation
  - panic: Allow to select fonts, improve drm_fb_dma_get_scanout_buffer

Driver Changes:
  - Remove driver owner assignments
  - Allow more drivers to compile with COMPILE_TEST
  - Conversions to drm_edid
  - ivpu: hardware scheduler support, profiling support, improvements
    to the platform support layer
  - mgag200: general reworks and improvements
  - nouveau: Add NVreg_RegistryDwords command line option
  - rockchip: Conversion to the hdmi helpers
  - sun4i: Conversion to the hdmi helpers
  - vc4: Conversion to the hdmi helpers
  - v3d: Perf counters improvements
  - zynqmp: IRQ and debugfs improvements
  - bridge:
    - Remove redundant checks on bridge->encoder
  - panels:
    - Switch panels from register table initialization to proper code
    - Now that the panel code tracks the panel state, remove every
      ad-hoc implementation in the panel drivers
    - New panels: Lincoln Tech Sol LCD185-101CT, Microtips Technology
      13-101HIEBCAF0-C, Microtips Technology MF-103HIEB0GA0, BOE
      nv110wum-l60, IVO t109nw41
The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-202=
4-05-30

for you to fetch changes up to 0c02cebc7fe943f92dae0e61628a7723fe1739b7:

  drm/display: Fix HDMI state helper dependency (2024-05-29 11:37:03 +0200)

----------------------------------------------------------------
drm-misc-next for 6.11:

UAPI Changes:
  - Deprecate DRM date and return a 0 date in DRM_IOCTL_VERSION

Core Changes:
  - connector: Create a set of helpers to help with HDMI support
  - fbdev: Create memory manager optimized fbdev emulation
  - panic: Allow to select fonts, improve drm_fb_dma_get_scanout_buffer

Driver Changes:
  - Remove driver owner assignments
  - Allow more drivers to compile with COMPILE_TEST
  - Conversions to drm_edid
  - ivpu: hardware scheduler support, profiling support, improvements
    to the platform support layer
  - mgag200: general reworks and improvements
  - nouveau: Add NVreg_RegistryDwords command line option
  - rockchip: Conversion to the hdmi helpers
  - sun4i: Conversion to the hdmi helpers
  - vc4: Conversion to the hdmi helpers
  - v3d: Perf counters improvements
  - zynqmp: IRQ and debugfs improvements
  - bridge:
    - Remove redundant checks on bridge->encoder
  - panels:
    - Switch panels from register table initialization to proper code
    - Now that the panel code tracks the panel state, remove every
      ad-hoc implementation in the panel drivers
    - New panels: Lincoln Tech Sol LCD185-101CT, Microtips Technology
      13-101HIEBCAF0-C, Microtips Technology MF-103HIEB0GA0, BOE
      nv110wum-l60, IVO t109nw41

----------------------------------------------------------------
Abhinav Kumar (1):
      drm: ci: fix the xfails for apq8016

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

Chaitanya Kumar Borah (1):
      nouveau: Add missing break statement

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

Dmitry Baryshkov (7):
      drm/panel: lg-sw43408: add missing error handling
      drm/mipi-dsi: wrap more functions for streamline handling
      drm/panel: boe-tv101wum-nl6: use wrapped MIPI DCS functions
      drm/panel: ilitek-ili9882t: use wrapped MIPI DCS functions
      drm/panel: innolux-p079zca: use mipi_dsi_dcs_nop_multi()
      drm/panel: novatek-nt36672e: use wrapped MIPI DCS functions
      drm/panel: lg-sw43408: use new streamlined MIPI DSI API

Douglas Anderson (44):
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

Faiz Abbas (2):
      drm/arm/komeda: Fix komeda probe failing if there are no links in the=
 secondary pipeline
      drm/arm/komeda: Move pipeline prints to after the entire pipeline has=
 been enabled

Haikun Zhou (1):
      drm/panel-edp: Add CMN N116BCJ-EAK

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

Jiapeng Chong (1):
      drm/vmwgfx: Remove duplicate vmwgfx_vkms.h header

Jocelyn Falempe (4):
      drm/fb_dma: Add checks in drm_fb_dma_get_scanout_buffer()
      lib/fonts: Allow to select fonts for drm_panic
      Revert "drm/mgag200: Add a workaround for low-latency"
      drm/mgag200: Add an option to disable Write-Combine

Krzysztof Kozlowski (4):
      drm/tiny: ili9225: drop driver owner assignment
      drm/tiny: mi0283qt: drop driver owner assignment
      drm/tiny: panel-mipi-dbi: drop driver owner assignment
      drm/tiny: st7586: drop driver owner assignment

Kuro Chung (1):
      drm/bridge: it6505: fix hibernate to resume no display issue

Luca Ceresoli (1):
      Revert "drm/bridge: ti-sn65dsi83: Fix enable error path"

Marek Vasut (1):
      drm/bridge: tc358767: Enable FRMSYNC timing generator

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

Pin-yen Lin (2):
      drm/panel-edp: Add support for several panels
      drm/panel-edp: Add more panels with conservative timings

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

 .../bindings/display/panel/boe,tv101wum-nl6.yaml   |    2 -
 .../bindings/display/panel/himax,hx83102.yaml      |   77 +
 .../bindings/display/panel/panel-edp-legacy.yaml   |  127 +
 .../panel/panel-simple-lvds-dual-ports.yaml        |    6 +
 .../bindings/display/panel/panel-simple.yaml       |   56 -
 .../bindings/display/panel/samsung,atna33xc20.yaml |   95 +
 .../bindings/display/panel/sharp,ld-d5116z01b.yaml |   30 -
 .../display/rockchip/rockchip,dw-mipi-dsi.yaml     |    2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    4 +
 Documentation/gpu/drm-internals.rst                |   10 +-
 Documentation/gpu/drm-kms-helpers.rst              |   12 +-
 Documentation/gpu/kms-properties.csv               |    2 -
 Documentation/gpu/todo.rst                         |   31 +-
 MAINTAINERS                                        |    2 +-
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
 drivers/gpu/drm/Kconfig                            |    1 +
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
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |    5 -
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |   20 +-
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |   28 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |   20 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   36 +-
 drivers/gpu/drm/bridge/analogix/anx7625.h          |   10 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |    5 -
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c        |    5 -
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |    5 -
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |    5 -
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |    5 -
 drivers/gpu/drm/bridge/ite-it6505.c                |   86 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |    5 -
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |    5 -
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |    5 -
 drivers/gpu/drm/bridge/panel.c                     |    5 -
 drivers/gpu/drm/bridge/simple-bridge.c             |    5 -
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |    5 -
 drivers/gpu/drm/bridge/tc358767.c                  |   23 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |    5 -
 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt    |   13 +-
 drivers/gpu/drm/display/Kconfig                    |    7 +
 drivers/gpu/drm/display/Makefile                   |    2 +
 drivers/gpu/drm/display/drm_hdmi_helper.c          |   61 +
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  716 +++++
 drivers/gpu/drm/drm_atomic.c                       |   11 +
 drivers/gpu/drm/drm_atomic_uapi.c                  |    4 +
 drivers/gpu/drm/drm_bridge.c                       |    5 -
 drivers/gpu/drm/drm_connector.c                    |  194 ++
 drivers/gpu/drm/drm_crtc_internal.h                |    2 +
 drivers/gpu/drm/drm_debugfs.c                      |  156 +-
 drivers/gpu/drm/drm_drv.c                          |    6 +-
 drivers/gpu/drm/drm_edid.c                         |   61 +-
 drivers/gpu/drm/drm_fb_helper.c                    |   11 +-
 drivers/gpu/drm/drm_fbdev_dma.c                    |   66 +-
 drivers/gpu/drm/drm_fbdev_shmem.c                  |  317 +++
 .../drm/{drm_fbdev_generic.c =3D> drm_fbdev_ttm.c}   |   80 +-
 drivers/gpu/drm/drm_ioctl.c                        |    5 +-
 drivers/gpu/drm/drm_mipi_dsi.c                     |  322 +++
 drivers/gpu/drm/drm_mode_object.c                  |    1 +
 drivers/gpu/drm/drm_probe_helper.c                 |    8 +-
 drivers/gpu/drm/drm_sysfs.c                        |   24 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c              |    2 +-
 drivers/gpu/drm/gud/gud_drv.c                      |    4 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |    4 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c   |   17 +-
 drivers/gpu/drm/hisilicon/kirin/Kconfig            |    2 +-
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |   11 +-
 drivers/gpu/drm/hisilicon/kirin/dw_dsi_reg.h       |    2 +
 drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h    |    2 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |    4 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c            |    4 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |   19 +-
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c                |   24 +-
 drivers/gpu/drm/imx/ipuv3/imx-tve.c                |   14 +-
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c                |    4 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |    4 +-
 drivers/gpu/drm/loongson/Kconfig                   |    1 +
 drivers/gpu/drm/loongson/lsdc_drv.c                |    4 +-
 drivers/gpu/drm/loongson/lsdc_output_7a1000.c      |   15 +-
 drivers/gpu/drm/loongson/lsdc_output_7a2000.c      |   15 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |    4 +-
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
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     | 2745 ++++++++++------=
----
 drivers/gpu/drm/panel/panel-edp.c                  |   68 +-
 drivers/gpu/drm/panel/panel-himax-hx83102.c        |  706 +++++
 drivers/gpu/drm/panel/panel-himax-hx8394.c         |    3 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       |    7 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c      |  764 +++---
 drivers/gpu/drm/panel/panel-innolux-p079zca.c      |  318 +--
 drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c |   48 -
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c |   28 -
 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c |   28 -
 drivers/gpu/drm/panel/panel-lg-sw43408.c           |   74 +-
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c     |   29 -
 drivers/gpu/drm/panel/panel-novatek-nt36672e.c     |  643 +++--
 drivers/gpu/drm/panel/panel-raydium-rm692e5.c      |   10 -
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c   |   36 -
 drivers/gpu/drm/panel/panel-simple.c               |  156 +-
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      |   35 +-
 drivers/gpu/drm/panel/panel-sony-acx565akm.c       |    6 -
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
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   83 +-
 drivers/gpu/drm/tests/Makefile                     |    1 +
 drivers/gpu/drm/tests/drm_connector_test.c         | 1051 +++++++-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 1743 +++++++++++++
 drivers/gpu/drm/tests/drm_kunit_edid.h             |  484 ++++
 drivers/gpu/drm/tiny/bochs.c                       |   27 +-
 drivers/gpu/drm/tiny/cirrus.c                      |    4 +-
 drivers/gpu/drm/tiny/gm12u320.c                    |    4 +-
 drivers/gpu/drm/tiny/hx8357d.c                     |    4 +-
 drivers/gpu/drm/tiny/ili9163.c                     |    4 +-
 drivers/gpu/drm/tiny/ili9225.c                     |    5 +-
 drivers/gpu/drm/tiny/ili9341.c                     |    4 +-
 drivers/gpu/drm/tiny/ili9486.c                     |    4 +-
 drivers/gpu/drm/tiny/mi0283qt.c                    |    5 +-
 drivers/gpu/drm/tiny/ofdrm.c                       |    4 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c              |    5 +-
 drivers/gpu/drm/tiny/repaper.c                     |    4 +-
 drivers/gpu/drm/tiny/simpledrm.c                   |    4 +-
 drivers/gpu/drm/tiny/st7586.c                      |    5 +-
 drivers/gpu/drm/tiny/st7735r.c                     |    4 +-
 drivers/gpu/drm/udl/Makefile                       |    8 +-
 drivers/gpu/drm/udl/udl_drv.c                      |    4 +-
 drivers/gpu/drm/udl/udl_drv.h                      |   12 +-
 drivers/gpu/drm/udl/udl_edid.c                     |   80 +
 drivers/gpu/drm/udl/udl_edid.h                     |   15 +
 drivers/gpu/drm/udl/udl_modeset.c                  |  142 +-
 drivers/gpu/drm/v3d/v3d_drv.c                      |   11 +
 drivers/gpu/drm/v3d/v3d_drv.h                      |   14 +-
 drivers/gpu/drm/v3d/v3d_perfmon.c                  |   36 +-
 drivers/gpu/drm/v3d/v3d_performance_counters.h     |  208 ++
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
 include/drm/display/drm_hdmi_state_helper.h        |   22 +
 include/drm/drm_connector.h                        |  235 +-
 include/drm/drm_drv.h                              |    2 +-
 include/drm/drm_edid.h                             |    4 -
 include/drm/drm_fbdev_generic.h                    |   15 -
 include/drm/drm_fbdev_shmem.h                      |   15 +
 include/drm/drm_fbdev_ttm.h                        |   15 +
 include/drm/drm_mipi_dsi.h                         |  122 +-
 include/drm/drm_mode_config.h                      |    4 +-
 include/linux/dma-fence-array.h                    |    3 +
 include/linux/fb.h                                 |    1 +
 include/uapi/drm/amdgpu_drm.h                      |    9 +
 include/uapi/drm/drm_mode.h                        |    8 -
 include/uapi/drm/ivpu_accel.h                      |   69 +-
 include/uapi/drm/v3d_drm.h                         |   48 +
 lib/fonts/Kconfig                                  |   20 +-
 262 files changed, 14732 insertions(+), 7498 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,h=
x83102.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-e=
dp-legacy.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung=
,atna33xc20.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,l=
d-d5116z01b.yaml
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

--vqjsa2enejcntlin
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZlhUVwAKCRAnX84Zoj2+
dtVnAYDBEGimi6e11y4dCL9NrgG9U6k1Zx0Tvvm1j1q+dllnng2kmy0g83UdUoHn
wZKlvE8BgJfFKsz89eCuYAL+x8bzd4RowSQYJSS7Ic/RWH2G4UPOg/5SDRj8m0+F
+uhUQaKNEg==
=UDRe
-----END PGP SIGNATURE-----

--vqjsa2enejcntlin--

