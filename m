Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D8B726916
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 20:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DCF010E06F;
	Wed,  7 Jun 2023 18:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1E388735
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 18:43:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126233170111.36.openmobile.ne.jp
 [126.233.170.111])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA7C083F;
 Wed,  7 Jun 2023 20:42:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1686163377;
 bh=spwrYQEvW9KNcz+e3u4F2isfSnw6E9e3Dxj7eWK7eHg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jhyJdBTnl4YTXDlCLsrz24UguvHwq6ENQ8v7X7KWdLQYEB/16WGXopcGHWfC8cBF8
 Yh0T/eWh6ui1oRDLfgkcpaArzN+z0jP3NqnhBqpSzIlgkfk8vowPctx9WEBhOcFM7N
 1y+CTPGF6RJoHKDRBk9a38ilOAJWYs3dmLoZ3fus=
Date: Wed, 7 Jun 2023 21:43:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] drm/bridge: Silence error messages upon probe deferral
Message-ID: <20230607184320.GB26742@pendragon.ideasonboard.com>
References: <20230606144833.776646-1-alexander.stein@ew.tq-group.com>
 <20230606151229.GF7234@pendragon.ideasonboard.com>
 <12222903.O9o76ZdvQC@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <12222903.O9o76ZdvQC@steina-w>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alexander,

On Wed, Jun 07, 2023 at 01:26:03PM +0200, Alexander Stein wrote:
> Am Dienstag, 6. Juni 2023, 17:12:29 CEST schrieb Laurent Pinchart:
> > On Tue, Jun 06, 2023 at 04:48:33PM +0200, Alexander Stein wrote:
> > > When -EPROBE_DEFER is returned do not raise an error, but silently return
> > > this error instead. Fixes error like this:
> > > [drm:drm_bridge_attach] *ERROR* failed to attach bridge
> > > /soc@0/bus@30800000/mipi-dsi@30a00000 to encoder None-34: -517
> > > [drm:drm_bridge_attach] *ERROR* failed to attach bridge
> > > /soc@0/bus@30800000/mipi-dsi@30a00000 to encoder None-34: -517
> > > 
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > > dev_err_probe() would be the best, but I am not sure if this function is
> > > always used within a driver's probe() call.
> > > 
> > >  drivers/gpu/drm/drm_bridge.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > > index c3d69af02e79d..07773d6441a1f 100644
> > > --- a/drivers/gpu/drm/drm_bridge.c
> > > +++ b/drivers/gpu/drm/drm_bridge.c
> > > @@ -350,6 +350,7 @@ int drm_bridge_attach(struct drm_encoder *encoder,
> > > struct drm_bridge *bridge,> 
> > >  	bridge->encoder = NULL;
> > >  	list_del(&bridge->chain_node);
> > > 
> > > +	if (ret != -EPROBE_DEFER) {
> > > 
> > >  #ifdef CONFIG_OF
> > >  
> > >  	DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
> > >  	
> > >  		  bridge->of_node, encoder->name, ret);
> > 
> > Wrong indentation.
> 
> Ah, right. Thanks for pointing out.
> 
> > dev_err_probe() could be useful, but this function is likely not called
> > from probe paths only :-S
> 
> I was afraid this might be the cause. But I'm wondering in which situation 
> this can be the case, hence -EPROBE_DEFER could be returned then.

I've had a quick look, and one example of a non-probe path is in
mcde_modeset_init(), with the call to
drm_simple_display_pipe_attach_bridge() which calls drm_bridge_attach().
mcde_modeset_init() is called from mcde_drm_bind(), the handler for the
.bind() operation in component_master_ops.

I'd argue that we should really drop the component framework and replace
it with something better, but that's beyond the scope of this patch :-)

> > When not called from a probe path, dropping the message will result in a
> > silent error, which would be hard to debug :-(
> 
> On the other hand -EPROBE_DEFER is invalid on non-probe path also.
> Assuming dev_err_probe is used here, an error will still be raised, -
> EPROBE_DEFER should not occur then.

I agree that -EPROBE_DEFER shouldn't occur, and in many cases, it won't
for drivers that use the component framework, as the whole purpose of
the framework is to make sure the bridges are available before we try to
attach to them. The framework (or at least the way it's used in drivers)
however doesn't handle chains of components: the main DRM driver will
have its next bridge available by the time it calls drm_bridge_attach(),
but the bridge may then try to acquire the next bridge in the chain, and
get an error that results in a probe deferral. Maybe that's not supposed
to happen though, bridges probably should acquire the next bridge at
probe time, but I can't guarantee this will always be done.

And this is my point: I'm scared that this patch will cause silent and
hard to debug failures in some cases. Those cases may be incorrect usage
of APIs by drivers, but making them silent will make it more difficult
to fix them.

If everybody thinks I'm over-concerned, please feel free to move forward
with this patch, and I'll do my best not to lose sleep :-)

> > > @@ -357,6 +358,7 @@ int drm_bridge_attach(struct drm_encoder *encoder,
> > > struct drm_bridge *bridge,> 
> > >  	DRM_ERROR("failed to attach bridge to encoder %s: %d\n",
> > >  	
> > >  		  encoder->name, ret);
> > >  
> > >  #endif
> > > 
> > > +	}
> > > 
> > >  	return ret;
> > >  
> > >  }

-- 
Regards,

Laurent Pinchart
