Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3917D2EEB0F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 02:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759536E5C0;
	Fri,  8 Jan 2021 01:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1536E5BD
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 01:47:40 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id m12so19276042lfo.7
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 17:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ap146QiVJKRyw7qpW8EXxj09FBwEfTz5ND5GT8fEn+8=;
 b=i29Bu14X4aj6ZtNsqiOZeB2KTK+9DAfBjhfydfVdcF/80l4VQV6w0b3unrU2lc0FVA
 25kChPnJ1soI9hGJoWVg1JZiU1J24xFfWlTXoYQgs7W7OcVKsGc+6EtTF8D2KJ0PnE/Y
 ZTbbUF4Bofh3uBAsqIzPBxnc8BTshtNbr3CF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ap146QiVJKRyw7qpW8EXxj09FBwEfTz5ND5GT8fEn+8=;
 b=NUCsHzLZ/uGjSuueyPZQE6JTEkN8KNzuTRZKMTqe2W5v9uVPrXur/cTnqEZrqqwmO8
 a9T7yJFBUroRDa3LV8XUHIyPbZAbaVkkwU8eqLAsiomfg8RaHRPwxqAdN3DzxDgQz/kk
 hq92WBRC5dKKrXEwrcgGacz6kxrRkfp1K5y5maB//38+jWwDSGCUBjhSDCAJ/JgtxkNX
 WfokbwdBNit8EbjDLTTL73ycHk6U5aZwBVOj5OpcI9asFQpQxcdqTYWuTKpNx3eeJb3D
 G3MKNMy/wBxeKM9Tuz5ckUkT/GuvSRMD9CjI0n/1V6DP4aLsbwnhzTSG5ZrC3A+rgq+h
 D5pg==
X-Gm-Message-State: AOAM532o5NPCmJjUzDPg5iKH67yd+JZybbC0sDQIf5vwriH5oOhHnV4r
 PZOqrE4lwnzfrD5K6bpAOc3lO4LoD7+pNw==
X-Google-Smtp-Source: ABdhPJw1UGdZTC6UfDmo+biG9JEjBwJuF1piN1mhjQyKsofR8Leq1qQZr+JI1teochQgrmKRxjA2UQ==
X-Received: by 2002:a05:6512:108a:: with SMTP id
 j10mr604916lfg.381.1610070458992; 
 Thu, 07 Jan 2021 17:47:38 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52])
 by smtp.gmail.com with ESMTPSA id t20sm1707137ljk.58.2021.01.07.17.47.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 17:47:38 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id o17so19302761lfg.4
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 17:47:38 -0800 (PST)
X-Received: by 2002:a19:23cf:: with SMTP id j198mr574620lfj.509.1610070457946; 
 Thu, 07 Jan 2021 17:47:37 -0800 (PST)
MIME-Version: 1.0
References: <20210107210743.269885-1-olvaffe@gmail.com>
In-Reply-To: <20210107210743.269885-1-olvaffe@gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Thu, 7 Jan 2021 17:47:26 -0800
X-Gmail-Original-Message-ID: <CAAfnVBmZC+eoYij_awBv+pA+VCJFVbvYgyDRgbt02WToTA6-+w@mail.gmail.com>
Message-ID: <CAAfnVBmZC+eoYij_awBv+pA+VCJFVbvYgyDRgbt02WToTA6-+w@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: fix prime export for vram objects
To: Chia-I Wu <olvaffe@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/mixed; boundary="===============1249664234=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1249664234==
Content-Type: multipart/alternative; boundary="000000000000b5efbb05b859bd09"

--000000000000b5efbb05b859bd09
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 7, 2021 at 1:07 PM Chia-I Wu <olvaffe@gmail.com> wrote:

> commit 16845c5d5409 ("drm/virtio: implement blob resources: implement
> vram object") and commit c6069a02fa55 ("drm/virtgpu: Set PRIME export
> function in struct drm_gem_object_funcs") landed from different trees,
> resulting in prime export never working for vram objects.
>
> Cc: Gurchetan Singh <gurchetansingh@chromium.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_vram.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vram.c
> b/drivers/gpu/drm/virtio/virtgpu_vram.c
> index d6f215c4ff8d..5cc34e7330fa 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vram.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vram.c
> @@ -69,6 +69,7 @@ static const struct drm_gem_object_funcs
> virtio_gpu_vram_funcs = {
>         .close = virtio_gpu_gem_object_close,
>         .free = virtio_gpu_vram_free,
>         .mmap = virtio_gpu_vram_mmap,
> +       .export = virtgpu_gem_prime_export,
>  };
>
>  bool virtio_gpu_is_vram(struct virtio_gpu_object *bo)
> --
> 2.29.2.729.g45daf8777d-goog
>
>
Reviewed-by: Gurchetan Singh <gurchetansingh@chromium.org>

--000000000000b5efbb05b859bd09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 7, 2021 at 1:07 PM Chia-I=
 Wu &lt;<a href=3D"mailto:olvaffe@gmail.com">olvaffe@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">commit 16845c=
5d5409 (&quot;drm/virtio: implement blob resources: implement<br>
vram object&quot;) and commit c6069a02fa55 (&quot;drm/virtgpu: Set PRIME ex=
port<br>
function in struct drm_gem_object_funcs&quot;) landed from different trees,=
<br>
resulting in prime export never working for vram objects.<br>
<br>
Cc: Gurchetan Singh &lt;<a href=3D"mailto:gurchetansingh@chromium.org" targ=
et=3D"_blank">gurchetansingh@chromium.org</a>&gt;<br>
Cc: Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.de" target=3D"=
_blank">tzimmermann@suse.de</a>&gt;<br>
Cc: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank=
">kraxel@redhat.com</a>&gt;<br>
Signed-off-by: Chia-I Wu &lt;<a href=3D"mailto:olvaffe@gmail.com" target=3D=
"_blank">olvaffe@gmail.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_vram.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/drivers/gpu/drm/virtio/virtgpu_vram.c b/drivers/gpu/drm/virtio=
/virtgpu_vram.c<br>
index d6f215c4ff8d..5cc34e7330fa 100644<br>
--- a/drivers/gpu/drm/virtio/virtgpu_vram.c<br>
+++ b/drivers/gpu/drm/virtio/virtgpu_vram.c<br>
@@ -69,6 +69,7 @@ static const struct drm_gem_object_funcs virtio_gpu_vram_=
funcs =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .close =3D virtio_gpu_gem_object_close,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .free =3D virtio_gpu_vram_free,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .mmap =3D virtio_gpu_vram_mmap,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.export =3D virtgpu_gem_prime_export,<br>
=C2=A0};<br>
<br>
=C2=A0bool virtio_gpu_is_vram(struct virtio_gpu_object *bo)<br>
-- <br>
2.29.2.729.g45daf8777d-goog<br>
<br></blockquote><div><br></div>Reviewed-by: Gurchetan Singh &lt;<a href=3D=
"mailto:gurchetansingh@chromium.org" target=3D"_blank">gurchetansingh@chrom=
ium.org</a>&gt;<div class=3D"gmail-yj6qo"></div><div class=3D"gmail-adL"><b=
r></div><div>=C2=A0</div></div></div>

--000000000000b5efbb05b859bd09--

--===============1249664234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1249664234==--
