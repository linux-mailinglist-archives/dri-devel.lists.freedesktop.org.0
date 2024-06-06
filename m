Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE848FE4EA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 13:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE24810E8F2;
	Thu,  6 Jun 2024 11:11:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WYpRSKio";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540B510E8DE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 11:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717672260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=5dVNRcDgYWQBYAViE2BLqBl4T2thw3BmGb+Vl3qZs7w=;
 b=WYpRSKioScgN+Qu5rD35L4okXC3w7PgPEPrd48UmFfWCUUhC/51pd9JQRzINtLcJ2di5gm
 Q/L0XfS79Jhm96/pK+cG+r1w4dL1SHcByc7r7Fqag6O6QSgTFI0qm5K4RYj7THiKxaThVY
 KRbNS6+8mf30dmX96CW+Oe1U5RhWLIk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-XU2bsPAHORek3eCKoMOz3w-1; Thu, 06 Jun 2024 07:10:58 -0400
X-MC-Unique: XU2bsPAHORek3eCKoMOz3w-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-35e0e59dcf7so587577f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2024 04:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717672257; x=1718277057;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5dVNRcDgYWQBYAViE2BLqBl4T2thw3BmGb+Vl3qZs7w=;
 b=UdkRX25A8NSx5M5Hz2CjBhnWzV+lGpPXxeHA6Y3aEk2XEFdtKh6t5CX8QIkvlTI4OG
 MpFu9PPhZgLoAJpNzOQKLeAByxwqHrbQulHK8TI1Ozxit2NaWIe90wiaR//BYOZKCHTE
 6LAn0yEhXu8+PToTIepp/Ebf/ffoEbKiVD908QSOBB02McOMvVzunJJPa/q4c7BkX1+X
 PkPuKRLPtYPs/8d5OUqYgFNVVr0YgH1I8Lb1LPltp3BuzKMLGyqiX9GPJhGM/9umfS5V
 G1NG/E3xLFS8L8BTGYBJjg03LoBlOESR575EoJ9YeKW2d3Ywm1tCwHhkgkMAnRzsYIib
 UI3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGfLagBs5o9JQuRI5YSwy2wnUjV0zMb3wZnwmK5q0m1bWEmTXANmTQaCmqrCm6YYK4Ka1IFALgya8atEb0P+9hz3l9usI+7u4ookl4ggiS
X-Gm-Message-State: AOJu0YwFsKeyJvMAXfbwLxbl2ztVUzJcikBNNPRP/o7gAtza6vuVgmj2
 E10+Behy+l0sulKG4q2FaoEfHRx6r6YuCjmAzvoOMITsX/pYHENNZEomOcmgefdAdO2SSycFPD4
 SWlpxXVop1zC1RqzV26LAGq5tXdgXzO4C6o64DIDyTzjH8/VIdHHotHS4ZoIq3qltKg==
X-Received: by 2002:a5d:64ce:0:b0:35a:6422:efc5 with SMTP id
 ffacd0b85a97d-35e8ef7ef36mr4758348f8f.54.1717672256560; 
 Thu, 06 Jun 2024 04:10:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrlhpP6DcAre5MxJZgYP8qsgNRuCSYsUwICPcvBeyK8PDvqa+WokPlHfoAzEhRZPuZwvpqPw==
X-Received: by 2002:a5d:64ce:0:b0:35a:6422:efc5 with SMTP id
 ffacd0b85a97d-35e8ef7ef36mr4758314f8f.54.1717672255877; 
 Thu, 06 Jun 2024 04:10:55 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5d4cbb4sm1274136f8f.44.2024.06.06.04.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jun 2024 04:10:55 -0700 (PDT)
Date: Thu, 6 Jun 2024 13:10:54 +0200
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
Message-ID: <20240606-vivid-amphibian-jackrabbit-40b1d1@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ad5qpn6cw2bbmwo5"
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


--ad5qpn6cw2bbmwo5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Here's this week drm-misc-next PR.

It has the fix for the v3d build issue, so it should be safe to merge
it, together with last week's PR content.

Thanks!
Maxime

drm-misc-next-2024-06-06:
drm-misc-next for 6.10:

UAPI Changes:

Cross-subsystem Changes:
  - dma-buf: Warn when reserving 0 fence slots, internal API
    enhancements for heaps

Core Changes:

Driver Changes:
  - atmel-hlcdc: Support XLCDC in sam9x7
  - msm: Validate registers XML description against schema in CI
  - v3d: Fix build warning
  - bridges:
    - analogix_dp: Various improvements
  - panels:
    - New panel: WL-355608-A8
The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-202=
4-06-06

for you to fetch changes up to 310ec03841a36e3f45fb528f0dfdfe5b9e84b037:

  dma-buf: align fd_flags and heap_flags with dma_heap_allocation_data (202=
4-06-05 14:52:15 +0530)

----------------------------------------------------------------
drm-misc-next for 6.10:

UAPI Changes:

Cross-subsystem Changes:
  - dma-buf: Warn when reserving 0 fence slots, internal API
    enhancements for heaps

Core Changes:

Driver Changes:
  - atmel-hlcdc: Support XLCDC in sam9x7
  - msm: Validate registers XML description against schema in CI
  - v3d: Fix build warning
  - bridges:
    - analogix_dp: Various improvements
  - panels:
    - New panel: WL-355608-A8

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

Dmitry Baryshkov (8):
      drm/panel: lg-sw43408: add missing error handling
      drm/mipi-dsi: wrap more functions for streamline handling
      drm/panel: boe-tv101wum-nl6: use wrapped MIPI DCS functions
      drm/panel: ilitek-ili9882t: use wrapped MIPI DCS functions
      drm/panel: innolux-p079zca: use mipi_dsi_dcs_nop_multi()
      drm/panel: novatek-nt36672e: use wrapped MIPI DCS functions
      drm/panel: lg-sw43408: use new streamlined MIPI DSI API
      drm/ci: validate drm/msm XML register files against schema

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

Durai Manickam KR (1):
      drm: atmel-hlcdc: Define XLCDC specific registers

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

Ryan Walklin (2):
      dt-bindings: display: panel: Add WL-355608-A8 panel
      drm: panel: nv3052c: Add WL-355608-A8 panel

Sam Ravnborg (1):
      MAINTAINERS: drm: Drop sam as panel reviewer

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

Tvrtko Ursulin (1):
      drm/v3d: Fix perfmon build error/warning

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
 .../panel/panel-simple-lvds-dual-ports.yaml        |    6 +
 .../bindings/display/panel/panel-simple.yaml       |   56 -
 .../bindings/display/panel/samsung,atna33xc20.yaml |   95 +
 .../bindings/display/panel/sharp,ld-d5116z01b.yaml |   30 -
 .../bindings/display/panel/wl-355608-a8.yaml       |   60 +
 .../display/rockchip/rockchip,dw-mipi-dsi.yaml     |    2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    4 +
 Documentation/gpu/drm-internals.rst                |   10 +-
 Documentation/gpu/drm-kms-helpers.rst              |   12 +-
 Documentation/gpu/kms-properties.csv               |    2 -
 Documentation/gpu/todo.rst                         |   31 +-
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
 drivers/gpu/drm/bridge/ite-it6505.c                |   86 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |    5 -
 .../drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   |    5 -
 drivers/gpu/drm/bridge/nxp-ptn3460.c               |    5 -
 drivers/gpu/drm/bridge/panel.c                     |    5 -
 drivers/gpu/drm/bridge/simple-bridge.c             |    5 -
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |    5 -
 drivers/gpu/drm/bridge/tc358767.c                  |   23 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |    5 -
 drivers/gpu/drm/ci/build.sh                        |    3 +
 drivers/gpu/drm/ci/build.yml                       |    1 +
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
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c    |  225 ++
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
 include/linux/mfd/atmel-hlcdc.h                    |   10 +
 include/uapi/drm/amdgpu_drm.h                      |    9 +
 include/uapi/drm/drm_mode.h                        |    8 -
 include/uapi/drm/ivpu_accel.h                      |   69 +-
 include/uapi/drm/v3d_drm.h                         |   48 +
 include/uapi/linux/dma-heap.h                      |    2 +-
 lib/fonts/Kconfig                                  |   20 +-
 276 files changed, 15776 insertions(+), 7866 deletions(-)
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

--ad5qpn6cw2bbmwo5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZmGZPgAKCRAnX84Zoj2+
dhxWAYDhIyeIFUe6OGvue0a6qgKRRPtYCCIJnEFdq0S/qhI8TnYSPeV580TWhI5r
poyH0NwBegI2bCDtuVl3KzSgilGPMGLwdRAwU37L4xwQcVruEH2CXGnvuCUQAh4y
G6irHaT52g==
=RHDD
-----END PGP SIGNATURE-----

--ad5qpn6cw2bbmwo5--

