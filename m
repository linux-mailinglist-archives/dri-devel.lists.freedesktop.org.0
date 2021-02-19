Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D80831FC82
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 17:00:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5A36EB41;
	Fri, 19 Feb 2021 16:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Fri, 19 Feb 2021 16:00:09 UTC
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by gabe.freedesktop.org (Postfix) with SMTP id C7E826EB41
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 16:00:09 +0000 (UTC)
Received: (qmail 1112983 invoked by uid 1000); 19 Feb 2021 10:53:28 -0500
Date: Fri, 19 Feb 2021 10:53:28 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/prime: Only call dma_map_sgtable() for devices with
 DMA support
Message-ID: <20210219155328.GA1111829@rowland.harvard.edu>
References: <20210219134014.7775-1-tzimmermann@suse.de>
 <02a45c11-fc73-1e5a-3839-30b080950af8@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <02a45c11-fc73-1e5a-3839-30b080950af8@amd.com>
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

On Fri, Feb 19, 2021 at 02:45:54PM +0100, Christian K=F6nig wrote:
> Well as far as I can see this is a relative clear NAK.
> =

> When a device can't do DMA and has no DMA mask then why it is requesting =
an
> sg-table in the first place?

This may not be important for your discussion, but I'd like to give an =

answer to the question -- at least, for the case of USB.

A USB device cannot do DMA and has no DMA mask.  Nevertheless, if you =

want to send large amounts of bulk data to/from a USB device then using =

an SG table is often a good way to do it.  The reason is simple: All =

communication with a USB device has to go through a USB host controller, =

and many (though not all) host controllers _can_ do DMA and _do_ have a =

DMA mask.

The USB mass-storage and uas drivers in particular make heavy use of =

this mechanism.

Alan Stern
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
