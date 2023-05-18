Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB5470845C
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 16:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333B710E0A6;
	Thu, 18 May 2023 14:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by gabe.freedesktop.org (Postfix) with SMTP id 70D7A10E0A6
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 14:56:18 +0000 (UTC)
Received: (qmail 916250 invoked by uid 1000); 18 May 2023 10:56:17 -0400
Date: Thu, 18 May 2023 10:56:17 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Helge Deller <deller@gmx.de>
Subject: Re: [syzbot] [fbdev?] [usb?] WARNING in
 dlfb_submit_urb/usb_submit_urb (2)
Message-ID: <2905a85f-4a3b-4a4f-b8fb-a4d037d6c591@rowland.harvard.edu>
References: <0000000000004a222005fbf00461@google.com> <ZGXVANMhn5j/jObU@ls3530>
 <4cd17511-2b60-4c37-baf3-c477cf6d1761@rowland.harvard.edu>
 <be824fbc-cde4-9a2a-8fb4-1ca23f498dca@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be824fbc-cde4-9a2a-8fb4-1ca23f498dca@gmx.de>
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
Cc: linux-fbdev@vger.kernel.org,
 syzbot <syzbot+0e22d63dcebb802b9bc8@syzkaller.appspotmail.com>,
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 bernie@plugable.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 18, 2023 at 04:16:33PM +0200, Helge Deller wrote:
> On 5/18/23 15:54, Alan Stern wrote:
> > On Thu, May 18, 2023 at 09:34:24AM +0200, Helge Deller wrote:
> > > I think this is an informational warning from the USB stack,
> > 
> > It is not informational.  It is a warning that the caller has a bug.
> 
> I'm not a USB expert, so I searched for such bug reports, and it seems
> people sometimes faced this warning with different USB devices.

Yes.

> > You can't fix a bug by changing the line that reports it from dev_WARN
> > to printk!
> 
> Of course this patch wasn't intended as "fix".
> It was intended to see how the udlfb driver behaves in this situation, e.g.
> if the driver then crashes afterwards.
> 
> Furthermore, why does usb_submit_urb() prints this WARNING and then continues?
> If it's a real bug, why doesn't it returns an error instead?
> So, in principle I still think this warning is kind of informational,
> which of course points to some kind of problem which should be fixed.

Depending on the situation, the bug may or may not lead to an error.  At 
the time the dev_WARN was added, we were less careful about these sorts 
of checks; I did not want to cause previously working devices to stop 
working by failing the URB submission.

> > In this case it looks like dlfb_usb_probe() or one of the routines it
> > calls is wrong; it assumes that an endpoint has the expected type
> > without checking.  More precisely, it thinks an endpoint is BULK when
> > actually it is INTERRUPT.  That's what needs to be fixed.
> 
> Maybe usb_submit_urb() should return an error so that drivers can
> react on it, instead of adding the same kind of checks to all drivers?

Feel free to submit a patch doing this.  But the checks should be added 
in any case; without them the drivers are simply wrong.

Alan Stern
