Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3073A89A2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 21:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633336E1EC;
	Tue, 15 Jun 2021 19:36:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681BD6E1EC
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 19:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623785771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=llnAE3X+Il5R8O881N30+k0POgEFanp8l+fSoeV24QM=;
 b=WkXP7izZfBCKEUWa/5avWj0TBZXdPWYXjhFHs0GoDAMPYncw7X29kUmVFY7DCG9fd6mixH
 SNakYpQubiOHjxUmSFgPYa241Cj8UX6WwuueZJxAPMlRQ7uo+nk2/rI+je7kadIjh7Af/e
 5HhXYNB3QPHWiiX+3e+j3Uqv093eiW0=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-rarn76vCPvCWUNpGCu4Rkg-1; Tue, 15 Jun 2021 15:36:05 -0400
X-MC-Unique: rarn76vCPvCWUNpGCu4Rkg-1
Received: by mail-oo1-f70.google.com with SMTP id
 f5-20020a4ab0050000b029023e3bd79e80so101770oon.10
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 12:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=llnAE3X+Il5R8O881N30+k0POgEFanp8l+fSoeV24QM=;
 b=YP2LDi+0DyDOJulGdTUrg0s5LB/1IzYjDcbG2MPWVeFeNncc73/FPtW71aC0+v0uak
 omWbhH+jXFx2tfkKnFGuwOoMQUsz8c8xsNeFyQUYLFKiodgv73xLyb3ue+psTSdGd5kr
 i4pE2hQFk8WNu2dAOBkS4/hPGtjZyBGG2GT7HFPg3YG/cRyWtNU6SAeaSfv2j3PCUG1I
 gVDRgJljPmusjYgBbV1UghsRSRvNdzV9qOW8QdiuA/Dh/v3kitJQyz2ygpJlbc9qyhyD
 1LPjqq6UxqQZJqkk7t/ZY4NR8yx/je023sVq0g+DR/gx6LxLwlt7SxexQhFCGEIUuZXv
 B59w==
X-Gm-Message-State: AOAM531za6ldYX/ul4X8GZJqcYHkw5ajdVeg39qF/sTWHtWo14qpQOBN
 8/Y/1b6ubrGfqjzToSK2WEY6t/d10p2fuOtCUG+CWZwUJZdYD+sXUWiZ8AAxDoy8dkVd3VEs6vn
 9iD1Xf6Es2LhhUGcPuTzMy7GaXMhu
X-Received: by 2002:a05:6808:210:: with SMTP id
 l16mr500273oie.154.1623785764705; 
 Tue, 15 Jun 2021 12:36:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8QXhsFTV+W1cxlEpGDuWEWDQP8JmMvkjeZyUYAqX7GqD4McjXkjMc2mNDLmE9O/Xu0RrqmA==
X-Received: by 2002:a05:6808:210:: with SMTP id
 l16mr500251oie.154.1623785764560; 
 Tue, 15 Jun 2021 12:36:04 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id u1sm3965076ooo.18.2021.06.15.12.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 12:36:04 -0700 (PDT)
Date: Tue, 15 Jun 2021 13:36:02 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 04/10] driver core: Don't return EPROBE_DEFER to
 userspace during sysfs bind
Message-ID: <20210615133602.0699492d.alex.williamson@redhat.com>
In-Reply-To: <20210615133519.754763-5-hch@lst.de>
References: <20210615133519.754763-1-hch@lst.de>
 <20210615133519.754763-5-hch@lst.de>
Organization: Red Hat
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
 Heiko Carstens <hca@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 15 Jun 2021 15:35:13 +0200
Christoph Hellwig <hch@lst.de> wrote:

> @@ -547,10 +538,9 @@ static int call_driver_probe(struct device *dev, struct device_driver *drv)
>  
>  static int really_probe(struct device *dev, struct device_driver *drv)
>  {
> -	int local_trigger_count = atomic_read(&deferred_trigger_count);
>  	bool test_remove = IS_ENABLED(CONFIG_DEBUG_TEST_DRIVER_REMOVE) &&
>  			   !drv->suppress_bind_attrs;
> -	int ret = -EPROBE_DEFER, probe_ret = 0;
> +	int ret, probe_ret = 0;

nit, probe_ret initialization could be removed with this patch too.

>  
>  	if (defer_all_probes) {
>  		/*
> @@ -559,17 +549,13 @@ static int really_probe(struct device *dev, struct device_driver *drv)
>  		 * wait_for_device_probe() right after that to avoid any races.
>  		 */
>  		dev_dbg(dev, "Driver %s force probe deferral\n", drv->name);
> -		driver_deferred_probe_add(dev);
> -		return ret;
> +		return -EPROBE_DEFER;
>  	}
>  
>  	ret = device_links_check_suppliers(dev);
> -	if (ret == -EPROBE_DEFER)
> -		driver_deferred_probe_add_trigger(dev, local_trigger_count);
>  	if (ret)
>  		return ret;
>  
> -	atomic_inc(&probe_count);
>  	pr_debug("bus: '%s': %s: probing driver %s with device %s\n",
>  		 drv->bus->name, __func__, drv->name, dev_name(dev));
>  	if (!list_empty(&dev->devres_head)) {
> @@ -681,11 +667,7 @@ static int really_probe(struct device *dev, struct device_driver *drv)
>  		dev->pm_domain->dismiss(dev);
>  	pm_runtime_reinit(dev);
>  	dev_pm_set_driver_flags(dev, 0);
> -	if (probe_ret == -EPROBE_DEFER)
> -		driver_deferred_probe_add_trigger(dev, local_trigger_count);

This was the only possible uninitialized use case afaict.  Thanks,

Alex

