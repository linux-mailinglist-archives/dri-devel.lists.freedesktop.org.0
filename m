Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C87265EAB09
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 17:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5493A10E4F8;
	Mon, 26 Sep 2022 15:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B76D410E6E2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 15:29:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBE931D14
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 08:29:47 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E33163F66F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 08:29:40 -0700 (PDT)
Date: Mon, 26 Sep 2022 16:29:27 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: Brian Starkey <brian.starkey@arm.com>
Subject: Re: [PATCH] drm/fourcc: Fix vsub/hsub for Q410 and Q401
Message-ID: <YzHFVxJ7wvUKoIgX@e110455-lin.cambridge.arm.com>
References: <YyA9Y+Cs8ZCYHXAT@intel.com>
 <20220913144306.17279-1-brian.starkey@arm.com>
 <YyCjmQUZGKP6e8H1@e110455-lin.cambridge.arm.com>
 <20220926152119.aycl2thery6dtwyo@000377403353>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220926152119.aycl2thery6dtwyo@000377403353>
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
Cc: jonas@kwiboo.se, airlied@linux.ie, butterflyhuangxx@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 George Kennedy <george.kennedy@oracle.com>, ben.davis@arm.com,
 tzimmermann@suse.de, nd@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 26, 2022 at 04:21:19PM +0100, Brian Starkey wrote:
> On Tue, Sep 13, 2022 at 04:36:57PM +0100, Liviu Dudau wrote:
> > On Tue, Sep 13, 2022 at 03:43:06PM +0100, Brian Starkey wrote:
> > > These formats are not subsampled, but that means hsub and vsub should be
> > > 1, not 0.
> > > 
> > > Fixes: 94b292b27734 ("drm: drm_fourcc: add NV15, Q410, Q401 YUV formats")
> > > Reported-by: George Kennedy <george.kennedy@oracle.com>
> > > Reported-by: butt3rflyh4ck <butterflyhuangxx@gmail.com>
> > > Signed-off-by: Brian Starkey <brian.starkey@arm.com>
> > 
> > Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> > 
> > Should this be backported into stable releases? How far back to we go?
> 
> Probably, git says 94b292b27734 is in since 5.10.
> 
> Could someone merge this so it doesn't get lost again?

I'll merge this into drm-misc-next-fixes this week and notify stable about it.

Best regards,
Liviu

> 
> Thanks,
> -Brian
> 
> > 
> > Best regards,
> > Liviu
> > 
> > 
> > > ---
> > >  drivers/gpu/drm/drm_fourcc.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > 
> > > Sorry, I lost track of this - I thought it got fixed after the previous
> > > thread[1].
> > > 
> > > -Brian
> > > 
> > > [1] https://lore.kernel.org/all/26fdb955-10c8-a5d6-07b6-85a4374e7754@oracle.com/
> > > 
> > > diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> > > index 07741b678798..6768b7d18b6f 100644
> > > --- a/drivers/gpu/drm/drm_fourcc.c
> > > +++ b/drivers/gpu/drm/drm_fourcc.c
> > > @@ -263,12 +263,12 @@ const struct drm_format_info *__drm_format_info(u32 format)
> > >  		  .vsub = 2, .is_yuv = true },
> > >  		{ .format = DRM_FORMAT_Q410,		.depth = 0,
> > >  		  .num_planes = 3, .char_per_block = { 2, 2, 2 },
> > > -		  .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 0,
> > > -		  .vsub = 0, .is_yuv = true },
> > > +		  .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 1,
> > > +		  .vsub = 1, .is_yuv = true },
> > >  		{ .format = DRM_FORMAT_Q401,		.depth = 0,
> > >  		  .num_planes = 3, .char_per_block = { 2, 2, 2 },
> > > -		  .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 0,
> > > -		  .vsub = 0, .is_yuv = true },
> > > +		  .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 1,
> > > +		  .vsub = 1, .is_yuv = true },
> > >  		{ .format = DRM_FORMAT_P030,            .depth = 0,  .num_planes = 2,
> > >  		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
> > >  		  .hsub = 2, .vsub = 2, .is_yuv = true},
> > > -- 
> > > 2.25.1
> > > 
> > 
> > -- 
> > ====================
> > | I would like to |
> > | fix the world,  |
> > | but they're not |
> > | giving me the   |
> >  \ source code!  /
> >   ---------------
> >     ¯\_(ツ)_/¯

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
