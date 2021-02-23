Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C901322E2E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 17:00:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388B16E9C8;
	Tue, 23 Feb 2021 16:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by gabe.freedesktop.org (Postfix) with SMTP id 537D16E9E1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 16:00:55 +0000 (UTC)
Received: (qmail 1264176 invoked by uid 1000); 23 Feb 2021 11:00:54 -0500
Date: Tue, 23 Feb 2021 11:00:54 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3] drm: Use USB controller's DMA mask when importing
 dmabufs
Message-ID: <20210223160054.GC1261797@rowland.harvard.edu>
References: <20210223105842.27011-1-tzimmermann@suse.de>
 <s5hh7m2vqyd.wl-tiwai@suse.de>
 <f4452070-bab1-35ad-69aa-d020a4a3a5b7@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f4452070-bab1-35ad-69aa-d020a4a3a5b7@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 gregkh@linuxfoundation.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Oliver Neukum <oneukum@suse.com>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com, airlied@linux.ie,
 stable@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, sean@poorly.run,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 23, 2021 at 03:06:07PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 23.02.21 um 14:44 schrieb Takashi Iwai:

> > Aside from the discussion whether this "workaround" is needed, the use
> > of udev->bus->controller here looks a bit suspicious.  As the old USB
> > code (before the commit 6eb0233ec2d0) indicated, it was rather
> > usb->bus->sysdev that was used for the DMA mask, and it's also the one
> > most of USB core code refers to.  A similar question came up while
> > fixing the same kind of bug in the media subsystem, and we concluded
> > that bus->sysdev is a better choice.
> 
> Good to hear that we're not the only ones affected by this. Wrt the original
> code, using sysdev makes even more sense.

Hmmm, I had forgotten about this.  So DMA masks aren't inherited after 
all, thanks to commit 6eb0233ec2d0.  That leas me to wonder how well 
usb-storage is really working these days...

The impression I get is that Greg would like the USB core to export a 
function which takes struct usb_interface * as argument and returns the 
appropriate DMA mask value.  Then instead of messing around with USB 
internals, drm_gem_prime_import_usb could just call this new function.

Adding such a utility function would be a sufficiently small change that 
it could go into the -stable kernels with no trouble.

Alan Stern
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
