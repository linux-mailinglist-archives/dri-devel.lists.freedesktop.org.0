Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC00A49E9F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 17:21:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D06F10ECF2;
	Fri, 28 Feb 2025 16:21:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="f9KlYtnN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A342710ECF2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 16:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740759704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cM0k+Bwy0Ajs/EnudYCyWU75M9oEd3RuR3NF/YcO8X0=;
 b=f9KlYtnN+Wir43jJKQrTEhZggQgGtQ5gwYwKTH8oaGNOLf50PqUxtH7sAGYZkvZVXKNGQo
 NeZPRtZDUO2k6134gforpkVRGDV2vT0eHFDsx9MQjiZ5IHAM7G0GIE8cWjPkLrxJr5xJl6
 eegxEydD1BctIUMH4ZTMAFeBeNNl2Gc=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-z-_Q6zUWM9S4I7PVFPKcwA-1; Fri, 28 Feb 2025 11:21:42 -0500
X-MC-Unique: z-_Q6zUWM9S4I7PVFPKcwA-1
X-Mimecast-MFC-AGG-ID: z-_Q6zUWM9S4I7PVFPKcwA_1740759702
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-6f2c7746509so34403417b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 08:21:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740759702; x=1741364502;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cM0k+Bwy0Ajs/EnudYCyWU75M9oEd3RuR3NF/YcO8X0=;
 b=kLBRidQ97kpQ13/u4+wCkXNM2wOxJIUN5akpRa1UzkxLJsmgwZ1RT26vwCvbc7Gnta
 l6SbAoGxBXc7KbN/fkHnDtxnNlEssWX++q3advedFCXgnczCorjn2FTYx3tkNKGVtZ1q
 MUcchMBh+2reNbSL9NUanG8N8llJizJEh0KBNihJdaBjlt6dKNCkRaHxGx3mmKPu+Ap9
 S4QGgk1CRYDbdSDMjEUWPMgiUFEDCkazZ21YRwlEcuAN95RcgxbxrHSZIHXuFAsD2SpP
 h58uVMryBX5z0zFyO/w7AE/bC3Ol7XnOzLXz63vi7TDvounEAak4I2e+IliwX9MM/y9d
 vWuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWxmkG4jSNTnAiJaE5Z7d9QQf8Np1m0YqdKb9zGUxC2J6eIR2W0g42bwAaWLiliVT5rhnDRu0n+z0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzwkBY1ZQ29Fn9wOpVXUOFja67FwJEEzQiB8Aq8vWiXzwjljkv
 397wumd0+MpsTqe6fN8kQnkpVWEucgovb46D9YaYbjwd+KWhkmt2rj5t6lCGAntkSFwK4zFfaU5
 d8nwqLgpODPlPgK7dNGYS/JKTJDcST9KSvS009DC6s9pe06cYtMZKgeMRR5V6IDFCJNF39pzDQF
 94eymNLqRnmaGG5h3UtwiRolaAKQIeHMHbTRFaqMHpTe+zfvFv
X-Gm-Gg: ASbGncsOkp3XAjNl8kVh2aT6UFfBjOHf54JnsqsiSF3ZvsxDiKDuDNQNgr3VWMm37By
 bjgwsGI2hehHtnSu+5qTZelvsvjLmALqhcGxUghJ/XI0Yxvnm13GuCZcQNqb7Lp6ddYRBduw=
X-Received: by 2002:a05:690c:6912:b0:6fb:9389:3cde with SMTP id
 00721157ae682-6fd49f9f4d7mr54066337b3.3.1740759702038; 
 Fri, 28 Feb 2025 08:21:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUlHT7XMbqFlEzbDG9cTuYWCESogXY01q37qQWYCqTD1ei++9PW59Uq3RqvsHI41X+KuTsRp9Wgf+KqbFCam8=
X-Received: by 2002:a05:690c:6912:b0:6fb:9389:3cde with SMTP id
 00721157ae682-6fd49f9f4d7mr54065227b3.3.1740759700321; Fri, 28 Feb 2025
 08:21:40 -0800 (PST)
MIME-Version: 1.0
References: <20250226172457.217725-1-tzimmermann@suse.de>
 <20250226172457.217725-11-tzimmermann@suse.de>
In-Reply-To: <20250226172457.217725-11-tzimmermann@suse.de>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 28 Feb 2025 11:21:29 -0500
X-Gm-Features: AQ5f1JqOG9kZwYooFr2gpFDg6HLWv9s8fD5s1iScP1uek1lmdndFOi2CP79U_Ig
Message-ID: <CAN9Xe3TFP8PHcJFUaG1gp99fdqhgfjORhBfiBd=dHA8mmuhAgA@mail.gmail.com>
Subject: Re: [PATCH 10/10] drm/prime: Use dma_buf from GEM object instance
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 sumit.semwal@linaro.org, christian.koenig@amd.com, 
 dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dUvPL--_HGJoChgWoFV88sTcd7NNXIRwGQEL5ilV4M4_1740759702
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000093cc78062f363389"
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

--00000000000093cc78062f363389
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: ANusha Srivatsa <asrivats@redhat.com>


On Wed, Feb 26, 2025 at 12:28=E2=80=AFPM Thomas Zimmermann <tzimmermann@sus=
e.de>
wrote:

> Avoid dereferencing struct drm_gem_object.import_attach for the
> imported dma-buf. The dma_buf field in the GEM object instance refers
> to the same buffer. Prepares to make import_attach optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_prime.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 32a8781cfd67..bdb51c8f262e 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -453,13 +453,7 @@ struct dma_buf *drm_gem_prime_handle_to_dmabuf(struc=
t
> drm_device *dev,
>         }
>
>         mutex_lock(&dev->object_name_lock);
> -       /* re-export the original imported object */
> -       if (obj->import_attach) {
> -               dmabuf =3D obj->import_attach->dmabuf;
> -               get_dma_buf(dmabuf);
> -               goto out_have_obj;
> -       }
> -
> +       /* re-export the original imported/exported object */
>         if (obj->dma_buf) {
>                 get_dma_buf(obj->dma_buf);
>                 dmabuf =3D obj->dma_buf;
> --
> 2.48.1
>
>

--00000000000093cc78062f363389
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Reviewed-by: ANusha Srivatsa &lt;<a href=3D"mailto:as=
rivats@redhat.com">asrivats@redhat.com</a>&gt;</div><div><br></div><br><div=
 class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Wed, Feb 26, 2025 at 12:28=E2=80=AFPM Thomas Zimmermann &lt;<a h=
ref=3D"mailto:tzimmermann@suse.de">tzimmermann@suse.de</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Avoid dereferencing s=
truct drm_gem_object.import_attach for the<br>
imported dma-buf. The dma_buf field in the GEM object instance refers<br>
to the same buffer. Prepares to make import_attach optional.<br>
<br>
Signed-off-by: Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.de"=
 target=3D"_blank">tzimmermann@suse.de</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/drm_prime.c | 8 +-------<br>
=C2=A01 file changed, 1 insertion(+), 7 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c<br>
index 32a8781cfd67..bdb51c8f262e 100644<br>
--- a/drivers/gpu/drm/drm_prime.c<br>
+++ b/drivers/gpu/drm/drm_prime.c<br>
@@ -453,13 +453,7 @@ struct dma_buf *drm_gem_prime_handle_to_dmabuf(struct =
drm_device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_lock(&amp;dev-&gt;object_name_lock);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* re-export the original imported object */<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (obj-&gt;import_attach) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dmabuf =3D obj-&gt;=
import_attach-&gt;dmabuf;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_dma_buf(dmabuf)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_have_obj;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* re-export the original imported/exported obj=
ect */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (obj-&gt;dma_buf) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_dma_buf(obj-&gt=
;dma_buf);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dmabuf =3D obj-&gt;=
dma_buf;<br>
-- <br>
2.48.1<br>
<br>
</blockquote></div></div>

--00000000000093cc78062f363389--

