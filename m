Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4819CEEEB
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 16:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1CD10E887;
	Fri, 15 Nov 2024 15:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OrEmEL2C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE6A10E887
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 15:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731684132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BRYo29qDQXv6kNwRL7Kexv0d1Fhk7zgyX97u0llb/cU=;
 b=OrEmEL2C1VPnYj86AEiL7Flb6wn3Se8ne1LytgLiITeqtsleVsU0sjafn8jCvFL+AZXFPf
 98jZNcOUhdSmGex/sJcSSP7gUcgksy+kWxsd4y5JW5wT2W5zfcboAyvEt42MbGSOOdVg6x
 0qkXwjCJrsMA6s3uA7imeKUGLmLf89M=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-bvYSVxaaOe64sQXZG1GOhg-1; Fri, 15 Nov 2024 10:22:09 -0500
X-MC-Unique: bvYSVxaaOe64sQXZG1GOhg-1
X-Mimecast-MFC-AGG-ID: bvYSVxaaOe64sQXZG1GOhg
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-539f7abe2e6so1580337e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 07:22:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731684127; x=1732288927;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BRYo29qDQXv6kNwRL7Kexv0d1Fhk7zgyX97u0llb/cU=;
 b=aEfAAozkxBuvgLIEjU3JQNDU2ZcI4Zlyuh2ft3K8NruwMp2l2mcU5mLzvgfBvsQeAn
 uHKD02IUFin0QumzTO+CisrSJeSpxldj8M4WzJ7yRl1Uc6UjNnZhroxpF7vE8Sw5Gak4
 qOqa9kCKrtAjoExSEX/RNTw4TVcUbNphTY+ZZMk5x9te0RFOhS8YX/NrFKYH+7Adn4YC
 g+nLOzh7kWLmpLBgkHml6KDBRq4uCJTcnkEnEomNkrGLN0nSZ7aY4Ie7axjJdVlqBDPK
 JM0pSpndiVj07WHw6SBEEk4Q7ZMZp5eSLOz5pCtjAoYrZkJuKZzQRJMpoCRb6gStkpK2
 PmRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxAtEjsFGBtBErH6BFl1vUzy0/5XDy0JNv4lTB/N60rtxomD1f8e6opU5oJ9AfIYj8K8hO3tLk8bk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGbJXhVKT4sPwmLXLDcy3rTq1xDGT/XoRKJ2WGEYBNNAS9gVAj
 EVmS0OdVSye/gy4UY+cvGIRXWjVDURBP9mh6olw8qCkA7MNipIIZAKhvZTgX4M5sBu4V3XWNI5V
 yOfB1mEg8Agx4TdAZOOYY3euEdSro9pmcEjWaxtvfOeniXvCB8z8Ovo0xk7TQuKVgng==
X-Received: by 2002:a05:6512:2383:b0:53d:a899:7899 with SMTP id
 2adb3069b0e04-53dab2a618fmr1447281e87.24.1731684127478; 
 Fri, 15 Nov 2024 07:22:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7dqcmSs/iLMPksGHXzhE6qYJjfP5RUrVszDnk4DlKYZVVCPS+2tp13MdcvOk2CvSjkZtHVA==
X-Received: by 2002:a05:6512:2383:b0:53d:a899:7899 with SMTP id
 2adb3069b0e04-53dab2a618fmr1447258e87.24.1731684126941; 
 Fri, 15 Nov 2024 07:22:06 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da265ca8sm60205905e9.14.2024.11.15.07.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 07:22:06 -0800 (PST)
Message-ID: <ccfe75a8785c7f5764169533a5b1eac801be8443.camel@redhat.com>
Subject: Re: [PATCH v6 7/7] drm/doc: document some tracepoints as uAPI
From: Philipp Stanner <pstanner@redhat.com>
To: Lucas Stach <l.stach@pengutronix.de>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>, alexander.deucher@amd.com, 
 christian.koenig@amd.com, ltuikov89@gmail.com, matthew.brost@intel.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 ville.syrjala@linux.intel.com, rostedt@goodmis.org, matt.coster@imgtec.com,
 frank.binns@imgtec.com, yuq825@gmail.com, robdclark@gmail.com,
 kherbst@redhat.com,  lyude@redhat.com, boris.brezillon@collabora.com,
 steven.price@arm.com,  mwen@igalia.com, mcanal@igalia.com,
 thomas.hellstrom@linux.intel.com,  tvrtko.ursulin@igalia.com
Date: Fri, 15 Nov 2024 16:22:05 +0100
In-Reply-To: <37f5814a6f3b5539b01f1137740eb132c3f88500.camel@pengutronix.de>
References: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
 <20241114100113.150647-8-pierre-eric.pelloux-prayer@amd.com>
 <37f5814a6f3b5539b01f1137740eb132c3f88500.camel@pengutronix.de>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p4poSZfJrR27_6z799ENHp-VjfDXOnsw8mUUD1X6J_o_1731684128
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, 2024-11-14 at 12:30 +0100, Lucas Stach wrote:
> Hi,
>=20
> Am Donnerstag, dem 14.11.2024 um 11:01 +0100 schrieb Pierre-Eric
> Pelloux-Prayer:
> > This commit adds a document section in drm-uapi.rst about
> > tracepoints,
> > and mark the events gpu_scheduler_trace.h as stable uAPI.
> >=20
> > The goal is to explicitly state that tools can rely on the fields,
> > formats and semantics of these events.
> >=20
> > Acked-by: Lucas Stach <l.stach@pengutronix.de>
> > Acked-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> > Signed-off-by: Pierre-Eric Pelloux-Prayer
> > <pierre-eric.pelloux-prayer@amd.com>
> > ---
> > =C2=A0Documentation/gpu/drm-uapi.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 19
> > ++++++++++++++++
> > =C2=A0.../gpu/drm/scheduler/gpu_scheduler_trace.h=C2=A0=C2=A0 | 22
> > +++++++++++++++++++
> > =C2=A02 files changed, 41 insertions(+)
> >=20
> > diff --git a/Documentation/gpu/drm-uapi.rst
> > b/Documentation/gpu/drm-uapi.rst
> > index b75cc9a70d1f..9603ac0f4c09 100644
> > --- a/Documentation/gpu/drm-uapi.rst
> > +++ b/Documentation/gpu/drm-uapi.rst
> > @@ -583,3 +583,22 @@ dma-buf interoperability
> > =C2=A0
> > =C2=A0Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst
> > for
> > =C2=A0information on how dma-buf is integrated and exposed within DRM.
> > +
> > +
> > +Trace events
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +See Documentation/trace/tracepoints.rst for information about
> > using
> > +Linux Kernel Tracepoints.
> > +In the DRM subsystem, some events are considered stable uAPI to
> > avoid
> > +breaking tools (e.g.: GPUVis, umr) relying on them. Stable means
> > that fields
> > +cannot be removed, nor their formatting updated. Adding new fields
> > is
> > +possible, under the normal uAPI requirements.
> > +
> > +Stable uAPI events
> > +------------------
> > +
> > +From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
> > +
> > +.. kernel-doc::=C2=A0 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> > +=C2=A0=C2=A0 :doc: uAPI trace events
> > \ No newline at end of file
> > diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> > b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> > index 8340c7c0c6b6..ec230e558961 100644
> > --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> > +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> > @@ -33,6 +33,28 @@
> > =C2=A0#define TRACE_SYSTEM gpu_scheduler
> > =C2=A0#define TRACE_INCLUDE_FILE gpu_scheduler_trace
> > =C2=A0
> > +
> > +/**
> > + * DOC: uAPI trace events
> > + *
> > + * ``drm_sched_job``, ``drm_run_job``, ``drm_sched_process_job``,
> > + * and ``drm_sched_job_wait_dep`` are considered stable uAPI.
> > + *
> > + * Common trace events attributes:
> > + *
> > + * * ``id``=C2=A0=C2=A0=C2=A0 - this is &drm_sched_job->id. It uniquel=
y idenfies
> > a job
> > + *=C2=A0=C2=A0 inside a &struct drm_gpu_scheduler.
> > + *
> > + * * ``dev``=C2=A0=C2=A0 - the dev_name() of the device running the jo=
b.
> > + *
> > + * * ``ring``=C2=A0 - the hardware ring running the job. Together with
> > ``dev`` it
> > + *=C2=A0=C2=A0 uniquely identifies where the job is going to be execut=
ed.
> > + *
> It might be nitpicky, but as we change the format of the tracepoints
> anyway and are about to declare them a ABI: I don't really like the
> ring name. Yes, in most hardware implementations today the mechanism
> to
> queue jobs is a ring buffer, but there are other mechanisms to
> schedule
> jobs (see for example the lima driver). Maybe we could rename this to
> something a bit more generic like "dev_queue" or something like that?

While it might be true that the term isn't optimal or even formally
correct, it is the term which is used everywhere, including
presentations at conferences such as XDC and Plumbers.

So I think the price we'd pay for breaking consistency with the
established term would be higher than the gained formal correctness.

Greetings,
P.


>=20
> Regards,
> Lucas
>=20
> > + * * ``fence`` - the &dma_fence.context and the &dma_fence.seqno
> > of
> > + *=C2=A0=C2=A0 &drm_sched_fence.finished
> > + *
> > + */
> > +
> > =C2=A0#ifndef __TRACE_EVENT_GPU_SCHEDULER_PRINT_FN
> > =C2=A0#define __TRACE_EVENT_GPU_SCHEDULER_PRINT_FN
> > =C2=A0/* Similar to trace_print_array_seq but for fences. */
>=20

