Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EAF171747
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 13:34:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6593D6E8A3;
	Thu, 27 Feb 2020 12:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED096E8A3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 12:34:07 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 963092468E;
 Thu, 27 Feb 2020 12:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582806847;
 bh=ZSvdgyyAZrTI4ZZgTa8cz5o9//42i2OuAT24QC89tfY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sM4MR5or/iXdoFVY6P4lmM/QpukHyP262a8O90zsYSk55A2+QD2DPcraudRPA9NN+
 q8KsZl14+IdQThlu64zHCTHMKok4w7OA91HuP187j04ChdB09ogg0r9oVYdgB+OAOT
 nVKsLNfD9zp8NP1+xix8fqOrgaNvTyMBKEZR2cns=
Date: Thu, 27 Feb 2020 13:34:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wambui Karuga <wambui.karugax@gmail.com>
Subject: Re: [PATCH 02/21] drm: convert the drm_driver.debugfs_init() hook to
 return void.
Message-ID: <20200227123404.GA962932@kroah.com>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
 <20200227120232.19413-3-wambui.karugax@gmail.com>
 <20200227122313.GB896418@kroah.com>
 <alpine.LNX.2.21.99999.375.2002271528310.19554@wambui>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.21.99999.375.2002271528310.19554@wambui>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 27, 2020 at 03:29:46PM +0300, Wambui Karuga wrote:
> 
> 
> On Thu, 27 Feb 2020, Greg KH wrote:
> 
> > On Thu, Feb 27, 2020 at 03:02:13PM +0300, Wambui Karuga wrote:
> > > As a result of commit 987d65d01356 (drm: debugfs: make
> > > drm_debugfs_create_files() never fail) and changes to various debugfs
> > > functions in drm/core and across various drivers, there is no need for
> > > the drm_driver.debugfs_init() hook to have a return value. Therefore,
> > > declare it as void.
> > > 
> > > Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> > > ---
> > >  include/drm/drm_drv.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> > > index 97109df5beac..c6ae888c672b 100644
> > > --- a/include/drm/drm_drv.h
> > > +++ b/include/drm/drm_drv.h
> > > @@ -323,7 +323,7 @@ struct drm_driver {
> > >  	 *
> > >  	 * Allows drivers to create driver-specific debugfs files.
> > >  	 */
> > > -	int (*debugfs_init)(struct drm_minor *minor);
> > > +	void (*debugfs_init)(struct drm_minor *minor);
> > 
> > 
> > Doesn't this patch break the build, or at least, cause lots of build
> > warnings to happen?
> > 
> > Fixing it all up later is good, but I don't think you want to break
> > things at this point in the series.
> > 
> So, should it come last in the series? All functions that use this hook have
> been converted to void in the patchset.

I recommend fixing up the functions to just always return 0 first, and
then in one last patch, change the function itself to return void along
with this.

That would make it easiest to review, and allow no build warnings at any
point in the series, right?

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
