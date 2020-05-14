Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A941D4078
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 00:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94DF6E39E;
	Thu, 14 May 2020 22:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.webfaction.com (mail6.webfaction.com [31.170.123.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9B66E39E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 22:05:11 +0000 (UTC)
Received: from jeremy.localnet (host-37-191-188-128.lynet.no [37.191.188.128])
 by smtp.webfaction.com (Postfix) with ESMTPSA id 9BA26600A8842;
 Thu, 14 May 2020 22:05:17 +0000 (UTC)
From: Paul Boddie <paul@boddie.org.uk>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: drm/bridge: Synopsys DW-HDMI bridge driver for the Ingenic JZ4780
 (was Re: Specialising the Synopsys DW-HDMI bridge driver for the Ingenic
 JZ4780)
Date: Fri, 15 May 2020 00:04:51 +0200
Message-ID: <1660901.RzKB6nuZHq@jeremy>
User-Agent: KMail/4.14.1 (Linux/3.16.0-10-586; KDE/4.14.2; i686; ; )
In-Reply-To: <c34fe43b-51c4-0231-7a41-77d5c703e9ba@baylibre.com>
References: <1940005.XIBaf5lNV5@jeremy>
 <c34fe43b-51c4-0231-7a41-77d5c703e9ba@baylibre.com>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Following up on my last message...

> On Wednesday 13. May 2020 09.37.49 Neil Armstrong wrote:
> > 
> > Can you run the kernel with drm debug enabled ? drm.debug=0x3f for example
> > you'll have all the modes checks & so on
> 
> I'll try and do this.

Well, I've done this but I probably need to know what to look for. One thing 
that appears regardless of this debugging output being enabled is a problem 
with the vertical blanking functionality:

WARNING: CPU: 1 PID: 396 at drivers/gpu/drm/drm_atomic_helper.c:1457 
drm_atomic_helper_wait_for_vblanks+0x1ec/0x25c
[CRTC:32:crtc-0] vblank wait timed out

This is preceded by the following:

[drm:drm_atomic_commit] committing 1d53fa19
[drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:32:crtc-0] 
flip_done timed out
[drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CONNECTOR:34:HDMI-A-1] 
flip_done timed out
[drm:drm_calc_timestamping_constants] crtc 32: hwmode: htotal 1688, vtotal 
1066, vdisplay 1024
[drm:drm_calc_timestamping_constants] crtc 32: clock 108000 kHz framedur 
16661185 linedur 15629
[drm:drm_update_vblank_count] updating vblank count on crtc 0: current=1, 
diff=0, hw=0 hw_last=0

Although the interrupt initialisation should be straightforward, maybe 
something isn't getting done.

[...]

> > Please use the "modetest" utility from the libdrm source package, it will
> > list all the available mode and permit testing other modes.
> 
> I'll give this a try. The modetest program was suggested by someone else as
> well, so it seems to be the way to go.

Well, I obtained libdrm and built it (after getting a much later version of 
meson than my distribution provides), and running modetest with the options 
indicated to me by another correspondent...

modetest -D /dev/dri/card0 -M ingenic-drm

...I get the following report:

-----------------------------------------------------------

Encoders:
id      crtc    type    possible crtcs  possible clones
33      32      DPI     0x00000001      0x00000000

Connectors:
id      encoder status          name            size (mm)       modes   
encoders
34      33      connected       HDMI-A-1        340x270         17      33
  modes:
        index name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot)
  #0 1280x1024 60.02 1280 1328 1440 1688 1024 1025 1028 1066 108000 flags: 
phsync, pvsync; type: preferred, driver
  #1 1280x1024 75.02 1280 1296 1440 1688 1024 1025 1028 1066 135000 flags: 
phsync, pvsync; type: driver
  #2 1280x960 60.00 1280 1376 1488 1800 960 961 964 1000 108000 flags: phsync, 
pvsync; type: driver
  #3 1152x864 75.00 1152 1216 1344 1600 864 865 868 900 108000 flags: phsync, 
pvsync; type: driver
  #4 1024x768 75.03 1024 1040 1136 1312 768 769 772 800 78750 flags: phsync, 
pvsync; type: driver
  #5 1024x768 70.07 1024 1048 1184 1328 768 771 777 806 75000 flags: nhsync, 
nvsync; type: driver
  #6 1024x768 60.00 1024 1048 1184 1344 768 771 777 806 65000 flags: nhsync, 
nvsync; type: driver
  #7 832x624 74.55 832 864 928 1152 624 625 628 667 57284 flags: nhsync, 
nvsync; type: driver
  #8 800x600 75.00 800 816 896 1056 600 601 604 625 49500 flags: phsync, 
pvsync; type: driver
  #9 800x600 72.19 800 856 976 1040 600 637 643 666 50000 flags: phsync, 
pvsync; type: driver
  #10 800x600 60.32 800 840 968 1056 600 601 605 628 40000 flags: phsync, 
pvsync; type: driver
  #11 800x600 56.25 800 824 896 1024 600 601 603 625 36000 flags: phsync, 
pvsync; type: driver
  #12 640x480 75.00 640 656 720 840 480 481 484 500 31500 flags: nhsync, 
nvsync; type: driver
  #13 640x480 72.81 640 664 704 832 480 489 492 520 31500 flags: nhsync, 
nvsync; type: driver
  #14 640x480 66.67 640 704 768 864 480 483 486 525 30240 flags: nhsync, 
nvsync; type: driver
  #15 640x480 59.94 640 656 752 800 480 490 492 525 25175 flags: nhsync, 
nvsync; type: driver
  #16 720x400 70.08 720 738 846 900 400 412 414 449 28320 flags: nhsync, 
pvsync; type: driver
  props:
        1 EDID: 
                flags: immutable blob
                blobs:

                value:  
                        00ffffffffffff00047232ad01010101
                        2d0e010380221b782aaea5a6544c9926
                        145054bfef0081808140714f01010101
                        010101010101302a009851002a403070
                        1300520e1100001e000000ff00343435
                        3030353444454330300a000000fc0041
                        4c313731350a202020202020000000fd
                        00384c1e520e000a2020202020200051
        2 DPMS: 
                flags: enum
                enums: On=0 Standby=1 Suspend=2 Off=3
                value: 3
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
                value: 32

CRTCs:
id      fb      pos     size
32      38      (0,0)   (1280x1024)
  #0  60.02 1280 1328 1440 1688 1024 1025 1028 1066 108000 flags: phsync, 
pvsync; type:
  props:
        22 ACTIVE:
                flags: range
                values: 0 1
                value: 0
        23 MODE_ID:
                flags: blob
                blobs:

                value:  
                        e0a5010000053005a005980600000004
                        010404042a0400000000000005000000
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

Planes:
id      crtc    fb      CRTC x,y        x,y     gamma size      possible crtcs
31      32      38      0,0             0,0     0               0x00000001
  formats: XR15 RG16 XR24
  props:
        8 type: 
                flags: immutable enum
                enums: Overlay=0 Primary=1 Cursor=2
                value: 1
        17 FB_ID:
                flags: object
                value: 38
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

Frame buffers:
id      size    pitch

-----------------------------------------------------------

For completeness, this is what /sys/kernel/debug/dri/0/state shows:

-----------------------------------------------------------

plane[31]: plane-0
        crtc=crtc-0
        fb=38
         allocated by = Xorg
         refcount=2
         format=XR24 little-endian (0x34325258)
         modifier=0x0
         size=1280x1024
         layers:
          size[0]=1280x1024
          pitch[0]=5120
          offset[0]=0
          obj[0]:
           name=0
           refcount=3
           start=00010500
           size=5242880
           imported=no
        crtc-pos=1280x1024+0+0
        src-pos=1280.000000x1024.000000+0.000000+0.000000
        rotation=1
        normalized-zpos=0
        color-encoding=ITU-R BT.601 YCbCr
        color-range=YCbCr limited range
crtc[32]: crtc-0
        enable=1
        active=0
        self_refresh_active=0
        planes_changed=0
        mode_changed=0
        active_changed=0
        connectors_changed=0
        color_mgmt_changed=0
        plane_mask=1
        connector_mask=1
        encoder_mask=1
        mode: "": 0 108000 1280 1328 1440 1688 1024 1025 1028 1066 0x0 0x5
connector[34]: HDMI-A-1
        crtc=crtc-0
        self_refresh_aware=0

-----------------------------------------------------------

Some other output:

-----------------------------------------------------------

# cat /sys/devices/platform/13050000.lcd/graphics/fb0/mode
# cat /sys/devices/platform/13050000.lcd/graphics/fb0/modes
U:1280x1024p-0
# cat /sys/devices/platform/13050000.lcd/graphics/fb0/state 
0
# cat /sys/devices/platform/13050000.lcd/drm/card0/card0-HDMI-A-1/enabled 
enabled
# cat /sys/devices/platform/13050000.lcd/drm/card0/card0-HDMI-A-1/modes
1280x1024
1280x1024
1280x960
1152x864
1024x768
1024x768
1024x768
832x624
800x600
800x600
800x600
800x600
640x480
640x480
640x480
640x480
720x400
# cat /sys/devices/platform/13050000.lcd/drm/card0/card0-HDMI-A-1/status 
connected

-----------------------------------------------------------

Attempting to set a mode using...

modetest -D /dev/dri/card0 -M ingenic-drm -s 34@32:1280x1024-60.02

...yields the following:

failed to set mode: Permission denied
setting mode 1280x1024-60.02Hz@XR24 on connectors 34, crtc 32

[...]

> > But if you have "Input not supported" on your monitor, this means you have
> > TMDS going out on your hardware, which is good, this means all the
> > power/reset/system clocks are ok.
> > This could mean you have a timing/clock issue, please check if something
> > is not done on the pixel clock before going to the dw-hdmi block.
> 
> I think I may have overlooked timing details, so this will also be a focus
> of mine as I review what I have done so far.

What I did look at today was the Ingenic DRM driver initialisation. There are 
certain things that are not done in this driver that the vendor driver does 
do.

For example, there is some kind of priority level register (PCFG) that is set 
up with a "magic value" that can be largely explained by the programming 
manual. Also, there is a RGB control register that older Ingenic SoCs do not 
provide, and this is set up by the vendor driver. I have no idea whether they 
play any role in this, but I introduced their initialisation anyway.

There was also a configuration register field related to the bus signalling 
(JZ_LCD_CFG_PCLK_FALLING_EDGE) not being set because it is dependent on the 
appropriate bus flag being set (DRM_BUS_FLAG_PIXDATA_NEGEDGE), which may not 
have been occurring. Unfortunately, setting the bus flag in the bridge driver 
didn't yield any progress.

So that is what I have discovered today.

Thanks once again for the advice!

Paul
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
