Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE83418417
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 21:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800A26E3FE;
	Sat, 25 Sep 2021 19:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE356E456
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 19:08:53 +0000 (UTC)
Date: Sat, 25 Sep 2021 20:08:41 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 6/6] drm/ingenic: Attach bridge chain to encoders
To: Paul Boddie <paul@boddie.org.uk>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-mips <linux-mips@vger.kernel.org>,
 list@opendingux.net, dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Message-Id: <HU700R.NAHL5IU3NRE81@crapouillou.net>
In-Reply-To: <2094991.ScV2v2meXk@jason>
References: <20210922205555.496871-1-paul@crapouillou.net>
 <4366739.KZ8Jxz7LyS@jason> <EKJXZQ.6VJ0UDHV3T3W@crapouillou.net>
 <2094991.ScV2v2meXk@jason>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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

Hi Paul & Nikolaus,

If you spent some time debugging the issue instead of complaining that=20
my patchset breaks things...

The fix is a one-liner in your downstream ingenic-dw-hdmi.c:
.output_port =3D 1
in the ingenic_dw_hdmi_plat_data struct.

Absolutely nothing else needs to be changed for HDMI to work here.

Cheers,
-Paul


Le sam., sept. 25 2021 at 17:55:03 +0200, Paul Boddie=20
<paul@boddie.org.uk> a =E9crit :
> On Friday, 24 September 2021 10:29:02 CEST Paul Cercueil wrote:
>>=20
>>  Le ven., sept. 24 2021 at 00:51:39 +0200, Paul Boddie
>>  >
>>  > 2. My approach, which just involves changing the Synopsys driver=20
>> to
>>  > set the bridge type in dw_hdmi_probe like this:
>>  >
>>  >   hdmi->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
>>  >
>>  > Otherwise, I don't see how the bridge's (struct drm_bridge) type=20
>> will
>>  > be set.
>>=20
>>  The bridge's type is set in hdmi-connector, from DTS. The 'type =3D=20
>> "a"'
>>  will result in the bridge's .type to be set to=20
>> DRM_MODE_CONNECTOR_HDMIA.
>=20
> Actually, I found that hdmi-connector might not have been available=20
> because
> CONFIG_DRM_DISPLAY_CONNECTOR was not enabled. Rectifying this, the=20
> connector
> does get detected and enabled. However, the Synopsys driver remains=20
> unaware of
> it, and so the bridge type in the Synopsys driver remains unset.
>=20
> I do see that the connector sets the type on a bridge in its own=20
> private
> structure, so there would be a need to propagate this type to the=20
> actual
> bridge. In other words, what the connector does is distinct from the=20
> Synopsys
> driver which acts as the bridge with regard to the Ingenic driver.
>=20
> Perhaps the Synopsys driver should set the connector's bridge as the=20
> next
> bridge, or maybe something is supposed to discover that the connector=20
> may act
> as (or provide) a bridge after the Synopsys driver in the chain and=20
> then back-
> propagate the bridge type along the chain.
>=20
> [...]
>=20
>>  > And I removed any of the above hacks. What I observe, apart from=20
>> an
>>  > inactive LCD controller (and ingenic-drm driver), is the=20
>> following in
>>  > /sys/devices/platform/10180000.hdmi/:
>>  >
>>  > consumer:platform:13050000.lcdc0
>>  > consumer:platform:hdmi_connector
>=20
> Interestingly, with the connector driver present, these sysfs entries=20
> no
> longer appear.
>=20
> [...]
>=20
>>  > For me, running modetest yields plenty of information about=20
>> encoders,
>>  > connectors (and the supported modes via the EDID, thanks to my=20
>> HDMI-A
>>  > hack), CRTCs, and planes. But no framebuffers are reported.
>>=20
>>  Could you paste the result of "modetest -a -c -p" somewhere maybe?
>=20
> I had to specify -M ingenic-drm as well, but here you go...
>=20
> ----
>=20
> Connectors:
> id	encoder	status		name		size (mm)	modes	encoders
> 35	34	connected	HDMI-A-1       	340x270		17	34
>   modes:
> 	index name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot)
>   #0 1280x1024 60.02 1280 1328 1440 1688 1024 1025 1028 1066 108000=20
> flags:
> phsync, pvsync; type: preferred, driver
>   #1 1280x1024 75.02 1280 1296 1440 1688 1024 1025 1028 1066 135000=20
> flags:
> phsync, pvsync; type: driver
>   #2 1280x960 60.00 1280 1376 1488 1800 960 961 964 1000 108000=20
> flags: phsync,
> pvsync; type: driver
>   #3 1152x864 75.00 1152 1216 1344 1600 864 865 868 900 108000 flags:=20
> phsync,
> pvsync; type: driver
>   #4 1024x768 75.03 1024 1040 1136 1312 768 769 772 800 78750 flags:=20
> phsync,
> pvsync; type: driver
>   #5 1024x768 70.07 1024 1048 1184 1328 768 771 777 806 75000 flags:=20
> nhsync,
> nvsync; type: driver
>   #6 1024x768 60.00 1024 1048 1184 1344 768 771 777 806 65000 flags:=20
> nhsync,
> nvsync; type: driver
>   #7 832x624 74.55 832 864 928 1152 624 625 628 667 57284 flags:=20
> nhsync,
> nvsync; type: driver
>   #8 800x600 75.00 800 816 896 1056 600 601 604 625 49500 flags:=20
> phsync,
> pvsync; type: driver
>   #9 800x600 72.19 800 856 976 1040 600 637 643 666 50000 flags:=20
> phsync,
> pvsync; type: driver
>   #10 800x600 60.32 800 840 968 1056 600 601 605 628 40000 flags:=20
> phsync,
> pvsync; type: driver
>   #11 800x600 56.25 800 824 896 1024 600 601 603 625 36000 flags:=20
> phsync,
> pvsync; type: driver
>   #12 640x480 75.00 640 656 720 840 480 481 484 500 31500 flags:=20
> nhsync,
> nvsync; type: driver
>   #13 640x480 72.81 640 664 704 832 480 489 492 520 31500 flags:=20
> nhsync,
> nvsync; type: driver
>   #14 640x480 66.67 640 704 768 864 480 483 486 525 30240 flags:=20
> nhsync,
> nvsync; type: driver
>   #15 640x480 59.94 640 656 752 800 480 490 492 525 25175 flags:=20
> nhsync,
> nvsync; type: driver
>   #16 720x400 70.08 720 738 846 900 400 412 414 449 28320 flags:=20
> nhsync,
> pvsync; type: driver
>   props:
> 	1 EDID:
> 		flags: immutable blob
> 		blobs:
>=20
> 		value:
> 			00ffffffffffff00047232ad01010101
> 			2d0e010380221b782aaea5a6544c9926
> 			145054bfef0081808140714f01010101
> 			010101010101302a009851002a403070
> 			1300520e1100001e000000ff00343435
> 			3030353444454330300a000000fc0041
> 			4c313731350a202020202020000000fd
> 			00384c1e520e000a2020202020200051
> 	2 DPMS:
> 		flags: enum
> 		enums: On=3D0 Standby=3D1 Suspend=3D2 Off=3D3
> 		value: 0
> 	5 link-status:
> 		flags: enum
> 		enums: Good=3D0 Bad=3D1
> 		value: 0
> 	6 non-desktop:
> 		flags: immutable range
> 		values: 0 1
> 		value: 0
> 	4 TILE:
> 		flags: immutable blob
> 		blobs:
>=20
> 		value:
> 	20 CRTC_ID:
> 		flags: object
> 		value: 32
>=20
> CRTCs:
> id	fb	pos	size
> 32	39	(0,0)	(1280x1024)
>   #0  60.02 1280 1328 1440 1688 1024 1025 1028 1066 108000 flags:=20
> phsync,
> pvsync; type:
>   props:
> 	22 ACTIVE:
> 		flags: range
> 		values: 0 1
> 		value: 1
> 	23 MODE_ID:
> 		flags: blob
> 		blobs:
>=20
> 		value:
> 			e0a5010000053005a005980600000004
> 			010404042a0400003c00000005000000
> 			00000000000000000000000000000000
> 			00000000000000000000000000000000
> 			00000000
> 	19 OUT_FENCE_PTR:
> 		flags: range
> 		values: 0 18446744073709551615
> 		value: 0
> 	24 VRR_ENABLED:
> 		flags: range
> 		values: 0 1
> 		value: 0
> 	28 GAMMA_LUT:
> 		flags: blob
> 		blobs:
>=20
> 		value:
> 	29 GAMMA_LUT_SIZE:
> 		flags: immutable range
> 		values: 0 4294967295
> 		value: 256
>=20
> Planes:
> id	crtc	fb	CRTC x,y	x,y	gamma size	possible crtcs
> 31	32	39	0,0		0,0	0       	0x00000001
>   formats: XR15 RG16 RG24 XR24 XR30
>   props:
> 	8 type:
> 		flags: immutable enum
> 		enums: Overlay=3D0 Primary=3D1 Cursor=3D2
> 		value: 1
> 	17 FB_ID:
> 		flags: object
> 		value: 39
> 	18 IN_FENCE_FD:
> 		flags: signed range
> 		values: -1 2147483647
> 		value: -1
> 	20 CRTC_ID:
> 		flags: object
> 		value: 32
> 	13 CRTC_X:
> 		flags: signed range
> 		values: -2147483648 2147483647
> 		value: 0
> 	14 CRTC_Y:
> 		flags: signed range
> 		values: -2147483648 2147483647
> 		value: 0
> 	15 CRTC_W:
> 		flags: range
> 		values: 0 2147483647
> 		value: 1280
> 	16 CRTC_H:
> 		flags: range
> 		values: 0 2147483647
> 		value: 1024
> 	9 SRC_X:
> 		flags: range
> 		values: 0 4294967295
> 		value: 0
> 	10 SRC_Y:
> 		flags: range
> 		values: 0 4294967295
> 		value: 0
> 	11 SRC_W:
> 		flags: range
> 		values: 0 4294967295
> 		value: 83886080
> 	12 SRC_H:
> 		flags: range
> 		values: 0 4294967295
> 		value: 67108864
> 33	0	0	0,0		0,0	0       	0x00000001
>   formats: C8   XR15 RG16 RG24 XR24 XR30
>   props:
> 	8 type:
> 		flags: immutable enum
> 		enums: Overlay=3D0 Primary=3D1 Cursor=3D2
> 		value: 0
> 	17 FB_ID:
> 		flags: object
> 		value: 0
> 	18 IN_FENCE_FD:
> 		flags: signed range
> 		values: -1 2147483647
> 		value: -1
> 	20 CRTC_ID:
> 		flags: object
> 		value: 0
> 	13 CRTC_X:
> 		flags: signed range
> 		values: -2147483648 2147483647
> 		value: 0
> 	14 CRTC_Y:
> 		flags: signed range
> 		values: -2147483648 2147483647
> 		value: 0
> 	15 CRTC_W:
> 		flags: range
> 		values: 0 2147483647
> 		value: 0
> 	16 CRTC_H:
> 		flags: range
> 		values: 0 2147483647
> 		value: 0
> 	9 SRC_X:
> 		flags: range
> 		values: 0 4294967295
> 		value: 0
> 	10 SRC_Y:
> 		flags: range
> 		values: 0 4294967295
> 		value: 0
> 	11 SRC_W:
> 		flags: range
> 		values: 0 4294967295
> 		value: 0
> 	12 SRC_H:
> 		flags: range
> 		values: 0 4294967295
> 		value: 0
>=20
> ----
>=20
>>  If you have info about the CRTCs, encoders, connectors and EDID=20
>> info,
>>  then I would assume it is very close to working fine.
>>=20
>>  For your "no framebuffer" issue, keep in mind that CONFIG_FB and
>>  CONFIG_FRAMEBUFFER_CONSOLE are now disabled by default.
>=20
> Yes, I discovered that CONFIG_FB was not enabled, so I did so.
>=20
>>  If that doesn't fix anything, that probably means that one
>>  .atomic_check() fails, so it would be a good place to start=20
>> debugging.
>=20
> There will be other things to verify in the Ingenic driver. As noted=20
> many
> months ago, colour depth information has to be set in the DMA=20
> descriptors and
> not the control register, but we are managing to do this=20
> successfully, as far
> as I can tell, although there is always the potential for error.
>=20
> Paul
>=20
>=20


