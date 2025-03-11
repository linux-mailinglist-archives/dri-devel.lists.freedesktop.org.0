Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8337A5CCBA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 18:51:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24C510E64D;
	Tue, 11 Mar 2025 17:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hL9YICC3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0F510E640;
 Tue, 11 Mar 2025 17:51:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9037E5C47E8;
 Tue, 11 Mar 2025 17:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54FBC4CEE9;
 Tue, 11 Mar 2025 17:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741715457;
 bh=U19B1VbgcefCWApQl3IgM9D9d+Wj0G03LxjOQo70xsY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hL9YICC3lAvNRINCs6cAzKtSB3WciXhC3DmhFVHSluffzdBqe03Kdf2q2yeopaIoW
 b6M9W+J7KocCVC+zblCznTewQojkyvcnEZNxWHun8q5qi1pAxmTDccvFN/+rOREmnq
 XZ7X6ZbZDDdgBVwFzogLxi5nBkE2cGS2pqaB97tHAITFbHo6S4/mieWF5RhVnbyidy
 QL/9hAq8PRS5S4atgIVoEnxcxeoQOSnWJ9jUv+WU9+y61q3xacRX9x4OzjRD9V8e7D
 8cV2VBEIo5Zzi3kp8Mh9TNjXGgPgPejRYYdlZQbSVCdEzMYGx1TsGS9akjjtmzj+pd
 sztYzrhts4zww==
Date: Tue, 11 Mar 2025 19:50:50 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Hermes Wu <Hermes.wu@ite.com.tw>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 1/2] drm/bridge: split HDMI Audio from
 DRM_BRIDGE_OP_HDMI
Message-ID: <gqizmvyunfzhxwo4qpbqwe26le5dkodu6sbur4npuoc5ij6f3n@ldqbdmah5fsd>
References: <20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org>
 <20250307-dp-hdmi-audio-v5-1-f3be215fdb78@linaro.org>
 <20250310-unnatural-puffin-of-revolution-59d726@houat>
 <CALT56yPKe8+tSyChAo6ypHR8EWUpqeJDNM6mcOBUnFwFE7rg4w@mail.gmail.com>
 <20250311-quizzical-warthog-of-leadership-53d224@houat>
 <nx67lft5x4ytsxsd4mpxfocig5dfaolsurlwqzvkrniwzv3huz@hmwucvqykaid>
 <20250311-benevolent-goat-of-thunder-8e73bb@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-benevolent-goat-of-thunder-8e73bb@houat>
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

On Tue, Mar 11, 2025 at 04:58:59PM +0100, Maxime Ripard wrote:
> On Tue, Mar 11, 2025 at 05:50:09PM +0200, Dmitry Baryshkov wrote:
> > On Tue, Mar 11, 2025 at 09:36:37AM +0100, Maxime Ripard wrote:
> > > On Mon, Mar 10, 2025 at 08:42:29PM +0200, Dmitry Baryshkov wrote:
> > > > On Mon, 10 Mar 2025 at 16:55, Maxime Ripard <mripard@kernel.org> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Fri, Mar 07, 2025 at 07:55:52AM +0200, Dmitry Baryshkov wrote:
> > > > > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > >
> > > > > > As pointed out by Laurent, OP bits are supposed to describe operations.
> > > > > > Split DRM_BRIDGE_OP_HDMI_AUDIO from DRM_BRIDGE_OP_HDMI instead of
> > > > > > overloading DRM_BRIDGE_OP_HDMI.
> > > > > >
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > ---
> > > > > >  drivers/gpu/drm/bridge/lontium-lt9611.c        |  2 +-
> > > > > >  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   |  1 +
> > > > > >  drivers/gpu/drm/display/drm_bridge_connector.c | 59 +++++++++++++++++---------
> > > > > >  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c         |  1 +
> > > > > >  include/drm/drm_bridge.h                       | 23 ++++++++--
> > > > > >  5 files changed, 61 insertions(+), 25 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> > > > > > index 026803034231f78c17f619dc04119bdd9b2b6679..3b93c17e25c18ae0d13e9bb74553cf21dcc39f9d 100644
> > > > > > --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> > > > > > +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> > > > > > @@ -1130,7 +1130,7 @@ static int lt9611_probe(struct i2c_client *client)
> > > > > >       lt9611->bridge.of_node = client->dev.of_node;
> > > > > >       lt9611->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> > > > > >                            DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_MODES |
> > > > > > -                          DRM_BRIDGE_OP_HDMI;
> > > > > > +                          DRM_BRIDGE_OP_HDMI | DRM_BRIDGE_OP_HDMI_AUDIO;
> > > > > >       lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
> > > > > >       lt9611->bridge.vendor = "Lontium";
> > > > > >       lt9611->bridge.product = "LT9611";
> > > > > > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> > > > > > index 6166f197e37b552cb8a52b7b0d23ffc632f54557..5e5f8c2f95be1f5c4633f1093b17a00f9425bb37 100644
> > > > > > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> > > > > > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> > > > > > @@ -1077,6 +1077,7 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
> > > > > >       hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT |
> > > > > >                          DRM_BRIDGE_OP_EDID |
> > > > > >                          DRM_BRIDGE_OP_HDMI |
> > > > > > +                        DRM_BRIDGE_OP_HDMI_AUDIO |
> > > > > >                          DRM_BRIDGE_OP_HPD;
> > > > > >       hdmi->bridge.of_node = pdev->dev.of_node;
> > > > > >       hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
> > > > > > diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> > > > > > index 30c736fc0067e31a97db242e5b16ea8a5b4cf359..030f98d454608a63154827c65d4822d378df3b4c 100644
> > > > > > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > > > > > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > > > > > @@ -98,6 +98,13 @@ struct drm_bridge_connector {
> > > > > >        * HDMI connector infrastructure, if any (see &DRM_BRIDGE_OP_HDMI).
> > > > > >        */
> > > > > >       struct drm_bridge *bridge_hdmi;
> > > > > > +     /**
> > > > > > +      * @bridge_hdmi_audio:
> > > > > > +      *
> > > > > > +      * The bridge in the chain that implements necessary support for the
> > > > > > +      * HDMI Audio infrastructure, if any (see &DRM_BRIDGE_OP_HDMI_AUDIO).
> > > > > > +      */
> > > > > > +     struct drm_bridge *bridge_hdmi_audio;
> > > > > >  };
> > > > > >
> > > > > >  #define to_drm_bridge_connector(x) \
> > > > > > @@ -433,7 +440,7 @@ static int drm_bridge_connector_audio_startup(struct drm_connector *connector)
> > > > > >               to_drm_bridge_connector(connector);
> > > > > >       struct drm_bridge *bridge;
> > > > > >
> > > > > > -     bridge = bridge_connector->bridge_hdmi;
> > > > > > +     bridge = bridge_connector->bridge_hdmi_audio;
> > > > > >       if (!bridge)
> > > > > >               return -EINVAL;
> > > > > >
> > > > > > @@ -451,7 +458,7 @@ static int drm_bridge_connector_audio_prepare(struct drm_connector *connector,
> > > > > >               to_drm_bridge_connector(connector);
> > > > > >       struct drm_bridge *bridge;
> > > > > >
> > > > > > -     bridge = bridge_connector->bridge_hdmi;
> > > > > > +     bridge = bridge_connector->bridge_hdmi_audio;
> > > > > >       if (!bridge)
> > > > > >               return -EINVAL;
> > > > > >
> > > > > > @@ -464,7 +471,7 @@ static void drm_bridge_connector_audio_shutdown(struct drm_connector *connector)
> > > > > >               to_drm_bridge_connector(connector);
> > > > > >       struct drm_bridge *bridge;
> > > > > >
> > > > > > -     bridge = bridge_connector->bridge_hdmi;
> > > > > > +     bridge = bridge_connector->bridge_hdmi_audio;
> > > > > >       if (!bridge)
> > > > > >               return;
> > > > > >
> > > > > > @@ -478,7 +485,7 @@ static int drm_bridge_connector_audio_mute_stream(struct drm_connector *connecto
> > > > > >               to_drm_bridge_connector(connector);
> > > > > >       struct drm_bridge *bridge;
> > > > > >
> > > > > > -     bridge = bridge_connector->bridge_hdmi;
> > > > > > +     bridge = bridge_connector->bridge_hdmi_audio;
> > > > > >       if (!bridge)
> > > > > >               return -EINVAL;
> > > > > >
> > > > > > @@ -576,6 +583,21 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > > > > >                               max_bpc = bridge->max_bpc;
> > > > > >               }
> > > > > >
> > > > > > +             if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO) {
> > > > > > +                     if (bridge_connector->bridge_hdmi_audio)
> > > > > > +                             return ERR_PTR(-EBUSY);
> > > > > > +
> > > > > > +                     if (!bridge->hdmi_audio_max_i2s_playback_channels &&
> > > > > > +                         !bridge->hdmi_audio_spdif_playback)
> > > > > > +                             return ERR_PTR(-EINVAL);
> > > > > > +
> > > > > > +                     if (!bridge->funcs->hdmi_audio_prepare ||
> > > > > > +                         !bridge->funcs->hdmi_audio_shutdown)
> > > > > > +                             return ERR_PTR(-EINVAL);
> > > > > > +
> > > > > > +                     bridge_connector->bridge_hdmi_audio = bridge;
> > > > > > +             }
> > > > > > +
> > > > > >               if (!drm_bridge_get_next_bridge(bridge))
> > > > > >                       connector_type = bridge->type;
> > > > > >
> > > > > > @@ -611,22 +633,6 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > > > > >                                              max_bpc);
> > > > > >               if (ret)
> > > > > >                       return ERR_PTR(ret);
> > > > > > -
> > > > > > -             if (bridge->hdmi_audio_max_i2s_playback_channels ||
> > > > > > -                 bridge->hdmi_audio_spdif_playback) {
> > > > > > -                     if (!bridge->funcs->hdmi_audio_prepare ||
> > > > > > -                         !bridge->funcs->hdmi_audio_shutdown)
> > > > > > -                             return ERR_PTR(-EINVAL);
> > > > > > -
> > > > > > -                     ret = drm_connector_hdmi_audio_init(connector,
> > > > > > -                                                         bridge->hdmi_audio_dev,
> > > > > > -                                                         &drm_bridge_connector_hdmi_audio_funcs,
> > > > > > -                                                         bridge->hdmi_audio_max_i2s_playback_channels,
> > > > > > -                                                         bridge->hdmi_audio_spdif_playback,
> > > > > > -                                                         bridge->hdmi_audio_dai_port);
> > > > > > -                     if (ret)
> > > > > > -                             return ERR_PTR(ret);
> > > > > > -             }
> > > > > >       } else {
> > > > > >               ret = drmm_connector_init(drm, connector,
> > > > > >                                         &drm_bridge_connector_funcs,
> > > > > > @@ -635,6 +641,19 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > > > > >                       return ERR_PTR(ret);
> > > > > >       }
> > > > > >
> > > > > > +     if (bridge_connector->bridge_hdmi_audio) {
> > > > > > +             bridge = bridge_connector->bridge_hdmi_audio;
> > > > > > +
> > > > > > +             ret = drm_connector_hdmi_audio_init(connector,
> > > > > > +                                                 bridge->hdmi_audio_dev,
> > > > > > +                                                 &drm_bridge_connector_hdmi_audio_funcs,
> > > > > > +                                                 bridge->hdmi_audio_max_i2s_playback_channels,
> > > > > > +                                                 bridge->hdmi_audio_spdif_playback,
> > > > > > +                                                 bridge->hdmi_audio_dai_port);
> > > > > > +             if (ret)
> > > > > > +                     return ERR_PTR(ret);
> > > > > > +     }
> > > > > > +
> > > > > >       drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
> > > > > >
> > > > > >       if (bridge_connector->bridge_hpd)
> > > > > > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > > > index 1456354c8af4bc7f655e8a47e958e9e0b99b7d29..ab6c8bc4a30b681f7de8ca7031f833795d1f7d94 100644
> > > > > > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > > > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > > > @@ -515,6 +515,7 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
> > > > > >       bridge->ops = DRM_BRIDGE_OP_HPD |
> > > > > >               DRM_BRIDGE_OP_DETECT |
> > > > > >               DRM_BRIDGE_OP_HDMI |
> > > > > > +             DRM_BRIDGE_OP_HDMI_AUDIO |
> > > > > >               DRM_BRIDGE_OP_EDID;
> > > > > >       bridge->hdmi_audio_max_i2s_playback_channels = 8;
> > > > > >       bridge->hdmi_audio_dev = &hdmi->pdev->dev;
> > > > > > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > > > > > index d4c75d59fa12be1bd7375ce3ea56415235781b28..dff8cf035b30d5c7e00bfdf5d6e12802559823ba 100644
> > > > > > --- a/include/drm/drm_bridge.h
> > > > > > +++ b/include/drm/drm_bridge.h
> > > > > > @@ -693,8 +693,10 @@ struct drm_bridge_funcs {
> > > > > >       /**
> > > > > >        * @hdmi_audio_prepare:
> > > > > >        * Configures HDMI-encoder for audio stream. Can be called multiple
> > > > > > -      * times for each setup. Mandatory if HDMI audio is enabled in the
> > > > > > -      * bridge's configuration.
> > > > > > +      * times for each setup.
> > > > > > +      *
> > > > > > +      * This callback is optional but it must be implemented by bridges that
> > > > > > +      * set the DRM_BRIDGE_OP_HDMI_AUDIO flag in their &drm_bridge->ops.
> > > > > >        *
> > > > > >        * Returns:
> > > > > >        * 0 on success, a negative error code otherwise
> > > > > > @@ -707,8 +709,10 @@ struct drm_bridge_funcs {
> > > > > >       /**
> > > > > >        * @hdmi_audio_shutdown:
> > > > > >        *
> > > > > > -      * Shut down the audio stream. Mandatory if HDMI audio is enabled in
> > > > > > -      * the bridge's configuration.
> > > > > > +      * Shut down the audio stream.
> > > > > > +      *
> > > > > > +      * This callback is optional but it must be implemented by bridges that
> > > > > > +      * set the DRM_BRIDGE_OP_HDMI_AUDIO flag in their &drm_bridge->ops.
> > > > > >        *
> > > > > >        * Returns:
> > > > > >        * 0 on success, a negative error code otherwise
> > > > > > @@ -814,6 +818,17 @@ enum drm_bridge_ops {
> > > > > >        * drivers.
> > > > > >        */
> > > > > >       DRM_BRIDGE_OP_HDMI = BIT(4),
> > > > > > +     /**
> > > > > > +      * @DRM_BRIDGE_OP_HDMI_AUDIO: The bridge provides HDMI audio operations.
> > > > > > +      * Bridges that set this flag must implement the
> > > > > > +      * &drm_bridge_funcs->hdmi_audio_prepare and
> > > > > > +      * &drm_bridge_funcs->hdmi_audio_shutdown callbacks.
> > > > > > +      *
> > > > > > +      * Note: currently there can be at most one bridge in a chain that sets
> > > > > > +      * this bit. This is to simplify corresponding glue code in connector
> > > > > > +      * drivers.
> > > > > > +      */
> > > > > > +     DRM_BRIDGE_OP_HDMI_AUDIO = BIT(5),
> > > > >
> > > > > We should make this conditional on HDMI being set. It doesn't make sense
> > > > > to have OP_HDMI_AUDIO enabled when OP_HDMI isn't.
> > > > 
> > > > It totally does.
> > > 
> > > I'm sure it works properly. I meant on a conceptual level. In our
> > > codebase, as it is today, the HDMI audio support is part of the HDMI
> > > infrastructure, and thus implementing audio without the main part
> > > doesn't make sense. IIRC, the spec also mandates video support, but
> > > audio is optional.
> > 
> > I can imagine a HDMI bridge using OP_HDMI_AUDIO, but not OP_HDMI. For
> > example, lontium-lt9611uxc.c. It is a 'smart' chip, which handles nearly
> > everything on its own. I even don't know if there is a way to program
> > the InfoFrames, etc., so I'm very skeptical about setting OP_HDMI.
> > However at the same time, it would defeinitely benefit from using
> > OP_HDMI_AUDIO.
> 
> You're going to have the same argument for that chip for audio: if not
> be able to set the infoframe disqualifies, then there's audio infoframes
> too and thus it should be disqualified from OP_HDMI_AUDIO.

Why? OP_HDMI_AUDIO has nothing to do with InfoFrames, it's just HDMI
codec. We need infoframes and tmds_char_rate_valid for OP_HDMI.

> 
> I don't believe it's an issue though: if a driver doesn't want the
> infoframes for whatever reason, it's free to do so.
> 
> It's also something I'd like to reevaluate when we actually have that
> problem to deal with. At the moment, it sounds like reducing the safety
> of the API for an hypothetical case.

Well, you can guess, I'd like to submit a patch for that driver as soon
as we settle on OP_HDMI_AUDIO.


-- 
With best wishes
Dmitry
