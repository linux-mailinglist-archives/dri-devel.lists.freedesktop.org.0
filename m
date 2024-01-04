Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D36482495C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 21:04:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C552A10E509;
	Thu,  4 Jan 2024 20:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706AE10E509
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 20:04:26 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1d3ea8d0f9dso29855ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jan 2024 12:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1704398666; x=1705003466;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H5bvopne90ze66b5qL7PgimF4S4TbBUTQc7c41/Z5QU=;
 b=tHCPlY2yP2wLEVLOp8YeXKcaDqHJ56vNy1sa2htKZSScUKAOSUE+SgcXm0XF0MlpEr
 qzLctFrRAFIxuKFD/sUMsgIiwdVviLE7NlWfqgnGnz/CcX435lHap4D0z5ug32C85Ep1
 3viZV5zMMdJ2niL0p4DV4UySyghnKnpPJ/GYvxJgyG3Mc+AhaBeA/vL6vbm+aIofjf92
 XX7YM1ROmmCAWhzaQadY/EKKyN1E/3PTQJeYTimBgCldMOaJ6/5J8wtF4v+kwkm0p200
 7xPCXnKycrYxjPh4tIBGsSyzbMRFqfSFOlWkFNuZ7CQs6a1Xq4vFms9R8ETgZrieFLmo
 4Ufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704398666; x=1705003466;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H5bvopne90ze66b5qL7PgimF4S4TbBUTQc7c41/Z5QU=;
 b=hRoedkhoEIJ4QbO0IJhV9dQLqRDpSbQKC+sCVtGw5enWIHJRTIBT9TnN0itvWN7+Pw
 E+U88Tu15vckL4V6IQxsXO1GobIUnoeELa/RC1OnYaxVH4nv5m2whJ0u3gB15egI4ezC
 Z+7saX4rKuIYPXpkfMs9vsS09FkMT97Pzo+1/0/A1c22Y+wdXBUP2Lg/Iq4wLiJ4zn6F
 tUFCqDYOhcmkYVy0hc/1/PKFGioQBID3lwmqoJgQGm4VQKLZfC0BjK/I0kY9R60aXwqI
 pITjAGn6A6fiwhjpE7Z8CoIs+LSBrTPcPJHvl/q57hMPb33uPvNzeo7XkYX9Z6UaCPkD
 Xu1A==
X-Gm-Message-State: AOJu0YymrkdiG/n5RuJLJfZDfrxgSvGB0oKm3lAr5FFQ9VJ5gbLXKY0R
 CK+2HfcvEx6ZoPC68MK819kUhH4U0EAGsgB6u/AXlqe4uvw=
X-Google-Smtp-Source: AGHT+IE6nCDFGOxUbrT46tziEFORgeHGgMI1VagwWwylhIygnmG5Jq9lLyJhChcmbRH7x9xBjCVSikge7cwaQF0d6yU=
X-Received: by 2002:a17:902:c412:b0:1d3:f33b:893 with SMTP id
 k18-20020a170902c41200b001d3f33b0893mr38511plk.28.1704398665574; Thu, 04 Jan
 2024 12:04:25 -0800 (PST)
MIME-Version: 1.0
References: <20231206081538.17056-1-yunfei.dong@mediatek.com>
 <20231206081538.17056-3-yunfei.dong@mediatek.com>
 <797a2cbd-ab84-47ec-99b0-23c392f343e1@xs4all.nl>
In-Reply-To: <797a2cbd-ab84-47ec-99b0-23c392f343e1@xs4all.nl>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Thu, 4 Jan 2024 12:04:13 -0800
Message-ID: <CA+ddPcNOvfOszE+jrzNx4cFAB12iWuAchCVKdbE4Rm6+CQMvXg@mail.gmail.com>
Subject: Re: [PATCH v3,02/21] v4l2: handle secure memory flags in queue setup
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Steve Cho <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
 dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, devicetree@vger.kernel.org,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 linaro-mm-sig@lists.linaro.org, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "T . J . Mercier" <tjmercier@google.com>, Yong Wu <yong.wu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Nathan Hebert <nhebert@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yunfei,

Can you please integrate these changes into the patch?

Thanks,
Jeff

On Mon, Dec 11, 2023 at 2:45=E2=80=AFAM Hans Verkuil <hverkuil-cisco@xs4all=
.nl> wrote:
>
> Hi Yunfei, Jeffrey,
>
> Some comments below:
>
> On 06/12/2023 09:15, Yunfei Dong wrote:
> > From: Jeffrey Kardatzke <jkardatzke@google.com>
> >
> > Validates the secure memory flags when setting up a queue and ensures
> > the queue has the proper capability.
> >
> > Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> >  .../media/common/videobuf2/videobuf2-core.c   | 23 +++++++++++++
> >  .../media/common/videobuf2/videobuf2-v4l2.c   | 34 +++++++++++++------
> >  2 files changed, 46 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/=
media/common/videobuf2/videobuf2-core.c
> > index 8c1df829745b..09dc030484be 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-core.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> > @@ -813,6 +813,15 @@ static bool verify_coherency_flags(struct vb2_queu=
e *q, bool non_coherent_mem)
> >       return true;
> >  }
> >
> > +static bool verify_secure_mem_flags(struct vb2_queue *q, bool secure_m=
em)
> > +{
> > +     if (secure_mem !=3D q->secure_mem) {
> > +             dprintk(q, 1, "secure memory model mismatch\n");
> > +             return false;
> > +     }
> > +     return true;
> > +}
> > +
> >  int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
> >                    unsigned int flags, unsigned int *count)
> >  {
> > @@ -820,6 +829,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_=
memory memory,
> >       unsigned int q_num_bufs =3D vb2_get_num_buffers(q);
> >       unsigned plane_sizes[VB2_MAX_PLANES] =3D { };
> >       bool non_coherent_mem =3D flags & V4L2_MEMORY_FLAG_NON_COHERENT;
> > +     bool secure_mem =3D flags & V4L2_MEMORY_FLAG_SECURE;
> >       unsigned int i;
> >       int ret =3D 0;
> >
> > @@ -836,6 +846,8 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_=
memory memory,
> >       if (*count =3D=3D 0 || q_num_bufs !=3D 0 ||
> >           (q->memory !=3D VB2_MEMORY_UNKNOWN && q->memory !=3D memory) =
||
> >           !verify_coherency_flags(q, non_coherent_mem)) {
> > +             bool no_previous_buffers =3D !q->num_buffers;
> > +
> >               /*
> >                * We already have buffers allocated, so first check if t=
hey
> >                * are not in use and can be freed.
> > @@ -854,6 +866,12 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2=
_memory memory,
> >               __vb2_queue_free(q, q_num_bufs);
> >               mutex_unlock(&q->mmap_lock);
> >
> > +             /*
> > +              * Do not allow switching secure buffer mode.
> > +              */
> > +             if (!no_previous_buffers && !verify_secure_mem_flags(q, s=
ecure_mem))
> > +                     return -EINVAL;
> > +
>
> Why is this needed? Here VIDIOC_REQBUFS is called either to just delete
> all existing buffers (count =3D=3D 0), or to delete all existing buffers =
and
> allocate new buffers (count > 0).
>
> Since in both cases all existing buffers are deleted, you are free to cho=
ose
> whatever new secure mode you want.
>
> >               /*
> >                * In case of REQBUFS(0) return immediately without calli=
ng
> >                * driver's queue_setup() callback and allocating resourc=
es.
> > @@ -882,6 +900,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_=
memory memory,
> >       if (ret)
> >               return ret;
> >       set_queue_coherency(q, non_coherent_mem);
> > +     q->secure_mem =3D secure_mem;
> >
> >       /*
> >        * Ask the driver how many buffers and planes per buffer it requi=
res.
> > @@ -986,6 +1005,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum=
 vb2_memory memory,
> >       unsigned plane_sizes[VB2_MAX_PLANES] =3D { };
> >       bool non_coherent_mem =3D flags & V4L2_MEMORY_FLAG_NON_COHERENT;
> >       unsigned int q_num_bufs =3D vb2_get_num_buffers(q);
> > +     bool secure_mem =3D flags & V4L2_MEMORY_FLAG_SECURE;
> >       bool no_previous_buffers =3D !q_num_bufs;
> >       int ret =3D 0;
> >
> > @@ -1015,6 +1035,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enu=
m vb2_memory memory,
> >                       return ret;
> >               q->waiting_for_buffers =3D !q->is_output;
> >               set_queue_coherency(q, non_coherent_mem);
> > +             q->secure_mem =3D secure_mem;
> >       } else {
> >               if (q->memory !=3D memory) {
> >                       dprintk(q, 1, "memory model mismatch\n");
> > @@ -1022,6 +1043,8 @@ int vb2_core_create_bufs(struct vb2_queue *q, enu=
m vb2_memory memory,
> >               }
> >               if (!verify_coherency_flags(q, non_coherent_mem))
> >                       return -EINVAL;
> > +             if (!verify_secure_mem_flags(q, secure_mem))
> > +                     return -EINVAL;
> >       }
> >
> >       num_buffers =3D min(*count, q->max_num_buffers - q_num_bufs);
> > diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/=
media/common/videobuf2/videobuf2-v4l2.c
> > index 54d572c3b515..0a530830276c 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> > @@ -686,22 +686,30 @@ static void fill_buf_caps(struct vb2_queue *q, u3=
2 *caps)
> >               *caps |=3D V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS;
> >       if (q->supports_requests)
> >               *caps |=3D V4L2_BUF_CAP_SUPPORTS_REQUESTS;
> > +     if (q->allow_secure_mem && q->io_modes & VB2_DMABUF)
> > +             *caps |=3D V4L2_BUF_CAP_SUPPORTS_SECURE_MEM;
> >  }
> >
> > -static void validate_memory_flags(struct vb2_queue *q,
> > +static bool validate_memory_flags(struct vb2_queue *q,
> >                                 int memory,
> >                                 u32 *flags)
> >  {
> > +     if (*flags & V4L2_MEMORY_FLAG_SECURE &&
> > +         (!q->allow_secure_mem || memory !=3D V4L2_MEMORY_DMABUF)) {
> > +             return false;
> > +     }
> > +
>
> This check belongs to videobuf2-core.c and the check should be done
> in vb2_core_reqbufs and vb2_core_create_bufs.
>
> So just leave this function as a void.
>
> >       if (!q->allow_cache_hints || memory !=3D V4L2_MEMORY_MMAP) {
> >               /*
> > -              * This needs to clear V4L2_MEMORY_FLAG_NON_COHERENT only=
,
> > -              * but in order to avoid bugs we zero out all bits.
> > +              * This needs to clear V4L2_MEMORY_FLAG_NON_COHERENT only=
.
>
> Just drop this as well since it adds no useful information anymore.
>
> >                */
> > -             *flags =3D 0;
> > -     } else {
> > -             /* Clear all unknown flags. */
> > -             *flags &=3D V4L2_MEMORY_FLAG_NON_COHERENT;
> > +             *flags &=3D ~V4L2_MEMORY_FLAG_NON_COHERENT;
> >       }
> > +
> > +     /* Clear all unknown flags. */
> > +     *flags &=3D V4L2_MEMORY_FLAG_NON_COHERENT | V4L2_MEMORY_FLAG_SECU=
RE;
>
> This is still needed here.
>
> > +
> > +     return true;
> >  }
> >
>
> So the following changes from here...
>
> >  int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
> > @@ -710,7 +718,8 @@ int vb2_reqbufs(struct vb2_queue *q, struct v4l2_re=
questbuffers *req)
> >       u32 flags =3D req->flags;
> >
> >       fill_buf_caps(q, &req->capabilities);
> > -     validate_memory_flags(q, req->memory, &flags);
> > +     if (!validate_memory_flags(q, req->memory, &flags))
> > +             return -EINVAL;
> >       req->flags =3D flags;
> >       return ret ? ret : vb2_core_reqbufs(q, req->memory,
> >                                           req->flags, &req->count);
> > @@ -752,7 +761,8 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l=
2_create_buffers *create)
> >       unsigned i;
> >
> >       fill_buf_caps(q, &create->capabilities);
> > -     validate_memory_flags(q, create->memory, &create->flags);
> > +     if (!validate_memory_flags(q, create->memory, &create->flags))
> > +             return -EINVAL;
> >       create->index =3D vb2_get_num_buffers(q);
> >       create->max_num_buffers =3D q->max_num_buffers;
> >       create->capabilities |=3D V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS;
> > @@ -1007,7 +1017,8 @@ int vb2_ioctl_reqbufs(struct file *file, void *pr=
iv,
> >       u32 flags =3D p->flags;
> >
> >       fill_buf_caps(vdev->queue, &p->capabilities);
> > -     validate_memory_flags(vdev->queue, p->memory, &flags);
> > +     if (!validate_memory_flags(vdev->queue, p->memory, &flags))
> > +             return -EINVAL;
> >       p->flags =3D flags;
> >       if (res)
> >               return res;
> > @@ -1031,7 +1042,8 @@ int vb2_ioctl_create_bufs(struct file *file, void=
 *priv,
> >
> >       p->index =3D vdev->queue->num_buffers;
> >       fill_buf_caps(vdev->queue, &p->capabilities);
> > -     validate_memory_flags(vdev->queue, p->memory, &p->flags);
> > +     if (!validate_memory_flags(vdev->queue, p->memory, &p->flags))
> > +             return -EINVAL;
> >       /*
> >        * If count =3D=3D 0, then just check if memory and type are vali=
d.
> >        * Any -EBUSY result from vb2_verify_memory_type can be mapped to=
 0.
>
> ...to the end should all be dropped since the vb2 core will do the checks=
.
>
> Regards,
>
>         Hans
