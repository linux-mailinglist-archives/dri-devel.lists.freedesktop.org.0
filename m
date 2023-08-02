Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9B776C8F0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 11:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A0E10E527;
	Wed,  2 Aug 2023 09:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D1B10E528
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 09:06:02 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-579de633419so65251957b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 02:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690967162; x=1691571962;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zJo1GDVdxjuEF3GZ0h8NCedqxxr4bUpTzfP363f04Q4=;
 b=xRGySJsX/O0+HhQkS9s1TftOkx+w+jubWByoUFUKefpw2nDpcBsHdp4/xIaD7QpT9W
 TiwMdHCvVtHdYongyJOBpuXq9XO/tcdXjHuZFW04WbnaXyUddsEFo4j6pnIcKkNUIE/3
 fKXlk2nD7GNIo/jtR9qQKQu6WBZdrsKXUHJDp7kQd2ObGjRwkn63H9quVg2vCFUd2RvC
 0+12chHxSUHVCM9NV0pIyZyEV6PgBAC3PZLtGCrweEf+xP1wmH2U4WsqScSnaLwx5sz1
 sVQ60Cud/S6wfOFT8336s4uRw25oh8Eu2f34Izfj+y+t35fWiGxgniykI0EU0+L76kGS
 Q7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690967162; x=1691571962;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zJo1GDVdxjuEF3GZ0h8NCedqxxr4bUpTzfP363f04Q4=;
 b=K4rbAMBYgPRvv8DL7C5Rxx8khSUjVH2LTORZdLz9V92jwDXbJ9XLcwAQ1hPCwwDta/
 jZMpXetDi2eDlqQcu9VsUryyEoUq+Qs2Ogfya9YE7Z8dyRSYRMVHF2v/wojwK+FwsNrK
 yxvkqhwmsqKHoP5sZI7h7M2pX/w9u+OxUAyAz5sGvUW0auN0ovekbTQa/rV9vsgt9X5+
 JquXZ/X9I2hVrbdkUwexVpFDvnfDJKf2/qslP3PUiKsFp4GHEhDL7UVYBzy3FRmYcVSq
 HhDRkpAge10CqJ0PTCrfDlO2AU/y9IA+YDWMrFtGiWUWAkrShT0cwuvgutH+E3InVH9+
 yuxw==
X-Gm-Message-State: ABy/qLY50MWjRNvBDXuycNb7DoRmfPDqTH5KFoxP5gSF+V4BoVe50t+/
 3OgvusRdFhYbMZyC627zDch7/3N9CrCKe4wGQ99T8g==
X-Google-Smtp-Source: APBJJlHe54V6RwR/aD4wxBit+WMtsfxJlYINs/ZT5LNjHwEGqkD1LUetUBnjUZ1FiOdGz7XZoUX8Xtdd8QI/8ZkfVZQ=
X-Received: by 2002:a81:6c52:0:b0:573:9e0a:b8bf with SMTP id
 h79-20020a816c52000000b005739e0ab8bfmr13033940ywc.9.1690967161816; Wed, 02
 Aug 2023 02:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230729004913.215872-1-dmitry.baryshkov@linaro.org>
 <20230729004913.215872-3-dmitry.baryshkov@linaro.org>
 <0cc04d99-d7aa-68ff-b304-7d42ae7f0dde@linaro.org>
In-Reply-To: <0cc04d99-d7aa-68ff-b304-7d42ae7f0dde@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 2 Aug 2023 12:05:50 +0300
Message-ID: <CAA8EJpoMC-YbWvyfCsdAHOL9aw3nfQ=g8BgLp2mb9iozeRgBpg@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/bridge-connector: handle subconnector types
To: neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Janne Grunau <j@jannau.net>,
 Robert Foss <rfoss@kernel.org>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Gross <agross@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 Bjorn Andersson <andersson@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Aug 2023 at 11:35, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 29/07/2023 02:49, Dmitry Baryshkov wrote:
> > If the created connector type supports subconnector type property,
> > create and attach corresponding it. The default subtype value is 0,
> > which maps to the DRM_MODE_SUBCONNECTOR_Unknown type.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/drm_bridge_connector.c | 33 +++++++++++++++++++++++++-
> >   include/drm/drm_bridge.h               |  4 ++++
> >   2 files changed, 36 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> > index 07b5930b1282..a7b92f0d2430 100644
> > --- a/drivers/gpu/drm/drm_bridge_connector.c
> > +++ b/drivers/gpu/drm/drm_bridge_connector.c
> > @@ -329,7 +329,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> >       struct drm_connector *connector;
> >       struct i2c_adapter *ddc = NULL;
> >       struct drm_bridge *bridge, *panel_bridge = NULL;
> > +     enum drm_mode_subconnector subconnector;
> >       int connector_type;
> > +     int ret;
> >
> >       bridge_connector = kzalloc(sizeof(*bridge_connector), GFP_KERNEL);
> >       if (!bridge_connector)
> > @@ -365,8 +367,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> >               if (bridge->ops & DRM_BRIDGE_OP_MODES)
> >                       bridge_connector->bridge_modes = bridge;
> >
> > -             if (!drm_bridge_get_next_bridge(bridge))
> > +             if (!drm_bridge_get_next_bridge(bridge)) {
> >                       connector_type = bridge->type;
> > +                     subconnector = bridge->subtype;
> > +             }
> >
> >   #ifdef CONFIG_OF
> >               if (!drm_bridge_get_next_bridge(bridge) &&
> > @@ -399,6 +403,33 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> >       if (panel_bridge)
> >               drm_panel_bridge_set_orientation(connector, panel_bridge);
> >
> > +     if (connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
> > +             drm_connector_attach_dp_subconnector_property(connector, subconnector);
> > +     } else if (connector_type == DRM_MODE_CONNECTOR_DVII) {
> > +             ret = drm_mode_create_dvi_i_properties(drm);
> > +             if (ret)
> > +                     return ERR_PTR(ret);
> > +
> > +             drm_object_attach_property(&connector->base,
> > +                                        drm->mode_config.dvi_i_subconnector_property,
> > +                                        subconnector);
> > +     } else if (connector_type == DRM_MODE_CONNECTOR_TV) {
> > +             ret = drm_mode_create_tv_properties(drm,
> > +                                                 BIT(DRM_MODE_TV_MODE_NTSC) |
> > +                                                 BIT(DRM_MODE_TV_MODE_NTSC_443) |
> > +                                                 BIT(DRM_MODE_TV_MODE_NTSC_J) |
> > +                                                 BIT(DRM_MODE_TV_MODE_PAL) |
> > +                                                 BIT(DRM_MODE_TV_MODE_PAL_M) |
> > +                                                 BIT(DRM_MODE_TV_MODE_PAL_N) |
> > +                                                 BIT(DRM_MODE_TV_MODE_SECAM));
> > +             if (ret)
> > +                     return ERR_PTR(ret);
>
> I don't think this is right, this should be called from the appropriate encoder
> device depending on the analog tv mode capabilities.

Good question. My logic was the following: the DRM device can have
different TV out ports with different capabilities (yeah, pure
theoretical construct). In this case it might be impossible to create
a single subset of values. Thus it is more correct to create the
property listing all possible values. The property is immutable anyway
(and so the user doesn't have control over the value).


> > +
> > +             drm_object_attach_property(&connector->base,
> > +                                        drm->mode_config.tv_subconnector_property,
> > +                                        subconnector);
>
> Here, only add the property if drm->mode_config.tv_subconnector_property exists,
> and perhaps add a warning if not.

This property is created in the previous call,
drm_mode_create_tv_properties() ->
drm_mode_create_tv_properties_legacy().

>
> AFAIK same for DRM_MODE_CONNECTOR_DVII.
>
> > +     }
> > +
> >       return connector;
> >   }
> >   EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
> > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > index bf964cdfb330..68b14ac5ac0d 100644
> > --- a/include/drm/drm_bridge.h
> > +++ b/include/drm/drm_bridge.h
> > @@ -739,6 +739,10 @@ struct drm_bridge {
> >        * identifies the type of connected display.
> >        */
> >       int type;
> > +     /**
> > +      * @subtype: the subtype of the connector for the DP/TV/DVI-I cases.
> > +      */
> > +     enum drm_mode_subconnector subtype;
> >       /**
> >        * @interlace_allowed: Indicate that the bridge can handle interlaced
> >        * modes.
>


-- 
With best wishes
Dmitry
