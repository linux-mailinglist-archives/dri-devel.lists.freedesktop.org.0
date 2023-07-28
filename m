Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB14A767859
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 00:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67FF710E79A;
	Fri, 28 Jul 2023 22:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2FA10E79A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 22:04:03 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-99bed101b70so166092666b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 15:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690581842; x=1691186642;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=haX0t9f5hamyUvHUswvSCOkaKoMQnOQJcQIDNPRvdEM=;
 b=dRlwR8eK6YaxNI4Bzu02zh3txrAR6Mj3KrAyZvU5E0bUCA3qsCpsYtHwFgIbvEuS5E
 gSne2rM0czZ7DNGojkAtCsgdl7cnC9wa189YkZQPBdXksELm0elWlSc2NZ+QnBaK2uJW
 UbckgSPW4z/up8bfYmLUiPVsBOlAS7ztD1Ed4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690581842; x=1691186642;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=haX0t9f5hamyUvHUswvSCOkaKoMQnOQJcQIDNPRvdEM=;
 b=F8xJdH6ejbihPtUgxqgZZ3EUVqj+D8TXe0iTV4SVt4p/HvflyJNn3DPaKGlnFBHOb5
 F78wI/2o0euekXsE4MnFpcd0bVXQmwu0qmBJ1+Eksz0OIzgsEOBW4a+2b/OMPvtO/tlJ
 LR1B7QjN6Tawv3Qg2N+dcJUzQb60ErP4P89pniwJSK8L0tmd3jOdpAK0HvrEQB46ms7N
 fZi2gso7Fox6qYwSSiL2U9I+MCHvGwy5PSDkLCKX7x7gIQ82CWAUqHNsPQblYiQUgPmh
 ARX7Fm2zbZ0Wgl0yikMovVbVmUOj6mDOvmzr0xX8VrN4kdfvrJioZAaNdrX8lJd4fQkC
 vvMA==
X-Gm-Message-State: ABy/qLZLV8d7YMbS7dSrE0z1msCyAimMHvgh3Ns4hCLryR5XqIRZ5vej
 RBrJ7AFzKz0K7uafqdtK+WLvs9ocgt5QkuGaG5UcFQ==
X-Google-Smtp-Source: APBJJlEKxfHYZp/LFe/s5rgxRSDGCIGl3H9grXYHMUnJNW5crH/LJ4y4oHJ2UeMBpedL0KC7XrPg6A==
X-Received: by 2002:a17:906:3114:b0:99b:eeeb:84a2 with SMTP id
 20-20020a170906311400b0099beeeb84a2mr540990ejx.13.1690581841806; 
 Fri, 28 Jul 2023 15:04:01 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 e20-20020a17090681d400b0099b8234a9fesm2502944ejx.1.2023.07.28.15.04.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 15:04:01 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-51e24210395so4504a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 15:04:01 -0700 (PDT)
X-Received: by 2002:a50:8ac1:0:b0:51a:1ffd:10e with SMTP id
 k1-20020a508ac1000000b0051a1ffd010emr12661edk.3.1690581841061; Fri, 28 Jul
 2023 15:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230416115237.798604-1-dmitry.osipenko@collabora.com>
 <141b928d-6165-f282-b8e6-f140cb09333d@collabora.com>
 <CAAfnVBnrUotph4TYJVu9Bohqv3m80t90V34TNhh-Tspxwsj-ZQ@mail.gmail.com>
 <CAF6AEGs4fuq4i8UJdO5hvgHTNhzFMKGZ87+w1oyvL0LAqWio6A@mail.gmail.com>
 <CAAfnVBkLhYVaSG3U_QUZwXLFv-XT=9F2v2pgrCDQQBgNZ3MSWA@mail.gmail.com>
 <a453d562-7e93-aef3-a533-171f572b6ee3@collabora.com>
 <CAAfnVBmwVTBNx4GC2hiYQ9Ya8ufP_D8N0-JOzT2iPV9BYZhD9w@mail.gmail.com>
 <CAF6AEGvWrUN9W9DKv45OT-MfYAS4D_bXa_Sb5ptgrMEf9WSSqA@mail.gmail.com>
 <4c18744d-b6cd-d517-5726-104017d0764b@collabora.com>
In-Reply-To: <4c18744d-b6cd-d517-5726-104017d0764b@collabora.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Fri, 28 Jul 2023 15:03:47 -0700
X-Gmail-Original-Message-ID: <CAAfnVB=qOjM1EQUyxdczu9KOGjD0sieoTODohbHz4ZDN0mqojw@mail.gmail.com>
Message-ID: <CAAfnVB=qOjM1EQUyxdczu9KOGjD0sieoTODohbHz4ZDN0mqojw@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Add sync object UAPI support to VirtIO-GPU driver
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Type: multipart/alternative; boundary="0000000000001a90dd0601934260"
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 David Airlie <airlied@redhat.com>, kernel@collabora.com,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000001a90dd0601934260
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2023 at 11:58=E2=80=AFAM Dmitry Osipenko <
dmitry.osipenko@collabora.com> wrote:

> 27.06.2023 20:16, Rob Clark =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> >> Now these are just suggestions, and while I think they are good, you
> can safely ignore them.
> >>
> >> But there's also the DRM requirements, which state "userspace side mus=
t
> be fully reviewed and tested to the standards of that user-space
> project.".  So I think to meet the minimum requirements, I think we shoul=
d
> at-least have one of the following (not all, just one) reviewed:
> >>
> >> 1) venus using the new uapi
> >> 2) gfxstream vk using the new uapi
> >> 3) amdgpu nctx out of "draft" mode and using the new uapi.
> >> 4) virtio-intel using new uapi
> >> 5) turnip using your new uapi
> >
> > forgot to mention this earlier, but
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23533
> >
> > Dmitry, you can also add, if you haven't already:
> >
> > Tested-by: Rob Clark <robdclark@gmail.com>
>
> Gurchetan, Turnip Mesa virtio support is ready to be merged upstream,
> it's using this new syncobj UAPI. Could you please give yours r-b if you
> don't have objections?
>

Given that Turnip native contexts are reviewed using this UAPI, your change
does now meet the requirements and is ready to merge.

One thing I noticed is you might need explicit padding between
`num_out_syncobjs` and `in_syncobjs`.  Otherwise, feel free to add my
acked-by.


>
> --
> Best regards,
> Dmitry
>
>

--0000000000001a90dd0601934260
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">=C2=A0</div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 19, 2023 at 11:58=E2=80=
=AFAM Dmitry Osipenko &lt;<a href=3D"mailto:dmitry.osipenko@collabora.com" =
target=3D"_blank">dmitry.osipenko@collabora.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">27.06.2023 20:16, Rob Clark =
=D0=BF=D0=B8=D1=88=D0=B5=D1=82:<br>
...<br>
&gt;&gt; Now these are just suggestions, and while I think they are good, y=
ou can safely ignore them.<br>
&gt;&gt;<br>
&gt;&gt; But there&#39;s also the DRM requirements, which state &quot;users=
pace side must be fully reviewed and tested to the standards of that user-s=
pace project.&quot;.=C2=A0 So I think to meet the minimum requirements, I t=
hink we should at-least have one of the following (not all, just one) revie=
wed:<br>
&gt;&gt;<br>
&gt;&gt; 1) venus using the new uapi<br>
&gt;&gt; 2) gfxstream vk using the new uapi<br>
&gt;&gt; 3) amdgpu nctx out of &quot;draft&quot; mode and using the new uap=
i.<br>
&gt;&gt; 4) virtio-intel using new uapi<br>
&gt;&gt; 5) turnip using your new uapi<br>
&gt; <br>
&gt; forgot to mention this earlier, but<br>
&gt; <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/2=
3533" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/m=
esa/mesa/-/merge_requests/23533</a><br>
&gt; <br>
&gt; Dmitry, you can also add, if you haven&#39;t already:<br>
&gt; <br>
&gt; Tested-by: Rob Clark &lt;<a href=3D"mailto:robdclark@gmail.com" target=
=3D"_blank">robdclark@gmail.com</a>&gt;<br>
<br>
Gurchetan, Turnip Mesa virtio support is ready to be merged upstream,<br>
it&#39;s using this new syncobj UAPI. Could you please give yours r-b if yo=
u<br>
don&#39;t have objections?<br></blockquote><div><br></div><div>Given that T=
urnip native contexts are reviewed using this UAPI, your change does now me=
et the requirements and is ready to merge.=C2=A0=C2=A0</div><div><br></div>=
<div>One thing I noticed is you might need explicit padding between `num_ou=
t_syncobjs` and `in_syncobjs`.=C2=A0 Otherwise, feel free to add my acked-b=
y.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- <br>
Best regards,<br>
Dmitry<br>
<br>
</blockquote></div></div>

--0000000000001a90dd0601934260--
