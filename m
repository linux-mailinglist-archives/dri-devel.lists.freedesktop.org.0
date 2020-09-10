Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE98263975
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 02:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F8989933;
	Thu, 10 Sep 2020 00:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270C389933
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 00:37:43 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id u4so5880353ljd.10
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 17:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D6vVm1lBYx5/XP/HS4iDSxpRxq4keD6rSO4vw5LOqnw=;
 b=VO03nTlZt1V5KCHouVrNVdPbdGQ+UdgZbM8pYf7ZfyFS9Xq43dLq/DUuOuQTrtVOa2
 We/A3zwhiWoc+Z5D7Ce8pFQxquvPUJTt52wBNjFtW4d4+2udHSzEd2YQo7dYSIjegNj+
 DWUThxIbqrVf56MpepNbjAD9MSici91kV/s2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D6vVm1lBYx5/XP/HS4iDSxpRxq4keD6rSO4vw5LOqnw=;
 b=X6TFGJU58NFtNC/1nwZGrMb27+0OIvDtnuw9npDn20z2UPUF1S85KHkgWNHhZtIu/p
 ZG7GPPHAkQ2f5JlWYm09KT6fc+b7vsIshhp+U1Xv5XctqUHtyMM+8lpVikfMNJ+kvlG+
 /N1U5Md0NgQ0QTtQHoq8hLdXWyUopnNPPbDRz2eWD1BHXHRW/goMlHcUKg+ahM/q5lrh
 t7JR0ilX11CO2m3WLU6xnTuhZBHFCIZgNgBAX+iPhlOcsurzDst0Ps86MzlxLwau4s2W
 skJS/9uV13pDEFix03mJ96wvuAVr+d+ije4gVve1FKntp/GyfVfrYj5uJjO+nBIqhFDw
 JN9Q==
X-Gm-Message-State: AOAM532zXAbRJvTWFDCZBLJwoQ5nIYo/UlrGDVb8xeawv5/5UfpPiL8H
 dUP7vQzMEIRtLPaQ2O+oYRzisY+270iR/A==
X-Google-Smtp-Source: ABdhPJzc+Cj/Ua5BD6tAjeC+a9Uxmst8x68bdlLPy82hc+RZNPI1RlBYUs0GnwNGIiWPUqNXxMqL2w==
X-Received: by 2002:a2e:711:: with SMTP id 17mr2808508ljh.462.1599698261366;
 Wed, 09 Sep 2020 17:37:41 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182])
 by smtp.gmail.com with ESMTPSA id a192sm924232lfd.51.2020.09.09.17.37.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2020 17:37:40 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id k25so5880292ljg.9
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 17:37:40 -0700 (PDT)
X-Received: by 2002:a05:651c:205b:: with SMTP id
 t27mr2820603ljo.95.1599698260183; 
 Wed, 09 Sep 2020 17:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200908070723.6394-1-kraxel@redhat.com>
In-Reply-To: <20200908070723.6394-1-kraxel@redhat.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Wed, 9 Sep 2020 17:37:28 -0700
X-Gmail-Original-Message-ID: <CAAfnVBnTz=2rW7086ZTa9FfRbZmE+-CX80vMoqt8LE7qDOEqyA@mail.gmail.com>
Message-ID: <CAAfnVBnTz=2rW7086ZTa9FfRbZmE+-CX80vMoqt8LE7qDOEqyA@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/virtio: fix stale mm entries on driver shutdown
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1678410366=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1678410366==
Content-Type: multipart/alternative; boundary="0000000000008c236b05aeeac6f5"

--0000000000008c236b05aeeac6f5
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 8, 2020 at 12:07 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

>
>
> Gerd Hoffmann (3):
>   drm/virtio: use drmm_mode_config_init
>   drm/virtio: return virtio_gpu_queue errors
>   drm/virtio: add virtio_gpu_cmd_unref_resource error handling
>

lgtm +/- nits:
- add a simple "why" in the first commit message
- checkpatch --strict reports:

CHECK: Alignment should match open parenthesis
#101: FILE: drivers/gpu/drm/virtio/virtgpu_vq.c:450:
+static int virtio_gpu_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,
                                         struct virtio_gpu_vbuffer *vbuf)

Either way, series is:

Reviewed-by: Gurchetan Singh <gurchetansingh@chromium.org>


>
>  drivers/gpu/drm/virtio/virtgpu_drv.h     |  2 +-
>  drivers/gpu/drm/virtio/virtgpu_display.c | 11 ++++---
>  drivers/gpu/drm/virtio/virtgpu_kms.c     |  6 +++-
>  drivers/gpu/drm/virtio/virtgpu_vq.c      | 41 +++++++++++++-----------
>  4 files changed, 36 insertions(+), 24 deletions(-)
>
> --
> 2.27.0
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--0000000000008c236b05aeeac6f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 8, 2020 at 12:07 AM Gerd =
Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
Gerd Hoffmann (3):<br>
=C2=A0 drm/virtio: use drmm_mode_config_init<br>
=C2=A0 drm/virtio: return virtio_gpu_queue errors<br>
=C2=A0 drm/virtio: add virtio_gpu_cmd_unref_resource error handling<br></bl=
ockquote><div><br></div><div>lgtm +/-=C2=A0nits:</div><div>- add a simple &=
quot;why&quot; in the first commit message</div><div>- checkpatch --strict =
reports:</div><div><br></div><div>CHECK: Alignment should match open parent=
hesis<br>#101: FILE: drivers/gpu/drm/virtio/virtgpu_vq.c:450:<br>+static in=
t virtio_gpu_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct vi=
rtio_gpu_vbuffer *vbuf)</div><div><br></div><div>Either way, series is:</di=
v><div><br></div><div>Reviewed-by: Gurchetan Singh &lt;<a href=3D"mailto:gu=
rchetansingh@chromium.org">gurchetansingh@chromium.org</a>&gt;<br></div><di=
v>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_drv.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<=
br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_display.c | 11 ++++---<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_kms.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++=
-<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_vq.c=C2=A0 =C2=A0 =C2=A0 | 41 ++++++++=
+++++-----------<br>
=C2=A04 files changed, 36 insertions(+), 24 deletions(-)<br>
<br>
-- <br>
2.27.0<br>
<br>
<br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">dri-de=
vel@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" rel=3D=
"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listin=
fo/dri-devel</a><br>
</blockquote></div></div>

--0000000000008c236b05aeeac6f5--

--===============1678410366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1678410366==--
