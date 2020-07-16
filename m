Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F842222CA1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 22:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E01B6ECDB;
	Thu, 16 Jul 2020 20:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1C46ECDB
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 20:19:30 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 1D3A520039;
 Thu, 16 Jul 2020 22:19:28 +0200 (CEST)
Date: Thu, 16 Jul 2020 22:19:26 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Suraj Upadhyay <usuraj35@gmail.com>
Subject: Re: [PATCH 0/4] drm: core: Convert logging to drm_* functions.
Message-ID: <20200716201926.GE2254583@ravnborg.org>
References: <cover.1594136880.git.usuraj35@gmail.com>
 <20200710175643.GF17565@ravnborg.org>
 <20200711151126.GA12262@blackclown>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200711151126.GA12262@blackclown>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=M7-yi6CMk_IXB4dErxsA:9
 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Suraj.

On Sat, Jul 11, 2020 at 08:41:26PM +0530, Suraj Upadhyay wrote:
> On Fri, Jul 10, 2020 at 07:56:43PM +0200, Sam Ravnborg wrote:
> > Hi Suraj.
> > 
> > On Tue, Jul 07, 2020 at 10:04:14PM +0530, Suraj Upadhyay wrote:
> > > 
> > > This patchset converts logging to drm_* functions in drm core.
> > > 
> > > The following functions have been converted to their respective
> > > DRM alternatives :
> > > dev_info()      --> drm_info()
> > > dev_err()       --> drm_err()
> > > dev_warn()      --> drm_warn()
> > > dev_err_once()  --> drm_err_once().
> > 
> > I would prefer that DRM_* logging in the same files are converted in the
> > same patch. So we have one logging conversion patch for each file you
> > touches and that we do not need to re-vist the files later to change
> > another set of logging functions.
> 
> Agreed.
> 
> > If possible WARN_* should also be converted to drm_WARN_*
> > If patch is too large, then split them up but again lets have all
> > logging updated when we touch a file.
> > 
> > Care to take a look at this approach?
> >
> 
> Hii,
> 	The problem with WARN_* macros is that they are used without any
> drm device context. For example [this use here](https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/drm_edid.c#n1667) in drm_edid.c,
> doesn't have a drm device context and only has one argument (namely !raw_edid).
> There are many more such use cases.
> 
> And also there were cases where dev_* logging functions didn't have any
> drm_device context.
> 
> I would be very glad, if we came up with a possible solution to this
> problem. I think we should develop drm_* logging APIs which could print
> contextless logs (which would possibly be midlyering) or give every situation a context.

This was discussed in the past.
For now the focus is migrating existing logging to the new drm_ based
logging. Preferably using coccinelle.
when we are more or less covered there we can discuss if we will add
more logging functions.

> 
> > Also please consider if coccinelle can make this job easier.
> > There is a lot of files...
> 
> I totally agree with you. I will remember this next time.
> 
> But here, in this patchset I have tried to convert all possible
> cases of conversion, i.e. I have changed logging wherever there was a
> drm_device context.

Please note this in the changelog when you resend.
I delete your original patches so they are gone now from my mail-box.
Yeah, could dig them up somewhere, but it is easier to let you resend
them and then we can have an updated changelog too.

	Sam

> 
> Thanks.
> 
> > 	Sam
> > 
> > > 
> > > Suraj Upadhyay (4):
> > >   drm: mipi-dsi: Convert logging to drm_* functions.
> > >   drm: mipi-dbi: Convert logging to drm_* functions.
> > >   drm: edid: Convert logging to drm_* functions.
> > >   drm: fb-helper: Convert logging to drm_* functions.
> > > 
> > >  drivers/gpu/drm/drm_edid.c      |  7 +++----
> > >  drivers/gpu/drm/drm_fb_helper.c |  2 +-
> > >  drivers/gpu/drm/drm_mipi_dbi.c  |  4 ++--
> > >  drivers/gpu/drm/drm_mipi_dsi.c  | 15 +++++++--------
> > >  4 files changed, 13 insertions(+), 15 deletions(-)
> > > 
> > > -- 
> > > 2.17.1
> > > 
> > > 
> > 
> > 
> > 
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > 



> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
