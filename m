Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D217DD102
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 16:55:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1E310E544;
	Tue, 31 Oct 2023 15:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A5010E53D
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 15:55:21 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9c603e235d1so927895166b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 08:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1698767720; x=1699372520;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2A4Wc6DGVI3weUYWv14MisK09Ufaz4uvtIUn25HRO6s=;
 b=Ji7NNR4L4n+QTDgEe9ZBQpTfxCdjtPXgEBumTBsqPo++zP49idM/zWoXOuolEQ1o/Q
 GJrORwXFqskN9higfKOIZCLkGjSExX0WsMb//RelKNA4ihUDBDJHLaF8oCh8u46FbzNL
 hMboqHm+Zv6lD572HnZ9VzpsG1ZRezw45s0fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698767720; x=1699372520;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2A4Wc6DGVI3weUYWv14MisK09Ufaz4uvtIUn25HRO6s=;
 b=lMnOMtVAs2YbW75/mPc/1wHYjTrpeWQbvlxiI4cWZ8cEAgzOQ1/DDZdSovNNTXcZH+
 5ypM7y3JXMkoWR1zJAw6zX6WzgHTh4R9zmAm1zTM8MV4NdH2wSQNVhAdi+dOwaTNcOF9
 PcxjuegavXaA48Ft2OhC4u4ww96FzlQTfiUZ9lced584fNdd5Q9BYcwDNRZ+iK954Lw1
 HRHtR2vDDTZohSGIVj+iEBq6SP7PsjoNB2ylrKWULs+55WDWut9/OE7vNhLrJ458RvY7
 ptIVJUiGeguGHqGmi4JBYEN8lSees2LZX8UQawwZztEP5ynEt4JS1n4E1OwKfbi8tXOn
 /kMw==
X-Gm-Message-State: AOJu0Yx4JfJs56sdHhI7ehNQDixqa47HGCQnbmye8qEsvTY/RacGoQ/1
 vUsMbk9C5IINwxfwPK9Kl39IRj0FK0bJgrATtmg=
X-Google-Smtp-Source: AGHT+IHGTt921linEEXWDCp01ZjO817YGSh2tk5/R9L1I/NyyNv/Y620IaskzCyXzMF+0cM70k3Xtw==
X-Received: by 2002:a17:906:1b4b:b0:9d3:ccf0:7617 with SMTP id
 p11-20020a1709061b4b00b009d3ccf07617mr3652071ejg.44.1698767720042; 
 Tue, 31 Oct 2023 08:55:20 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 l9-20020a170906078900b009adc81bb544sm1176296ejc.106.2023.10.31.08.55.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Oct 2023 08:55:18 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-51e24210395so17011a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 08:55:17 -0700 (PDT)
X-Received: by 2002:a50:fb04:0:b0:543:7dbc:243b with SMTP id
 d4-20020a50fb04000000b005437dbc243bmr73308edq.5.1698767716839; Tue, 31 Oct
 2023 08:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20231018181727.772-1-gurchetansingh@chromium.org>
 <20231018181727.772-2-gurchetansingh@chromium.org>
 <a5a51fde-ee38-ceb9-d5af-21135397f140@collabora.com>
In-Reply-To: <a5a51fde-ee38-ceb9-d5af-21135397f140@collabora.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Tue, 31 Oct 2023 08:55:04 -0700
X-Gmail-Original-Message-ID: <CAAfnVBmiWOVc-XLOz8FvSSLm4+toATH6oVu6ereTD4L3xve_9Q@mail.gmail.com>
Message-ID: <CAAfnVBmiWOVc-XLOz8FvSSLm4+toATH6oVu6ereTD4L3xve_9Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/uapi: add explicit virtgpu context debug name
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Type: multipart/alternative; boundary="0000000000005244bf0609052e81"
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
Cc: josh.simonot@gmail.com, kraxel@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000005244bf0609052e81
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 22, 2023 at 4:50=E2=80=AFPM Dmitry Osipenko <
dmitry.osipenko@collabora.com> wrote:

> On 10/18/23 21:17, Gurchetan Singh wrote:
> > There are two problems with the current method of determining the
> > virtio-gpu debug name.
> >
> > 1) TASK_COMM_LEN is defined to be 16 bytes only, and this is a
> >    Linux kernel idiom (see PR_SET_NAME + PR_GET_NAME). Though,
> >    Android/FreeBSD get around this via setprogname(..)/getprogname(..)
> >    in libc.
> >
> >    On Android, names longer than 16 bytes are common.  For example,
> >    one often encounters a program like "com.android.systemui".
> >
> >    The virtio-gpu spec allows the debug name to be up to 64 bytes, so
> >    ideally userspace should be able to set debug names up to 64 bytes.
> >
> > 2) The current implementation determines the debug name using whatever
> >    task initiated virtgpu.  This is could be a "RenderThread" of a
> >    larger program, when we actually want to propagate the debug name
> >    of the program.
> >
> > To fix these issues, add a new CONTEXT_INIT param that allows userspace
> > to set the debug name when creating a context.
> >
> > It takes a null-terminated C-string as the param value. The length of t=
he
> > string (excluding the terminator) **should** be <=3D 64 bytes.  Otherwi=
se,
> > the debug_name will be truncated to 64 bytes.
> >
> > Link to open-source userspace:
> >
> https://android-review.googlesource.com/c/platform/hardware/google/gfxstr=
eam/+/2787176
> >
> > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> > Reviewed-by: Josh Simonot <josh.simonot@gmail.com>
> > ---
> > Fixes suggested by Dmitry Osipenko
> > v2:
> >     - Squash implementation and UAPI change into one commit
> >     - Avoid unnecessary casts
> >     - Use bool when necessary
> > v3:
> >     - Use DEBUG_NAME_MAX_LEN - 1 when copying string
> >
> >  drivers/gpu/drm/virtio/virtgpu_drv.h   |  5 ++++
> >  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 39 ++++++++++++++++++++++----
> >  include/uapi/drm/virtgpu_drm.h         |  2 ++
> >  3 files changed, 40 insertions(+), 6 deletions(-)
>
> Gerd, do you have objections to this UAPI change?
>

Bump.  I say we wait another week and see if anyone cares [I suspect nobody
does].


https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-misc.html#=
merge-criteria

As per DRM guidelines, if there are no open comments and the change is
reviewed, it is mergeable.


>
> --
> Best regards,
> Dmitry
>
>

--0000000000005244bf0609052e81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Oct 22, 2023 at 4:50=E2=80=AF=
PM Dmitry Osipenko &lt;<a href=3D"mailto:dmitry.osipenko@collabora.com">dmi=
try.osipenko@collabora.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On 10/18/23 21:17, Gurchetan Singh wrote:<br>
&gt; There are two problems with the current method of determining the<br>
&gt; virtio-gpu debug name.<br>
&gt; <br>
&gt; 1) TASK_COMM_LEN is defined to be 16 bytes only, and this is a<br>
&gt;=C2=A0 =C2=A0 Linux kernel idiom (see PR_SET_NAME + PR_GET_NAME). Thoug=
h,<br>
&gt;=C2=A0 =C2=A0 Android/FreeBSD get around this via setprogname(..)/getpr=
ogname(..)<br>
&gt;=C2=A0 =C2=A0 in libc.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 On Android, names longer than 16 bytes are common.=C2=A0 =
For example,<br>
&gt;=C2=A0 =C2=A0 one often encounters a program like &quot;com.android.sys=
temui&quot;.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 The virtio-gpu spec allows the debug name to be up to 64 =
bytes, so<br>
&gt;=C2=A0 =C2=A0 ideally userspace should be able to set debug names up to=
 64 bytes.<br>
&gt; <br>
&gt; 2) The current implementation determines the debug name using whatever=
<br>
&gt;=C2=A0 =C2=A0 task initiated virtgpu.=C2=A0 This is could be a &quot;Re=
nderThread&quot; of a<br>
&gt;=C2=A0 =C2=A0 larger program, when we actually want to propagate the de=
bug name<br>
&gt;=C2=A0 =C2=A0 of the program.<br>
&gt; <br>
&gt; To fix these issues, add a new CONTEXT_INIT param that allows userspac=
e<br>
&gt; to set the debug name when creating a context.<br>
&gt; <br>
&gt; It takes a null-terminated C-string as the param value. The length of =
the<br>
&gt; string (excluding the terminator) **should** be &lt;=3D 64 bytes.=C2=
=A0 Otherwise,<br>
&gt; the debug_name will be truncated to 64 bytes.<br>
&gt; <br>
&gt; Link to open-source userspace:<br>
&gt; <a href=3D"https://android-review.googlesource.com/c/platform/hardware=
/google/gfxstream/+/2787176" rel=3D"noreferrer" target=3D"_blank">https://a=
ndroid-review.googlesource.com/c/platform/hardware/google/gfxstream/+/27871=
76</a><br>
&gt; <br>
&gt; Signed-off-by: Gurchetan Singh &lt;<a href=3D"mailto:gurchetansingh@ch=
romium.org" target=3D"_blank">gurchetansingh@chromium.org</a>&gt;<br>
&gt; Reviewed-by: Josh Simonot &lt;<a href=3D"mailto:josh.simonot@gmail.com=
" target=3D"_blank">josh.simonot@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; Fixes suggested by Dmitry Osipenko<br>
&gt; v2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Squash implementation and UAPI change into one co=
mmit<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Avoid unnecessary casts<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Use bool when necessary<br>
&gt; v3:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Use DEBUG_NAME_MAX_LEN - 1 when copying string<br=
>
&gt; <br>
&gt;=C2=A0 drivers/gpu/drm/virtio/virtgpu_drv.h=C2=A0 =C2=A0|=C2=A0 5 ++++<=
br>
&gt;=C2=A0 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 39 ++++++++++++++++++++=
++----<br>
&gt;=C2=A0 include/uapi/drm/virtgpu_drm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 2 ++<br>
&gt;=C2=A0 3 files changed, 40 insertions(+), 6 deletions(-)<br>
<br>
Gerd, do you have objections to this UAPI change?<br></blockquote><div><br>=
</div><div>Bump.=C2=A0 I say we wait another week and see if anyone cares [=
I suspect nobody does].</div><div><br></div><div>=C2=A0<a href=3D"https://d=
rm.pages.freedesktop.org/maintainer-tools/committer-drm-misc.html#merge-cri=
teria">https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-mis=
c.html#merge-criteria</a></div><div><br></div><div>As per DRM guidelines, i=
f there are no open comments and the change is reviewed, it is mergeable.</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- <br>
Best regards,<br>
Dmitry<br>
<br>
</blockquote></div></div>

--0000000000005244bf0609052e81--
