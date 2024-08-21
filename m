Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 705CA959828
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 12:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3177C10E409;
	Wed, 21 Aug 2024 10:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fHiDdfDh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95DE10E409
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 10:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724237209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NnDQPRlHUu+m1MVYxJps7H8/jGul4yAKMhgTwsJQD7E=;
 b=fHiDdfDh5nKlxjQ0UsEAnJWsTgMIj59TnTQtuWjmelkYf84llOJRl+dZQp4WF34qo95IEC
 uBbLWu4BvOpczsSB8r56lKulOMiYka3YUU742kyot9fA5mT4bDWzdr20KYZouKged8tJDo
 Nueh2bBaF/RUVm57FekaF3dxvBC6qQ4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-1F5n2u2jOYGanqef0Xzclw-1; Wed,
 21 Aug 2024 06:46:47 -0400
X-MC-Unique: 1F5n2u2jOYGanqef0Xzclw-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AE9551954B31; Wed, 21 Aug 2024 10:46:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.20])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CCA491955F6E; Wed, 21 Aug 2024 10:46:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6B04918011E8; Wed, 21 Aug 2024 12:46:42 +0200 (CEST)
Date: Wed, 21 Aug 2024 12:46:42 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: David Airlie <airlied@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 virtualization@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 2/2] drm/virtio: Fix host color format for big endian
 guests
Message-ID: <6ucdrw6nci2bbcw5fcwr34iisbweoety7w6f3ptfzrbqzr45ye@ys3knpm3o43h>
References: <20240820090908.151042-1-jfalempe@redhat.com>
 <20240820090908.151042-2-jfalempe@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20240820090908.151042-2-jfalempe@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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

On Tue, Aug 20, 2024 at 11:07:41AM GMT, Jocelyn Falempe wrote:
> The colors are inverted when testing a s390x VM on a s390x host.
> Changing the conversion from DRM_FORMAT -> VIRTIO_GPU_FORMAT on big
> endian guests fixes the colors. But it may break big-endian guest on
> little-endian host. In this case, the fix should be in qemu, because
> the host endianess is not known in the guest VM.
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
> index 860b5757ec3fc..0ec6ecc96eb13 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> @@ -37,16 +37,24 @@ static const uint32_t virtio_gpu_cursor_formats[] = {
>  	DRM_FORMAT_ARGB8888,
>  };
>  
> +#ifdef __BIG_ENDIAN
> +#define VIRTIO_GPU_HOST_XRGB8888 VIRTIO_GPU_FORMAT_X8R8G8B8_UNORM
> +#define VIRTIO_GPU_HOST_ARGB8888 VIRTIO_GPU_FORMAT_A8R8G8B8_UNORM
> +#else
> +#define VIRTIO_GPU_HOST_XRGB8888 VIRTIO_GPU_FORMAT_B8G8R8X8_UNORM
> +#define VIRTIO_GPU_HOST_ARGB8888 VIRTIO_GPU_FORMAT_B8G8R8A8_UNORM
> +#endif

VIRTIO_GPU_FORMAT_* is little endian (like DRM_FORMAT_*), there should
be no need to do anything byte order specific here.  This looks like you
are papering over a bug somewhere else.

take care,
  Gerd

