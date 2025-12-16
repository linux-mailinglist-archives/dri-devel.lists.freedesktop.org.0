Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D23A8CC04B8
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 01:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B1110E5E7;
	Tue, 16 Dec 2025 00:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 274F510E5E7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 00:04:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 768D7FEC;
 Mon, 15 Dec 2025 16:04:17 -0800 (PST)
Received: from usa.arm.com (unknown [10.57.7.174])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AB5C23F762;
 Mon, 15 Dec 2025 16:04:22 -0800 (PST)
From: Aishwarya <aishwarya.tcv@arm.com>
To: boris.brezillon@collabora.com
Cc: airlied@gmail.com, aishwarya.tcv@arm.com, broonie@kernel.org,
 dri-devel@lists.freedesktop.org, karunika.choo@arm.com,
 linux-kernel@vger.kernel.org, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, nd@arm.com,
 simona@ffwll.ch, steven.price@arm.com, tzimmermann@suse.de
Subject: Re: [PATCH v5 6/8] drm/panthor: Support GLB_REQ.STATE field for
 Mali-G1 GPUs
Date: Tue, 16 Dec 2025 00:04:21 +0000
Message-ID: <20251216000421.19137-1-aishwarya.tcv@arm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251215201459.77b1d7e7@fedora>
References: <20251215201459.77b1d7e7@fedora>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Boris, Karunika,

I tested the diff on rk3588-rock-5b with and without
mali_csffw.bin installed.

With the firmware blob installed at
/lib/firmware/arm/mali/arch10.8/mali_csffw.bin, Panthor
initialises and probes successfully:

<6>[   16.920109] panthor fb000000.gpu: [drm] clock rate = 198000000
<6>[   16.923794] panthor fb000000.gpu: EM: created perf domain
<6>[   16.926724] panthor fb000000.gpu: [drm] Mali-G610 id 0xa867 major 0x0 minor 0x0 status 0x5
<6>[   16.927481] panthor fb000000.gpu: [drm] Features: L2:0x7120306 Tiler:0x809 Mem:0x301 MMU:0x2830 AS:0xff
<6>[   16.929417] panthor fb000000.gpu: [drm] shader_present=0x50005 l2_present=0x1 tiler_present=0x1
<6>[   16.931633] videodev: Linux video capture interface: v2.00
<6>[   16.937816] hantro-vpu fdb50000.video-codec: registered rockchip,rk3568-vpu-dec as /dev/video0
         Starting [0;1;39msystemd-user-sess…vice[0m - Permit User Sessions...
<4>[   16.953212] panthor fb000000.gpu: [drm] Firmware protected mode entry not be supported, ignoring
<6>[   16.954047] panthor fb000000.gpu: [drm] Firmware git sha: 95a25d71030715381f33105394285e1dcc860a65 
<6>[   16.954985] panthor fb000000.gpu: [drm] CSF FW using interface v1.5.0, Features 0x0 Instrumentation features 0x71
[[0;32m  OK  [0m] Finished [0;1;39msystemd-user-sess…ervice[0m - Permit User Sessions.
<6>[   16.988220] hantro-vpu fdba0000.video-codec: registered rockchip,rk3588-vepu121-enc as /dev/video1
<6>[   17.012257] [drm] Initialized panthor 1.5.0 for fb000000.gpu on minor 0
<6>[   17.019183] rockchip-rga fdb80000.rga: HW Version: 0x03.02
<6>[   17.019850] rockchip-rga fdb80000.rga: Registered rockchip-rga as /dev/video2
<6>[   17.027260] hantro-vpu fdba4000.video-codec: missing multi-core support, ignoring this instance
<6>[   17.032242] hantro-vpu fdba8000.video-codec: missing multi-core support, ignoring this instance
[[0;32m  OK  [0m] Started [0;1;39mgetty@tty1.service[0m - Getty on tty1.
<6>[   17.040973] hantro-vpu fdbac000.video-codec: missing multi-core support, ignoring this instance
[[0;32m  OK  [0m] Started [0;1;39mserial-getty@ttyS2…rvice<6>[   17.042138] hantro-vpu fdc70000.video-codec: registered rockchip,rk3588-av1-vpu-dec as /dev/video3
[0m - Serial Getty on ttyS2.
[[0;32m  OK  [0m] Reached target [0;1;39mgetty.target[0m - Login Prompts.
[[0;32m  OK  [0m] Reached target [0;1;39mmulti-user.target[0m - Multi-User System.
<6>[   17.061041] snps_hdmirx fdee0000.hdmi_receiver: assigned reserved memory node hdmi-receiver-cma
[[0;32m  OK  [0m] Reached target [0;1;39mgraphical.target[0m - Graphical Interface.
         Starting [0;1;39msystemd-update-ut… Record Runlevel Change in UTMP...
<6>[   17.097767] input: rk805 pwrkey as /devices/platform/feb20000.spi/spi_master/spi2/spi2.0/rk805-pwrkey.3.auto/input/input0
<6>[   17.105210] xhci-hcd xhci-hcd.4.auto: xHCI Host Controller
<6>[   17.105721] xhci-hcd xhci-hcd.4.auto: new USB bus registered, assigned bus number 5
<6>[   17.106474] xhci-hcd xhci-hcd.4.auto: hcc params 0x0220fe64 hci version 0x110 quirks 0x0000808002000010
<6>[   17.107320] xhci-hcd xhci-hcd.4.auto: irq 106, io mem 0xfcd00000
<6>[   17.107908] xhci-hcd xhci-hcd.4.auto: xHCI Host Controller
<6>[   17.108451] xhci-hcd xhci-hcd.4.auto: new USB bus registered, assigned bus number 6
<6>[   17.109140] xhci-hcd xhci-hcd.4.auto: Host supports USB 3.0 SuperSpeed
<4>[   17.116126] rtc-hym8563 6-0051: no valid clock/calendar values available
[[0;32m  OK  [0m] Finished [0;1;39msystemd-update-ut… - Record Runlevel Change in UTMP.
<6>[   17.136757] hub 5-0:1.0: USB hub found
<6>[   17.137158] hub 5-0:1.0: 1 port detected
<6>[   17.138787] rtc-hym8563 6-0051: registered as rtc0
<4>[   17.140243] rtc-hym8563 6-0051: no valid clock/calendar values available
<3>[   17.141064] rtc-hym8563 6-0051: hctosys: unable to read the hardware clock
Debian GNU/Linux 12 debian-bookworm-arm64 ttyS2
debian-bookworm-arm64 login: root (automatic login)

Without the firmware blob, the driver now fails probe with
but does not oops:

<6>[   16.967454] panthor fb000000.gpu: [drm] clock rate = 198000000
<6>[   16.969049] panthor fb000000.gpu: [drm] Mali-G610 id 0xa867 major 0x0 minor 0x0 status 0x5
<6>[   16.969790] panthor fb000000.gpu: [drm] Features: L2:0x7120306 Tiler:0x809 Mem:0x301 MMU:0x2830 AS:0xff
<6>[   16.970627] panthor fb000000.gpu: [drm] shader_present=0x50005 l2_present=0x1 tiler_present=0x1
<6>[   16.970642] rockchip-rga fdb80000.rga: Registered rockchip-rga as /dev/video3
<4>[   16.999584] panthor fb000000.gpu: Direct firmware load for arm/mali/arch10.8/mali_csffw.bin failed with error -2
<3>[   17.000646] panthor fb000000.gpu: [drm] *ERROR* Failed to load firmware image 'mali_csffw.bin'
<3>[   17.001784] panthor fb000000.gpu: probe with driver panthor failed with error -2
<6>[   17.010673] rockchip-drm display-subsystem: bound fdd90000.vop (ops vop2_component_ops [rockchipdrm])
<6>[   17.017837] input: rk805 pwrkey as /devices/platform/feb20000.spi/spi_master/spi2/spi2.0/rk805-pwrkey.3.auto/input/input0
<6>[   17.018094] dwhdmiqp-rockchip fdea0000.hdmi: registered DesignWare HDMI QP I2C bus driver
<6>[   17.021381] rockchip-drm display-subsystem: bound fdea0000.hdmi (ops dw_hdmi_qp_rockchip_ops [rockchipdrm])
         Starting [0;1;39msystemd-update-ut… Record Runlevel Change in UTMP...
[[0;32m  OK  [0m] Finished [0;1;39msystemd-update-ut… - Record Runlevel Change in UTMP.
<6>[   17.053595] xhci-hcd xhci-hcd.5.auto: xHCI Host Controller
<6>[   17.054241] xhci-hcd xhci-hcd.5.auto: new USB bus registered, assigned bus number 5
<4>[   17.054386] rtc-hym8563 6-0051: no valid clock/calendar values available
<6>[   17.055144] xhci-hcd xhci-hcd.5.auto: hcc params 0x0220fe64 hci version 0x110 quirks 0x0000808002000010
<6>[   17.056434] xhci-hcd xhci-hcd.5.auto: irq 109, io mem 0xfcd00000
<6>[   17.057099] xhci-hcd xhci-hcd.5.auto: xHCI Host Controller
<6>[   17.057336] dwhdmiqp-rockchip fdea0000.hdmi: registered DesignWare HDMI QP I2C bus driver
<6>[   17.057607] xhci-hcd xhci-hcd.5.auto: new USB bus registered, assigned bus number 6
<6>[   17.059024] xhci-hcd xhci-hcd.5.auto: Host supports USB 3.0 SuperSpeed
<6>[   17.061667] rtc-hym8563 6-0051: registered as rtc0
<6>[   17.062808] rockchip-drm display-subsystem: bound fdea0000.hdmi (ops dw_hdmi_qp_rockchip_ops [rockchipdrm])
<4>[   17.063381] rtc-hym8563 6-0051: no valid clock/calendar values available
<3>[   17.064342] rtc-hym8563 6-0051: hctosys: unable to read the hardware clock
<6>[   17.072001] rfkill_gpio rfkill-bt: rfkill-m2-bt device registered.
Debian GNU/Linux 12 debian-bookworm-arm64 ttyS2
debian-bookworm-arm64 login: root (automatic login)

Thanks,
Aishwarya
