Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAF33A8203
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 16:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550CC6E329;
	Tue, 15 Jun 2021 14:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3195C6E30D;
 Tue, 15 Jun 2021 14:11:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A72961450;
 Tue, 15 Jun 2021 14:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1623766293;
 bh=mVFIHg+/59exqXTM1KsGORgctLZycuRDb46GunrOss4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p3YAI+T/7vqnOYp3tofopk6vP5xyH0NRN9Cu04rKsrmQ5KrPQK42vmaw4BaWioU78
 DdF/hYIUl9LJ7p3NnVo0pStw3Lw3w6LBEGUqx3Z626GziDs4kbB/OxuXgjreES15Nn
 H/hnHEj49etmMWdabnoVvR5/SWIww+gahOYZbb9o=
Date: Tue, 15 Jun 2021 16:11:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 07/10] vfio/mdev: Allow the mdev_parent_ops to specify
 the device driver to bind
Message-ID: <YMi1EcrhatlaH4AX@kroah.com>
References: <20210615133519.754763-1-hch@lst.de>
 <20210615133519.754763-8-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615133519.754763-8-hch@lst.de>
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

On Tue, Jun 15, 2021 at 03:35:16PM +0200, Christoph Hellwig wrote:
> From: Jason Gunthorpe <jgg@nvidia.com>
> 
> This allows a mdev driver to opt out of using vfio_mdev.c, instead the
> driver will provide a 'struct mdev_driver' and register directly with the
> driver core.
> 
> Much of mdev_parent_ops becomes unused in this mode:
> - create()/remove() are done via the mdev_driver probe()/remove()
> - mdev_attr_groups becomes mdev_driver driver.dev_groups
> - Wrapper function callbacks are replaced with the same ones from
>   struct vfio_device_ops
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Messy, but ok...

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
