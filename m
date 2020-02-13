Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E21815CABE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 19:54:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA006F624;
	Thu, 13 Feb 2020 18:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187E06F624
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 18:54:33 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id s18so5906191iln.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 10:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bRoElX6JuGSJIj1nzDEkGjFX2yatSmfvyb68/4mK0og=;
 b=KuFXWeFq0mYsucnXtEil4E8uJ/Xi9I8NFtS2D8Nq96ybHLSqVX3cFY/M54teo+zphX
 8Q+vqenQIgFsq8dmQMXw3ZmpsdTUAwPivpn+7DoDNxs33VG0bt4EL4MZs0CaLxuCCLQC
 BvDCnlVtrNTMZosO8DIxQVYaG1bHk04W/CfOjWw0T26357uN55rpZ+etDHcZAOfWgF3y
 PkKoBqpCWGE4usla6USJnXEklQP99luo5rprwn5EvvXoKO6HURlR+gMQJlQ/HNas5q7g
 iuefhdaHNMK9XZkv7BVrGXJNMutQvtTgtkimqb5M0PlEZbHRmiy9DPXnQohL6Qkm4NYw
 B8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bRoElX6JuGSJIj1nzDEkGjFX2yatSmfvyb68/4mK0og=;
 b=XpE/hdh2sQ/Ak17pyREVtnQszo1MWP3HBFZMujM4YbdtRMF21U8o/pHEbwVKbu+kmg
 oxNWTxwgsaUkm+/c3FH9sqh7xeqq9In9zSfvOFnpF2H2aShzyVOFLespASwqHYgIl13K
 ssLVwr96s1qEkkSFwI46jM9DRgHB8fZLszDv6UW1lAnB0+V7hqYYKGv2L04m+oGQwbGZ
 wCf7lbfjGEdvc0GfVZ+LXUBqeRWZ3uyEhmNp3mUFIhe0fAxMfLH6vnnXmX+svsitYj+a
 AfixV2yQmNpeuNQMv6J4knuy2QtPdh/p+nSYUG7lYKtTrx5agJsXeiV+Fo5cv8zsYz9X
 K9Cw==
X-Gm-Message-State: APjAAAUm+S/BWt8iPUvqlgmxy3nxW9GYTy6s2z5A4R7Wc41y5qPxbvWX
 PfC2N/uRqPxvr+hiKrP/3w1lsqRTm4OYxQfdPTo=
X-Google-Smtp-Source: APXvYqx18+9TYWouF+4cCT1KAMj8Zzdhy8YqKGILwwfJrRQPAlQk3MAbpmKQbgGXEpXBEPCMFAe+q5YqXY1DKL8W66k=
X-Received: by 2002:a92:9ac5:: with SMTP id c66mr18208254ill.232.1581620072485; 
 Thu, 13 Feb 2020 10:54:32 -0800 (PST)
MIME-Version: 1.0
References: <20200213132203.23441-1-kraxel@redhat.com>
 <20200213132203.23441-4-kraxel@redhat.com>
In-Reply-To: <20200213132203.23441-4-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 13 Feb 2020 10:54:21 -0800
Message-ID: <CAPaKu7TgvBtgPuJaeesCUP4zxDOO=xxtun48P=bT0VBF4-dNFg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] drm/virtio: batch resource creation
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 13, 2020 at 5:22 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Move virtio_gpu_notify() to higher-level functions for
> virtio_gpu_cmd_create_resource(), virtio_gpu_cmd_resource_create_3d()
> and virtio_gpu_cmd_resource_attach_backing().
>
> virtio_gpu_object_create() will batch commands and notify only once when
> creating a resource.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_object.c | 1 +
>  drivers/gpu/drm/virtio/virtgpu_vq.c     | 3 ---
>  2 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index 8870ee23ff2b..65d6834d3c74 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -224,6 +224,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>                 return ret;
The virtqueue might become full without ever being notified on errors.
We should notify on errors, or better yet, virtio_gpu_queue_ctrl_sgs
should notify before waiting.


>         }
>
> +       virtio_gpu_notify(vgdev);
>         *bo_ptr = bo;
>         return 0;
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index 9d4ca0fafa5f..778b7acf2f7f 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -514,7 +514,6 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
>         cmd_p->height = cpu_to_le32(params->height);
>
>         virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
> -       virtio_gpu_notify(vgdev);
>         bo->created = true;
>  }
>
> @@ -643,7 +642,6 @@ virtio_gpu_cmd_resource_attach_backing(struct virtio_gpu_device *vgdev,
>         vbuf->data_size = sizeof(*ents) * nents;
>
>         virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
> -       virtio_gpu_notify(vgdev);
>  }
>
>  static void virtio_gpu_cmd_get_display_info_cb(struct virtio_gpu_device *vgdev,
> @@ -1010,7 +1008,6 @@ virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
>         cmd_p->flags = cpu_to_le32(params->flags);
>
>         virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
> -       virtio_gpu_notify(vgdev);
>
>         bo->created = true;
>  }
> --
> 2.18.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
