Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B15A49E50
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 17:08:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2BF10ECE4;
	Fri, 28 Feb 2025 16:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RizAFMq/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286F610ECE4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 16:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740758882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pCUNnOUFxhGudI2m7fOYRV9vHFp+Q9QH2z1YGgQJ7mc=;
 b=RizAFMq/BERDDTv3CjPmujGSFRd90tsni7RifRx0PNPCZk2QzexKDDiQ+kx367v1oOPNkT
 ns0WszKJC8lpXsSH/MQgKQINzRVlA5lzegD9jo4qygdGrsyHCTaEbRJARFnCXTiZRZiAcE
 swy5CpO0bR6ZTpZkuOXvT+lfW7KwSbE=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-PimctnpzPSmkmIXjVe0u_g-1; Fri, 28 Feb 2025 11:07:59 -0500
X-MC-Unique: PimctnpzPSmkmIXjVe0u_g-1
X-Mimecast-MFC-AGG-ID: PimctnpzPSmkmIXjVe0u_g_1740758878
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-6fd4cfafeb0so6770517b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 08:07:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740758878; x=1741363678;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pCUNnOUFxhGudI2m7fOYRV9vHFp+Q9QH2z1YGgQJ7mc=;
 b=QTlVxBzVsFj3nJnl/qepf9mnLahHnr5qL9L1NowmF6xH1uAqYkZ+OuyHk/fyyjwCZQ
 Mb59QOX+31dx+sbd6enYjv4DZ+2ztGEPG5g9d01NKCoMBaw/wrYUcKoJykBRz0jqzo3W
 lMn9gWp7OltkvutnjNUvxUkKv1AHEkPHz4jPSP3Ob1OPyoNcIeHTm/syftw24HoOOW7U
 P1i4Dxtq7Y47wFUp0WieDISqgxPBznODg0W/NMyxAMknv/S0tj2P+1e9eXteVJgpPHXY
 J7f7pB6k+8ECs0o5cL+5mTEw9HWFQhC9LFmZozV1xyMZ0+jpTy5ZNKrUWC2s/D5o+pub
 aXbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS5gd4ix/8A3rr0+41BODVQkhEdZEd/HAeYffVD16RD5snLeZvWVSzGdlZliK0sosB7O1/GS3isN4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGFdndedqo/CUG1n9HrtdvzBfu+RFwRBmmiEyYbALPK8FvhsVb
 qFy83LavZUN5N0uAWmK/eFYvdCndBaRRndmeurh6IIZ2mUgcE6zhny8vMZr5hqNmVqJDj4qgMYB
 /snCfM8JF00zG51UlCn9wvbnEYFAvaeuzz+vIYcmFazm6u/wbZXZeMoGCNrKz8nojuZJfugX/M+
 9b3A/9kC2A8v3R/sDMXotvRrjZawt0aYqiRE/ItbeYmDjlRmfgmiE=
X-Gm-Gg: ASbGnctIoQ11RSJde7pkvYT0eATQFaJQvnt+XBcFQSt+52gXIJ7yEGqq5lMNpJfaPD4
 vm3ZTIZUvDVojXdvbtiVy5FgqRE0XyXxe/1jtxYZnVL6J7fQ10UQeZpqZkxd3aYJsr7BMC5c=
X-Received: by 2002:a05:690c:9505:b0:6fb:ae6b:a340 with SMTP id
 00721157ae682-6fd4a0c4dc1mr43013667b3.30.1740758878206; 
 Fri, 28 Feb 2025 08:07:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFexqkK9MnfhG3d3T1/fs939O/Q7Bqn3dMCsI0pPbTVk7oqGMWF9r5UJowMD8QSw5eIDXR0tJKEwf8jKcmdjn8=
X-Received: by 2002:a05:690c:9505:b0:6fb:ae6b:a340 with SMTP id
 00721157ae682-6fd4a0c4dc1mr43013447b3.30.1740758877935; Fri, 28 Feb 2025
 08:07:57 -0800 (PST)
MIME-Version: 1.0
References: <20250226172457.217725-1-tzimmermann@suse.de>
 <20250226172457.217725-3-tzimmermann@suse.de>
In-Reply-To: <20250226172457.217725-3-tzimmermann@suse.de>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 28 Feb 2025 11:07:47 -0500
X-Gm-Features: AQ5f1Jo_luq8whmVRkB0-Gpo-_1nyxGYecNvS1kquT6FECmmjDpdZ4-3aUZbhQo
Message-ID: <CAN9Xe3SsB1tE5to1L8ZvdoHWJU88U7zeWUspFz_R-AnrVPiKHQ@mail.gmail.com>
Subject: Re: [PATCH 02/10] drm/gem-dma: Test for imported buffers with
 drm_gem_is_imported()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 sumit.semwal@linaro.org, christian.koenig@amd.com, 
 dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GTWCNhRE6SlrTiB3TEZm0GyS1B_a1xtpNSZLOSiM5bE_1740758878
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000008f2dea062f3602e0"
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

--0000000000008f2dea062f3602e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 12:28=E2=80=AFPM Thomas Zimmermann <tzimmermann@sus=
e.de>
wrote:

> Instead of testing import_attach for imported GEM buffers, invoke
> drm_gem_is_imported() to do the test.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_gem_dma_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c
> b/drivers/gpu/drm/drm_gem_dma_helper.c
> index 16988d316a6d..4f0320df858f 100644
> --- a/drivers/gpu/drm/drm_gem_dma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_dma_helper.c
> @@ -228,7 +228,7 @@ void drm_gem_dma_free(struct drm_gem_dma_object
> *dma_obj)
>         struct drm_gem_object *gem_obj =3D &dma_obj->base;
>         struct iosys_map map =3D IOSYS_MAP_INIT_VADDR(dma_obj->vaddr);
>
> -       if (gem_obj->import_attach) {
> +       if (drm_gem_is_imported(gem_obj)) {
>                 if (dma_obj->vaddr)
>
> dma_buf_vunmap_unlocked(gem_obj->import_attach->dmabuf, &map);
>                 drm_prime_gem_destroy(gem_obj, dma_obj->sgt);
>

Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>

> --
> 2.48.1
>
>

--0000000000008f2dea062f3602e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 26,=
 2025 at 12:28=E2=80=AFPM Thomas Zimmermann &lt;<a href=3D"mailto:tzimmerma=
nn@suse.de">tzimmermann@suse.de</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Instead of testing import_attach for impor=
ted GEM buffers, invoke<br>
drm_gem_is_imported() to do the test.<br>
<br>
Signed-off-by: Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.de"=
 target=3D"_blank">tzimmermann@suse.de</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/drm_gem_dma_helper.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem=
_dma_helper.c<br>
index 16988d316a6d..4f0320df858f 100644<br>
--- a/drivers/gpu/drm/drm_gem_dma_helper.c<br>
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c<br>
@@ -228,7 +228,7 @@ void drm_gem_dma_free(struct drm_gem_dma_object *dma_ob=
j)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_gem_object *gem_obj =3D &amp;dma_obj=
-&gt;base;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct iosys_map map =3D IOSYS_MAP_INIT_VADDR(d=
ma_obj-&gt;vaddr);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gem_obj-&gt;import_attach) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (drm_gem_is_imported(gem_obj)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dma_obj-&gt;vad=
dr)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dma_buf_vunmap_unlocked(gem_obj-&gt;import_attach-&gt;dmabuf, &a=
mp;map);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_prime_gem_destr=
oy(gem_obj, dma_obj-&gt;sgt);<br></blockquote><div><br></div><div>Reviewed-=
by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.com">asrivats@red=
hat.com</a>&gt; <br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
-- <br>
2.48.1<br>
<br>
</blockquote></div></div>

--0000000000008f2dea062f3602e0--

