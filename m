Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCB4B1B1DA
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 12:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1543D10E484;
	Tue,  5 Aug 2025 10:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZhzeNrbU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E076710E484
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 10:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754389360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qn+jlN++srh6PImM8MIK71xDNMfsNt/qa/hjAxwJpRQ=;
 b=ZhzeNrbUyfXwmq5WDAKwBwDmCEqGJS0p7BMt5Tdu+XxUOIRWorjfvucj4sFjoGa5H9vwn3
 UKpCv9+3zVmmP7JYiASA1f9Zju83YuY8kdC51oPO01tE6sF2mr26yTHiL2pt7btIyjTQQo
 it/k4hMAJjVzRf+3pLQEFul1tOEq4rU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-tilGe1JOPIKSOdGWbAID1A-1; Tue, 05 Aug 2025 06:22:37 -0400
X-MC-Unique: tilGe1JOPIKSOdGWbAID1A-1
X-Mimecast-MFC-AGG-ID: tilGe1JOPIKSOdGWbAID1A_1754389356
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-61598e5e8a6so4792283a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 03:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754389356; x=1754994156;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hxwtnm/6FWirXaVh9W/3hXWhtlUN58tGvHC41ZQtmVY=;
 b=egu7cZO+rgobwPJUFlclxP2l02/5Mb5ts6dGwBOIY/T73r8HTnF7wioyCIfzjglE0H
 IXNTxRkvdo8iX5I86SB/pmClzJbyQD92CS/hzHnhWuUXujZ4qCNH3JdJqeYtTOUdzp0F
 9vSLQh1kBqbzeVDhIUp/2UkTDOl0UtN1eV6eXWs0Kz5t6XcYCuNtSKi8MQN9UqETepBU
 Fvy59DHiGG8RveAnK/A4mr0Pxnf+JG5Cczy0Vt6STZ9DlCYcUqASTsc3Q1JDpTDoQyg8
 sJ3T/zsgKfx6hUfVs0pb6OUJwvjYDvxnyzctNawjokEeuZwyM/GvXD+uNOVkjlTTN9mH
 BsOg==
X-Gm-Message-State: AOJu0YzMcDlpaKEWiUAimpXY64DxiPCJa8qnBBKxiLEmEWp3xBilSGY6
 wR4wWUUjDcEKRBHQV6tiNvokraZQQu00GdbsOtZnYa1QvdR9ZQQdMVExxaCw1TUaizy4qsfxnvh
 c8rah0xoGTpxqUnUgB8snM3Li+XnB6BzIQbaJsHOzRd9A7BnYNDGTd9ueNSfjISvjos6zOA==
X-Gm-Gg: ASbGncvm+eflKMQo0g1O+YWWfIXzELJ62yib3Sy7Ka5naYcwpPaWabNgq6ifFLh6vYy
 i6CDq4VsXVplnUFKj0DTjjigm9m0Q1f6gg5zpjza8Bk65xJX7uBERrd/BThLr/WOp60vXaeirep
 JH6eFKvCSCmiYJyRuQEZs/udnNI957dJCreuPNHOaTTCQZfvUME/nQnEetWQCYxOsgx38w0/4Ya
 GV/FNoa43L8Zuz15XgxsGCQG+9ntJ9IRVPvQHvXLZhrpjqh+Pi5ICWFwaBDWZhR6GXzrrhvufU/
 8hDEWtOQS3M8zVVS3OiFjtPFqLsmbbHdiA0EZG056N0TQmgXz4rCIOlcwqcrfT1umGX1CNMdple
 pDwsk9A519lg=
X-Received: by 2002:a05:6402:518d:b0:615:a2d9:61f4 with SMTP id
 4fb4d7f45d1cf-615e6ef6947mr12269574a12.15.1754389356124; 
 Tue, 05 Aug 2025 03:22:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOrBfn1c849N18l/tb+xnqIlivd4zM8l2Mm8o9RS5bGcm/HnwY352Hs9YE32I/17KvLQMEjw==
X-Received: by 2002:a05:6402:518d:b0:615:a2d9:61f4 with SMTP id
 4fb4d7f45d1cf-615e6ef6947mr12269544a12.15.1754389355639; 
 Tue, 05 Aug 2025 03:22:35 -0700 (PDT)
Received: from ?IPv6:2001:16b8:3d90:a700:522d:5615:dfb:4451?
 ([2001:16b8:3d90:a700:522d:5615:dfb:4451])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f00066sm8016265a12.7.2025.08.05.03.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 03:22:35 -0700 (PDT)
Message-ID: <c1f7c4adaa0ac8d1994046436da8eb64bba5e06e.camel@redhat.com>
Subject: Re: [PATCH] drm/sched: Extend and update documentation
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Stanner <phasta@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, Matthew
 Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Tue, 05 Aug 2025 12:22:33 +0200
In-Reply-To: <5fb872d0-9b0a-4398-9472-eea3fdf61940@amd.com>
References: <20250724140121.70873-2-phasta@kernel.org>
 <f064a8c305bd2f2c0684251d3cd2470699c28d5e.camel@redhat.com>
 <5fb872d0-9b0a-4398-9472-eea3fdf61940@amd.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G1Lh0ygUXAA5Cr2EWrnOoZyWuvg0OHV_wQ7Xl6x0oc0_1754389356
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

On Tue, 2025-08-05 at 11:05 +0200, Christian K=C3=B6nig wrote:
> On 24.07.25 17:07, Philipp Stanner wrote:
> > > +/**
> > > + * DOC: Scheduler Fence Object
> > > + *
> > > + * The scheduler fence object (&struct drm_sched_fence) encapsulates=
 the whole
> > > + * time from pushing the job into the scheduler until the hardware h=
as finished
> > > + * processing it. It is managed by the scheduler. The implementation=
 provides
> > > + * dma_fence interfaces for signaling both scheduling of a command s=
ubmission
> > > + * as well as finishing of processing.
> > > + *
> > > + * The lifetime of this object also follows normal dma_fence refcoun=
ting rules.
> > > + */
> >=20
> > The relict I'm most unsure about is this docu for the scheduler fence.
> > I know that some drivers are accessing the s_fence, but I strongly
> > suspect that this is a) unncessary and b) dangerous.
>=20
> Which s_fence member do you mean? The one in the job? That should be harm=
less as far as I can see.

I'm talking about struct drm_sched_fence.

>=20
> > But the original draft from Christian hinted at that. So, @Christian,
> > this would be an opportunity to discuss this matter.
> >=20
> > Otherwise I'd drop this docu section in v2. What users don't know, they
> > cannot misuse.
>=20
> I would rather like to keep that to avoid misusing the job as the object =
for tracking the submission lifetime.

Why would a driver ever want to access struct drm_sched_fence? The
driver knows when it signaled the hardware fence, and it knows when its
callbacks run_job() and free_job() were invoked.

I'm open to learn what amdgpu does there and why.

>=20
> > > +/**
> > > + * DOC: Error and Timeout handling
> > > + *
> > > + * Errors are signaled by using dma_fence_set_error() on the hardwar=
e fence
> > > + * object before signaling it with dma_fence_signal(). Errors are th=
en bubbled
> > > + * up from the hardware fence to the scheduler fence.
> > > + *
> > > + * The entity allows querying errors on the last run submission usin=
g the
> > > + * drm_sched_entity_error() function which can be used to cancel que=
ued
> > > + * submissions in &struct drm_sched_backend_ops.run_job as well as p=
reventing
> > > + * pushing further ones into the entity in the driver's submission f=
unction.
> > > + *
> > > + * When the hardware fence doesn't signal within a configurable amou=
nt of time
> > > + * &struct drm_sched_backend_ops.timedout_job gets invoked. The driv=
er should
> > > + * then follow the procedure described in that callback's documentat=
ion.
> > > + *
> > > + * (TODO: The timeout handler should probably switch to using the ha=
rdware
> > > + * fence as parameter instead of the job. Otherwise the handling wil=
l always
> > > + * race between timing out and signaling the fence).
> >=20
> > This TODO can probably removed, too. The recently merged
> > DRM_GPU_SCHED_STAT_NO_HANG has solved this issue.
>=20
> No, it only scratched on the surface of problems here.
>=20
> I'm seriously considering sending a RFC patch to cleanup the job lifetime=
 and implementing this change.
>=20
> Not necessarily giving the HW fence as parameter to the timeout callback,=
 but more generally not letting the scheduler depend on driver behavior.

That's rather vague. Regarding this TODO, "racing between timing out
and signaling the fence" can now be corrected by the driver. Are there
more issues? If so, we want to add a new FIXME for them.

That said, such an RFC would obviously be great. We can discuss the
paragraph above there, if you want.


Regards
P.

>=20
> Regards,
> Christian.
>=20
> >=20
> >=20
> > P.
> >=20
> > > + *
> > > + * The scheduler also used to provided functionality for re-submitti=
ng jobs
> > > + * and, thereby, replaced the hardware fence during reset handling. =
This
> > > + * functionality is now deprecated. This has proven to be fundamenta=
lly racy
> > > + * and not compatible with dma_fence rules and shouldn't be used in =
new code.
> > > + *
> > > + * Additionally, there is the function drm_sched_increase_karma() wh=
ich tries
> > > + * to find the entity which submitted a job and increases its 'karma=
' atomic
> > > + * variable to prevent resubmitting jobs from this entity. This has =
quite some
> > > + * overhead and resubmitting jobs is now marked as deprecated. Thus,=
 using this
> > > + * function is discouraged.
> > > + *
> > > + * Drivers can still recreate the GPU state in case it should be los=
t during
> > > + * timeout handling *if* they can guarantee that forward progress wi=
ll be made
> > > + * and this doesn't cause another timeout. But this is strongly hard=
ware
> > > + * specific and out of the scope of the general GPU scheduler.
> > > + */
> > > =C2=A0#include <linux/export.h>
> > > =C2=A0#include <linux/wait.h>
> > > =C2=A0#include <linux/sched.h>
> > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.=
h
> > > index 323a505e6e6a..0f0687b7ae9c 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -458,8 +458,8 @@ struct drm_sched_backend_ops {
> > > =C2=A0=09struct dma_fence *(*run_job)(struct drm_sched_job *sched_job=
);
> > > =C2=A0
> > > =C2=A0=09/**
> > > -=09 * @timedout_job: Called when a job has taken too long to execute=
,
> > > -=09 * to trigger GPU recovery.
> > > +=09 * @timedout_job: Called when a hardware fence didn't signal with=
in a
> > > +=09 * configurable amount of time. Triggers GPU recovery.
> > > =C2=A0=09 *
> > > =C2=A0=09 * @sched_job: The job that has timed out
> > > =C2=A0=09 *
> > > @@ -506,7 +506,6 @@ struct drm_sched_backend_ops {
> > > =C2=A0=09 * that timeout handlers are executed sequentially.
> > > =C2=A0=09 *
> > > =C2=A0=09 * Return: The scheduler's status, defined by &enum drm_gpu_=
sched_stat
> > > -=09 *
> > > =C2=A0=09 */
> > > =C2=A0=09enum drm_gpu_sched_stat (*timedout_job)(struct drm_sched_job=
 *sched_job);
> > > =C2=A0
> >=20
>=20

