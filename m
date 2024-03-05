Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF1E871262
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 02:38:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2730810E1FE;
	Tue,  5 Mar 2024 01:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="TZ8G18sY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6310D10E1FE
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 01:38:45 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-51344bebe2fso1742552e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 17:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709602723; x=1710207523;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zgvI9txExzvuhQrt5TUYaH36k/0od6qMKO2/5FV/pHA=;
 b=TZ8G18sY7snXfkKXnc1Od9LVUpnmXyHDDc0phDZeZCHXOt4sq9/UQCN3zUOYToEAuv
 6PFbo5YZU8m5JAiX/w4+KotxUryJRnmmwAr7wYo+h4m/Rolp8MbN4kznRiucPEkpNpL5
 d5vksA3MAZppRBMlUYpBUaIMDCCmTXWTT8PEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709602723; x=1710207523;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zgvI9txExzvuhQrt5TUYaH36k/0od6qMKO2/5FV/pHA=;
 b=OzWMBSF/lDpPzSFwMoWU9ax8iguPpXjBilXXJPLlEUrcAaaxGVvXRcmPz5b75T1hlH
 Ax9OgO5DFH0RYCD4l28SQ0dD5Xja/+wpwM1MNkXw3xq12DOvOkeQ4F4wERXyof5mCvQh
 bBeELkurhCwQSbn38zxMIi/Iu2JtatePcLhHrCKrC6XlwvpMHL9E4FcXCV55mZu3swcW
 AKLN/Y9/PdtuXq3mhyIwehePMwtk88UMyoEP1CsWK2hwO/X+Sjl9jteMz9BLe3KeoH3H
 MS2CLpYXzCY7yvLyeXzcNT91NyqaI+aOyr6FPZy3k0QFAcLhud0NmOE8a+ufGLo1BVRI
 ZBzg==
X-Gm-Message-State: AOJu0YxCl/DAPvgThCcUYyVXp0wUyN4Q2ddYGWZSOq8U0InPja9+BXuj
 qsN2qXcQQj6fjZs1yx6Dx3a89PIJWyTjULHvBYuPupQPyCgRkXfGJfWex6sLKLTLhxfEUNSYCXm
 tWQ==
X-Google-Smtp-Source: AGHT+IG4BNFctq8EbC1PIFwvzHJnD9zKl2++t8u4Da3nhBGCZIn+dQaGVSs7gmKF8k/QcjWmF8Uq/g==
X-Received: by 2002:ac2:434b:0:b0:513:2be5:1fca with SMTP id
 o11-20020ac2434b000000b005132be51fcamr257694lfl.29.1709602722904; 
 Mon, 04 Mar 2024 17:38:42 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com.
 [209.85.208.45]) by smtp.gmail.com with ESMTPSA id
 m26-20020a17090607da00b00a441ff174a3sm5492560ejc.90.2024.03.04.17.38.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 17:38:42 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5654ef0c61fso6519a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 17:38:42 -0800 (PST)
X-Received: by 2002:a50:fb0d:0:b0:566:ff41:69f1 with SMTP id
 d13-20020a50fb0d000000b00566ff4169f1mr3695edq.3.1709602719348; Mon, 04 Mar
 2024 17:38:39 -0800 (PST)
MIME-Version: 1.0
References: <20240301185346.10412-1-robdclark@gmail.com>
In-Reply-To: <20240301185346.10412-1-robdclark@gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Mon, 4 Mar 2024 17:38:26 -0800
X-Gmail-Original-Message-ID: <CAAfnVBnXCqCQjamnSC0SArrNykiSgjwNpMvrkmb7kTuufW-opg@mail.gmail.com>
Message-ID: <CAAfnVBnXCqCQjamnSC0SArrNykiSgjwNpMvrkmb7kTuufW-opg@mail.gmail.com>
Subject: Re: [RFC] drm/msm: Add GPU memory traces
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@chromium.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: multipart/alternative; boundary="000000000000cb82430612dfe626"
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

--000000000000cb82430612dfe626
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 1, 2024 at 10:54=E2=80=AFAM Rob Clark <robdclark@gmail.com> wro=
te:

> From: Rob Clark <robdclark@chromium.org>
>
> Perfetto can use these traces to track global and per-process GPU memory
> usage.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> I realized the tracepoint that perfetto uses to show GPU memory usage
> globally and per-process was already upstream, but with no users.
>
> This overlaps a bit with fdinfo, but ftrace is a lighter weight
> mechanism and fits better with perfetto (plus is already supported in
> trace_processor and perfetto UI, whereas something fdinfo based would
> require new code to be added in perfetto.
>
> We could probably do this more globally (ie. drm_gem_get/put_pages() and
> drm_gem_handle_create_tail()/drm_gem_object_release_handle() if folks
> prefer.  Not sure where that leaves the TTM drivers.
>
>  drivers/gpu/drm/msm/Kconfig   |  1 +
>  drivers/gpu/drm/msm/msm_drv.h |  5 +++++
>  drivers/gpu/drm/msm/msm_gem.c | 37 +++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_gpu.h |  8 ++++++++
>  4 files changed, 51 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index f202f26adab2..e4c912fcaf22 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -33,6 +33,7 @@ config DRM_MSM
>         select PM_OPP
>         select NVMEM
>         select PM_GENERIC_DOMAINS
> +       select TRACE_GPU_MEM
>         help
>           DRM/KMS driver for MSM/snapdragon.
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.=
h
> index 16a7cbc0b7dd..cb8f7e804b5b 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -137,6 +137,11 @@ struct msm_drm_private {
>         struct msm_rd_state *hangrd;   /* debugfs to dump hanging submits
> */
>         struct msm_perf_state *perf;
>
> +       /**
> +        * total_mem: Total/global amount of memory backing GEM objects.
> +        */
> +       atomic64_t total_mem;
> +
>         /**
>          * List of all GEM objects (mainly for debugfs, protected by
> obj_lock
>          * (acquire before per GEM object lock)
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.=
c
> index 175ee4ab8a6f..e04c4af5d154 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -12,6 +12,9 @@
>  #include <linux/pfn_t.h>
>
>  #include <drm/drm_prime.h>
> +#include <drm/drm_file.h>
> +
> +#include <trace/events/gpu_mem.h>
>
>  #include "msm_drv.h"
>  #include "msm_fence.h"
> @@ -33,6 +36,34 @@ static bool use_pages(struct drm_gem_object *obj)
>         return !msm_obj->vram_node;
>  }
>
> +static void update_device_mem(struct msm_drm_private *priv, ssize_t size=
)
> +{
> +       uint64_t total_mem =3D atomic64_add_return(size, &priv->total_mem=
);
> +       trace_gpu_mem_total(0, 0, total_mem);
> +}
> +
> +static void update_ctx_mem(struct drm_file *file, ssize_t size)
> +{
> +       struct msm_file_private *ctx =3D file->driver_priv;
> +       uint64_t ctx_mem =3D atomic64_add_return(size, &ctx->ctx_mem);
> +
> +       rcu_read_lock(); /* Locks file->pid! */
> +       trace_gpu_mem_total(0, pid_nr(file->pid), ctx_mem);
> +       rcu_read_unlock();
> +
> +}
> +
> +static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *fil=
e)
> +{
> +       update_ctx_mem(file, obj->size);
> +       return 0;
> +}
> +
> +static void msm_gem_close(struct drm_gem_object *obj, struct drm_file
> *file)
> +{
> +       update_ctx_mem(file, -obj->size);
> +}
> +
>  /*
>   * Cache sync.. this is a bit over-complicated, to fit dma-mapping
>   * API.  Really GPU cache is out of scope here (handled on cmdstream)
> @@ -156,6 +187,8 @@ static struct page **get_pages(struct drm_gem_object
> *obj)
>                         return p;
>                 }
>
> +               update_device_mem(dev->dev_private, obj->size);
> +
>                 msm_obj->pages =3D p;
>
>                 msm_obj->sgt =3D drm_prime_pages_to_sg(obj->dev, p, npage=
s);
> @@ -209,6 +242,8 @@ static void put_pages(struct drm_gem_object *obj)
>                         msm_obj->sgt =3D NULL;
>                 }
>
> +               update_device_mem(obj->dev->dev_private, -obj->size);
> +
>                 if (use_pages(obj))
>                         drm_gem_put_pages(obj, msm_obj->pages, true,
> false);
>                 else
> @@ -1118,6 +1153,8 @@ static const struct vm_operations_struct vm_ops =3D=
 {
>
>  static const struct drm_gem_object_funcs msm_gem_object_funcs =3D {
>         .free =3D msm_gem_free_object,
> +       .open =3D msm_gem_open,
> +       .close =3D msm_gem_close,
>         .pin =3D msm_gem_prime_pin,
>         .unpin =3D msm_gem_prime_unpin,
>         .get_sg_table =3D msm_gem_prime_get_sg_table,
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.=
h
> index 2bfcb222e353..f7d2a7d6f8cc 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -428,6 +428,14 @@ struct msm_file_private {
>          * level.
>          */
>         struct drm_sched_entity *entities[NR_SCHED_PRIORITIES *
> MSM_GPU_MAX_RINGS];
> +
> +       /**
> +        * ctx_mem:
> +        *
> +        * Total amount of memory of GEM buffers with handles attached fo=
r
> +        * this context.
> +        */
> +       atomic64_t ctx_mem;
>  };
>


Just for added context, past discussions on TRACE_GPU_MEM:

https://lists.freedesktop.org/archives/dri-devel/2021-October/328260.html
https://lists.freedesktop.org/archives/dri-devel/2021-January/295120.html

Some have even suggested deleting the tracepoint altogether.

Personally, I think we should land an internal user in a non-breaking way,
since userspace (Perfetto) already depends on it.  Right now, we're in
limbo for multiple years ...


>  /**
> --
> 2.44.0
>
>

--000000000000cb82430612dfe626
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">=C2=A0</div><div dir=3D"ltr"><div dir=3D"=
ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Fri, Mar 1, 2024 at 10:54=E2=80=AFAM Rob Clark &lt;<a href=3D"m=
ailto:robdclark@gmail.com" target=3D"_blank">robdclark@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Rob C=
lark &lt;<a href=3D"mailto:robdclark@chromium.org" target=3D"_blank">robdcl=
ark@chromium.org</a>&gt;<br>
<br>
Perfetto can use these traces to track global and per-process GPU memory<br=
>
usage.<br>
<br>
Signed-off-by: Rob Clark &lt;<a href=3D"mailto:robdclark@chromium.org" targ=
et=3D"_blank">robdclark@chromium.org</a>&gt;<br>
---<br>
I realized the tracepoint that perfetto uses to show GPU memory usage<br>
globally and per-process was already upstream, but with no users.<br>
<br>
This overlaps a bit with fdinfo, but ftrace is a lighter weight<br>
mechanism and fits better with perfetto (plus is already supported in<br>
trace_processor and perfetto UI, whereas something fdinfo based would<br>
require new code to be added in perfetto.<br>
<br>
We could probably do this more globally (ie. drm_gem_get/put_pages() and<br=
>
drm_gem_handle_create_tail()/drm_gem_object_release_handle() if folks<br>
prefer.=C2=A0 Not sure where that leaves the TTM drivers.<br>
<br>
=C2=A0drivers/gpu/drm/msm/Kconfig=C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0drivers/gpu/drm/msm/msm_drv.h |=C2=A0 5 +++++<br>
=C2=A0drivers/gpu/drm/msm/msm_gem.c | 37 ++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0drivers/gpu/drm/msm/msm_gpu.h |=C2=A0 8 ++++++++<br>
=C2=A04 files changed, 51 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig<br>
index f202f26adab2..e4c912fcaf22 100644<br>
--- a/drivers/gpu/drm/msm/Kconfig<br>
+++ b/drivers/gpu/drm/msm/Kconfig<br>
@@ -33,6 +33,7 @@ config DRM_MSM<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select PM_OPP<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select NVMEM<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select PM_GENERIC_DOMAINS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select TRACE_GPU_MEM<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM/KMS driver for MSM/snapdragon.<br>
<br>
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h<=
br>
index 16a7cbc0b7dd..cb8f7e804b5b 100644<br>
--- a/drivers/gpu/drm/msm/msm_drv.h<br>
+++ b/drivers/gpu/drm/msm/msm_drv.h<br>
@@ -137,6 +137,11 @@ struct msm_drm_private {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct msm_rd_state *hangrd;=C2=A0 =C2=A0/* deb=
ugfs to dump hanging submits */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct msm_perf_state *perf;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * total_mem: Total/global amount of memory bac=
king GEM objects.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0atomic64_t total_mem;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /**<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* List of all GEM objects (mainly for deb=
ugfs, protected by obj_lock<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* (acquire before per GEM object lock)<br=
>
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c<=
br>
index 175ee4ab8a6f..e04c4af5d154 100644<br>
--- a/drivers/gpu/drm/msm/msm_gem.c<br>
+++ b/drivers/gpu/drm/msm/msm_gem.c<br>
@@ -12,6 +12,9 @@<br>
=C2=A0#include &lt;linux/pfn_t.h&gt;<br>
<br>
=C2=A0#include &lt;drm/drm_prime.h&gt;<br>
+#include &lt;drm/drm_file.h&gt;<br>
+<br>
+#include &lt;trace/events/gpu_mem.h&gt;<br>
<br>
=C2=A0#include &quot;msm_drv.h&quot;<br>
=C2=A0#include &quot;msm_fence.h&quot;<br>
@@ -33,6 +36,34 @@ static bool use_pages(struct drm_gem_object *obj)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return !msm_obj-&gt;vram_node;<br>
=C2=A0}<br>
<br>
+static void update_device_mem(struct msm_drm_private *priv, ssize_t size)<=
br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t total_mem =3D atomic64_add_return(size=
, &amp;priv-&gt;total_mem);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gpu_mem_total(0, 0, total_mem);<br>
+}<br>
+<br>
+static void update_ctx_mem(struct drm_file *file, ssize_t size)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct msm_file_private *ctx =3D file-&gt;drive=
r_priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t ctx_mem =3D atomic64_add_return(size, =
&amp;ctx-&gt;ctx_mem);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_read_lock(); /* Locks file-&gt;pid! */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0trace_gpu_mem_total(0, pid_nr(file-&gt;pid), ct=
x_mem);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_read_unlock();<br>
+<br>
+}<br>
+<br>
+static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *file)=
<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0update_ctx_mem(file, obj-&gt;size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *fil=
e)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0update_ctx_mem(file, -obj-&gt;size);<br>
+}<br>
+<br>
=C2=A0/*<br>
=C2=A0 * Cache sync.. this is a bit over-complicated, to fit dma-mapping<br=
>
=C2=A0 * API.=C2=A0 Really GPU cache is out of scope here (handled on cmdst=
ream)<br>
@@ -156,6 +187,8 @@ static struct page **get_pages(struct drm_gem_object *o=
bj)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return p;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0update_device_mem(d=
ev-&gt;dev_private, obj-&gt;size);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msm_obj-&gt;pages =
=3D p;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msm_obj-&gt;sgt =3D=
 drm_prime_pages_to_sg(obj-&gt;dev, p, npages);<br>
@@ -209,6 +242,8 @@ static void put_pages(struct drm_gem_object *obj)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 msm_obj-&gt;sgt =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0update_device_mem(o=
bj-&gt;dev-&gt;dev_private, -obj-&gt;size);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (use_pages(obj))=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 drm_gem_put_pages(obj, msm_obj-&gt;pages, true, false);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
@@ -1118,6 +1153,8 @@ static const struct vm_operations_struct vm_ops =3D {=
<br>
<br>
=C2=A0static const struct drm_gem_object_funcs msm_gem_object_funcs =3D {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .free =3D msm_gem_free_object,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.open =3D msm_gem_open,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.close =3D msm_gem_close,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .pin =3D msm_gem_prime_pin,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .unpin =3D msm_gem_prime_unpin,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .get_sg_table =3D msm_gem_prime_get_sg_table,<b=
r>
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h<=
br>
index 2bfcb222e353..f7d2a7d6f8cc 100644<br>
--- a/drivers/gpu/drm/msm/msm_gpu.h<br>
+++ b/drivers/gpu/drm/msm/msm_gpu.h<br>
@@ -428,6 +428,14 @@ struct msm_file_private {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* level.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_sched_entity *entities[NR_SCHED_PRIO=
RITIES * MSM_GPU_MAX_RINGS];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * ctx_mem:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Total amount of memory of GEM buffers with h=
andles attached for<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * this context.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0atomic64_t ctx_mem;<br>
=C2=A0};<br></blockquote><div><br></div><div><br></div><div>Just for added =
context, past discussions on TRACE_GPU_MEM:</div><div><br></div><div><a hre=
f=3D"https://lists.freedesktop.org/archives/dri-devel/2021-October/328260.h=
tml" target=3D"_blank">https://lists.freedesktop.org/archives/dri-devel/202=
1-October/328260.html</a><br></div><div><a href=3D"https://lists.freedeskto=
p.org/archives/dri-devel/2021-January/295120.html" target=3D"_blank">https:=
//lists.freedesktop.org/archives/dri-devel/2021-January/295120.html</a><br>=
</div><div><br></div><div>Some have even suggested deleting the tracepoint =
altogether.</div><div><br></div><div>Personally, I think we should land an =
internal user in a non-breaking way, since userspace (Perfetto) already dep=
ends on it.=C2=A0 Right now, we&#39;re in limbo for multiple years ...</div=
><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0/**<br>
-- <br>
2.44.0<br>
<br>
</blockquote></div></div>
</div>

--000000000000cb82430612dfe626--
