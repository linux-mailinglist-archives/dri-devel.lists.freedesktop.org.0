Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B02A5C295
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 20:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697F289AF3;
	Mon,  1 Jul 2019 18:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8EF89AF3
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 18:04:26 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id p17so14192386ljg.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2019 11:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=ZCVy4ytGfckwjSo8UvkCXCrSdAl6JqT1p9fR2nd/kOk=;
 b=l61aW5rb/VNkUSKEk+doplTZOmLGhn3uzKyIJShaYwD+Bqb/D902xS8eqUSrqwfEae
 9VTaDL/DE0Re/b8FRvUSIExz27Ea3oS0Qgc+vvvD07WFj2TlBGKkMes0DXDAVjgffYnr
 NIOxVKyOslekWE4BQGrYSRlATtGMBYt8fduv/ePkF1oqROFFobUW2pKEYkbeVFRqCljb
 xnShB2sL+8VeiNmAwvHBlQTwTprSrLxWT71czgNF6XusxIqLpOf7XtQnzpcBGXXotnaP
 HGiK3txtcRKfb7ZZFvs7nDXdR47LruDs2ygTWUBMyRZY1/1dm5HQvfGMj5VPqkx5aqaO
 HqdQ==
X-Gm-Message-State: APjAAAX4clrOnhaY2cZCKCkbuqJXm/cbeiREYw9ILVw6jV2l8BPQQGQn
 NhXjwft1CY2Iav8kVZUo64LpelkPCNQ=
X-Google-Smtp-Source: APXvYqwwefw0UxTasHvOjkC6YkRAjDvekYB3mfnPDaTXXNYudTrz/9b5U/mmcDpxsvwuSiguMSPGUQ==
X-Received: by 2002:a2e:63cd:: with SMTP id s74mr14783330lje.164.1562004264621; 
 Mon, 01 Jul 2019 11:04:24 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172])
 by smtp.gmail.com with ESMTPSA id t4sm3860156ljh.9.2019.07.01.11.04.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jul 2019 11:04:24 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id h10so14179601ljg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2019 11:04:23 -0700 (PDT)
X-Received: by 2002:a2e:9213:: with SMTP id k19mr14784160ljg.237.1562004263415; 
 Mon, 01 Jul 2019 11:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190628121338.24398-1-kraxel@redhat.com>
 <20190628121338.24398-10-kraxel@redhat.com>
In-Reply-To: <20190628121338.24398-10-kraxel@redhat.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Mon, 1 Jul 2019 11:04:11 -0700
X-Gmail-Original-Message-ID: <CAAfnVBmR2+uN=3O6H488GYoUtwxA2Hh8rbop+MiYm-YFtdecvw@mail.gmail.com>
Message-ID: <CAAfnVBmR2+uN=3O6H488GYoUtwxA2Hh8rbop+MiYm-YFtdecvw@mail.gmail.com>
Subject: Re: [PATCH v5 09/12] drm/virtio: rework virtio_gpu_object_create
 fencing
To: Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=ZCVy4ytGfckwjSo8UvkCXCrSdAl6JqT1p9fR2nd/kOk=;
 b=FbBBPaJLySVkbjfSaTIyk4aznrwu9hlzHWr2igQwIKa3If0VAnL+UIlanaXvUOHiZ9
 xJiWbp/igMBMQrCwjKQu8IJI9SodF5wl9N08UNcGemvPql+r8BiGa2kkw5KAPFywgbzh
 Y2x0UCGcSt9w2ZxKAx1blvE3T0iKWY/8K2JlY=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============0658788151=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0658788151==
Content-Type: multipart/alternative; boundary="0000000000004295d7058ca27580"

--0000000000004295d7058ca27580
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 28, 2019 at 5:14 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Use gem reservation helpers and direct reservation_object_* calls
> instead of ttm.
>
> v5: fix fencing (Chia-I Wu).
> v3: Due to using the gem reservation object it is initialized and ready
> for use before calling ttm_bo_init, so we can also drop the tricky fence
> logic which checks whenever the command is in flight still.  We can
> simply fence our object before submitting the virtio command and be done
> with it.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h    |  2 +
>  drivers/gpu/drm/virtio/virtgpu_object.c | 55 ++++++++++---------------
>  drivers/gpu/drm/virtio/virtgpu_vq.c     |  4 ++
>  3 files changed, 27 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h
b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 356d27132388..c4b266b6f731 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -267,6 +267,7 @@ void virtio_gpu_free_vbufs(struct virtio_gpu_device
*vgdev);
>  void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
>                                     struct virtio_gpu_object *bo,
>                                     struct virtio_gpu_object_params
*params,
> +                                   struct virtio_gpu_object_array *objs,
>                                     struct virtio_gpu_fence *fence);
>  void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
>                                    uint32_t resource_id);
> @@ -329,6 +330,7 @@ void
>  virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
>                                   struct virtio_gpu_object *bo,
>                                   struct virtio_gpu_object_params *params,
> +                                 struct virtio_gpu_object_array *objs,
>                                   struct virtio_gpu_fence *fence);
>  void virtio_gpu_ctrl_ack(struct virtqueue *vq);
>  void virtio_gpu_cursor_ack(struct virtqueue *vq);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c
b/drivers/gpu/drm/virtio/virtgpu_object.c
> index 82bfbf983fd2..fa0ea22c68b0 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -97,7 +97,9 @@ int virtio_gpu_object_create(struct virtio_gpu_device
*vgdev,
>                              struct virtio_gpu_object **bo_ptr,
>                              struct virtio_gpu_fence *fence)
>  {
> +       struct virtio_gpu_object_array *objs = NULL;
>         struct virtio_gpu_object *bo;
> +       struct ww_acquire_ctx ticket;
>         size_t acc_size;
>         int ret;
>
> @@ -123,12 +125,29 @@ int virtio_gpu_object_create(struct
virtio_gpu_device *vgdev,
>         }
>         bo->dumb = params->dumb;
>
> +       if (fence) {
> +               objs = virtio_gpu_array_alloc(1);
> +               objs->objs[0] = &bo->gem_base;
> +               drm_gem_object_get(objs->objs[0]);

So we take a reference every-time create/submit_cmd are fenced?  Why don't
we take a reference during {virtio_gpu_cmd_transfer_from_host_3d,
virtio_gpu_transfer_to_host_ioctl}?

Does the GEM common code wait on the reservation object before calling
virtio_gpu_gem_object_close?  If not, would it make sense to wait on the
reservation object with MAX_SCHEDULE_TIMEOUT in virtio_gpu_free_object?

> +
> +               ret = drm_gem_lock_reservations(objs->objs, objs->nents,
> +                                               &ticket);
> +               if (ret == 0)
> +
reservation_object_add_excl_fence(objs->objs[0]->resv,
> +                                                         &fence->f);
> +       }
> +
>         if (params->virgl) {
> -               virtio_gpu_cmd_resource_create_3d(vgdev, bo, params,
fence);
> +               virtio_gpu_cmd_resource_create_3d(vgdev, bo, params,
> +                                                 objs, fence);
>         } else {
> -               virtio_gpu_cmd_create_resource(vgdev, bo, params, fence);
> +               virtio_gpu_cmd_create_resource(vgdev, bo, params,
> +                                              objs, fence);
>         }
>
> +       if (fence)
> +               drm_gem_unlock_reservations(objs->objs, objs->nents,
&ticket);
> +
>         virtio_gpu_init_ttm_placement(bo);
>         ret = ttm_bo_init(&vgdev->mman.bdev, &bo->tbo, params->size,
>                           ttm_bo_type_device, &bo->placement, 0,
> @@ -139,38 +158,6 @@ int virtio_gpu_object_create(struct
virtio_gpu_device *vgdev,
>         if (ret != 0)
>                 return ret;
>
> -       if (fence) {
> -               struct virtio_gpu_fence_driver *drv = &vgdev->fence_drv;
> -               struct list_head validate_list;
> -               struct ttm_validate_buffer mainbuf;
> -               struct ww_acquire_ctx ticket;
> -               unsigned long irq_flags;
> -               bool signaled;
> -
> -               INIT_LIST_HEAD(&validate_list);
> -               memset(&mainbuf, 0, sizeof(struct ttm_validate_buffer));
> -
> -               /* use a gem reference since unref list undoes them */
> -               drm_gem_object_get(&bo->gem_base);
> -               mainbuf.bo = &bo->tbo;
> -               list_add(&mainbuf.head, &validate_list);
> -
> -               ret = virtio_gpu_object_list_validate(&ticket,
&validate_list);
> -               if (ret == 0) {
> -                       spin_lock_irqsave(&drv->lock, irq_flags);
> -                       signaled = virtio_fence_signaled(&fence->f);
> -                       if (!signaled)
> -                               /* virtio create command still in flight
*/
> -                               ttm_eu_fence_buffer_objects(&ticket,
&validate_list,
> -                                                           &fence->f);
> -                       spin_unlock_irqrestore(&drv->lock, irq_flags);
> -                       if (signaled)
> -                               /* virtio create command finished */
> -                               ttm_eu_backoff_reservation(&ticket,
&validate_list);
> -               }
> -               virtio_gpu_unref_list(&validate_list);
> -       }
> -
>         *bo_ptr = bo;
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c
b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index 0c87c3e086f8..0a735e51a803 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -391,6 +391,7 @@ static int virtio_gpu_queue_cursor(struct
virtio_gpu_device *vgdev,
>  void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
>                                     struct virtio_gpu_object *bo,
>                                     struct virtio_gpu_object_params
*params,
> +                                   struct virtio_gpu_object_array *objs,
>                                     struct virtio_gpu_fence *fence)
>  {
>         struct virtio_gpu_resource_create_2d *cmd_p;
> @@ -398,6 +399,7 @@ void virtio_gpu_cmd_create_resource(struct
virtio_gpu_device *vgdev,
>
>         cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
>         memset(cmd_p, 0, sizeof(*cmd_p));
> +       vbuf->objs = objs;
>
>         cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_CREATE_2D);
>         cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
> @@ -864,6 +866,7 @@ void
>  virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
>                                   struct virtio_gpu_object *bo,
>                                   struct virtio_gpu_object_params *params,
> +                                 struct virtio_gpu_object_array *objs,
>                                   struct virtio_gpu_fence *fence)
>  {
>         struct virtio_gpu_resource_create_3d *cmd_p;
> @@ -871,6 +874,7 @@ virtio_gpu_cmd_resource_create_3d(struct
virtio_gpu_device *vgdev,
>
>         cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
>         memset(cmd_p, 0, sizeof(*cmd_p));
> +       vbuf->objs = objs;
>
>         cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_CREATE_3D);
>         cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
> --
> 2.18.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--0000000000004295d7058ca27580
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Fri, Jun 28, 2019 at 5:14 AM Gerd Hoffmann &lt;=
<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt; wrote:<br>&g=
t;<br>&gt; Use gem reservation helpers and direct reservation_object_* call=
s<br>&gt; instead of ttm.<br>&gt;<br>&gt; v5: fix fencing (Chia-I Wu).<br>&=
gt; v3: Due to using the gem reservation object it is initialized and ready=
<br>&gt; for use before calling ttm_bo_init, so we can also drop the tricky=
 fence<br>&gt; logic which checks whenever the command is in flight still.=
=C2=A0 We can<br>&gt; simply fence our object before submitting the virtio =
command and be done<br>&gt; with it.<br>&gt;<br>&gt; Signed-off-by: Gerd Ho=
ffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt;<b=
r>&gt; Acked-by: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@ffwll.ch=
">daniel.vetter@ffwll.ch</a>&gt;<br>&gt; ---<br>&gt; =C2=A0drivers/gpu/drm/=
virtio/virtgpu_drv.h =C2=A0 =C2=A0| =C2=A02 +<br>&gt; =C2=A0drivers/gpu/drm=
/virtio/virtgpu_object.c | 55 ++++++++++---------------<br>&gt; =C2=A0drive=
rs/gpu/drm/virtio/virtgpu_vq.c =C2=A0 =C2=A0 | =C2=A04 ++<br>&gt; =C2=A03 f=
iles changed, 27 insertions(+), 34 deletions(-)<br>&gt;<br>&gt; diff --git =
a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv=
.h<br>&gt; index 356d27132388..c4b266b6f731 100644<br>&gt; --- a/drivers/gp=
u/drm/virtio/virtgpu_drv.h<br>&gt; +++ b/drivers/gpu/drm/virtio/virtgpu_drv=
.h<br>&gt; @@ -267,6 +267,7 @@ void virtio_gpu_free_vbufs(struct virtio_gpu=
_device *vgdev);<br>&gt; =C2=A0void virtio_gpu_cmd_create_resource(struct v=
irtio_gpu_device *vgdev,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 struct virtio_gpu_object *bo,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_object_params *params,<br>&gt=
; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_object_a=
rray *objs,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stru=
ct virtio_gpu_fence *fence);<br>&gt; =C2=A0void virtio_gpu_cmd_unref_resour=
ce(struct virtio_gpu_device *vgdev,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0uint32_t resource_id);<br>&gt; @@ -329,6 +330,7 @@ void=
<br>&gt; =C2=A0virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *=
vgdev,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_g=
pu_object *bo,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct v=
irtio_gpu_object_params *params,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 struct virtio_gpu_object_array *objs,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_fence *fence);<br>&gt; =C2=A0voi=
d virtio_gpu_ctrl_ack(struct virtqueue *vq);<br>&gt; =C2=A0void virtio_gpu_=
cursor_ack(struct virtqueue *vq);<br>&gt; diff --git a/drivers/gpu/drm/virt=
io/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c<br>&gt; index=
 82bfbf983fd2..fa0ea22c68b0 100644<br>&gt; --- a/drivers/gpu/drm/virtio/vir=
tgpu_object.c<br>&gt; +++ b/drivers/gpu/drm/virtio/virtgpu_object.c<br>&gt;=
 @@ -97,7 +97,9 @@ int virtio_gpu_object_create(struct virtio_gpu_device *v=
gdev,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_object **bo_=
ptr,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_fence *fence)<b=
r>&gt; =C2=A0{<br>&gt; + =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_object_arra=
y *objs =3D NULL;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_obj=
ect *bo;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 struct ww_acquire_ctx ticket;<br>&g=
t; =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t acc_size;<br>&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 int ret;<br>&gt;<br>&gt; @@ -123,12 +125,29 @@ int virtio_gpu_ob=
ject_create(struct virtio_gpu_device *vgdev,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 }<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 bo-&gt;dumb =3D params-&gt;dum=
b;<br>&gt;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 if (fence) {<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 objs =3D virtio_gpu_array_alloc(1);<=
br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 objs-&gt;objs[0]=
 =3D &amp;bo-&gt;gem_base;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 drm_gem_object_get(objs-&gt;objs[0]);<br><br>So we take a refere=
nce every-time create/submit_cmd are fenced?=C2=A0 Why don&#39;t we take a =
reference during {virtio_gpu_cmd_transfer_from_host_3d, virtio_gpu_transfer=
_to_host_ioctl}?<br><br>Does the GEM common code wait on the reservation ob=
ject before calling virtio_gpu_gem_object_close?=C2=A0 If not, would it mak=
e sense to wait on the reservation object with MAX_SCHEDULE_TIMEOUT in virt=
io_gpu_free_object?<br><br>&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ret =3D drm_gem_lock_reservations(objs-&gt;objs, objs-&gt=
;nents,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;ticket);<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D 0)<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reservation_=
object_add_excl_fence(objs-&gt;objs[0]-&gt;resv,<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;fence-&gt;f);<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 }<br>&gt; +<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (params-&gt;v=
irgl) {<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_g=
pu_cmd_resource_create_3d(vgdev, bo, params, fence);<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_gpu_cmd_resource_create_3d(vg=
dev, bo, params,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 objs, fence);<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 } else {<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 virtio_gpu_cmd_create_resource(vgdev, bo, params, fence);<br>=
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_gpu_cmd_crea=
te_resource(vgdev, bo, params,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0objs, fence);<br>&gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 if (fe=
nce)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_gem_unl=
ock_reservations(objs-&gt;objs, objs-&gt;nents, &amp;ticket);<br>&gt; +<br>=
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_gpu_init_ttm_placement(bo);<br>&gt;=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ttm_bo_init(&amp;vgdev-&gt;mman.bdev, =
&amp;bo-&gt;tbo, params-&gt;size,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ttm_bo_type_dev=
ice, &amp;bo-&gt;placement, 0,<br>&gt; @@ -139,38 +158,6 @@ int virtio_gpu_=
object_create(struct virtio_gpu_device *vgdev,<br>&gt; =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (ret !=3D 0)<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 return ret;<br>&gt;<br>&gt; - =C2=A0 =C2=A0 =C2=A0 if (fence)=
 {<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio=
_gpu_fence_driver *drv =3D &amp;vgdev-&gt;fence_drv;<br>&gt; - =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct list_head validate_list;<br>&=
gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct ttm_validate_=
buffer mainbuf;<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
struct ww_acquire_ctx ticket;<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 unsigned long irq_flags;<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 bool signaled;<br>&gt; -<br>&gt; - =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INIT_LIST_HEAD(&amp;validate_list);<br>&=
gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(&amp;mainbuf,=
 0, sizeof(struct ttm_validate_buffer));<br>&gt; -<br>&gt; - =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* use a gem reference since unref list =
undoes them */<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d=
rm_gem_object_get(&amp;bo-&gt;gem_base);<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://mainbuf.bo">mainbuf.bo</a> =3D &=
amp;bo-&gt;tbo;<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
list_add(&amp;mainbuf.head, &amp;validate_list);<br>&gt; -<br>&gt; - =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D virtio_gpu_object_list_v=
alidate(&amp;ticket, &amp;validate_list);<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D 0) {<br>&gt; - =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_lock_irqsa=
ve(&amp;drv-&gt;lock, irq_flags);<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 signaled =3D virtio_fence_sig=
naled(&amp;fence-&gt;f);<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!signaled)<br>&gt; - =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /* virtio create command still in flight */<br>&gt; - =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ttm_eu_fence_buffer_objects(&amp;ticket, &a=
mp;validate_list,<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &amp;fence-&gt;f);<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_unlock_irqrestore(&amp;drv-&=
gt;lock, irq_flags);<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (signaled)<br>&gt; - =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* virtio create command finished */<br>&gt; - =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ttm_eu_backoff_reservation(&amp;ticket, &amp;validate_=
list);<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt;=
 - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_gpu_unref_list(&=
amp;validate_list);<br>&gt; - =C2=A0 =C2=A0 =C2=A0 }<br>&gt; -<br>&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 *bo_ptr =3D bo;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return 0;<br>&gt; =C2=A0}<br>&gt; diff --git a/drivers/gpu/drm/virtio/v=
irtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c<br>&gt; index 0c87c3e086f=
8..0a735e51a803 100644<br>&gt; --- a/drivers/gpu/drm/virtio/virtgpu_vq.c<br=
>&gt; +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c<br>&gt; @@ -391,6 +391,7 @@=
 static int virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,<br>&gt=
; =C2=A0void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev=
,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virti=
o_gpu_object *bo,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 struct virtio_gpu_object_params *params,<br>&gt; + =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_object_array *objs,<br>&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_fence *f=
ence)<br>&gt; =C2=A0{<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu=
_resource_create_2d *cmd_p;<br>&gt; @@ -398,6 +399,7 @@ void virtio_gpu_cmd=
_create_resource(struct virtio_gpu_device *vgdev,<br>&gt;<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 cmd_p =3D virtio_gpu_alloc_cmd(vgdev, &amp;vbuf, sizeo=
f(*cmd_p));<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(cmd_p, 0, sizeof(*cm=
d_p));<br>&gt; + =C2=A0 =C2=A0 =C2=A0 vbuf-&gt;objs =3D objs;<br>&gt;<br>&g=
t; =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd_p-&gt;hdr.type =3D cpu_to_le32(VIRTIO_GP=
U_CMD_RESOURCE_CREATE_2D);<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd_p-&gt;re=
source_id =3D cpu_to_le32(bo-&gt;hw_res_handle);<br>&gt; @@ -864,6 +866,7 @=
@ void<br>&gt; =C2=A0virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_de=
vice *vgdev,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct v=
irtio_gpu_object *bo,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
truct virtio_gpu_object_params *params,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 struct virtio_gpu_object_array *objs,<br>&gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_fence *fence)<br>&gt; =C2=
=A0{<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_resource_create_=
3d *cmd_p;<br>&gt; @@ -871,6 +874,7 @@ virtio_gpu_cmd_resource_create_3d(st=
ruct virtio_gpu_device *vgdev,<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
cmd_p =3D virtio_gpu_alloc_cmd(vgdev, &amp;vbuf, sizeof(*cmd_p));<br>&gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(cmd_p, 0, sizeof(*cmd_p));<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 vbuf-&gt;objs =3D objs;<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cmd_p-&gt;hdr.type =3D cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_CREAT=
E_3D);<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd_p-&gt;resource_id =3D cpu_to=
_le32(bo-&gt;hw_res_handle);<br>&gt; --<br>&gt; 2.18.1<br>&gt;<br>&gt; ____=
___________________________________________<br>&gt; dri-devel mailing list<=
br>&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.=
freedesktop.org</a><br>&gt; <a href=3D"https://lists.freedesktop.org/mailma=
n/listinfo/dri-devel">https://lists.freedesktop.org/mailman/listinfo/dri-de=
vel</a></div>

--0000000000004295d7058ca27580--

--===============0658788151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0658788151==--
