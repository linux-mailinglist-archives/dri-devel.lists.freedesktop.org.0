Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C51493A766E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 07:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382BD89C61;
	Tue, 15 Jun 2021 05:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF4D89C54;
 Tue, 15 Jun 2021 05:22:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 153BA613F5;
 Tue, 15 Jun 2021 05:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1623734521;
 bh=I39eG9DNQO5bFfL3wXseI58XyVG3Y8z2W0Y1TkWzgO4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ztK+clL6V3mIt2G9rcTU4SQmhwcUWWdJgQXJNfpGN/uX2Xm3l2XpnaJX/9VD1p64Y
 AdsF/nKGkKgDZbetOFE2tPfxUlK2OD8F3z075wFMJt2TC96YffNyeGoHzWWHS7oKg1
 gyrRenAWkr8N+pEUOqcGjE/GPZsQwhq+Cyi8QdFA=
Date: Tue, 15 Jun 2021 07:21:57 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: Allow mdev drivers to directly create the vfio_device (v2 /
 alternative)
Message-ID: <YMg49UF8of2yHWum@kroah.com>
References: <20210614150846.4111871-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210614150846.4111871-1-hch@lst.de>
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
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Jason Gunthorpe <jgg@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 14, 2021 at 05:08:36PM +0200, Christoph Hellwig wrote:
> This is my alternative take on this series from Jason:
> 
> https://lore.kernel.org/dri-devel/87czsszi9i.fsf@redhat.com/T/
> 
> The mdev/vfio parts are exactly the same, but this solves the driver core
> changes for the direct probing without the in/out flag that Greg hated,
> which cause a little more work, but probably make the result better.
> 
> Original decription from Jason below:
> 
> The mdev bus's core part for managing the lifecycle of devices is mostly
> as one would expect for a driver core bus subsystem.
> 
> However instead of having a normal 'struct device_driver' and binding the
> actual mdev drivers through the standard driver core mechanisms it open
> codes this with the struct mdev_parent_ops and provides a single driver
> that shims between the VFIO core's struct vfio_device and the actual
> device driver.
> 
> Instead, allow mdev drivers implement an actual struct mdev_driver and
> directly call vfio_register_group_dev() in the probe() function for the
> mdev. Arrange to bind the created mdev_device to the mdev_driver that is
> provided by the end driver.
> 
> The actual execution flow doesn't change much, eg what was
> parent_ops->create is now device_driver->probe and it is called at almost
> the exact same time - except under the normal control of the driver core.
> 
> Ultimately converting all the drivers unlocks a fair number of additional
> VFIO simplifications and cleanups.

This looks much better as far as the driver core changes go, thank you
for doing this.

I'm guessing there will be at least one more revision of this.  Do you
want this to go through my driver core tree or is there a mdev tree it
should go through?  Either is fine for me.

thanks,

greg k-h
