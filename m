Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3467C25DC22
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 16:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DBE6EBA7;
	Fri,  4 Sep 2020 14:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7640C6EBA7;
 Fri,  4 Sep 2020 14:42:46 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 3437420021;
 Fri,  4 Sep 2020 16:42:43 +0200 (CEST)
Date: Fri, 4 Sep 2020 16:42:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 40/59] drm/arcpgu: Stop using drm_device->dev_private
Message-ID: <20200904144241.GA191471@ravnborg.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-41-daniel.vetter@ffwll.ch>
 <20200424164626.GD3822@ravnborg.org>
 <CAKMK7uGcNnFqcwAQMSOuvCeX==vbtbRNe88cgr-yeuWiFJaUcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGcNnFqcwAQMSOuvCeX==vbtbRNe88cgr-yeuWiFJaUcQ@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=CaYmGojl c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=QyXUC8HyAAAA:8 a=jIQo8A4GAAAA:8
 a=sJrRHs1v7V1mmhT5wxMA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Lf5xNeLK5dgiOs8hzIjU:22
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel.

On Fri, Sep 04, 2020 at 03:42:44PM +0200, Daniel Vetter wrote:
> On Fri, Apr 24, 2020 at 6:46 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Hi Daniel.
> >
> > On Wed, Apr 15, 2020 at 09:40:15AM +0200, Daniel Vetter wrote:
> > > Upcasting using a container_of macro is more typesafe, faster and
> > > easier for the compiler to optimize.
> > >
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Alexey Brodkin <abrodkin@synopsys.com>
> >
> > Subject: drm/arc: arcpgu: Stop using drm_device->dev_private
> >
> > And another bikeshedding below.
> > With this considered:
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> >
> > > ---
> > >  drivers/gpu/drm/arc/arcpgu.h      | 2 ++
> > >  drivers/gpu/drm/arc/arcpgu_crtc.c | 4 ++--
> > >  drivers/gpu/drm/arc/arcpgu_drv.c  | 4 +---
> > >  3 files changed, 5 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/arc/arcpgu.h b/drivers/gpu/drm/arc/arcpgu.h
> > > index cd9e932f501e..87821c91a00c 100644
> > > --- a/drivers/gpu/drm/arc/arcpgu.h
> > > +++ b/drivers/gpu/drm/arc/arcpgu.h
> > > @@ -17,6 +17,8 @@ struct arcpgu_drm_private {
> > >       struct drm_plane        *plane;
> > >  };
> > >
> > > +#define dev_to_arcpgu(x) container_of(x, struct arcpgu_drm_private, drm)
> > > +
> > Preferred name is to_arcgpu(). There is no device in the name of struct
> > arcpgu_drm_private. And the general consensus it to use to_<driver> for
> > the top-level struct.
> 
> [Sorry just realized I never replied on-list for this here]
> 
> drm_device very much has a dev_  and there's some other drivders with
> this pattern too. Plus I think it's more consistent with the other
> macros in here. For simple drivers where there's only 1 structure I
> agree though, so if you insist I can follow up with a patch. Fixing
> this in-series is imo too much trouble for the benefit, every single
> patch would need to be redone ...

The naming is my personal choice - others have different opinions.
And since we did not universially agree on dev_to_* versus to_* for the
main driver structure there is no need to adjust.

For me it is just that the main driver structure is more than a device
thingy and I like the short naming. But it seems you, Thomas + more
prefer dev_to_* so maybe I should adjust so we are a little more
aligned.

So it is considered so the patch is obviously:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
