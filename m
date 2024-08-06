Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D47D949527
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 18:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF2310E3A7;
	Tue,  6 Aug 2024 16:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="KhtVjDBE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198EE10E3A7
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 16:04:43 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5a1337cfbb5so1144387a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2024 09:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1722960280; x=1723565080;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qRzAg0euV3EPW2AY2mjyCD/GUwO4oXNlXTDtWw9VyLo=;
 b=KhtVjDBExXNsBrYEurudUuXs3D3K7h+uiTWNPX8TZUBM51kRuZQbEXTGWotQBvPaZ+
 jYUOBuFEag1w+Bw240GUyxiOQ4aFWkByNPB3ayRNyQSgOUD1fyI10VXgJ0vTJa2vt8IX
 UHeIgjArtRG5PcuahEfybVkCBa+W4bYyivsbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722960280; x=1723565080;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qRzAg0euV3EPW2AY2mjyCD/GUwO4oXNlXTDtWw9VyLo=;
 b=lFJFcG8nieMe2d4p55TUuzdM5ao3Pn8P1eeIYyGL8lRnTdBMXXyGjWJUae0n4FmbP9
 XXPYPJ61TgHMaM4XHAlFiPlaEXyaOrndgZ/Sbcr1WNccbDT5WWCl0gm1cdv7HEorob5p
 EmHKTM0ACpH3rpAfny1jWesvnXycJyo5fE95OM4mljlcQOkYNZl8NXvbKVhNpoivkGAJ
 gdOKScwUfQjaXgEmDUZPm/VNA/uY8UJgz5O8R2cMAVaVrGVq80AXmOppEB8Bi+BNgUcT
 +z+PCbqOPNv8tZai7Ga7UzzUlz6yVL2wCxYkaSZZ3sPTh+JKcFQi24jnAOxzJrPJDmHN
 R4kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVi4yittk/cgdJgmPE66rEYVF/fLUl06MtEsMUxMaJp0AGOsAgOjKa6nfHYrSqgmnYYnqXUeaBdusSY/KKNmxCmdHDTZJszl+N8XL/Qvr1S
X-Gm-Message-State: AOJu0Yx89XNTOBWsXfAf97njQDqe+CeHn7Z0v/l97gtey0kX/3Y5zvm6
 ryWMAqAC81PuyS/MlQ7ASQ2FTogNQiRgAbboE+VigfPwPortpr5gJ8LiTMVgnGzOh8dUtc8qBKF
 YQw==
X-Google-Smtp-Source: AGHT+IFK8ME0SBZrshmRLzJXYfii9r6aQOHU4B1fJsqHTpS+eC/RJWoIC6WtF3t1eAZQjVCpUKXhbg==
X-Received: by 2002:aa7:d34e:0:b0:5a7:448b:4434 with SMTP id
 4fb4d7f45d1cf-5b7f3adacc6mr12009590a12.9.1722960279666; 
 Tue, 06 Aug 2024 09:04:39 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com.
 [209.85.208.47]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bacbcf7b58sm3665108a12.83.2024.08.06.09.04.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Aug 2024 09:04:39 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5a1b073d7cdso18708a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2024 09:04:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU2UX2Sq1NiWNEQ4hnmTM1UiCzTEoCe+6RVJv9aiULfS3ibFeTM+SkCOcnFvtJkox4uevLQcfXJAUhF6B6yv0lddf/67nrAGRZbpMV1TTU6
X-Received: by 2002:a05:6402:268c:b0:58b:93:b624 with SMTP id
 4fb4d7f45d1cf-5bb991dd751mr148716a12.1.1722960278303; Tue, 06 Aug 2024
 09:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240723114914.53677-1-slp@redhat.com>
 <942afa37-a24c-48ed-ae10-c811849165bf@collabora.com>
 <CAAiTLFV6mAgrMj=itcxoBCibvYRyrAk02wYp-gYJ8kxhF0EPmw@mail.gmail.com>
In-Reply-To: <CAAiTLFV6mAgrMj=itcxoBCibvYRyrAk02wYp-gYJ8kxhF0EPmw@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Tue, 6 Aug 2024 09:04:25 -0700
X-Gmail-Original-Message-ID: <CAAfnVBkWKn3+YEhNz0CTmw-T_jjL72axkWqYgkzkSa72t_Gf0A@mail.gmail.com>
Message-ID: <CAAfnVBkWKn3+YEhNz0CTmw-T_jjL72axkWqYgkzkSa72t_Gf0A@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/virtio: introduce the HOST_PAGE_SIZE feature
To: Sergio Lopez Pascual <slp@redhat.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, tzimmermann@suse.de,
 mripard@kernel.org, 
 olvaffe@gmail.com, kraxel@redhat.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, airlied@redhat.com, 
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
 dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000005a5b8b061f05f3ff"
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

--0000000000005a5b8b061f05f3ff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 2:14=E2=80=AFAM Sergio Lopez Pascual <slp@redhat.com=
> wrote:

> Dmitry Osipenko <dmitry.osipenko@collabora.com> writes:
>
> > On 7/23/24 14:49, Sergio Lopez wrote:
> >> There's an incresing number of machines supporting multiple page sizes
> >> and on these machines the host and a guest can be running, each one,
> >> with a different page size.
> >>
> >> For what pertains to virtio-gpu, this is not a problem if the page siz=
e
> >> of the guest happens to be bigger or equal than the host, but will
> >> potentially lead to failures in memory allocations and/or mappings
> >> otherwise.
> >
> > Please describe concrete problem you're trying to solve. Guest memory
> > allocation consists of guest pages, I don't see how knowledge of host
> > page size helps anything in userspace.
> >
> > I suspect you want this for host blobs, but then it should be
> > virtio_gpu_vram_create() that should use max(host_page_sz,
> > guest_page_size), AFAICT. It's kernel who is responsible for memory
> > management, userspace can't be trusted for doing that.
>
> Mesa's Vulkan/Venus uses CREATE_BLOB to request the host the creation
> and mapping into the guest of device-backed memory and shmem regions.
> The CREATE_BLOB ioctl doesn't update drm_virtgpu_resource_create->size,
> so the guest kernel (and, as a consequence, the host kernel) can't
> override the user's request.
>
> I'd like Mesa's Vulkan/Venus in the guest to be able to obtain the host
> page size to align the size of the CREATE_BLOB requests as required.
>

gfxstream solves this problem by putting the relevant information in the
capabilities obtained from the host:

https://android.googlesource.com/platform/hardware/google/gfxstream/+/refs/=
heads/main/host/virtio-gpu-gfxstream-renderer.cpp#1691

If you want to be paranoid, you can also validate the
ResourceCreateBlob::size is properly host-page aligned when that
request reaches the host.

So you can probably solve this problem using current interfaces.  Whether
it's cleaner for all context types to use the capabilities, or have all
VMMs to expose VIRTIO_GPU_F_HOST_PAGE_SIZE, would be the cost/benefit
tradeoff.


>
> Thanks,
> Sergio.
>
>

--0000000000005a5b8b061f05f3ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 5, 2024 at 2:14=E2=80=AFA=
M Sergio Lopez Pascual &lt;<a href=3D"mailto:slp@redhat.com">slp@redhat.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Dmitry Osipenko &lt;<a href=3D"mailto:dmitry.osipenko@collabora.com" target=
=3D"_blank">dmitry.osipenko@collabora.com</a>&gt; writes:<br>
<br>
&gt; On 7/23/24 14:49, Sergio Lopez wrote:<br>
&gt;&gt; There&#39;s an incresing number of machines supporting multiple pa=
ge sizes<br>
&gt;&gt; and on these machines the host and a guest can be running, each on=
e,<br>
&gt;&gt; with a different page size.<br>
&gt;&gt;<br>
&gt;&gt; For what pertains to virtio-gpu, this is not a problem if the page=
 size<br>
&gt;&gt; of the guest happens to be bigger or equal than the host, but will=
<br>
&gt;&gt; potentially lead to failures in memory allocations and/or mappings=
<br>
&gt;&gt; otherwise.<br>
&gt;<br>
&gt; Please describe concrete problem you&#39;re trying to solve. Guest mem=
ory<br>
&gt; allocation consists of guest pages, I don&#39;t see how knowledge of h=
ost<br>
&gt; page size helps anything in userspace.<br>
&gt;<br>
&gt; I suspect you want this for host blobs, but then it should be<br>
&gt; virtio_gpu_vram_create() that should use max(host_page_sz,<br>
&gt; guest_page_size), AFAICT. It&#39;s kernel who is responsible for memor=
y<br>
&gt; management, userspace can&#39;t be trusted for doing that.<br>
<br>
Mesa&#39;s Vulkan/Venus uses CREATE_BLOB to request the host the creation<b=
r>
and mapping into the guest of device-backed memory and shmem regions.<br>
The CREATE_BLOB ioctl doesn&#39;t update drm_virtgpu_resource_create-&gt;si=
ze,<br>
so the guest kernel (and, as a consequence, the host kernel) can&#39;t<br>
override the user&#39;s request.<br>
<br>
I&#39;d like Mesa&#39;s Vulkan/Venus in the guest to be able to obtain the =
host<br>
page size to align the size of the CREATE_BLOB requests as required.<br></b=
lockquote><div><br></div><div>gfxstream solves this problem by putting the =
relevant information in the capabilities obtained from the host:</div><div>=
<br></div><div><a href=3D"https://android.googlesource.com/platform/hardwar=
e/google/gfxstream/+/refs/heads/main/host/virtio-gpu-gfxstream-renderer.cpp=
#1691">https://android.googlesource.com/platform/hardware/google/gfxstream/=
+/refs/heads/main/host/virtio-gpu-gfxstream-renderer.cpp#1691</a><br></div>=
<div><br></div><div>If you want to be paranoid, you can also validate the R=
esourceCreateBlob::size is properly host-page aligned when that request=C2=
=A0reaches the host.</div><div><br></div><div>So you can probably solve thi=
s problem using current interfaces.=C2=A0 Whether it&#39;s cleaner for all =
context types to use the capabilities, or have all VMMs to expose VIRTIO_GP=
U_F_HOST_PAGE_SIZE, would be the cost/benefit tradeoff.</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
Sergio.<br>
<br>
</blockquote></div></div>

--0000000000005a5b8b061f05f3ff--
