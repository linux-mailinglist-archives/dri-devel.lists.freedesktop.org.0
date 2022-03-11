Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1444D5CFB
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 09:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC2010E2C8;
	Fri, 11 Mar 2022 08:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6441A10E2C8;
 Fri, 11 Mar 2022 08:06:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CAC26488;
 Fri, 11 Mar 2022 09:06:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646985970;
 bh=yukh05lLNurYjdrhxyLrN8249mtEL9BDg0pGHOAKYRQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C7AI2pmG0Y52GXcxJb7eVzHs3UIkyCay/E5W7TWwgBe63BLeYyFklgO3cml2Rv049
 8L2XwnyOBbtxEjxDthYmqtYKKI+k0GBEVXpa5VhPcpjyyT2xrXg2c8v6auBuBSX9AC
 BjpSU7wzSVxR7E6e+Vim/UKa93e+s4VW8l7oFxI8=
Date: Fri, 11 Mar 2022 10:05:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/6] drm: allow real encoder to be passed for
 drm_writeback_connector
Message-ID: <YisC4cY8EZADarG6@pendragon.ideasonboard.com>
References: <1646963400-25606-1-git-send-email-quic_abhinavk@quicinc.com>
 <1646963400-25606-2-git-send-email-quic_abhinavk@quicinc.com>
 <CAA8EJpqnC=crWaSrXLNLBX5WsZ6LDzG0aNUu7RmqhDPTvP8tFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAA8EJpqnC=crWaSrXLNLBX5WsZ6LDzG0aNUu7RmqhDPTvP8tFQ@mail.gmail.com>
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
Cc: hamohammed.sa@gmail.com, suraj.kandpal@intel.com, emma@anholt.net,
 rodrigosiqueiramelo@gmail.com, jani.nikula@intel.com, liviu.dudau@arm.com,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, melissa.srw@gmail.com, nganji@codeaurora.org,
 seanpaul@chromium.org, james.qian.wang@arm.com, quic_aravindh@quicinc.com,
 mihail.atanassov@arm.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 11, 2022 at 10:46:13AM +0300, Dmitry Baryshkov wrote:
> On Fri, 11 Mar 2022 at 04:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >
> > For some vendor driver implementations, display hardware can
> > be shared between the encoder used for writeback and the physical
> > display.
> >
> > In addition resources such as clocks and interrupts can
> > also be shared between writeback and the real encoder.
> >
> > To accommodate such vendor drivers and hardware, allow
> > real encoder to be passed for drm_writeback_connector.
> >
> > Co-developed-by: Kandpal Suraj <suraj.kandpal@intel.com>
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > ---
> >  drivers/gpu/drm/drm_writeback.c |  8 ++++----
> >  include/drm/drm_writeback.h     | 13 +++++++++++--
> >  2 files changed, 15 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> > index dccf4504..4dad687 100644
> > --- a/drivers/gpu/drm/drm_writeback.c
> > +++ b/drivers/gpu/drm/drm_writeback.c
> > @@ -189,8 +189,8 @@ int drm_writeback_connector_init(struct drm_device *dev,
> >         if (IS_ERR(blob))
> >                 return PTR_ERR(blob);
> >
> > -       drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
> > -       ret = drm_encoder_init(dev, &wb_connector->encoder,
> > +       drm_encoder_helper_add(wb_connector->encoder, enc_helper_funcs);
> > +       ret = drm_encoder_init(dev, wb_connector->encoder,
> >                                &drm_writeback_encoder_funcs,
> >                                DRM_MODE_ENCODER_VIRTUAL, NULL);
> 
> If the encoder is provided by a separate driver, it might use a
> different set of encoder funcs.

More than that, if the encoder is provided externally but doesn't have
custom operations, I don't really see the point of having an external
encoder in the first place.

Has this series been tested with a driver that needs to provide an
encoder, to make sure it fits the purpose ?

> I'd suggest checking whether the wb_connector->encoder is NULL here.
> If it is, allocate one using drmm_kzalloc and init it.
> If it is not NULL, assume that it has been initialized already, so
> skip the drm_encoder_init() and just call the drm_encoder_helper_add()
> 
> >         if (ret)
> > @@ -204,7 +204,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
> >                 goto connector_fail;
> >
> >         ret = drm_connector_attach_encoder(connector,
> > -                                               &wb_connector->encoder);
> > +                                               wb_connector->encoder);
> >         if (ret)
> >                 goto attach_fail;
> >
> > @@ -233,7 +233,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
> >  attach_fail:
> >         drm_connector_cleanup(connector);
> >  connector_fail:
> > -       drm_encoder_cleanup(&wb_connector->encoder);
> > +       drm_encoder_cleanup(wb_connector->encoder);
> >  fail:
> >         drm_property_blob_put(blob);
> >         return ret;
> > diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> > index 9697d27..0ba266e 100644
> > --- a/include/drm/drm_writeback.h
> > +++ b/include/drm/drm_writeback.h
> > @@ -25,13 +25,22 @@ struct drm_writeback_connector {
> >         struct drm_connector base;
> >
> >         /**
> > -        * @encoder: Internal encoder used by the connector to fulfill
> > +        * @encoder: handle to drm_encoder used by the connector to fulfill
> >          * the DRM framework requirements. The users of the
> >          * @drm_writeback_connector control the behaviour of the @encoder
> >          * by passing the @enc_funcs parameter to drm_writeback_connector_init()
> >          * function.
> > +        *
> > +        * For some vendor drivers, the hardware resources are shared between
> > +        * writeback encoder and rest of the display pipeline.
> > +        * To accommodate such cases, encoder is a handle to the real encoder
> > +        * hardware.
> > +        *
> > +        * For current existing writeback users, this shall continue to be the
> > +        * embedded encoder for the writeback connector.
> > +        *
> >          */
> > -       struct drm_encoder encoder;
> > +       struct drm_encoder *encoder;
> >
> >         /**
> >          * @pixel_formats_blob_ptr:

-- 
Regards,

Laurent Pinchart
