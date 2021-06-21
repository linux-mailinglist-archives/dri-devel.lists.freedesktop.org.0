Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B44783AE9C8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 15:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3576E055;
	Mon, 21 Jun 2021 13:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C206E055
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 13:09:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B08122C60;
 Mon, 21 Jun 2021 15:09:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624280971;
 bh=9g7W/C8LW/pdKsJQB96Me2g6IBkNCCeOwVGaY+CMs8Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sw4SK5nB/R4bZUdT7FeGyyF+eZwqWn7JB2ziOYIIhfv6l2u0GHTOYqHxIUeGA5XIB
 thnWYV7uigrALGS3+xFznBCJPH+xOirHW5V5+LA660DdxOztHQvK8o/LuFuqOSALPg
 AjTWBs5MYakgGGEaCcJ37Si7YDgENfaTFepEKlDs=
Date: Mon, 21 Jun 2021 16:09:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH] drm/vc4: dsi: Only register our component once a DSI
 device is attached
Message-ID: <YNCPcbJTEZVLJyCF@pendragon.ideasonboard.com>
References: <20200707101912.571531-1-maxime@cerno.tech>
 <YM6dgVb12oITNfc0@pendragon.ideasonboard.com>
 <CAPY8ntC+hzmfrJwWW0ytNdHSXruMKMi7N3K6tdJbp9gDBbJ3Qw@mail.gmail.com>
 <YM+MEsKjdkYAVI5X@pendragon.ideasonboard.com>
 <YM/FwVkkQXX8VrzV@pendragon.ideasonboard.com>
 <CAPY8ntCbzFkbM5fZmo3RVw5okQkVKFcR8TCHOo+xkW7wNk8MQA@mail.gmail.com>
 <YNCMbw6B6OL4Gho3@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YNCMbw6B6OL4Gho3@pendragon.ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, Tim Gover <tim.gover@raspberrypi.com>,
 Eric Anholt <eric@anholt.net>, linux-arm-kernel@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 Maxime Ripard <maxime@cerno.tech>, Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

On Mon, Jun 21, 2021 at 03:56:16PM +0300, Laurent Pinchart wrote:
> On Mon, Jun 21, 2021 at 12:49:14PM +0100, Dave Stevenson wrote:
> > On Sun, 20 Jun 2021 at 23:49, Laurent Pinchart wrote:
> > > On Sun, Jun 20, 2021 at 09:42:27PM +0300, Laurent Pinchart wrote:
> > > > On Sun, Jun 20, 2021 at 03:29:03PM +0100, Dave Stevenson wrote:
> > > > > On Sun, 20 Jun 2021 at 04:26, Laurent Pinchart wrote:
> > > > > >
> > > > > > Hi Maxime,
> > > > > >
> > > > > > I'm testing this, and I'm afraid it causes an issue with all the
> > > > > > I2C-controlled bridges. I'm focussing on the newly merged ti-sn65dsi83
> > > > > > driver at the moment, but other are affected the same way.
> > > > > >
> > > > > > With this patch, the DSI component is only added when the DSI device is
> > > > > > attached to the host with mipi_dsi_attach(). In the ti-sn65dsi83 driver,
> > > > > > this happens in the bridge attach callback, which is called when the
> > > > > > bridge is attached by a call to drm_bridge_attach() in vc4_dsi_bind().
> > > > > > This creates a circular dependency, and the DRM/KMS device is never
> > > > > > created.
> > > > > >
> > > > > > How should this be solved ? Dave, I think you have shown an interest in
> > > > > > the sn65dsi83 recently, any help would be appreciated. On a side note,
> > > > > > I've tested the ti-sn65dsi83 driver on a v5.10 RPi kernel, without much
> > > > > > success (on top of commit e1499baa0b0c I get a very weird frame rate -
> > > > > > 147 fps of 99 fps instead of 60 fps - and nothing on the screen, and on
> > > > > > top of the latest v5.10 RPi branch, I get lock-related warnings at every
> > > > > > page flip), which is why I tried v5.12 and noticed this patch. Is it
> > > > > > worth trying to bring up the display on the v5.10 RPi kernel in parallel
> > > > > > to fixing the issue introduced in this patch, or is DSI known to be
> > > > > > broken there ?
> > > > >
> > > > > I've been looking at SN65DSI83/4, but as I don't have any hardware
> > > > > I've largely been suggesting things to try to those on the forums who
> > > > > do [1].
> > > > >
> > > > > My branch at https://github.com/6by9/linux/tree/rpi-5.10.y-sn65dsi8x-marek
> > > > > is the latest one I've worked on. It's rpi-5.10.y with Marek's driver
> > > > > cherry-picked, and an overlay and simple-panel definition by others.
> > > > > It also has a rework for vc4_dsi to use pm_runtime, instead of
> > > > > breaking up the DSI bridge chain (which is flawed as it never calls
> > > > > the bridge mode_set or mode_valid functions which sn65dsi83 relies
> > > > > on).
> > > > >
> > > > > I ran it on Friday in the lab and encountered an issue with vc4_dsi
> > > > > should vc4_dsi_encoder_mode_fixup wish for a divider of 7 (required
> > > > > for this 800x1280 panel over 4 lanes) where it resulted in an invalid
> > > > > mode configuration. That resulted in patch [2] which then gave me
> > > > > sensible numbers.
> > > > >
> > > > > That branch with dtoverlay=vc4-kms-v3d and
> > > > > dtoverlay=vc4-kms-dsi-ti-sn65dsi83 created all the expected devices,
> > > > > and everything came up normally.
> > > > > It was a busy day, but I think I even stuck a scope on the clock lanes
> > > > > at that point and confirmed that they were at the link frequency
> > > > > expected.
> > > >
> > > > Thanks, I'll test your branch and will report the results.
> > >
> > > I had to apply the following diff to work around a crash:
> > >
> > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > index 55b6c53207f5..647426aa793a 100644
> > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > > @@ -525,6 +525,9 @@ static bool sn65dsi83_mode_fixup(struct drm_bridge *bridge,
> > >
> > >         /* The DSI format is always RGB888_1X24 */
> > >         list_for_each_entry(connector, &ddev->mode_config.connector_list, head) {
> > > +               if (!connector->display_info.bus_formats)
> > > +                       continue;
> > > +
> > >                 switch (connector->display_info.bus_formats[0]) {
> > >                 case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> > >                         ctx->lvds_format_24bpp = false;
> > >
> > > connector->display_info.bus_formats is NULL for the HDMI connectors, as
> > > I have nothing connected to them, as well as for the writeback
> > > connector.
> > 
> > I'm now confused as to what I'm doing as my branch appears NOT to have
> > Marek's latest version of the driver as it doesn't have
> > sn65dsi83_mode_fixup.
> > I need to have another look at what's going on - I think I've got
> > branches confused when switching between machines :-( Remaking that
> > branch now.
> > 
> > I do see that Marek has sent another patch around
> > sn65dsi83_mode_fixup, but it'll still dereference
> > connector->display_info.bus_formats[0] on all connectors. Shouldn't it
> > only be switching on the one connector that is connected to this
> > bridge, not HDMI or writeback connectors? I'm not totally clear on
> > which connectors are in that list.
> > https://patchwork.freedesktop.org/patch/440175/
> 
> The following series should fix the issue:
> 
> [PATCH] drm/bridge: ti-sn65dsi83: Replace connector format patching with atomic_get_input_bus_fmts
> [PATCH 0/5] ti-sn65dsi83: Finalize transition to atomic operations
> 
> > > Then, when running kmstest --flip, I get one warning per frame:
> > >
> > > [   29.762089] [drm:vc4_dsi_runtime_resume] *ERROR* vc4_dsi_runtime_resume:
> > > [   29.763200] [drm:vc4_dsi_runtime_resume] *ERROR* vc4_dsi_runtime_resume: All good
> > > [   29.793861] ------------[ cut here ]------------
> > > [   29.798572] WARNING: CPU: 2 PID: 249 at drivers/gpu/drm/drm_modeset_lock.c:246 drm_modeset_lock+0xd0/0x100
> > > [   29.808365] Modules linked in: ipv6 bcm2835_codec(C) bcm2835_unicam bcm2835_v4l2(C) bcm2835_isp(C) bcm2835_mmal_vchiq(C) v4l2_mem2mem v4l2_dv_timings imx296 rtc_ds1307 videobuf2_vmallom
> > > [   29.855284] CPU: 2 PID: 249 Comm: kworker/u8:10 Tainted: G         C        5.10.44-v8+ #23
> > > [   29.863756] Hardware name: Raspberry Pi Compute Module 4 Rev 1.0 (DT)
> > > [   29.870297] Workqueue: events_unbound commit_work
> > > [   29.875077] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
> > > [   29.881172] pc : drm_modeset_lock+0xd0/0x100
> > > [   29.885506] lr : drm_atomic_get_new_or_current_crtc_state+0x6c/0x110
> > > [   29.891950] sp : ffffffc011fcbcb0
> > > [   29.895308] x29: ffffffc011fcbcb0 x28: ffffff80403fe780
> > > [   29.900705] x27: ffffff80415a2000 x26: ffffffc0106f0000
> > > [   29.906100] x25: 0000000000000000 x24: ffffff80420d3c80
> > > [   29.911495] x23: ffffff8042174080 x22: 0000000000000038
> > > [   29.916890] x21: 0000000000000000 x20: ffffff80421740a8
> > > [   29.922284] x19: ffffffc011f8bc50 x18: 0000000000000000
> > > [   29.927678] x17: 0000000000000000 x16: 0000000000000000
> > > [   29.933072] x15: 0000000000000000 x14: 0000000000000000
> > > [   29.938466] x13: 0048000000000329 x12: 0326032303290320
> > > [   29.943860] x11: 03200000020301f4 x10: 00000000000019e0
> > > [   29.949255] x9 : ffffffc0106efd8c x8 : ffffff804390d5c0
> > > [   29.954649] x7 : 7fffffffffffffff x6 : 0000000000000001
> > > [   29.960043] x5 : 0000000000000001 x4 : 0000000000000001
> > > [   29.965436] x3 : ffffff80415a2000 x2 : ffffff804199b200
> > > [   29.970830] x1 : 00000000000000bc x0 : ffffffc011f8bc98
> > > [   29.976225] Call trace:
> > > [   29.978708]  drm_modeset_lock+0xd0/0x100
> > > [   29.982687]  drm_atomic_get_new_or_current_crtc_state+0x6c/0x110
> > > [   29.988781]  vc4_atomic_complete_commit+0x4e4/0x860
> > > [   29.993729]  commit_work+0x18/0x20
> > > [   29.997181]  process_one_work+0x1c4/0x4a0
> > > [   30.001248]  worker_thread+0x50/0x420
> > > [   30.004965]  kthread+0x11c/0x150
> > > [   30.008239]  ret_from_fork+0x10/0x20
> > > [   30.011865] ---[ end trace f44ae6b09cda951a ]---
> > >
> > > Does it ring any bell ?
> > 
> > kmstest --flip is a new one on me. kmstest from
> > https://cgit.freedesktop.org/drm/libdrm/tree/tests/kmstest doesn't
> > have such an option.
> > Based on Google, I'm guessing at
> > https://github.com/tomba/kmsxx/blob/master/utils/kmstest.cpp. Multiple
> > apps with the same name is always fun.
> 
> Correct.
> 
> > > In case this is useful information, the problem didn't occur on top of
> > > commit e1499baa0b0c.
> > 
> > e1499baa0b0c is from back in March by the looks of it.
> > Maxime has done a number of reworks to accessor functions since then,
> > so it's quite possible there's a locking issue lurking. I'll let him
> > comment though.
> 
> Maybe there's a reason why the patch the introduced
> drm_atomic_get_new_or_current_crtc_state() in your branch hasn't made it
> to mainline yet :-)

Any chance this could be reverted from the RPi kernel v5.10 branch in
the meantime ?

> > > > > Coming back to this patch though, it isn't in 5.10 so I'm not seeing
> > > > > the issues. As to the exact ordering of attaches, I can't claim
> > > > > sufficient knowledge on that front.
> > > > > I can try a cherry-pick of this patch to see what goes on, but it
> > > > > won't be for a day or two.
> > > >
> > > > Let's see if Maxime has an opinion :-)
> > > >
> > > > > [1] Largely https://www.raspberrypi.org/forums/viewtopic.php?f=44&t=305690,
> > > > > but ignore about the first 5 pages of the thread as different driver
> > > > > versions were floating about. Most stuff after that is based on
> > > > > Marek's driver.
> > > > > [2] https://github.com/6by9/linux/commit/c3c774136a1e946109048711d16974be8d520aaa
> > > > >
> > > > > > On Tue, Jul 07, 2020 at 12:19:12PM +0200, Maxime Ripard wrote:
> > > > > > > If the DSI driver is the last to probe, component_add will try to run all
> > > > > > > the bind callbacks straight away and return the error code.
> > > > > > >
> > > > > > > However, since we depend on a power domain, we're pretty much guaranteed to
> > > > > > > be in that case on the BCM2711, and are just lucky on the previous SoCs
> > > > > > > since the v3d also depends on that power domain and is further in the probe
> > > > > > > order.
> > > > > > >
> > > > > > > In that case, the DSI host will not stick around in the system: the DSI
> > > > > > > bind callback will be executed, will not find any DSI device attached and
> > > > > > > will return EPROBE_DEFER, and we will then remove the DSI host and ask to
> > > > > > > be probed later on.
> > > > > > >
> > > > > > > But since that host doesn't stick around, DSI devices like the RaspberryPi
> > > > > > > touchscreen whose probe is not linked to the DSI host (unlike the usual DSI
> > > > > > > devices that will be probed through the call to mipi_dsi_host_register)
> > > > > > > cannot attach to the DSI host, and we thus end up in a situation where the
> > > > > > > DSI host cannot probe because the panel hasn't probed yet, and the panel
> > > > > > > cannot probe because the DSI host hasn't yet.
> > > > > > >
> > > > > > > In order to break this cycle, let's wait until there's a DSI device that
> > > > > > > attaches to the DSI host to register the component and allow to progress
> > > > > > > further.
> > > > > > >
> > > > > > > Suggested-by: Andrzej Hajda <a.hajda@samsung.com>
> > > > > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/vc4/vc4_dsi.c | 25 ++++++++-----------------
> > > > > > >  1 file changed, 8 insertions(+), 17 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> > > > > > > index eaf276978ee7..19aab4e7e209 100644
> > > > > > > --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> > > > > > > +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> > > > > > > @@ -1246,10 +1246,12 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
> > > > > > >       return ret;
> > > > > > >  }
> > > > > > >
> > > > > > > +static const struct component_ops vc4_dsi_ops;
> > > > > > >  static int vc4_dsi_host_attach(struct mipi_dsi_host *host,
> > > > > > >                              struct mipi_dsi_device *device)
> > > > > > >  {
> > > > > > >       struct vc4_dsi *dsi = host_to_dsi(host);
> > > > > > > +     int ret;
> > > > > > >
> > > > > > >       dsi->lanes = device->lanes;
> > > > > > >       dsi->channel = device->channel;
> > > > > > > @@ -1284,6 +1286,12 @@ static int vc4_dsi_host_attach(struct mipi_dsi_host *host,
> > > > > > >               return 0;
> > > > > > >       }
> > > > > > >
> > > > > > > +     ret = component_add(&dsi->pdev->dev, &vc4_dsi_ops);
> > > > > > > +     if (ret) {
> > > > > > > +             mipi_dsi_host_unregister(&dsi->dsi_host);
> > > > > > > +             return ret;
> > > > > > > +     }
> > > > > > > +
> > > > > > >       return 0;
> > > > > > >  }
> > > > > > >
> > > > > > > @@ -1662,7 +1670,6 @@ static int vc4_dsi_dev_probe(struct platform_device *pdev)
> > > > > > >  {
> > > > > > >       struct device *dev = &pdev->dev;
> > > > > > >       struct vc4_dsi *dsi;
> > > > > > > -     int ret;
> > > > > > >
> > > > > > >       dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> > > > > > >       if (!dsi)
> > > > > > > @@ -1670,26 +1677,10 @@ static int vc4_dsi_dev_probe(struct platform_device *pdev)
> > > > > > >       dev_set_drvdata(dev, dsi);
> > > > > > >
> > > > > > >       dsi->pdev = pdev;
> > > > > > > -
> > > > > > > -     /* Note, the initialization sequence for DSI and panels is
> > > > > > > -      * tricky.  The component bind above won't get past its
> > > > > > > -      * -EPROBE_DEFER until the panel/bridge probes.  The
> > > > > > > -      * panel/bridge will return -EPROBE_DEFER until it has a
> > > > > > > -      * mipi_dsi_host to register its device to.  So, we register
> > > > > > > -      * the host during pdev probe time, so vc4 as a whole can then
> > > > > > > -      * -EPROBE_DEFER its component bind process until the panel
> > > > > > > -      * successfully attaches.
> > > > > > > -      */
> > > > > > >       dsi->dsi_host.ops = &vc4_dsi_host_ops;
> > > > > > >       dsi->dsi_host.dev = dev;
> > > > > > >       mipi_dsi_host_register(&dsi->dsi_host);
> > > > > > >
> > > > > > > -     ret = component_add(&pdev->dev, &vc4_dsi_ops);
> > > > > > > -     if (ret) {
> > > > > > > -             mipi_dsi_host_unregister(&dsi->dsi_host);
> > > > > > > -             return ret;
> > > > > > > -     }
> > > > > > > -
> > > > > > >       return 0;
> > > > > > >  }
> > > > > > >

-- 
Regards,

Laurent Pinchart
