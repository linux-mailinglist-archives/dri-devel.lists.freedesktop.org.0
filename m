Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE1031FD4E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 17:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D394D6E060;
	Fri, 19 Feb 2021 16:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by gabe.freedesktop.org (Postfix) with SMTP id A20F36E060
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 16:41:20 +0000 (UTC)
Received: (qmail 1115516 invoked by uid 1000); 19 Feb 2021 11:41:19 -0500
Date: Fri, 19 Feb 2021 11:41:19 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/prime: Only call dma_map_sgtable() for devices with
 DMA support
Message-ID: <20210219164119.GC1111829@rowland.harvard.edu>
References: <20210219134014.7775-1-tzimmermann@suse.de>
 <02a45c11-fc73-1e5a-3839-30b080950af8@amd.com>
 <20210219155328.GA1111829@rowland.harvard.edu>
 <d2d581fb-ccba-00c9-0a22-b485870256ae@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d2d581fb-ccba-00c9-0a22-b485870256ae@amd.com>
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
Cc: Felipe Balbi <balbi@kernel.org>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 gregkh@linuxfoundation.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Oliver Neukum <oneukum@suse.com>, Johan Hovold <johan@kernel.org>,
 Christoph Hellwig <hch@lst.de>, dri-devel@lists.freedesktop.org,
 "Ahmed S. Darwish" <a.darwish@linutronix.de>, stable@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 19, 2021 at 04:56:16PM +0100, Christian K=F6nig wrote:
> =

> =

> Am 19.02.21 um 16:53 schrieb Alan Stern:
> > On Fri, Feb 19, 2021 at 02:45:54PM +0100, Christian K=F6nig wrote:
> > > Well as far as I can see this is a relative clear NAK.
> > > =

> > > When a device can't do DMA and has no DMA mask then why it is request=
ing an
> > > sg-table in the first place?
> > This may not be important for your discussion, but I'd like to give an
> > answer to the question -- at least, for the case of USB.
> > =

> > A USB device cannot do DMA and has no DMA mask.  Nevertheless, if you
> > want to send large amounts of bulk data to/from a USB device then using
> > an SG table is often a good way to do it.  The reason is simple: All
> > communication with a USB device has to go through a USB host controller,
> > and many (though not all) host controllers _can_ do DMA and _do_ have a
> > DMA mask.
> > =

> > The USB mass-storage and uas drivers in particular make heavy use of
> > this mechanism.
> =

> Yeah, I was assuming something like that would work.
> =

> But in this case the USB device should give the host controllers device
> structure to the dma_buf_attach function so that the sg_table can be fill=
ed
> in with DMA addresses properly.

Indeed.  Although in the contexts I'm familiar with, the host controller =

device is actually passed to routines like dma_pool_create, =

dma_alloc_coherent, dma_map_sg, or dma_map_single.

Alan Stern
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
