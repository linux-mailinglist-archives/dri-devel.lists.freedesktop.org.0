Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49001582A4F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 18:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A5212A991;
	Wed, 27 Jul 2022 16:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 95E2E91D9B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 16:08:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,195,1654527600"; d="scan'208";a="127555112"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 28 Jul 2022 01:08:00 +0900
Received: from localhost.localdomain (unknown [10.226.92.195])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id C566540183E9;
 Thu, 28 Jul 2022 01:07:56 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH v5 00/10] Add RZ/G2L Display support
Date: Wed, 27 Jul 2022 17:07:43 +0100
Message-Id: <20220727160753.1774761-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RZ/G2L LCD controller composed of Frame compression Processor(FCPVD),
Video signal processor (VSPD) and Display unit(DU). The output of LCDC is
connected to Display parallel interface and MIPI link video interface.

This patch series aims to add basic display support on RZ/G2L SMARC EVK
platform. The output from DSI is connected to ADV7535.

The DU controller is similar to R-Car as it is connected to VSPD,
so most of code is based on R-Car with new CRTC/DRM driver specific to
RZ/G2L.

Basic RCar DU lib created for kms, vsp and encoder drivers[1].

This patch series enhances the RCar DU libs and RZ/G2L started using
this libs and there by code size is reduced to almost 50%.

Further enhancement possible by sharing common code for DRM and CRTC.

Note:-
This patch series depend upon [1]
[1] https://lore.kernel.org/dri-devel/20220726164208.1048444-1-biju.das.jz@bp.renesas.com/T/#t

v4->v5:
 * Added Rb tag from Rob for binding patch.
 * Started using RCar DU libs(kms, vsp and encoder)
 * Started using rcar_du_device, rcar_du_write, rcar_du_crtc,
   rcar_du_format_info and rcar_du_encoder.
v3->v4:
 * Changed compatible name from renesas,du-r9a07g044->renesas,r9a07g044-du
 * started using same compatible for RZ/G2{L,LC}
 * Removed rzg2l_du_group.h and struct rzg2l_du_group
 * Renamed __rzg2l_du_group_start_stop->rzg2l_du_start_stop
 * Removed rzg2l_du_group_restart
 * Updated rzg2l_du_crtc_set_display_timing
 * Removed mode_valid callback.
 * Updated rzg2l_du_crtc_create() parameters
 * Updated compatible
 * Removed RZG2L_DU_MAX_GROUPS
V2->v3:
 * Added new bindings for RZ/G2L DU
 * Removed indirection and created new DRM driver based on R-Car DU
v1->v2:
 * Based on [1], all references to 'rzg2l_lcdc' replaced with 'rzg2l_du'
 * Updated commit description for bindings
 * Removed LCDC references from bindings
 * Changed clock name from du.0->aclk from bindings
 * Changed reset name from du.0->du from bindings
 * Replaced crtc_helper_funcs->rcar_crtc_helper_funcs
 * Updated macro DRM_RZG2L_LCDC->DRM_RZG2L_DU
 * Replaced rzg2l-lcdc-drm->rzg2l-du-drm
 * Added forward declaration for struct reset_control

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220312084205.31462-2-biju.das.jz@bp.renesas.com/

RFC->v1:
 * Changed  minItems->maxItems for renesas,vsps.
 * Added RZ/G2L LCDC driver with special handling for CRTC reusing
   most of RCar DU code
 * Fixed the comments for num_rpf from rpf's->RPFs/ and vsp->VSP.
RFC:
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-18-biju.das.jz@bp.renesas.com/
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-12-biju.das.jz@bp.renesas.com/
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-13-biju.das.jz@bp.renesas.com/
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-19-biju.das.jz@bp.renesas.com/

Modetest output:-
root@smarc-rzg2l:~# modetest -M rzg2l-du
Encoders:
id      crtc    type    possible crtcs  possible clones
41      40      none    0x00000001      0x00000001
43      0       Virtual 0x00000001      0x00000002

Connectors:
id      encoder status          name            size (mm)       modes   encoders
42      41      connected       HDMI-A-1        520x320         29      41
  modes:
        index name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot)
  #0 1920x1080 59.72 1920 1968 2000 2080 1080 1082 1087 1111 138000 flags: phsync, nvsync; type: preferred, driver
  #1 1920x1080 60.00 1920 2008 2052 2200 1080 1084 1089 1125 148500 flags: phsync, pvsync; type: driver
  #2 1920x1080 59.94 1920 2008 2052 2200 1080 1084 1089 1125 148352 flags: phsync, pvsync; type: driver
  #3 1920x1080 59.94 1920 2008 2052 2200 1080 1084 1089 1125 148352 flags: phsync, pvsync; type: driver
  #4 1280x1024 75.02 1280 1296 1440 1688 1024 1025 1028 1066 135000 flags: phsync, pvsync; type: driver
  #5 1280x1024 60.02 1280 1328 1440 1688 1024 1025 1028 1066 108000 flags: phsync, pvsync; type: driver
  #6 1152x864 75.00 1152 1216 1344 1600 864 865 868 900 108000 flags: phsync, pvsync; type: driver
  #7 1280x720 60.00 1280 1390 1430 1650 720 725 730 750 74250 flags: phsync, pvsync; type: driver
  #8 1280x720 59.94 1280 1390 1430 1650 720 725 730 750 74176 flags: phsync, pvsync; type: driver
  #9 1280x720 50.00 1280 1720 1760 1980 720 725 730 750 74250 flags: phsync, pvsync; type: driver
  #10 1280x720 50.00 1280 1720 1760 1980 720 725 730 750 74250 flags: phsync, pvsync; type: driver
  #11 1024x768 75.03 1024 1040 1136 1312 768 769 772 800 78750 flags: phsync, pvsync; type: driver
  #12 1024x768 70.07 1024 1048 1184 1328 768 771 777 806 75000 flags: nhsync, nvsync; type: driver
  #13 1024x768 60.00 1024 1048 1184 1344 768 771 777 806 65000 flags: nhsync, nvsync; type: driver
  #14 832x624 74.55 832 864 928 1152 624 625 628 667 57284 flags: nhsync, nvsync; type: driver
  #15 800x600 75.00 800 816 896 1056 600 601 604 625 49500 flags: phsync, pvsync; type: driver
  #16 800x600 72.19 800 856 976 1040 600 637 643 666 50000 flags: phsync, pvsync; type: driver
  #17 800x600 60.32 800 840 968 1056 600 601 605 628 40000 flags: phsync, pvsync; type: driver
  #18 800x600 56.25 800 824 896 1024 600 601 603 625 36000 flags: phsync, pvsync; type: driver
  #19 720x576 50.00 720 732 796 864 576 581 586 625 27000 flags: nhsync, nvsync; type: driver
  #20 720x576 50.00 720 732 796 864 576 581 586 625 27000 flags: nhsync, nvsync; type: driver
  #21 720x480 60.00 720 736 798 858 480 489 495 525 27027 flags: nhsync, nvsync; type: driver
  #22 720x480 59.94 720 736 798 858 480 489 495 525 27000 flags: nhsync, nvsync; type: driver
  #23 640x480 75.00 640 656 720 840 480 481 484 500 31500 flags: nhsync, nvsync; type: driver
  #24 640x480 72.81 640 664 704 832 480 489 492 520 31500 flags: nhsync, nvsync; type: driver
  #25 640x480 66.67 640 704 768 864 480 483 486 525 30240 flags: nhsync, nvsync; type: driver
  #26 640x480 60.00 640 656 752 800 480 490 492 525 25200 flags: nhsync, nvsync; type: driver
  #27 640x480 59.94 640 656 752 800 480 490 492 525 25175 flags: nhsync, nvsync; type: driver
  #28 720x400 70.08 720 738 846 900 400 412 414 449 28320 flags: nhsync, pvsync; type: driver
  props:
        1 EDID:
                flags: immutable blob
                blobs:

                value:
                        00ffffffffffff003683832410101010
                        1416010380342078eeb725ac5130b426
                        105054bfef8068c0714f818001010101
                        010101010101e83580a070381f403020
                        250044682100001a000000ff00303031
                        30310a20202020202020000000fc0048
                        444d490a2020202020202020000000fd
                        00384c1e5317000a20202020202001cf
                        02031a71471003140513841223090707
                        8301000065030c0010008c0ad0902040
                        31200c40550036d431000018011d8018
                        711c1620582c250036d43100009e011d
                        80d0721c1620102c258036d43100009e
                        011d00bc52d01e20b828554036d43100
                        001ef339801871382d40582c4500c48e
                        2100001e000000000000000000000054
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
        20 CRTC_ID:
                flags: object
                value: 40

CRTCs:
id      fb      pos     size
40      50      (0,0)   (1920x1080)
  #0 1920x1080 59.72 1920 1968 2000 2080 1080 1082 1087 1111 138000 flags: phsync, nvsync; type: preferred, driver
  props:
        22 ACTIVE:
                flags: range
                values: 0 1
                value: 1
        23 MODE_ID:
                flags: blob
                blobs:

                value:
                        101b02008007b007d007200800003804
                        3a043f04570400003c00000009000000
                        48000000313932307831303830000000
                        00000000000000000000000000000000
                        00000000
        19 OUT_FENCE_PTR:
                flags: range
                values: 0 18446744073709551615
                value: 0
        24 VRR_ENABLED:
                flags: range
                values: 0 1
                value: 0

Planes:
id      crtc    fb      CRTC x,y        x,y     gamma size      possible crtcs
32      40      50      0,0             0,0     0               0x00000001
  formats: RGB8 AR12 XR12 AR15 XR15 RG16 BG24 RG24 BA24 BX24 AR24 XR24 UYVY YUYV YVYU NV12 NV21 NV16 NV61 YU12 YV12 YU16 YV16 YU24 YV24
  props:
        8 type:
                flags: immutable enum
                enums: Overlay=0 Primary=1 Cursor=2
                value: 1
        17 FB_ID:
                flags: object
                value: 50
        18 IN_FENCE_FD:
                flags: signed range
                values: -1 2147483647
                value: -1
        20 CRTC_ID:
                flags: object
                value: 40
        13 CRTC_X:
                flags: signed range
                values: -2147483648 2147483647
                value: 0
        14 CRTC_Y:
                flags: signed range
                values: -2147483648 2147483647
                value: 0
        15 CRTC_W:
                flags: range
                values: 0 2147483647
                value: 1920
        16 CRTC_H:
                flags: range
                values: 0 2147483647
                value: 1080
        9 SRC_X:
                flags: range
                values: 0 4294967295
                value: 0
        10 SRC_Y:
                flags: range
                values: 0 4294967295
                value: 0
        11 SRC_W:
                flags: range
                values: 0 4294967295
                value: 125829120
        12 SRC_H:
                flags: range
                values: 0 4294967295
                value: 70778880
        30 IN_FORMATS:
                flags: immutable blob
                blobs:

                value:
                        01000000000000001900000018000000
                        01000000800000005247423841523132
                        58523132415231355852313552473136
                        42473234524732344241323442583234
                        41523234585232345559565959555956
                        595659554e5631324e5632314e563136
                        4e563631595531325956313259553136
                        59563136595532345956323400000000
                        ffffff01000000000000000000000000
                        0000000000000000
                in_formats blob decoded:
                         RGB8:  LINEAR
                         AR12:  LINEAR
                         XR12:  LINEAR
                         AR15:  LINEAR
                         XR15:  LINEAR
                         RG16:  LINEAR
                         BG24:  LINEAR
                         RG24:  LINEAR
                         BA24:  LINEAR
                         BX24:  LINEAR
                         AR24:  LINEAR
                         XR24:  LINEAR
                         UYVY:  LINEAR
                         YUYV:  LINEAR
                         YVYU:  LINEAR
                         NV12:  LINEAR
                         NV21:  LINEAR
                         NV16:  LINEAR
                         NV61:  LINEAR
                         YU12:  LINEAR
                         YV12:  LINEAR
                         YU16:  LINEAR
                         YV16:  LINEAR
                         YU24:  LINEAR
                         YV24:  LINEAR
        34 alpha:
                flags: range
                values: 0 65535
                value: 65535
        35 zpos:
                flags: range
                values: 0 1
                value: 0
36      0       0       0,0             0,0     0               0x00000001
  formats: RGB8 AR12 XR12 AR15 XR15 RG16 BG24 RG24 BA24 BX24 AR24 XR24 UYVY YUYV YVYU NV12 NV21 NV16 NV61 YU12 YV12 YU16 YV16 YU24 YV24
  props:
        8 type:
                flags: immutable enum
                enums: Overlay=0 Primary=1 Cursor=2
                value: 0
        17 FB_ID:
                flags: object
                value: 0
        18 IN_FENCE_FD:
                flags: signed range
                values: -1 2147483647
                value: -1
        20 CRTC_ID:
                flags: object
                value: 0
        13 CRTC_X:
                flags: signed range
                values: -2147483648 2147483647
                value: 0
        14 CRTC_Y:
                flags: signed range
                values: -2147483648 2147483647
                value: 0
        15 CRTC_W:
                flags: range
                values: 0 2147483647
                value: 0
        16 CRTC_H:
                flags: range
                values: 0 2147483647
                value: 0
        9 SRC_X:
                flags: range
                values: 0 4294967295
                value: 0
        10 SRC_Y:
                flags: range
                values: 0 4294967295
                value: 0
        11 SRC_W:
                flags: range
                values: 0 4294967295
                value: 0
        12 SRC_H:
                flags: range
                values: 0 4294967295
                value: 0
        30 IN_FORMATS:
                flags: immutable blob
                blobs:

                value:
                        01000000000000001900000018000000
                        01000000800000005247423841523132
                        58523132415231355852313552473136
                        42473234524732344241323442583234
                        41523234585232345559565959555956
                        595659554e5631324e5632314e563136
                        4e563631595531325956313259553136
                        59563136595532345956323400000000
                        ffffff01000000000000000000000000
                        0000000000000000
                in_formats blob decoded:
                         RGB8:  LINEAR
                         AR12:  LINEAR
                         XR12:  LINEAR
                         AR15:  LINEAR
                         XR15:  LINEAR
                         RG16:  LINEAR
                         BG24:  LINEAR
                         RG24:  LINEAR
                         BA24:  LINEAR
                         BX24:  LINEAR
                         AR24:  LINEAR
                         XR24:  LINEAR
                         UYVY:  LINEAR
                         YUYV:  LINEAR
                         YVYU:  LINEAR
                         NV12:  LINEAR
                         NV21:  LINEAR
                         NV16:  LINEAR
                         NV61:  LINEAR
                         YU12:  LINEAR
                         YV12:  LINEAR
                         YU16:  LINEAR
                         YV16:  LINEAR
                         YU24:  LINEAR
                         YV24:  LINEAR
        38 alpha:
                flags: range
                values: 0 65535
                value: 65535
        39 zpos:
                flags: range
                values: 0 1
                value: 1

Frame buffers:
id      size    pitch

Biju Das (10):
  drm: rcar-du: Move rcar_du_vsp_plane_prepare_fb()
  drm: rcar-du: Move rcar_du_vsp_plane_cleanup_fb()
  drm: rcar-du: Move rcar_du_vsp_plane_atomic_update()
  drm: rcar-du: Add rcar_du_lib_fb_create()
  drm: rcar-du: Add rcar_du_lib_mode_cfg_helper_fns()
  drm: rcar-du: Move rcar_du_encoders_init()
  drm: rcar-du: Move rcar_du_properties_init()
  drm: rcar-du: Add rcar_du_lib_vsps_init()
  dt-bindings: display: Document Renesas RZ/G2L DU bindings
  drm: rcar-du: Add RZ/G2L DU Support

 .../bindings/display/renesas,rzg2l-du.yaml    | 124 +++
 drivers/gpu/drm/rcar-du/Kconfig               |  17 +-
 drivers/gpu/drm/rcar-du/Makefile              |  13 +
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         | 304 +-------
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c     | 330 ++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h     |  20 +
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  84 --
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c     |  84 ++
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h     |  19 +
 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c       | 718 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.h       |  26 +
 drivers/gpu/drm/rcar-du/rzg2l_du_drv.c        | 206 +++++
 drivers/gpu/drm/rcar-du/rzg2l_du_drv.h        |  20 +
 drivers/gpu/drm/rcar-du/rzg2l_du_encoder.c    |  26 +
 drivers/gpu/drm/rcar-du/rzg2l_du_encoder.h    |  19 +
 drivers/gpu/drm/rcar-du/rzg2l_du_kms.c        | 158 ++++
 drivers/gpu/drm/rcar-du/rzg2l_du_kms.h        |  17 +
 drivers/gpu/drm/rcar-du/rzg2l_du_regs.h       |  67 ++
 drivers/gpu/drm/rcar-du/rzg2l_du_vsp.c        |  82 ++
 drivers/gpu/drm/rcar-du/rzg2l_du_vsp.h        |  29 +
 20 files changed, 1978 insertions(+), 385 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_drv.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_drv.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_encoder.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_encoder.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_kms.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_kms.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_regs.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_vsp.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_vsp.h


base-commit: c90598c998da48a0499cb401c28d40e1f073733e
-- 
2.25.1

