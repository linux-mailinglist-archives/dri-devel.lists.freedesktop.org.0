Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BC794AD98
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 18:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F05E10E15D;
	Wed,  7 Aug 2024 16:06:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="iJrDrdxN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7110310E15D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 16:06:39 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-530e062217eso894227e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 09:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723046796; x=1723651596;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3xJzYcHfVeuO6qczmj+7Zs4bE+iq/uZ7M7j/aLqT6tk=;
 b=iJrDrdxNgusT9HDa5pWA1d/IU6egxyZHxeKF+JX54BOWbmrf/AXlbKR/RHo4j+DNV+
 tAovIGNxOYttRuq2AyThDKsOx0RELIt8C52h2doogBrKrOjGJcGEVIaPofsTtDE7PM/s
 QFgZwehlEBjV+N+f8ULQVqvlXn6UqGeE3PeTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723046796; x=1723651596;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3xJzYcHfVeuO6qczmj+7Zs4bE+iq/uZ7M7j/aLqT6tk=;
 b=nhBjY5b3k3j3QG7zguec/MzEkv2L6LzO1gtaHK8kx1z9aJjwiX/+36XFgUE1jZtrmJ
 fqHb8P/bPZCfntEgOODITRFhPf03xdro+nEkn1u/gibVwCADI6fqVFB/LqTlH0OHI1Ee
 Gskiz+qqklSAPOZD71jbnSKxdUvXaqQI+FQizLfes1IFOVUHBVwuild2Rq6REUfGnvrQ
 ReUELt8mqPnQxFkhDBlLhPZtmKjtEso2SxucleG1posBTcY5Ia85oOgxeSvlqoTS0H/A
 mt1ST/E/iCE5HsYXZMThOof39RSICQAFPE3tWIRG/JgyppF7RrQQ6s9veWDihSH3cv7p
 HU6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqjdvWhRG1cyprs9aYK6WSrQqiAtNcqMXgTHS+TtqYXcCboImz5TFThP5/oPk8xBUGU2XpXAiz9kyZ8FHxy6QsI8yOvhiPdhI0VpavR6/l
X-Gm-Message-State: AOJu0YxCb//Adu883o8UU6ea7lJTQUOyxgaY0I3V6itYI+6AYI4mXPTm
 hCFOXLf0QnQBnU/WNyzz8J2Y+RvRZwLxRvJGEkhA3V3pYPm0Sj0NqzRZh/YHrlCWBqyzIizI6rs
 =
X-Google-Smtp-Source: AGHT+IFxQyreiUscuGxj83LEod+ljXcX/vTCgIEVrULb3+/rbC37jI4ZyObvJI4m5lFEvSX8i3N52w==
X-Received: by 2002:a05:6512:e9d:b0:52c:d27b:ddcb with SMTP id
 2adb3069b0e04-530bb366800mr14381298e87.3.1723046795244; 
 Wed, 07 Aug 2024 09:06:35 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com.
 [209.85.208.41]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9e84340sm651266766b.185.2024.08.07.09.06.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Aug 2024 09:06:34 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5a28b61b880so36213a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 09:06:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXiISUlBcXWlsJ2FGsP/xFTGqpNyACT3YiZAjEgHLiqTxKeGh0BxAY+9LAeiX/BBwsa/jSag7ieOGNcsfypq/5lenkD1sPMddBbK5KQ/ezW
X-Received: by 2002:a05:6402:27c7:b0:5b4:df4a:48bb with SMTP id
 4fb4d7f45d1cf-5bba25bf4fdmr219518a12.0.1723046793993; Wed, 07 Aug 2024
 09:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240723114914.53677-1-slp@redhat.com>
 <942afa37-a24c-48ed-ae10-c811849165bf@collabora.com>
 <CAAiTLFV6mAgrMj=itcxoBCibvYRyrAk02wYp-gYJ8kxhF0EPmw@mail.gmail.com>
 <CAAfnVBkWKn3+YEhNz0CTmw-T_jjL72axkWqYgkzkSa72t_Gf0A@mail.gmail.com>
 <CAF6AEGsnpEYFsCfZUAPopWzY=wv_GWn0P5f5D6U9y-JrWGQVnw@mail.gmail.com>
In-Reply-To: <CAF6AEGsnpEYFsCfZUAPopWzY=wv_GWn0P5f5D6U9y-JrWGQVnw@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Wed, 7 Aug 2024 09:06:20 -0700
X-Gmail-Original-Message-ID: <CAAfnVBki816fSPuQ_FcvuwYzbSwiS_WaYsGSA1AyitmAA5OsXg@mail.gmail.com>
Message-ID: <CAAfnVBki816fSPuQ_FcvuwYzbSwiS_WaYsGSA1AyitmAA5OsXg@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/virtio: introduce the HOST_PAGE_SIZE feature
To: Rob Clark <robdclark@gmail.com>
Cc: Sergio Lopez Pascual <slp@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, tzimmermann@suse.de, 
 mripard@kernel.org, olvaffe@gmail.com, kraxel@redhat.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, airlied@redhat.com, 
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
 dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="00000000000017228a061f1a1866"
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

--00000000000017228a061f1a1866
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 6, 2024 at 1:15=E2=80=AFPM Rob Clark <robdclark@gmail.com> wrot=
e:

> On Tue, Aug 6, 2024 at 9:15=E2=80=AFAM Gurchetan Singh
> <gurchetansingh@chromium.org> wrote:
> >
> >
> >
> > On Mon, Aug 5, 2024 at 2:14=E2=80=AFAM Sergio Lopez Pascual <slp@redhat=
.com>
> wrote:
> >>
> >> Dmitry Osipenko <dmitry.osipenko@collabora.com> writes:
> >>
> >> > On 7/23/24 14:49, Sergio Lopez wrote:
> >> >> There's an incresing number of machines supporting multiple page
> sizes
> >> >> and on these machines the host and a guest can be running, each one=
,
> >> >> with a different page size.
> >> >>
> >> >> For what pertains to virtio-gpu, this is not a problem if the page
> size
> >> >> of the guest happens to be bigger or equal than the host, but will
> >> >> potentially lead to failures in memory allocations and/or mappings
> >> >> otherwise.
> >> >
> >> > Please describe concrete problem you're trying to solve. Guest memor=
y
> >> > allocation consists of guest pages, I don't see how knowledge of hos=
t
> >> > page size helps anything in userspace.
> >> >
> >> > I suspect you want this for host blobs, but then it should be
> >> > virtio_gpu_vram_create() that should use max(host_page_sz,
> >> > guest_page_size), AFAICT. It's kernel who is responsible for memory
> >> > management, userspace can't be trusted for doing that.
> >>
> >> Mesa's Vulkan/Venus uses CREATE_BLOB to request the host the creation
> >> and mapping into the guest of device-backed memory and shmem regions.
> >> The CREATE_BLOB ioctl doesn't update drm_virtgpu_resource_create->size=
,
> >> so the guest kernel (and, as a consequence, the host kernel) can't
> >> override the user's request.
> >>
> >> I'd like Mesa's Vulkan/Venus in the guest to be able to obtain the hos=
t
> >> page size to align the size of the CREATE_BLOB requests as required.
> >
> >
> > gfxstream solves this problem by putting the relevant information in th=
e
> capabilities obtained from the host:
> >
> >
> https://android.googlesource.com/platform/hardware/google/gfxstream/+/ref=
s/heads/main/host/virtio-gpu-gfxstream-renderer.cpp#1691
> >
> > If you want to be paranoid, you can also validate the
> ResourceCreateBlob::size is properly host-page aligned when that request
> reaches the host.
> >
> > So you can probably solve this problem using current interfaces.
> Whether it's cleaner for all context types to use the capabilities, or ha=
ve
> all VMMs to expose VIRTIO_GPU_F_HOST_PAGE_SIZE, would be the cost/benefit
> tradeoff.
> >
>
> I guess solving it in a context-type specific way is possible.  But I
> think it is a relatively universal constraint.  And maybe it makes
> sense for virtgpu guest kernel to enforce alignment (at least it can
> return an error synchronously) in addition to the host.
>

virtio-media may have support for VIRTIO_MEDIA_CMD_MMAP too, so could run
into this issue.

https://github.com/chromeos/virtio-media?tab=3Dreadme-ov-file#shared-memory=
-regions

virtio-fs also has the DAX window which uses the same memory mapping
mechanism.

https://virtio-fs.gitlab.io/design.html

Maybe this should not be a virtio-gpu thing, but a virtio thing?


>
> BR,
> -R
>
> >>
> >>
> >> Thanks,
> >> Sergio.
> >>
>

--00000000000017228a061f1a1866
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 6, 2024 at 1:15=E2=80=AFP=
M Rob Clark &lt;<a href=3D"mailto:robdclark@gmail.com">robdclark@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Tue, Aug 6, 2024 at 9:15=E2=80=AFAM Gurchetan Singh<br>
&lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=3D"_blank">gurche=
tansingh@chromium.org</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Aug 5, 2024 at 2:14=E2=80=AFAM Sergio Lopez Pascual &lt;<a hre=
f=3D"mailto:slp@redhat.com" target=3D"_blank">slp@redhat.com</a>&gt; wrote:=
<br>
&gt;&gt;<br>
&gt;&gt; Dmitry Osipenko &lt;<a href=3D"mailto:dmitry.osipenko@collabora.co=
m" target=3D"_blank">dmitry.osipenko@collabora.com</a>&gt; writes:<br>
&gt;&gt;<br>
&gt;&gt; &gt; On 7/23/24 14:49, Sergio Lopez wrote:<br>
&gt;&gt; &gt;&gt; There&#39;s an incresing number of machines supporting mu=
ltiple page sizes<br>
&gt;&gt; &gt;&gt; and on these machines the host and a guest can be running=
, each one,<br>
&gt;&gt; &gt;&gt; with a different page size.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; For what pertains to virtio-gpu, this is not a problem if=
 the page size<br>
&gt;&gt; &gt;&gt; of the guest happens to be bigger or equal than the host,=
 but will<br>
&gt;&gt; &gt;&gt; potentially lead to failures in memory allocations and/or=
 mappings<br>
&gt;&gt; &gt;&gt; otherwise.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Please describe concrete problem you&#39;re trying to solve. =
Guest memory<br>
&gt;&gt; &gt; allocation consists of guest pages, I don&#39;t see how knowl=
edge of host<br>
&gt;&gt; &gt; page size helps anything in userspace.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I suspect you want this for host blobs, but then it should be=
<br>
&gt;&gt; &gt; virtio_gpu_vram_create() that should use max(host_page_sz,<br=
>
&gt;&gt; &gt; guest_page_size), AFAICT. It&#39;s kernel who is responsible =
for memory<br>
&gt;&gt; &gt; management, userspace can&#39;t be trusted for doing that.<br=
>
&gt;&gt;<br>
&gt;&gt; Mesa&#39;s Vulkan/Venus uses CREATE_BLOB to request the host the c=
reation<br>
&gt;&gt; and mapping into the guest of device-backed memory and shmem regio=
ns.<br>
&gt;&gt; The CREATE_BLOB ioctl doesn&#39;t update drm_virtgpu_resource_crea=
te-&gt;size,<br>
&gt;&gt; so the guest kernel (and, as a consequence, the host kernel) can&#=
39;t<br>
&gt;&gt; override the user&#39;s request.<br>
&gt;&gt;<br>
&gt;&gt; I&#39;d like Mesa&#39;s Vulkan/Venus in the guest to be able to ob=
tain the host<br>
&gt;&gt; page size to align the size of the CREATE_BLOB requests as require=
d.<br>
&gt;<br>
&gt;<br>
&gt; gfxstream solves this problem by putting the relevant information in t=
he capabilities obtained from the host:<br>
&gt;<br>
&gt; <a href=3D"https://android.googlesource.com/platform/hardware/google/g=
fxstream/+/refs/heads/main/host/virtio-gpu-gfxstream-renderer.cpp#1691" rel=
=3D"noreferrer" target=3D"_blank">https://android.googlesource.com/platform=
/hardware/google/gfxstream/+/refs/heads/main/host/virtio-gpu-gfxstream-rend=
erer.cpp#1691</a><br>
&gt;<br>
&gt; If you want to be paranoid, you can also validate the ResourceCreateBl=
ob::size is properly host-page aligned when that request reaches the host.<=
br>
&gt;<br>
&gt; So you can probably solve this problem using current interfaces.=C2=A0=
 Whether it&#39;s cleaner for all context types to use the capabilities, or=
 have all VMMs to expose VIRTIO_GPU_F_HOST_PAGE_SIZE, would be the cost/ben=
efit tradeoff.<br>
&gt;<br>
<br>
I guess solving it in a context-type specific way is possible.=C2=A0 But I<=
br>
think it is a relatively universal constraint.=C2=A0 And maybe it makes<br>
sense for virtgpu guest kernel to enforce alignment (at least it can<br>
return an error synchronously) in addition to the host.<br></blockquote><di=
v><br></div><div>virtio-media may have support for=C2=A0VIRTIO_MEDIA_CMD_MM=
AP too, so could run into this issue.</div><div><br></div><div><a href=3D"h=
ttps://github.com/chromeos/virtio-media?tab=3Dreadme-ov-file#shared-memory-=
regions">https://github.com/chromeos/virtio-media?tab=3Dreadme-ov-file#shar=
ed-memory-regions</a><br></div><div><br></div><div>virtio-fs also has the D=
AX window which uses the same memory mapping mechanism.</div><div><br></div=
><div><a href=3D"https://virtio-fs.gitlab.io/design.html">https://virtio-fs=
.gitlab.io/design.html</a><br></div><div><br></div><div>Maybe this should n=
ot be a virtio-gpu thing, but a virtio thing?</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
BR,<br>
-R<br>
<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Thanks,<br>
&gt;&gt; Sergio.<br>
&gt;&gt;<br>
</blockquote></div></div>

--00000000000017228a061f1a1866--
