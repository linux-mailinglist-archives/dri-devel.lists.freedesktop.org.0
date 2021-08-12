Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 464B33EA517
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 15:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE786E3F2;
	Thu, 12 Aug 2021 13:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1EA16E3F2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 13:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628773387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DKpf/0+DIYzPA8g/kIfiTfdbDVBDOHdhW43GSvoV9v0=;
 b=bzrK7LRnEqAYxbY/jQ19rRffBI1OBjKXANbye0YjtD7vbi0pFuSCnPxfKzdg/RyeLLtkta
 TRArVq206c95DGFpxxYnE0kna/dmF3Cj4xgPyAV27quq+iJU0BSE9I+nei82z2kRd4MNJv
 D7Uhc0PDGVwZtJAwZOpJGsaQV70XkIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-tHAJUioaN32GX5LAx_vbFg-1; Thu, 12 Aug 2021 09:03:06 -0400
X-MC-Unique: tHAJUioaN32GX5LAx_vbFg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B33A71B2C997;
 Thu, 12 Aug 2021 13:03:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CAA5669ED;
 Thu, 12 Aug 2021 13:03:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D111D1800922; Thu, 12 Aug 2021 15:03:03 +0200 (CEST)
Date: Thu, 12 Aug 2021 15:03:03 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: David Stevens <stevensd@chromium.org>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/virtio: support mapping exported vram
Message-ID: <20210812130303.jymu3tkhfmn6xvm5@sirius.home.kraxel.org>
References: <20210716035501.3099919-1-stevensd@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20210716035501.3099919-1-stevensd@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> +static struct sg_table *virtgpu_gem_map_dma_buf(
> +		struct dma_buf_attachment *attach,
> +		enum dma_data_direction dir)

checkpatch doesn't like that:

-:47: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#47: FILE: drivers/gpu/drm/virtio/virtgpu_prime.c:46:
+static struct sg_table *virtgpu_gem_map_dma_buf(

> +{
> +	struct drm_gem_object *obj = attach->dmabuf->priv;
> +	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
> +
> +	if (virtio_gpu_is_vram(bo))
> +		return virtio_gpu_vram_map_dma_buf(bo, attach->dev, dir);
> +
> +	return drm_gem_map_dma_buf(attach, dir);
> +}
> +
> +static void virtgpu_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
> +				      struct sg_table *sgt,
> +				      enum dma_data_direction dir)
> +{
> +	struct drm_gem_object *obj = attach->dmabuf->priv;
> +	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
> +
> +	if (virtio_gpu_is_vram(bo))
> +		virtio_gpu_vram_unmap_dma_buf(attach->dev, sgt, dir);
> +	else
> +		drm_gem_unmap_dma_buf(attach, sgt, dir);
> +}

Minor nit:  Can we use the same logic in both functions?  I like the
virtgpu_gem_map_dma_buf variant (without else) more.

Otherwise looks sane to me.

thanks,
  Gerd

