Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B13C1447FF2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 13:57:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9676E07D;
	Mon,  8 Nov 2021 12:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E7F26E07D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 12:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636376221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7O6cRcMrF9zQVN5zCwyfJokZI5v++bhQ0HPjBpmxWt8=;
 b=LSN6h6xbiSkRkrJx15CyS2GggOuuprl9c8UwpliUYrFB3DMWfy1nnem5UJucGC4LdC4RCg
 +atWV3/OmzaFPlUwRzfZLnUl201RQVzSjsGduNHtUA9Z8jB3ucZoiqaktv9dzfKg35kLRC
 nUISvwQa3/QlR/onOp4eS9mPBn+1vag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-xtppSNRzMRu46ATOzIjwUQ-1; Mon, 08 Nov 2021 07:56:59 -0500
X-MC-Unique: xtppSNRzMRu46ATOzIjwUQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B655210151E5;
 Mon,  8 Nov 2021 12:56:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CB105C1A1;
 Mon,  8 Nov 2021 12:56:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 910C3180308F; Mon,  8 Nov 2021 13:56:56 +0100 (CET)
Date: Mon, 8 Nov 2021 13:56:56 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH] drm/virtio: Fix NULL dereference error in virtio_gpu_poll
Message-ID: <20211108125656.pnfapn2xqz7ijbx2@sirius.home.kraxel.org>
References: <15731ad7-83ff-c7ef-e4a1-8b11814572c2@xenosoft.de>
 <20211104214249.1802789-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20211104214249.1802789-1-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
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
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 04, 2021 at 02:42:49PM -0700, Vivek Kasireddy wrote:
> When virgl is not enabled, vfpriv pointer would not be allocated.
> Therefore, check for a valid value before dereferencing.
> 
> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Cc: Gurchetan Singh <gurchetansingh@chromium.org>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index 749db18dcfa2..d86e1ad4a972 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -163,10 +163,11 @@ static __poll_t virtio_gpu_poll(struct file *filp,
>  	struct drm_file *drm_file = filp->private_data;
>  	struct virtio_gpu_fpriv *vfpriv = drm_file->driver_priv;
>  	struct drm_device *dev = drm_file->minor->dev;
> +	struct virtio_gpu_device *vgdev = dev->dev_private;
>  	struct drm_pending_event *e = NULL;
>  	__poll_t mask = 0;
>  
> -	if (!vfpriv->ring_idx_mask)
> +	if (!vgdev->has_virgl_3d || !vfpriv || !vfpriv->ring_idx_mask)
>  		return drm_poll(filp, wait);
>  
>  	poll_wait(filp, &drm_file->event_wait, wait);

Pushed to drm-misc-next-fixes.

thanks,
  Gerd

