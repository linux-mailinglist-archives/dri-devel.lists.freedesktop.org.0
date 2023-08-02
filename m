Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8974576D70F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 20:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B835410E564;
	Wed,  2 Aug 2023 18:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D8010E217;
 Wed,  2 Aug 2023 18:46:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D88F9CA;
 Wed,  2 Aug 2023 20:45:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691001913;
 bh=6lMIvnUDmcbkmqo6E/Xm2zfqir/+TekU2+85+m1X+qo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DRhGCqAhLNEY1+DwW1JlMQyZnqagkG6GpLtr+9d5fVZ5c6vTuwXf17B8Gyxuinsoi
 fWCiDEVmckZVwy4p5G6qt3uqgpiKWVRKDX8j40iG+pkFztNecCmk6CTuZR7yZvWXGb
 SpJEUnyGymyhvG89qZ/s7mdq4fdbPr3wXW/NaG6E=
Date: Wed, 2 Aug 2023 21:46:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 2/4] drm/bridge-connector: handle subconnector types
Message-ID: <20230802184622.GA32500@pendragon.ideasonboard.com>
References: <20230729004913.215872-1-dmitry.baryshkov@linaro.org>
 <20230729004913.215872-3-dmitry.baryshkov@linaro.org>
 <0cc04d99-d7aa-68ff-b304-7d42ae7f0dde@linaro.org>
 <CAA8EJpoMC-YbWvyfCsdAHOL9aw3nfQ=g8BgLp2mb9iozeRgBpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAA8EJpoMC-YbWvyfCsdAHOL9aw3nfQ=g8BgLp2mb9iozeRgBpg@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Janne Grunau <j@jannau.net>,
 Robert Foss <rfoss@kernel.org>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Gross <agross@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 neil.armstrong@linaro.org, Bjorn Andersson <andersson@kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 02, 2023 at 12:05:50PM +0300, Dmitry Baryshkov wrote:
> On Wed, 2 Aug 2023 at 11:35, Neil Armstrong wrote:
> > On 29/07/2023 02:49, Dmitry Baryshkov wrote:
> > > If the created connector type supports subconnector type property,
> > > create and attach corresponding it. The default subtype value is 0,
> > > which maps to the DRM_MODE_SUBCONNECTOR_Unknown type.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >   drivers/gpu/drm/drm_bridge_connector.c | 33 +++++++++++++++++++++++++-
> > >   include/drm/drm_bridge.h               |  4 ++++
> > >   2 files changed, 36 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> > > index 07b5930b1282..a7b92f0d2430 100644
> > > --- a/drivers/gpu/drm/drm_bridge_connector.c
> > > +++ b/drivers/gpu/drm/drm_bridge_connector.c
> > > @@ -329,7 +329,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > >       struct drm_connector *connector;
> > >       struct i2c_adapter *ddc = NULL;
> > >       struct drm_bridge *bridge, *panel_bridge = NULL;
> > > +     enum drm_mode_subconnector subconnector;
> > >       int connector_type;
> > > +     int ret;
> > >
> > >       bridge_connector = kzalloc(sizeof(*bridge_connector), GFP_KERNEL);
> > >       if (!bridge_connector)
> > > @@ -365,8 +367,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > >               if (bridge->ops & DRM_BRIDGE_OP_MODES)
> > >                       bridge_connector->bridge_modes = bridge;
> > >
> > > -             if (!drm_bridge_get_next_bridge(bridge))
> > > +             if (!drm_bridge_get_next_bridge(bridge)) {
> > >                       connector_type = bridge->type;
> > > +                     subconnector = bridge->subtype;
> > > +             }
> > >
> > >   #ifdef CONFIG_OF
> > >               if (!drm_bridge_get_next_bridge(bridge) &&
> > > @@ -399,6 +403,33 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > >       if (panel_bridge)
> > >               drm_panel_bridge_set_orientation(connector, panel_bridge);
> > >
> > > +     if (connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
> > > +             drm_connector_attach_dp_subconnector_property(connector, subconnector);
> > > +     } else if (connector_type == DRM_MODE_CONNECTOR_DVII) {
> > > +             ret = drm_mode_create_dvi_i_properties(drm);
> > > +             if (ret)
> > > +                     return ERR_PTR(ret);
> > > +
> > > +             drm_object_attach_property(&connector->base,
> > > +                                        drm->mode_config.dvi_i_subconnector_property,
> > > +                                        subconnector);
> > > +     } else if (connector_type == DRM_MODE_CONNECTOR_TV) {
> > > +             ret = drm_mode_create_tv_properties(drm,
> > > +                                                 BIT(DRM_MODE_TV_MODE_NTSC) |
> > > +                                                 BIT(DRM_MODE_TV_MODE_NTSC_443) |
> > > +                                                 BIT(DRM_MODE_TV_MODE_NTSC_J) |
> > > +                                                 BIT(DRM_MODE_TV_MODE_PAL) |
> > > +                                                 BIT(DRM_MODE_TV_MODE_PAL_M) |
> > > +                                                 BIT(DRM_MODE_TV_MODE_PAL_N) |
> > > +                                                 BIT(DRM_MODE_TV_MODE_SECAM));
> > > +             if (ret)
> > > +                     return ERR_PTR(ret);
> >
> > I don't think this is right, this should be called from the appropriate encoder
> > device depending on the analog tv mode capabilities.
> 
> Good question. My logic was the following: the DRM device can have
> different TV out ports with different capabilities (yeah, pure
> theoretical construct). In this case it might be impossible to create
> a single subset of values. Thus it is more correct to create the
> property listing all possible values. The property is immutable anyway
> (and so the user doesn't have control over the value).

Those ports would correspond to different connectors, so I agree with
Neil, I don't think it's right to create a single property with all
modes and attach it to all analog output connectors.

If you want to support multiple analog outputs that have different
capabilities, this will need changes to drm_mode_create_tv_properties()
to allow creating multiple properties. If you don't want to do so now,
and prefer limiting support to devices where all ports support the same
modes (which includes devices with a single analog output), then the
modes should reflect what the device supports.

> > > +
> > > +             drm_object_attach_property(&connector->base,
> > > +                                        drm->mode_config.tv_subconnector_property,
> > > +                                        subconnector);
> >
> > Here, only add the property if drm->mode_config.tv_subconnector_property exists,
> > and perhaps add a warning if not.
> 
> This property is created in the previous call,
> drm_mode_create_tv_properties() ->
> drm_mode_create_tv_properties_legacy().
> 
> > AFAIK same for DRM_MODE_CONNECTOR_DVII.
> >
> > > +     }
> > > +
> > >       return connector;
> > >   }
> > >   EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
> > > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > > index bf964cdfb330..68b14ac5ac0d 100644
> > > --- a/include/drm/drm_bridge.h
> > > +++ b/include/drm/drm_bridge.h
> > > @@ -739,6 +739,10 @@ struct drm_bridge {
> > >        * identifies the type of connected display.
> > >        */
> > >       int type;
> > > +     /**
> > > +      * @subtype: the subtype of the connector for the DP/TV/DVI-I cases.
> > > +      */
> > > +     enum drm_mode_subconnector subtype;
> > >       /**
> > >        * @interlace_allowed: Indicate that the bridge can handle interlaced
> > >        * modes.

-- 
Regards,

Laurent Pinchart
