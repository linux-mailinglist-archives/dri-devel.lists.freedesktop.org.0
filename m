Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29234983F9
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 21:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43ABD6E378;
	Wed, 21 Aug 2019 19:07:17 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4434E6E378
 for <dri-devel@freedesktop.org>; Wed, 21 Aug 2019 19:07:15 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id a21so4174010edt.11
 for <dri-devel@freedesktop.org>; Wed, 21 Aug 2019 12:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mNH617Dgs0AquAE3SKgLvmPgN2QOTnj8MKk9HaJ8yyI=;
 b=tVQnP7D0n+GBsW/sbOngCUxrnXstHZQadldYMwdJh6uLzV3+TMjN+LSSUVsg7MZvxm
 +Bzo1HCooB6LkLCi9sxp6GkNWUUoYEFz01WffELHQg8da6K7AGBuSZ1cISuLXK7iGAPY
 jNVHja6hBfl2c9JSFJQL4EJfcTH5z6lt6E/H9DkoiXIdhXAPL8IYCmNRWqiGfIEEa7So
 21ggi2mDKZBzETDTi7366aRCGqDf/KehLwHIYMgnQtVE6j0irvzTU3hPeYGusVlWh7MP
 bK81xsraZobE6FPozPv6/nqFUQxFHUmyNFC0iKIeGDXfXLdr9ZG45X5RJVNHiQaBKJZY
 gTWA==
X-Gm-Message-State: APjAAAXrj7BZZPeDjktb3Y7lAiNHfd4D6r+ruutzMctXdBVuOL+hYe+T
 G7KvRj1vTVXmkKtTYNHvop+eJ1jIOnldRAkDL5znfg==
X-Google-Smtp-Source: APXvYqx3yqZAnvOZxuLUD8rGPwVVradUlRHXcTkeFlNmHoKQ10DjvEdq7zpa5bEixTFc47Wz0nSqGaaiYRH4s9xotuE=
X-Received: by 2002:a17:906:1cce:: with SMTP id
 i14mr32795055ejh.7.1566414433638; 
 Wed, 21 Aug 2019 12:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190809134349.4102-1-lionel.g.landwerlin@intel.com>
 <20190809134349.4102-2-lionel.g.landwerlin@intel.com>
In-Reply-To: <20190809134349.4102-2-lionel.g.landwerlin@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 21 Aug 2019 14:07:01 -0500
Message-ID: <CAOFGe96bF49YA-ONK6xN7DKtskVHqfm7_TZUcLYMqVPywA_uNQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] drm/syncobj: add sideband payload
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=mNH617Dgs0AquAE3SKgLvmPgN2QOTnj8MKk9HaJ8yyI=;
 b=2LBJQBYZTQtTrfbGVhOf523ZtdenNLr2JBCw56jvX+50CClggUZTln7+SD1gqcQg5A
 QnLZILtIp8Um9zw8nvwCD37Qx5KRAQfKiPSQc0egat4Dds0ZsGrGjyA3TPWxiegvxGOm
 yqSW4JO13BRH+BBbDb7rlvE4NDCJ9xYFOxcP0+EfYanWqSZrDWTHMYSglEiG6jiX4dkk
 UIyQS3PX2lj8/is/nsX51DB5DyJ9I/EOIDFi9Gm/nhwpOVwrCKi5Sp8tj3utUow1TpN7
 UNaMrlhWrpFO5Jj/Jvlksw9aa2Drf0aYtRn7aox3CtHgN5yK0RAbdhWPFNSLi8EBhBwy
 5Y/w==
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
Cc: dri-devel@freedesktop.org, Christian Koenig <Christian.Koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0703526634=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0703526634==
Content-Type: multipart/alternative; boundary="000000000000e3775a0590a547f9"

--000000000000e3775a0590a547f9
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 9, 2019 at 8:43 AM Lionel Landwerlin <
lionel.g.landwerlin@intel.com> wrote:

> The Vulkan timeline semaphores allow signaling to happen on the point
> of the timeline without all of the its dependencies to be created.
>
> The current 2 implementations (AMD/Intel) of the Vulkan spec on top of
> the Linux kernel are using a thread to wait on the dependencies of a
> given point to materialize and delay actual submission to the kernel
> driver until the wait completes.
>
> If a binary semaphore is submitted for signaling along the side of a
> timeline semaphore waiting for completion that means that the drm
> syncobj associated with that binary semaphore will not have a DMA
> fence associated with it by the time vkQueueSubmit() returns. This and
> the fact that a binary semaphore can be signaled and unsignaled as
> before its DMA fences materialize mean that we cannot just rely on the
> fence within the syncobj but we also need a sideband payload verifying
> that the fence in the syncobj matches the last submission from the
> Vulkan API point of view.
>
> This change adds a sideband payload that is incremented with signaled
> syncobj when vkQueueSubmit() is called. The next vkQueueSubmit()
> waiting on a the syncobj will read the sideband payload and wait for a
> fence chain element with a seqno superior or equal to the sideband
> payload value to be added into the fence chain and use that fence to
> trigger the submission on the kernel driver.
>
> v2: Use a separate ioctl to get/set the sideband value (Christian)
>
> v3: Use 2 ioctls for get/set (Christian)
>
> v4: Use a single new ioctl
>
> v5: a bunch of blattant mistakes
>     Store payload atomically (Chris)
>
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Christian Koenig <Christian.Koenig@amd.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: David(ChunMing) Zhou <David1.Zhou@amd.com>
> ---
>  drivers/gpu/drm/drm_internal.h |  2 ++
>  drivers/gpu/drm/drm_ioctl.c    |  3 ++
>  drivers/gpu/drm/drm_syncobj.c  | 58 +++++++++++++++++++++++++++++++++-
>  include/drm/drm_syncobj.h      |  9 ++++++
>  include/uapi/drm/drm.h         | 17 ++++++++++
>  5 files changed, 88 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_internal.h
> b/drivers/gpu/drm/drm_internal.h
> index 51a2055c8f18..e297dfd85019 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -208,6 +208,8 @@ int drm_syncobj_timeline_signal_ioctl(struct
> drm_device *dev, void *data,
>                                       struct drm_file *file_private);
>  int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>                             struct drm_file *file_private);
> +int drm_syncobj_binary_ioctl(struct drm_device *dev, void *data,
> +                            struct drm_file *file_private);
>
>  /* drm_framebuffer.c */
>  void drm_framebuffer_print_info(struct drm_printer *p, unsigned int
> indent,
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index f675a3bb2c88..644d0bc800a4 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -703,6 +703,9 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>                       DRM_RENDER_ALLOW),
>         DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_QUERY, drm_syncobj_query_ioctl,
>                       DRM_RENDER_ALLOW),
> +       DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_BINARY, drm_syncobj_binary_ioctl,
> +                     DRM_RENDER_ALLOW),
> +
>         DRM_IOCTL_DEF(DRM_IOCTL_CRTC_GET_SEQUENCE,
> drm_crtc_get_sequence_ioctl, 0),
>         DRM_IOCTL_DEF(DRM_IOCTL_CRTC_QUEUE_SEQUENCE,
> drm_crtc_queue_sequence_ioctl, 0),
>         DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATE_LEASE,
> drm_mode_create_lease_ioctl, DRM_MASTER),
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index b927e482e554..d2d3a8d1374d 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -1150,8 +1150,10 @@ drm_syncobj_reset_ioctl(struct drm_device *dev,
> void *data,
>         if (ret < 0)
>                 return ret;
>
> -       for (i = 0; i < args->count_handles; i++)
> +       for (i = 0; i < args->count_handles; i++) {
>                 drm_syncobj_replace_fence(syncobjs[i], NULL);
> +               atomic64_set(&syncobjs[i]->binary_payload, 0);
> +       }
>
>         drm_syncobj_array_free(syncobjs, args->count_handles);
>
> @@ -1321,6 +1323,60 @@ int drm_syncobj_query_ioctl(struct drm_device *dev,
> void *data,
>                 if (ret)
>                         break;
>         }
> +
> +       drm_syncobj_array_free(syncobjs, args->count_handles);
> +
> +       return ret;
> +}
> +
> +int drm_syncobj_binary_ioctl(struct drm_device *dev, void *data,
> +                            struct drm_file *file_private)
> +{
> +       struct drm_syncobj_binary_array *args = data;
> +       struct drm_syncobj **syncobjs;
> +       u32 __user *access_flags = u64_to_user_ptr(args->access_flags);
> +       u64 __user *values = u64_to_user_ptr(args->values);
> +       u32 i;
> +       int ret;
> +
> +       if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
> +               return -EOPNOTSUPP;
> +
> +       if (args->pad != 0)
> +               return -EINVAL;
> +
> +       if (args->count_handles == 0)
> +               return -EINVAL;
> +
> +       ret = drm_syncobj_array_find(file_private,
> +                                    u64_to_user_ptr(args->handles),
> +                                    args->count_handles,
> +                                    &syncobjs);
> +       if (ret < 0)
> +               return ret;
> +
> +       for (i = 0; i < args->count_handles; i++) {
> +               u32 flags;
> +
> +               if (get_user(flags, &access_flags[i])) {
> +                       ret = -EFAULT;
> +                       break;
> +               }
> +
> +
> +               if (flags & DRM_SYNCOBJ_BINARY_VALUE_READ) {
> +                       u64 value =
> atomic64_read(&syncobjs[i]->binary_payload);
> +
> +                       if (put_user(value, &values[i])) {
> +                               ret = -EFAULT;
> +                               break;
> +                       }
> +               }
> +
> +               if (flags & DRM_SYNCOBJ_BINARY_VALUE_INC)
> +                       atomic64_inc(&syncobjs[i]->binary_payload);
>

You go out of your way to use atomics but then don't bother to do the read
and increment atomically.  Maybe something like

u64 value = 0;
if (flags & DRM_SYNCOBJ_BINARY_VALUE_INC)
   value = atomic64_inc(...);
else if (flags & DRM_SYNCOBJ_BINARY_VALUE_READ)
   value = atomic64_read(...);

if (flags & DRM_SYNCOBJ_BINARY_VALUE_READ)
   put_user(...)

--Jason



> +       }
> +
>         drm_syncobj_array_free(syncobjs, args->count_handles);
>
>         return ret;
> diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
> index 6cf7243a1dc5..aa76cb3f9107 100644
> --- a/include/drm/drm_syncobj.h
> +++ b/include/drm/drm_syncobj.h
> @@ -61,6 +61,15 @@ struct drm_syncobj {
>          * @file: A file backing for this syncobj.
>          */
>         struct file *file;
> +       /**
> +        * @binary_payload: A 64bit payload for binary syncobjs.
> +        *
> +        * We use the payload value to wait on binary syncobj fences to
> +        * materialize. It is a reservation mechanism for the signaler to
> +        * express that at some point in the future a dma fence with the
> same
> +        * seqno will be put into the syncobj.
> +        */
> +       atomic64_t binary_payload;
>  };
>
>  void drm_syncobj_free(struct kref *kref);
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 8a5b2f8f8eb9..78a0a413b788 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -785,6 +785,22 @@ struct drm_syncobj_timeline_array {
>         __u32 pad;
>  };
>
> +struct drm_syncobj_binary_array {
> +       /* A pointer to an array of u32 syncobj handles. */
> +       __u64 handles;
> +       /* A pointer to an array of u32 access flags for each handle. */
> +       __u64 access_flags;
> +       /* The binary value of a syncobj is read before it is incremented.
> */
> +#define DRM_SYNCOBJ_BINARY_VALUE_READ (1u << 0)
> +#define DRM_SYNCOBJ_BINARY_VALUE_INC  (1u << 1)
> +       /* A pointer to an array of u64 values written to by the kernel if
> the
> +        * handle is flagged for reading.
> +        */
> +       __u64 values;
> +       /* The length of the 3 arrays above. */
> +       __u32 count_handles;
> +       __u32 pad;
> +};
>
>  /* Query current scanout sequence number */
>  struct drm_crtc_get_sequence {
> @@ -946,6 +962,7 @@ extern "C" {
>  #define DRM_IOCTL_SYNCOBJ_QUERY                DRM_IOWR(0xCB, struct
> drm_syncobj_timeline_array)
>  #define DRM_IOCTL_SYNCOBJ_TRANSFER     DRM_IOWR(0xCC, struct
> drm_syncobj_transfer)
>  #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL      DRM_IOWR(0xCD, struct
> drm_syncobj_timeline_array)
> +#define DRM_IOCTL_SYNCOBJ_BINARY       DRM_IOWR(0xCE, struct
> drm_syncobj_binary_array)
>
>  /**
>   * Device specific ioctls should only be in their respective headers
> --
> 2.23.0.rc1
>
>

--000000000000e3775a0590a547f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, Aug 9, 2019 at 8:43 AM Lionel Landwerlin &lt;<a href=3D"mail=
to:lionel.g.landwerlin@intel.com">lionel.g.landwerlin@intel.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The Vulkan t=
imeline semaphores allow signaling to happen on the point<br>
of the timeline without all of the its dependencies to be created.<br>
<br>
The current 2 implementations (AMD/Intel) of the Vulkan spec on top of<br>
the Linux kernel are using a thread to wait on the dependencies of a<br>
given point to materialize and delay actual submission to the kernel<br>
driver until the wait completes.<br>
<br>
If a binary semaphore is submitted for signaling along the side of a<br>
timeline semaphore waiting for completion that means that the drm<br>
syncobj associated with that binary semaphore will not have a DMA<br>
fence associated with it by the time vkQueueSubmit() returns. This and<br>
the fact that a binary semaphore can be signaled and unsignaled as<br>
before its DMA fences materialize mean that we cannot just rely on the<br>
fence within the syncobj but we also need a sideband payload verifying<br>
that the fence in the syncobj matches the last submission from the<br>
Vulkan API point of view.<br>
<br>
This change adds a sideband payload that is incremented with signaled<br>
syncobj when vkQueueSubmit() is called. The next vkQueueSubmit()<br>
waiting on a the syncobj will read the sideband payload and wait for a<br>
fence chain element with a seqno superior or equal to the sideband<br>
payload value to be added into the fence chain and use that fence to<br>
trigger the submission on the kernel driver.<br>
<br>
v2: Use a separate ioctl to get/set the sideband value (Christian)<br>
<br>
v3: Use 2 ioctls for get/set (Christian)<br>
<br>
v4: Use a single new ioctl<br>
<br>
v5: a bunch of blattant mistakes<br>
=C2=A0 =C2=A0 Store payload atomically (Chris)<br>
<br>
Signed-off-by: Lionel Landwerlin &lt;<a href=3D"mailto:lionel.g.landwerlin@=
intel.com" target=3D"_blank">lionel.g.landwerlin@intel.com</a>&gt;<br>
Cc: Christian Koenig &lt;<a href=3D"mailto:Christian.Koenig@amd.com" target=
=3D"_blank">Christian.Koenig@amd.com</a>&gt;<br>
Cc: Jason Ekstrand &lt;<a href=3D"mailto:jason@jlekstrand.net" target=3D"_b=
lank">jason@jlekstrand.net</a>&gt;<br>
Cc: David(ChunMing) Zhou &lt;<a href=3D"mailto:David1.Zhou@amd.com" target=
=3D"_blank">David1.Zhou@amd.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/drm_internal.h |=C2=A0 2 ++<br>
=C2=A0drivers/gpu/drm/drm_ioctl.c=C2=A0 =C2=A0 |=C2=A0 3 ++<br>
=C2=A0drivers/gpu/drm/drm_syncobj.c=C2=A0 | 58 ++++++++++++++++++++++++++++=
+++++-<br>
=C2=A0include/drm/drm_syncobj.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 ++++++<br>
=C2=A0include/uapi/drm/drm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 17 ++++++++=
++<br>
=C2=A05 files changed, 88 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.=
h<br>
index 51a2055c8f18..e297dfd85019 100644<br>
--- a/drivers/gpu/drm/drm_internal.h<br>
+++ b/drivers/gpu/drm/drm_internal.h<br>
@@ -208,6 +208,8 @@ int drm_syncobj_timeline_signal_ioctl(struct drm_device=
 *dev, void *data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_file=
 *file_private);<br>
=C2=A0int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_file *file_private);<br>
+int drm_syncobj_binary_ioctl(struct drm_device *dev, void *data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_file *file_private);<br>
<br>
=C2=A0/* drm_framebuffer.c */<br>
=C2=A0void drm_framebuffer_print_info(struct drm_printer *p, unsigned int i=
ndent,<br>
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c<br>
index f675a3bb2c88..644d0bc800a4 100644<br>
--- a/drivers/gpu/drm/drm_ioctl.c<br>
+++ b/drivers/gpu/drm/drm_ioctl.c<br>
@@ -703,6 +703,9 @@ static const struct drm_ioctl_desc drm_ioctls[] =3D {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 DRM_RENDER_ALLOW),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_QUERY, drm_sync=
obj_query_ioctl,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 DRM_RENDER_ALLOW),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_BINARY, drm_syn=
cobj_binary_ioctl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0DRM_RENDER_ALLOW),<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_IOCTL_DEF(DRM_IOCTL_CRTC_GET_SEQUENCE, drm_=
crtc_get_sequence_ioctl, 0),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_IOCTL_DEF(DRM_IOCTL_CRTC_QUEUE_SEQUENCE, dr=
m_crtc_queue_sequence_ioctl, 0),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_IOCTL_DEF(DRM_IOCTL_MODE_CREATE_LEASE, drm_=
mode_create_lease_ioctl, DRM_MASTER),<br>
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c<=
br>
index b927e482e554..d2d3a8d1374d 100644<br>
--- a/drivers/gpu/drm/drm_syncobj.c<br>
+++ b/drivers/gpu/drm/drm_syncobj.c<br>
@@ -1150,8 +1150,10 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, void=
 *data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; args-&gt;count_handles; i+=
+)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; args-&gt;count_handles; i+=
+) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_syncobj_replace=
_fence(syncobjs[i], NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0atomic64_set(&amp;s=
yncobjs[i]-&gt;binary_payload, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_syncobj_array_free(syncobjs, args-&gt;count=
_handles);<br>
<br>
@@ -1321,6 +1323,60 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, =
void *data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_syncobj_array_free(syncobjs, args-&gt;count=
_handles);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}<br>
+<br>
+int drm_syncobj_binary_ioctl(struct drm_device *dev, void *data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_file *file_private)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_syncobj_binary_array *args =3D data;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_syncobj **syncobjs;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 __user *access_flags =3D u64_to_user_ptr(ar=
gs-&gt;access_flags);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 __user *values =3D u64_to_user_ptr(args-&gt=
;values);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ=
_TIMELINE))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EOPNOTSUPP;=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (args-&gt;pad !=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (args-&gt;count_handles =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_syncobj_array_find(file_private,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u64_to_user_ptr(args-&=
gt;handles),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args-&gt;count_handles=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;syncobjs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; args-&gt;count_handles; i+=
+) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 flags;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (get_user(flags,=
 &amp;access_flags[i])) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D -EFAULT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (flags &amp; DRM=
_SYNCOBJ_BINARY_VALUE_READ) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0u64 value =3D atomic64_read(&amp;syncobjs[i]-&gt;binary_payload);=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (put_user(value, &amp;values[i])) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EFAULT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (flags &amp; DRM=
_SYNCOBJ_BINARY_VALUE_INC)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0atomic64_inc(&amp;syncobjs[i]-&gt;binary_payload);<br></blockquot=
e><div><br></div><div>You go out of your way to use atomics but then don&#3=
9;t bother to do the read and increment atomically.=C2=A0 Maybe something l=
ike</div><div><br></div><div>u64 value =3D 0;<br></div><div>if (flags &amp;=
 DRM_SYNCOBJ_BINARY_VALUE_INC)</div><div>=C2=A0=C2=A0 value =3D atomic64_in=
c(...);</div><div>else if (flags &amp; DRM_SYNCOBJ_BINARY_VALUE_READ)</div>=
<div>=C2=A0=C2=A0 value =3D atomic64_read(...);</div><div><br></div><div>if=
 (flags &amp; DRM_SYNCOBJ_BINARY_VALUE_READ)</div><div>=C2=A0=C2=A0 put_use=
r(...)<br></div><div><br></div><div>--Jason</div><div><br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_syncobj_array_free(syncobjs, args-&gt;count=
_handles);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h<br>
index 6cf7243a1dc5..aa76cb3f9107 100644<br>
--- a/include/drm/drm_syncobj.h<br>
+++ b/include/drm/drm_syncobj.h<br>
@@ -61,6 +61,15 @@ struct drm_syncobj {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* @file: A file backing for this syncobj.=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct file *file;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * @binary_payload: A 64bit payload for binary =
syncobjs.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * We use the payload value to wait on binary s=
yncobj fences to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * materialize. It is a reservation mechanism f=
or the signaler to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * express that at some point in the future a d=
ma fence with the same<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * seqno will be put into the syncobj.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0atomic64_t binary_payload;<br>
=C2=A0};<br>
<br>
=C2=A0void drm_syncobj_free(struct kref *kref);<br>
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h<br>
index 8a5b2f8f8eb9..78a0a413b788 100644<br>
--- a/include/uapi/drm/drm.h<br>
+++ b/include/uapi/drm/drm.h<br>
@@ -785,6 +785,22 @@ struct drm_syncobj_timeline_array {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u32 pad;<br>
=C2=A0};<br>
<br>
+struct drm_syncobj_binary_array {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* A pointer to an array of u32 syncobj handles=
. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 handles;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* A pointer to an array of u32 access flags fo=
r each handle. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 access_flags;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The binary value of a syncobj is read before=
 it is incremented. */<br>
+#define DRM_SYNCOBJ_BINARY_VALUE_READ (1u &lt;&lt; 0)<br>
+#define DRM_SYNCOBJ_BINARY_VALUE_INC=C2=A0 (1u &lt;&lt; 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* A pointer to an array of u64 values written =
to by the kernel if the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * handle is flagged for reading.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 values;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* The length of the 3 arrays above. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 count_handles;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 pad;<br>
+};<br>
<br>
=C2=A0/* Query current scanout sequence number */<br>
=C2=A0struct drm_crtc_get_sequence {<br>
@@ -946,6 +962,7 @@ extern &quot;C&quot; {<br>
=C2=A0#define DRM_IOCTL_SYNCOBJ_QUERY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 DRM_IOWR(0xCB, struct drm_syncobj_timeline_array)<br>
=C2=A0#define DRM_IOCTL_SYNCOBJ_TRANSFER=C2=A0 =C2=A0 =C2=A0DRM_IOWR(0xCC, =
struct drm_syncobj_transfer)<br>
=C2=A0#define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL=C2=A0 =C2=A0 =C2=A0 DRM_IOW=
R(0xCD, struct drm_syncobj_timeline_array)<br>
+#define DRM_IOCTL_SYNCOBJ_BINARY=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_IOWR(0xCE, =
struct drm_syncobj_binary_array)<br>
<br>
=C2=A0/**<br>
=C2=A0 * Device specific ioctls should only be in their respective headers<=
br>
-- <br>
2.23.0.rc1<br>
<br>
</blockquote></div></div>

--000000000000e3775a0590a547f9--

--===============0703526634==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0703526634==--
