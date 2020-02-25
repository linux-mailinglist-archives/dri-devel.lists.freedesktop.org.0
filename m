Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8ED16B985
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 07:15:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180EC6E0F4;
	Tue, 25 Feb 2020 06:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05286E0F4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 06:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582611345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hDZAej/jLK8gD+nYYr2L2sjjutU8DKWcsuwzak4gi7I=;
 b=YAXD9h8NSXonazapfa/pUr7rP+lyz88/GPyRKnBhFmAigbY0onCsQ4MFxUu29tAwy0DlpF
 PsSiqaNyfRxO/e1Hll1FSPmAwDuK4IdJk9HdV/b+Cyb0D928S6JjAT7v5xEtAMvZByEJKN
 R0qieby+aNVQl5xDplBygN/zHbFWlm4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-2nRtSc6BMcuaowpCU87-3A-1; Tue, 25 Feb 2020 01:15:43 -0500
X-MC-Unique: 2nRtSc6BMcuaowpCU87-3A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 281051005512;
 Tue, 25 Feb 2020 06:15:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-87.ams2.redhat.com
 [10.36.116.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42A105D9CD;
 Tue, 25 Feb 2020 06:15:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7CFCF1747F; Tue, 25 Feb 2020 07:15:38 +0100 (CET)
Date: Tue, 25 Feb 2020 07:15:38 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH 2/2] drm/virtio: Support virtgpu exported resources
Message-ID: <20200225061538.2qlkhfbhv2pl3oku@sirius.home.kraxel.org>
References: <20200219080637.61312-1-stevensd@chromium.org>
 <20200219080637.61312-3-stevensd@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219080637.61312-3-stevensd@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: virtio-dev@lists.oasis-open.org, "Michael S . Tsirkin" <mst@redhat.com>,
 David Airlie <airlied@linux.ie>, Jason Wang <jasowang@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> +struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
> +					 int flags)
> +{
[ ... ]
> +}
> +
> +struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
> +						struct dma_buf *buf)
> +{
[ ... ]
> +}

More code duplication.

> diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
> index 0c85914d9369..9c428ef03060 100644
> --- a/include/uapi/linux/virtio_gpu.h
> +++ b/include/uapi/linux/virtio_gpu.h

API change should go to a separate patch.

> +/*
> + * VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID
> + */
> +#define VIRTIO_GPU_F_CROSS_DEVICE        2

Hmm, how about VIRTIO_GPU_F_RESOURCE_UUID ?

> @@ -87,6 +92,7 @@ enum virtio_gpu_ctrl_type {
>  	VIRTIO_GPU_RESP_OK_CAPSET_INFO,
>  	VIRTIO_GPU_RESP_OK_CAPSET,
>  	VIRTIO_GPU_RESP_OK_EDID,
> +	VIRTIO_GPU_RESP_OK_RESOURCE_ASSIGN_UUID,

The "assign" doesn't make sense in the reply.  I'd name that
VIRTIO_GPU_RESP_OK_RESOURCE_UUID or just VIRTIO_GPU_RESP_OK_UUID,

> +/* VIRTIO_GPU_RESP_OK_RESOURCE_ASSIGN_UUID */
> +struct virtio_gpu_resp_resource_assign_uuid {
> +	struct virtio_gpu_ctrl_hdr hdr;
> +	__u8 uuid[16];
> +};

Same here.

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
