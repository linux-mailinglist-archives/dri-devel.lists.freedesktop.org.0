Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EAF95C604
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 09:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5464110EC1A;
	Fri, 23 Aug 2024 07:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FPibXLKn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC0D10EC1A
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 07:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724396665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pDT0JRgI2md7crLLm9P6/RlRyF91EoM9zgMo2dMluV0=;
 b=FPibXLKn+4TYn6YzxIJQipgRrJqwuiV7PwRCnD1QX5xXa5+sUIJ24itO265S230Tyv6mNt
 Q/ScUO4zp26GlEJ/Fp4EZ/kbKmV+xJIdJ7BmD7Wu0JtXHoSGJD/3upYBoJZfi+ArLUPraE
 dH2rL4Eotf1zpRG4tFObXmzfhNgp4mc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-583-fg5V0--HM5aejzr-tRIEmA-1; Fri,
 23 Aug 2024 03:04:22 -0400
X-MC-Unique: fg5V0--HM5aejzr-tRIEmA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3EC701955D4A; Fri, 23 Aug 2024 07:04:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.20])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CDCCE19560A3; Fri, 23 Aug 2024 07:04:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 84F001800629; Fri, 23 Aug 2024 09:04:16 +0200 (CEST)
Date: Fri, 23 Aug 2024 09:04:16 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: David Airlie <airlied@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, 
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev
Subject: Re: [PATCH 1/2] drm/virtio: Defer the host dumb buffer creation
Message-ID: <mlqofcqa2yki43bkcl2kq6wfwchmkisnybbadd32khln5tv4ux@u4xuf6gumcqa>
References: <20240822172338.698922-1-jfalempe@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20240822172338.698922-1-jfalempe@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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

> +static void virtio_gpu_deferred_create(struct virtio_gpu_object *bo,
> +				       struct virtio_gpu_device *vgdev,
> +				       const struct drm_mode_fb_cmd2 *mode_cmd)
> +{
> +	struct virtio_gpu_object_params params = { 0 };
> +
> +	params.format = virtio_gpu_translate_format(mode_cmd->pixel_format);
> +	params.width = mode_cmd->width;
> +	params.height = mode_cmd->height;
> +	params.size = params.height * params.width * 4;
> +	params.size = ALIGN(params.size, PAGE_SIZE);
> +	params.dumb = true;

I'd suggest to simply store the complete virtio_gpu_object_params struct
in virtio_gpu_object instead of re-creating it here.

> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 64c236169db88..8d1e8dcfa8c15 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -93,6 +93,9 @@ struct virtio_gpu_object {
>  	bool dumb;
>  	bool created;
>  	bool host3d_blob, guest_blob;
> +	bool deferred;
> +	struct virtio_gpu_mem_entry *ents;
> +	unsigned int nents;
>  	uint32_t blob_mem, blob_flags;

Put them into a new block separated by newline, add a comment saying
those are needed for virtio_gpu_deferred_create?

> @@ -229,9 +231,14 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>  						  objs, fence);
>  		virtio_gpu_object_attach(vgdev, bo, ents, nents);
>  	} else {
> -		virtio_gpu_cmd_create_resource(vgdev, bo, params,
> -					       objs, fence);
> -		virtio_gpu_object_attach(vgdev, bo, ents, nents);
> +		/* Fence is used only with blob or virgl */
> +		WARN_ONCE(fence != NULL, "deferred doesn't support fence\n");

Additionally check for param->dumb to take the deferred code path?  That
should make sure there is no fence.

take care,
  Gerd

