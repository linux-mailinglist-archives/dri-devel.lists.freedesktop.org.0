Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 051EB6FFDD0
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 02:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584DC10E603;
	Fri, 12 May 2023 00:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4CB10E603
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 00:17:48 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50bc25f0c7dso16756972a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 17:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683850663; x=1686442663;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A8SW9YoumdQ8cXqFALi795RyrEYhnQ1pvgweAzLFr0w=;
 b=C058dF6y+mfJ89SQm6Q3anr/4ebdu9+eETydzkGC/8JLRV5v78l6p0MvNeSO4xupp2
 dleH5zI15hZY3itpmykHGc5PSMo2AQzlBNd8Hbt5nnA0JrOWnSQM82E3o7gRFhDB6a44
 yRpYhF/X7YT+WGo1a3UHcJ49JoOlf5zfLYvUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683850663; x=1686442663;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A8SW9YoumdQ8cXqFALi795RyrEYhnQ1pvgweAzLFr0w=;
 b=jGjULKKMyyNS6rVL0oqv047Lo8f7dzv5tVyWmvYbDxt61B7/m8squYkZGgsUbDLd+y
 Bv7tL29DYfmC11BHWN1a43fCx+tFjh7gD+nLSm4yHAryCKupG2R0VV7Uw5t0KlGdWltK
 ysGqRxjps3CdKxY8a2HBnDfA8UyKeXr/Fa/P5GLr8uB9Zk1zALk1QGoiZRQhxd632FIo
 kRs3uzQkFjvPSV0Cqi1gm7iSVzhcfKq03ePmH2k6xA7cbNFPxsX1R0/5ikrCIvYXb841
 i3dw35wXwrVoDVTxxHGHyesYGXqm0OGnBcrPK7HCs9dT9e9zNZ7KNHmCnNhVB2HhkIQi
 g1RQ==
X-Gm-Message-State: AC+VfDyRuhJJPGYW8GuUjOQMUCJztaDoVUIO+5p+/72VW51tQKKn09Sj
 o/2QPmKHkI3l64DnBKuhPTHbRR5SaSEhVg6NsoYxoA==
X-Google-Smtp-Source: ACHHUZ6Q4WZwr5s2Ql2u5hNHwbRL2rjjKIc1NAM6+LMDRWekRklweK+4yh0kYyz/72gcKSuxFIuXlg==
X-Received: by 2002:a17:907:9606:b0:932:7f5c:4bb2 with SMTP id
 gb6-20020a170907960600b009327f5c4bb2mr22851891ejc.75.1683850663705; 
 Thu, 11 May 2023 17:17:43 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 e27-20020a170906249b00b0095707b7dd04sm4545873ejb.42.2023.05.11.17.17.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 17:17:43 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-50dba8a52dcso26322a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 17:17:42 -0700 (PDT)
X-Received: by 2002:a50:d4ce:0:b0:502:2af:7b1d with SMTP id
 e14-20020a50d4ce000000b0050202af7b1dmr10146edj.3.1683850662405; Thu, 11 May
 2023 17:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230416115237.798604-1-dmitry.osipenko@collabora.com>
 <141b928d-6165-f282-b8e6-f140cb09333d@collabora.com>
 <CAAfnVBnrUotph4TYJVu9Bohqv3m80t90V34TNhh-Tspxwsj-ZQ@mail.gmail.com>
 <CAF6AEGs4fuq4i8UJdO5hvgHTNhzFMKGZ87+w1oyvL0LAqWio6A@mail.gmail.com>
In-Reply-To: <CAF6AEGs4fuq4i8UJdO5hvgHTNhzFMKGZ87+w1oyvL0LAqWio6A@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Thu, 11 May 2023 17:17:30 -0700
X-Gmail-Original-Message-ID: <CAAfnVBkLhYVaSG3U_QUZwXLFv-XT=9F2v2pgrCDQQBgNZ3MSWA@mail.gmail.com>
Message-ID: <CAAfnVBkLhYVaSG3U_QUZwXLFv-XT=9F2v2pgrCDQQBgNZ3MSWA@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Add sync object UAPI support to VirtIO-GPU driver
To: Rob Clark <robdclark@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000096c54605fb740851"
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
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@redhat.com>, kernel@collabora.com,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000096c54605fb740851
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 8, 2023 at 6:59=E2=80=AFAM Rob Clark <robdclark@gmail.com> wrot=
e:

> On Wed, May 3, 2023 at 10:07=E2=80=AFAM Gurchetan Singh
> <gurchetansingh@chromium.org> wrote:
> >
> >
> >
> > On Mon, May 1, 2023 at 8:38=E2=80=AFAM Dmitry Osipenko <
> dmitry.osipenko@collabora.com> wrote:
> >>
> >> On 4/16/23 14:52, Dmitry Osipenko wrote:
> >> > We have multiple Vulkan context types that are awaiting for the
> addition
> >> > of the sync object DRM UAPI support to the VirtIO-GPU kernel driver:
> >> >
> >> >  1. Venus context
> >> >  2. Native contexts (virtio-freedreno, virtio-intel, virtio-amdgpu)
> >> >
> >> > Mesa core supports DRM sync object UAPI, providing Vulkan drivers
> with a
> >> > generic fencing implementation that we want to utilize.
> >> >
> >> > This patch adds initial sync objects support. It creates fundament
> for a
> >> > further fencing improvements. Later on we will want to extend the
> VirtIO-GPU
> >> > fencing API with passing fence IDs to host for waiting, it will be a
> new
> >> > additional VirtIO-GPU IOCTL and more. Today we have several
> VirtIO-GPU context
> >> > drivers in works that require VirtIO-GPU to support sync objects UAP=
I.
> >> >
> >> > The patch is heavily inspired by the sync object UAPI implementation
> of the
> >> > MSM driver.
> >>
> >> Gerd, do you have any objections to merging this series?
> >>
> >> We have AMDGPU [1] and Intel [2] native context WIP drivers depending =
on
> >> the sync object support. It is the only part missing from kernel today
> >> that is wanted by the native context drivers. Otherwise, there are few
> >> other things in Qemu and virglrenderer left to sort out.
> >>
> >> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/21658
> >> [2]
> https://gitlab.freedesktop.org/digetx/mesa/-/commits/native-context-iris
> >
> >
> > I'm not saying this change isn't good, just it's probably possible to
> implement the native contexts (even up to even VK1.2) without it.  But th=
is
> patch series may be the most ergonomic way to do it, given how Mesa is
> designed.  But you probably want one of Mesa MRs reviewed first before
> merging (I added a comment on the amdgpu change) and that is a requiremen=
t
> [a].
> >
> > [a] "The userspace side must be fully reviewed and tested to the
> standards of that user space project. For e.g. mesa this means piglit
> testcases and review on the mailing list. This is again to ensure that th=
e
> new interface actually gets the job done." -- from the requirements
> >
>
> tbh, the syncobj support is all drm core, the only driver specifics is
> the ioctl parsing.  IMHO existing tests and the two existing consumers
> are sufficient.  (Also, considering that additional non-drm
> dependencies involved.)
>

Can we get one of the Mesa MRs reviewed first?  There's currently no
virtio-intel MR AFAICT, and the amdgpu one is marked as "Draft:".

Even for the amdgpu, Pierre suggests the feature "will be marked as
experimental both in Mesa and virglrenderer" and we can revise as needed.
The DRM requirements seem to warn against adding an UAPI too hastily...

You can get the deqp-vk 1.2 tests to pass with the current UAPI, if you
just change your mesa <--> virglrenderer protocol a little.  Perhaps that
way is even better, since you plumb the in sync-obj into host-side command
submission.

Without inter-context sharing of the fence, this MR really only adds guest
kernel syntactic sugar.

Note I'm not against syntactic sugar, but I just want to point out that you
can likely merge the native context work without any UAPI changes, in case
it's not clear.

If this was for the core drm syncobj implementation, and not just
> driver ioctl parsing and wiring up the core helpers, I would agree
> with you.
>

There are several possible and viable paths to get the features in question
(VK1.2 syncobjs, and inter-context fence sharing).  There are paths
entirely without the syncobj, paths that only use the syncobj for the
inter-context fence sharing case and create host syncobjs for VK1.2, paths
that also use guest syncobjs in every proxied command submission.

It's really hard to tell which one is better.  Here's my suggestion:

1) Get the native contexts reviewed/merged in Mesa/virglrenderer using the
current UAPI.  Options for VK1.2 include: pushing down the syncobjs to the
host, and simulating the syncobj (as already done).  It's fine to mark
these contexts as "experimental" like msm-experimental.  That will allow
you to experiment with the protocols, come up with tests, and hopefully
determine an answer to the host versus guest syncobj question.

2) Once you've completed (1), try to add UAPI changes for features that are
missing or things that are suboptimal with the knowledge gained from doing
(2).

WDYT?


>
> BR,
> -R
>

--00000000000096c54605fb740851
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 8, 2023 at 6:59=E2=80=AFA=
M Rob Clark &lt;<a href=3D"mailto:robdclark@gmail.com" target=3D"_blank">ro=
bdclark@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Wed, May 3, 2023 at 10:07=E2=80=AFAM Gurchetan Singh<br=
>
&lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=3D"_blank">gurche=
tansingh@chromium.org</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Mon, May 1, 2023 at 8:38=E2=80=AFAM Dmitry Osipenko &lt;<a href=3D"=
mailto:dmitry.osipenko@collabora.com" target=3D"_blank">dmitry.osipenko@col=
labora.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 4/16/23 14:52, Dmitry Osipenko wrote:<br>
&gt;&gt; &gt; We have multiple Vulkan context types that are awaiting for t=
he addition<br>
&gt;&gt; &gt; of the sync object DRM UAPI support to the VirtIO-GPU kernel =
driver:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 1. Venus context<br>
&gt;&gt; &gt;=C2=A0 2. Native contexts (virtio-freedreno, virtio-intel, vir=
tio-amdgpu)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Mesa core supports DRM sync object UAPI, providing Vulkan dri=
vers with a<br>
&gt;&gt; &gt; generic fencing implementation that we want to utilize.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This patch adds initial sync objects support. It creates fund=
ament for a<br>
&gt;&gt; &gt; further fencing improvements. Later on we will want to extend=
 the VirtIO-GPU<br>
&gt;&gt; &gt; fencing API with passing fence IDs to host for waiting, it wi=
ll be a new<br>
&gt;&gt; &gt; additional VirtIO-GPU IOCTL and more. Today we have several V=
irtIO-GPU context<br>
&gt;&gt; &gt; drivers in works that require VirtIO-GPU to support sync obje=
cts UAPI.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The patch is heavily inspired by the sync object UAPI impleme=
ntation of the<br>
&gt;&gt; &gt; MSM driver.<br>
&gt;&gt;<br>
&gt;&gt; Gerd, do you have any objections to merging this series?<br>
&gt;&gt;<br>
&gt;&gt; We have AMDGPU [1] and Intel [2] native context WIP drivers depend=
ing on<br>
&gt;&gt; the sync object support. It is the only part missing from kernel t=
oday<br>
&gt;&gt; that is wanted by the native context drivers. Otherwise, there are=
 few<br>
&gt;&gt; other things in Qemu and virglrenderer left to sort out.<br>
&gt;&gt;<br>
&gt;&gt; [1] <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_re=
quests/21658" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedeskt=
op.org/mesa/mesa/-/merge_requests/21658</a><br>
&gt;&gt; [2] <a href=3D"https://gitlab.freedesktop.org/digetx/mesa/-/commit=
s/native-context-iris" rel=3D"noreferrer" target=3D"_blank">https://gitlab.=
freedesktop.org/digetx/mesa/-/commits/native-context-iris</a><br>
&gt;<br>
&gt;<br>
&gt; I&#39;m not saying this change isn&#39;t good, just it&#39;s probably =
possible to implement the native contexts (even up to even VK1.2) without i=
t.=C2=A0 But this patch series may be the most ergonomic way to do it, give=
n how Mesa is designed.=C2=A0 But you probably want one of Mesa MRs reviewe=
d first before merging (I added a comment on the amdgpu change) and that is=
 a requirement [a].<br>
&gt;<br>
&gt; [a] &quot;The userspace side must be fully reviewed and tested to the =
standards of that user space project. For e.g. mesa this means piglit testc=
ases and review on the mailing list. This is again to ensure that the new i=
nterface actually gets the job done.&quot; -- from the requirements<br>
&gt;<br>
<br>
tbh, the syncobj support is all drm core, the only driver specifics is<br>
the ioctl parsing.=C2=A0 IMHO existing tests and the two existing consumers=
<br>
are sufficient.=C2=A0 (Also, considering that additional non-drm<br>
dependencies involved.)<br></blockquote><div><br></div><div>Can we get one =
of the Mesa MRs reviewed first?=C2=A0 There&#39;s currently no virtio-intel=
 MR AFAICT, and the amdgpu one is marked as &quot;Draft:&quot;.=C2=A0=C2=A0=
</div><div><br></div><div>Even for the amdgpu, Pierre suggests the feature =
&quot;will be marked as experimental both in Mesa and virglrenderer&quot; a=
nd we can revise as needed.=C2=A0 The DRM requirements seem to warn against=
 adding an UAPI too hastily...</div><div><br></div><div>You can get the deq=
p-vk 1.2 tests to pass with the current UAPI, if you just change your mesa =
&lt;--&gt; virglrenderer protocol a little.=C2=A0 Perhaps that way is even =
better, since you plumb the in sync-obj into host-side command submission.=
=C2=A0=C2=A0</div><div><br></div><div>Without inter-context sharing of the =
fence, this MR really only adds guest kernel syntactic sugar.</div><div><br=
></div><div>Note I&#39;m not against syntactic sugar, but I just want to po=
int out that you can likely merge the native context work without any UAPI =
changes, in case it&#39;s not clear.=C2=A0 =C2=A0=C2=A0</div><div><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
If this was for the core drm syncobj implementation, and not just<br>
driver ioctl parsing and wiring up the core helpers, I would agree<br>
with you.<br></blockquote><div><br></div><div>There are several possible an=
d viable paths to get the features in question (VK1.2 syncobjs, and inter-c=
ontext fence sharing).=C2=A0 There are paths entirely without the syncobj, =
paths that only use the syncobj for the inter-context fence sharing case an=
d create host syncobjs for VK1.2, paths that also use guest syncobjs in eve=
ry proxied command submission.=C2=A0=C2=A0</div><div><br></div><div>It&#39;=
s really hard to tell which one is better.=C2=A0 Here&#39;s my suggestion:<=
/div><div><br></div><div>1) Get the native contexts reviewed/merged in Mesa=
/virglrenderer using the current UAPI.=C2=A0 Options for VK1.2 include: pus=
hing down the syncobjs to the host, and simulating the syncobj (as already =
done).=C2=A0 It&#39;s fine to mark these contexts as &quot;experimental&quo=
t; like msm-experimental.=C2=A0 That will allow you to experiment with the =
protocols, come up with tests, and hopefully determine an answer to the hos=
t versus guest syncobj question.=C2=A0=C2=A0</div><div><br></div><div>2) On=
ce you&#39;ve completed (1), try to add UAPI changes for features that are =
missing or things that are suboptimal with the knowledge gained from doing =
(2).=C2=A0=C2=A0</div><div><br></div><div>WDYT?</div><div>=C2=A0<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
BR,<br>
-R<br>
</blockquote></div></div>

--00000000000096c54605fb740851--
