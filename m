Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AF44C91C1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 18:37:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD3210E759;
	Tue,  1 Mar 2022 17:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A029210E669;
 Tue,  1 Mar 2022 17:37:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 531B4B81BE7;
 Tue,  1 Mar 2022 17:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 071ADC340EE;
 Tue,  1 Mar 2022 17:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1646156241;
 bh=pTV2MFZ+7d07p5uTbhq3otIc2cmXwQTMtR9OmiTt6ws=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kpCJZz+2kmNYzjHFDfNSN8QomXtdcPSo3VhSYDe/9DvnLjw6+Gf8JZk1Z8B7/MpEr
 7jyq5w6VtMe9h/eDSvv1UXjGNGEtGZwH42GPuJGwpwQgnv9I5iH7DWZlof3+dZGTFm
 esB5bRgUOyJTALvSP9KXHdoyU5cCbTmKTmS3YsdQ=
Date: Tue, 1 Mar 2022 18:37:16 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jakob Koschel <jakobkoschel@gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Message-ID: <Yh5ZzNQQQE8rIexy@kroah.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <Yhyv42ONIxTj04mg@kroah.com>
 <79FCD5F4-0EBA-4E3F-8B3F-D450BBA10367@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79FCD5F4-0EBA-4E3F-8B3F-D450BBA10367@gmail.com>
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
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx@lists.freedesktop.org, samba-technical@lists.samba.org,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, linux-cifs@vger.kernel.org,
 kvm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>,
 Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
 kgdb-bugreport@lists.sourceforge.net, bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-fsdevel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
 linux-block@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 28, 2022 at 01:06:57PM +0100, Jakob Koschel wrote:
> 
> 
> > On 28. Feb 2022, at 12:20, Greg KH <gregkh@linuxfoundation.org> wrote:
> > 
> > On Mon, Feb 28, 2022 at 12:08:18PM +0100, Jakob Koschel wrote:
> >> If the list does not contain the expected element, the value of
> >> list_for_each_entry() iterator will not point to a valid structure.
> >> To avoid type confusion in such case, the list iterator
> >> scope will be limited to list_for_each_entry() loop.
> >> 
> >> In preparation to limiting scope of a list iterator to the list traversal
> >> loop, use a dedicated pointer to point to the found element.
> >> Determining if an element was found is then simply checking if
> >> the pointer is != NULL.
> >> 
> >> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
> >> ---
> >> arch/x86/kernel/cpu/sgx/encl.c       |  6 +++--
> >> drivers/scsi/scsi_transport_sas.c    | 17 ++++++++-----
> >> drivers/thermal/thermal_core.c       | 38 ++++++++++++++++++----------
> >> drivers/usb/gadget/configfs.c        | 22 ++++++++++------
> >> drivers/usb/gadget/udc/max3420_udc.c | 11 +++++---
> >> drivers/usb/gadget/udc/tegra-xudc.c  | 11 +++++---
> >> drivers/usb/mtu3/mtu3_gadget.c       | 11 +++++---
> >> drivers/usb/musb/musb_gadget.c       | 11 +++++---
> >> drivers/vfio/mdev/mdev_core.c        | 11 +++++---
> >> 9 files changed, 88 insertions(+), 50 deletions(-)
> > 
> > The drivers/usb/ portion of this patch should be in patch 1/X, right?
> 
> I kept them separate since it's a slightly different case.
> Using 'ptr' instead of '&ptr->other_member'. Regardless, I'll split
> this commit up as you mentioned.
> 
> > 
> > Also, you will have to split these up per-subsystem so that the
> > different subsystem maintainers can take these in their trees.
> 
> Thanks for the feedback.
> To clarify I understand you correctly:
> I should do one patch set per-subsystem with every instance/(file?)
> fixed as a separate commit?

Yes, each file needs a different commit as they are usually all written
or maintained by different people.

As I said in my other response, if you need any help with this, just let
me know, I'm glad to help.

thanks,

greg k-h
