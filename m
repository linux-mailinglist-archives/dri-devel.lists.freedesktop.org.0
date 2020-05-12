Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4AF1CFE75
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 21:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B00F89B98;
	Tue, 12 May 2020 19:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4.webfaction.com (mailrelay4.webfaction.com
 [185.20.51.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2EBF89B98
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 19:38:00 +0000 (UTC)
Received: from mailrelay3.webfaction.com (mailrelay3.webfaction.com
 [207.38.93.110])
 by mailrelay4.webfaction.com (Postfix) with ESMTPS id 038ABA3761
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 19:37:56 +0000 (UTC)
Received: from mailrelay2.webfaction.com (mailrelay2.webfaction.com
 [185.20.50.247])
 by mailrelay3.webfaction.com (Postfix) with ESMTPS id 884842A4C58
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 19:37:53 +0000 (UTC)
Received: from smtp.webfaction.com (mail6.webfaction.com [31.170.123.134])
 by mailrelay2.webfaction.com (Postfix) with ESMTPS id 6339C101905
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 19:37:47 +0000 (UTC)
Received: from jeremy.localnet (host-37-191-188-128.lynet.no [37.191.188.128])
 by smtp.webfaction.com (Postfix) with ESMTPSA id BAB4A600454A1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 19:37:52 +0000 (UTC)
From: Paul Boddie <paul@boddie.org.uk>
To: dri-devel@lists.freedesktop.org
Subject: Specialising the Synopsys DW-HDMI bridge driver for the Ingenic JZ4780
Date: Tue, 12 May 2020 21:37:35 +0200
Message-ID: <1940005.XIBaf5lNV5@jeremy>
User-Agent: KMail/4.14.1 (Linux/3.16.0-10-586; KDE/4.14.2; i686; ; )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On and off over the past few months, I have been looking at getting the 
Synopsys DesignWare HDMI peripheral used in the Ingenic JZ4780 SoC working 
with a recent kernel. Unfortunately, what probably should be a straightforward 
task is proving more difficult than it seems, and I have been advised to ask 
for advice on this list.

== Background ==

Previously, in the vendor kernels released by Imagination Technologies for the 
MIPS Creator CI20, there were specialised HDMI drivers for the JZ4780:

* One (based on Linux 3.0.8) which seems to use a Synopsys hardware
  abstraction layer.

* Another (based on Linux 3.18) where the driver incorporates code used to
  support Freescale products and cooperates with a "CRTC" driver that has
  since been replaced by the ingenic-drm.c driver.

Since the Freescale-related code now seems to reside as a kind of generic 
driver in drivers/gpu/drm/bridge/synopsys [1], with some other drivers 
specialising this generic support, I thought that it might be straightforward 
to specialise the code similarly for the JZ4780. Unfortunately, I have not 
managed to achieve this so far, and I imagine that I must have overlooked 
something.

== Summary of Work ==

What I have done so far is to add a new file to...

drivers/gpu/drm/ingenic/dw_hdmi-jz4780.c

(See [2] for the full file.)

This specialises the generic dw-hdmi.c driver and is heavily based on the 
existing driver in...

drivers/gpu/drm/imx/dw_hdmi-imx.c

However, the probe and remove functions are defined in a similar way to...

drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c

It would appear, looking at the vendor kernel code, that the configuration of 
the peripheral in the JZ4780 is most similar to that done in the i.MX 
products, with various configuration operations that are done in their own 
particular way in the vendor kernel code now being done in a more generic way 
in the bridge driver code. So, I have a certain amount of confidence that the 
PLL and current control tables are reasonable.

== Observations ==

When powering up the system with the driver built into the kernel, the driver 
is able to obtain mode information over DDC using the Synopsys peripheral's 
own I2C support (which is more reliable than using the JZ4780's I2C 
peripherals), and a viable list of modes is obtained. However, the debugfs 
state information in /sys/kernel/debug/dri/0/state is largely unpopulated:

plane[31]: plane-0
        crtc=(null)
        fb=0
        crtc-pos=0x0+0+0
        src-pos=0.000000x0.000000+0.000000+0.000000
        rotation=1
        normalized-zpos=0
        color-encoding=ITU-R BT.601 YCbCr
        color-range=YCbCr limited range
crtc[32]: crtc-0
        enable=0
        active=0
        self_refresh_active=0
        planes_changed=0
        mode_changed=0
        active_changed=0
        connectors_changed=0
        color_mgmt_changed=0
        plane_mask=0
        connector_mask=0
        encoder_mask=0
        mode: "": 0 0 0 0 0 0 0 0 0 0 0x0 0x0
connector[34]: HDMI-A-1
        crtc=(null)
        self_refresh_aware=0

At the moment, I and others who have tried to test this code have seen that 
the peripheral is not enabled (as confirmed by inspecting the appropriate 
entry under /sys/devices/platform). It appears that one obstacle is that the 
"bus format" is not set for the connector. Here, I noticed (and was reminded 
again recently) that in the bridge driver, there is no call to 
drm_display_info_set_bus_formats unlike in other bridge drivers.

If such a call is added with a plausible bus format, the peripheral will be 
enabled, but the signal is not correct (monitors report things like "Input not 
supported"). It also occurs to me that other aspects of the signal may need to 
be defined. However, the debugfs state information will be populated with 
plausible values and seems to indicate that initialisation has taken place.

== Conclusions ==

Without direct modifications to dw-hdmi.c, it seems like the initialisation of 
the appropriate data structures is not being completed. Without the call to 
drm_display_info_set_bus_formats in dw_hdmi_bridge_attach, the encoder does 
not get set on the connector, and the chain of components is not fully 
traversed for initialisation.

One part of this situation is the dw_hdmi_setup function in the bridge driver. 
Here, there is the following code:

        /* TOFIX: Get input format from plat data or fallback to RGB888 */
        if (hdmi->plat_data->input_bus_format)
                hdmi->hdmi_data.enc_in_bus_format =
                        hdmi->plat_data->input_bus_format;
        else
                hdmi->hdmi_data.enc_in_bus_format = MEDIA_BUS_FMT_RGB888_1X24;

        /* TOFIX: Get input encoding from plat data or fallback to none */
        if (hdmi->plat_data->input_bus_encoding)
                hdmi->hdmi_data.enc_in_encoding =
                        hdmi->plat_data->input_bus_encoding;
        else
                hdmi->hdmi_data.enc_in_encoding = V4L2_YCBCR_ENC_DEFAULT;

What I seek guidance on is whether the unfixed nature of this code is having 
an impact and what I should be doing to make this driver initialise correctly. 
Given that there is no obvious documentation for the Synopsys peripheral, I 
feel that it will be a long journey figuring this out by myself.

Thanks for any advice that anyone might have!

Paul

[1] https://lists.freedesktop.org/archives/dri-devel/2017-March/134666.html

[2] http://git.goldelico.com/?p=letux-kernel.git;a=blob_plain;f=drivers/gpu/drm/ingenic/dw_hdmi-jz4780.c;hb=75c6904c2f198825f67172a0a5a98190fa54ae05
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
