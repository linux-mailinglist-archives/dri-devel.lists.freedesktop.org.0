Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6AFA84160
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 13:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54F610E960;
	Thu, 10 Apr 2025 11:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UUSpCSfR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D6C10E960
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 11:03:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0243D455;
 Thu, 10 Apr 2025 13:01:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1744282878;
 bh=b7+R5N8tjAIPHixahjtSIzvDtEzOx7UBmOpOEyK0+20=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UUSpCSfRq6QdZV4n0VDzQMQkOF0j2p+SqHK0jijo3wv8cFl33LHz3WSQXWJlUu9yi
 MxQpNKdW2ktYAAu8PQOfN28CZX48NtECrSMw3ZUgIUJ0j5/L7aIc6aDLrM8TfMXT4n
 xlxSILfXHB+Eths3PYgFnI0TrP1IlCAroLv7N49c=
Date: Thu, 10 Apr 2025 14:02:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: Need Help Enabling HDMI on Debix Model A
Message-ID: <20250410110250.GB24866@pendragon.ideasonboard.com>
References: <PN3P287MB1829E84B6B79E9C7189D7CB78BAA2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250407130257.GD3924@pendragon.ideasonboard.com>
 <PN3P287MB1829692B4C3D5AD273CB62DE8BAA2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250409210504.GB12162@pendragon.ideasonboard.com>
 <PN3P287MB18297239252C1032A05686558BB72@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3P287MB18297239252C1032A05686558BB72@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
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

Hi Tarang,

On Thu, Apr 10, 2025 at 08:13:17AM +0000, Tarang Raval wrote:
> > On Mon, Apr 07, 2025 at 02:06:35PM +0000, Tarang Raval wrote:
> > > > On Mon, Apr 07, 2025 at 11:10:23AM +0000, Tarang Raval wrote:
> > > > > Hi Laurent,
> > > > >
> > > > > I’m trying to bring up HDMI on the Debix Model A board using the
> > > > > mainline kernel, but I’m currently facing issues.
> > > > >
> > > > > I saw that you tested the patch for HDMI support on this board in
> > > > > mainline, so I am hoping you could help me figure out what might be
> > > > > missing.
> > > > >
> > > > > To clarify — I'm using the prebuilt image provided by Debix, but I replaced
> > > > > the kernel image and the device tree (DTS) file in the /boot directory with
> > > > > ones built from the mainline kernel.
> > > > >
> > > > > I’ve enabled the following configurations in the kernel:
> > > > > CONFIG_DRM_DISPLAY_CONNECTOR=y
> > > > > CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE=y
> > > > > CONFIG_DRM_IMX8MP_HDMI_PVI=y
> > > > > CONFIG_DRM_IMX_LCDIF=y
> > > > > CONFIG_PHY_FSL_SAMSUNG_HDMI_PHY=y
> > > > >
> > > > > When I boot the board, I see the following HDMI/DRM related logs:
> > > > > debix@imx8mp-debix:~$ dmesg | grep -iE "drm|hdmi"
> > > > > [    0.121979] /soc@0/bus@32c00000/display-bridge@32fc4000: Fixed dependency cycle(s) with /soc@0/bus@32c00000/hdmi@32fd8000
> > > > > [    0.122164] /soc@0/bus@32c00000/hdmi@32fd8000: Fixed dependency cycle(s) with /soc@0/bus@32c00000/display-bridge@32fc4000
> > > > > [    0.127417] /soc@0/bus@32c00000/hdmi@32fd8000: Fixed dependency cycle(s) with /hdmi-connector
> > > > > [    0.127608] /hdmi-connector: Fixed dependency cycle(s) with /soc@0/bus@32c00000/hdmi@32fd8000
> > > > > [    1.947962] imx8mp-dw-hdmi-tx 32fd8000.hdmi: Detected HDMI TX controller v2.13a with HDCP (SAMSUNG HDMI TX PHY)
> > > > > [    1.949220] imx8mp-dw-hdmi-tx 32fd8000.hdmi: registered DesignWare HDMI I2C bus driver
> > > > > [    1.956365] [drm] Initialized imx-lcdif 1.0.0 for 32fc6000.display-controller on minor 0
> > > > > [    2.016601] imx-lcdif 32fc6000.display-controller: [drm] fb0: imx-lcdifdrmfb frame buffer device
> > > > > [    8.380915] systemd[1]: Starting Load Kernel Module drm...
> > > > >
> > > > >
> > > > > I also checked that the display's modeline is recognized under sysfs :
> > > > >
> > > > > root@imx8mp-debix:~# ls /sys/class/drm/card0-HDMI-A-1/
> > > > > connector_id  dpms          modes         subsystem/
> > > > > ddc/          edid          power/        uevent
> > > > > device/       enabled       status
> > > > >
> > > > > However, there is still no HDMI output on the display. Instead,
> > > > > I only see a white blinking cursor on the screen.. I'm not sure
> > > > > what I'm missing.
> > > > 
> > > > The white blinking cursor means the display is working from the kernel
> > > > point of view. What are you expecting, are you running an X server or
> > > > Wayland compositor ?
> > >
> > > I'm expecting to see the Ubuntu desktop environment on the HDMI
> > > display — just like how it appears with the original prebuilt image provided
> > > by Debix. I'm running the default Ubuntu 22.04 LTS prebuilt image, and I only
> > > replaced the Image and .dtb file
> > >
> > > I'm not explicitly launching an X server or Wayland compositor myself
> > >
> > > However, based on your response, I now realize that I may also need to
> > > enable GPU support in the mainline device tree. Specifically, I believe I
> > > need to enable the gpu2D and gpu3D nodes to allow the graphical
> > > environment to start properly and render the desktop over HDMI.
> > >
> > > Does that sound correct, or is there anything else I should check or
> > > enable?
> > 
> > That's a plausible explanation. The 2D GPU is probably not used by the
> > compositor, but a 3D GPU could be required. I'd recommend checking the
> > system logs to see why the compositor (or session manager) failed to
> > start.
> 
> I reviewed the system logs for more context regarding the failure of the 
> compositor (or session manager) to start.
> 
> Here are some relevant log entries from journalctl -b -p err:
> 
> debix@imx8mp-debix:~$ journalctl -b -p err
> Hint: You are currently not seeing messages from other users and the system.
>       Users in groups 'adm', 'systemd-journal' can see all messages.
>       Pass -q to turn off this notice.
> Apr 10 06:37:29 imx8mp-debix pulseaudio[766]: GetManagedObjects() failed: org.freedesktop.systemd1.NoSuchUnit: Unit dbus-org.bluez.serv>
> Apr 10 06:37:29 imx8mp-debix systemd[757]: Failed to start Application launched by gnome-session-binary.
> Apr 10 06:37:29 imx8mp-debix systemd[757]: Failed to start Application launched by gnome-session-binary.
> Apr 10 06:37:30 imx8mp-debix systemd[757]: Failed to start GNOME Shell on Wayland.
> 
> Additionally, from journalctl -b | grep -i gnome, the following lines appear to be significant:
> 
> Apr 10 06:37:29 imx8mp-debix systemd[757]: org.gnome.Shell@x11.service: Skipped due to 'exec-condition'.
> Apr 10 06:37:29 imx8mp-debix systemd[757]: Started GNOME Shell on X11.
> Apr 10 06:37:30 imx8mp-debix gnome-shell[873]: Running GNOME Shell (using mutter 42.9) as a Wayland display server
> Apr 10 06:37:30 imx8mp-debix gnome-shell[873]: g_hash_table_destroy: assertion 'hash_table != NULL' failed
> Apr 10 06:37:30 imx8mp-debix gnome-shell[873]: Failed to open gpu '/dev/dri/card0': No suitable mode setting backend found

I don't know how gnome-shell finds the GPU, if Ubuntu ships a modified
version, or possibly configuration files specific to the closed-source
GPU stack shipped with the BSP kernel. It could also be that the mesa
version they ship does not support the upstream kernel driver. You will
have to investigate all this.

> Apr 10 06:37:30 imx8mp-debix gnome-shell[873]: Added device '/dev/dri/card1' (imx-lcdif) using atomic mode setting.
> Apr 10 06:37:30 imx8mp-debix gnome-shell[873]: Failed to setup: No GPUs with outputs found
> 
> the GNOME Shell logs indicate that no GPUs with outputs were found but the dmesg 
> output suggests that the GPU is successfully probed and initialized:
> 
> debix@imx8mp-debix:~$ dmesg | grep -i -e drm -e gpu -e galcore -e etnaviv
> [    2.156784] etnaviv etnaviv: bound 38000000.gpu (ops gpu_ops)
> [    2.157294] etnaviv etnaviv: bound 38008000.gpu (ops gpu_ops)
> [    2.157753] etnaviv etnaviv: bound 38500000.npu (ops gpu_ops)
> [    2.157852] etnaviv-gpu 38000000.gpu: model: GC7000, revision: 6204
> [    2.157986] etnaviv-gpu 38008000.gpu: model: GC520, revision: 5341
> [    2.158111] etnaviv-gpu 38500000.npu: model: GC8000, revision: 8002
> [    2.158118] etnaviv-gpu 38500000.npu: etnaviv has been instantiated on a NPU, for which the UAPI is still experimental
> [    2.158905] [drm] Initialized etnaviv 1.4.0 for etnaviv on minor 0
> [    2.161597] [drm] Initialized imx-lcdif 1.0.0 for 32fc6000.display-controller on minor 1
> [    2.161637] imx-lcdif 32fc6000.display-controller: [drm] Cannot find any crtc or sizes

This doesn't seem right. Here's the corresponding part of my boot log:

[    3.347606] imx8mp-dw-hdmi-tx 32fd8000.hdmi: Detected HDMI TX controller v2.13a with HDCP (SAMSUNG HDMI TX PHY)
[    3.352436] imx8mp-dw-hdmi-tx 32fd8000.hdmi: registered DesignWare HDMI I2C bus driver
[    3.378609] etnaviv etnaviv: bound 38000000.gpu (ops gpu_ops)
[    3.379829] etnaviv etnaviv: bound 38008000.gpu (ops gpu_ops)
[    3.381695] etnaviv etnaviv: bound 38500000.npu (ops gpu_ops)
[    3.382290] etnaviv-gpu 38000000.gpu: model: GC7000, revision: 6204
[    3.383178] etnaviv-gpu 38008000.gpu: model: GC520, revision: 5341
[    3.383735] etnaviv-gpu 38500000.npu: model: GC8000, revision: 8002
[    3.383753] etnaviv-gpu 38500000.npu: etnaviv has been instantiated on a NPU, for which the UAPI is still experimental
[    3.386818] [drm] Initialized etnaviv 1.4.0 for etnaviv on minor 0
[    3.390018] stackdepot: allocating hash table of 131072 entries via kvcalloc
[    3.399113] [drm] Initialized imx-lcdif 1.0.0 for 32fc6000.display-controller on minor 1
[    3.523021] Console: switching to colour frame buffer device 180x56
[    3.539272] imx-lcdif 32fc6000.display-controller: [drm] fb0: imx-lcdifdrmfb frame buffer device

> [   10.201152] systemd[1]: Starting Load Kernel Module drm...
> 
> I have not yet identified a conclusive reason for GNOME Shell's failure to start.  
> 
> However, since my primary objective was to preview the camera output 
> on the display, I initially suspected the issue might be related to the HDMI 
> display, as I encountered errors while using autovideosink. After your 
> confirmation that the display was functioning correctly, I explored alternative 
> video sinks and was able to successfully achieve a working preview using 
> fbdevsink.
> 
> I may revisit the GNOME Shell issue when time permits. If you have any 
> suggestions or insights regarding the compositor or GPU setup failure, I’d be 
> happy to take them into consideration.
> 
> > > > > Could you please help me out or point me in the right direction?
> > > > >
> > > > > Thank you for your time.

-- 
Regards,

Laurent Pinchart
