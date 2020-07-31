Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A7C233F43
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 08:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE8C6E9E0;
	Fri, 31 Jul 2020 06:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76D06E9E0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 06:43:09 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 0A55D20037;
 Fri, 31 Jul 2020 08:43:06 +0200 (CEST)
Date: Fri, 31 Jul 2020 08:43:05 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 03/49] drm/ttm: split the mm manager init code
Message-ID: <20200731064305.GA1549151@ravnborg.org>
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-4-airlied@gmail.com>
 <20200731054431.GA1544844@ravnborg.org>
 <CAPM=9txyaTd5H3bKvO1Uiz2WaoGWyxYQD0dGnV5HQukkZm8WBQ@mail.gmail.com>
 <CAPM=9tw13EY2-Aqbp8Q12k7EnM0s8PkBBdkvZWPQt4KB=b3PLw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPM=9tw13EY2-Aqbp8Q12k7EnM0s8PkBBdkvZWPQt4KB=b3PLw@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=7gkXJVJtAAAA:8 a=20KFwNOVAAAA:8
 a=gK0UBxmeBYltHQ4SpFsA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Roland Scheidegger <sroland@vmware.com>,
 "Koenig, Christian" <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 31, 2020 at 04:26:08PM +1000, Dave Airlie wrote:
> On Fri, 31 Jul 2020 at 15:51, Dave Airlie <airlied@gmail.com> wrote:
> >
> > On Fri, 31 Jul 2020 at 15:44, Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > Hi Dave.
> > >
> > > On Fri, Jul 31, 2020 at 02:04:34PM +1000, Dave Airlie wrote:
> > > > From: Dave Airlie <airlied@redhat.com>
> > > >
> > > > This will allow the driver to control the ordering here better.
> > > >
> > > > Eventually the old path will be removed.
> > > >
> > > > Signed-off-by: Dave Airlie <airlied@redhat.com>
> > > > ---
> > > >  drivers/gpu/drm/ttm/ttm_bo.c    | 34 +++++++++++++++++++--------------
> > > >  include/drm/ttm/ttm_bo_api.h    |  4 ++++
> > > >  include/drm/ttm/ttm_bo_driver.h |  6 ++++++
> > > >  3 files changed, 30 insertions(+), 14 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > index 041a0e73cd1b..a658fd584c6d 100644
> > > > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > @@ -1503,35 +1503,41 @@ int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
> > > >  }
> > > >  EXPORT_SYMBOL(ttm_bo_evict_mm);
> > > >
> > > > -int ttm_bo_init_mm(struct ttm_bo_device *bdev, unsigned type,
> > > > -                     unsigned long p_size)
> > > > +void ttm_bo_init_mm_base(struct ttm_bo_device *bdev,
> > > > +                      struct ttm_mem_type_manager *man,
> > > > +                      unsigned long p_size)
> > > >  {
> > >
> > > General comment for all the ttm/* changes.
> > > It would be very nice with some nice explanations for the exported
> > > functions, preferably in kernel-doc style.
> > > In case someone that are more or less clueless (like me) would like
> > > to understand how a function is to be used or maybe reviewing some
> > > random code.
> >
> > Good point, I just need to make sure I don't add anything for
> > something I remove later, but I should definitely add some for the new
> > interfaces.
> 
> The version in my git branch has docs for all the new apis now.
Thanks!

And now I am more or less oblieged to read/review the docs when you
submit v2 - yeah, more reviews.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
