Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54131A3CFCF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 04:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCC610E0ED;
	Thu, 20 Feb 2025 03:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="NzvX+TBd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26E010E0ED
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 03:07:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1740020837; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ZXkPzyFtCdI7/MNx7P0a9vhMmGG09UuFiUeXiGJItJ4H+LHna5t6UKuhd0gRGy4jGpxZUdf6zUMDEN/hz6zH3q8L0DS6pEL9qu+YMmYRy+JTMlmeEce6SZGRpXiDqvc/gaoMmYDpEU6zZR8wIUSqBjfXqlgHQWb3/NaxTCnjGFY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1740020837;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=CZQfbH3KbzP7Bj9KoZzlxkG1srKiHYUm6CWgToaXURs=; 
 b=jlg+tTbRUsQzW4tCn3//ZXZO/wllesz+Ly7AxxRZrhMQLhsd7k0e2ws77zeB3a2o6jZw/rCL8VRoEKol8VvnGygmgeBLPS/lfZyIKd8BqLppx6q+pa6AcTWpTxmAT5/sMF9He1VvaCZG4P/NlHZGeBRBOtpyt4lvKKL4+3hMzwI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740020837; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=CZQfbH3KbzP7Bj9KoZzlxkG1srKiHYUm6CWgToaXURs=;
 b=NzvX+TBdjBz6ujTn7H0GZSwo8XNBPwlwQd4EAUNhlG8JhE9K9X7GEm+5D5WIBwu3
 mggAukPJn2+iqJbKphnnAQ6nUvXadoXI9KOUIQeH2UcdvqFuHQlrkX3sHOnwdoNzcwP
 ef6DfCVW80B0L6z0pepTx8WKsmz/amXTc36AFzrU=
Received: by mx.zohomail.com with SMTPS id 1740020835488353.06590206575595;
 Wed, 19 Feb 2025 19:07:15 -0800 (PST)
Message-ID: <29100f93-a7e6-4c81-ac83-af94ecd942a1@collabora.com>
Date: Thu, 20 Feb 2025 06:07:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/5] virtio_config: add page_size field to
 virtio_shm_region
To: Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Verkamp <dverkamp@chromium.org>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 fnkl.kernel@gmail.com
Cc: virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250214-virtio-shm-page-size-v2-0-aa1619e6908b@redhat.com>
 <20250214-virtio-shm-page-size-v2-1-aa1619e6908b@redhat.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250214-virtio-shm-page-size-v2-1-aa1619e6908b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 2/14/25 18:16, Sergio Lopez wrote:
> diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
> index 5d78c2d572abfcfe2b84cdd82df622320fe97d5d..1f594b626d7a7734e8ec58766737a118c26bad94 100644
> --- a/drivers/virtio/virtio_mmio.c
> +++ b/drivers/virtio/virtio_mmio.c
> @@ -560,6 +560,8 @@ static bool vm_get_shm_region(struct virtio_device *vdev,
>  
>  	region->addr = addr;
>  
> +	region->page_size = 4096;
> +
>  	return true;
>  }
>  
> diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
> index 5eaade7578606e4b02af0d66447417ad6aa11064..d7aeb2e50a3c499dfb68d58cb89b829ea2e50454 100644
> --- a/drivers/virtio/virtio_pci_modern.c
> +++ b/drivers/virtio/virtio_pci_modern.c
> @@ -862,6 +862,7 @@ static bool vp_get_shm_region(struct virtio_device *vdev,
>  
>  	region->len = len;
>  	region->addr = (u64) phys_addr + offset;
> +	region->page_size = 4096;
>  
>  	return true;
>  }
> diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
> index 169c7d367facb36dcabf9596068580ea8b8516c7..c1b2ce71ea55e81978e18db05494deab193fa4fb 100644
> --- a/include/linux/virtio_config.h
> +++ b/include/linux/virtio_config.h
> @@ -14,6 +14,7 @@ struct irq_affinity;
>  struct virtio_shm_region {
>  	u64 addr;
>  	u64 len;
> +	u32 page_size;
>  };

Nit: I'd squash this into patches #3/4, to not add code that is changed
by a next patch.

-- 
Best regards,
Dmitry
