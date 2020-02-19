Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9191646EF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 15:29:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46516EC01;
	Wed, 19 Feb 2020 14:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11DB6EC01
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 14:29:22 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id a142so23945896oii.7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 06:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J7EJflTfTXRfnzAoPlnN7K9k1peyXU1Ge9F0Q6UZfwA=;
 b=TwsiUxSdecPrU3ExMJ4ep14F6vyV2eMsI9iIY4XnGBhYJNZWL4WmcQe7rav0kJ2lHv
 efwrPE4ayheuqeGjLc6cXyR/VVceja3Z0U39dgR8P2B3tGXcSxtk/7m/4G0IxMX/r7+h
 wO2SBdTxCvVDQIqs7hrjTSxrCwU9pHq+03FN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J7EJflTfTXRfnzAoPlnN7K9k1peyXU1Ge9F0Q6UZfwA=;
 b=DdvXsdWxpRkBuLZBTwiAkY+1RJcQCbwewkeNxj5mQblrUaOTo2lZxdZwelgvJMleaI
 aA7dVFHzovHtDBhfFtK6L1DJgFnEnVzYjDoLVVA+E1mH3aCFOZZqf22wRc8u4U66i8Mo
 89oEdija5OYSVU4DIdEZFYog+tLliJEctw71AQmVYRQDU4tw4+7qjjdi3iziFv1Ig+xC
 uBzjg/KD51Xr05pk7Y0XJaruGuXfCOW5Cm6nz1+aEbe1IlxRqm3AamlKDIxmpSYhH5Bb
 rGGCWDNd/o4QE9Jpa4ReU2is/Q76hAE34sPDAgMX4qpDv39ouPlLmrBDCVpmz0IB1nYe
 +j5A==
X-Gm-Message-State: APjAAAXK+BTefPBbVQPpUU/pls3FfTfUJ0axJ+ECkiMoplWFLNupZp74
 Lpe+SKfduuAsiBk+qmbAw82F321GDfUn6MwbO70aKw==
X-Google-Smtp-Source: APXvYqxxSQ94op2G3HpEJyi4ZS5d1XG1O/m6LdYEGhmw5oFfWwVdjtIBwD0r9lgtA8LkjlhZktzL80wmI+e8aEGJOhM=
X-Received: by 2002:a05:6808:10b:: with SMTP id
 b11mr4866433oie.110.1582122561946; 
 Wed, 19 Feb 2020 06:29:21 -0800 (PST)
MIME-Version: 1.0
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-38-daniel.vetter@ffwll.ch>
 <20200219135307.GH5070@pendragon.ideasonboard.com>
In-Reply-To: <20200219135307.GH5070@pendragon.ideasonboard.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 19 Feb 2020 15:29:10 +0100
Message-ID: <CAKMK7uE5ocvKi_dD6NJp8YkksNk_B064gK--vJ+6Vu3vZcOpgw@mail.gmail.com>
Subject: Re: [PATCH 37/52] drm/rcar-du: Drop explicit drm_mode_config_cleanup
 call
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2020 at 2:53 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Daniel,
>
> Thank you for the patch.
>
> On Wed, Feb 19, 2020 at 11:21:07AM +0100, Daniel Vetter wrote:
> > It's right above the drm_dev_put().
>
> Could you mention in the commit message that the call can be dropped
> because drm_mode_config_init() uses the managed API to handle cleaning
> automatically, removing the need to do so in drivers ? Otherwise when
> someone will look at the commit later, without having the full context
> in mind, the reason why the call is dropped won't be immediately clear.
> With this fixed,

Yeah I need to add that, since that explains the need for checking the
return value of drm_mode_config_init.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> This also applies to similar patches for other drivers.
>
> > Aside: Another driver with a bit much devm_kzalloc, which should
> > probably use drmm_kzalloc instead ...
>
> I agree, but I'm not sure this should be part of the commit message :-)

I'm trying to use this patch series as an education campaign about the
dangers of devm_kzalloc. Hence why I tried to touch as many drivers as
feasible (the ones I've did not touched have even more fundamental
lifetime issues and would blow up simply by switching to drm_dev_put()
for some reason or another). You alredy understand this stuff, so it's
a bit redundant here for your driver ...

I'm not sure about the other devm_kzalloc in rcar-du, but the one in
rcar_du_encoder_init seems to contain a drm_encoder, and drm_encoder
is a userspace visible thing. The others would need careful analysis,
but as a defensive move I'd e.g. not devm_kzalloc your driver private
structure behind drm_device->dev_private. It can work, but just a bit
too risky imo and hard to review for correctness.
-Daniel

> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Cc: linux-renesas-soc@vger.kernel.org
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 1 -
> >  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 4 +++-
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > index 654e2dd08146..3e67cf70f040 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > @@ -530,7 +530,6 @@ static int rcar_du_remove(struct platform_device *pdev)
> >       drm_dev_unregister(ddev);
> >
> >       drm_kms_helper_poll_fini(ddev);
> > -     drm_mode_config_cleanup(ddev);
> >
> >       drm_dev_put(ddev);
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > index fcfd916227d1..dcdc1580b511 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > @@ -712,7 +712,9 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
> >       unsigned int i;
> >       int ret;
> >
> > -     drm_mode_config_init(dev);
> > +     ret = drm_mode_config_init(dev);
> > +     if (ret)
> > +             return ret;
> >
> >       dev->mode_config.min_width = 0;
> >       dev->mode_config.min_height = 0;
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
