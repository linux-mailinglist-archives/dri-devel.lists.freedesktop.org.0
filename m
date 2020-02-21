Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2559716A1FB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:21:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720846E29B;
	Mon, 24 Feb 2020 09:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57ED6E47E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 18:49:01 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id b81so1516046ywe.9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 10:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o4E9AWQcYbsq1P9TZ4L2Ilg03anHrGGpRHx/e0xsHQQ=;
 b=Tm9hXROIQGJjyp+4hdyBly23cfMhCkvbl0ES6nvvDXyMhK25sUDCkPh7+QrUjrx5mS
 pOl9dZnVViHvWuAKDiUvrr7l5oobCRgFoU1aKhARtqVbunTzD1oLnhATmVjvyUgohJ9b
 1g0UAxn1SZelTA/ywqtaV2D6Q995JweNTQ/ZpYRvSHKAv0ewNrI6chRvzAygJfk/oR6F
 s1xtYpOVSIE+gTLMMjlskJuc3MTXriII0D7NHfMr2EaV3M9Ffk35S6+2RnRXENUI7fjf
 lpag+VdTanftmOLqj4F/SKuvgVJTo7Hhh/ee5skqjg8EeAS9dHaOKkCNEKNkF4H1BA1+
 hgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o4E9AWQcYbsq1P9TZ4L2Ilg03anHrGGpRHx/e0xsHQQ=;
 b=NkThehT7qadur/d7p6GQ0T9g4eyYGFFr/g228V1Owunxq/L9qO0oWEaJcWaQ5ErD8+
 gdbV1731TrlILTfV7z1cUPOjVGYbQs1bH7vwo0Q8CsAGg3wixF0YOy1IsTA9D/eYoBdg
 WS1AhgwRXy5WxPYAHkJmJB//GWP9znx39Hil9fyrOMXObCms700U9CalGhL8IVk+rDSl
 YyCeRYF/iKDdlxb7Lv5sHcGEHiHGTITC0g/khwadutIXikWM1N6RBjfcm4kT0Rd6fUik
 q11hyrzYq2fT8jdx09EI4mUJpALzANP1twEmtIGJSEGc8WMvhX7yDB8fk/ta96aeS+z6
 xlug==
X-Gm-Message-State: APjAAAWC8gjCvGck8DlxngqCnYnVDFwmVOKHhtDhHMbxggYwFGbcCeFB
 fKWyNAPf5ACd/IWs4O6gm6I01dbb+ZONkaRBbAHuwg==
X-Google-Smtp-Source: APXvYqwrr1vb239Qm6Pdd9igdPorNpgIMNWKDRsTe5vXcMbNcodl0rks789YlWxfGciqedkKnmUqwC9T2dHTUHHNR1A=
X-Received: by 2002:a81:f89:: with SMTP id 131mr32102420ywp.269.1582310940437; 
 Fri, 21 Feb 2020 10:49:00 -0800 (PST)
MIME-Version: 1.0
References: <20200220225319.45621-1-jbates@chromium.org>
 <CAPaKu7TH+f9w04ouW1qsj9u_rZ22XK_QrmniicC-KUY6p=HeCA@mail.gmail.com>
In-Reply-To: <CAPaKu7TH+f9w04ouW1qsj9u_rZ22XK_QrmniicC-KUY6p=HeCA@mail.gmail.com>
From: John Bates <jbates@google.com>
Date: Fri, 21 Feb 2020 10:48:49 -0800
Message-ID: <CALTgcPkCqe24=0iceBmZy=ffjzWkm69D1WpH7-s18feP_PX6UA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/virtio: fix resource id creation race
To: Chia-I Wu <olvaffe@gmail.com>
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:20:26 +0000
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
Cc: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 John Bates <jbates@chromium.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: multipart/mixed; boundary="===============1161205901=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1161205901==
Content-Type: multipart/alternative; boundary="00000000000087f555059f1a792b"

--00000000000087f555059f1a792b
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 21, 2020 at 10:37 AM Chia-I Wu <olvaffe@gmail.com> wrote:

> On Fri, Feb 21, 2020 at 3:14 AM John Bates <jbates@chromium.org> wrote:
> >
> > The previous code was not thread safe and caused
> > undefined behavior from spurious duplicate resource IDs.
> > In this patch, an atomic_t is used instead. We no longer
> > see any duplicate IDs in tests with this change.
> >
> > Fixes: 16065fcdd19d ("drm/virtio: do NOT reuse resource ids")
> > Signed-off-by: John Bates <jbates@chromium.org>
> Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> > ---
> >  drivers/gpu/drm/virtio/virtgpu_object.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c
> b/drivers/gpu/drm/virtio/virtgpu_object.c
> > index 017a9e0fc3bb..890121a45625 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> > @@ -42,8 +42,8 @@ static int virtio_gpu_resource_id_get(struct
> virtio_gpu_device *vgdev,
> >                  * "f91a9dd35715 Fix unlinking resources from hash
> >                  * table." (Feb 2019) fixes the bug.
> >                  */
> > -               static int handle;
> > -               handle++;
> > +               static atomic_t seqno = ATOMIC_INIT(0);
> > +               int handle = atomic_inc_return(&seqno);
> >                 *resid = handle + 1;
> resid 1 is (was) discriminated :D
>

Yup, noticed that too :)


>
> >         } else {
> >                 int handle = ida_alloc(&vgdev->resource_ida, GFP_KERNEL);
> > --
> > 2.25.0.265.gbab2e86ba0-goog
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--00000000000087f555059f1a792b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 21, 2020 at 10:37 AM Chia=
-I Wu &lt;<a href=3D"mailto:olvaffe@gmail.com">olvaffe@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Feb=
 21, 2020 at 3:14 AM John Bates &lt;<a href=3D"mailto:jbates@chromium.org" =
target=3D"_blank">jbates@chromium.org</a>&gt; wrote:<br>
&gt;<br>
&gt; The previous code was not thread safe and caused<br>
&gt; undefined behavior from spurious duplicate resource IDs.<br>
&gt; In this patch, an atomic_t is used instead. We no longer<br>
&gt; see any duplicate IDs in tests with this change.<br>
&gt;<br>
&gt; Fixes: 16065fcdd19d (&quot;drm/virtio: do NOT reuse resource ids&quot;=
)<br>
&gt; Signed-off-by: John Bates &lt;<a href=3D"mailto:jbates@chromium.org" t=
arget=3D"_blank">jbates@chromium.org</a>&gt;<br>
Reviewed-by: Chia-I Wu &lt;<a href=3D"mailto:olvaffe@gmail.com" target=3D"_=
blank">olvaffe@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/virtio/virtgpu_object.c | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm=
/virtio/virtgpu_object.c<br>
&gt; index 017a9e0fc3bb..890121a45625 100644<br>
&gt; --- a/drivers/gpu/drm/virtio/virtgpu_object.c<br>
&gt; +++ b/drivers/gpu/drm/virtio/virtgpu_object.c<br>
&gt; @@ -42,8 +42,8 @@ static int virtio_gpu_resource_id_get(struct virtio_=
gpu_device *vgdev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * &quot;=
f91a9dd35715 Fix unlinking resources from hash<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * table.=
&quot; (Feb 2019) fixes the bug.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static int han=
dle;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0handle++;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static atomic_=
t seqno =3D ATOMIC_INIT(0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int handle =3D=
 atomic_inc_return(&amp;seqno);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*resid =
=3D handle + 1;<br>
resid 1 is (was) discriminated :D<br></blockquote><div><br></div><div>Yup, =
noticed that too :)</div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int handl=
e =3D ida_alloc(&amp;vgdev-&gt;resource_ida, GFP_KERNEL);<br>
&gt; --<br>
&gt; 2.25.0.265.gbab2e86ba0-goog<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">d=
ri-devel@lists.freedesktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" r=
el=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/l=
istinfo/dri-devel</a><br>
</blockquote></div></div>

--00000000000087f555059f1a792b--

--===============1161205901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1161205901==--
