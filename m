Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D19F7CEC01
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 01:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB78A10E025;
	Wed, 18 Oct 2023 23:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98B410E025
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 23:25:30 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c16757987fso98580181fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 16:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1697671528; x=1698276328;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9Q2SL9D0t5i70Rk9KsizMgca9slcDcaDWQWMlQS8ivQ=;
 b=aap6UlXAWQ4tbhPRup8AJHeCuoTzFs/wZuGkS62UmJ9YRC6346i50BmJRl9JJRpbAz
 iesERmPOQLaCgM0skykHT7lnStzX2AjFUD2KC4PY2QbT3sN1SAS2WwMDimFh7OP5EliF
 d7IYM5DnWxoRFclatcOnPPdmDz9iDYB8bl+sQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697671528; x=1698276328;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9Q2SL9D0t5i70Rk9KsizMgca9slcDcaDWQWMlQS8ivQ=;
 b=ea19mQCLDISvTXSUsBF0wxEYdzsH0OQeG7rwIgUbfbHfY3FWIKN/9fpFtf1wu0ehJr
 FFyjNySU+sTbhsFlPIaxum9IW8CgjVrpjN50rDsGYGVx5+OBoB647h4jdb917LrIefcn
 Nk77U+r3MaCh+s0DnR7ZlsXLDM5u5bMjzHlrlOCYagtuWD1Dli/0az687qvNMvhUEyWV
 0BY6U0ka5zBxcZ6WHaP20J+TC8ObBBB6NRYVH9icn7ha353qvkClwZy/jQ44tDBI8/3p
 oozzBlkB/HEQcUr7UiHElUPTrgQ8zsyCheS4VQReqzLy8awXDgTI7uJUG+H6oCobmkCI
 vseg==
X-Gm-Message-State: AOJu0YywX1FFR+/lH9Y7JJylrumDVlRpX0BuWp0YkBOwPXFA0omv9MOp
 R/TW82d7JoMKk/Xy6DgApSm81kQm7WhIJwNrNw1wkA==
X-Google-Smtp-Source: AGHT+IEj3GzZcf6qOIiJVLzuHkvBl8CIKWyuN7WQMkmjQgqJ/c6vnXiwZn4/KfkgsaJqosGsrxnZ8A==
X-Received: by 2002:a2e:a99b:0:b0:2c5:80d:53b1 with SMTP id
 x27-20020a2ea99b000000b002c5080d53b1mr239784ljq.43.1697671528419; 
 Wed, 18 Oct 2023 16:25:28 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com.
 [209.85.208.46]) by smtp.gmail.com with ESMTPSA id
 f18-20020a170906739200b009a1b857e3a5sm2454051ejl.54.2023.10.18.16.25.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 16:25:27 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-53eeb28e8e5so2737a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 16:25:27 -0700 (PDT)
X-Received: by 2002:aa7:c452:0:b0:53f:91cc:1d04 with SMTP id
 n18-20020aa7c452000000b0053f91cc1d04mr25683edr.4.1697671527546; Wed, 18 Oct
 2023 16:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20231010135722.1142265-1-ray.huang@amd.com>
 <2f8bcce1-6551-6c2d-481c-67502c82bc68@collabora.com>
 <2c162058-288c-9e9e-48d5-3b2ddb0cc1fa@collabora.com>
 <ZSYnQbHUecuUlwvr@amd.com>
In-Reply-To: <ZSYnQbHUecuUlwvr@amd.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Wed, 18 Oct 2023 16:25:15 -0700
X-Gmail-Original-Message-ID: <CAAfnVB=Mki1zEyjByJ_7tRrib74E4KSbjezqQcb_Uia8EQEXHw@mail.gmail.com>
Message-ID: <CAAfnVB=Mki1zEyjByJ_7tRrib74E4KSbjezqQcb_Uia8EQEXHw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/virtio: add new virtio gpu capset definitions
To: Huang Rui <ray.huang@amd.com>
Content-Type: multipart/alternative; boundary="00000000000058df6c060805f461"
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
Cc: "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, "Stabellini,
 Stefano" <stefano.stabellini@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, David Airlie <airlied@redhat.com>,
 "Zhang, Julia" <Julia.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000058df6c060805f461
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 9:41=E2=80=AFPM Huang Rui <ray.huang@amd.com> wrote=
:

> On Tue, Oct 10, 2023 at 11:52:14PM +0800, Dmitry Osipenko wrote:
> > On 10/10/23 18:40, Dmitry Osipenko wrote:
> > > On 10/10/23 16:57, Huang Rui wrote:
> > >> These definitions are used fro qemu, and qemu imports this marco in
> the
> > >> headers to enable gfxstream, venus, cross domain, and drm (native
> > >> context) for virtio gpu. So it should add them even kernel doesn't u=
se
> > >> this.
> > >>
> > >> Signed-off-by: Huang Rui <ray.huang@amd.com>
> > >> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> > >> ---
> > >>
> > >> Changes V1 -> V2:
> > >> - Add all capsets including gfxstream and venus in kernel header
> (Dmitry Osipenko)
> > >>
> > >> Changes V2 -> V3:
> > >> - Add missed capsets including cross domain and drm (native context)
> > >>   (Dmitry Osipenko)
> > >>
> > >> v1:
> https://lore.kernel.org/lkml/20230915105918.3763061-1-ray.huang@amd.com/
> > >> v2:
> https://lore.kernel.org/lkml/20231010032553.1138036-1-ray.huang@amd.com/
> > >>
> > >>  include/uapi/linux/virtio_gpu.h | 4 ++++
> > >>  1 file changed, 4 insertions(+)
> > >>
> > >> diff --git a/include/uapi/linux/virtio_gpu.h
> b/include/uapi/linux/virtio_gpu.h
> > >> index f556fde07b76..240911c8da31 100644
> > >> --- a/include/uapi/linux/virtio_gpu.h
> > >> +++ b/include/uapi/linux/virtio_gpu.h
> > >> @@ -309,6 +309,10 @@ struct virtio_gpu_cmd_submit {
> > >>
> > >>  #define VIRTIO_GPU_CAPSET_VIRGL 1
> > >>  #define VIRTIO_GPU_CAPSET_VIRGL2 2
> > >> +#define VIRTIO_GPU_CAPSET_GFXSTREAM 3
> > >
> > > The GFXSTREAM capset isn't correct, it should be GFXSTREAM_VULKAN in
> > > accordance to [1] and [2]. There are more capsets for GFXSTREAM.
> > >
> > > [1]
> > >
> https://github.com/google/crosvm/blob/main/rutabaga_gfx/src/rutabaga_util=
s.rs#L172
> > >
> > > [2]
> > >
> https://patchwork.kernel.org/project/qemu-devel/patch/20231006010835.444-=
7-gurchetansingh@chromium.org/
> >
> > Though, maybe those are "rutabaga" capsets that not related to
> > virtio-gpu because crosvm has another defs for virtio-gpu capsets [3].
> > The DRM capset is oddly missing in [3] and code uses "rutabaga" capset
> > for DRM and virtio-gpu.
> >
> > [3]
> >
> https://github.com/google/crosvm/blob/main/devices/src/virtio/gpu/protoco=
l.rs#L416
>
> Yes, [3] is the file that I referred to add these capsets definitions. An=
d
> it's defined as gfxstream not gfxstream_vulkan.
>
> >
> > Gurchetan, could you please clarify which capsets definitions are
> > related to virtio-gpu and gfxstream. The
> > GFXSTREAM_VULKAN/GLES/MAGMA/COMPOSER or just the single GFXSTREAM?


It should be GFXSTREAM_VULKAN.  The rest are more experimental and easy to
modify in terms of the enum value, should the need arise.

I imagine the virtio-spec update to reflect the GFXSTREAM to
GFXSTREAM_VULKAN change will happen eventually.


> >
>
> Gurchetan, may we have your insight?
>
> Thanks,
> Ray
>
> > --
> > Best regards,
> > Dmitry
> >
>

--00000000000058df6c060805f461
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 10, 2023 at 9:41=E2=80=AF=
PM Huang Rui &lt;<a href=3D"mailto:ray.huang@amd.com">ray.huang@amd.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On T=
ue, Oct 10, 2023 at 11:52:14PM +0800, Dmitry Osipenko wrote:<br>
&gt; On 10/10/23 18:40, Dmitry Osipenko wrote:<br>
&gt; &gt; On 10/10/23 16:57, Huang Rui wrote:<br>
&gt; &gt;&gt; These definitions are used fro qemu, and qemu imports this ma=
rco in the<br>
&gt; &gt;&gt; headers to enable gfxstream, venus, cross domain, and drm (na=
tive<br>
&gt; &gt;&gt; context) for virtio gpu. So it should add them even kernel do=
esn&#39;t use<br>
&gt; &gt;&gt; this.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Huang Rui &lt;<a href=3D"mailto:ray.huang@amd.=
com" target=3D"_blank">ray.huang@amd.com</a>&gt;<br>
&gt; &gt;&gt; Reviewed-by: Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odak=
i@daynix.com" target=3D"_blank">akihiko.odaki@daynix.com</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Changes V1 -&gt; V2:<br>
&gt; &gt;&gt; - Add all capsets including gfxstream and venus in kernel hea=
der (Dmitry Osipenko)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Changes V2 -&gt; V3:<br>
&gt; &gt;&gt; - Add missed capsets including cross domain and drm (native c=
ontext)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0(Dmitry Osipenko)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; v1: <a href=3D"https://lore.kernel.org/lkml/20230915105918.37=
63061-1-ray.huang@amd.com/" rel=3D"noreferrer" target=3D"_blank">https://lo=
re.kernel.org/lkml/20230915105918.3763061-1-ray.huang@amd.com/</a><br>
&gt; &gt;&gt; v2: <a href=3D"https://lore.kernel.org/lkml/20231010032553.11=
38036-1-ray.huang@amd.com/" rel=3D"noreferrer" target=3D"_blank">https://lo=
re.kernel.org/lkml/20231010032553.1138036-1-ray.huang@amd.com/</a><br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 include/uapi/linux/virtio_gpu.h | 4 ++++<br>
&gt; &gt;&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/l=
inux/virtio_gpu.h<br>
&gt; &gt;&gt; index f556fde07b76..240911c8da31 100644<br>
&gt; &gt;&gt; --- a/include/uapi/linux/virtio_gpu.h<br>
&gt; &gt;&gt; +++ b/include/uapi/linux/virtio_gpu.h<br>
&gt; &gt;&gt; @@ -309,6 +309,10 @@ struct virtio_gpu_cmd_submit {<br>
&gt; &gt;&gt;=C2=A0 <br>
&gt; &gt;&gt;=C2=A0 #define VIRTIO_GPU_CAPSET_VIRGL 1<br>
&gt; &gt;&gt;=C2=A0 #define VIRTIO_GPU_CAPSET_VIRGL2 2<br>
&gt; &gt;&gt; +#define VIRTIO_GPU_CAPSET_GFXSTREAM 3<br>
&gt; &gt; <br>
&gt; &gt; The GFXSTREAM capset isn&#39;t correct, it should be GFXSTREAM_VU=
LKAN in<br>
&gt; &gt; accordance to [1] and [2]. There are more capsets for GFXSTREAM.<=
br>
&gt; &gt; <br>
&gt; &gt; [1]<br>
&gt; &gt; <a href=3D"https://github.com/google/crosvm/blob/main/rutabaga_gf=
x/src/rutabaga_utils.rs#L172" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/google/crosvm/blob/main/rutabaga_gfx/src/rutabaga_utils.rs#L172<=
/a><br>
&gt; &gt; <br>
&gt; &gt; [2]<br>
&gt; &gt; <a href=3D"https://patchwork.kernel.org/project/qemu-devel/patch/=
20231006010835.444-7-gurchetansingh@chromium.org/" rel=3D"noreferrer" targe=
t=3D"_blank">https://patchwork.kernel.org/project/qemu-devel/patch/20231006=
010835.444-7-gurchetansingh@chromium.org/</a><br>
&gt; <br>
&gt; Though, maybe those are &quot;rutabaga&quot; capsets that not related =
to<br>
&gt; virtio-gpu because crosvm has another defs for virtio-gpu capsets [3].=
<br>
&gt; The DRM capset is oddly missing in [3] and code uses &quot;rutabaga&qu=
ot; capset<br>
&gt; for DRM and virtio-gpu.<br>
&gt; <br>
&gt; [3]<br>
&gt; <a href=3D"https://github.com/google/crosvm/blob/main/devices/src/virt=
io/gpu/protocol.rs#L416" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/google/crosvm/blob/main/devices/src/virtio/gpu/protocol.rs#L416</a><b=
r>
<br>
Yes, [3] is the file that I referred to add these capsets definitions. And<=
br>
it&#39;s defined as gfxstream not gfxstream_vulkan.<br>
<br>
&gt; <br>
&gt; Gurchetan, could you please clarify which capsets definitions are<br>
&gt; related to virtio-gpu and gfxstream. The<br>
&gt; GFXSTREAM_VULKAN/GLES/MAGMA/COMPOSER or just the single GFXSTREAM?</bl=
ockquote><div><br></div><div>It should be GFXSTREAM_VULKAN.=C2=A0 The rest =
are more experimental and easy to modify in terms of the enum value, should=
 the need arise.</div><div><br></div><div>I imagine the virtio-spec update =
to reflect the GFXSTREAM to GFXSTREAM_VULKAN change will happen eventually.=
</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
&gt; <br>
<br>
Gurchetan, may we have your insight?<br>
<br>
Thanks,<br>
Ray<br>
<br>
&gt; -- <br>
&gt; Best regards,<br>
&gt; Dmitry<br>
&gt; <br>
</blockquote></div></div>

--00000000000058df6c060805f461--
