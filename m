Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90081677D57
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 15:00:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E51610E499;
	Mon, 23 Jan 2023 14:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FC010E499
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 14:00:46 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3F002D9;
 Mon, 23 Jan 2023 15:00:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674482445;
 bh=U4yb+8cDXDgj8BhmM9epd1Tu+axcS8mTstrARnltOj8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NKgYiAT1ADsuvzALI1LW26Rc8OpRcKiQnn41FmbNAizL6FiDNEFXrSlymvbo3qeSD
 KdPnm6Qq2UjcqlNuqHp2tO8JVOpWcfQdXbq0c8+PGeM6pdY+sntRh6PfydqLo62/FC
 v9MxTa33ZrTQtYw6WrUIyFLie/vqqDAqjMlaYGB0=
Date: Mon, 23 Jan 2023 16:00:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/2] media: uvcvideo: expose dma-heap hint to userspace
Message-ID: <Y86TCFUYsWdDNDPP@pendragon.ideasonboard.com>
References: <20230123123756.401692-1-christian.koenig@amd.com>
 <20230123123756.401692-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230123123756.401692-3-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, sebastian.wick@redhat.com,
 labbott@redhat.com, benjamin.gaignard@collabora.com,
 linux-media@vger.kernel.org, mchehab@kernel.org, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, nicolas@ndufresne.ca, hverkuil@xs4all.nl,
 jstultz@google.com, lmark@codeaurora.org, tfiga@chromium.org,
 sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

Thank you for the patch.

On Mon, Jan 23, 2023 at 01:37:56PM +0100, Christian König wrote:
> Expose an indicator to let userspace know from which dma_heap
> to allocate for buffers of this device.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index e4bcb5011360..b247026b68c5 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <linux/atomic.h>
> +#include <linux/dma-heap.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/kernel.h>
>  #include <linux/list.h>
> @@ -1909,6 +1910,8 @@ static void uvc_unregister_video(struct uvc_device *dev)
>  
>  	if (dev->vdev.dev)
>  		v4l2_device_unregister(&dev->vdev);
> +	dma_heap_remove_device_link(&dev->udev->dev);
> +

Could we avoid having to call this explicitly in drivers, possibly using
devres in dma_heap_create_device_link() ?

>  #ifdef CONFIG_MEDIA_CONTROLLER
>  	if (media_devnode_is_registered(dev->mdev.devnode))
>  		media_device_unregister(&dev->mdev);
> @@ -2181,6 +2184,14 @@ static int uvc_probe(struct usb_interface *intf,
>  			 dev->uvc_version >> 8, dev->uvc_version & 0xff);
>  	}
>  
> +	/*
> +	 * UVC exports DMA-buf buffers with dirty CPU caches. For compatibility
> +	 * with device which can't snoop the CPU cache it's best practice to
> +	 * allocate DMA-bufs from the system DMA-heap.
> +	 */
> +	if (dma_heap_create_device_link(&dev->udev->dev, "system"))

I don't think this is the right device. A UVC device is usually a
composite USB device with an audio (UAC) function in addition to UVC,
and that may require a different heap (at least conceptually). Wouldn't
the video_device be a better candidate to expose the link ? This would
create a race condition though, as the link will be created after
userspace gets notified of the device being available.

> +		goto error;
> +
>  	/* Register the V4L2 device. */
>  	if (v4l2_device_register(&intf->dev, &dev->vdev) < 0)
>  		goto error;

-- 
Regards,

Laurent Pinchart
