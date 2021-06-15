Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DDC3A817A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 15:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64C289951;
	Tue, 15 Jun 2021 13:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B41189951
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 13:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623765247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LTPum8fRwPooExg8+HCTnewiRqyT0ffgzpim9aaEyrQ=;
 b=fSo+LlotClQHpZ9ELEc42+jhwfs3bWY2e+7q2Yo4V9Q7wBr4I2+YNKL8r43eWfRUg4Tl6w
 daKWfQv0IYzmclC0GqwbYH3CPiSETLQqGPl4MVHnbC38vU9ikJqBfc+3d2kOipla+SVcHi
 HNAc6CdoPDZQU2a6uD5859uHKxzBxAM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-C13r6FEsM8GkbdBbTqx5OQ-1; Tue, 15 Jun 2021 09:54:05 -0400
X-MC-Unique: C13r6FEsM8GkbdBbTqx5OQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36B141084F40;
 Tue, 15 Jun 2021 13:54:03 +0000 (UTC)
Received: from localhost (ovpn-113-156.ams2.redhat.com [10.36.113.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D17571037F22;
 Tue, 15 Jun 2021 13:53:47 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgg@nvidia.com>, Alex
 Williamson <alex.williamson@redhat.com>, Kirti Wankhede
 <kwankhede@nvidia.com>
Subject: Re: [PATCH 02/10] driver core: Better distinguish probe errors in
 really_probe
In-Reply-To: <20210615133519.754763-3-hch@lst.de>
Organization: Red Hat GmbH
References: <20210615133519.754763-1-hch@lst.de>
 <20210615133519.754763-3-hch@lst.de>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Tue, 15 Jun 2021 15:53:46 +0200
Message-ID: <8735tjxmhh.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 kvm@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 15 2021, Christoph Hellwig <hch@lst.de> wrote:

> really_probe tries to special case errors from ->probe, but due to all
> other initialization added to the function over time now a lot of
> internal errors hit that code path as well.  Untangle that by adding
> a new probe_err local variable and apply the special casing only to
> that.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/base/dd.c | 72 +++++++++++++++++++++++++++--------------------
>  1 file changed, 42 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 7477d3322b3a..fd83817240e6 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -513,12 +513,44 @@ static ssize_t state_synced_show(struct device *dev,
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
> +	case 0:
> +		break;
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

Convert these two pr_* to dev_* when touching the code anyway?

> +		break;
> +	}
> +
> +	return ret;
> +}

(...)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

