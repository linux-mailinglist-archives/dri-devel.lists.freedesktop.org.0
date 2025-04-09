Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4FAA81ECA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 09:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DAD10E7F9;
	Wed,  9 Apr 2025 07:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="oapt9Cf9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9866D10E7F9
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 07:56:40 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ZXZyr3PWGz9tf4;
 Wed,  9 Apr 2025 09:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1744185396; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VrljKVwSZ3MDHWdjjqcf++qCVK+JgGOxLMFKjWgB/zo=;
 b=oapt9Cf9L6EnX8weOTARB+NMcj0KVOxfRVOviWznCXtjDGcqCy4U5SXnprJr768lMpxE7v
 ZZhUfi1b797DWqfb6I5ZggGPpIXF+KC3jGYcJz8MqZV1OirsjjQPukp6dU5py+q7ORYRAs
 bmy0ZFYg/v5q8mMZtQKwVkUe/xjFUPmQybijeooiReYkJUzIdi/81CbBbZo2B0+12QYaW5
 esIEkcnwlTIVC6b2dTn9QTl8zJ6kUkKizxTjM7gVJwJ7DFwACkPn7gWjjWUbGBL2VFXLbN
 nCu/a4+PUvyY5O7suS8w2HWnm1RTiSb6+WB9orD4d+1ijW+KXD0dfVnvqoaTFw==
Message-ID: <7103bc5d3212aa5068fbc6a39a53fae04b36e467.camel@mailbox.org>
Subject: Re: [PATCH v8 06/10] drm/sched: add the drm_client_id to the
 drm_sched_run/exec_job events
From: Philipp Stanner <phasta@mailbox.org>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,  Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 09 Apr 2025 09:56:30 +0200
In-Reply-To: <20250320095818.40622-7-pierre-eric.pelloux-prayer@amd.com>
References: <20250320095818.40622-1-pierre-eric.pelloux-prayer@amd.com>
 <20250320095818.40622-7-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: d1eek3cyjytudogmii34r667zdqck51i
X-MBO-RS-ID: f8f0491b7b8e6f89c84
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2025-03-20 at 10:58 +0100, Pierre-Eric Pelloux-Prayer wrote:
> For processes with multiple drm_file instances, the drm_client_id is
> the only way to map jobs back to their unique owner.
>=20
> It's even more useful if drm client_name is set, because now a tool
> can map jobs to the client name instead of only having access to
> the process name.
>=20
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Pierre-Eric Pelloux-Prayer

Acked-by: Philipp Stanner <phasta@kernel.org>

> <pierre-eric.pelloux-prayer@amd.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/gpu_scheduler_trace.h | 6 ++++--
> =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index 5d9992ad47d3..38cdd659a286 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -43,6 +43,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __string(dev, dev_name(sched_job-
> >sched->dev))
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u64, fence_context)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u64, fence_seqno)
> +			=C2=A0=C2=A0=C2=A0=C2=A0 __field(u64, client_id)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 ),
> =C2=A0
> =C2=A0	=C2=A0=C2=A0=C2=A0 TP_fast_assign(
> @@ -54,11 +55,12 @@ DECLARE_EVENT_CLASS(drm_sched_job,
> =C2=A0			=C2=A0=C2=A0 __assign_str(dev);
> =C2=A0			=C2=A0=C2=A0 __entry->fence_context =3D sched_job-
> >s_fence->finished.context;
> =C2=A0			=C2=A0=C2=A0 __entry->fence_seqno =3D sched_job-
> >s_fence->finished.seqno;
> +			=C2=A0=C2=A0 __entry->client_id =3D sched_job->s_fence-
> >drm_client_id;
> =C2=A0			=C2=A0=C2=A0 ),
> -	=C2=A0=C2=A0=C2=A0 TP_printk("dev=3D%s, id=3D%llu, fence=3D%llu:%llu, r=
ing=3D%s,
> job count:%u, hw job count:%d",
> +	=C2=A0=C2=A0=C2=A0 TP_printk("dev=3D%s, id=3D%llu, fence=3D%llu:%llu, r=
ing=3D%s,
> job count:%u, hw job count:%d, client_id:%llu",
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __get_str(dev), __entry->id,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->fence_context, __entry->f=
ence_seqno,
> __get_str(name),
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->job_count, __entry->hw_job_cou=
nt)
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __entry->job_count, __entry->hw_job_cou=
nt,
> __entry->client_id)
> =C2=A0);
> =C2=A0
> =C2=A0DEFINE_EVENT(drm_sched_job, drm_sched_job,

