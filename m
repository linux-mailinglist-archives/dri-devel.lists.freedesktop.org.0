Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 332897E7E26
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 18:26:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B13D10E142;
	Fri, 10 Nov 2023 17:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3EB10E13F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 17:26:51 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-53dd752685fso3694192a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 09:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699637209; x=1700242009;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VJbA+AOXGJRRfpkAc+ija3u20wPPcDx1GG1VzB6mvyo=;
 b=VXaFEi6wevqfATBC4UIUyFBENdJ8kSrsBoIov+Of3a62P9VU6+ixsC8/a+Xp6q4x1X
 z03YHOBksCyxRZ51mAAJ+4c3huYzKLMUQ6r+49fWdpqdvYcedR4s/dHBTPCcqZrnyogL
 TSM1Ej+/vsQnseGgmrXgpW+u9xUVKUlWySKz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699637209; x=1700242009;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VJbA+AOXGJRRfpkAc+ija3u20wPPcDx1GG1VzB6mvyo=;
 b=wHtgB3EMrW/iCVm9ml88ZwdwYaoanO475j+NYlc/1i2AkhTSgrzMD82x1PoTZOMKgD
 xSQFY/+kabBNTB+T7O9k+LwPNFKd1u+e+GIXvcGKfSyecRVTS+SbZz21UJi8qgOTYo0S
 owxQ53tIZjpjjjMK0cGGnzpx75G41xbzdVDVs/Q8UbtoRo+zZ/gTtVANYu5CjDzg7U8Q
 K90Jh3kNbU/4iE8ZLE6SvPYurgMqIfpXn33EatxG+P6WpGd7GJ2P0394Ocs18E6DrleK
 4tTM65amxCt5ffWhADRfkpktRtJR1FyUsQ41ujyhaG8PWYFbgSRz/Uk4BjO5wddz1lEh
 Kofw==
X-Gm-Message-State: AOJu0Yxn2OMgoTU75EcQ4K3ryEn1Mm/oSLpIqf0LBetQQwLFLAMftysu
 yyEQfcm9Uim7tis30MSlWVBXi9BFeEbbPfqW1vTmvQ==
X-Google-Smtp-Source: AGHT+IHRDaIVtqboXcgVLYHX54zKYXJCxcRkwyOY/nUV9fS6DqpBE8Lr8TvKT8t30iBt/Pkapk/nfw==
X-Received: by 2002:aa7:c902:0:b0:53e:158b:586d with SMTP id
 b2-20020aa7c902000000b0053e158b586dmr23804edt.21.1699637209404; 
 Fri, 10 Nov 2023 09:26:49 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com.
 [209.85.208.53]) by smtp.gmail.com with ESMTPSA id
 x21-20020a50d615000000b00536031525e5sm1383666edi.91.2023.11.10.09.26.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Nov 2023 09:26:49 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-54366bb1c02so31293a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 09:26:49 -0800 (PST)
X-Received: by 2002:a05:6402:497:b0:544:24a8:ebd with SMTP id
 k23-20020a056402049700b0054424a80ebdmr398412edv.4.1699637208017; Fri, 10 Nov
 2023 09:26:48 -0800 (PST)
MIME-Version: 1.0
References: <20231018181727.772-1-gurchetansingh@chromium.org>
 <20231018181727.772-2-gurchetansingh@chromium.org>
 <a5a51fde-ee38-ceb9-d5af-21135397f140@collabora.com>
 <CAAfnVBmiWOVc-XLOz8FvSSLm4+toATH6oVu6ereTD4L3xve_9Q@mail.gmail.com>
In-Reply-To: <CAAfnVBmiWOVc-XLOz8FvSSLm4+toATH6oVu6ereTD4L3xve_9Q@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Fri, 10 Nov 2023 09:26:33 -0800
X-Gmail-Original-Message-ID: <CAAfnVB=DbecJzOOKT2RhdZPBUE2x9jCQbFJeQ0M2hTsc1Y8j8w@mail.gmail.com>
Message-ID: <CAAfnVB=DbecJzOOKT2RhdZPBUE2x9jCQbFJeQ0M2hTsc1Y8j8w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/uapi: add explicit virtgpu context debug name
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Type: multipart/alternative; boundary="00000000000008b1e30609cfa015"
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

--00000000000008b1e30609cfa015
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 8:55=E2=80=AFAM Gurchetan Singh <gurchetansingh@chr=
omium.org>
wrote:

>
>
> On Sun, Oct 22, 2023 at 4:50=E2=80=AFPM Dmitry Osipenko <
> dmitry.osipenko@collabora.com> wrote:
>
>> On 10/18/23 21:17, Gurchetan Singh wrote:
>> > There are two problems with the current method of determining the
>> > virtio-gpu debug name.
>> >
>> > 1) TASK_COMM_LEN is defined to be 16 bytes only, and this is a
>> >    Linux kernel idiom (see PR_SET_NAME + PR_GET_NAME). Though,
>> >    Android/FreeBSD get around this via setprogname(..)/getprogname(..)
>> >    in libc.
>> >
>> >    On Android, names longer than 16 bytes are common.  For example,
>> >    one often encounters a program like "com.android.systemui".
>> >
>> >    The virtio-gpu spec allows the debug name to be up to 64 bytes, so
>> >    ideally userspace should be able to set debug names up to 64 bytes.
>> >
>> > 2) The current implementation determines the debug name using whatever
>> >    task initiated virtgpu.  This is could be a "RenderThread" of a
>> >    larger program, when we actually want to propagate the debug name
>> >    of the program.
>> >
>> > To fix these issues, add a new CONTEXT_INIT param that allows userspac=
e
>> > to set the debug name when creating a context.
>> >
>> > It takes a null-terminated C-string as the param value. The length of
>> the
>> > string (excluding the terminator) **should** be <=3D 64 bytes.  Otherw=
ise,
>> > the debug_name will be truncated to 64 bytes.
>> >
>> > Link to open-source userspace:
>> >
>> https://android-review.googlesource.com/c/platform/hardware/google/gfxst=
ream/+/2787176
>> >
>> > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
>> > Reviewed-by: Josh Simonot <josh.simonot@gmail.com>
>> > ---
>> > Fixes suggested by Dmitry Osipenko
>> > v2:
>> >     - Squash implementation and UAPI change into one commit
>> >     - Avoid unnecessary casts
>> >     - Use bool when necessary
>> > v3:
>> >     - Use DEBUG_NAME_MAX_LEN - 1 when copying string
>> >
>> >  drivers/gpu/drm/virtio/virtgpu_drv.h   |  5 ++++
>> >  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 39 ++++++++++++++++++++++---=
-
>> >  include/uapi/drm/virtgpu_drm.h         |  2 ++
>> >  3 files changed, 40 insertions(+), 6 deletions(-)
>>
>> Gerd, do you have objections to this UAPI change?
>>
>
> Bump.  I say we wait another week and see if anyone cares [I suspect
> nobody does].
>
>
> https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-misc.htm=
l#merge-criteria
>
> As per DRM guidelines, if there are no open comments and the change is
> reviewed, it is mergeable.
>

*hears crickets*

Can we merge this now?


>
>>
>> --
>> Best regards,
>> Dmitry
>>
>>

--00000000000008b1e30609cfa015
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 31, 2023 at 8:55=E2=80=AF=
AM Gurchetan Singh &lt;<a href=3D"mailto:gurchetansingh@chromium.org" targe=
t=3D"_blank">gurchetansingh@chromium.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><=
br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Sun, Oct 22, 2023 at 4:50=E2=80=AFPM Dmitry Osipenko &lt;<a href=3D"m=
ailto:dmitry.osipenko@collabora.com" target=3D"_blank">dmitry.osipenko@coll=
abora.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 10/18/23 21:17, Gurchetan Singh wrote:<br>
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
teria" target=3D"_blank">https://drm.pages.freedesktop.org/maintainer-tools=
/committer-drm-misc.html#merge-criteria</a></div><div><br></div><div>As per=
 DRM guidelines, if there are no open comments and the change is reviewed, =
it is mergeable.</div></div></div></blockquote><div><br></div><div>*hears c=
rickets*</div><div><br></div><div>Can we merge this now?</div><div><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div c=
lass=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
-- <br>
Best regards,<br>
Dmitry<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--00000000000008b1e30609cfa015--
