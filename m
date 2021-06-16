Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4D63A92D2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 08:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B332C6E509;
	Wed, 16 Jun 2021 06:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0856E4F1;
 Wed, 16 Jun 2021 06:39:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3476061107;
 Wed, 16 Jun 2021 06:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1623825585;
 bh=EaiCM4M1HV/P3rmM6VEHDeHmAfCx+R4BQyVTxflK9Rs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=epaxgNqHuYyJv4EAYE7ldLg69Mxe1hHr3+3rsbNb30tg0BFhlw89SENvOIoieBf33
 HrKpn2jASbD8+ltQq/PkXuqainx2eVE7VIqE0yaDtRGv8wkEGBTI5LfsFDoT7cZ3tm
 FQktllr0bRzKCGZXXqa4iSepc5k04YuH8udl+DhY=
Date: Wed, 16 Jun 2021 08:39:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 07/10] vfio/mdev: Allow the mdev_parent_ops to specify
 the device driver to bind
Message-ID: <YMmcrbgzPByvQDrX@kroah.com>
References: <20210615133519.754763-1-hch@lst.de>
 <20210615133519.754763-8-hch@lst.de> <YMi1EcrhatlaH4AX@kroah.com>
 <20210616000040.GE1002214@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210616000040.GE1002214@nvidia.com>
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 intel-gfx@lists.freedesktop.org, Jason Herne <jjherne@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 15, 2021 at 09:00:40PM -0300, Jason Gunthorpe wrote:
> On Tue, Jun 15, 2021 at 04:11:29PM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Jun 15, 2021 at 03:35:16PM +0200, Christoph Hellwig wrote:
> > > From: Jason Gunthorpe <jgg@nvidia.com>
> > > 
> > > This allows a mdev driver to opt out of using vfio_mdev.c, instead the
> > > driver will provide a 'struct mdev_driver' and register directly with the
> > > driver core.
> > > 
> > > Much of mdev_parent_ops becomes unused in this mode:
> > > - create()/remove() are done via the mdev_driver probe()/remove()
> > > - mdev_attr_groups becomes mdev_driver driver.dev_groups
> > > - Wrapper function callbacks are replaced with the same ones from
> > >   struct vfio_device_ops
> > > 
> > > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > 
> > Messy, but ok...
> 
> Is there something you'd like to see changed, eg in later patches?
> This whole work still has another approx 30 patches to go and much of
> this ends up being erased once the drivers are all converted.

If this mostly gets removed in the end, I'm happy.  Let's see how it
looks after all of that is done.  This is going forward in the right
way, so I do not object to this at all.

thanks,

greg k-h
