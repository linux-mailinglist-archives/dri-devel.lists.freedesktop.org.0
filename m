Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6007D57BEBB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 21:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D18D10E974;
	Wed, 20 Jul 2022 19:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220FC10E0FA
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 19:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658346080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ehh4V90wN0RJR9qCy+oaecsD0c4O/PC+hN+Ir98d0Ho=;
 b=XlT8hWmKQcazn9UC/cEMWe1bkxLkc2ENuiUDZKlvwOcdevpycZs2FcqeXkmTVrbuKB8ULh
 BNzog7A21HhqUvl2KOnO2ghNu1Z5NecnIRvCyhgMglf+IHOPs/NpTXf+8HhdJb2qcwujW/
 S0tM6/XKW7xVoqMNEZyEoE9TLBAq6e0=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-r70beCYkPA2mhd5yd94FXg-1; Wed, 20 Jul 2022 15:41:17 -0400
X-MC-Unique: r70beCYkPA2mhd5yd94FXg-1
Received: by mail-io1-f69.google.com with SMTP id
 j8-20020a6b7948000000b0067c2923d1b8so3438328iop.6
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 12:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=ehh4V90wN0RJR9qCy+oaecsD0c4O/PC+hN+Ir98d0Ho=;
 b=6giBmTrguV7RpYX5rfbdtEaTGDjVE2lA+8b3zJr0gnwcY0AyGErbWqtIaW6/kHbsZI
 0iKzgFncV99y3S6QdR6W+UgLFQvIJ75LlAiIjjsGjUMU+Nz0oq3wPDg9Mcd7v9/+tDOy
 qrWjXAUa69BNnq9RJzpKpB8Nx8g9EqJb0ysqwtKO6UiW6IPRoDUL8I6Icc2wTmM3SttY
 Z3mzp8hI3oRdPOfMBXXXRAMEO6rItK/tMnUXRAaByyksI+jgBRD6cbjBki5t/ks4PvzY
 HhfSaHsvQNvdEbRVHUM+liAcLCSShh/gxfB+AZ3ioNMMSy1s6iFcOxpDeJKK032fjBGp
 DkKg==
X-Gm-Message-State: AJIora+NW5ALiP7xA/fkQzYmtP/JeFnvoGFfrgnR0xGLphBrC7b65ARF
 BKAMsuu7uByJyVyd7wUxZ2/fZ3WmMUQ/+ysbmKfjPh6s5CUtvOtB6hqq/2NYCxOTqPBPrLQqIG3
 w2Ctc0tDVLRfWcg+SjQLdJThiVRdW
X-Received: by 2002:a05:6e02:1a0c:b0:2dc:8921:a8d9 with SMTP id
 s12-20020a056e021a0c00b002dc8921a8d9mr20755582ild.145.1658346076569; 
 Wed, 20 Jul 2022 12:41:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vYxHlGrytgU3tCmIJ+Uhn7Hc+/RyJhZDLkKiiqtiSiv/P5YPbnk+rkd8QUKXd1S1jL+Xv4Pg==
X-Received: by 2002:a05:6e02:1a0c:b0:2dc:8921:a8d9 with SMTP id
 s12-20020a056e021a0c00b002dc8921a8d9mr20755544ild.145.1658346076213; 
 Wed, 20 Jul 2022 12:41:16 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 g40-20020a022728000000b00339eedc7840sm8267773jaa.94.2022.07.20.12.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 12:41:15 -0700 (PDT)
Date: Wed, 20 Jul 2022 13:41:13 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v4 1/2] vfio: Replace the DMA unmapping notifier with a
 callback
Message-ID: <20220720134113.4225f9d6.alex.williamson@redhat.com>
In-Reply-To: <1-v4-681e038e30fd+78-vfio_unmap_notif_jgg@nvidia.com>
References: <0-v4-681e038e30fd+78-vfio_unmap_notif_jgg@nvidia.com>
 <1-v4-681e038e30fd+78-vfio_unmap_notif_jgg@nvidia.com>
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
 Halil Pasic <pasic@linux.ibm.com>, Nicolin Chen <nicolinc@nvidia.com>,
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

On Tue, 19 Jul 2022 21:02:48 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:
> diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
> index a7d2a95796d360..bb1a1677c5c230 100644
> --- a/drivers/s390/crypto/vfio_ap_ops.c
> +++ b/drivers/s390/crypto/vfio_ap_ops.c
> @@ -1226,34 +1226,14 @@ static int vfio_ap_mdev_set_kvm(struct ap_matrix_mdev *matrix_mdev,
>  	return 0;
>  }
>  
> -/**
> - * vfio_ap_mdev_iommu_notifier - IOMMU notifier callback
> - *
> - * @nb: The notifier block
> - * @action: Action to be taken
> - * @data: data associated with the request
> - *
> - * For an UNMAP request, unpin the guest IOVA (the NIB guest address we
> - * pinned before). Other requests are ignored.
> - *
> - * Return: for an UNMAP request, NOFITY_OK; otherwise NOTIFY_DONE.
> - */
> -static int vfio_ap_mdev_iommu_notifier(struct notifier_block *nb,
> -				       unsigned long action, void *data)
> +static void vfio_ap_mdev_dma_unmap(struct vfio_device *vdev, u64 iova,
> +				   u64 length)
>  {
> -	struct ap_matrix_mdev *matrix_mdev;
> -
> -	matrix_mdev = container_of(nb, struct ap_matrix_mdev, iommu_notifier);
> -
> -	if (action == VFIO_IOMMU_NOTIFY_DMA_UNMAP) {
> -		struct vfio_iommu_type1_dma_unmap *unmap = data;
> -		unsigned long g_pfn = unmap->iova >> PAGE_SHIFT;
> -
> -		vfio_unpin_pages(&matrix_mdev->vdev, &g_pfn, 1);
> -		return NOTIFY_OK;
> -	}
> +	struct ap_matrix_mdev *matrix_mdev =
> +		container_of(vdev, struct ap_matrix_mdev, vdev);
> +	unsigned long g_pfn = iova >> PAGE_SHIFT;
>  
> -	return NOTIFY_DONE;
> +	vfio_unpin_pages(&matrix_mdev->vdev, &g_pfn, 1);
>  }
>  
>  /**


I tried to apply this on top of Nicolin's series which results in a
conflict that can be resolved as below:

diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index e8856a7e151c..d7c38c82f694 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -1219,33 +1219,13 @@ static int vfio_ap_mdev_set_kvm(struct ap_matrix_mdev *matrix_mdev,
 	return 0;
 }
 
-/**
- * vfio_ap_mdev_iommu_notifier - IOMMU notifier callback
- *
- * @nb: The notifier block
- * @action: Action to be taken
- * @data: data associated with the request
- *
- * For an UNMAP request, unpin the guest IOVA (the NIB guest address we
- * pinned before). Other requests are ignored.
- *
- * Return: for an UNMAP request, NOFITY_OK; otherwise NOTIFY_DONE.
- */
-static int vfio_ap_mdev_iommu_notifier(struct notifier_block *nb,
-				       unsigned long action, void *data)
+static void vfio_ap_mdev_dma_unmap(struct vfio_device *vdev, u64 iova,
+				   u64 length)
 {
-	struct ap_matrix_mdev *matrix_mdev;
-
-	matrix_mdev = container_of(nb, struct ap_matrix_mdev, iommu_notifier);
-
-	if (action == VFIO_IOMMU_NOTIFY_DMA_UNMAP) {
-		struct vfio_iommu_type1_dma_unmap *unmap = data;
-
-		vfio_unpin_pages(&matrix_mdev->vdev, unmap->iova, 1);
-		return NOTIFY_OK;
-	}
+	struct ap_matrix_mdev *matrix_mdev =
+		container_of(vdev, struct ap_matrix_mdev, vdev);
 
-	return NOTIFY_DONE;
+	vfio_unpin_pages(&matrix_mdev->vdev, iova, 1);
 }
 
 /**

ie. we don't need the gfn, we only need the iova.

However then I start to wonder why we're passing in 1 for the number of
pages because this previously notifier, now callback is called for the
entire vfio_dma range when we find any pinned pages.  It makes no sense for
a driver to assume that the first iova is pinned and is the only pinned
page.

ccw has the same issue:

static void vfio_ccw_dma_unmap(struct vfio_device *vdev, u64 iova, u64 length)
{
        struct vfio_ccw_private *private =
                container_of(vdev, struct vfio_ccw_private, vdev);

        /* Drivers MUST unpin pages in response to an invalidation. */
        if (!cp_iova_pinned(&private->cp, iova))
                return;

        vfio_ccw_mdev_reset(private);
}

Entirely ignoring the length arg.

It seems only GVT-g has this correct to actually look through the
extent of the range being unmapped:

static void intel_vgpu_dma_unmap(struct vfio_device *vfio_dev, u64 iova,
                                 u64 length)
{
        struct intel_vgpu *vgpu = vfio_dev_to_vgpu(vfio_dev);
        struct gvt_dma *entry;
        u64 iov_pfn = iova >> PAGE_SHIFT;
        u64 end_iov_pfn = iov_pfn + length / PAGE_SIZE;

        mutex_lock(&vgpu->cache_lock);
        for (; iov_pfn < end_iov_pfn; iov_pfn++) {
                entry = __gvt_cache_find_gfn(vgpu, iov_pfn);
                if (!entry)
                        continue;

                gvt_dma_unmap_page(vgpu, entry->gfn, entry->dma_addr,
                                   entry->size);
                __gvt_cache_remove_entry(vgpu, entry);
        }
        mutex_unlock(&vgpu->cache_lock);
}

Should ap and ccw implementations of .dma_unmap just be replaced with a
BUG_ON(1)?  Thanks,

Alex

