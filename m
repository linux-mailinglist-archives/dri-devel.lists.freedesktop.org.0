Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4533C556A5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 03:20:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B7810E111;
	Thu, 13 Nov 2025 02:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Ykx6cwph";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDA210E111
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 02:20:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763000430; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Fsnr9vZ5NGrdP8x/dqCqh3iOzrS213gfxHn23mHhelONJvn7foNpXlzeHKxvxX/FOCMpG3tfxit8geZeiDi6C4ePmzp4Vwuj4b/Hywcb28qrtBwCCo9MiYj7N0hgVxE65jMC9wwodDXy7kTKVtX+kXrh/40dvgmiAE4NWTqmy4I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1763000430;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=mqbuiA6KomhjuHhIUVCCeKDvtezWgMjIt+vfJaSlA9M=; 
 b=LFKKKW4HxofqGNOe77SPsABG3PsoZykfocEmr19x1tEMQeqnHQCFfdtB+YzZgRUFeudwSRj45aVmkcRZ0cYza03h9qvOW/7fCwJj9IyGZFxdpNUnlM8aEWBn2eoovilD43+arr+Uu9TcCrNPTNjSLaRbAw65oRKCKrDMhN9yw9o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763000430; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=mqbuiA6KomhjuHhIUVCCeKDvtezWgMjIt+vfJaSlA9M=;
 b=Ykx6cwph64ihkasvXdZAt5C9ZxEisXM1VhJPJBMryvm1kFToEgnNDoCLD2Z2Uj9+
 1qhWBNL1dDP7AUfVB7JnO7NdOkGNnJt9p7niAap1JGKrWfepYAu23M2k8uC/lYLqgEe
 UoCaNOCLnGiSAFAAc+Kbsqa1O/Ia2QUpiSxemGQM=
Received: by mx.zohomail.com with SMTPS id 1763000427524775.8518137767941;
 Wed, 12 Nov 2025 18:20:27 -0800 (PST)
Message-ID: <77d96772-9518-4a60-a258-4bf58bf576ff@collabora.com>
Date: Thu, 13 Nov 2025 05:20:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/virtio: honor blob_alignment requirements
To: Sergio Lopez <slp@redhat.com>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251110125213.12633-1-slp@redhat.com>
 <20251110125213.12633-3-slp@redhat.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20251110125213.12633-3-slp@redhat.com>
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

On 11/10/25 15:52, Sergio Lopez wrote:
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index e6363c887500..6118344bff84 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -246,8 +246,10 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>  		if (params->blob_mem == VIRTGPU_BLOB_MEM_GUEST)
>  			bo->guest_blob = true;
>  
> -		virtio_gpu_cmd_resource_create_blob(vgdev, bo, params,
> -						    ents, nents);
> +		ret = virtio_gpu_cmd_resource_create_blob(vgdev, bo, params,
> +							  ents, nents);
> +		if (ret)
> +			goto err_put_objs;

Isn't it impossible for host to import guest blob when HOST_PAGE_SIZE >
GUEST_PAGE_SIZE?

-- 
Best regards,
Dmitry
