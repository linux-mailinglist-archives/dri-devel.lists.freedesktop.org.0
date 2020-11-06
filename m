Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C72A52A8C17
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 02:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB016E889;
	Fri,  6 Nov 2020 01:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E516E889
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 01:28:47 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 184so5083828lfd.6
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 17:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mNiMWXZKBNUTUymcPVbz2ZT1OHhWtHE60ayxKyBfMtg=;
 b=FsFsGPAXgZQeempcFXAu2TEzYNUjYqouHE0nWVwvELkpKm6yQZZ+TmEZdFBX/mkfFa
 i10pKcA/CiRcoyBGCsUOdo6rxjNaLSa6tZbY/5PQCPKvZUWj9ddPy0HjpGRt5orKPKBV
 V3Y+UJGzS4xwqBkmE5KkWtwaNvFE7u4gTgmmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mNiMWXZKBNUTUymcPVbz2ZT1OHhWtHE60ayxKyBfMtg=;
 b=I+5Stzi+5mw3DZi4vi+Qt5AscfS8Uill4YUDOeGklxyvcIu8dBHvYrjtdHJIK5zXO3
 kuw9baO5+qEpZeOKQYyoUU+JEoEYbnv0zO22tyNiua8v+Ct9pWoCBDYnm2xBcZtrCGkS
 mwpkge8VrFCp7ob+HnVK6MK2k4asZKT1Ep6RWzukamG2IgEGqNsINtLbk0INtc3wLXyx
 7OGETTWf+CquwHcdy/ExLBJbXUJRvTno0ubGdSrIWbQ5RnM8MiiS3EK3H/gfFCsXouX9
 2BQ0riGWADGYCEGiRDrgNJ7fTtkHTnA8I0ERVchP5QYMCiZBlhh8TTr30+hZHt0QphCW
 LyVQ==
X-Gm-Message-State: AOAM5306aZq1RFr3grAmFjuP32at8IZrpmWAWC7WGHw9fzy7oA4pSGeu
 cZQK8mSIDqYu4FRVwdJcHaXryYZbLFpEnA==
X-Google-Smtp-Source: ABdhPJz27MNaMvPY2xxGJY+krcUf0nlT1vzGRB63cbG2uPIbqxf7jqDNHmZN2m3Q6F2rZ4nC/KxJYg==
X-Received: by 2002:ac2:4ad0:: with SMTP id m16mr2205715lfp.421.1604626125488; 
 Thu, 05 Nov 2020 17:28:45 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173])
 by smtp.gmail.com with ESMTPSA id y6sm351117lfh.99.2020.11.05.17.28.44
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2020 17:28:44 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id o13so3597291ljj.11
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 17:28:44 -0800 (PST)
X-Received: by 2002:a2e:9188:: with SMTP id f8mr1946372ljg.333.1604626124278; 
 Thu, 05 Nov 2020 17:28:44 -0800 (PST)
MIME-Version: 1.0
References: <20201030114808.GD3251003@mwanda>
In-Reply-To: <20201030114808.GD3251003@mwanda>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Thu, 5 Nov 2020 17:28:32 -0800
X-Gmail-Original-Message-ID: <CAAfnVB=+iYmS-O_PQUEJXY7hUW-B6LA=o0iXy0QN_v+NpL1iwA@mail.gmail.com>
Message-ID: <CAAfnVB=+iYmS-O_PQUEJXY7hUW-B6LA=o0iXy0QN_v+NpL1iwA@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Fix a double free in virtio_gpu_cmd_map()
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Content-Type: multipart/mixed; boundary="===============1187858872=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1187858872==
Content-Type: multipart/alternative; boundary="00000000000022fc1405b36622e2"

--00000000000022fc1405b36622e2
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 30, 2020 at 4:48 AM Dan Carpenter <dan.carpenter@oracle.com>
wrote:

> This is freed both here and in the caller (virtio_gpu_vram_map()) so
> it's a double free.  The correct place is only in the caller.
>
> Fixes: 16845c5d5409 ("drm/virtio: implement blob resources: implement vram
> object")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_vq.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c
> b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index 72586cd8cc4c..3f200306c9d7 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -1212,10 +1212,8 @@ int virtio_gpu_cmd_map(struct virtio_gpu_device
> *vgdev,
>         struct virtio_gpu_resp_map_info *resp_buf;
>
>         resp_buf = kzalloc(sizeof(*resp_buf), GFP_KERNEL);
> -       if (!resp_buf) {
> -               virtio_gpu_array_put_free(objs);
> +       if (!resp_buf)
>                 return -ENOMEM;
> -       }
>
>         cmd_p = virtio_gpu_alloc_cmd_resp
>                 (vgdev, virtio_gpu_cmd_resource_map_cb, &vbuf,
> sizeof(*cmd_p),
> --
> 2.28.0
>
Reviewed-by: Gurchetan Singh <gurchetansingh@chromium.org>

--00000000000022fc1405b36622e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 30, 2020 at 4:48 AM Dan C=
arpenter &lt;<a href=3D"mailto:dan.carpenter@oracle.com">dan.carpenter@orac=
le.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">This is freed both here and in the caller (virtio_gpu_vram_map()) so<=
br>
it&#39;s a double free.=C2=A0 The correct place is only in the caller.<br>
<br>
Fixes: 16845c5d5409 (&quot;drm/virtio: implement blob resources: implement =
vram object&quot;)<br>
Signed-off-by: Dan Carpenter &lt;<a href=3D"mailto:dan.carpenter@oracle.com=
" target=3D"_blank">dan.carpenter@oracle.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_vq.c | 4 +---<br>
=C2=A01 file changed, 1 insertion(+), 3 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/v=
irtgpu_vq.c<br>
index 72586cd8cc4c..3f200306c9d7 100644<br>
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c<br>
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c<br>
@@ -1212,10 +1212,8 @@ int virtio_gpu_cmd_map(struct virtio_gpu_device *vgd=
ev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_resp_map_info *resp_buf;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 resp_buf =3D kzalloc(sizeof(*resp_buf), GFP_KER=
NEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!resp_buf) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virtio_gpu_array_pu=
t_free(objs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!resp_buf)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd_p =3D virtio_gpu_alloc_cmd_resp<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (vgdev, virtio_gpu_=
cmd_resource_map_cb, &amp;vbuf, sizeof(*cmd_p),<br>
-- <br>
2.28.0<br></blockquote><div>Reviewed-by: Gurchetan Singh &lt;<a href=3D"mai=
lto:gurchetansingh@chromium.org">gurchetansingh@chromium.org</a>&gt;<br></d=
iv><div>=C2=A0</div></div></div>

--00000000000022fc1405b36622e2--

--===============1187858872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1187858872==--
