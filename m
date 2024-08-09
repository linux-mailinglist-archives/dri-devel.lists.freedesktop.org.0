Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3F994D6C7
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 21:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADAD10E067;
	Fri,  9 Aug 2024 19:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="gh2+OBV7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74A510E067
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 19:02:45 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5a10835487fso3214263a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2024 12:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723230164; x=1723834964;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MnWrIgclklVbAZIiHP0gJcFdNno7tz7kj08tc0Kn+Ws=;
 b=gh2+OBV7f8nufQ+jJZaOWSGlO0NmnRQTBMsbaef7lvA45HoGZNtFeTEypHEfGrdcfc
 bUd2LGmFRPswcse/k4Dc6K9yUuEFRSnF2LoGtEQ5+S047OD5ZRaXptJxMXY/xq/IXsW2
 QQs4uAooiul99OVVb4Iyu6/4S/3aVavPZSdG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723230164; x=1723834964;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MnWrIgclklVbAZIiHP0gJcFdNno7tz7kj08tc0Kn+Ws=;
 b=rIeNzguyKajSuN2uxEnIu2nKSl8lZC6xoHGrnKEbdG221qRnoC1ebuOGyWMlG1T4e4
 jJ6EGYVbtjhUh4OlY6z2064Ho13Wg+PZBwf5N03joylEtbwYgjXtfoXHl4RdcPiTe4HS
 eBqH7XHkkSsuRed4an9Xz0Fel9kQUoO/vwYLcUOs1H24Y1UXhNebksI/UsmFOFTFkHxp
 87gc0DOvtI4AlzB1GTtoMvdyI+ulv4dLl7daDShxDjFeb1+De5NAk41in8RIxnvPbLi9
 fL2lqm5zhZlOXn4r7PpalUjxam3P7LCl2nrUxpuNRo/BcqU0N+bggEKOiTWCh+7TeOBC
 EnQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7NUkEMyK3OdSFCfwbb0KOzEOr3liD485Eh9+COrGg65TUHXfGott6hMBU4Dohv0L3Ucc8Qb1PNixDkR/gd/PdirBmhbibzpZ5DoxZyRjQ
X-Gm-Message-State: AOJu0Yy/1nyNfsO2fcWbL9bJyi9Bev/9FGT/BCg1NQBLH/bURwcv373O
 TqzIeZv9CXDmDbLQ5nx/hADcbIydPrVcL3rkJE0YcIjnhgKFCLqiV7ChC7rSGB7ieQGz72DJGyN
 IYw==
X-Google-Smtp-Source: AGHT+IG49+SXu9VD0634eq1y+D8Vguq0U32+inKcC/BPevb3hrIvY7wsL3VPiKL++HOGfXJm1wqIeg==
X-Received: by 2002:a05:6402:34d5:b0:5a1:a7cb:8f86 with SMTP id
 4fb4d7f45d1cf-5bd0a3d7952mr1833373a12.0.1723230163270; 
 Fri, 09 Aug 2024 12:02:43 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com.
 [209.85.208.45]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bd196a3258sm19866a12.41.2024.08.09.12.02.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Aug 2024 12:02:42 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5a1b073d7cdso2804a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2024 12:02:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUnlArFdeEGPoPv3YBoROd7sGPdxOXjlMrKET548S0mo+JxKppCBi6VeJ8k2qGBMfctQCCx1s9whu8t6svk2Vy62fsaWpjwj6OnNjjnC2fE
X-Received: by 2002:a05:6402:13cd:b0:58b:15e4:d786 with SMTP id
 4fb4d7f45d1cf-5bd1515acb0mr9606a12.5.1723230161558; Fri, 09 Aug 2024 12:02:41
 -0700 (PDT)
MIME-Version: 1.0
References: <20240723114914.53677-1-slp@redhat.com>
 <942afa37-a24c-48ed-ae10-c811849165bf@collabora.com>
 <CAAiTLFV6mAgrMj=itcxoBCibvYRyrAk02wYp-gYJ8kxhF0EPmw@mail.gmail.com>
 <CAAfnVBkWKn3+YEhNz0CTmw-T_jjL72axkWqYgkzkSa72t_Gf0A@mail.gmail.com>
 <CAF6AEGsnpEYFsCfZUAPopWzY=wv_GWn0P5f5D6U9y-JrWGQVnw@mail.gmail.com>
 <CAAfnVBki816fSPuQ_FcvuwYzbSwiS_WaYsGSA1AyitmAA5OsXg@mail.gmail.com>
 <CAAiTLFUWhP+wy694MbYDvzHgUD_pZZf7Jj=AfVvTj6CWAYZ+zA@mail.gmail.com>
In-Reply-To: <CAAiTLFUWhP+wy694MbYDvzHgUD_pZZf7Jj=AfVvTj6CWAYZ+zA@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Fri, 9 Aug 2024 12:02:28 -0700
X-Gmail-Original-Message-ID: <CAAfnVBkkste=HR2SKRBNWXKcunbA2iEP+rr9yhDy89+WZsYeQw@mail.gmail.com>
Message-ID: <CAAfnVBkkste=HR2SKRBNWXKcunbA2iEP+rr9yhDy89+WZsYeQw@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/virtio: introduce the HOST_PAGE_SIZE feature
To: Sergio Lopez Pascual <slp@redhat.com>
Cc: Rob Clark <robdclark@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 tzimmermann@suse.de, mripard@kernel.org, olvaffe@gmail.com, kraxel@redhat.com, 
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, airlied@redhat.com, 
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
 dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000a6351a061f44c984"
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

--000000000000a6351a061f44c984
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 8, 2024 at 3:38=E2=80=AFAM Sergio Lopez Pascual <slp@redhat.com=
> wrote:

> Gurchetan Singh <gurchetansingh@chromium.org> writes:
>
> > On Tue, Aug 6, 2024 at 1:15=E2=80=AFPM Rob Clark <robdclark@gmail.com> =
wrote:
> >
> >> On Tue, Aug 6, 2024 at 9:15=E2=80=AFAM Gurchetan Singh
> >> <gurchetansingh@chromium.org> wrote:
> >> >
> >> >
> >> >
> >> > On Mon, Aug 5, 2024 at 2:14=E2=80=AFAM Sergio Lopez Pascual <slp@red=
hat.com>
> >> wrote:
> >> >>
> >> >> Dmitry Osipenko <dmitry.osipenko@collabora.com> writes:
> >> >>
> >> >> > On 7/23/24 14:49, Sergio Lopez wrote:
> >> >> >> There's an incresing number of machines supporting multiple page
> >> sizes
> >> >> >> and on these machines the host and a guest can be running, each
> one,
> >> >> >> with a different page size.
> >> >> >>
> >> >> >> For what pertains to virtio-gpu, this is not a problem if the pa=
ge
> >> size
> >> >> >> of the guest happens to be bigger or equal than the host, but wi=
ll
> >> >> >> potentially lead to failures in memory allocations and/or mappin=
gs
> >> >> >> otherwise.
> >> >> >
> >> >> > Please describe concrete problem you're trying to solve. Guest
> memory
> >> >> > allocation consists of guest pages, I don't see how knowledge of
> host
> >> >> > page size helps anything in userspace.
> >> >> >
> >> >> > I suspect you want this for host blobs, but then it should be
> >> >> > virtio_gpu_vram_create() that should use max(host_page_sz,
> >> >> > guest_page_size), AFAICT. It's kernel who is responsible for memo=
ry
> >> >> > management, userspace can't be trusted for doing that.
> >> >>
> >> >> Mesa's Vulkan/Venus uses CREATE_BLOB to request the host the creati=
on
> >> >> and mapping into the guest of device-backed memory and shmem region=
s.
> >> >> The CREATE_BLOB ioctl doesn't update
> drm_virtgpu_resource_create->size,
> >> >> so the guest kernel (and, as a consequence, the host kernel) can't
> >> >> override the user's request.
> >> >>
> >> >> I'd like Mesa's Vulkan/Venus in the guest to be able to obtain the
> host
> >> >> page size to align the size of the CREATE_BLOB requests as required=
.
> >> >
> >> >
> >> > gfxstream solves this problem by putting the relevant information in
> the
> >> capabilities obtained from the host:
> >> >
> >> >
> >>
> https://android.googlesource.com/platform/hardware/google/gfxstream/+/ref=
s/heads/main/host/virtio-gpu-gfxstream-renderer.cpp#1691
> >> >
> >> > If you want to be paranoid, you can also validate the
> >> ResourceCreateBlob::size is properly host-page aligned when that reque=
st
> >> reaches the host.
> >> >
> >> > So you can probably solve this problem using current interfaces.
> >> Whether it's cleaner for all context types to use the capabilities, or
> have
> >> all VMMs to expose VIRTIO_GPU_F_HOST_PAGE_SIZE, would be the
> cost/benefit
> >> tradeoff.
> >> >
> >>
> >> I guess solving it in a context-type specific way is possible.  But I
> >> think it is a relatively universal constraint.  And maybe it makes
> >> sense for virtgpu guest kernel to enforce alignment (at least it can
> >> return an error synchronously) in addition to the host.
> >>
> >
> > virtio-media may have support for VIRTIO_MEDIA_CMD_MMAP too, so could r=
un
> > into this issue.
> >
> >
> https://github.com/chromeos/virtio-media?tab=3Dreadme-ov-file#shared-memo=
ry-regions
> >
> > virtio-fs also has the DAX window which uses the same memory mapping
> > mechanism.
> >
> > https://virtio-fs.gitlab.io/design.html
> >
> > Maybe this should not be a virtio-gpu thing, but a virtio thing?
>
> This is true, but finding a common place to put the page size is really
> hard in practice. I don't think we can borrow space in the feature bits
> for that (and that would probably be abusing its purpose quite a bit)
> and extending the transport configuration registers is quite cumbersome
> and, in general, undesirable.
>
> That leaves us with the device-specific config space, and that implies a
> device-specific feature bit as it's implemented in this series.
>
> The Shared Memory Regions on the VIRTIO spec, while doesn't talk
> specifically about page size, also gives us a hint about this being the
> right direction:
>

Can't we just modify the Shared Memory region PCI capability to include
page size?  We can either:

1) keep the same size struct + header (VIRTIO_PCI_CAP_SHARED_MEMORY_CFG),
and just hijack one of the padding fields. If the padding field is zero, we
can just say it's 4096.

or

2) Or expand the size of the struct, with
VIRTIO_PCI_CAP_SHARED_MEMORY_CFG2.

(sketch here: crrev.com/c/5778179)

The benefit of this would work with virtio-fs (though I'm not sure anyone
uses the DAX window), and possibly virtio-media in the future.


>
> "
> 2.10 Shared Memory Regions
> (...)
> Memory consistency rules vary depending on the region and the device
> and they will be specified as required by each device."
> "
>
> Thanks,
> Sergio.
>
>

--000000000000a6351a061f44c984
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 8, 2024 at 3:38=E2=80=AFA=
M Sergio Lopez Pascual &lt;<a href=3D"mailto:slp@redhat.com">slp@redhat.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Gurchetan Singh &lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=
=3D"_blank">gurchetansingh@chromium.org</a>&gt; writes:<br>
<br>
&gt; On Tue, Aug 6, 2024 at 1:15=E2=80=AFPM Rob Clark &lt;<a href=3D"mailto=
:robdclark@gmail.com" target=3D"_blank">robdclark@gmail.com</a>&gt; wrote:<=
br>
&gt;<br>
&gt;&gt; On Tue, Aug 6, 2024 at 9:15=E2=80=AFAM Gurchetan Singh<br>
&gt;&gt; &lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=3D"_blan=
k">gurchetansingh@chromium.org</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Mon, Aug 5, 2024 at 2:14=E2=80=AFAM Sergio Lopez Pascual &=
lt;<a href=3D"mailto:slp@redhat.com" target=3D"_blank">slp@redhat.com</a>&g=
t;<br>
&gt;&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Dmitry Osipenko &lt;<a href=3D"mailto:dmitry.osipenko@col=
labora.com" target=3D"_blank">dmitry.osipenko@collabora.com</a>&gt; writes:=
<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; On 7/23/24 14:49, Sergio Lopez wrote:<br>
&gt;&gt; &gt;&gt; &gt;&gt; There&#39;s an incresing number of machines supp=
orting multiple page<br>
&gt;&gt; sizes<br>
&gt;&gt; &gt;&gt; &gt;&gt; and on these machines the host and a guest can b=
e running, each one,<br>
&gt;&gt; &gt;&gt; &gt;&gt; with a different page size.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; For what pertains to virtio-gpu, this is not a p=
roblem if the page<br>
&gt;&gt; size<br>
&gt;&gt; &gt;&gt; &gt;&gt; of the guest happens to be bigger or equal than =
the host, but will<br>
&gt;&gt; &gt;&gt; &gt;&gt; potentially lead to failures in memory allocatio=
ns and/or mappings<br>
&gt;&gt; &gt;&gt; &gt;&gt; otherwise.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Please describe concrete problem you&#39;re trying t=
o solve. Guest memory<br>
&gt;&gt; &gt;&gt; &gt; allocation consists of guest pages, I don&#39;t see =
how knowledge of host<br>
&gt;&gt; &gt;&gt; &gt; page size helps anything in userspace.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; I suspect you want this for host blobs, but then it =
should be<br>
&gt;&gt; &gt;&gt; &gt; virtio_gpu_vram_create() that should use max(host_pa=
ge_sz,<br>
&gt;&gt; &gt;&gt; &gt; guest_page_size), AFAICT. It&#39;s kernel who is res=
ponsible for memory<br>
&gt;&gt; &gt;&gt; &gt; management, userspace can&#39;t be trusted for doing=
 that.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Mesa&#39;s Vulkan/Venus uses CREATE_BLOB to request the h=
ost the creation<br>
&gt;&gt; &gt;&gt; and mapping into the guest of device-backed memory and sh=
mem regions.<br>
&gt;&gt; &gt;&gt; The CREATE_BLOB ioctl doesn&#39;t update drm_virtgpu_reso=
urce_create-&gt;size,<br>
&gt;&gt; &gt;&gt; so the guest kernel (and, as a consequence, the host kern=
el) can&#39;t<br>
&gt;&gt; &gt;&gt; override the user&#39;s request.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I&#39;d like Mesa&#39;s Vulkan/Venus in the guest to be a=
ble to obtain the host<br>
&gt;&gt; &gt;&gt; page size to align the size of the CREATE_BLOB requests a=
s required.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; gfxstream solves this problem by putting the relevant informa=
tion in the<br>
&gt;&gt; capabilities obtained from the host:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; <a href=3D"https://android.googlesource.com/platform/hardware/goog=
le/gfxstream/+/refs/heads/main/host/virtio-gpu-gfxstream-renderer.cpp#1691"=
 rel=3D"noreferrer" target=3D"_blank">https://android.googlesource.com/plat=
form/hardware/google/gfxstream/+/refs/heads/main/host/virtio-gpu-gfxstream-=
renderer.cpp#1691</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; If you want to be paranoid, you can also validate the<br>
&gt;&gt; ResourceCreateBlob::size is properly host-page aligned when that r=
equest<br>
&gt;&gt; reaches the host.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; So you can probably solve this problem using current interfac=
es.<br>
&gt;&gt; Whether it&#39;s cleaner for all context types to use the capabili=
ties, or have<br>
&gt;&gt; all VMMs to expose VIRTIO_GPU_F_HOST_PAGE_SIZE, would be the cost/=
benefit<br>
&gt;&gt; tradeoff.<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; I guess solving it in a context-type specific way is possible.=C2=
=A0 But I<br>
&gt;&gt; think it is a relatively universal constraint.=C2=A0 And maybe it =
makes<br>
&gt;&gt; sense for virtgpu guest kernel to enforce alignment (at least it c=
an<br>
&gt;&gt; return an error synchronously) in addition to the host.<br>
&gt;&gt;<br>
&gt;<br>
&gt; virtio-media may have support for VIRTIO_MEDIA_CMD_MMAP too, so could =
run<br>
&gt; into this issue.<br>
&gt;<br>
&gt; <a href=3D"https://github.com/chromeos/virtio-media?tab=3Dreadme-ov-fi=
le#shared-memory-regions" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/chromeos/virtio-media?tab=3Dreadme-ov-file#shared-memory-regions</a>=
<br>
&gt;<br>
&gt; virtio-fs also has the DAX window which uses the same memory mapping<b=
r>
&gt; mechanism.<br>
&gt;<br>
&gt; <a href=3D"https://virtio-fs.gitlab.io/design.html" rel=3D"noreferrer"=
 target=3D"_blank">https://virtio-fs.gitlab.io/design.html</a><br>
&gt;<br>
&gt; Maybe this should not be a virtio-gpu thing, but a virtio thing?<br>
<br>
This is true, but finding a common place to put the page size is really<br>
hard in practice. I don&#39;t think we can borrow space in the feature bits=
<br>
for that (and that would probably be abusing its purpose quite a bit)<br>
and extending the transport configuration registers is quite cumbersome<br>
and, in general, undesirable.<br>
<br>
That leaves us with the device-specific config space, and that implies a<br=
>
device-specific feature bit as it&#39;s implemented in this series.<br>
<br>
The Shared Memory Regions on the VIRTIO spec, while doesn&#39;t talk<br>
specifically about page size, also gives us a hint about this being the<br>
right direction:<br></blockquote><div><br></div><div>Can&#39;t we just modi=
fy the Shared Memory region PCI capability to include page size?=C2=A0 We c=
an either:</div><div><br></div><div>1) keep the same size struct + header (=
VIRTIO_PCI_CAP_SHARED_MEMORY_CFG), and just hijack one of the padding field=
s. If the padding field is zero, we can just say it&#39;s 4096.</div><div><=
br></div><div>or</div><div>=C2=A0</div><div>2) Or expand the size of the st=
ruct, with VIRTIO_PCI_CAP_SHARED_MEMORY_CFG2.=C2=A0</div><div><br></div><di=
v>(sketch here: <a href=3D"http://crrev.com/c/5778179">crrev.com/c/5778179<=
/a>)</div><div><br></div><div>The benefit of this would work with virtio-fs=
 (though I&#39;m not sure anyone uses the DAX window), and possibly virtio-=
media in the future.=C2=A0=C2=A0</div><div>=C2=A0<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
&quot;<br>
2.10 Shared Memory Regions<br>
(...)<br>
Memory consistency rules vary depending on the region and the device<br>
and they will be specified as required by each device.&quot;<br>
&quot;<br>
<br>
Thanks,<br>
Sergio.<br>
<br>
</blockquote></div></div>

--000000000000a6351a061f44c984--
