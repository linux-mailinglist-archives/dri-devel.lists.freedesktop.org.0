Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3823A7662
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 07:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A30689BF0;
	Tue, 15 Jun 2021 05:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CDB89BF0;
 Tue, 15 Jun 2021 05:18:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E201613F5;
 Tue, 15 Jun 2021 05:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1623734299;
 bh=UwqM6muGBCJRYHhL48W9oK25DYg39c7HHC986x5IWY4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EUI8yOYAp6W5cgy7iXjxOF7pKpzn9F/sKymWLzbnB0wKS+oQdA9ylO+AXLItlY0Xp
 Hlpc32++O9Puc63Q4SA/YjzYJznvxPjcADR4z3jeDFvxJcwYIqQ83pV90Hpa0YgH0R
 sWMJ9rAzXD37AuKs6v1hy4wU+RTf6EhL1J4Tziik=
Date: Tue, 15 Jun 2021 07:18:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 03/10] driver core: Flow the return code from ->probe()
 through to sysfs bind
Message-ID: <YMg4F99j2nsjGxAz@kroah.com>
References: <20210614150846.4111871-1-hch@lst.de>
 <20210614150846.4111871-4-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210614150846.4111871-4-hch@lst.de>
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

On Mon, Jun 14, 2021 at 05:08:39PM +0200, Christoph Hellwig wrote:
> Currently really_probe() returns 1 on success and 0 if the probe() call
> fails. This return code arrangement is designed to be useful for
> __device_attach_driver() which is walking the device list and trying every
> driver. 0 means to keep trying.
> 
> However, it is not useful for the other places that call through to
> really_probe() that do actually want to see the probe() return code.
> 
> For instance bind_store() would be better to return the actual error code
> from the driver's probe method, not discarding it and returning -ENODEV.
> 
> Reorganize things so that really_probe() returns the error code from
> ->probe as a (inverted) positive number, and 0 for successful attach.
> 
> With this, __device_attach_driver can ignore the (positive) probe errors,
> return 1 to exit the loop for a successful binding and pass on the
> other negative errors, while device_driver_attach simplify inverts the
> positive errors and returns all errors to the sysfs code.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/base/bus.c |  6 +-----
>  drivers/base/dd.c  | 29 ++++++++++++++++++++---------
>  2 files changed, 21 insertions(+), 14 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
