Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 013AF166201
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 17:13:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6BE6EDCC;
	Thu, 20 Feb 2020 16:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698E46EDCE
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 16:13:09 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id w6so4191540otk.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 08:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2cv7a5bUQjuPkMHk7UwybBDaplNeaD9SMLS2O3cAc9A=;
 b=ONg5U5WoIFLjwMWKqZXu5j6b6CeDK0ikBrmyqfzmSkmcPq+7ZFFo3oT42ahVzdmeKw
 ZzioqQSMyj+vHsY8hYB5GJSNAXHhrfXMD0hgHXck17CT57sfBqyKDd4Yomp9Q0Xapexj
 dP5Ip/MwSNfvkbUENG9OlIvXOuVTlzqv8NOkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2cv7a5bUQjuPkMHk7UwybBDaplNeaD9SMLS2O3cAc9A=;
 b=IyTeIrLWJeDNLduRXk9YSn48IQCne65H5X1/NmNWKRp7hkGbu6TMz9B+l8tWFViKXS
 UwKaS0OnHs028tmXZYmWSYqI/+XkYxRdn+te2ToL79C2GiBFh8s1wY0BJk39x8Vw+K5w
 4OHjsh4t8qQojdtjvoOH2caCFNN0IMSht51bYLzj1Desx4sSBl3oI0RhW8E+ICn/UBDA
 4sTiwyk4bdVoILtorYPnRmmSae/eN7llZvPoLXDJWi99BTwmS3kFQdCaolyojplbIeA3
 RCVBvH8zi0149vqyOsjxihPebx+W0PlpXFVFReTnWD8osJcynPm8NdQk6FaJM/ayFkOw
 4fBw==
X-Gm-Message-State: APjAAAWbcvjsPPU6mBBL96mxikVH2lV9vO0/OqrSxjXhBYAUfIJ7NLwz
 IRysFz6dzu2YSxhomRQqvFBaKLjv0iRveXekEZi5IA==
X-Google-Smtp-Source: APXvYqzFIGcln3VKGQY6f7FjTVpMYXh7wPjZYVsdkIaSjoSgCmdzk2GkQ/rYXK8jFBx0wRnyWUrxMSC2cyklaYSHnDk=
X-Received: by 2002:a9d:7696:: with SMTP id j22mr25664349otl.188.1582215188621; 
 Thu, 20 Feb 2020 08:13:08 -0800 (PST)
MIME-Version: 1.0
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-40-daniel.vetter@ffwll.ch>
 <30ed80c9-8b18-8e23-a26b-2c406d43c90d@st.com>
In-Reply-To: <30ed80c9-8b18-8e23-a26b-2c406d43c90d@st.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 20 Feb 2020 17:12:57 +0100
Message-ID: <CAKMK7uFCus1X7A4c_SA_n=_9KEhRVwtom_aB1CecGkQuOptoNA@mail.gmail.com>
Subject: Re: [PATCH 39/52] drm/stm: Drop explicit drm_mode_config_cleanup call
To: Philippe CORNU <philippe.cornu@st.com>
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Vincent ABRIOU <vincent.abriou@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 3:19 PM Philippe CORNU <philippe.cornu@st.com> wrote:
>
> Hi Daniel,
>
> On 2/19/20 11:21 AM, Daniel Vetter wrote:
> > It's right above the drm_dev_put().
> >
> > Aside: Another driver with a bit much devm_kzalloc, which should
> > probably use drmm_kzalloc instead ...
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Yannick Fertre <yannick.fertre@st.com>
> > Cc: Philippe Cornu <philippe.cornu@st.com>
> > Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> > Cc: Vincent Abriou <vincent.abriou@st.com>
> > Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> > Cc: Alexandre Torgue <alexandre.torgue@st.com>
> > Cc: linux-stm32@st-md-mailman.stormreply.com
> > Cc: linux-arm-kernel@lists.infradead.org
> > ---
> >   drivers/gpu/drm/stm/drv.c | 10 ++++------
> >   1 file changed, 4 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
> > index ea9fcbdc68b3..5b374531dd8c 100644
> > --- a/drivers/gpu/drm/stm/drv.c
> > +++ b/drivers/gpu/drm/stm/drv.c
> > @@ -88,7 +88,9 @@ static int drv_load(struct drm_device *ddev)
> >
> >       ddev->dev_private = (void *)ldev;
> >
> > -     drm_mode_config_init(ddev);
> > +     ret = drm_mode_config_init(ddev);
> > +     if (ret)
> > +             return ret;
> >
> >       /*
> >        * set max width and height as default value.
> > @@ -103,7 +105,7 @@ static int drv_load(struct drm_device *ddev)
> >
> >       ret = ltdc_load(ddev);
> >       if (ret)
> > -             goto err;
> > +             return ret;
> >
> >       drm_mode_config_reset(ddev);
> >       drm_kms_helper_poll_init(ddev);
> > @@ -111,9 +113,6 @@ static int drv_load(struct drm_device *ddev)
> >       platform_set_drvdata(pdev, ddev);
> >
> >       return 0;
> > -err:
> > -     drm_mode_config_cleanup(ddev);
> > -     return ret;
> >   }
> >
> >   static void drv_unload(struct drm_device *ddev)
> > @@ -122,7 +121,6 @@ static void drv_unload(struct drm_device *ddev)
> >
> >       drm_kms_helper_poll_fini(ddev);
> >       ltdc_unload(ddev);
> > -     drm_mode_config_cleanup(ddev);
> >   }
> >
> >   static __maybe_unused int drv_suspend(struct device *dev)
> >
>
> Thank you for your patch,
> For this stm part,
> Acked-by: Philippe Cornu <philippe.cornu@st.com>
>
> note: we will handle devm_kzalloc() asap, thanks.

Note that as-is you can't just blindly switch devm_kzalloc over to
drmm_kzalloc for the structures containing a drm_* object, or you'll
just replace one type of use-after free with another one (and probably
worse, since the new one will hit you on normal driver unload too).
There's a bit more work needed in this area, this here is just the
first steps and a heads up. And removing the devm_kzalloc would result
in lots of code added for a bunch of kfree() all over, not so great
option either.

I'd say wait for the next round :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
