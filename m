Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1C3346B60
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 22:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADEBE6E174;
	Tue, 23 Mar 2021 21:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C75B6E174
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 21:51:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B248CB1D;
 Tue, 23 Mar 2021 22:51:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616536297;
 bh=DhPUhvIplQwn5uEXEluALoP9uxyM3s9ihKpOZ/rIOFQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=smznc+OwvmR1QkvFJPEVk7pjpscfZ+D7+lwFRzUq4+jkmFLPO37RzDv9z+qMGTvrK
 N5SXUusqHAr82QnQC1vsUOEFB8WwJlgMJ04LF1kv2OHhacCMZbqidbfJNCwFHzuk5s
 cmz2ck/JEQT0EJf+yURHgfreMkGaFtklNLWQOmec=
Date: Tue, 23 Mar 2021 23:50:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [RFC PATCH 05/11] drm/bridge: ti-sn65dsi86: Wrap panel with
 panel-bridge
Message-ID: <YFpiv5hVgrsptWXG@pendragon.ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-6-laurent.pinchart+renesas@ideasonboard.com>
 <161648364484.3012082.8827104507556270267@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161648364484.3012082.8827104507556270267@swboyd.mtv.corp.google.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

On Tue, Mar 23, 2021 at 12:14:04AM -0700, Stephen Boyd wrote:
> Quoting Laurent Pinchart (2021-03-21 20:01:22)
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 1d1be791d5ba..c21a7f7d452b 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -418,8 +420,18 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
> >         }
> >         pdata->dsi = dsi;
> >  
> > +       /* Attach the next bridge */
> > +       ret = drm_bridge_attach(bridge->encoder, pdata->next_bridge,
> > +                               &pdata->bridge, flags);
> > +       if (ret < 0) {
> > +               DRM_ERROR("failed to attach next bridge\n");
> 
> Can this be pushed into drm_bridge_attach() instead of in each caller?

Good idea.

> > +               goto err_dsi_detach;
> > +       }
> > +
> >         return 0;
> >  
> > +err_dsi_detach:
> > +       mipi_dsi_detach(dsi);
> >  err_dsi_attach:
> >         mipi_dsi_device_unregister(dsi);
> >  err_dsi_host:
> >  static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
> > @@ -1245,6 +1249,14 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
> >                 return ret;
> >         }
> >  
> > +       pdata->next_bridge = devm_drm_panel_bridge_add(pdata->dev,
> > +                                                      pdata->panel);
> > +       if (IS_ERR(pdata->next_bridge)) {
> > +               DRM_ERROR("failed to create panel bridge\n");
> > +               ret = PTR_ERR(pdata->next_bridge);
> > +               return ret;
> 
> Just return PTR_ERR(pdata->next_bridge)?

Indeed. Bad copy and paste.

> > +       }
> > +
> >         dev_set_drvdata(&client->dev, pdata);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
