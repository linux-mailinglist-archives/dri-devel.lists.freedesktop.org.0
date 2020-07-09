Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F72219DAE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 12:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5446EA2F;
	Thu,  9 Jul 2020 10:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30496EA2F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 10:25:45 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 659535C2651;
 Thu,  9 Jul 2020 12:25:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1594290343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T2HI0HkgfbrLPmHwD1EWZ424BYyTIGWREVKJ6IM6fHI=;
 b=OXeJ3t1Llk0QpR9mR+oKHheCrY8nx4+/nIUPUDwJ2yePRI+kx55pMzGYsbMzz1ncJZxVhj
 dZdf8v+W3pqqRu1t29cnwhmfcCJrzrrU177qj6ttgVkCPK0DgiZf10i8YuYO/UyEEAty2m
 g4nScu49XDXrkuCUkmcmnR4zgnxVBSI=
MIME-Version: 1.0
Date: Thu, 09 Jul 2020 12:25:42 +0200
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 11/22] drm: mxsfb: Stop using DRM simple display
 pipeline helper
In-Reply-To: <20200616015003.GA28342@pendragon.ideasonboard.com>
References: <20200530031015.15492-1-laurent.pinchart@ideasonboard.com>
 <20200530031015.15492-12-laurent.pinchart@ideasonboard.com>
 <de32ceef5b51ad55fe9b2a932991f4b3@agner.ch>
 <20200616015003.GA28342@pendragon.ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <bb139837d7ecdaecdf88083bb496a1ec@agner.ch>
X-Sender: stefan@agner.ch
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
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com, kernel@pengutronix.de, robert.chiras@nxp.com,
 leonard.crestez@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 2020-06-16 03:50, Laurent Pinchart wrote:
> Hi Stefan,
> 
> On Thu, Jun 11, 2020 at 09:33:11PM +0200, Stefan Agner wrote:
>> On 2020-05-30 05:10, Laurent Pinchart wrote:
>> > The DRM simple display pipeline helper only supports a single plane. In
>> > order to prepare for support of the alpha plane on i.MX6SX and i.MX7,
>> > move away from the helper. No new feature is added.
>> >
>> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> > ---
>> > Changes since v1:
>> >
>> > - Move after mxsfb_crtc.c rename to mxsfb_kms.c
>> > ---
>> >  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 108 +++---------------
>> >  drivers/gpu/drm/mxsfb/mxsfb_drv.h |  23 ++--
>> >  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 184 +++++++++++++++++++++++++++---
>> >  3 files changed, 197 insertions(+), 118 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
>> > b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
>> > index 204c1e52e9aa..a8da92976d13 100644
>> > --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
>> > +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
>> > @@ -10,22 +10,23 @@
>> >
>> >  #include <linux/clk.h>
>> >  #include <linux/dma-mapping.h>
>> > +#include <linux/io.h>
>> >  #include <linux/module.h>
>> >  #include <linux/of_device.h>
>> > +#include <linux/platform_device.h>
>> >  #include <linux/pm_runtime.h>
>> > -#include <linux/spinlock.h>
>> >
>> > -#include <drm/drm_atomic.h>
>> >  #include <drm/drm_atomic_helper.h>
>> > -#include <drm/drm_crtc.h>
>> > +#include <drm/drm_bridge.h>
>> > +#include <drm/drm_connector.h>
>> >  #include <drm/drm_drv.h>
>> >  #include <drm/drm_fb_helper.h>
>> >  #include <drm/drm_gem_cma_helper.h>
>> >  #include <drm/drm_gem_framebuffer_helper.h>
>> >  #include <drm/drm_irq.h>
>> > +#include <drm/drm_mode_config.h>
>> >  #include <drm/drm_of.h>
>> >  #include <drm/drm_probe_helper.h>
>> > -#include <drm/drm_simple_kms_helper.h>
>> >  #include <drm/drm_vblank.h>
>> >
>> >  #include "mxsfb_drv.h"
>> > @@ -57,17 +58,6 @@ static const struct mxsfb_devdata mxsfb_devdata[] = {
>> >  	},
>> >  };
>> >
>> > -static const uint32_t mxsfb_formats[] = {
>> > -	DRM_FORMAT_XRGB8888,
>> > -	DRM_FORMAT_RGB565
>> > -};
>> > -
>> > -static struct mxsfb_drm_private *
>> > -drm_pipe_to_mxsfb_drm_private(struct drm_simple_display_pipe *pipe)
>> > -{
>> > -	return container_of(pipe, struct mxsfb_drm_private, pipe);
>> > -}
>> > -
>> >  void mxsfb_enable_axi_clk(struct mxsfb_drm_private *mxsfb)
>> >  {
>> >  	if (mxsfb->clk_axi)
>> > @@ -90,77 +80,6 @@ static const struct drm_mode_config_helper_funcs
>> > mxsfb_mode_config_helpers = {
>> >  	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
>> >  };
>> >
>> > -static void mxsfb_pipe_enable(struct drm_simple_display_pipe *pipe,
>> > -			      struct drm_crtc_state *crtc_state,
>> > -			      struct drm_plane_state *plane_state)
>> > -{
>> > -	struct mxsfb_drm_private *mxsfb = drm_pipe_to_mxsfb_drm_private(pipe);
>> > -	struct drm_device *drm = pipe->plane.dev;
>> > -
>> > -	pm_runtime_get_sync(drm->dev);
>> > -	mxsfb_crtc_enable(mxsfb);
>> > -}
>> > -
>> > -static void mxsfb_pipe_disable(struct drm_simple_display_pipe *pipe)
>> > -{
>> > -	struct mxsfb_drm_private *mxsfb = drm_pipe_to_mxsfb_drm_private(pipe);
>> > -	struct drm_device *drm = pipe->plane.dev;
>> > -	struct drm_crtc *crtc = &pipe->crtc;
>> > -	struct drm_pending_vblank_event *event;
>> > -
>> > -	mxsfb_crtc_disable(mxsfb);
>> > -	pm_runtime_put_sync(drm->dev);
>> > -
>> > -	spin_lock_irq(&drm->event_lock);
>> > -	event = crtc->state->event;
>> > -	if (event) {
>> > -		crtc->state->event = NULL;
>> > -		drm_crtc_send_vblank_event(crtc, event);
>> > -	}
>> > -	spin_unlock_irq(&drm->event_lock);
>> > -}
>> > -
>> > -static void mxsfb_pipe_update(struct drm_simple_display_pipe *pipe,
>> > -			      struct drm_plane_state *plane_state)
>> > -{
>> > -	struct mxsfb_drm_private *mxsfb = drm_pipe_to_mxsfb_drm_private(pipe);
>> > -
>> > -	mxsfb_plane_atomic_update(mxsfb, plane_state);
>> > -}
>> > -
>> > -static int mxsfb_pipe_enable_vblank(struct drm_simple_display_pipe *pipe)
>> > -{
>> > -	struct mxsfb_drm_private *mxsfb = drm_pipe_to_mxsfb_drm_private(pipe);
>> > -
>> > -	/* Clear and enable VBLANK IRQ */
>> > -	mxsfb_enable_axi_clk(mxsfb);
>> > -	writel(CTRL1_CUR_FRAME_DONE_IRQ, mxsfb->base + LCDC_CTRL1 + REG_CLR);
>> > -	writel(CTRL1_CUR_FRAME_DONE_IRQ_EN, mxsfb->base + LCDC_CTRL1 + REG_SET);
>> > -	mxsfb_disable_axi_clk(mxsfb);
>> > -
>> > -	return 0;
>> > -}
>> > -
>> > -static void mxsfb_pipe_disable_vblank(struct drm_simple_display_pipe *pipe)
>> > -{
>> > -	struct mxsfb_drm_private *mxsfb = drm_pipe_to_mxsfb_drm_private(pipe);
>> > -
>> > -	/* Disable and clear VBLANK IRQ */
>> > -	mxsfb_enable_axi_clk(mxsfb);
>> > -	writel(CTRL1_CUR_FRAME_DONE_IRQ_EN, mxsfb->base + LCDC_CTRL1 + REG_CLR);
>> > -	writel(CTRL1_CUR_FRAME_DONE_IRQ, mxsfb->base + LCDC_CTRL1 + REG_CLR);
>> > -	mxsfb_disable_axi_clk(mxsfb);
>> > -}
>> > -
>> > -static struct drm_simple_display_pipe_funcs mxsfb_funcs = {
>> > -	.enable		= mxsfb_pipe_enable,
>> > -	.disable	= mxsfb_pipe_disable,
>> > -	.update		= mxsfb_pipe_update,
>> > -	.prepare_fb	= drm_gem_fb_simple_display_pipe_prepare_fb,
>> > -	.enable_vblank	= mxsfb_pipe_enable_vblank,
>> > -	.disable_vblank	= mxsfb_pipe_disable_vblank,
>> > -};
>> > -
>> >  static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
>> >  {
>> >  	struct drm_device *drm = mxsfb->drm;
>> > @@ -183,7 +102,7 @@ static int mxsfb_attach_bridge(struct
>> > mxsfb_drm_private *mxsfb)
>> >  	if (!bridge)
>> >  		return -ENODEV;
>> >
>> > -	ret = drm_simple_display_pipe_attach_bridge(&mxsfb->pipe, bridge);
>> > +	ret = drm_bridge_attach(&mxsfb->encoder, bridge, NULL, 0);
>> >  	if (ret) {
>> >  		DRM_DEV_ERROR(drm->dev,
>> >  			      "failed to attach bridge: %d\n", ret);
>> > @@ -250,10 +169,9 @@ static int mxsfb_load(struct drm_device *drm,
>> > unsigned long flags)
>> >  	/* Modeset init */
>> >  	drm_mode_config_init(drm);
>> >
>> > -	ret = drm_simple_display_pipe_init(drm, &mxsfb->pipe, &mxsfb_funcs,
>> > -			mxsfb_formats, ARRAY_SIZE(mxsfb_formats), NULL, NULL);
>> > +	ret = mxsfb_kms_init(mxsfb);
>> >  	if (ret < 0) {
>> > -		dev_err(drm->dev, "Cannot setup simple display pipe\n");
>> > +		dev_err(drm->dev, "Failed to initialize KMS pipeline\n");
>> >  		goto err_vblank;
>> >  	}
>> >
>> > @@ -309,11 +227,11 @@ static void mxsfb_unload(struct drm_device *drm)
>> >  	pm_runtime_disable(drm->dev);
>> >  }
>> >
>> > -static void mxsfb_irq_preinstall(struct drm_device *drm)
>> > +static void mxsfb_irq_disable(struct drm_device *drm)
>> >  {
>> >  	struct mxsfb_drm_private *mxsfb = drm->dev_private;
>> >
>> > -	mxsfb_pipe_disable_vblank(&mxsfb->pipe);
>> > +	mxsfb->crtc.funcs->disable_vblank(&mxsfb->crtc);
>> >  }
>> >
>> >  static irqreturn_t mxsfb_irq_handler(int irq, void *data)
>> > @@ -327,7 +245,7 @@ static irqreturn_t mxsfb_irq_handler(int irq, void *data)
>> >  	reg = readl(mxsfb->base + LCDC_CTRL1);
>> >
>> >  	if (reg & CTRL1_CUR_FRAME_DONE_IRQ)
>> > -		drm_crtc_handle_vblank(&mxsfb->pipe.crtc);
>> > +		drm_crtc_handle_vblank(&mxsfb->crtc);
>> >
>> >  	writel(CTRL1_CUR_FRAME_DONE_IRQ, mxsfb->base + LCDC_CTRL1 + REG_CLR);
>> >
>> > @@ -341,8 +259,8 @@ DEFINE_DRM_GEM_CMA_FOPS(fops);
>> >  static struct drm_driver mxsfb_driver = {
>> >  	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>> >  	.irq_handler		= mxsfb_irq_handler,
>> > -	.irq_preinstall		= mxsfb_irq_preinstall,
>> > -	.irq_uninstall		= mxsfb_irq_preinstall,
>> > +	.irq_preinstall		= mxsfb_irq_disable,
>> > +	.irq_uninstall		= mxsfb_irq_disable,
>> >  	.gem_free_object_unlocked = drm_gem_cma_free_object,
>> >  	.gem_vm_ops		= &drm_gem_cma_vm_ops,
>> >  	.dumb_create		= drm_gem_cma_dumb_create,
>> > diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
>> > b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
>> > index 0e3e5a63bbf9..edd766ad254f 100644
>> > --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
>> > +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
>> > @@ -8,7 +8,12 @@
>> >  #ifndef __MXSFB_DRV_H__
>> >  #define __MXSFB_DRV_H__
>> >
>> > -struct drm_device;
>> > +#include <drm/drm_crtc.h>
>> > +#include <drm/drm_device.h>
>> > +#include <drm/drm_encoder.h>
>> > +#include <drm/drm_plane.h>
>> > +
>> > +struct clk;
>> >
>> >  struct mxsfb_devdata {
>> >  	unsigned int	 transfer_count;
>> > @@ -29,20 +34,22 @@ struct mxsfb_drm_private {
>> >  	struct clk			*clk_disp_axi;
>> >
>> >  	struct drm_device		*drm;
>> > -	struct drm_simple_display_pipe	pipe;
>> > +	struct drm_plane		plane;
>> > +	struct drm_crtc			crtc;
>> > +	struct drm_encoder		encoder;
>> >  	struct drm_connector		*connector;
>> >  	struct drm_bridge		*bridge;
>> >  };
>> >
>> > -int mxsfb_setup_crtc(struct drm_device *dev);
>> > -int mxsfb_create_output(struct drm_device *dev);
>> > +static inline struct mxsfb_drm_private *
>> > +to_mxsfb_drm_private(struct drm_device *drm)
>> > +{
>> > +	return drm->dev_private;
>> > +}
>> >
>> >  void mxsfb_enable_axi_clk(struct mxsfb_drm_private *mxsfb);
>> >  void mxsfb_disable_axi_clk(struct mxsfb_drm_private *mxsfb);
>> >
>> > -void mxsfb_crtc_enable(struct mxsfb_drm_private *mxsfb);
>> > -void mxsfb_crtc_disable(struct mxsfb_drm_private *mxsfb);
>> > -void mxsfb_plane_atomic_update(struct mxsfb_drm_private *mxsfb,
>> > -			       struct drm_plane_state *state);
>> > +int mxsfb_kms_init(struct mxsfb_drm_private *mxsfb);
>> >
>> >  #endif /* __MXSFB_DRV_H__ */
>> > diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>> > b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>> > index c4f1575b4210..8f339adb8d04 100644
>> > --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>> > +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>> > @@ -9,15 +9,21 @@
>> >   */
>> >
>> >  #include <linux/clk.h>
>> > +#include <linux/io.h>
>> >  #include <linux/iopoll.h>
>> > +#include <linux/pm_runtime.h>
>> >  #include <linux/spinlock.h>
>> >
>> > +#include <drm/drm_atomic.h>
>> > +#include <drm/drm_atomic_helper.h>
>> >  #include <drm/drm_bridge.h>
>> >  #include <drm/drm_crtc.h>
>> > +#include <drm/drm_encoder.h>
>> >  #include <drm/drm_fb_cma_helper.h>
>> >  #include <drm/drm_fourcc.h>
>> >  #include <drm/drm_gem_cma_helper.h>
>> > -#include <drm/drm_simple_kms_helper.h>
>> > +#include <drm/drm_plane.h>
>> > +#include <drm/drm_plane_helper.h>
>> >  #include <drm/drm_vblank.h>
>> >
>> >  #include "mxsfb_drv.h"
>> > @@ -26,6 +32,10 @@
>> >  /* 1 second delay should be plenty of time for block reset */
>> >  #define RESET_TIMEOUT		1000000
>> >
>> > +/*
>> > -----------------------------------------------------------------------------
>> > + * CRTC
>> > + */
>> > +
>> >  static u32 set_hsync_pulse_width(struct mxsfb_drm_private *mxsfb, u32 val)
>> >  {
>> >  	return (val & mxsfb->devdata->hs_wdth_mask) <<
>> > @@ -35,9 +45,8 @@ static u32 set_hsync_pulse_width(struct
>> > mxsfb_drm_private *mxsfb, u32 val)
>> >  /* Setup the MXSFB registers for decoding the pixels out of the framebuffer */
>> >  static int mxsfb_set_pixel_fmt(struct mxsfb_drm_private *mxsfb)
>> >  {
>> > -	struct drm_crtc *crtc = &mxsfb->pipe.crtc;
>> > -	struct drm_device *drm = crtc->dev;
>> > -	const u32 format = crtc->primary->state->fb->format->format;
>> > +	struct drm_device *drm = mxsfb->drm;
>> > +	const u32 format = mxsfb->crtc.primary->state->fb->format->format;
>> >  	u32 ctrl, ctrl1;
>> >
>> >  	ctrl = CTRL_BYPASS_COUNT | CTRL_MASTER;
>> > @@ -71,8 +80,7 @@ static int mxsfb_set_pixel_fmt(struct
>> > mxsfb_drm_private *mxsfb)
>> >
>> >  static void mxsfb_set_bus_fmt(struct mxsfb_drm_private *mxsfb)
>> >  {
>> > -	struct drm_crtc *crtc = &mxsfb->pipe.crtc;
>> > -	struct drm_device *drm = crtc->dev;
>> > +	struct drm_device *drm = mxsfb->drm;
>> >  	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
>> >  	u32 reg;
>> >
>> > @@ -175,7 +183,7 @@ static int mxsfb_reset_block(struct
>> > mxsfb_drm_private *mxsfb)
>> >
>> >  static dma_addr_t mxsfb_get_fb_paddr(struct mxsfb_drm_private *mxsfb)
>> >  {
>> > -	struct drm_framebuffer *fb = mxsfb->pipe.plane.state->fb;
>> > +	struct drm_framebuffer *fb = mxsfb->plane.state->fb;
>> >  	struct drm_gem_cma_object *gem;
>> >
>> >  	if (!fb)
>> > @@ -190,8 +198,8 @@ static dma_addr_t mxsfb_get_fb_paddr(struct
>> > mxsfb_drm_private *mxsfb)
>> >
>> >  static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb)
>> >  {
>> > -	struct drm_device *drm = mxsfb->pipe.crtc.dev;
>> > -	struct drm_display_mode *m = &mxsfb->pipe.crtc.state->adjusted_mode;
>> > +	struct drm_device *drm = mxsfb->crtc.dev;
>> > +	struct drm_display_mode *m = &mxsfb->crtc.state->adjusted_mode;
>> >  	u32 bus_flags = mxsfb->connector->display_info.bus_flags;
>> >  	u32 vdctrl0, vsync_pulse_len, hsync_pulse_len;
>> >  	int err;
>> > @@ -273,10 +281,29 @@ static void mxsfb_crtc_mode_set_nofb(struct
>> > mxsfb_drm_private *mxsfb)
>> >  	       mxsfb->base + LCDC_VDCTRL4);
>> >  }
>> >
>> > -void mxsfb_crtc_enable(struct mxsfb_drm_private *mxsfb)
>> > +static int mxsfb_crtc_atomic_check(struct drm_crtc *crtc,
>> > +				   struct drm_crtc_state *state)
>> >  {
>> > +	bool has_primary = state->plane_mask &
>> > +			   drm_plane_mask(crtc->primary);
>> > +
>> > +	/* The primary plane has to be enabled when the CRTC is active. */
>> > +	if (has_primary != state->active)
>> > +		return -EINVAL;
>>
>> This actually fails some of the igt subtests of kms_vblank.
>>
>> I think it has to be:
>> if (state->active && !has_primary)
>>
>> With that, all kms_vblank tests succeed (or are skipped).
>>
>> With that fixed:
>> Reviewed-by: Stefan Agner <stefan@agner.ch>
> 
> Good catch, this will be fixed in v3. Speaking of which, I'm still
> missing your review on 02/22 and 22/22. Do you plan to have a look at
> them ?

Yeah sorry, I did initially miss them and sent a review a couple of
weeks ago.

Would be good if you can send a v3 soon, I think it should still be
early enough to make it into the next merge window.

--
Stefan

> 
>> > +
>> > +	/* TODO: Is this needed ? */
>> > +	return drm_atomic_add_affected_planes(state->state, crtc);
>> > +}
>> > +
>> > +static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
>> > +				     struct drm_crtc_state *old_state)
>> > +{
>> > +	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
>> > +	struct drm_device *drm = mxsfb->drm;
>> >  	dma_addr_t paddr;
>> >
>> > +	pm_runtime_get_sync(drm->dev);
>> > +
>> >  	mxsfb_enable_axi_clk(mxsfb);
>> >  	mxsfb_crtc_mode_set_nofb(mxsfb);
>> >
>> > @@ -290,17 +317,100 @@ void mxsfb_crtc_enable(struct mxsfb_drm_private *mxsfb)
>> >  	mxsfb_enable_controller(mxsfb);
>> >  }
>> >
>> > -void mxsfb_crtc_disable(struct mxsfb_drm_private *mxsfb)
>> > +static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
>> > +				      struct drm_crtc_state *old_state)
>> >  {
>> > +	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
>> > +	struct drm_device *drm = mxsfb->drm;
>> > +	struct drm_pending_vblank_event *event;
>> > +
>> >  	mxsfb_disable_controller(mxsfb);
>> >  	mxsfb_disable_axi_clk(mxsfb);
>> > +
>> > +	pm_runtime_put_sync(drm->dev);
>> > +
>> > +	spin_lock_irq(&drm->event_lock);
>> > +	event = crtc->state->event;
>> > +	if (event) {
>> > +		crtc->state->event = NULL;
>> > +		drm_crtc_send_vblank_event(crtc, event);
>> > +	}
>> > +	spin_unlock_irq(&drm->event_lock);
>> > +}
>> > +
>> > +static int mxsfb_crtc_enable_vblank(struct drm_crtc *crtc)
>> > +{
>> > +	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
>> > +
>> > +	/* Clear and enable VBLANK IRQ */
>> > +	mxsfb_enable_axi_clk(mxsfb);
>> > +	writel(CTRL1_CUR_FRAME_DONE_IRQ, mxsfb->base + LCDC_CTRL1 + REG_CLR);
>> > +	writel(CTRL1_CUR_FRAME_DONE_IRQ_EN, mxsfb->base + LCDC_CTRL1 + REG_SET);
>> > +	mxsfb_disable_axi_clk(mxsfb);
>> > +
>> > +	return 0;
>> > +}
>> > +
>> > +static void mxsfb_crtc_disable_vblank(struct drm_crtc *crtc)
>> > +{
>> > +	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
>> > +
>> > +	/* Disable and clear VBLANK IRQ */
>> > +	mxsfb_enable_axi_clk(mxsfb);
>> > +	writel(CTRL1_CUR_FRAME_DONE_IRQ_EN, mxsfb->base + LCDC_CTRL1 + REG_CLR);
>> > +	writel(CTRL1_CUR_FRAME_DONE_IRQ, mxsfb->base + LCDC_CTRL1 + REG_CLR);
>> > +	mxsfb_disable_axi_clk(mxsfb);
>> > +}
>> > +
>> > +static const struct drm_crtc_helper_funcs mxsfb_crtc_helper_funcs = {
>> > +	.atomic_check = mxsfb_crtc_atomic_check,
>> > +	.atomic_enable = mxsfb_crtc_atomic_enable,
>> > +	.atomic_disable = mxsfb_crtc_atomic_disable,
>> > +};
>> > +
>> > +static const struct drm_crtc_funcs mxsfb_crtc_funcs = {
>> > +	.reset = drm_atomic_helper_crtc_reset,
>> > +	.destroy = drm_crtc_cleanup,
>> > +	.set_config = drm_atomic_helper_set_config,
>> > +	.page_flip = drm_atomic_helper_page_flip,
>> > +	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
>> > +	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
>> > +	.enable_vblank = mxsfb_crtc_enable_vblank,
>> > +	.disable_vblank = mxsfb_crtc_disable_vblank,
>> > +};
>> > +
>> > +/*
>> > -----------------------------------------------------------------------------
>> > + * Encoder
>> > + */
>> > +
>> > +static const struct drm_encoder_funcs mxsfb_encoder_funcs = {
>> > +	.destroy = drm_encoder_cleanup,
>> > +};
>> > +
>> > +/*
>> > -----------------------------------------------------------------------------
>> > + * Planes
>> > + */
>> > +
>> > +static int mxsfb_plane_atomic_check(struct drm_plane *plane,
>> > +				    struct drm_plane_state *plane_state)
>> > +{
>> > +	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
>> > +	struct drm_crtc_state *crtc_state;
>> > +
>> > +	crtc_state = drm_atomic_get_new_crtc_state(plane_state->state,
>> > +						   &mxsfb->crtc);
>> > +
>> > +	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
>> > +						   DRM_PLANE_HELPER_NO_SCALING,
>> > +						   DRM_PLANE_HELPER_NO_SCALING,
>> > +						   false, true);
>> >  }
>> >
>> > -void mxsfb_plane_atomic_update(struct mxsfb_drm_private *mxsfb,
>> > -			       struct drm_plane_state *state)
>> > +static void mxsfb_plane_atomic_update(struct drm_plane *plane,
>> > +				      struct drm_plane_state *old_pstate)
>> >  {
>> > -	struct drm_simple_display_pipe *pipe = &mxsfb->pipe;
>> > -	struct drm_crtc *crtc = &pipe->crtc;
>> > +	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
>> > +	struct drm_crtc *crtc = &mxsfb->crtc;
>> >  	struct drm_pending_vblank_event *event;
>> >  	dma_addr_t paddr;
>> >
>> > @@ -324,3 +434,47 @@ void mxsfb_plane_atomic_update(struct
>> > mxsfb_drm_private *mxsfb,
>> >  		mxsfb_disable_axi_clk(mxsfb);
>> >  	}
>> >  }
>> > +
>> > +static const struct drm_plane_helper_funcs mxsfb_plane_helper_funcs = {
>> > +	.atomic_check = mxsfb_plane_atomic_check,
>> > +	.atomic_update = mxsfb_plane_atomic_update,
>> > +};
>> > +
>> > +static const struct drm_plane_funcs mxsfb_plane_funcs = {
>> > +	.update_plane		= drm_atomic_helper_update_plane,
>> > +	.disable_plane		= drm_atomic_helper_disable_plane,
>> > +	.destroy		= drm_plane_cleanup,
>> > +	.reset			= drm_atomic_helper_plane_reset,
>> > +	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
>> > +	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
>> > +};
>> > +
>> > +static const uint32_t mxsfb_formats[] = {
>> > +	DRM_FORMAT_XRGB8888,
>> > +	DRM_FORMAT_RGB565
>> > +};
>> > +
>> > +int mxsfb_kms_init(struct mxsfb_drm_private *mxsfb)
>> > +{
>> > +	struct drm_encoder *encoder = &mxsfb->encoder;
>> > +	struct drm_plane *plane = &mxsfb->plane;
>> > +	struct drm_crtc *crtc = &mxsfb->crtc;
>> > +	int ret;
>> > +
>> > +	drm_plane_helper_add(plane, &mxsfb_plane_helper_funcs);
>> > +	ret = drm_universal_plane_init(mxsfb->drm, plane, 0, &mxsfb_plane_funcs,
>> > +				       mxsfb_formats, ARRAY_SIZE(mxsfb_formats),
>> > +				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
>> > +	if (ret)
>> > +		return ret;
>> > +
>> > +	drm_crtc_helper_add(crtc, &mxsfb_crtc_helper_funcs);
>> > +	ret = drm_crtc_init_with_planes(mxsfb->drm, crtc, plane, NULL,
>> > +					&mxsfb_crtc_funcs, NULL);
>> > +	if (ret)
>> > +		return ret;
>> > +
>> > +	encoder->possible_crtcs = drm_crtc_mask(crtc);
>> > +	return drm_encoder_init(mxsfb->drm, encoder, &mxsfb_encoder_funcs,
>> > +				DRM_MODE_ENCODER_NONE, NULL);
>> > +}
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
