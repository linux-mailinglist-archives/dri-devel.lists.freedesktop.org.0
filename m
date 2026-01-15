Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAC3D23DA9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 11:12:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A699410E731;
	Thu, 15 Jan 2026 10:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="bxaN1m3E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1880810E731
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 10:12:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768471942; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JMM9eHi7lYWkxDsFYe5i7wRig9Ijjr7ciIyE7Eg2vS4MX5ECEk/qadPMVfVD1OeQYwQ9rbIGJKrS8apb2F8sLbGsaLeK1C6w2xv8nnveCUJF/qc0RpioOtQfcK1PFAI8Kh/v5CF5+U5NV8mvHhzh3mreKdt8RVifw9hfJyj39K0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768471942;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=HBO1BqypUQt71ZpPQagz3HDzPvmRARCaYIuYNm9smIo=; 
 b=Tcy1ki/XxLX6HpVBgu2KVNaS3ZrrtiAWTVwzrAO86ahkofMa1XMA5rqGK0ThhybDElpAaHKVcoNE3cBaVDtDF3m+wEzktNPI+rjmsapNX8PbR0Nu/CZUH+r1fdtfhJ9kiaBPyUDN/K4vLVafGq9JNAJnwClNcquzWDi3pkNAQyY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768471942; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=HBO1BqypUQt71ZpPQagz3HDzPvmRARCaYIuYNm9smIo=;
 b=bxaN1m3EhWROrhfF+tD10WfBjd60mUzE2kI9L/tQp572AdD7wu1KeA9ruCE/xKWQ
 qKd//HwQCK4qT3HLq2JQHMgHdjFwOi/CFXuaZUCtv4dZyzUvlNDPuG7hn8ydpR44KqM
 PwJB7pg8D1Wl46Y1Ge4hcvZImIq9yjvKGZEe6CUs=
Received: by mx.zohomail.com with SMTPS id 1768471940586299.03631657866254;
 Thu, 15 Jan 2026 02:12:20 -0800 (PST)
Message-ID: <88f6b45d-64e9-49d3-9480-c85b8636f339@collabora.com>
Date: Thu, 15 Jan 2026 13:12:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] drm/virtio: Add sysfb restore on probe failure
To: Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251229215906.3688205-1-zack.rusin@broadcom.com>
 <20251229215906.3688205-6-zack.rusin@broadcom.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20251229215906.3688205-6-zack.rusin@broadcom.com>
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

On 12/30/25 00:58, Zack Rusin wrote:
> Register a devm action on the virtio device to restore the system
> framebuffer (efifb/simpledrm) if the driver's probe fails after
> removing the firmware framebuffer.
> 
> Unlike PCI drivers, virtio-gpu cannot use the
> devm_aperture_remove_conflicting_pci_devices() helper because the
> PCI device is managed by the virtio-pci driver, not by virtio-gpu.
> When virtio-gpu probe fails, the PCI device remains bound to
> virtio-pci, so devm actions registered on the PCI device won't fire.
> 
> Instead, register the sysfb restore action on the virtio device
> (&vdev->dev) which will be released if virtio-gpu probe fails.
> Cancel the action after successful probe since the driver is now
> responsible for display output.
> 
> This only applies to VGA devices where aperture_remove_conflicting_pci_devices()
> is called to remove the firmware framebuffer.
> 
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> Cc: David Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Gurchetan Singh <gurchetansingh@chromium.org>
> Cc: Chia-I Wu <olvaffe@gmail.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: virtualization@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c | 29 ++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index a5ce96fb8a1d..13cc8396fc78 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -30,6 +30,7 @@
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/poll.h>
> +#include <linux/sysfb.h>
>  #include <linux/vgaarb.h>
>  #include <linux/wait.h>
>  
> @@ -52,6 +53,11 @@ static int virtio_gpu_modeset = -1;
>  MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
>  module_param_named(modeset, virtio_gpu_modeset, int, 0400);
>  
> +static void virtio_gpu_restore_sysfb(void *unused)
> +{
> +	sysfb_restore();
> +}
> +
>  static int virtio_gpu_pci_quirk(struct drm_device *dev)
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev->dev);
> @@ -75,6 +81,7 @@ static int virtio_gpu_probe(struct virtio_device *vdev)
>  {
>  	struct drm_device *dev;
>  	int ret;
> +	bool sysfb_restore_registered = false;
>  
>  	if (drm_firmware_drivers_only() && virtio_gpu_modeset == -1)
>  		return -EINVAL;
> @@ -97,6 +104,21 @@ static int virtio_gpu_probe(struct virtio_device *vdev)
>  		ret = virtio_gpu_pci_quirk(dev);
>  		if (ret)
>  			goto err_free;
> +
> +		/*
> +		 * For VGA devices, register sysfb restore on the virtio device.
> +		 * We can't use devm_aperture_remove_conflicting_pci_devices()
> +		 * because the PCI device is managed by virtio-pci, not us.
> +		 * Register on &vdev->dev so it fires if our probe fails.
> +		 */
> +		if (pci_is_vga(to_pci_dev(vdev->dev.parent))) {
> +			ret = devm_add_action_or_reset(&vdev->dev,
> +						       virtio_gpu_restore_sysfb,
> +						       NULL);
> +			if (ret)
> +				goto err_free;
> +			sysfb_restore_registered = true;
> +		}
>  	}
>  
>  	dma_set_max_seg_size(dev->dev, dma_max_mapping_size(dev->dev) ?: UINT_MAX);
> @@ -110,6 +132,13 @@ static int virtio_gpu_probe(struct virtio_device *vdev)
>  
>  	drm_client_setup(vdev->priv, NULL);
>  
> +	/*
> +	 * Probe succeeded - cancel sysfb restore. We're now responsible
> +	 * for display output.
> +	 */
> +	if (sysfb_restore_registered)
> +		devm_remove_action(&vdev->dev, virtio_gpu_restore_sysfb, NULL);
> +
>  	return 0;
>  
>  err_deinit:

Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

