Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAC325762C
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 11:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09DC89C17;
	Mon, 31 Aug 2020 09:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1439 seconds by postgrey-1.36 at gabe;
 Mon, 31 Aug 2020 09:12:22 UTC
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E0589C17
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 09:12:22 +0000 (UTC)
Received: from p5b127f90.dip0.t-ipconnect.de ([91.18.127.144]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1kCfU4-0008NI-Jm; Mon, 31 Aug 2020 10:48:12 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-kernel@vger.kernel.org, Samuel Dionne-Riel <samuel@dionne-riel.com>,
 Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>,
 Yannick =?ISO-8859-1?Q?Fertr=E9?= <yannick.fertre@st.com>
Subject: Re: innolux p097pfg dpms off/on fails (on gru-scarlet) with
 dw-mipi-dsi
Date: Mon, 31 Aug 2020 10:48:11 +0200
Message-ID: <1980739.exF16SanBl@phil>
In-Reply-To: <20200830204756.1f9dba11@DUFFMAN>
References: <20200830204756.1f9dba11@DUFFMAN>
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
Cc: linux-rockchip@lists.infradead.org, Lin Huang <hl@rock-chips.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Samuel,

Am Montag, 31. August 2020, 02:47:56 CEST schrieb Samuel Dionne-Riel:
> I have an Asus Chromebook Tablet CT100PA, which I will refer to as
> "dumo" from this point on, which is a specific variant of gru-scarlet.
> As far as I am aware, all gru-scarlet are the same, except for the
> display, and in turn the different scarlets with the innolux panel
> are the same.
> 
> I do not have the hardware to verify the kingdisplay variant's
> behaviour, though I don't really expect it to fail the same way, but it
> is still a possibility that there is a root cause that could cause a
> similar failure.

as I said in that chat yesterday, this really looks like an issue
with how the dw-mipi-dsi handles powering on and off via the "hack"
in mode_set, which doesn't get called again in non-atomic contexts.

------- Reproducing the text from the paste from yesterday --------
    DRM component enablement is complex and runs in 3 stages:
    - mode_set goes outwards from crtc -> bridges -> panel
    - pre_enable goes inwards panel -> bridges -> crtc
    - enables again goes outwards crtc -> bridges -> panel
    
    The pre_enable callback for panels is meant to do its powerup which
    includes sending its init-sequence - see struct drm_panel
    documentation. But this in turn generally requires the dsi controller
    to be up and running.
    
    With pre_enable only running inwards the dsi-controller pre_enable
    only runs _after_ the panel's pre_enable, making panels unable to
    receive their init sequences.
    
    dw_mipi_dsi solved this "creatively" by putting the relevant commands
    into the mode_set (including clocks and phy setup) and in all-atomic
    environments this seems to work "ok", as mode_set gets call on every
    unblank of the display.
    
    But this solution stops working once applications use non-atomic
    modesetting, like X11 with the patch applied to v5.4 to block it from
    using atomic modesetting or an old qt (v5.9) in this case.
    
    Here only the pre_enable and enable callbacks gets called without
    invoking mode_set before, resulting in display output breaking after
    the first time the display gets disabled (like blanked due inactivity).
    
    For the short term fix this by simply not disabling the dw-dsi parts.
---------------------------------------------------------------------------

And while I wanted to tackle that problem at some point, so far
I haven't found the time to do so. I've added Yannick and Angelo
who also worked on the driver, maybe they have more ideas.

Heiko


> The display will apparently suspend (right wording?) fine with DPMS,
> but will not resume (wording?) fine. This has been an issue since the
> introduction of the driver and the introduction of the device (scarlet)
> to the kernel, and is still on 5.9-rc2.
> 
> Doing the following:
> 
>   $ xset dpms force off # standby, or suspend
>   $ xset dpms force on
> 
> Pretty much instantly the following messages are logged:
> 
> [   53.731851] dw-mipi-dsi-rockchip ff960000.mipi: failed to write command FIFO
> [   53.739815] panel-innolux-p079zca ff960000.mipi.0: failed to write command 0
> 
> Then 120 seconds later, this pair of WARN:
> 
> [  173.754168] ------------[ cut here ]------------
> [  173.759343] pclk_mipi_dsi1 already disabled
> [  173.764076] WARNING: CPU: 2 PID: 5182 at drivers/clk/clk.c:952 clk_core_disable+0x2c/0x94
> [  173.773216] Modules linked in:
> [  173.776639] CPU: 2 PID: 5182 Comm: X Not tainted 5.9.0-rc2 #1-mobile-nixos
> [  173.784323] Hardware name: Google Scarlet (DT)
> [  173.789292] pstate: 40000085 (nZcv daIf -PAN -UAO BTYPE=--)
> [  173.795522] pc : clk_core_disable+0x2c/0x94
> [  173.800199] lr : clk_core_disable+0x2c/0x94
> [  173.804871] sp : ffff800011d3ba20
> [  173.808573] x29: ffff800011d3ba20 x28: 0000000000000028
> [  173.814514] x27: ffff0000c32bdf00 x26: 0000000000000038
> [  173.820455] x25: ffff800010d2e2eb x24: ffff0000edece000
> [  173.826395] x23: ffff0000f0bea680 x22: 0000000000000001
> [  173.832326] x21: ffff0000ef82e0e0 x20: ffff0000f0986500
> [  173.838266] x19: ffff0000f0986500 x18: 0000000000000000
> [  173.844198] x17: 0000000000000000 x16: 0000000000000000
> [  173.850137] x15: 000000000000000a x14: 00000000000b962f
> [  173.856077] x13: ffff800091d3b76f x12: 0000000000000006
> [  173.862008] x11: ffffffffffffffff x10: 0000000000000030
> [  173.867939] x9 : ffff800011d3b77d x8 : 0000000000000000
> [  173.873869] x7 : 0000000000000008 x6 : ffff80001118811e
> [  173.879809] x5 : ffff0000f5589e48 x4 : 0000000000000000
> [  173.885741] x3 : 0000000000000027 x2 : 0000000000000027
> [  173.891680] x1 : ffff0000e5c3ee40 x0 : 000000000000001f
> [  173.897612] Call trace:
> [  173.900349]  clk_core_disable+0x2c/0x94
> [  173.904637]  clk_core_disable_lock+0x20/0x34
> [  173.909413]  clk_disable+0x1c/0x28
> [  173.913220]  dw_mipi_dsi_bridge_post_disable+0x80/0x120
> [  173.919065]  drm_atomic_bridge_chain_post_disable+0x74/0x98
> [  173.925297]  drm_atomic_helper_commit_modeset_disables+0x3d8/0x3dc
> [  173.932208]  drm_atomic_helper_commit_tail_rpm+0x20/0xa0
> [  173.938138]  commit_tail+0x74/0xf8
> [  173.941941]  drm_atomic_helper_commit+0x104/0x108
> [  173.947203]  drm_atomic_commit+0x48/0x54
> [  173.951590]  drm_atomic_connector_commit_dpms+0xa0/0x100
> [  173.957531]  drm_mode_obj_set_property_ioctl+0xd4/0x2c8
> [  173.963378]  drm_connector_property_set_ioctl+0x20/0x28
> [  173.969220]  drm_ioctl_kernel+0xa0/0xdc
> [  173.973507]  drm_ioctl+0x2c4/0x2ec
> [  173.977312]  vfs_ioctl+0x24/0x40
> [  173.980921]  __arm64_sys_ioctl+0x74/0xa4
> [  173.985299]  el0_svc_common.constprop.0+0xe0/0x160
> [  173.990655]  do_el0_svc+0x44/0x70
> [  173.994362]  el0_sync_handler+0xc8/0x184
> [  173.998747]  el0_sync+0x140/0x180
> [  174.002450] ---[ end trace 6c6d0de3ca79ec7d ]---
> [  174.007763] ------------[ cut here ]------------
> [  174.012925] pclk_mipi_dsi0 already disabled
> [  174.017633] WARNING: CPU: 5 PID: 5182 at drivers/clk/clk.c:952 clk_core_disable+0x2c/0x94
> [  174.026770] Modules linked in:
> [  174.030184] CPU: 5 PID: 5182 Comm: X Tainted: G        W         5.9.0-rc2 #1-mobile-nixos
> [  174.039419] Hardware name: Google Scarlet (DT)
> [  174.044382] pstate: 40000085 (nZcv daIf -PAN -UAO BTYPE=--)
> [  174.050608] pc : clk_core_disable+0x2c/0x94
> [  174.055278] lr : clk_core_disable+0x2c/0x94
> [  174.059948] sp : ffff800011d3ba20
> [  174.063646] x29: ffff800011d3ba20 x28: 0000000000000028
> [  174.069582] x27: ffff0000c32bdf00 x26: 0000000000000038
> [  174.075517] x25: ffff800010d2e2eb x24: ffff0000edece000
> [  174.081451] x23: ffff0000f0bea680 x22: 0000000000000001
> [  174.087385] x21: ffff0000ef82e0e0 x20: ffff0000f0986400
> [  174.093319] x19: ffff0000f0986400 x18: 0000000000000000
> [  174.099254] x17: 0000000000000000 x16: 0000000000000000
> [  174.105187] x15: 000000000000000a x14: 000000000000327d
> [  174.111121] x13: ffff800091d3b76f x12: 0000000000000006
> [  174.117055] x11: ffffffffffffffff x10: 0000000000000030
> [  174.122989] x9 : ffff800011d3b77d x8 : 0000000000000000
> [  174.128923] x7 : 0000000000000008 x6 : ffff80001118811e
> [  174.134856] x5 : ffff0000f55cbe48 x4 : 0000000000000000
> [  174.140789] x3 : 0000000000000027 x2 : 0000000000000027
> [  174.146723] x1 : ffff0000e5c3ee40 x0 : 000000000000001f
> [  174.152657] Call trace:
> [  174.155388]  clk_core_disable+0x2c/0x94
> [  174.159670]  clk_core_disable_lock+0x20/0x34
> [  174.164439]  clk_disable+0x1c/0x28
> [  174.168239]  dw_mipi_dsi_bridge_post_disable+0xc4/0x120
> [  174.174077]  drm_atomic_bridge_chain_post_disable+0x74/0x98
> [  174.180303]  drm_atomic_helper_commit_modeset_disables+0x3d8/0x3dc
> [  174.187208]  drm_atomic_helper_commit_tail_rpm+0x20/0xa0
> [  174.193140]  commit_tail+0x74/0xf8
> [  174.196938]  drm_atomic_helper_commit+0x104/0x108
> [  174.202191]  drm_atomic_commit+0x48/0x54
> [  174.206571]  drm_atomic_connector_commit_dpms+0xa0/0x100
> [  174.212505]  drm_mode_obj_set_property_ioctl+0xd4/0x2c8
> [  174.218343]  drm_connector_property_set_ioctl+0x20/0x28
> [  174.224179]  drm_ioctl_kernel+0xa0/0xdc
> [  174.228461]  drm_ioctl+0x2c4/0x2ec
> [  174.232258]  vfs_ioctl+0x24/0x40
> [  174.235860]  __arm64_sys_ioctl+0x74/0xa4
> [  174.240240]  el0_svc_common.constprop.0+0xe0/0x160
> [  174.245592]  do_el0_svc+0x44/0x70
> [  174.249294]  el0_sync_handler+0xc8/0x184
> [  174.253672]  el0_sync+0x140/0x180
> [  174.257372] ---[ end trace 6c6d0de3ca79ec7e ]---
> 
> 
> Any further interaction with trying to "resume" or "suspend" the
> display ends up with similar messages that I'd characterize as
> the clock states being "confused".
> 
>  * Enabling unprepared pclk_mipi_dsi[01]
>  * pclk_mipi_dsi[01] already disabled
> 
> Note that before being stuck in a confused state, using the /sys/ nodes
> as follow seem to not cause issues:
> 
>   $ echo 1 | sudo tee /sys/class/graphics/fb0/blank
>   $ echo 0 | sudo tee /sys/class/graphics/fb0/blank
> 
> Though once set in a confused state, it fails to recover with anything
> I throw at it.
> 
> Not sure that it matters, but during all the operations the backlight
> operates as expected, it seems only the MIPI subsystem is not working
> as expected.
> 
> For context, here's some bits of knowledge from an IRC conversation on
> the #chromium-os channel on Freenode.
> 
> > <mmind00> samueldr amstan: the issue is probably with how
> > the dsi bridge handles powerons ... which in turn is a hack around
> > how DRM handles display bringup
> >
> > <mmind00> samueldr amstan: bigger explanation from an
> > internal commit I carry around: http://paste.debian.net/1161814/
> >
> > <mmind00> at least that is the dsi issue I ran into with
> > our product using the dw-dsi ... even if dw-dsi is still pre-bridge,
> > the issue might be similar - see non-atomic access not always calling
> > mode_set
> 
> If there's any more information that can be helpful for figuring out
> the issue, I'm open to trying them.
> 
> Additionally, I'm okay with being given tips or resources about how to
> fix the problem. This is out of my realm of expertise, and I'm
> definitely confused by the new terminology and lack of background
> knowledge.
> 
> Thanks,
> 
> 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
