Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19475708995
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 22:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F8210E553;
	Thu, 18 May 2023 20:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by gabe.freedesktop.org (Postfix) with SMTP id 6414D10E553
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 20:35:09 +0000 (UTC)
Received: (qmail 17442 invoked by uid 1000); 18 May 2023 16:35:07 -0400
Date: Thu, 18 May 2023 16:35:07 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Helge Deller <deller@gmx.de>
Subject: Re: [syzbot] [fbdev?] [usb?] WARNING in
 dlfb_submit_urb/usb_submit_urb (2)
Message-ID: <c7b8e69a-cabe-4e17-a511-66179259d1d7@rowland.harvard.edu>
References: <0000000000004a222005fbf00461@google.com> <ZGXVANMhn5j/jObU@ls3530>
 <4cd17511-2b60-4c37-baf3-c477cf6d1761@rowland.harvard.edu>
 <be824fbc-cde4-9a2a-8fb4-1ca23f498dca@gmx.de>
 <2905a85f-4a3b-4a4f-b8fb-a4d037d6c591@rowland.harvard.edu>
 <ZGZ3JPLqxCxA2UB6@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZGZ3JPLqxCxA2UB6@ls3530>
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
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 18, 2023 at 09:06:12PM +0200, Helge Deller wrote:
> * Alan Stern <stern@rowland.harvard.edu>:
> > On Thu, May 18, 2023 at 04:16:33PM +0200, Helge Deller wrote:
> > > On 5/18/23 15:54, Alan Stern wrote:
> > > > In this case it looks like dlfb_usb_probe() or one of the routines it
> > > > calls is wrong; it assumes that an endpoint has the expected type
> > > > without checking.  More precisely, it thinks an endpoint is BULK when
> > > > actually it is INTERRUPT.  That's what needs to be fixed.
> > >
> > > Maybe usb_submit_urb() should return an error so that drivers can
> > > react on it, instead of adding the same kind of checks to all drivers?
> >
> > Feel free to submit a patch doing this.
> 
> As you wrote above, this may break other drivers too, so I'd leave that
> discussion & decision to the USB maintainers (like you).
> 
> > But the checks should be added
> > in any case; without them the drivers are simply wrong.
> 
> I pushed the hackish patch below through the syz tests which gives this log:
> (see https://syzkaller.appspot.com/text?tag=CrashLog&x=160b7509280000)
> [   77.559566][    T9] usb 1-1: Unable to get valid EDID from device/display
> [   77.587021][    T9] WARNING: BOGUS urb xfer, pipe 3 != type 1 (fix driver to choose correct endpoint)
> [   77.596448][    T9] usb 1-1: dlfb_urb_completion - nonzero write bulk status received: -115
> [   77.605308][    T9] usb 1-1: submit urb error: -22
> [   77.613225][    T9] udlfb: probe of 1-1:0.52 failed with error -22
> 
> So, basically there is no urgent fix needed for the dlfb fbdev driver,
> as it will gracefully fail as is (which is correct).
> 
> What do you suggest we should do with this syzkaller-bug ?
> I'd rate it as false-alarm, but it will continue to complain because of
> the dev_WARN() in urb.c

Let's try this patch instead.  It might contain a stupid error because I 
haven't even tried to compile it, but it ought to fix the real problem.

Alan Stern

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git a4422ff22142

Index: usb-devel/drivers/video/fbdev/udlfb.c
===================================================================
--- usb-devel.orig/drivers/video/fbdev/udlfb.c
+++ usb-devel/drivers/video/fbdev/udlfb.c
@@ -1652,7 +1652,7 @@ static int dlfb_usb_probe(struct usb_int
 	struct fb_info *info;
 	int retval;
 	struct usb_device *usbdev = interface_to_usbdev(intf);
-	struct usb_endpoint_descriptor *out;
+	static u8 out_ep[] = {1 + USB_DIR_OUT, 0};
 
 	/* usb initialization */
 	dlfb = kzalloc(sizeof(*dlfb), GFP_KERNEL);
@@ -1666,9 +1666,9 @@ static int dlfb_usb_probe(struct usb_int
 	dlfb->udev = usb_get_dev(usbdev);
 	usb_set_intfdata(intf, dlfb);
 
-	retval = usb_find_common_endpoints(intf->cur_altsetting, NULL, &out, NULL, NULL);
-	if (retval) {
-		dev_err(&intf->dev, "Device should have at lease 1 bulk endpoint!\n");
+	if (!usb_check_bulk_endpoints(intf, out_ep)) {
+		dev_err(&intf->dev, "Invalid DisplayLink device!\n");
+		retval = -EINVAL;
 		goto error;
 	}
 
