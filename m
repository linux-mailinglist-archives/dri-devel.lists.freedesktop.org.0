Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168B1A0B345
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE4710E5F1;
	Mon, 13 Jan 2025 09:41:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Seb86oro";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D047110E5F1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736761318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PFMBrjAGeVMVFuPGPm8PBb8ny+/p1wDmSZqgJx/nkko=;
 b=Seb86orozIGDP3sp6s/D6/Zv/p3rNeASA9RL2rTJEaeNsJ7tq4/dtCOqjpVdz77fjpype0
 s+Jd5CNZysUUH+vm3+MNPACjAW0CuAT9r94EYD4QJwg1HyEJ3THpPAzU1lSwistXQXxkv1
 DLAK9F4En8JP8Y1tmN+H0MAcxdIv87o=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-eHk8DPxvNkKk9E5kG9XAyw-1; Mon, 13 Jan 2025 04:41:57 -0500
X-MC-Unique: eHk8DPxvNkKk9E5kG9XAyw-1
X-Mimecast-MFC-AGG-ID: eHk8DPxvNkKk9E5kG9XAyw
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-216430a88b0so78651435ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 01:41:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736761316; x=1737366116;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cXK3I3upV5E6bV+9jIVt+gOh1WhOo5z+eOBaqhjSmec=;
 b=k3D6aCJzgNUX9IG6d1L5wpyO6Hc3aM3yQNl4HkN3GNr0v/Cje4FnbnxpqwlATVGy8J
 hzdJHVzjsTqF1k0GLRkh/Ocy1HdcaDLTbq9EAJB5zzqbXclXRtKw7MzkCFEJUULA3pJF
 7lvZi/6iSW/JlblLKoc4FI7fhIQxv4WnSxyevS8Hi8TlziFMGNZguMTO19SMgCJqcs31
 VIw32oa6ts46VV70CgPxcP43H5QywxX8H/CKe1XZZGGSX2XoyowCmFDAUQQRLON8kFnJ
 cXqDgQKIKCHXZ7THcj7rlbOeL8xyRuUfoRHqkhveKqrks35keoyRUtJL4yKeBxJ1tV13
 s7Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMTWxbRBrhaiHw+mHb03qMglA0iOLL9ULZgrlDtJRHLS66V6uCqdSus8wLlnhSN1GAy9UxAUkdh+0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBnZXtMVQE3qcZzuUSa22XlwxkCfF7iGv0G/U9RZhFrmKfkoe7
 8IlOqFb13WsMhmYzo6/2zwieptl/BsdzTrEagP1K3L5hudm/oS4VQuYl14AbQqsyPHPIttFS2gm
 4jfvyLwv/H1Dm1eu/er+h3DXrjBXQ5W3t/gIKcCJ8J/YUrChm4qF2+K2ygfDRkDbAiA==
X-Gm-Gg: ASbGncuhFtyTc/Vw92f1qXiQyOF9H0P3svWrkyXuExQCESXmmqL4G7FzcrJ63FFIyrx
 LHNBgVA+aNQIHPLErogEtxL+U/WEaQwH8C5f9UGzDIAlMCUbhOUU/4xjROY8g2d2Q9U5B/luwdP
 bJiLJVcYvHQvcEAH8HH4VU4b0vusSqAymX7qUwzxHiZHLOOHJtCuIrvldPyxR2Pf9ADA34QVyoS
 48IIj/URZBNf5/2avkNbP3heFCNn+ymdpaL2yCdvwYjguo14q6GsL/+mB68YbovB2jxsyN/wk3a
 YKKf20o=
X-Received: by 2002:a17:902:e552:b0:216:2426:7666 with SMTP id
 d9443c01a7336-21a83f36f14mr320479855ad.12.1736761315991; 
 Mon, 13 Jan 2025 01:41:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYUfDL8N9Wven7gKojAo6rn49SagUJiQ8WFAQSjsCVi8b+XIakU8ljjfPstkcwnqxCgeLPLQ==
X-Received: by 2002:a17:902:e552:b0:216:2426:7666 with SMTP id
 d9443c01a7336-21a83f36f14mr320479615ad.12.1736761315664; 
 Mon, 13 Jan 2025 01:41:55 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f25498fsm49403935ad.234.2025.01.13.01.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 01:41:55 -0800 (PST)
Message-ID: <554f51297640bf731c4fee67825a9dd9a620f77f.camel@redhat.com>
Subject: Re: [PATCH] drm/sched: Delete unused update_job_credits
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@redhat.com>, Matthew
 Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, Boris
 Brezillon <boris.brezillon@collabora.com>, Matt Coster
 <matt.coster@imgtec.com>
Date: Mon, 13 Jan 2025 10:41:45 +0100
In-Reply-To: <20250110111301.76909-1-tvrtko.ursulin@igalia.com>
References: <20250110111301.76909-1-tvrtko.ursulin@igalia.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ep__bAdV1X5URixleM7PFf493Civ77HD2WY77FDB08U_1736761316
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

On Fri, 2025-01-10 at 11:13 +0000, Tvrtko Ursulin wrote:
> No driver is using the update_job_credits() schduler vfunc
> so lets remove it.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Acked-by: Boris Brezillon <boris.brezillon@collabora.com>
> Acked-by: Matt Coster <matt.coster@imgtec.com>

Applied to drm-misc-next

Thank you Tvrtko

P.

> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 13 -------------
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13 -------------
> =C2=A02 files changed, 26 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 57da84908752..81d69c2ff6ab 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -64,12 +64,6 @@
> =C2=A0 * credit limit, the job won't be executed. Instead, the scheduler
> will wait
> =C2=A0 * until the credit count has decreased enough to not overflow its
> credit limit.
> =C2=A0 * This implies waiting for previously executed jobs.
> - *
> - * Optionally, drivers may register a callback (update_job_credits)
> provided by
> - * struct drm_sched_backend_ops to update the job's credits
> dynamically. The
> - * scheduler executes this callback every time the scheduler
> considers a job for
> - * execution and subsequently checks whether the job fits the
> scheduler's credit
> - * limit.
> =C2=A0 */
> =C2=A0
> =C2=A0#include <linux/wait.h>
> @@ -133,13 +127,6 @@ static bool drm_sched_can_queue(struct
> drm_gpu_scheduler *sched,
> =C2=A0=09if (!s_job)
> =C2=A0=09=09return false;
> =C2=A0
> -=09if (sched->ops->update_job_credits) {
> -=09=09s_job->credits =3D sched->ops-
> >update_job_credits(s_job);
> -
> -=09=09drm_WARN(sched, !s_job->credits,
> -=09=09=09 "Jobs with zero credits bypass job-flow
> control.\n");
> -=09}
> -
> =C2=A0=09/* If a job exceeds the credit limit, truncate it to the
> credit limit
> =C2=A0=09 * itself to guarantee forward progress.
> =C2=A0=09 */
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index 95e17504e46a..e2e6af8849c6 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -476,19 +476,6 @@ struct drm_sched_backend_ops {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * and it's time to=
 clean it up.
> =C2=A0=09 */
> =C2=A0=09void (*free_job)(struct drm_sched_job *sched_job);
> -
> -=09/**
> -=09 * @update_job_credits: Called when the scheduler is
> considering this
> -=09 * job for execution.
> -=09 *
> -=09 * This callback returns the number of credits the job would
> take if
> -=09 * pushed to the hardware. Drivers may use this to
> dynamically update
> -=09 * the job's credit count. For instance, deduct the number
> of credits
> -=09 * for already signalled native fences.
> -=09 *
> -=09 * This callback is optional.
> -=09 */
> -=09u32 (*update_job_credits)(struct drm_sched_job *sched_job);
> =C2=A0};
> =C2=A0
> =C2=A0/**

