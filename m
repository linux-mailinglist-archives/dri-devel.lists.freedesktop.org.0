Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 127FA3A765D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 07:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43EC889AA6;
	Tue, 15 Jun 2021 05:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E9F89AA6;
 Tue, 15 Jun 2021 05:17:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 52A4A6140C;
 Tue, 15 Jun 2021 05:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1623734267;
 bh=o5H3N+ttWbWHWjYPgpfy4o3PJQZNstkMmkd4t2exljM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dfVQlIxuSd9gn4cLpBWRc70JY9BVo+kBT3kLsMpn640l44DMJOp/FjwervZaIpAcv
 xAcvQdaEqyMEx85dY6PnCde9SRE0MVfPrcS5qBBdfb8TGIaT/RMFIeEu7Yat1tdv/O
 JlLnebQM+AZrIR4ysW8BHmz3OEKi7nb4wp2JtP0Q=
Date: Tue, 15 Jun 2021 07:17:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 02/10] driver core: Better distinguish probe errors in
 really_probe
Message-ID: <YMg39xWiesZzjVUr@kroah.com>
References: <20210614150846.4111871-1-hch@lst.de>
 <20210614150846.4111871-3-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210614150846.4111871-3-hch@lst.de>
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

On Mon, Jun 14, 2021 at 05:08:38PM +0200, Christoph Hellwig wrote:
> really_probe tries to special case errors from ->probe, but due to all
> other initialization added to the function over time now a lot of
> internal errors hit that code path as well.  Untangle that by adding
> a new probe_err local variable and apply the special casing only to
> that.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/base/dd.c | 72 +++++++++++++++++++++++++++--------------------
>  1 file changed, 41 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 7477d3322b3a..999bc737a8f0 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -513,12 +513,42 @@ static ssize_t state_synced_show(struct device *dev,
>  }
>  static DEVICE_ATTR_RO(state_synced);
>  
> +
> +static int call_driver_probe(struct device *dev, struct device_driver *drv)
> +{
> +	int ret = 0;
> +
> +	if (dev->bus->probe)
> +		ret = dev->bus->probe(dev);
> +	else if (drv->probe)
> +		ret = drv->probe(dev);
> +
> +	switch (ret) {
> +	case -EPROBE_DEFER:
> +		/* Driver requested deferred probing */
> +		dev_dbg(dev, "Driver %s requests probe deferral\n", drv->name);
> +		break;
> +	case -ENODEV:
> +	case -ENXIO:
> +		pr_debug("%s: probe of %s rejects match %d\n",
> +			 drv->name, dev_name(dev), ret);
> +		break;
> +	default:
> +		/* driver matched but the probe failed */
> +		pr_warn("%s: probe of %s failed with error %d\n",
> +			drv->name, dev_name(dev), ret);
> +		break;
> +	}

Like Kirti said, 0 needs to be handled here.  Did this not spew a lot of
warnings in the logs?

And we can fix up the pr_* calls to use dev_* in the future, shows the
evolution of this code...

thanks,

greg k-h
