Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F811552BC
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 08:07:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EEF26E93B;
	Fri,  7 Feb 2020 07:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD226E93B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 07:07:39 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id d15so1105906iog.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 23:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fi9cuRdVpZSgrmjmcTsmxSYXnkK56wSAD8cgkFXFjqY=;
 b=GOZQ9nPFOSdqbLte2pDbaMgNEktQIGYkllAIVa6/gEXHF4fO2T7owOkENGAxg3H/V9
 JceazaFr86ZPcqZJCbYW/dz5qU6Oy2fbCJqtMIoYXY026tA6+rFXDlWu/nWH+/63mW5F
 77N6jmyap2Kbs9NPxAGGn5J3sj/xdMfV1zUmlRmC/aWu1EhJMlKsRmAPAe4B8/91nKpr
 gyTR/ACgn3VYQr9db2O4iwLgIDLBgCIbRcQxiOSI+IGkpAz3xmjVO5+6Sqc9fI6hBeZA
 Y7XOZMltEmSnLebh7rgWjpEUxSxu5sfPPy9YJ5o/710XH+4C9eGFPPOK7haF2FUkYiyV
 n54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fi9cuRdVpZSgrmjmcTsmxSYXnkK56wSAD8cgkFXFjqY=;
 b=bkHAmJOE/wCSaAMlk72hof3bYK+mdkNha2MXQf5YQaxkvzceRVnczwaVujBNynLsgQ
 gUMGoX7fpM3UAo9OBHUzdpbV3FsrHdKqaa4L8IlaDU9pgJhbX5OAxnOMyRA2lKHy1qsa
 +0EMzzcQqn/mG1DC4opN+s9X80ge7+o8UnDx9TE7qcWR4oqNE+PCm5qGKE+h353CO/HP
 1NxHLEfxRsQLx7uGGy6s++/vxqmT4exwfSiXtBMxecASDzaIDRTbn+RCG9LDbJ/1tyKO
 KmqeWU/0Q5jPPUc6qNBOTX1Xk8pqDk4A2D/w5iVIVndcZLXNFI3hxKO40bWvMRQS1cy1
 xe7A==
X-Gm-Message-State: APjAAAW/6HwuMH/J8SVginUcYU8p1lNf3kcXUSDmCoOILFpy2YtOdJWN
 mgc4f+JodXK/KOtRtO+G9GWDbJHETsqJoxwZ6is=
X-Google-Smtp-Source: APXvYqyL4U+Y0Qvy1rn26gr/Unt4Zgd8TMPUJc0YmKynNBNEurpRo3qS4nm7f8ue9KuxlLv4Y03l5JOkGB1DGCL+sPU=
X-Received: by 2002:a02:a14f:: with SMTP id m15mr1989018jah.16.1581059258769; 
 Thu, 06 Feb 2020 23:07:38 -0800 (PST)
MIME-Version: 1.0
References: <20200207064653.14403-1-kraxel@redhat.com>
In-Reply-To: <20200207064653.14403-1-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 6 Feb 2020 23:07:27 -0800
Message-ID: <CAPaKu7R25+P-wGdEy2PnPuukcRNSO1ai3hQKtOTSZEMOrwCL7g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/virtio: fix ring free check
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

On Thu, Feb 6, 2020 at 10:47 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> If the virtio device supports indirect ring descriptors we need only one
> ring entry for the whole command.  Take that into account when checking
> whenever the virtqueue has enough free entries for our command.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h     | 1 +
>  drivers/gpu/drm/virtio/virtgpu_debugfs.c | 1 +
>  drivers/gpu/drm/virtio/virtgpu_kms.c     | 3 +++
>  drivers/gpu/drm/virtio/virtgpu_vq.c      | 3 +++
>  4 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 7e69c06e168e..d278c8c50f39 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -193,6 +193,7 @@ struct virtio_gpu_device {
>
>         bool has_virgl_3d;
>         bool has_edid;
> +       bool has_indirect;
has_indirect_desc?  Either way,

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
>
>         struct work_struct config_changed_work;
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
> index 5156e6b279db..e27120d512b0 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
> @@ -47,6 +47,7 @@ static int virtio_gpu_features(struct seq_file *m, void *data)
>
>         virtio_add_bool(m, "virgl", vgdev->has_virgl_3d);
>         virtio_add_bool(m, "edid", vgdev->has_edid);
> +       virtio_add_bool(m, "indirect", vgdev->has_indirect);
>         virtio_add_int(m, "cap sets", vgdev->num_capsets);
>         virtio_add_int(m, "scanouts", vgdev->num_scanouts);
>         return 0;
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index 2f5773e43557..c1086df49816 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -159,6 +159,9 @@ int virtio_gpu_init(struct drm_device *dev)
>         if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_EDID)) {
>                 vgdev->has_edid = true;
>         }
> +       if (virtio_has_feature(vgdev->vdev, VIRTIO_RING_F_INDIRECT_DESC)) {
> +               vgdev->has_indirect = true;
> +       }
>
>         DRM_INFO("features: %cvirgl %cedid\n",
>                  vgdev->has_virgl_3d ? '+' : '-',
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index 41e475fbd67b..cc02fc4bab2a 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -330,6 +330,9 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
>         bool notify = false;
>         int ret;
>
> +       if (vgdev->has_indirect)
> +               elemcnt = 1;
> +
>  again:
>         spin_lock(&vgdev->ctrlq.qlock);
>
> --
> 2.18.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
