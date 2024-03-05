Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC6D872A79
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 23:53:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034AB112D51;
	Tue,  5 Mar 2024 22:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="HLHEXrgn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010FE112D51
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 22:53:26 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-512bde3d197so286591e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 14:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709679204; x=1710284004;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=e1yVhO6EM2GHPvlA6/gDE2IRjyKUC8ijX6pKypMR1GM=;
 b=HLHEXrgnsEpfAaU6TuABYEy7qM6CGkp5oNkE5+t/vvEiXkkgWaWPzqivEKnQiBPfMI
 b4CmGLggrfhz1+VzImMw7c784fMa3eNsrGGSaoo1BGMOo65oLMrPR5vJswKduxEvFmgZ
 0IAZbaaO2T+wWsTYBory+DByY7WeDuH3DIMUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709679204; x=1710284004;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e1yVhO6EM2GHPvlA6/gDE2IRjyKUC8ijX6pKypMR1GM=;
 b=qj1nZFXLjJg+6tWiWHFGY0/qjWZZzQIIJsgt9yg3RgTTx1M2pg44+4k+M3/my83y3i
 b8NBDv64BeCxzDFiTXAub/GqJ4lP8haEiVYe1K7km3LM/L76WPqd+UxcVO8tignk1HpJ
 b8nFKNFGswjZLtYdgoBFvx/WnYvZdTq8Ra1nl+iTqXkn4glQwenENCsbhYkCD25oautW
 wgUfonWaLbu/ZVppDpxVmOuFWzMjBG9EyeweHGcCEQfCflik6AM1E2q0NjTXHOui3MmI
 J197vp4n1OpUYbUMkzIOqVBigekUcLiYcRlGpaBotOo32HZNSmBpU+gq2TqXK+jkywly
 rK4Q==
X-Gm-Message-State: AOJu0YzvGxdY+HAM0KnbF6v5beB8UMqRR4/wmhuMvfAr+QUHtD885zqm
 Sm/ZTsh8sewoVLjVTcuOTIabILgK+VgItbFFZNEwNrV+3vK1eHTyvWnDdPMbJdWJVU16OKhhdeA
 Pdp6i
X-Google-Smtp-Source: AGHT+IHdiRO0nP3E7HZ/1gNnshXzSl6qB7lRl1YUAlWVGNlerBCdlDHrA5vqUtmJIT9zaJSWokAyNg==
X-Received: by 2002:a05:6512:224b:b0:513:57fe:97b7 with SMTP id
 i11-20020a056512224b00b0051357fe97b7mr1834716lfu.38.1709679204322; 
 Tue, 05 Mar 2024 14:53:24 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49]) by smtp.gmail.com with ESMTPSA id
 n25-20020a05651203f900b00512fdc798dfsm2345788lfq.267.2024.03.05.14.53.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 14:53:24 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-51328f2f198so931e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 14:53:24 -0800 (PST)
X-Received: by 2002:a05:6402:1c89:b0:566:e8fc:8f83 with SMTP id
 cy9-20020a0564021c8900b00566e8fc8f83mr212785edb.7.1709678815988; Tue, 05 Mar
 2024 14:46:55 -0800 (PST)
MIME-Version: 1.0
References: <20240301185346.10412-1-robdclark@gmail.com>
 <CAAfnVBnXCqCQjamnSC0SArrNykiSgjwNpMvrkmb7kTuufW-opg@mail.gmail.com>
 <CAF6AEGuvXAXgtDgVTL0Z80pbR4d-oUnwBf0uB1GRJkZHd=2ftQ@mail.gmail.com>
In-Reply-To: <CAF6AEGuvXAXgtDgVTL0Z80pbR4d-oUnwBf0uB1GRJkZHd=2ftQ@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Tue, 5 Mar 2024 14:46:43 -0800
X-Gmail-Original-Message-ID: <CAAfnVBmjJbj=TqhhSPsgYn+eseW_Ez8qLGg_-_+OD4uOvOL9JA@mail.gmail.com>
Message-ID: <CAAfnVBmjJbj=TqhhSPsgYn+eseW_Ez8qLGg_-_+OD4uOvOL9JA@mail.gmail.com>
Subject: Re: [RFC] drm/msm: Add GPU memory traces
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@chromium.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: multipart/alternative; boundary="0000000000008228c60612f19e02"
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

--0000000000008228c60612f19e02
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2024 at 6:04=E2=80=AFPM Rob Clark <robdclark@gmail.com> wrot=
e:

> On Mon, Mar 4, 2024 at 5:38=E2=80=AFPM Gurchetan Singh
> <gurchetansingh@chromium.org> wrote:
> >
> >
> >
> >
> > On Fri, Mar 1, 2024 at 10:54=E2=80=AFAM Rob Clark <robdclark@gmail.com>=
 wrote:
> >>
> >> From: Rob Clark <robdclark@chromium.org>
> >>
> >> Perfetto can use these traces to track global and per-process GPU memo=
ry
> >> usage.
> >>
> >> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >> ---
> >> I realized the tracepoint that perfetto uses to show GPU memory usage
> >> globally and per-process was already upstream, but with no users.
> >>
> >> This overlaps a bit with fdinfo, but ftrace is a lighter weight
> >> mechanism and fits better with perfetto (plus is already supported in
> >> trace_processor and perfetto UI, whereas something fdinfo based would
> >> require new code to be added in perfetto.
> >>
> >> We could probably do this more globally (ie. drm_gem_get/put_pages() a=
nd
> >> drm_gem_handle_create_tail()/drm_gem_object_release_handle() if folks
> >> prefer.  Not sure where that leaves the TTM drivers.
> >>
> >>  drivers/gpu/drm/msm/Kconfig   |  1 +
> >>  drivers/gpu/drm/msm/msm_drv.h |  5 +++++
> >>  drivers/gpu/drm/msm/msm_gem.c | 37 ++++++++++++++++++++++++++++++++++=
+
> >>  drivers/gpu/drm/msm/msm_gpu.h |  8 ++++++++
> >>  4 files changed, 51 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> >> index f202f26adab2..e4c912fcaf22 100644
> >> --- a/drivers/gpu/drm/msm/Kconfig
> >> +++ b/drivers/gpu/drm/msm/Kconfig
> >> @@ -33,6 +33,7 @@ config DRM_MSM
> >>         select PM_OPP
> >>         select NVMEM
> >>         select PM_GENERIC_DOMAINS
> >> +       select TRACE_GPU_MEM
> >>         help
> >>           DRM/KMS driver for MSM/snapdragon.
> >>
> >> diff --git a/drivers/gpu/drm/msm/msm_drv.h
> b/drivers/gpu/drm/msm/msm_drv.h
> >> index 16a7cbc0b7dd..cb8f7e804b5b 100644
> >> --- a/drivers/gpu/drm/msm/msm_drv.h
> >> +++ b/drivers/gpu/drm/msm/msm_drv.h
> >> @@ -137,6 +137,11 @@ struct msm_drm_private {
> >>         struct msm_rd_state *hangrd;   /* debugfs to dump hanging
> submits */
> >>         struct msm_perf_state *perf;
> >>
> >> +       /**
> >> +        * total_mem: Total/global amount of memory backing GEM object=
s.
> >> +        */
> >> +       atomic64_t total_mem;
> >> +
> >>         /**
> >>          * List of all GEM objects (mainly for debugfs, protected by
> obj_lock
> >>          * (acquire before per GEM object lock)
> >> diff --git a/drivers/gpu/drm/msm/msm_gem.c
> b/drivers/gpu/drm/msm/msm_gem.c
> >> index 175ee4ab8a6f..e04c4af5d154 100644
> >> --- a/drivers/gpu/drm/msm/msm_gem.c
> >> +++ b/drivers/gpu/drm/msm/msm_gem.c
> >> @@ -12,6 +12,9 @@
> >>  #include <linux/pfn_t.h>
> >>
> >>  #include <drm/drm_prime.h>
> >> +#include <drm/drm_file.h>
> >> +
> >> +#include <trace/events/gpu_mem.h>
> >>
> >>  #include "msm_drv.h"
> >>  #include "msm_fence.h"
> >> @@ -33,6 +36,34 @@ static bool use_pages(struct drm_gem_object *obj)
> >>         return !msm_obj->vram_node;
> >>  }
> >>
> >> +static void update_device_mem(struct msm_drm_private *priv, ssize_t
> size)
> >> +{
> >> +       uint64_t total_mem =3D atomic64_add_return(size,
> &priv->total_mem);
> >> +       trace_gpu_mem_total(0, 0, total_mem);
> >> +}
> >> +
> >> +static void update_ctx_mem(struct drm_file *file, ssize_t size)
> >> +{
> >> +       struct msm_file_private *ctx =3D file->driver_priv;
> >> +       uint64_t ctx_mem =3D atomic64_add_return(size, &ctx->ctx_mem);
> >> +
> >> +       rcu_read_lock(); /* Locks file->pid! */
> >> +       trace_gpu_mem_total(0, pid_nr(file->pid), ctx_mem);
> >> +       rcu_read_unlock();
> >> +
> >> +}
> >> +
> >> +static int msm_gem_open(struct drm_gem_object *obj, struct drm_file
> *file)
> >> +{
> >> +       update_ctx_mem(file, obj->size);
> >> +       return 0;
> >> +}
> >> +
> >> +static void msm_gem_close(struct drm_gem_object *obj, struct drm_file
> *file)
> >> +{
> >> +       update_ctx_mem(file, -obj->size);
> >> +}
> >> +
> >>  /*
> >>   * Cache sync.. this is a bit over-complicated, to fit dma-mapping
> >>   * API.  Really GPU cache is out of scope here (handled on cmdstream)
> >> @@ -156,6 +187,8 @@ static struct page **get_pages(struct
> drm_gem_object *obj)
> >>                         return p;
> >>                 }
> >>
> >> +               update_device_mem(dev->dev_private, obj->size);
> >> +
> >>                 msm_obj->pages =3D p;
> >>
> >>                 msm_obj->sgt =3D drm_prime_pages_to_sg(obj->dev, p,
> npages);
> >> @@ -209,6 +242,8 @@ static void put_pages(struct drm_gem_object *obj)
> >>                         msm_obj->sgt =3D NULL;
> >>                 }
> >>
> >> +               update_device_mem(obj->dev->dev_private, -obj->size);
> >> +
> >>                 if (use_pages(obj))
> >>                         drm_gem_put_pages(obj, msm_obj->pages, true,
> false);
> >>                 else
> >> @@ -1118,6 +1153,8 @@ static const struct vm_operations_struct vm_ops =
=3D
> {
> >>
> >>  static const struct drm_gem_object_funcs msm_gem_object_funcs =3D {
> >>         .free =3D msm_gem_free_object,
> >> +       .open =3D msm_gem_open,
> >> +       .close =3D msm_gem_close,
> >>         .pin =3D msm_gem_prime_pin,
> >>         .unpin =3D msm_gem_prime_unpin,
> >>         .get_sg_table =3D msm_gem_prime_get_sg_table,
> >> diff --git a/drivers/gpu/drm/msm/msm_gpu.h
> b/drivers/gpu/drm/msm/msm_gpu.h
> >> index 2bfcb222e353..f7d2a7d6f8cc 100644
> >> --- a/drivers/gpu/drm/msm/msm_gpu.h
> >> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> >> @@ -428,6 +428,14 @@ struct msm_file_private {
> >>          * level.
> >>          */
> >>         struct drm_sched_entity *entities[NR_SCHED_PRIORITIES *
> MSM_GPU_MAX_RINGS];
> >> +
> >> +       /**
> >> +        * ctx_mem:
> >> +        *
> >> +        * Total amount of memory of GEM buffers with handles attached
> for
> >> +        * this context.
> >> +        */
> >> +       atomic64_t ctx_mem;
> >>  };
> >
> >
> >
> > Just for added context, past discussions on TRACE_GPU_MEM:
> >
> >
> https://lists.freedesktop.org/archives/dri-devel/2021-October/328260.html
> >
> https://lists.freedesktop.org/archives/dri-devel/2021-January/295120.html
> >
> > Some have even suggested deleting the tracepoint altogether.
> >
> > Personally, I think we should land an internal user in a non-breaking
> way, since userspace (Perfetto) already depends on it.  Right now, we're =
in
> limbo for multiple years ...
>
> For better or for worse, the tracepoint already landed.. and tbh I
> don't see any real problem with it.  And it defn seems like a valid
> option to land support for in-driver and later refactor for more
> shared code.  We already have the uapi and the userspace consuming it,
> so doesn't seem like there is any debate there.  Maybe there is
> something from the original series that could be recycled for
> something less driver specific.
>

+1 for driver agnostic code in v2, if possible


>
> Re: some of the discussion about cgroups, I think that is a
> non-sequitur because (AFAICT) perfetto wants a global view of pids/etc
> (at least I'm not really sure what the value of system tracing is if
> it isn't, you know, system level.. I deliberately avoided using
> virtual-pid's for that reason)
>
> BR,
> -R
>
> >>
> >>  /**
> >> --
> >> 2.44.0
> >>
>

--0000000000008228c60612f19e02
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 4, 2024 at 6:04=E2=80=AFP=
M Rob Clark &lt;<a href=3D"mailto:robdclark@gmail.com">robdclark@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Mon, Mar 4, 2024 at 5:38=E2=80=AFPM Gurchetan Singh<br>
&lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=3D"_blank">gurche=
tansingh@chromium.org</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Fri, Mar 1, 2024 at 10:54=E2=80=AFAM Rob Clark &lt;<a href=3D"mailt=
o:robdclark@gmail.com" target=3D"_blank">robdclark@gmail.com</a>&gt; wrote:=
<br>
&gt;&gt;<br>
&gt;&gt; From: Rob Clark &lt;<a href=3D"mailto:robdclark@chromium.org" targ=
et=3D"_blank">robdclark@chromium.org</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Perfetto can use these traces to track global and per-process GPU =
memory<br>
&gt;&gt; usage.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Rob Clark &lt;<a href=3D"mailto:robdclark@chromium.=
org" target=3D"_blank">robdclark@chromium.org</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; I realized the tracepoint that perfetto uses to show GPU memory us=
age<br>
&gt;&gt; globally and per-process was already upstream, but with no users.<=
br>
&gt;&gt;<br>
&gt;&gt; This overlaps a bit with fdinfo, but ftrace is a lighter weight<br=
>
&gt;&gt; mechanism and fits better with perfetto (plus is already supported=
 in<br>
&gt;&gt; trace_processor and perfetto UI, whereas something fdinfo based wo=
uld<br>
&gt;&gt; require new code to be added in perfetto.<br>
&gt;&gt;<br>
&gt;&gt; We could probably do this more globally (ie. drm_gem_get/put_pages=
() and<br>
&gt;&gt; drm_gem_handle_create_tail()/drm_gem_object_release_handle() if fo=
lks<br>
&gt;&gt; prefer.=C2=A0 Not sure where that leaves the TTM drivers.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 drivers/gpu/drm/msm/Kconfig=C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;&gt;=C2=A0 drivers/gpu/drm/msm/msm_drv.h |=C2=A0 5 +++++<br>
&gt;&gt;=C2=A0 drivers/gpu/drm/msm/msm_gem.c | 37 +++++++++++++++++++++++++=
++++++++++<br>
&gt;&gt;=C2=A0 drivers/gpu/drm/msm/msm_gpu.h |=C2=A0 8 ++++++++<br>
&gt;&gt;=C2=A0 4 files changed, 51 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kco=
nfig<br>
&gt;&gt; index f202f26adab2..e4c912fcaf22 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/msm/Kconfig<br>
&gt;&gt; +++ b/drivers/gpu/drm/msm/Kconfig<br>
&gt;&gt; @@ -33,6 +33,7 @@ config DRM_MSM<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0select PM_OPP<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0select NVMEM<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0select PM_GENERIC_DOMAINS<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0select TRACE_GPU_MEM<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM/KMS driver for MSM/sna=
pdragon.<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/m=
sm_drv.h<br>
&gt;&gt; index 16a7cbc0b7dd..cb8f7e804b5b 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/msm/msm_drv.h<br>
&gt;&gt; +++ b/drivers/gpu/drm/msm/msm_drv.h<br>
&gt;&gt; @@ -137,6 +137,11 @@ struct msm_drm_private {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct msm_rd_state *hangrd;=C2=
=A0 =C2=A0/* debugfs to dump hanging submits */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct msm_perf_state *perf;<br>
&gt;&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * total_mem: Total/global amount of m=
emory backing GEM objects.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0atomic64_t total_mem;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * List of all GEM objects (mainl=
y for debugfs, protected by obj_lock<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * (acquire before per GEM object=
 lock)<br>
&gt;&gt; diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/m=
sm_gem.c<br>
&gt;&gt; index 175ee4ab8a6f..e04c4af5d154 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/msm/msm_gem.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/msm/msm_gem.c<br>
&gt;&gt; @@ -12,6 +12,9 @@<br>
&gt;&gt;=C2=A0 #include &lt;linux/pfn_t.h&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #include &lt;drm/drm_prime.h&gt;<br>
&gt;&gt; +#include &lt;drm/drm_file.h&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +#include &lt;trace/events/gpu_mem.h&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #include &quot;msm_drv.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;msm_fence.h&quot;<br>
&gt;&gt; @@ -33,6 +36,34 @@ static bool use_pages(struct drm_gem_object *ob=
j)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return !msm_obj-&gt;vram_node;<br=
>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; +static void update_device_mem(struct msm_drm_private *priv, ssize=
_t size)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t total_mem =3D atomic64_add_re=
turn(size, &amp;priv-&gt;total_mem);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gpu_mem_total(0, 0, total_mem);<=
br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void update_ctx_mem(struct drm_file *file, ssize_t size)<b=
r>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct msm_file_private *ctx =3D file-=
&gt;driver_priv;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t ctx_mem =3D atomic64_add_retu=
rn(size, &amp;ctx-&gt;ctx_mem);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_read_lock(); /* Locks file-&gt;pid=
! */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gpu_mem_total(0, pid_nr(file-&gt=
;pid), ctx_mem);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_read_unlock();<br>
&gt;&gt; +<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static int msm_gem_open(struct drm_gem_object *obj, struct drm_fi=
le *file)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0update_ctx_mem(file, obj-&gt;size);<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void msm_gem_close(struct drm_gem_object *obj, struct drm_=
file *file)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0update_ctx_mem(file, -obj-&gt;size);<b=
r>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 /*<br>
&gt;&gt;=C2=A0 =C2=A0* Cache sync.. this is a bit over-complicated, to fit =
dma-mapping<br>
&gt;&gt;=C2=A0 =C2=A0* API.=C2=A0 Really GPU cache is out of scope here (ha=
ndled on cmdstream)<br>
&gt;&gt; @@ -156,6 +187,8 @@ static struct page **get_pages(struct drm_gem_=
object *obj)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0return p;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0update_dev=
ice_mem(dev-&gt;dev_private, obj-&gt;size);<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msm_o=
bj-&gt;pages =3D p;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msm_o=
bj-&gt;sgt =3D drm_prime_pages_to_sg(obj-&gt;dev, p, npages);<br>
&gt;&gt; @@ -209,6 +242,8 @@ static void put_pages(struct drm_gem_object *o=
bj)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0msm_obj-&gt;sgt =3D NULL;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0update_dev=
ice_mem(obj-&gt;dev-&gt;dev_private, -obj-&gt;size);<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (u=
se_pages(obj))<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0drm_gem_put_pages(obj, msm_obj-&gt;pages, true, fal=
se);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<=
br>
&gt;&gt; @@ -1118,6 +1153,8 @@ static const struct vm_operations_struct vm_=
ops =3D {<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static const struct drm_gem_object_funcs msm_gem_object_func=
s =3D {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.free =3D msm_gem_free_object,<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.open =3D msm_gem_open,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.close =3D msm_gem_close,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pin =3D msm_gem_prime_pin,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.unpin =3D msm_gem_prime_unpin,<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.get_sg_table =3D msm_gem_prime_g=
et_sg_table,<br>
&gt;&gt; diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/m=
sm_gpu.h<br>
&gt;&gt; index 2bfcb222e353..f7d2a7d6f8cc 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/msm/msm_gpu.h<br>
&gt;&gt; +++ b/drivers/gpu/drm/msm/msm_gpu.h<br>
&gt;&gt; @@ -428,6 +428,14 @@ struct msm_file_private {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * level.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_sched_entity *entities=
[NR_SCHED_PRIORITIES * MSM_GPU_MAX_RINGS];<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * ctx_mem:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Total amount of memory of GEM buffe=
rs with handles attached for<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * this context.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0atomic64_t ctx_mem;<br>
&gt;&gt;=C2=A0 };<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Just for added context, past discussions on TRACE_GPU_MEM:<br>
&gt;<br>
&gt; <a href=3D"https://lists.freedesktop.org/archives/dri-devel/2021-Octob=
er/328260.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesk=
top.org/archives/dri-devel/2021-October/328260.html</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/archives/dri-devel/2021-Janua=
ry/295120.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesk=
top.org/archives/dri-devel/2021-January/295120.html</a><br>
&gt;<br>
&gt; Some have even suggested deleting the tracepoint altogether.<br>
&gt;<br>
&gt; Personally, I think we should land an internal user in a non-breaking =
way, since userspace (Perfetto) already depends on it.=C2=A0 Right now, we&=
#39;re in limbo for multiple years ...<br>
<br>
For better or for worse, the tracepoint already landed.. and tbh I<br>
don&#39;t see any real problem with it.=C2=A0 And it defn seems like a vali=
d<br>
option to land support for in-driver and later refactor for more<br>
shared code.=C2=A0 We already have the uapi and the userspace consuming it,=
<br>
so doesn&#39;t seem like there is any debate there.=C2=A0 Maybe there is<br=
>
something from the original series that could be recycled for<br>
something less driver specific.<br></blockquote><div><br></div><div>+1 for =
driver agnostic code in v2, if possible</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
Re: some of the discussion about cgroups, I think that is a<br>
non-sequitur because (AFAICT) perfetto wants a global view of pids/etc<br>
(at least I&#39;m not really sure what the value of system tracing is if<br=
>
it isn&#39;t, you know, system level.. I deliberately avoided using<br>
virtual-pid&#39;s for that reason)<br>
<br>
BR,<br>
-R<br>
<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 /**<br>
&gt;&gt; --<br>
&gt;&gt; 2.44.0<br>
&gt;&gt;<br>
</blockquote></div></div>

--0000000000008228c60612f19e02--
