Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD61AEA974
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 00:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D147B10E2F3;
	Thu, 26 Jun 2025 22:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 962 seconds by postgrey-1.36 at gabe;
 Thu, 26 Jun 2025 22:15:40 UTC
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi
 [62.142.5.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4FD10E2F3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 22:15:40 +0000 (UTC)
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
 by fgw20.mail.saunalahti.fi (Halon) with ESMTP
 id d64cf432-52d8-11f0-a011-005056bd6ce9;
 Fri, 27 Jun 2025 00:59:31 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 27 Jun 2025 00:59:30 +0300
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Abdun Nihaal <abdun.nihaal@gmail.com>, andy@kernel.org,
 gregkh@linuxfoundation.org, lorenzo.stoakes@oracle.com,
 tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
 notro@tronnes.org, thomas.petazzoni@free-electrons.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix potential memory leak in
 fbtft_framebuffer_alloc()
Message-ID: <aF3CwnHyW5HHzDSG@surfacebook.localdomain>
References: <20250626172412.18355-1-abdun.nihaal@gmail.com>
 <aF2Ic8BP0zWS6R19@smile.fi.intel.com>
 <0327da98-8a7c-4db8-8bcd-4179b87a9486@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0327da98-8a7c-4db8-8bcd-4179b87a9486@suswa.mountain>
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

Thu, Jun 26, 2025 at 11:11:39PM +0300, Dan Carpenter kirjoitti:
> On Thu, Jun 26, 2025 at 08:50:43PM +0300, Andy Shevchenko wrote:
> > On Thu, Jun 26, 2025 at 10:54:10PM +0530, Abdun Nihaal wrote:

...

> > >  release_framebuf:
> > > +	fb_deferred_io_cleanup(info);
> > >  	framebuffer_release(info);
> > 
> > While the fix sounds good, there are still problems in the driver in this area:
> > 
> > 1) managed resources allocation is mixed up with plain allocations
> > (as you discovery hints);
> > 
> > 2) the order in fbtft_framebuffer_release() is asymmetrical to what
> > we have in fbtft_framebuffer_alloc().
> > 
> > I would recommend to study this code a bit more and provide the following
> > patches as a result:
> > 
> > 1) fixing the order in fbtft_framebuffer_release();
> > 
> > 2) moving vmem allocation closer to when it's needed, i.e. just after
> > successful allocation of the info; at the same time move txbuf allocation
> > from managed to unmanaged (drop devm, add respective kfree() calls where
> > it's required);
> 
> Symetrical in this sense means that the cleanup in
> fbtft_framebuffer_release() and in fbtft_framebuffer_alloc() are
> similar:
> 
> 	fb_deferred_io_cleanup();
> 	vfree();
>  	framebuffer_release();
> 
> I feel like number 1 and 2 are sort of opposite approaches to making the
> order symmetrical.  #1 is changing fbtft_framebuffer_release() and #2 is
> changing fbtft_framebuffer_alloc().  #2 is the less awkward approach.
> 
> > 3) this patch.
> > 
> > All three should have the respective Fixes tags and hence may be backported.
> 
> Changing the order isn't a bug fix so it wouldn't get a Fixes tag.
> I agree with Andy that the code isn't beautiful.  But I think it's
> easier to just fix the bug, and do the cleanup later as an optional
> patch 2/2.  I would also have been fine with a larger patch that does
> the cleanup and the bug fix in one patch but I think other people
> won't like that.

Ah, you have a point. Yes, the moving vmem allocation will solve the ordering
issue.

-- 
With Best Regards,
Andy Shevchenko


