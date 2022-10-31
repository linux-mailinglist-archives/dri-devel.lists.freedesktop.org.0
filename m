Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B41461333E
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 11:07:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C7A10E182;
	Mon, 31 Oct 2022 10:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0744810E18A
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 10:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1667210834;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=BWR4o5dpQKvBN+fm6DmhC8rAzcoU8MEhcqlwh67HIAc=;
 b=Kbj82e32WAQzh1fgTBwGex3R1D8Ce49LoBDtY4yF76VLRkghEw755Yg9oQrSntceGt
 VhfNXXxORGkB9PbJlpjC+XyOE/oHvq49CwCJD8nhncwHe7jey22xPOFt63sbseQACS1W
 qaXqL4NTyWymM/2GfOBUogCqmf0YJCMDwOa7ycnPxzHZY4YaTYXsoCL8V41yqCxjkavQ
 NZqllXRIBkS/xlw8Nazd6ErDjiKAC6BKYUeJVud/7xNiNhldYG+TyYr4OHbx1j1ON6Xj
 Ag7xv+bbtS4P8yOJIp4cCfMTRskUxxGTKap4vBS7L3eWTmT0NF8oO03khSLQInCvy0g2
 p+jA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGerXQ="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 48.2.1 DYNA|AUTH)
 with ESMTPSA id v55d69y9VA7DNJI
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 31 Oct 2022 11:07:13 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH 3/3] drm: omapdrm: Do no allocate non-scanout GEMs through
 DMM/TILER
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <d4a5afcc-9ee0-208c-82ad-11ccd0e316b5@gmail.com>
Date: Mon, 31 Oct 2022 11:07:13 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <A329FEC2-D7D1-42E4-B7A6-B0DC569D91C9@goldelico.com>
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <1642587791-13222-4-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <4B3F8E50-3472-4AED-9A77-3E265DF8C928@goldelico.com>
 <0000784a-ae89-1081-0ec7-fc77d3381545@gmail.com>
 <F3F3E8E1-7907-46A4-A670-CAEF6C3DB083@goldelico.com>
 <A2089A8A-69D3-4825-B400-8EB382DC9955@goldelico.com>
 <d4a5afcc-9ee0-208c-82ad-11ccd0e316b5@gmail.com>
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
X-Mailer: Apple Mail (2.3445.104.21)
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
Cc: tomba@kernel.org, Tony Lindgren <tony@atomide.com>, merlijn@wizzup.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ivaylo,

> Am 31.10.2022 um 10:58 schrieb Ivaylo Dimitrov =
<ivo.g.dimitrov.75@gmail.com>:
>=20
>=20
>=20
> On 31.10.22 =D0=B3. 9:57 =D1=87., H. Nikolaus Schaller wrote:
>>> Am 31.10.2022 um 08:44 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>>>=20
>>> Hi Ivaylo,
>>>=20
>>>> Am 31.10.2022 um 08:05 schrieb Ivaylo Dimitrov =
<ivo.g.dimitrov.75@gmail.com>:
>>>>=20
>>>> HI Nikolaus,
>>>>=20
>>>> On 31.10.22 =D0=B3. 0:08 =D1=87., H. Nikolaus Schaller wrote:
>>>>> Hi Ivaylo,
>>>>> it took a while until I found time to test newer kernels (mainline =
+ Letux additions)
>>>>> on the OMAP5 Pyra but unfortunately I did not get screen display =
for v6.1. Even worse,
>>>>> the console was flooded by
>>>>=20
>>>> Could you elaborate on that - do you have anything on the display =
(during boot or dunno). Do you have simplefb enabled, so boot log to be =
visible on the display?
>>>=20
>>> No bootlog enabled but I have some printk in the panel driver. It is =
initially enabled, then disabled and enabled again. Then the issues =
start...
>>>=20
>>>> Is that wayland you are trying to run? Do you have PVR driver =
enabled? Did you try to boot vanilla kernel?
>>>=20
>>> I have tested with Debian Stretch with standard Xorg with "omap" =
driver. PVR is not enabled.
>> Have cross-checked: my setup uses the fbdev driver.
>=20
> omapfb and not omapdrm? or I am missing something.

I just have "fbdev" in the xorg.conf. Certainly not the best choice but =
it seems to be the most generic setup without having to tweak every =
combination of user-space release and kernel version and hardware =
variant.

Section "Monitor"
                Identifier              "lcd"
                VendorName              "BOE"
                ModelName               "W677L"
                Option                  "Rotate" "right"        # use =
TILER rotation
                DisplaySize             111 62          # LCD size in =
millimeters
EndSection

Section "Device"
                Identifier              "display0"
                Driver                  "fbdev"
                Option                  "Monitor-DSI-1" "lcd"
                Option                  "HWcursor" "False"
EndSection

Of course the kernel config uses DRM_OMAP:

root@letux:~# uname -a
Linux letux 6.1.0-rc2-letux-lpae+ #11029 SMP PREEMPT Sun Oct 30 22:41:25 =
CET 2022 armv7l GNU/Linux
root@letux:~#=20
root@letux:~# ls -l =
/sys/devices/platform/omapdrm.0/drm/card1/card1-DSI-1
total 0
lrwxrwxrwx 1 root root    0 Oct 31 10:03 device -> ../../card1
-r--r--r-- 1 root root 4096 Oct 31 10:03 dpms
-r--r--r-- 1 root root    0 Oct 31 10:03 edid
-r--r--r-- 1 root root 4096 Oct 31 10:03 enabled
-r--r--r-- 1 root root 4096 Oct 31 10:03 modes
drwxr-xr-x 2 root root    0 Oct 31 10:03 power
-rw-r--r-- 1 root root 4096 Oct 31 10:03 status
lrwxrwxrwx 1 root root    0 Oct 31 10:00 subsystem -> =
../../../../../../class/drm
-rw-r--r-- 1 root root 4096 Oct 31 10:00 uevent
root@letux:~#=20
root@letux:~# gunzip </proc/config.gz | fgrep DRM | fgrep =3D
CONFIG_DRM=3Dm
CONFIG_DRM_MIPI_DSI=3Dy
CONFIG_DRM_KMS_HELPER=3Dm
CONFIG_DRM_FBDEV_EMULATION=3Dy
CONFIG_DRM_FBDEV_OVERALLOC=3D100
CONFIG_DRM_LOAD_EDID_FIRMWARE=3Dy
CONFIG_DRM_DISPLAY_HELPER=3Dm
CONFIG_DRM_DISPLAY_HDMI_HELPER=3Dy
CONFIG_DRM_GEM_DMA_HELPER=3Dm
CONFIG_DRM_SCHED=3Dm
CONFIG_DRM_I2C_NXP_TDA998X=3Dm
CONFIG_DRM_ATMEL_HLCDC=3Dm
CONFIG_DRM_OMAP=3Dm
CONFIG_DRM_TILCDC=3Dm
CONFIG_DRM_STM=3Dm
CONFIG_DRM_PANEL=3Dy
CONFIG_DRM_PANEL_DSI_CM=3Dm
CONFIG_DRM_PANEL_SIMPLE=3Dm
CONFIG_DRM_PANEL_BOE_BTL507212_W677L=3Dm
CONFIG_DRM_PANEL_SONY_ACX565AKM=3Dm
CONFIG_DRM_PANEL_TPO_TD028TTEC1=3Dm
CONFIG_DRM_PANEL_TPO_TD043MTEA1=3Dm
CONFIG_DRM_BRIDGE=3Dy
CONFIG_DRM_PANEL_BRIDGE=3Dy
CONFIG_DRM_DISPLAY_CONNECTOR=3Dm
CONFIG_DRM_SIMPLE_BRIDGE=3Dm
CONFIG_DRM_TI_TFP410=3Dm
CONFIG_DRM_TI_TPD12S015=3Dm
CONFIG_DRM_DW_HDMI=3Dm
CONFIG_DRM_DW_HDMI_CEC=3Dm
CONFIG_DRM_IMX=3Dm
CONFIG_DRM_IMX_PARALLEL_DISPLAY=3Dm
CONFIG_DRM_IMX_TVE=3Dm
CONFIG_DRM_IMX_LDB=3Dm
CONFIG_DRM_IMX_HDMI=3Dm
CONFIG_DRM_VC4=3Dm
CONFIG_DRM_VC4_HDMI_CEC=3Dy
CONFIG_DRM_ETNAVIV=3Dm
CONFIG_DRM_ETNAVIV_THERMAL=3Dy
CONFIG_DRM_MXS=3Dy
CONFIG_DRM_MXSFB=3Dm
CONFIG_SGX_DRM=3Dy
CONFIG_DRM_MXC_EPDC=3Dm
CONFIG_DRM_LEGACY=3Dy
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dm
CONFIG_DRM_NOMODESET=3Dy
root@letux:~#=20
root@letux:~# lsmod | fgrep drm
omapdrm               225280  4
cec                    45056  1 omapdrm
drm_kms_helper        110592  2 display_connector,omapdrm
syscopyarea            16384  1 drm_kms_helper
sysfillrect            16384  1 drm_kms_helper
sysimgblt              16384  1 drm_kms_helper
fb_sys_fops            16384  1 drm_kms_helper
drm                   380928  7 =
panel_boe_btl507212_w677l,ti_tpd12s015,pvrsrvkm_omap5_sgx544_116,display_c=
onnector,omapdrm,drm_kms_helper
drm_panel_orientation_quirks    16384  1 drm
root@letux:~#=20

Hope this is useful information,
Nikolaus

