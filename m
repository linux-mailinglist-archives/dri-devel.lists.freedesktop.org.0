Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 985FC1CDCA3
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 16:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E3F6E2B1;
	Mon, 11 May 2020 14:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 8731 seconds by postgrey-1.36 at gabe;
 Mon, 11 May 2020 14:08:42 UTC
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [IPv6:2a01:37:3000::53df:4ef0:0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F486E2B1;
 Mon, 11 May 2020 14:08:42 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
 by bmailout2.hostsharing.net (Postfix) with ESMTPS id E85682800932A;
 Mon, 11 May 2020 16:08:40 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 93056ACC2; Mon, 11 May 2020 16:08:40 +0200 (CEST)
Date: Mon, 11 May 2020 16:08:40 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/6] RFC Support hot device unplug in amdgpu
Message-ID: <20200511140840.kd2yacwvyuaqkxkk@wunner.de>
References: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
 <20200511095433.GA206103@phenom.ffwll.local>
 <20200511114307.jfirnlvkikmulyhu@wunner.de>
 <CAKMK7uGA7XHPwuS3GF9u+YQ-GRBfZzf5CCRH15Tx_qnH3Pcchw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGA7XHPwuS3GF9u+YQ-GRBfZzf5CCRH15Tx_qnH3Pcchw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 11, 2020 at 02:21:57PM +0200, Daniel Vetter wrote:
> On Mon, May 11, 2020 at 1:43 PM Lukas Wunner <lukas@wunner.de> wrote:
> > On Mon, May 11, 2020 at 11:54:33AM +0200, Daniel Vetter wrote:
> > > - One unfortunate thing with drm_dev_unplug is that the driver core is
> > >   very opinionated and doesn't tell you whether it's a hotunplug or a
> > >   driver unload. In the former case trying to shut down hw just wastes
> > >   time (and might hit driver bugs), in the latter case driver engineers
> > >   very much expect everything to be shut down.
> > 
> > You can get that information at the PCI bus level with
> > pci_dev_is_disconnected().
> 
> Ok, so at least for pci devices you could do something like
> 
> if (pci_dev_is_disconnected())
>     drm_dev_unplug();
> else
>     drm_dev_unregister();
>
> In the ->remove callback and both users and developers should be
> happy.

Basically yes.  But if the driver is unbound e.g. via sysfs and the
device is hot-removed while it is being unbound, that approach fails.

So you'll need checks for pci_dev_is_disconnected() further below in
the call stack as well to avoid unpleasant side effects such as unduly
delaying unbinding or ending up in infinite loops when reading "all ones"
from PCI BARs, etc.

It may also be worth checking for pci_dev_is_disconnected() in ioctls
as well and directly returning -ENODEV, though of course that suffers
from the same race.  (The device may disappear after the check for
pci_dev_is_disconnected(), or it may have already disappeared but
pciehp hasn't updated the device's channel state yet.)

Thanks,

Lukas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
