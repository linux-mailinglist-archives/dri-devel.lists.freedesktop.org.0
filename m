Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE87C11BBB2
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 19:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96BB86EB74;
	Wed, 11 Dec 2019 18:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B286EB74
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 18:27:51 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id w3so4217296iot.11
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 10:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mzDObby2jR84VqCAR2NNwsNmUH6L34aJzVs2dTgYaFM=;
 b=SQutmLP/sTlMS+zEASMFyKHYZa5f7ZvuA3wQ6jac0fGgK7KhPy0pJYlK9Ep86yG+qw
 wzyZcPvXgatCP1WzKGQ9qaWIfawy6sjA+myEUnoItidWjoBwaXzm6GzH8/YNDPrFYuNi
 KI1ImvVwYFkcjW2tTODNRvj/3xdCFvtFVcraGylloS+K8e19bwK5TLnyt3JKe/jYM7/q
 MRhQX0c6GfsJx/dvNnwivAkIfnoi4aXV/lLLKOWOsYzeiFLRupKYp1Z3i6jc9iTsZ9d8
 sdmC37PlxSS1zykHsxTjLMi/rf/gqm3CKQU1vUKQHLuQbovcOtO8cKbIH3pwgCb1Qyxe
 Y4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mzDObby2jR84VqCAR2NNwsNmUH6L34aJzVs2dTgYaFM=;
 b=NIC6ZJJEw4teXGDRaZgnVZ0/QhGVML9JFT6iLSVBNgq5uPYCUTHtCC+TW3si9cogIE
 nAVebP2BHNuFPkKvyLTOnAbD6jkXiON18XUDKMYrKqNX3MKb8k0oF0VfD/B8aq1sVu5E
 Bzy+d9d3qzrVsU+M1ioKFF+rxaUjja5xK8kjjVb4Q7n7vN6NSqUpKnVqzp2Jz+Nb2xKa
 f21DPowSRPXRV9ttBtDW4tKoSUIrYd9KwfL8DTRSW8YAa93tRpl7B5dHMsBXHnDFKzv+
 fOrGGxQntrPpqXXJrJaEvteVtDOo/xY9yQ+lxWMrmeNJFrftV7uhVTri6TVz9Cifiddp
 HXcQ==
X-Gm-Message-State: APjAAAXswCPOY/eEH9Sot5VVA/ejWM8I6hm2d8Ox3jrH9uy53Z0jEsFX
 S04/xblL5iRFxrJZckuTc1z4z4e7IArsoZPOJwQ=
X-Google-Smtp-Source: APXvYqzr/oijDkWCcNuhvBnIVjwCPuuM7oI1QguAVqVj6YMeD8ttf/i0DbRLSFLpONolcFkrV56yhH2S3xvlzv460ao=
X-Received: by 2002:a6b:1455:: with SMTP id 82mr3759846iou.200.1576088870232; 
 Wed, 11 Dec 2019 10:27:50 -0800 (PST)
MIME-Version: 1.0
References: <20191211084216.25405-1-kraxel@redhat.com>
 <20191211084216.25405-2-kraxel@redhat.com>
In-Reply-To: <20191211084216.25405-2-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 11 Dec 2019 10:27:39 -0800
Message-ID: <CAPaKu7TyMPt4Wpq9FoWyTJSppURrz9XuFqD4fmFg6aX_9p+jtw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/virtio: skip set_scanout if framebuffer didn't
 change
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
Cc: David Airlie <airlied@linux.ie>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 11, 2019 at 12:42 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 31 ++++++++++++++------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
> index bc4bc4475a8c..a0f91658c2bc 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> @@ -151,20 +151,23 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
>         if (bo->dumb)
>                 virtio_gpu_update_dumb_bo(vgdev, bo, plane->state);
>
> -       DRM_DEBUG("handle 0x%x, crtc %dx%d+%d+%d, src %dx%d+%d+%d\n",
> -                 bo->hw_res_handle,
> -                 plane->state->crtc_w, plane->state->crtc_h,
> -                 plane->state->crtc_x, plane->state->crtc_y,
> -                 plane->state->src_w >> 16,
> -                 plane->state->src_h >> 16,
> -                 plane->state->src_x >> 16,
> -                 plane->state->src_y >> 16);
> -       virtio_gpu_cmd_set_scanout(vgdev, output->index,
> -                                  bo->hw_res_handle,
> -                                  plane->state->src_w >> 16,
> -                                  plane->state->src_h >> 16,
> -                                  plane->state->src_x >> 16,
> -                                  plane->state->src_y >> 16);
> +       if (plane->state->fb != old_state->fb) {
Should we check src_{w,h,x,y} as well?
> +               DRM_DEBUG("handle 0x%x, crtc %dx%d+%d+%d, src %dx%d+%d+%d\n",
> +                         bo->hw_res_handle,
> +                         plane->state->crtc_w, plane->state->crtc_h,
> +                         plane->state->crtc_x, plane->state->crtc_y,
> +                         plane->state->src_w >> 16,
> +                         plane->state->src_h >> 16,
> +                         plane->state->src_x >> 16,
> +                         plane->state->src_y >> 16);
> +               virtio_gpu_cmd_set_scanout(vgdev, output->index,
> +                                          bo->hw_res_handle,
> +                                          plane->state->src_w >> 16,
> +                                          plane->state->src_h >> 16,
> +                                          plane->state->src_x >> 16,
> +                                          plane->state->src_y >> 16);
> +       }
> +
>         virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle,
>                                       plane->state->src_x >> 16,
>                                       plane->state->src_y >> 16,
> --
> 2.18.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
