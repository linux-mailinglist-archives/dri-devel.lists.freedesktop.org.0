Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EED03A3CFFA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 04:14:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2DB10E0FB;
	Thu, 20 Feb 2025 03:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Djt0ewfI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451BC10E0FB
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 03:14:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1740021249; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mOCCBW4P+vHFK6bmftOr8KOfGSv5YxMfDmboA/aIH8B6bibBXsrcoLo/+sni94tWvHpf7ZA1XvnH2NWcEqz1XH3inqnRlvJ0oZ044SfzU0JMkFzGBXrm2PVXWGtcgZKeMixDnkGO/HJrScriKC0AGywM5jV+t0wP+n57XZR+n7c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1740021249;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=z7+n+N2D09r6sO17RNYIc1mmndOABNK1IA6PGR36WYY=; 
 b=TJQDd6GDXM5JDkkR6ctmFuAA504oEbr8tKi6tAHpxCxMZOJG6GXqd5M9bPfP7U2IOzyJJfkGdgzBLKQvlr26ppN3P+zZfBuxnc5mBK2f8RhQ67QlSMUD2o6z1ALJ9gWVIVHvhhZpIwI8UmXuXzOpEzqsuvpjFro8nallliAIllk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740021249; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=z7+n+N2D09r6sO17RNYIc1mmndOABNK1IA6PGR36WYY=;
 b=Djt0ewfIgMHCKkVsBk7cZEFmHEXHZwpInEFhXO6tWf98ksRNCX8nVsj/Z7M8LToY
 6d7+TpaLABsrHP61wxC0wGc94+Pvsq+XEBF8WDb1NaXm1frXURfvbEcAHGNSta5NeNG
 HNrjP5CmPOAmD9YmU8zwt88PAvAO4CRel378nMp0=
Received: by mx.zohomail.com with SMTPS id 1740021248065311.2995734910809;
 Wed, 19 Feb 2025 19:14:08 -0800 (PST)
Message-ID: <7f5a1552-f143-40c8-b796-20568d373d14@collabora.com>
Date: Thu, 20 Feb 2025 06:14:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 3/5] virtio-pci: extend virtio_pci_cap with
 page_shift
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
 <20250214-virtio-shm-page-size-v2-3-aa1619e6908b@redhat.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250214-virtio-shm-page-size-v2-3-aa1619e6908b@redhat.com>
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
> If VIRTIO_F_SHM_PAGE_SIZE has been negotiated and cfg_type is
> VIRTIO_PCI_CAP_SHARED_MEMORY_CFG, the driver must read the page_shift
> field, derive the supported page size from it, and honor it when
> requesting the map of memory into the shared memory region to the
> device.
> 
> Extend virtio_pci_cap to hold that field, and use it to feed
> virtio_shm_region with the corresponding page size.
> 
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
>  drivers/virtio/virtio_pci_modern.c | 22 +++++++++++++++++-----
>  include/uapi/linux/virtio_pci.h    |  3 ++-
>  2 files changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
> index ab0e1d9148057c431676bfacfe5f68cc97eebb12..562a8e1c2bfe6876cffabe26f02cd61ad7fea2cd 100644
> --- a/drivers/virtio/virtio_pci_modern.c
> +++ b/drivers/virtio/virtio_pci_modern.c
> @@ -770,14 +770,15 @@ static void del_vq(struct virtio_pci_vq_info *info)
>  	vring_del_virtqueue(vq);
>  }
>  
> -static int virtio_pci_find_shm_cap(struct pci_dev *dev, u8 required_id,
> -				   u8 *bar, u64 *offset, u64 *len)
> +static int virtio_pci_find_shm_cap(struct virtio_device *vdev, struct pci_dev *dev,
> +				   u8 required_id, u8 *bar, u64 *offset, u64 *len,
> +				   u32 *page_size)
>  {
>  	int pos;
>  
>  	for (pos = pci_find_capability(dev, PCI_CAP_ID_VNDR); pos > 0;
>  	     pos = pci_find_next_capability(dev, pos, PCI_CAP_ID_VNDR)) {
> -		u8 type, cap_len, id, res_bar;
> +		u8 type, cap_len, id, res_bar, page_shift = 0;
>  		u32 tmp32;
>  		u64 res_offset, res_length;
>  
> @@ -808,6 +809,15 @@ static int virtio_pci_find_shm_cap(struct pci_dev *dev, u8 required_id,
>  		 * Looks good.
>  		 */
>  
> +		/* Read the page shift if supported. The page_shift variable is
> +		 * initialized to zero above, so if this feature isn't supported it
> +		 * will result in a page_size of 4096, a default safe value.
> +		 */
> +		if (__virtio_test_bit(vdev, VIRTIO_F_SHM_PAGE_SIZE)) {
> +			pci_read_config_byte(dev, pos + offsetof(struct virtio_pci_cap,
> +								 page_shift), &page_shift);
> +		}
> +
>  		/* Read the lower 32bit of length and offset */
>  		pci_read_config_dword(dev, pos + offsetof(struct virtio_pci_cap,
>  							  offset), &tmp32);
> @@ -829,6 +839,7 @@ static int virtio_pci_find_shm_cap(struct pci_dev *dev, u8 required_id,
>  		*bar = res_bar;
>  		*offset = res_offset;
>  		*len = res_length;
> +		*page_size = 1 << (page_shift + 12);
>  
>  		return pos;
>  	}
> @@ -841,11 +852,12 @@ static bool vp_get_shm_region(struct virtio_device *vdev,
>  	struct virtio_pci_device *vp_dev = to_vp_device(vdev);
>  	struct pci_dev *pci_dev = vp_dev->pci_dev;
>  	u8 bar;
> +	u32 page_size;
>  	u64 offset, len;
>  	phys_addr_t phys_addr;
>  	size_t bar_len;
>  
> -	if (!virtio_pci_find_shm_cap(pci_dev, id, &bar, &offset, &len))
> +	if (!virtio_pci_find_shm_cap(vdev, pci_dev, id, &bar, &offset, &len, &page_size))
>  		return false;
>  
>  	phys_addr = pci_resource_start(pci_dev, bar);
> @@ -865,7 +877,7 @@ static bool vp_get_shm_region(struct virtio_device *vdev,
>  
>  	region->len = len;
>  	region->addr = (u64) phys_addr + offset;
> -	region->page_size = 4096;
> +	region->page_size = page_size;
>  
>  	return true;
>  }
> diff --git a/include/uapi/linux/virtio_pci.h b/include/uapi/linux/virtio_pci.h
> index 8549d4571257142ac6c9dad5c01369923791a85a..1a76df52b4eccf548df78a8ee7d3a04591f55522 100644
> --- a/include/uapi/linux/virtio_pci.h
> +++ b/include/uapi/linux/virtio_pci.h
> @@ -127,7 +127,8 @@ struct virtio_pci_cap {
>  	__u8 cfg_type;		/* Identifies the structure. */
>  	__u8 bar;		/* Where to find it. */
>  	__u8 id;		/* Multiple capabilities of the same type */
> -	__u8 padding[2];	/* Pad to full dword. */
> +	__u8 page_shift;	/* Page shift for VIRTIO_PCI_CAP_SHARED_MEMORY_CFG. */
> +	__u8 padding[1];	/* Pad to full dword. */
>  	__le32 offset;		/* Offset within bar. */
>  	__le32 length;		/* Length of the structure, in bytes. */
>  };
> 

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
