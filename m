Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D45A95B893B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 15:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD35710E918;
	Wed, 14 Sep 2022 13:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C01D10E915
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 13:35:38 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1oYSYB-00072G-6N; Wed, 14 Sep 2022 15:35:35 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1oYSY6-0001dl-EC; Wed, 14 Sep 2022 15:35:30 +0200
Date: Wed, 14 Sep 2022 15:35:30 +0200
From: Sascha Hauer <sha@pengutronix.de>
To: Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH] drm/rockchip: vop2: Fix Null Pointer Dereference on
 Multiple VPs
Message-ID: <20220914133530.GW6477@pengutronix.de>
References: <20220912180242.499-1-macroalpha82@gmail.com>
 <d8a86990-6d9f-9ca0-326a-e5706f924516@wolfvision.net>
 <20220914064927.GS6477@pengutronix.de>
 <SN6PR06MB53426F3713C84EDB67F65133A5469@SN6PR06MB5342.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR06MB53426F3713C84EDB67F65133A5469@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: airlied@linux.ie, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 Chris Morgan <macroalpha82@gmail.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 14, 2022 at 08:04:18AM -0500, Chris Morgan wrote:
> On Wed, Sep 14, 2022 at 08:49:27AM +0200, Sascha Hauer wrote:
> > On Tue, Sep 13, 2022 at 08:55:22AM +0200, Michael Riesch wrote:
> > > Hi,
> > > 
> > > On 9/12/22 20:02, Chris Morgan wrote:
> > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > 
> > > Cc: Sascha -> any thoughts on this one?
> > > 
> > > Best regards,
> > > Michael
> > > 
> > > > If I use more than one VP to output on an RK3566 based device I
> > > > receive the following error (and then everything freezes):
> > > > 
> > > > [    0.838375] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000250
> > > > [    0.839191] Mem abort info:
> > > > [    0.839442]   ESR = 0x0000000096000005
> > > > [    0.839785]   EC = 0x25: DABT (current EL), IL = 32 bits
> > > > [    0.840256]   SET = 0, FnV = 0
> > > > [    0.840530]   EA = 0, S1PTW = 0
> > > > [    0.840821]   FSC = 0x05: level 1 translation fault
> > > > [    0.841254] Data abort info:
> > > > [    0.841512]   ISV = 0, ISS = 0x00000005
> > > > [    0.841864]   CM = 0, WnR = 0
> > > > [    0.842130] [0000000000000250] user address but active_mm is swapper
> > > > [    0.842704] Internal error: Oops: 96000005 [#1] SMP
> > > > [    0.843139] Modules linked in:
> > > > [    0.843420] CPU: 0 PID: 37 Comm: kworker/u8:1 Not tainted 6.0.0-rc5+ #40
> > > > [    0.844013] Hardware name: RG503 (DT)
> > > > [    0.844343] Workqueue: events_unbound deferred_probe_work_func
> > > > [    0.844871] pstate: 80000009 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > > > [    0.845487] pc : __drm_crtc_init_with_planes+0x48/0x2e4
> > > > [    0.845956] lr : drm_crtc_init_with_planes+0x68/0x94
> > > > [    0.846399] sp : ffffffc00a7a3710
> > > > [    0.846695] x29: ffffffc00a7a3710 x28: ffffff8000fb4080 x27: ffffffc00a7a37a0
> > > > [    0.847332] x26: ffffffc0097d01c7 x25: ffffff8000fb44d8 x24: ffffffc0097d01c7
> > > > [    0.847967] x23: ffffffc009311870 x22: 0000000000000000 x21: 0000000000000008
> > > > [    0.848603] x20: ffffff80010d0800 x19: ffffff8000fb44e8 x18: 0000000000000000
> > > > [    0.849237] x17: 08000000000000d1 x16: 0800000000000091 x15: 08000000000000c1
> > > > [    0.849874] x14: 0000000000000000 x13: 3432564e3631564e x12: 3231564e36314742
> > > > [    0.850509] x11: 3631475234324742 x10: 000000000000002d x9 : ffffffc008682004
> > > > [    0.851144] x8 : 00000000006f7475 x7 : 00000000fffffff0 x6 : ffffffc00a7a37a0
> > > > [    0.851778] x5 : ffffffc0097d01c7 x4 : ffffffc009311870 x3 : 0000000000000000
> > > > [    0.852412] x2 : 0000000000000008 x1 : ffffff8000fb44e8 x0 : ffffff80010d0800
> > > > [    0.853048] Call trace:
> > > > [    0.853270]  __drm_crtc_init_with_planes+0x48/0x2e4
> > > > [    0.853706]  drm_crtc_init_with_planes+0x68/0x94
> > > > [    0.854118]  vop2_bind+0x89c/0x920
> > > > [    0.854429]  component_bind_all+0x18c/0x290
> > > > [    0.854805]  rockchip_drm_bind+0xe4/0x1f0
> > > > [    0.855166]  try_to_bring_up_aggregate_device+0x9c/0x290
> > > > [    0.855639]  __component_add+0x110/0x168
> > > > [    0.855991]  component_add+0x1c/0x28
> > > > [    0.856312]  dw_mipi_dsi_rockchip_host_attach+0x98/0x10c
> > > > [    0.856785]  dw_mipi_dsi_host_attach+0xbc/0xd0
> > > > [    0.857184]  mipi_dsi_attach+0x30/0x44
> > > > [    0.857521]  devm_mipi_dsi_attach+0x2c/0x70
> > > > [    0.857896]  ams495qa01_probe+0x2d4/0x33c
> > > > [    0.858257]  spi_probe+0x8c/0xb8
> > > > [    0.858550]  really_probe+0x1e0/0x3b8
> > > > [    0.858881]  __driver_probe_device+0x16c/0x184
> > > > [    0.859278]  driver_probe_device+0x4c/0xfc
> > > > [    0.859646]  __device_attach_driver+0xf0/0x170
> > > > [    0.860043]  bus_for_each_drv+0xa4/0xcc
> > > > [    0.860389]  __device_attach+0xfc/0x1a8
> > > > [    0.860733]  device_initial_probe+0x1c/0x28
> > > > [    0.861108]  bus_probe_device+0x38/0x9c
> > > > [    0.861452]  deferred_probe_work_func+0xdc/0xf0
> > > > [    0.861855]  process_one_work+0x1b0/0x260
> > > > [    0.862217]  process_scheduled_works+0x4c/0x50
> > > > [    0.862614]  worker_thread+0x1f0/0x26c
> > > > [    0.862949]  kthread+0xc4/0xd4
> > > > [    0.863227]  ret_from_fork+0x10/0x20
> > > > [    0.863553] Code: aa0503fa f9002bfb aa0603fb b40000a2 (b9424840)
> > > > [    0.864095] ---[ end trace 0000000000000000 ]---
> > > > 
> > > > A cursory reading of the datasheet suggests it's possible to have
> > > > simultaneous output to 2 distinct outputs. On page 13 it states:
> > > > 
> > > > Support two simultaneous displays(same source) in the following interfaces:
> > > > - MIPI_DSI_TX
> > > > - LVDS
> > > > - HDMI
> > > > - eDP
> > > > 
> > > > In order to achieve this though, I need to output to VP0 and VP1 (or
> > > > any 2 distinct VPs really). This is so I can have the ref clock set
> > > > to 24MHz for the HDMI and the pixel clock of the DSI panel (for the
> > > > example above it's 33.5MHz).  Currently, only by removing this code
> > > > block is such a thing possible, though I'm not sure if long-term
> > > > there should only be 1 CRTC for the rk3566 (and 2 CRTCs for 3568)
> > > > along with a max of 2 encoders for rk3566 (and 3 encoders for 3568).
> > > > 
> > > > Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
> > > > 
> > > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > > ---
> > > >  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 14 --------------
> > > >  1 file changed, 14 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > > > index e4631f515ba4..f18d7f6f9f86 100644
> > > > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > > > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > > > @@ -2289,20 +2289,6 @@ static int vop2_create_crtc(struct vop2 *vop2)
> > > >  		struct vop2_win *win = &vop2->win[i];
> > > >  		u32 possible_crtcs;
> > > >  
> > > > -		if (vop2->data->soc_id == 3566) {
> > > > -			/*
> > > > -			 * On RK3566 these windows don't have an independent
> > > > -			 * framebuffer. They share the framebuffer with smart0,
> > > > -			 * esmart0 and cluster0 respectively.
> > > > -			 */
> > > > -			switch (win->data->phys_id) {
> > > > -			case ROCKCHIP_VOP2_SMART1:
> > > > -			case ROCKCHIP_VOP2_ESMART1:
> > > > -			case ROCKCHIP_VOP2_CLUSTER1:
> > > > -				continue;
> > > > -			}
> > > > -		}
> > 
> > Let me say that a "window" in the Rockchip terminology is what a plane
> > is in the DRM terminology, and a video port (vp) corresponds to a crtc.
> > 
> > On the RK3566 some windows do not have their own framebuffer, for
> > example the smart1 window always shows what the smart0 window shows.
> > This "feature" makes these windows unusable as planes, so the idea is to
> > simply not use them.
> > 
> > If skipping these windows from initialization results in a NULL pointer
> > deref then there's something wrong in the driver logic, but it's not the
> > lines you are removing here that are wrong. Nothing should prevent you
> > from using multiple VPs when the unusable windows on RK3566 are not
> > registered.
> 
> I'll tell you what I "think" is causing the null pointer deref, but like
> always I reserve the right to be wrong.
> 
> The driver checks for the primary planes and assigns them to active
> video ports. For the rk3566 it's skipping the 3 planes mentioned
> above for the RK3566. As a result if there is more than 1 active video
> port for the rk3566 (or more than 2 for the rk3568 I'm assuming) it
> doesn't set vp->primary_plane = win for that port. Slightly below that
> it iterates through the active video ports again and runs
> drm_crtc_init_with_planes on them. Only in this case one of the ports
> doesn't have a plane, which is where it does the null pointer deref,
> because the plane is null.

Yes, you're right, that is likely the problem.

On RK3568 we have four windows that could serve as primary plane, so
there's enough for each of the three VPs. On RK3566 we only have two
windows, so once we use more than two active VPs we are running out of
primary planes.

I am writing these numbers because I think Esmart0-win0 could be used as
primary plane, but is marked as DRM_PLANE_TYPE_OVERLAY in
rk3568_vop_win_data[]. See the attached patch, if that's the problem it
should resolve your issue.

That is not enough though once three VPs are active on RK3566. The
Cluster windows could likely be used as primary planes as well, they are
probably just not marked as such because they only support AFBC modes.

Sascha

-------------------------8<-------------------------

From f98f53565ce868811581afbb18451dfea2646b07 Mon Sep 17 00:00:00 2001
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 14 Sep 2022 15:27:51 +0200
Subject: [PATCH] drm/rockchip: vop2: Register Esmart0-win0 as primary plane

Esmart0-win0 could serve as primary plane, so mark it as such. On
RK3568 this window will never be used as primary plane, because the
three windows at the beginning of the rk3568_vop_win_data[] array
will be used. On RK3566 however, two of the windows at the beginning
of the rk3568_vop_win_data[] array cannot not be used, so we end
up without primary planes when multiple VPs are active.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 9bf0637bf8e26..9d30aa73b5422 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -188,7 +188,7 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
 		.base = 0x1800,
 		.layer_sel_id = 2,
 		.supported_rotations = DRM_MODE_REFLECT_Y,
-		.type = DRM_PLANE_TYPE_OVERLAY,
+		.type = DRM_PLANE_TYPE_PRIMARY,
 		.max_upscale_factor = 8,
 		.max_downscale_factor = 8,
 		.dly = { 20, 47, 41 },
-- 
2.30.2


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
