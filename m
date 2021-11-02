Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9DD442ED1
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 14:07:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950B86FD49;
	Tue,  2 Nov 2021 13:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A166FD49
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 13:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635858457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x5n86OvPaV2H1NZKCrF2kbcvYUIActOIda1CNrZjv7E=;
 b=inZBXzIiMRXFsVVRMI2pPHx4r9yf9OYTOZCLRa1hWTUs4wCPg7A2xAdXEr2V86o0KMRy52
 LkNdM8J7eVHjTPw6dgcCJxAlO1DKoXsroJyIEyfYy3L33t7kSVupUY8VzKy6Xuotrof6ga
 K4L7B8F+xRfkGmdXdSSSh2gGXKmgHd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-ZdzVCAWGMsOup90M0epPaw-1; Tue, 02 Nov 2021 09:03:14 -0400
X-MC-Unique: ZdzVCAWGMsOup90M0epPaw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D358F100C666;
 Tue,  2 Nov 2021 13:03:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8021567846;
 Tue,  2 Nov 2021 13:03:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 69FBE180092D; Tue,  2 Nov 2021 14:03:08 +0100 (CET)
Date: Tue, 2 Nov 2021 14:03:08 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Maksym Wezdecki <maksym.wezdecki@collabora.com>
Subject: Re: [PATCH] drm/virtio: delay pinning the pages till first use
Message-ID: <20211102130308.2s64ghmic5nhj6vu@sirius.home.kraxel.org>
References: <20211102113139.154140-1-maksym.wezdecki@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20211102113139.154140-1-maksym.wezdecki@collabora.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: David Airlie <airlied@linux.ie>, mwezdeck <maksym.wezdecki@collabora.co.uk>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 02, 2021 at 12:31:39PM +0100, Maksym Wezdecki wrote:
> From: mwezdeck <maksym.wezdecki@collabora.co.uk>
> 
> The idea behind the commit:
>   1. not pin the pages during resource_create ioctl
>   2. pin the pages on the first use during:
> 	- transfer_*_host ioctl
>         - map ioctl

i.e. basically lazy pinning.  Approach looks sane to me.

>   3. introduce new ioctl for pinning pages on demand

What is the use case for this ioctl?
In any case this should be a separate patch.

> +	struct virtio_gpu_object_array *objs;
> +	struct virtio_gpu_object *bo;
> +	struct virtio_gpu_object_shmem *shmem;
> +
> +	objs = virtio_gpu_array_from_handles(file, &virtio_gpu_map->handle, 1);
> +	if (objs == NULL)
> +		return -ENOENT;
> +
> +	bo = gem_to_virtio_gpu_obj(objs->objs[0]);
> +	if (bo == NULL)
> +		return -ENOENT;
> +	
> +	shmem = to_virtio_gpu_shmem(bo);
> +	if (shmem == NULL)
> +		return -ENOENT;
> +
> +	if (!shmem->pages) {
> +		virtio_gpu_object_pin(vgdev, objs, 1);
> +	}

Move this into virtio_gpu_object_pin(),
or create a helper function for it ...

> +	objs = virtio_gpu_array_from_handles(file, &virtio_gpu_pin->handle, 1);
> +	if (objs == NULL)
> +		return -ENOENT;
> +
> +	bo = gem_to_virtio_gpu_obj(objs->objs[0]);
> +	if (bo == NULL)
> +		return -ENOENT;
> +	
> +	shmem = to_virtio_gpu_shmem(bo);
> +	if (shmem == NULL)
> +		return -ENOENT;
> +
> +	if (!shmem->pages) {
> +		return virtio_gpu_object_pin(vgdev, objs, 1);
> +	}

... to avoid this code duplication?

> +int virtio_gpu_object_pin(struct virtio_gpu_device *vgdev,
> +			  struct virtio_gpu_object_array *objs,
> +			  int num_gem_objects)
> +{
> +	int i, ret;
> +
> +	for (i = 0; i < num_gem_objects; i++) {

> +		ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
> +		if (ret != 0) {
> +			return -EFAULT;
> +		}
> +
> +		virtio_gpu_object_attach(vgdev, bo, ents, nents);

I think it is enough to do the virtio_gpu_object_attach() call lazily.
virtio_gpu_object_shmem_init() should not actually allocate pages, that
only happens when virtio_gpu_object_attach() goes ask for a scatter
list.

take care,
  Gerd

