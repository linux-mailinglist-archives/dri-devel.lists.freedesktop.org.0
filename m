Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 464E63E8506
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 23:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA58897CD;
	Tue, 10 Aug 2021 21:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp2.de.opalstack.com (smtp2.de.opalstack.com
 [139.162.136.213])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83AA89829
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 21:15:22 +0000 (UTC)
Received: from jason.localnet (host-37-191-188-128.lynet.no [37.191.188.128])
 by smtp2.de.opalstack.com (Postfix) with ESMTPSA id B8ED6127D44;
 Tue, 10 Aug 2021 21:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boddie.org.uk;
 s=dkim; t=1628630120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7hFFJwU21ENsBkO8LzpFRzh6F0cRYBvrYDtycYF0BS0=;
 b=PKLd8TFZ9avw8wN7ibfnzjpe7Du5SYhghj++qBLvffTtNgjA0rXAr+XAVqBIXkiBFAoXXO
 YQMLxg+GgP2NGO1dz4W42MfVRH2xtfy4tTpQdUAWq2fzj2nfmjp3ncxY6QsCgpk+0KCuAd
 ggb2apw1LtL0bzem3K3ndgsnPVMT+Ag=
From: Paul Boddie <paul@boddie.org.uk>
To: Paul Cercueil <paul@crapouillou.net>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, David Airlie <airlied@linux.ie>,
 linux-mips <linux-mips@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 list@opendingux.net, Sam Ravnborg <sam@ravnborg.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Subject: Re: [Letux-kernel] [PATCH 8/8] drm/ingenic: Attach bridge chain to
 encoders
Date: Tue, 10 Aug 2021 23:15:12 +0200
Message-ID: <1766447.FbDIzoYTkO@jason>
In-Reply-To: <OV5MXQ.C3JR71EBG5P51@crapouillou.net>
References: <20210808134526.119198-1-paul@crapouillou.net>
 <2242071.3D3ZAXhqrE@jason> <OV5MXQ.C3JR71EBG5P51@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.55
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

On Tuesday, 10 August 2021 09:52:36 CEST Paul Cercueil wrote:
>=20
> Le mar., ao=FBt 10 2021 at 01:17:20 +0200, Paul Boddie <paul@boddie.org.u=
k> a=20
=E9crit :
> >=20
> > But then the reported error occurs in the DRM driver:
> >=20
> > ingenic-drm 13050000.lcdc0: Unable to init connector
> > ingenic-drm: probe of 13050000.lcdc0 failed with error -22
> >=20
> > This originates in a call to drm_bridge_connector_init from
> > ingenic_drm_bind:
> >=20
> > connector =3D drm_bridge_connector_init(drm, encoder);
> >=20
> > The invoked function iterates over the registered bridges, one of
> > which seems to be the HDMI peripheral (it has bridge operations defined
> > identically to those specified in the Synopsys driver), but the type
> > member of the drm_bridge structure is set to 0
> > (DRM_MODE_CONNECTOR_Unknown).

Although I had fancy ideas about finding the connector node in the device t=
ree=20
and populating the necessary type details on the bridge, I decided to just =
add=20
the following to the Synopsys driver's dw_hdmi_probe function:

hdmi->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;

This then lets the above invocation succeed and the Ingenic DRM driver=20
initialises. However, I get "Input Not Supported" on my display.

Conveniently, when indicating the necessary boot arguments...

env set bootargs ... drm.debug=3D0x3f

=2E..as suggested to me on a previous occasion, the /sys/kernel/debug/dri/0/
state file indicates the following:

plane[31]: plane-0
        crtc=3Dcrtc-0
        fb=3D36  =20
                allocated by =3D Xorg
                refcount=3D2
                format=3DXR24 little-endian (0x34325258)
                modifier=3D0x0
                size=3D1280x1024
                layers:=20
                        size[0]=3D1280x1024
                        pitch[0]=3D5120
                        offset[0]=3D0
                        obj[0]:=20
                                name=3D0
                                refcount=3D3
                                start=3D00010000
                                size=3D5242880
                                imported=3Dno
                                paddr=3D0x00c00000
                                vaddr=3D3eb0c080
        crtc-pos=3D1280x1024+0+0
        src-pos=3D1280.000000x1024.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D0
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
plane[33]: plane-1
        crtc=3D(null)
        fb=3D0
        crtc-pos=3D0x0+0+0
        src-pos=3D0.000000x0.000000+0.000000+0.000000
        rotation=3D1
        normalized-zpos=3D0
        color-encoding=3DITU-R BT.601 YCbCr
        color-range=3DYCbCr limited range
crtc[32]: crtc-0
        enable=3D1
        active=3D1
        self_refresh_active=3D0
        planes_changed=3D0
        mode_changed=3D0
        active_changed=3D0
        connectors_changed=3D0
        color_mgmt_changed=3D0
        plane_mask=3D1
        connector_mask=3D1
        encoder_mask=3D1
        mode: "": 60 108000 1280 1328 1440 1688 1024 1025 1028 1066 0x0 0x5
connector[35]: HDMI-A-1
        crtc=3Dcrtc-0
        self_refresh_aware=3D0

I suspect that we may be dealing with an incompatible bus format again, but=
 I=20
may be quite wrong about that, too.

Here is the result of running modetest using...

sudo ./modetest -D /dev/dri/card0 -M ingenic-drm

Encoders:
id      crtc    type    possible crtcs  possible clones
34      32      DPI     0x00000001      0x00000001

Connectors:
id      encoder status          name            size (mm)       modes  =20
encoders
35      34      connected       HDMI-A-1        340x270         17      34
  modes:
        index name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot)
  #0 1280x1024 60.02 1280 1328 1440 1688 1024 1025 1028 1066 108000 flags:=
=20
phsync, pvsync; type: preferred, driver
  #1 1280x1024 75.02 1280 1296 1440 1688 1024 1025 1028 1066 135000 flags:=
=20
phsync, pvsync; type: driver
  #2 1280x960 60.00 1280 1376 1488 1800 960 961 964 1000 108000 flags: phsy=
nc,=20
pvsync; type: driver
  #3 1152x864 75.00 1152 1216 1344 1600 864 865 868 900 108000 flags: phsyn=
c,=20
pvsync; type: driver
  #4 1024x768 75.03 1024 1040 1136 1312 768 769 772 800 78750 flags: phsync=
,=20
pvsync; type: driver
  #5 1024x768 70.07 1024 1048 1184 1328 768 771 777 806 75000 flags: nhsync=
,=20
nvsync; type: driver
  #6 1024x768 60.00 1024 1048 1184 1344 768 771 777 806 65000 flags: nhsync=
,=20
nvsync; type: driver
  #7 832x624 74.55 832 864 928 1152 624 625 628 667 57284 flags: nhsync,=20
nvsync; type: driver
  #8 800x600 75.00 800 816 896 1056 600 601 604 625 49500 flags: phsync,=20
pvsync; type: driver
  #9 800x600 72.19 800 856 976 1040 600 637 643 666 50000 flags: phsync,=20
pvsync; type: driver
  #10 800x600 60.32 800 840 968 1056 600 601 605 628 40000 flags: phsync,=20
pvsync; type: driver
  #11 800x600 56.25 800 824 896 1024 600 601 603 625 36000 flags: phsync,=20
pvsync; type: driver
  #12 640x480 75.00 640 656 720 840 480 481 484 500 31500 flags: nhsync,=20
nvsync; type: driver
  #13 640x480 72.81 640 664 704 832 480 489 492 520 31500 flags: nhsync,=20
nvsync; type: driver
  #14 640x480 66.67 640 704 768 864 480 483 486 525 30240 flags: nhsync,=20
nvsync; type: driver
  #15 640x480 59.94 640 656 752 800 480 490 492 525 25175 flags: nhsync,=20
nvsync; type: driver
  #16 720x400 70.08 720 738 846 900 400 412 414 449 28320 flags: nhsync,=20
pvsync; type: driver
  props:
        1 EDID:=20
                flags: immutable blob
                blobs:

                value: =20
                        00ffffffffffff00047232ad01010101
                        2d0e010380221b782aaea5a6544c9926
                        145054bfef0081808140714f01010101
                        010101010101302a009851002a403070
                        1300520e1100001e000000ff00343435
                        3030353444454330300a000000fc0041
                        4c313731350a202020202020000000fd
                        00384c1e520e000a2020202020200051
        2 DPMS:=20
                flags: enum
                enums: On=3D0 Standby=3D1 Suspend=3D2 Off=3D3
                value: 3
        5 link-status:
                flags: enum
                enums: Good=3D0 Bad=3D1
                value: 0
        6 non-desktop:
                flags: immutable range
                values: 0 1
                value: 0
        4 TILE:=20
                flags: immutable blob
                blobs:

                value:
        20 CRTC_ID:
                flags: object
                value: 32

CRTCs:
id      fb      pos     size
32      36      (0,0)   (1280x1024)
  #0  60.02 1280 1328 1440 1688 1024 1025 1028 1066 108000 flags: phsync,=20
pvsync; type:
  props:
        22 ACTIVE:
                flags: range
                values: 0 1
                value: 0
        23 MODE_ID:
                flags: blob
                blobs:

                value: =20
                        e0a5010000053005a005980600000004
                        010404042a0400003c00000005000000
                        00000000000000000000000000000000
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
        28 GAMMA_LUT:
                flags: blob
                blobs:

                value:
        29 GAMMA_LUT_SIZE:
                flags: immutable range
                values: 0 4294967295
                value: 256

Planes:
id      crtc    fb      CRTC x,y        x,y     gamma size      possible cr=
tcs
31      32      36      0,0             0,0     0               0x00000001
  formats: XR15 RG16 RG24 XR24 XR30
  props:
        8 type:=20
                flags: immutable enum
                enums: Overlay=3D0 Primary=3D1 Cursor=3D2
                value: 1
        17 FB_ID:
                flags: object
                value: 36
        18 IN_FENCE_FD:
                flags: signed range
                values: -1 2147483647
                value: -1
        20 CRTC_ID:
                flags: object
                value: 32
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
                value: 1280
        16 CRTC_H:
                flags: range
                values: 0 2147483647
                value: 1024
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
                value: 83886080
        12 SRC_H:
                flags: range
                values: 0 4294967295
                value: 67108864
33      0       0       0,0             0,0     0               0x00000001
  formats: C8   XR15 RG16 RG24 XR24 XR30
  props:
        8 type:=20
                flags: immutable enum
                enums: Overlay=3D0 Primary=3D1 Cursor=3D2
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

=46rame buffers:
id      size    pitch

Just in case that means anything to anyone.

Paul


