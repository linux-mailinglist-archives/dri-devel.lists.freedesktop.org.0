Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B79A3488F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 16:53:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5736510EB2B;
	Thu, 13 Feb 2025 15:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Xvd8jUfW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E024110EB23
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 15:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739461995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wm65mUYAEbhhNi250l1nY6B0IiEBXXQj82KeWsM7Zn0=;
 b=Xvd8jUfW71PjHtuma3sYKMUcHlsvTz8gHw5d5CnOrezvv/bIdqfe33AKPj/xQcQFMJGQ20
 pNABMEjgODXPapdNuJxaIPOYlutjeaSX+S/XVG3YNFh/WqsKiV4cxCeyjrKfub0RBjIKk5
 5GSUOYc2+7VknwzXI2Qtf91bcfRrdHo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-JfosgV82MaCsajaxcjpUPA-1; Thu, 13 Feb 2025 10:53:13 -0500
X-MC-Unique: JfosgV82MaCsajaxcjpUPA-1
X-Mimecast-MFC-AGG-ID: JfosgV82MaCsajaxcjpUPA_1739461992
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-ab7bb1b91fdso103486266b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 07:53:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739461992; x=1740066792;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wm65mUYAEbhhNi250l1nY6B0IiEBXXQj82KeWsM7Zn0=;
 b=pzVsRVzQcZdtRXO0WW7WDC7QLbwx9FMxHl7Otof/IWSv7GMA+d2GHqalk/EjZ8uhhs
 Rl6H4PVqsHE8ogUXKL7tNt7tCSuX9WFmlVp8ttGXB+pGddzmJ5WX2ABJXSUg+5L3Y/7P
 /d2EsgAcBB2D4G474nih5sWFrvJr2oLj6IftJnD5KxSHSg3jTbzUKWZRvY5a4hNPUwNW
 mIpkuoc6uOnHZIS9N+cTXLgtjwgozIDkx7q5FnZ62Rby854hh0APWZJsYin5DAKrp3uN
 nMLeYZv5kMCxxaMxrFn3E7sr8Zc9MGvraIMifbFM5WF2hKzbzFigZjCcsKh3coha2LK/
 AqUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMNof5BDZRY7PCXvQJvRb9BAAetLZrb3qaElos1va5SnaZ3D2cv/U2sQJiwCkq7EWeWPa6bjUDM6A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZb3sgXOsW27pA7hXATIgYMkBec6mMkWdw+yAdqDWXRnR7T17o
 wrQW0eERWRrBgQJY4WJuSlf7q/R4QYpTlhD6HWe6eLNkCD6wFyAx7yad2gL8+oC3DGbcWFbGIvJ
 XL9TFw7qeM9wbXvPuXhQu2kLm8+k5ZI44CecC9lIMYb3gJcDwLe405nM8vh214XPDQg==
X-Gm-Gg: ASbGnctaFsTwl7x08XJ+yh/x5a98c7btThcWoO25AmvQTI7p3C6xsl8EouRUpMLwWn9
 zHSPNmChGLgajJ7B23pDLaG19K10csDYX0LhJZxH1Gkl1Xh15EIJ8h/WXWgCNqfhwCj3lxs0Myp
 FNuovD9yikQaisan5d62iFBQEZb16FHuPvlH+uSwce++mXsyxXKs1VRROYVpwiXTbUD3HoaQ2pL
 zeHebTXgWN6KpcMDLlgswWsIsJ2JjcLjlARdF5mJngtUiA62riEAgzRSIqGFnjVcG9veXsS3A==
X-Received: by 2002:a17:907:9710:b0:ab2:c1da:b725 with SMTP id
 a640c23a62f3a-ab7f33f5f15mr585698866b.30.1739461992361; 
 Thu, 13 Feb 2025 07:53:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPYyt4663087uMZIIKURYrG8Pp4HqyogPBtf0brGd9uzETM6Wmccz2T6+v992nLi1pX3fRsA==
X-Received: by 2002:a17:907:9710:b0:ab2:c1da:b725 with SMTP id
 a640c23a62f3a-ab7f33f5f15mr585695966b.30.1739461991960; 
 Thu, 13 Feb 2025 07:53:11 -0800 (PST)
Received: from redhat.com ([2a02:14f:171:92b6:64de:62a8:325e:4f1d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba532581acsm156316266b.50.2025.02.13.07.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 07:53:11 -0800 (PST)
Date: Thu, 13 Feb 2025 10:53:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 fnkl.kernel@gmail.com, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 0/5] virtio: obtain SHM page size from device
Message-ID: <20250213105231-mutt-send-email-mst@kernel.org>
References: <20250213-virtio-shm-page-size-v1-0-5ee1f9984350@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250213-virtio-shm-page-size-v1-0-5ee1f9984350@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -e_xFZyH07CZdMvATZwkuJjXNYVSNGtfzs0KKFEKtFg_1739461992
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

On Thu, Feb 13, 2025 at 04:49:14PM +0100, Sergio Lopez wrote:
> There's an incresing number of machines supporting multiple page sizes
> and, on these machines, the host and a guest can be running with
> different pages sizes.
> 
> In addition to this, there might be devices that have a required and/or
> preferred page size for mapping memory.
> 
> In this series, we extend virtio_shm_region with a field to hold the
> page size. This field has a 16-bit size to accommodate into the existing
> padding virtio_pci_cap, simplifying the introduction of this additional
> data into the structure. The device will provide the page size in format
> PAGE_SIZE >> 12.
> 
> The series also extends the PCI and MMIO transports to obtain the
> corresponding value from the device. For the PCI one, it should be safe
> since we're using an existing 16-bit padding in the virtio_pci_cap
> struct. For MMIO, we need to access a new register, so there's a risk
> the VMM may overreact and crash the VM. I've checked libkrun,
> firecracker, cloud-hypervisor and crosvm, and all of them should deal
> with the unexpected MMIO read gracefully. QEMU doesn't support SHM for
> the MMIO transport, so that isn't a concern either.
> 
> How the SHM page size information is used depends on each device. Some
> may silently round up allocations, some may expose this information to
> userspace. This series includes a patch that extends virtio-gpu to
> expose the information via the VIRTGPU_GETPARAM ioctl, as an example of
> the second approach.
> 
> This patch series is an RFC because it requires changes to the VIRTIO
> specifications. This patch series will be used as a reference to
> propose such changes.
> 
> Signed-off-by: Sergio Lopez <slp@redhat.com>


don't you want to negotiate the page size with the
driver then?

> ---
> Sergio Lopez (5):
>       virtio_config: add page_size field to virtio_shm_region
>       virtio: introduce VIRTIO_F_SHM_PAGE_SIZE
>       virtio-pci: extend virtio_pci_cap to hold page_size
>       virtio-mmio: read shm region page size
>       drm/virtio: add VIRTGPU_PARAM_HOST_SHM_PAGE_SIZE to params
> 
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c |  5 +++++
>  drivers/virtio/virtio_mmio.c           | 13 +++++++++++++
>  drivers/virtio/virtio_pci_modern.c     | 31 ++++++++++++++++++++++++++++---
>  drivers/virtio/virtio_ring.c           |  2 ++
>  include/linux/virtio_config.h          |  1 +
>  include/uapi/drm/virtgpu_drm.h         |  1 +
>  include/uapi/linux/virtio_config.h     |  7 ++++++-
>  include/uapi/linux/virtio_mmio.h       |  3 +++
>  include/uapi/linux/virtio_pci.h        |  2 +-
>  9 files changed, 60 insertions(+), 5 deletions(-)
> ---
> base-commit: 4dc1d1bec89864d8076e5ab314f86f46442bfb02
> change-id: 20250213-virtio-shm-page-size-6e9a08c7ded1
> 
> Best regards,
> -- 
> Sergio Lopez <slp@redhat.com>

