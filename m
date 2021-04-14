Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C612F35FE74
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 01:32:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074E96E0AD;
	Wed, 14 Apr 2021 23:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3556E0AD
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 23:32:01 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id i10so122967lfe.11
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 16:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y6SXXgC1JcZLJOEZQFvljxfI1U6Rzpl+osgbAlOdSjQ=;
 b=ZXfSdsz8DAT2/9r2mEM9bbdUHcHXO0DUvD96w1N4FoUvKA+uAYHAWkczFCEL0CuEMW
 CrYDP0RHVGX3z+q0dVMLtIccubVZGVCmxz+sAmwmTaaULFQM/ftlJXrdKdt3EN07SxcY
 XbWrWl6XzjkLAmNKpGNfQSqc7CV8ed7HquXck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y6SXXgC1JcZLJOEZQFvljxfI1U6Rzpl+osgbAlOdSjQ=;
 b=ucsPP33xMLx+wp16Gx1rAKgEz4A0g0FQgVpCHBBtg0WV8CJEklJCOKWi3oMuwU5ifZ
 mEH8SEV2u1NdVd/BeECuQX1V4lna70BEOFjsCG2+nFR817aMGv9eEJrCxmZwRpA99i0J
 juLXj36MMQkmIBmWsXM5mP2lu7M54SZSoIJAcjnA996U7ji7p9O7v0ClWqk3aYX5dqH5
 EC2nKAv5Tubda6wXAJBsoek4luUCytiuIsxj83NpY7z4UDwWzCo8XLrusJ8o+NHyhZ3c
 g9gL0z5wdwvkHdh4h3SlwF/b9sO8HOIpTdI3gjaeHzljtJ4UzPsXx7aMuLbzS4dZGZWP
 2l6Q==
X-Gm-Message-State: AOAM532MQ/GsmMSosDoYfbUYLmjBTu0pqNBEZYcdrcjHGBPXoTCm5BH1
 zGBXerhYd5DM8SUwH9esTDLZ42Y9HJYFXQ==
X-Google-Smtp-Source: ABdhPJxR/RGoMU14K5vY+V5Qfv16wE/DT0X7kLtkjXKnCnmMIcH/IkNZqXW4RmTO2p5ijZ6jb2Al1w==
X-Received: by 2002:a19:257:: with SMTP id 84mr392738lfc.575.1618443119477;
 Wed, 14 Apr 2021 16:31:59 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com.
 [209.85.208.178])
 by smtp.gmail.com with ESMTPSA id a4sm344207lfs.130.2021.04.14.16.31.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 16:31:59 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id a36so14233549ljq.8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 16:31:59 -0700 (PDT)
X-Received: by 2002:a2e:819a:: with SMTP id e26mr218683ljg.222.1618443118753; 
 Wed, 14 Apr 2021 16:31:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAAfnVBmkEHB=j3rJyLPOixFRfPD=WQGVs85PuS0RYmViOgVAQA@mail.gmail.com>
 <20210413052614.2486768-1-vivek.kasireddy@intel.com>
In-Reply-To: <20210413052614.2486768-1-vivek.kasireddy@intel.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Wed, 14 Apr 2021 16:31:45 -0700
X-Gmail-Original-Message-ID: <CAAfnVBm5UUrW-j0OnokPHCzGo35UNkmpLNTqCWdQF-arR7e1ig@mail.gmail.com>
Message-ID: <CAAfnVBm5UUrW-j0OnokPHCzGo35UNkmpLNTqCWdQF-arR7e1ig@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Create Dumb BOs as guest Blobs (v3)
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1620727332=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1620727332==
Content-Type: multipart/alternative; boundary="0000000000002f239e05bff72705"

--0000000000002f239e05bff72705
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 12, 2021 at 10:36 PM Vivek Kasireddy <vivek.kasireddy@intel.com>
wrote:

> If support for Blob resources is available, then dumb BOs created
> by the driver can be considered as guest Blobs.
>
> v2: Don't skip transfer and flush commands as part of plane update
> as the device may have created a shared mapping. (Gerd)
>
> v3: Don't create dumb BOs as Guest blobs if Virgl is enabled. (Gurchetan)
>

I think it is a good start and advances QEMU blobs.  Improvements are
always possible, but may be made at a future time.

Acked-by: Gurchetan Singh <gurchetansingh@chromium.org>


>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_gem.c    | 8 ++++++++
>  drivers/gpu/drm/virtio/virtgpu_object.c | 3 +++
>  2 files changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c
> b/drivers/gpu/drm/virtio/virtgpu_gem.c
> index 8502400b2f9c..2de61b63ef91 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
> @@ -64,6 +64,7 @@ int virtio_gpu_mode_dumb_create(struct drm_file
> *file_priv,
>  {
>         struct drm_gem_object *gobj;
>         struct virtio_gpu_object_params params = { 0 };
> +       struct virtio_gpu_device *vgdev = dev->dev_private;
>         int ret;
>         uint32_t pitch;
>
> @@ -79,6 +80,13 @@ int virtio_gpu_mode_dumb_create(struct drm_file
> *file_priv,
>         params.height = args->height;
>         params.size = args->size;
>         params.dumb = true;
> +
> +       if (vgdev->has_resource_blob && !vgdev->has_virgl_3d) {
> +               params.blob_mem = VIRTGPU_BLOB_MEM_GUEST;
> +               params.blob_flags = VIRTGPU_BLOB_FLAG_USE_SHAREABLE;
> +               params.blob = true;
> +       }
> +
>         ret = virtio_gpu_gem_create(file_priv, dev, &params, &gobj,
>                                     &args->handle);
>         if (ret)
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c
> b/drivers/gpu/drm/virtio/virtgpu_object.c
> index 4ff1ec28e630..f648b0e24447 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -254,6 +254,9 @@ int virtio_gpu_object_create(struct virtio_gpu_device
> *vgdev,
>         }
>
>         if (params->blob) {
> +               if (params->blob_mem == VIRTGPU_BLOB_MEM_GUEST)
> +                       bo->guest_blob = true;
> +
>                 virtio_gpu_cmd_resource_create_blob(vgdev, bo, params,
>                                                     ents, nents);
>         } else if (params->virgl) {
> --
> 2.26.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--0000000000002f239e05bff72705
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 12, 2021 at 10:36 PM Vive=
k Kasireddy &lt;<a href=3D"mailto:vivek.kasireddy@intel.com">vivek.kasiredd=
y@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">If support for Blob resources is available, then dumb BOs create=
d<br>
by the driver can be considered as guest Blobs.<br>
<br>
v2: Don&#39;t skip transfer and flush commands as part of plane update<br>
as the device may have created a shared mapping. (Gerd)<br>
<br>
v3: Don&#39;t create dumb BOs as Guest blobs if Virgl is enabled. (Gurcheta=
n)<br></blockquote><div><br></div><div>I think it is a good start and advan=
ces QEMU blobs.=C2=A0 Improvements are always possible, but may be made at =
a future time.</div><div><br></div><div>Acked-by: Gurchetan Singh &lt;<a hr=
ef=3D"mailto:gurchetansingh@chromium.org">gurchetansingh@chromium.org</a>&g=
t;<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
Cc: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank=
">kraxel@redhat.com</a>&gt;<br>
Signed-off-by: Vivek Kasireddy &lt;<a href=3D"mailto:vivek.kasireddy@intel.=
com" target=3D"_blank">vivek.kasireddy@intel.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_gem.c=C2=A0 =C2=A0 | 8 ++++++++<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_object.c | 3 +++<br>
=C2=A02 files changed, 11 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/=
virtgpu_gem.c<br>
index 8502400b2f9c..2de61b63ef91 100644<br>
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c<br>
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c<br>
@@ -64,6 +64,7 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_pri=
v,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_gem_object *gobj;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_object_params params =3D { 0 =
};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_device *vgdev =3D dev-&gt;dev=
_private;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t pitch;<br>
<br>
@@ -79,6 +80,13 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_pr=
iv,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 params.height =3D args-&gt;height;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 params.size =3D args-&gt;size;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 params.dumb =3D true;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (vgdev-&gt;has_resource_blob &amp;&amp; !vgd=
ev-&gt;has_virgl_3d) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params.blob_mem =3D=
 VIRTGPU_BLOB_MEM_GUEST;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params.blob_flags =
=3D VIRTGPU_BLOB_FLAG_USE_SHAREABLE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params.blob =3D tru=
e;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D virtio_gpu_gem_create(file_priv, dev, &=
amp;params, &amp;gobj,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;args-&gt;handle);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virt=
io/virtgpu_object.c<br>
index 4ff1ec28e630..f648b0e24447 100644<br>
--- a/drivers/gpu/drm/virtio/virtgpu_object.c<br>
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c<br>
@@ -254,6 +254,9 @@ int virtio_gpu_object_create(struct virtio_gpu_device *=
vgdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (params-&gt;blob) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (params-&gt;blob=
_mem =3D=3D VIRTGPU_BLOB_MEM_GUEST)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bo-&gt;guest_blob =3D true;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_gpu_cmd_reso=
urce_create_blob(vgdev, bo, params,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ents, nents);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (params-&gt;virgl) {<br>
-- <br>
2.26.2<br>
<br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">dri-de=
vel@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" rel=3D=
"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listin=
fo/dri-devel</a><br>
</blockquote></div></div>

--0000000000002f239e05bff72705--

--===============1620727332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1620727332==--
