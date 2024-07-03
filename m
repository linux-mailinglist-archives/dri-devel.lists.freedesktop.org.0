Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6F492662F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 18:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE33310E2D0;
	Wed,  3 Jul 2024 16:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PpffOb8v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D976210E2BB
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 16:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720024338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T29v3MqMDNzKMLmvfKJHErvtZBlG75imLBcIldPfbq8=;
 b=PpffOb8viEhI6gZd+WTEXRT4ulosUJ0foJGj70+JkbiuiVFY1Jo++kluw/Z4r/vC1TS54/
 ZlSWUyLRF2L8/3gOmJF4yYQoqpcOf4xGq8DXBupTWZ2R1S9r83NGGfzA/MD9XC1vrTJAQr
 BTkEEfZE8KSTHwGJKAPZDqhnZ92eP/g=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-spxaoG31MLarhFsrg9uKDA-1; Wed, 03 Jul 2024 12:32:16 -0400
X-MC-Unique: spxaoG31MLarhFsrg9uKDA-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2ec72d14876so49609301fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2024 09:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720024335; x=1720629135;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T29v3MqMDNzKMLmvfKJHErvtZBlG75imLBcIldPfbq8=;
 b=ljRWbfYtvDhuKpsFEW6NrXZN4ByarH2IFtgP9tpqpZYLDvQyQzCikFbAqs76Pp/Bt6
 kDonC1Ym6piDovE3GawWilyHIL+jUhBuPz6x4izOmZ3Nruuh9oVG+kop7h0mgQRkM/s2
 /gTS5si6xJILV8b1Y1cRRlPjmZDY9BWpfMkU/be0KdBf4Cmlje4Urjcoaz+2R0A0DZJ8
 OQ96Am8KUoR4DF0AKRt5edDQRuwNlxkq+le7gY188ngVHYGkRZjAHyHGs04aPYzehQHI
 IL2h5KxDHntNCrfQ3cef98oABM1LGzJSUeS2y3fILXNkhL1cXMtVoqvAOlhjOPY7dE2g
 D2hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLp8prHhN16/p7QocrFIh5fbZpEVpuxdEQum0g65Fwa5b0jDKCuwhIQOJbKYstsDpphu3UhdLGw2MNRKp/DNS0RaJJz+0rAgx6riP2olou
X-Gm-Message-State: AOJu0YxFMcHHBiAvJ9ZWEhrbGepnZG451Voqfvcc7YD/cTbAx70fKteK
 36EDMqNeLAFgh5d6En0TfQTa/BC4M3fsjysDf5IDN0EzIRoo3TMnN9yoxjXJ8qqlhyOQsbwntvU
 Kp2vyXxDv/NeYjVSjD5X4O0ZA+9mk9m5DTZbs3wDpHH+AX9vwYWea+EG6A3ELV9PtKw==
X-Received: by 2002:a2e:bc19:0:b0:2eb:d924:43fb with SMTP id
 38308e7fff4ca-2ee5e6bc6f7mr90933031fa.41.1720024335096; 
 Wed, 03 Jul 2024 09:32:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3V7vYkVhH8OJphhsnsxAVWOG21asngpKcdckbhi0zQYrX/jZvvDTcTN6is+OmAjmZQvtD0g==
X-Received: by 2002:a2e:bc19:0:b0:2eb:d924:43fb with SMTP id
 38308e7fff4ca-2ee5e6bc6f7mr90932111fa.41.1720024332354; 
 Wed, 03 Jul 2024 09:32:12 -0700 (PDT)
Received: from redhat.com ([31.187.78.171]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af3cff9sm242324535e9.3.2024.07.03.09.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 09:32:11 -0700 (PDT)
Date: Wed, 3 Jul 2024 12:32:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kalle Valo <kvalo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k@lists.infradead.org, ath11k@lists.infradead.org,
 iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/21] vhost-vdpa: Use iommu_paging_domain_alloc()
Message-ID: <20240703123146-mutt-send-email-mst@kernel.org>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-5-baolu.lu@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20240610085555.88197-5-baolu.lu@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 10, 2024 at 04:55:38PM +0800, Lu Baolu wrote:
> Replace iommu_domain_alloc() with iommu_paging_domain_alloc().
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>


I assume it's merged with the rest of the stuff, right?

> ---
>  drivers/vhost/vdpa.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> index 63a53680a85c..e31ec9ebc4ce 100644
> --- a/drivers/vhost/vdpa.c
> +++ b/drivers/vhost/vdpa.c
> @@ -1312,26 +1312,24 @@ static int vhost_vdpa_alloc_domain(struct vhost_vdpa *v)
>  	struct vdpa_device *vdpa = v->vdpa;
>  	const struct vdpa_config_ops *ops = vdpa->config;
>  	struct device *dma_dev = vdpa_get_dma_dev(vdpa);
> -	const struct bus_type *bus;
>  	int ret;
>  
>  	/* Device want to do DMA by itself */
>  	if (ops->set_map || ops->dma_map)
>  		return 0;
>  
> -	bus = dma_dev->bus;
> -	if (!bus)
> -		return -EFAULT;
> -
>  	if (!device_iommu_capable(dma_dev, IOMMU_CAP_CACHE_COHERENCY)) {
>  		dev_warn_once(&v->dev,
>  			      "Failed to allocate domain, device is not IOMMU cache coherent capable\n");
>  		return -ENOTSUPP;
>  	}
>  
> -	v->domain = iommu_domain_alloc(bus);
> -	if (!v->domain)
> -		return -EIO;
> +	v->domain = iommu_paging_domain_alloc(dma_dev);
> +	if (IS_ERR(v->domain)) {
> +		ret = PTR_ERR(v->domain);
> +		v->domain = NULL;
> +		return ret;
> +	}
>  
>  	ret = iommu_attach_device(v->domain, dma_dev);
>  	if (ret)
> -- 
> 2.34.1

