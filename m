Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D56544AE057
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 19:09:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C745310E79A;
	Tue,  8 Feb 2022 18:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E2D10E893
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 18:09:11 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 5c4c73a6-890a-11ec-b20b-0050568c148b;
 Tue, 08 Feb 2022 18:10:13 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 0DD9A194B43;
 Tue,  8 Feb 2022 19:09:08 +0100 (CET)
Date: Tue, 8 Feb 2022 19:09:05 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Claudio Suarez <cssk@net-c.es>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 06/21] fbcon: delete delayed loading code
Message-ID: <YgKxwfjhL00hfdNk@ravnborg.org>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-7-daniel.vetter@ffwll.ch>
 <Yfw+6VUOX6xcf664@ravnborg.org>
 <YgJzQboE3VVj6OL7@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgJzQboE3VVj6OL7@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Tue, Feb 08, 2022 at 02:42:25PM +0100, Daniel Vetter wrote:
> On Thu, Feb 03, 2022 at 09:45:29PM +0100, Sam Ravnborg wrote:
> > Hi Daniel,
> > 
> > On Mon, Jan 31, 2022 at 10:05:37PM +0100, Daniel Vetter wrote:
> > > Before
> > > 
> > > commit 6104c37094e729f3d4ce65797002112735d49cd1
> > > Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Date:   Tue Aug 1 17:32:07 2017 +0200
> > > 
> > >     fbcon: Make fbcon a built-time depency for fbdev
> > > 
> > > it was possible to load fbcon and fbdev drivers in any order, which
> > > means that fbcon init had to handle the case where fbdev drivers where
> > > already registered.
> > > 
> > > This is no longer possible, hence delete that code.
> > > 
> > > Note that the exit case is a bit more complex and will be done in a
> > > separate patch.
> > > 
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Helge Deller <deller@gmx.de>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Claudio Suarez <cssk@net-c.es>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> > > Cc: Du Cheng <ducheng2@gmail.com>
> > > ---
> > >  drivers/video/fbdev/core/fbcon.c | 13 +------------
> > >  1 file changed, 1 insertion(+), 12 deletions(-)
> > > 
> > > diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> > > index 8f971de35885..814b648e8f09 100644
> > > --- a/drivers/video/fbdev/core/fbcon.c
> > > +++ b/drivers/video/fbdev/core/fbcon.c
> > > @@ -942,7 +942,7 @@ static const char *fbcon_startup(void)
> > >  		return display_desc;
> > >  	/*
> > >  	 * Instead of blindly using registered_fb[0], we use info_idx, set by
> > > -	 * fb_console_init();
> > > +	 * fbcon_fb_registered();
> > >  	 */
> > This comment change looks like it does not belong in this patch.
> > Also, the comment is wrong as info_idx is set in several places.
> > Like set_con2fb_map(), fbcon_remap_all(), and more.
> 
> Yeah I can split this out into a separate patch, but I spotted this wrong
> comment as part of reviewing this code change here - essentially you have
> to check how fb_info for fbcon are registered and fbcon init happens to
> validate that deleting the below code is correct.
> 
> Ok if I put this explainer into the commit message, or do you want me to
> split this out fully?
Keep it and add my a-b

	Sam
