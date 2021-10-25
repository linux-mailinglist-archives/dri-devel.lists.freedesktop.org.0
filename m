Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E059E43A617
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 23:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A996E1F6;
	Mon, 25 Oct 2021 21:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D566E1F6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 21:45:14 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id d907b8be-35dc-11ec-9c3f-0050568c148b;
 Mon, 25 Oct 2021 21:45:19 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 18709194B7E;
 Mon, 25 Oct 2021 23:45:11 +0200 (CEST)
Date: Mon, 25 Oct 2021 23:45:09 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: George Kennedy <george.kennedy@oracle.com>, Zheyu Ma <zheyuma97@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] video: fbdev: cirrusfb: check pixclock to avoid divide
 by zero
Message-ID: <YXclZQGFTr1NFjbc@ravnborg.org>
References: <1635188490-15082-1-git-send-email-george.kennedy@oracle.com>
 <YXcAbXJfg/jKCo5h@kroah.com>
 <0ddb1c19-64b0-4117-7a92-c3d2fcddfdcf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ddb1c19-64b0-4117-7a92-c3d2fcddfdcf@oracle.com>
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

Hi George,

On Mon, Oct 25, 2021 at 03:33:43PM -0400, George Kennedy wrote:
> 
> 
> On 10/25/2021 3:07 PM, Greg KH wrote:
> > On Mon, Oct 25, 2021 at 02:01:30PM -0500, George Kennedy wrote:
> > > Do a sanity check on pixclock value before using it as a divisor.
> > > 
> > > Syzkaller reported a divide error in cirrusfb_check_pixclock.
> > > 
> > > divide error: 0000 [#1] SMP KASAN PTI
> > > CPU: 0 PID: 14938 Comm: cirrusfb_test Not tainted 5.15.0-rc6 #1
> > > Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.11.0-2
> > > RIP: 0010:cirrusfb_check_var+0x6f1/0x1260
> > > 
> > > Call Trace:
> > >   fb_set_var+0x398/0xf90
> > >   do_fb_ioctl+0x4b8/0x6f0
> > >   fb_ioctl+0xeb/0x130
> > >   __x64_sys_ioctl+0x19d/0x220
> > >   do_syscall_64+0x3a/0x80
> > >   entry_SYSCALL_64_after_hwframe+0x44/0xae
> > > 
> > > Signed-off-by: George Kennedy <george.kennedy@oracle.com>
> > > ---
> > >   drivers/video/fbdev/cirrusfb.c | 3 +++
> > >   1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
> > > index 93802ab..099ddcb 100644
> > > --- a/drivers/video/fbdev/cirrusfb.c
> > > +++ b/drivers/video/fbdev/cirrusfb.c
> > > @@ -477,6 +477,9 @@ static int cirrusfb_check_pixclock(const struct fb_var_screeninfo *var,
> > >   	struct cirrusfb_info *cinfo = info->par;
> > >   	unsigned maxclockidx = var->bits_per_pixel >> 3;
> > > +	if (!var->pixclock)
> > > +		return -EINVAL;
> > Shouldn't you be checking further up the call chain where this got set
> > to 0?
> 
I recall we had a similar discussion when Zheyu Ma <zheyuma97@gmail.com>
added the same checks to at least 3 fbdev drivers.
The conclusion was that the check belongs in the individual check
functions - IIRC.

Maybe Zheyu or google can help find the original thread.

	Sam

