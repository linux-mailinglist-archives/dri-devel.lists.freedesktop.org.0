Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F65A200252
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 08:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6AC6EC25;
	Fri, 19 Jun 2020 06:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id BFF226EB86
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 16:24:37 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 6E10480A9;
 Thu, 18 Jun 2020 16:25:29 +0000 (UTC)
Date: Thu, 18 Jun 2020 09:24:34 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2] drm/omap: force runtime PM suspend on system suspend
Message-ID: <20200618162434.GG43721@atomide.com>
References: <20200618095153.611071-1-tomi.valkeinen@ti.com>
 <20200618131608.GC43721@atomide.com>
 <b351785a-5be4-edd2-2907-c9b091cbb481@ti.com>
 <20200618144158.GE43721@atomide.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618144158.GE43721@atomide.com>
X-Mailman-Approved-At: Fri, 19 Jun 2020 06:58:10 +0000
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
Cc: linux-omap@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Tony Lindgren <tony@atomide.com> [200618 07:42]:
> I did not have luck the last time I tried am437x-sk-evm, but that
> seems like some separate regression that's been around for awhile.
> I recall testing it successfully last fall at some point.

OK I got am437x-sk-evm suspend and resume working again and
LCD console comes back after resume. I also had to apply the
panel-simple fix "drm/panel-simple: fix connector type for
newhaven_nhd_43_480272ef_atxl" to get LCD working again.

I was missing /lib/firmware/am335x-pm-firmware.elf after updating
my NFSroot file system. And FYI, here are the modules I now load
with my test script:

modprobe omap-mailbox
modprobe omap_remoteproc
modprobe wkup_m3_rproc
modprobe wkup_m3_ipc
modprobe pm33xx
modprobe rtc-omap
modprobe pwm-omap-dmtimer
modprobe pwm-tiecap
modprobe pwm_bl
modprobe edt-ft5x06		# on am437x-sk-evm
modprobe pixcir_i2c_ts		# NOT on am437x-sk-evm, only on am437x-gp-evm.dts
modprobe omapdrm
modprobe panel-simple
modprobe display-connector	# starting with v5.7-rc1
modprobe omapdss
modprobe panel-dpi
modprobe omap-dss

And then I get the following with rtcwake -m mem -s 5.

Sometimes cps and NFSroot seems to take few tens of seconds to
recover though.

Regards,

Tony

8< ------------------
[   33.481400] omapdss_dss 4832a000.dss: supply vdda_video not found, using dummy regulator
[   33.481573] DSS: OMAP DSS rev 2.0
[   33.485412] omapdss_dss 4832a000.dss: bound 4832a400.dispc (ops dispc_component_ops [omapdss])
[   33.485932] omapdrm omapdrm.0: DMM not available, disable DMM support
[   33.486322] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   33.525740] Console: switching to colour frame buffer device 60x34
[   33.543690] omapdrm omapdrm.0: fb0: omapdrmdrmfb frame buffer device
[   33.544563] [drm] Initialized omapdrm 1.0.0 20110917 for omapdrm.0 on minor 0
[   40.196247] vmmcwl_fixed: disabling
[  124.230087] PM: suspend entry (deep)
[  124.230152] Filesystems sync: 0.000 seconds
[  124.233068] Freezing user space processes ... (elapsed 0.001 seconds) done.
[  124.234420] OOM killer disabled.
[  124.234424] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[  124.235607] WARNING: This platform does not support off-mode, entering DeepSleep suspend.
[  124.235623] printk: Suspending console(s) (use no_console_suspend to debug)
[  124.255315] cpsw 4a100000.ethernet eth0: Link is Down
[  124.260828] Disabling non-boot CPUs ...
[  124.260839] WARNING: This platform does not support off-mode, entering DeepSleep suspend.
[  124.260839] WARNING: This platform does not support off-mode, entering DeepSleep suspend.
[  124.260839] pm33xx pm33xx: PM: Could not transition all powerdomains to target state
[  124.260839] PM: Wakeup source RTC Alarm
[  124.260839] WARNING: This platform does not support off-mode, entering DeepSleep suspend.
[  124.271744] ti-sysc 4a101200.target-module: OCP softreset timed out
[  124.274498] cpsw 4a100000.ethernet: initializing cpsw version 1.15 (0)
[  124.415839] Micrel KSZ9031 Gigabit PHY 4a101000.mdio:04: attached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=4a101000.mdio:04, irq=POLL)
[  124.493879] OOM killer enabled.
[  124.493885] Restarting tasks ... done.
[  124.502993] PM: suspend exit
[  132.757778] cpsw 4a100000.ethernet eth0: Link is Up - 1Gbps/Full - flow control off
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
