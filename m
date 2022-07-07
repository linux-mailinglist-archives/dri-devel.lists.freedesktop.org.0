Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 021A956ADCD
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 23:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B51412BC1A;
	Thu,  7 Jul 2022 21:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121C012BBC4
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 21:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657229842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xSEXwFPAyvrhENqvrLwIjRSY51Sdjq2lfUdnz+vUg/A=;
 b=euUx328dFgVy0iIjYh0dpejAuD3x6i4BFkAL+Hr9coUZQoF1QSv/ZrP3E+K1mznSPYBlfa
 1OUHxlQ0fmagoSAgXsf0Ass+mDbK8ukHSIUUCWjKEHv34UWuSFGIYLUaoL4SZZfRDjuL9E
 TgpTRHL0pR+k9zuu5dh5Cxs2m8JzYHA=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-q-jzdyBVNZmMMsgrt8ycBA-1; Thu, 07 Jul 2022 17:37:19 -0400
X-MC-Unique: q-jzdyBVNZmMMsgrt8ycBA-1
Received: by mail-il1-f200.google.com with SMTP id
 b8-20020a92c568000000b002dc0d54f7b1so7172170ilj.19
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 14:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=xSEXwFPAyvrhENqvrLwIjRSY51Sdjq2lfUdnz+vUg/A=;
 b=0z7PBwKfOzkMmHR+LzkvD4kUFTCKik5+CEmIuGpKwgOtgWMEnjhcvjc5hjP9f8O1rp
 umy+/B4EOqkYso+cbWpWkMpRf/swlfMrAh70SkZ9mmcBRp44ozAZ2p/iiZcUMxwIxN7c
 gR6f5E7uanWOqozNeVWiEXTjkinnUfxXkdwSDbAZdF3IdDyPAdF8pMettZVI51YrPZz+
 Lq2ZaHW/7HBunp9+r8j6ocvTUcXdt1Rvjxe99SMDSs06iJ9FJT9nhKwZBShdONW6XwHe
 5IxuSWJCb3pFZPtiL0IoplcbDaABuFxtfE/M35xsUKdelJf/maSzxSRHEUAsaH/mL/ny
 We7A==
X-Gm-Message-State: AJIora/Tn73yHAgE2NZIdebRFctm334JAQT+uXSv5GzdAqQXNN3yQKaM
 Ly/wB7dZIioo7/YNomP8grXzK7YNZQFrwy3H7D+uhLq0o6kv9HynYZ/jH3hwtHC2k/ugl7lW7dx
 oYRkVbOHhISJkmbtJEO0fCCc038+c
X-Received: by 2002:a05:6e02:928:b0:2dc:759:7817 with SMTP id
 o8-20020a056e02092800b002dc07597817mr113881ilt.84.1657229838429; 
 Thu, 07 Jul 2022 14:37:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s70GZAk3YrQZOFfNpy3nkoHR4IJbk/AIEya6UVHis8OCEYOJsN20yij7l5PEEyvprcYnTFbw==
X-Received: by 2002:a05:6e02:928:b0:2dc:759:7817 with SMTP id
 o8-20020a056e02092800b002dc07597817mr113848ilt.84.1657229838191; 
 Thu, 07 Jul 2022 14:37:18 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 j62-20020a026341000000b0033ed7ef1b5csm5136571jac.41.2022.07.07.14.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 14:37:17 -0700 (PDT)
Date: Thu, 7 Jul 2022 15:37:16 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 1/2] vfio: Replace the DMA unmapping notifier with a
 callback
Message-ID: <20220707153716.70f755ab.alex.williamson@redhat.com>
In-Reply-To: <1-v3-7593f297c43f+56ce-vfio_unmap_notif_jgg@nvidia.com>
References: <0-v3-7593f297c43f+56ce-vfio_unmap_notif_jgg@nvidia.com>
 <1-v3-7593f297c43f+56ce-vfio_unmap_notif_jgg@nvidia.com>
Organization: Red Hat
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
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Kevin Tian <kevin.tian@intel.com>, dri-devel@lists.freedesktop.org,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  4 Jul 2022 21:59:03 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:
> diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
> index b49e2e9db2dc6f..09e0ce7b72324c 100644
> --- a/drivers/s390/cio/vfio_ccw_ops.c
> +++ b/drivers/s390/cio/vfio_ccw_ops.c
> @@ -44,31 +44,19 @@ static int vfio_ccw_mdev_reset(struct vfio_ccw_private *private)
>  	return ret;
>  }
>  
> -static int vfio_ccw_mdev_notifier(struct notifier_block *nb,
> -				  unsigned long action,
> -				  void *data)
> +static void vfio_ccw_dma_unmap(struct vfio_device *vdev, u64 iova, u64 length)
>  {
>  	struct vfio_ccw_private *private =
> -		container_of(nb, struct vfio_ccw_private, nb);
> -
> -	/*
> -	 * Vendor drivers MUST unpin pages in response to an
> -	 * invalidation.
> -	 */
> -	if (action == VFIO_IOMMU_NOTIFY_DMA_UNMAP) {
> -		struct vfio_iommu_type1_dma_unmap *unmap = data;
> -
> -		if (!cp_iova_pinned(&private->cp, unmap->iova))
> -			return NOTIFY_OK;
> +		container_of(vdev, struct vfio_ccw_private, vdev);
>  
> -		if (vfio_ccw_mdev_reset(private))
> -			return NOTIFY_BAD;
> +	/* Drivers MUST unpin pages in response to an invalidation. */
> +	if (!cp_iova_pinned(&private->cp, iova))
> +		return;
>  
> -		cp_free(&private->cp);
> -		return NOTIFY_OK;
> -	}
> +	if (vfio_ccw_mdev_reset(private))
> +		return;
>  
> -	return NOTIFY_DONE;
> +	cp_free(&private->cp);
>  }


The cp_free() call is gone here with [1], so I think this function now
just ends with:

	...
	vfio_ccw_mdev_reset(private);
}

There are also minor contextual differences elsewhere from that series,
so a quick respin to record the changes on list would be appreciated.

However the above kind of highlights that NOTIFY_BAD that silently gets
dropped here.  I realize we weren't testing the return value of the
notifier call chain and really we didn't intend that notifiers could
return a failure here, but does this warrant some logging or suggest
future work to allow a device to go offline here?  Thanks.

Alex

[1]https://lore.kernel.org/all/20220707135737.720765-1-farman@linux.ibm.com/

