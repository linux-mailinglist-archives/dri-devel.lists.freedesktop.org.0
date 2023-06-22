Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F36EE739CA1
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 11:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11EC910E516;
	Thu, 22 Jun 2023 09:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9380210E510
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 09:22:45 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:991a:a831:ea4b:6058])
 by michel.telenet-ops.be with bizsmtp
 id C9NY2A00U1yfRTD069NYBU; Thu, 22 Jun 2023 11:22:41 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qCGWM-000BvC-U2;
 Thu, 22 Jun 2023 11:22:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qCGWO-003Vva-Fk;
 Thu, 22 Jun 2023 11:22:32 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 00/39] drm: renesas: shmobile: Atomic conversion + DT support
Date: Thu, 22 Jun 2023 11:21:12 +0200
Message-Id: <cover.1687423204.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

	Hi all,

It has been 3 years since the last conversion of a DRM driver to atomic
modesetting, so I guess it's time for another one? ;-)

Currently, there are two drivers for the LCD controller on Renesas
SuperH-based and ARM-based SH-Mobile and R-Mobile SoCs:
  1. sh_mobile_lcdcfb, using the fbdev framework,
  2. shmob_drm, using the DRM framework.
However, only the former driver is used, as all platform support
integrates the former.  None of these drivers support DT-based systems.

This patch series is a follow-up to [1] (which is already included in
drm-next).  It converts the SH-Mobile DRM driver to atomic modesetting,
and adds DT support, complemented by the customary set of fixes and
improvements.

Overview:
  - Patch 1 adds DT bindings for the SH-Mobile LCD controller,
  - Patch 2 adds definitions for RGB666 9:9 media bus formats,
  - Patches 3-33 contains miscellaneous fixes, improvements, and
    cleanups for the SH-Mobile DRM driver,
  - Patches 34-38 convert the SH-Mobile DRM driver to atomic
    modesetting,
  - Patch 39 adds DT support to the SH-Mobile DRM driver.

To reduce strain on the audience, I have CCed the DT and media people
only on the cover letter and the DT resp. media patches.  If interested,
the full series should be available through lore.kernel.org.

Some comments and questioned can be found in the individual patches.

This has been tested on the R-Mobile A1-based Atmark Techno
Armadillo-800-EVA development board, using both legacy[2] and
DT-based[3] instantiation, with the fbdev-emulated text console and
modetest, a.o.

    modetest -M shmob-drm -s 43:800x480@RG16 -P 33@41:640x320+80+80@RG16
    modetest -M shmob-drm -s 43:800x480@RG16

The output of "modetest -M shmob-drm" can be found below[4].

Thanks for your comments!

[1] "[PATCH v3 0/5] drm: shmobile: Fixes and enhancements"
    https://lore.kernel.org/r/cover.1684854992.git.geert+renesas@glider.be

[2] "[PATCH/RFC] staging: board: armadillo800eva: Add DRM support"
    https://lore.kernel.org/r/f7874a9da4bcb20fbc9cd133147b67862ebcf0b9.1687418281.git.geert+renesas@glider.be

[3] "[PATCH 0/2] ARM: dts: r8a7740/armadillo800eva: Add LCD support"
    https://lore.kernel.org/r/cover.1687417585.git.geert+renesas@glider.be

[4] Encoders:
    id	crtc	type	possible crtcs	possible clones	
    42	41	DPI	0x00000001	0x00000001

    Connectors:
    id	encoder	status		name		size (mm)	modes	encoders
    43	42	connected	DPI-1          	111x67		1	42
      modes:
	    index name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot
      #0 800x480 59.99 800 840 968 1056 480 515 517 525 33260 flags: nhsync, nvsync; type: preferred, driver
      props:
	    1 EDID:
		    flags: immutable blob
		    blobs:

		    value:
	    2 DPMS:
		    flags: enum
		    enums: On=0 Standby=1 Suspend=2 Off=3
		    value: 0
	    5 link-status:
		    flags: enum
		    enums: Good=0 Bad=1
		    value: 0
	    6 non-desktop:
		    flags: immutable range
		    values: 0 1
		    value: 0
	    4 TILE:
		    flags: immutable blob
		    blobs:

		    value:

    CRTCs:
    id	fb	pos	size
    41	44	(0,0)	(800x480)
      #0 800x480 59.99 800 840 968 1056 480 515 517 525 33260 flags: nhsync, nvsync; type: preferred, driver
      props:

    Planes:
    id	crtc	fb	CRTC x,y	x,y	gamma size	possible crtcs
    31	41	44	0,0		0,0	0       	0x00000001
      formats: RG16 RG24 AR24 XR24 NV12 NV21 NV16 NV61 NV24 NV42
      props:
	    8 type:
		    flags: immutable enum
		    enums: Overlay=0 Primary=1 Cursor=2
		    value: 1
	    30 IN_FORMATS:
		    flags: immutable blob
		    blobs:

		    value:
			    01000000000000000a00000018000000
			    01000000400000005247313652473234
			    41523234585232344e5631324e563231
			    4e5631364e5636314e5632344e563432
			    ff030000000000000000000000000000
			    0000000000000000
		    in_formats blob decoded:
			     RG16:  LINEAR
			     RG24:  LINEAR
			     AR24:  LINEAR
			     XR24:  LINEAR
			     NV12:  LINEAR
			     NV21:  LINEAR
			     NV16:  LINEAR
			     NV61:  LINEAR
			     NV24:  LINEAR
			     NV42:  LINEAR
    33	0	0	0,0		0,0	0       	0x00000001
      formats: RG16 RG24 AR24 XR24 NV12 NV21 NV16 NV61 NV24 NV42
      props:
	    8 type:
		    flags: immutable enum
		    enums: Overlay=0 Primary=1 Cursor=2
		    value: 0
	    30 IN_FORMATS:
		    flags: immutable blob
		    blobs:

		    value:
			    01000000000000000a00000018000000
			    01000000400000005247313652473234
			    41523234585232344e5631324e563231
			    4e5631364e5636314e5632344e563432
			    ff030000000000000000000000000000
			    0000000000000000
		    in_formats blob decoded:
			     RG16:  LINEAR
			     RG24:  LINEAR
			     AR24:  LINEAR
			     XR24:  LINEAR
			     NV12:  LINEAR
			     NV21:  LINEAR
			     NV16:  LINEAR
			     NV61:  LINEAR
			     NV24:  LINEAR
			     NV42:  LINEAR
    35	0	0	0,0		0,0	0       	0x00000001
      formats: RG16 RG24 AR24 XR24 NV12 NV21 NV16 NV61 NV24 NV42
      props:
	    8 type:
		    flags: immutable enum
		    enums: Overlay=0 Primary=1 Cursor=2
		    value: 0
	    30 IN_FORMATS:
		    flags: immutable blob
		    blobs:

		    value:
			    01000000000000000a00000018000000
			    01000000400000005247313652473234
			    41523234585232344e5631324e563231
			    4e5631364e5636314e5632344e563432
			    ff030000000000000000000000000000
			    0000000000000000
		    in_formats blob decoded:
			     RG16:  LINEAR
			     RG24:  LINEAR
			     AR24:  LINEAR
			     XR24:  LINEAR
			     NV12:  LINEAR
			     NV21:  LINEAR
			     NV16:  LINEAR
			     NV61:  LINEAR
			     NV24:  LINEAR
			     NV42:  LINEAR
    37	0	0	0,0		0,0	0       	0x00000001
      formats: RG16 RG24 AR24 XR24 NV12 NV21 NV16 NV61 NV24 NV42
      props:
	    8 type:
		    flags: immutable enum
		    enums: Overlay=0 Primary=1 Cursor=2
		    value: 0
	    30 IN_FORMATS:
		    flags: immutable blob
		    blobs:

		    value:
			    01000000000000000a00000018000000
			    01000000400000005247313652473234
			    41523234585232344e5631324e563231
			    4e5631364e5636314e5632344e563432
			    ff030000000000000000000000000000
			    0000000000000000
		    in_formats blob decoded:
			     RG16:  LINEAR
			     RG24:  LINEAR
			     AR24:  LINEAR
			     XR24:  LINEAR
			     NV12:  LINEAR
			     NV21:  LINEAR
			     NV16:  LINEAR
			     NV61:  LINEAR
			     NV24:  LINEAR
			     NV42:  LINEAR
    39	0	0	0,0		0,0	0       	0x00000001
      formats: RG16 RG24 AR24 XR24 NV12 NV21 NV16 NV61 NV24 NV42
      props:
	    8 type:
		    flags: immutable enum
		    enums: Overlay=0 Primary=1 Cursor=2
		    value: 0
	    30 IN_FORMATS:
		    flags: immutable blob
		    blobs:

		    value:
			    01000000000000000a00000018000000
			    01000000400000005247313652473234
			    41523234585232344e5631324e563231
			    4e5631364e5636314e5632344e563432
			    ff030000000000000000000000000000
			    0000000000000000
		    in_formats blob decoded:
			     RG16:  LINEAR
			     RG24:  LINEAR
			     AR24:  LINEAR
			     XR24:  LINEAR
			     NV12:  LINEAR
			     NV21:  LINEAR
			     NV16:  LINEAR
			     NV61:  LINEAR
			     NV24:  LINEAR
			     NV42:  LINEAR

    Frame buffers:
    id	size	pitch

Geert Uytterhoeven (34):
  dt-bindings: display: Add Renesas SH-Mobile LCDC bindings
  media: uapi: Add MEDIA_BUS_FMT_RGB666_2X9 variants
  drm: renesas: shmobile: Fix overlay plane disable
  drm: renesas: shmobile: Fix ARGB32 overlay format typo
  drm: renesas: shmobile: Correct encoder/connector types
  drm: renesas: shmobile: Add support for Runtime PM
  drm: renesas: shmobile: Restore indentation of
    shmob_drm_setup_clocks()
  drm: renesas: shmobile: Use %p4cc to print fourcc code
  drm: renesas: shmobile: Add missing YCbCr formats
  drm: renesas: shmobile: Improve shmob_drm_format_info table
  drm: renesas: shmobile: Improve error handling
  drm: renesas: shmobile: Convert to use devm_request_irq()
  drm: renesas: shmobile: Use drmm_universal_plane_alloc()
  drm: renesas: shmobile: Embed drm_device in shmob_drm_device
  drm: renesas: shmobile: Convert container helpers to static inline
    functions
  drm: renesas: shmobile: Replace .dev_private with container_of()
  drm: renesas: shmobile: Use media bus formats in platform data
  drm: renesas: shmobile: Move interface handling to connector setup
  drm: renesas: shmobile: Unify plane allocation
  drm: renesas: shmobile: Rename shmob_drm_crtc.crtc
  drm: renesas: shmobile: Rename shmob_drm_connector.connector
  drm: renesas: shmobile: Rename shmob_drm_plane.plane
  drm: renesas: shmobile: Use drm_crtc_handle_vblank()
  drm: renesas: shmobile: Move shmob_drm_crtc_finish_page_flip()
  drm: renesas: shmobile: Wait for page flip when turning CRTC off
  drm: renesas: shmobile: Turn vblank on/off when enabling/disabling
    CRTC
  drm: renesas: shmobile: Shutdown the display on remove
  drm: renesas: shmobile: Cleanup encoder
  drm: renesas: shmobile: Atomic conversion part 1
  drm: renesas: shmobile: Atomic conversion part 2
  drm: renesas: shmobile: Use suspend/resume helpers
  drm: renesas: shmobile: Remove internal CRTC state tracking
  drm: renesas: shmobile: Atomic conversion part 3
  drm: renesas: shmobile: Add DT support

Laurent Pinchart (5):
  drm: renesas: shmobile: Remove backlight support
  drm: renesas: shmobile: Don't set display info width and height twice
  drm: renesas: shmobile: Rename input clocks
  drm: renesas: shmobile: Remove support for SYS panels
  drm: renesas: shmobile: Use struct videomode in platform data

 .../display/renesas,shmobile-lcdc.yaml        | 108 +++
 .../media/v4l/subdev-formats.rst              | 144 ++++
 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/renesas/shmobile/Makefile     |   3 +-
 .../renesas/shmobile/shmob_drm_backlight.c    |  82 ---
 .../renesas/shmobile/shmob_drm_backlight.h    |  19 -
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 666 +++++++++---------
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.h |  27 +-
 .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  | 153 ++--
 .../gpu/drm/renesas/shmobile/shmob_drm_drv.h  |  18 +-
 .../gpu/drm/renesas/shmobile/shmob_drm_kms.c  |  77 +-
 .../gpu/drm/renesas/shmobile/shmob_drm_kms.h  |   9 +-
 .../drm/renesas/shmobile/shmob_drm_plane.c    | 386 +++++-----
 .../drm/renesas/shmobile/shmob_drm_plane.h    |   4 +-
 include/linux/platform_data/shmob_drm.h       |  57 +-
 include/uapi/linux/media-bus-format.h         |   4 +-
 16 files changed, 965 insertions(+), 793 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/renesas,shmobile-lcdc.yaml
 delete mode 100644 drivers/gpu/drm/renesas/shmobile/shmob_drm_backlight.c
 delete mode 100644 drivers/gpu/drm/renesas/shmobile/shmob_drm_backlight.h

Cc: Rob Herring <robh+dt@kernel.org>"
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>"
Cc: Conor Dooley <conor+dt@kernel.org>"
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>"
Cc: devicetree@vger.kernel.org"
Cc: linux-media@vger.kernel.org"
-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
