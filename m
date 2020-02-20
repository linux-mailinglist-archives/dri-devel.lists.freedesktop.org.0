Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0973165982
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 09:45:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F056ECF4;
	Thu, 20 Feb 2020 08:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887746E898
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 00:20:01 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id l75so1299091ybf.6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 16:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=36F2lNaF38y0LbuRM+I7nJGoQSvwKtFiTPSapZtRDic=;
 b=JXcYfoKcZzSNA9AQDYVMEIA93tqD1wadWd3C/e6uB7XzuPAb3nOSUtN+V50JEGuu/S
 UxjoTxvxlLCTW5zYVRSaPhxIz7QU36Ub0xdbV2ZllCFJzggayfmFJdwX1XWhGx5UN1cT
 aPfapxCN/d8TbTCnYuBmNn4zoxc9m024gmpZLFbisFmSOpVkoH/cxa5tteS72GQZdXWO
 DmFNq+u5i3BQxA+3/6AdtFHy+RFMd0OlBjM/WbTixzHwH15flK1yE4UzGwfuW+yg/1GF
 U6ePKAvsxxBLANFpqy2OeK0CJxJDvwnWo5+x6EGN/elA/urFevdvrnK9T+yTvsuadwVK
 f2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=36F2lNaF38y0LbuRM+I7nJGoQSvwKtFiTPSapZtRDic=;
 b=py95vbWmiqELaAd8RSUzC/IVNrldg/VBhpviaq0k5BsQ7Ir8gjTVM+DMCkjG/SXLH3
 5/+nPt0a21OGseYB5RyiWJihzxIfss2tuQJGWeCqIMq8anEyZJ0Zzu8qHAbvmwIi9WrC
 BS2z0wNEVdINaso/PoxCpYlOwa0ouVcjcrxjMYLK73G9L29JZ3dsw93KDZ5y1hl4Lgne
 gO2V8WMqg/ZhZ2ElTyTh8MdcWXnkQToXmQWjYVkzuBMHYNH9Ph7iiuqutwYwgI836Pr+
 8LIDY43Wgwf/e6KC0gw95ZM6YnoQ4KlEIrPQyXVE9j9S2ZMTHowc2WFTQEQvqjFrm9Z4
 TAEA==
X-Gm-Message-State: APjAAAVfWYZmaNMVoFyXYTqI772b9ytAvYzmYTvhRiJ7T/pGbQmn+U/O
 7bkFZKWMF6XPSBKh4x1qq2bhg1rjn0erK7Tut9wZLLha5MA=
X-Google-Smtp-Source: APXvYqzYdr4CRBlF12Uukp4K/XNMoJNs2x/vQYLri4tzxVIHNQpJ6jec1DkNEseAoqCxSELUaeoKlN8PKJDifTUVCIA=
X-Received: by 2002:a5b:b51:: with SMTP id b17mr24801951ybr.298.1582158000391; 
 Wed, 19 Feb 2020 16:20:00 -0800 (PST)
MIME-Version: 1.0
References: <20200219204002.220744-1-jbates@chromium.org>
In-Reply-To: <20200219204002.220744-1-jbates@chromium.org>
From: John Bates <jbates@google.com>
Date: Wed, 19 Feb 2020 16:19:48 -0800
Message-ID: <CALTgcPkPmg12rE286fUxyZQO2s5qJuud=BD-4GnrtY8sVB6OSA@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: fix virtio-gpu resource id creation race
To: John Bates <jbates@chromium.org>
X-Mailman-Approved-At: Thu, 20 Feb 2020 08:45:37 +0000
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/mixed; boundary="===============0474983453=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0474983453==
Content-Type: multipart/alternative; boundary="00000000000097f81e059ef6dd41"

--00000000000097f81e059ef6dd41
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 19, 2020 at 12:40 PM John Bates <jbates@chromium.org> wrote:

> The previous code was not thread safe and caused
> undefined behavior from spurious duplicate resource IDs.
> In this patch, an atomic_t is used instead. We no longer
> see any duplicate IDs in tests with this change.
>
> Signed-off-by: John Bates <jbates@chromium.org>
> ---
>
>  drivers/gpu/drm/virtio/virtgpu_object.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c
> b/drivers/gpu/drm/virtio/virtgpu_object.c
> index 017a9e0fc3bb..b11c1fce1770 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -42,8 +42,8 @@ static int virtio_gpu_resource_id_get(struct
> virtio_gpu_device *vgdev,
>                  * "f91a9dd35715 Fix unlinking resources from hash
>                  * table." (Feb 2019) fixes the bug.
>                  */
> -               static int handle;
> -               handle++;
> +               static atomic_t seqno;
> +               int handle = atomic_inc_return(&seqno);
>                 *resid = handle + 1;
>         } else {
>                 int handle = ida_alloc(&vgdev->resource_ida, GFP_KERNEL);
> --
> 2.25.0.265.gbab2e86ba0-goog
>
>

--00000000000097f81e059ef6dd41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Feb 19, 2020 at 12:40 PM John Bates &lt;<a hre=
f=3D"mailto:jbates@chromium.org">jbates@chromium.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">The previous code was n=
ot thread safe and caused<br>
undefined behavior from spurious duplicate resource IDs.<br>
In this patch, an atomic_t is used instead. We no longer<br>
see any duplicate IDs in tests with this change.<br>
<br>
Signed-off-by: John Bates &lt;<a href=3D"mailto:jbates@chromium.org" target=
=3D"_blank">jbates@chromium.org</a>&gt;<br>
---<br>
<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_object.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virt=
io/virtgpu_object.c<br>
index 017a9e0fc3bb..b11c1fce1770 100644<br>
--- a/drivers/gpu/drm/virtio/virtgpu_object.c<br>
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c<br>
@@ -42,8 +42,8 @@ static int virtio_gpu_resource_id_get(struct virtio_gpu_d=
evice *vgdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* &quot;f91a9=
dd35715 Fix unlinking resources from hash<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* table.&quot=
; (Feb 2019) fixes the bug.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static int handle;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0handle++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static atomic_t seq=
no;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int handle =3D atom=
ic_inc_return(&amp;seqno);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *resid =3D handle +=
 1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int handle =3D ida_=
alloc(&amp;vgdev-&gt;resource_ida, GFP_KERNEL);<br>
-- <br>
2.25.0.265.gbab2e86ba0-goog<br>
<br>
</blockquote></div>

--00000000000097f81e059ef6dd41--

--===============0474983453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0474983453==--
