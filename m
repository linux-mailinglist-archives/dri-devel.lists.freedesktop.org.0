Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B101B277AD4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 22:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4ED56E4AB;
	Thu, 24 Sep 2020 20:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136676E4AB
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 20:54:40 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 6B97720079;
 Thu, 24 Sep 2020 22:54:37 +0200 (CEST)
Date: Thu, 24 Sep 2020 22:54:36 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Arnd Bergmann <arnd@arndb.de>, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "David S . Miller" <davem@davemloft.net>, hch@lst.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] fbdev: stop using compat_alloc_user_space
Message-ID: <20200924205436.GP1223313@ravnborg.org>
References: <20200918100812.1447443-1-arnd@arndb.de>
 <20200918124808.GD438822@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200918124808.GD438822@phenom.ffwll.local>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=CaYmGojl c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=25-AhOLfAAAA:8
 a=ocQuWhCnBm-ropBlqfgA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
 a=dnuY3_Gu-P7Vi9ynLKQe:22
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel/Arnd.

On Fri, Sep 18, 2020 at 02:48:08PM +0200, Daniel Vetter wrote:
> On Fri, Sep 18, 2020 at 12:08:10PM +0200, Arnd Bergmann wrote:
> > The fbdev code uses compat_alloc_user_space in a few of its
> > compat_ioctl handlers, which tends to be a bit more complicated
> > and error-prone than calling the underlying handlers directly,
> > so I would like to remove it completely.
> > 
> > This modifies two such functions in fbdev, and removes another
> > one that is completely unused.
> > 
> >     Arnd
> > 
> > Arnd Bergmann (3):
> >   fbdev: simplify fb_getput_cmap()
> >   fbdev: sbuslib: remove unused FBIOSCURSOR32 helper
> >   fbdev: sbuslib: remove compat_alloc_user_space usage
> 
> Looks all good, but we're also kinda looking for a new volunteer for
> handling fbdev patches ... drm-misc commit rights, still not interested?

Hi Daniel - I read the above as an a-b. And Arnd did not take the bait
it seems.

Hi Arnd. checkpatch complained about some whitespace, which I fixed
while applying.
Will push to drm-misc-next tomorrow unless I hear anything else.

	Sam


> -Daniel
> 
> > 
> >  drivers/video/fbdev/core/fbmem.c |  44 +++++------
> >  drivers/video/fbdev/sbuslib.c    | 124 ++++++++++++++++++-------------
> >  2 files changed, 90 insertions(+), 78 deletions(-)
> > 
> > -- 
> > 2.27.0
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
