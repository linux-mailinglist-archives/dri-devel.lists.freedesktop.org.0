Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C58A322FA1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 18:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606A8895E1;
	Tue, 23 Feb 2021 17:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608C4895E1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 17:30:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B85C264E85;
 Tue, 23 Feb 2021 17:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1614101408;
 bh=0sov8GotWsBDdlLayNbjA2epe830T2G9FtT8QS8zYxs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UX492ZtzutLmQXcQymKcC+ZlGihNg9kUBARJmIwwfVTRXEuflcUwn/rpCL6vWAG8d
 rnt04Q6rCx8qCf5NsDLtGcY8i3eHPqVD3JGmm2w5F2cl84qYvRnmTCYV+LdpiddEnH
 BLFQAujOP0PZbTfpXu6XAsfMYWY6qd3GbFVnFmYk=
Date: Tue, 23 Feb 2021 18:30:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v3] drm: Use USB controller's DMA mask when importing
 dmabufs
Message-ID: <YDU7naIDtg5IM0Sz@kroah.com>
References: <20210223105842.27011-1-tzimmermann@suse.de>
 <s5hh7m2vqyd.wl-tiwai@suse.de>
 <f4452070-bab1-35ad-69aa-d020a4a3a5b7@suse.de>
 <20210223160054.GC1261797@rowland.harvard.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210223160054.GC1261797@rowland.harvard.edu>
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
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, hdegoede@redhat.com,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Oliver Neukum <oneukum@suse.com>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com, airlied@linux.ie,
 stable@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, sean@poorly.run,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 23, 2021 at 11:00:54AM -0500, Alan Stern wrote:
> On Tue, Feb 23, 2021 at 03:06:07PM +0100, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 23.02.21 um 14:44 schrieb Takashi Iwai:
> 
> > > Aside from the discussion whether this "workaround" is needed, the use
> > > of udev->bus->controller here looks a bit suspicious.  As the old USB
> > > code (before the commit 6eb0233ec2d0) indicated, it was rather
> > > usb->bus->sysdev that was used for the DMA mask, and it's also the one
> > > most of USB core code refers to.  A similar question came up while
> > > fixing the same kind of bug in the media subsystem, and we concluded
> > > that bus->sysdev is a better choice.
> > 
> > Good to hear that we're not the only ones affected by this. Wrt the original
> > code, using sysdev makes even more sense.
> 
> Hmmm, I had forgotten about this.  So DMA masks aren't inherited after 
> all, thanks to commit 6eb0233ec2d0.  That leas me to wonder how well 
> usb-storage is really working these days...
> 
> The impression I get is that Greg would like the USB core to export a 
> function which takes struct usb_interface * as argument and returns the 
> appropriate DMA mask value.  Then instead of messing around with USB 
> internals, drm_gem_prime_import_usb could just call this new function.
> 
> Adding such a utility function would be a sufficiently small change that 
> it could go into the -stable kernels with no trouble.

Yes, sorry for not being clear, that is what I think would make the most
sense, then all USB drivers could use it easily and it can be changed in
one location if the DMA logic ever changes.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
