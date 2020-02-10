Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E140157D18
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 15:11:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049F96EC47;
	Mon, 10 Feb 2020 14:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9856E9A3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 14:11:19 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id m25so7677585ioo.8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 06:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FX0VcA61hup+M1eG33dRqyta/5/xteIuWl8koiSPDi4=;
 b=G4uXB900exoea2ii7+OFpaGuRK0OPIwrn5b/qyL1D2Q9SXUY52mV/GbNkHjMPnchAM
 ph7SyUwqgpei3jx8lD4a2qYiY8mhLmqs3rciAPdjTSxjBZSlhSwL+K5ny5rILoVPrv3K
 J48MqqhzBHWtUo3Y0ytkyzGLqroOVBCzNr/sxerxfodFVtmee1wXpdhLvt3EBdk3LnPN
 3WT9oeSCayoMbkTRIdriomu+/UmKLxQ5ZKy7yrZbimr7zSx9r6ju33sS2XOZyJiYvUUs
 oP2DGX5M3gjG49im59BCr2dlcbr00eT7960geinWms86EIHtLSGo6OUV128LQvBM4LRW
 S1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FX0VcA61hup+M1eG33dRqyta/5/xteIuWl8koiSPDi4=;
 b=ON+uOZ3NDrHJKFrgBXr7wvxjhj8duNCY7kM6zPTKZNG8ypMsXYLpLYCuH/6pQ249sA
 YacjAP8auYbgr/jzq8oqzG6J9xKLNr+M8Yzhxg9jqbj6qwY5JdfdPN5+eWl9Zg5I3B5A
 VmgzRkMVBZ5G3gFsMLnX0pKWbbj8q5N1qYbxxhFiKUPKErGZuyVsIsUDgSgMSPw1645J
 c1GcAPRFhmeQT3VCUToMqiUMiPWJ4vm4WD6LL+oAgofWH2Pi6lTsuFQAS/AYSxqq5RRV
 ZFtkrRPm2endfddRLxathLGNBXoF8yfdYs/FX+A3m41Oay5k2VYTu/AZDyBmPFa0LfKg
 3VwQ==
X-Gm-Message-State: APjAAAWCTSo3w0aD+dIzpO9DEWcWPBIWzNEg8H0Bt9mNufxb5pKl6A9/
 YblKztspRpoXNboVX5xFJn6tw5vlSaJTyUD22Qgn/w==
X-Google-Smtp-Source: APXvYqwvxGWSdp4d4hKFIroc+x/DYVtfIyyldKkT3VpcOseZggDqKWwOctEN63TfW1gHDPo2n3ZDqZMJVhAWtbOk4dE=
X-Received: by 2002:a6b:f206:: with SMTP id q6mr9531130ioh.264.1581343878489; 
 Mon, 10 Feb 2020 06:11:18 -0800 (PST)
MIME-Version: 1.0
References: <20200206140140.GA18465@art_vandelay>
 <20200207152348.1.Ie0633018fc787dda6e869cae23df76ae30f2a686@changeid>
 <1581064499.590.0.camel@mtksdaap41> <1581303187.951.2.camel@mtksdaap41>
In-Reply-To: <1581303187.951.2.camel@mtksdaap41>
From: Sean Paul <sean@poorly.run>
Date: Mon, 10 Feb 2020 09:10:42 -0500
Message-ID: <CAMavQKLqr=a=WZKFfC2sEBcskjX+k-82a3V3XVk7LQLzpAMaBg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Find the cursor plane instead of hard
 coding it
To: CK Hu <ck.hu@mediatek.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Evan Benn <evanbenn@chromium.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 9, 2020 at 9:53 PM CK Hu <ck.hu@mediatek.com> wrote:
>
> Hi, Evan:
>
> On Fri, 2020-02-07 at 16:34 +0800, CK Hu wrote:
> > Hi, Evan:
> >
> > On Fri, 2020-02-07 at 15:23 +1100, Evan Benn wrote:
> > > The cursor and primary planes were hard coded.
> > > Now search for them for passing to drm_crtc_init_with_planes
> > >
> >
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
>
> Applied to mediatek-drm-fixes-5.6 [1], thanks.
>

Hi CK,
Thanks for picking this up. Before you send the pull, could you please
reverse the order of these 2 patches? Evan's should come before mine
to prevent a regression.

Sean

> [1]
> https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-fixes-5.6
>
> Regards,
> CK
>
> >
> > > Signed-off-by: Evan Benn <evanbenn@chromium.org>
> > > ---
> > >
> > >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 18 ++++++++++++------
> > >  1 file changed, 12 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > index 7b392d6c71cc..935652990afa 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > @@ -658,10 +658,18 @@ static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
> > >
> > >  static int mtk_drm_crtc_init(struct drm_device *drm,
> > >                          struct mtk_drm_crtc *mtk_crtc,
> > > -                        struct drm_plane *primary,
> > > -                        struct drm_plane *cursor, unsigned int pipe)
> > > +                        unsigned int pipe)
> > >  {
> > > -   int ret;
> > > +   struct drm_plane *primary = NULL;
> > > +   struct drm_plane *cursor = NULL;
> > > +   int i, ret;
> > > +
> > > +   for (i = 0; i < mtk_crtc->layer_nr; i++) {
> > > +           if (mtk_crtc->planes[i].type == DRM_PLANE_TYPE_PRIMARY)
> > > +                   primary = &mtk_crtc->planes[i];
> > > +           else if (mtk_crtc->planes[i].type == DRM_PLANE_TYPE_CURSOR)
> > > +                   cursor = &mtk_crtc->planes[i];
> > > +   }
> > >
> > >     ret = drm_crtc_init_with_planes(drm, &mtk_crtc->base, primary, cursor,
> > >                                     &mtk_crtc_funcs, NULL);
> > > @@ -830,9 +838,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
> > >                     return ret;
> > >     }
> > >
> > > -   ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, &mtk_crtc->planes[0],
> > > -                           mtk_crtc->layer_nr > 1 ? &mtk_crtc->planes[1] :
> > > -                           NULL, pipe);
> > > +   ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, pipe);
> > >     if (ret < 0)
> > >             return ret;
> > >
> >
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
