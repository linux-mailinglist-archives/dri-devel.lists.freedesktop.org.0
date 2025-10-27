Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC37AC0D170
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 12:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A6010E457;
	Mon, 27 Oct 2025 11:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RiwWMFrt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ABD510E450
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 11:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761563642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WRLalohHy3rCCuGjzo0HJo/EkbqNms9MJsxQtpyysMc=;
 b=RiwWMFrt2NMpdLQkVR+EXcoFfv/SN9FyX6lA6WHwIZt3T/Khuv3FIBhrr2aX2RvL5a8Ndr
 E0c69thP01kW9ppGFsaC1Xi7rirDT8OKVIJVYHBK30Ili/v3sn/IIVnu99sibMfj9YiZda
 aLXjtKLv69REJXvRDzNuRncUvHg4OCI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-uhRbvrZwPqWr1_hKRQv7YA-1; Mon, 27 Oct 2025 07:14:01 -0400
X-MC-Unique: uhRbvrZwPqWr1_hKRQv7YA-1
X-Mimecast-MFC-AGG-ID: uhRbvrZwPqWr1_hKRQv7YA_1761563640
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-b479e43ad46so313003666b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 04:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563640; x=1762168440;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ED6aJ6VtNbe3dTLwkfXNyk6CAnAGzuoKM+uc6M/7ELA=;
 b=RXxf40hH9+dioEoHCWNtqfulVfgS23Euv/0KPsYwsMY34DJU0aHB+mFukfuAnVaYhm
 K1mZ0gzg3oXXhWoRpe3sWWmFT1DcsUy6sa++6xp4hFK0RfwN7UE5lg5RdXIvgNRvs/Bt
 LShrUpdoov/TUUoWJKI7YkKezqGglsuhf9C2beLemCmeyZ1WO0HUyLzfhSngT+kEef9S
 TrXGh+M8O+HDtDPF124mksPAatJFBxoswbaksFcgheo+EvXaKA3j2N62EZfOmVPvTVLP
 QBEssIeFUI5sP+CVZ8oRfDDhw1xLN7irs738ExyLSS/ITFBHBH149jbqNy3lPGAf8kqe
 aTsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoU20LO39Nz+PBkkViyD29jGeUi2aCY0h+y5kWwHotBeIR5e39jGJtYy4R4JJTmsj7GOfw0YFouxI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKW/S+lk+0saiXfvIZrbbGEsWtGWxi3/tgez3JzexEcXSatgLm
 Fhx3fwZyfcJw6u6j5fTa0cF30h2xJeQ9iYByAJBpmUJTodsjYj2pptjkp9Pm5qOZZQMvL7S/Lx4
 NRawSgL1a4/tlgedyH2ZwAhOePPTk8C2HAwGvImJpHY/eqV7X9ut8veFvgTzuLU4PTJU0ow==
X-Gm-Gg: ASbGncvpHuZZeB2RGqLuEeF1vTnFh50UQQjMBmqKrHl5E1C1CMklFWngr95JCIB6l99
 89UQX96iAhBJUF7/NmKHiQUVT3Dgj2TTy5RVNISyPzIcaOKngX20AuoxW3fXAFY6H21AHBCvuIj
 XyPb+rS8eggMj4l37wgXtEXDTjP88Syc+Y1rzgarHxJ3RODhruRYJWbY99usC8hQ7FL7Xevb0Uc
 PcIJwxvRty+l7X1mbCVFYAuqtOTTqDBgPbc94EzHQ5Yl0GL2OEB3SvUJHvvOM8ETMyRlJM7H2Or
 Oahb596skmyfD/LUCszJj1IC6UsEsi1fjTgCVXoG6KFcPrtjQ+DCnwGVNrbn//71z6jI1x5u13M
 XeEniKjH1Ad4y7CnFkQvNInP6gm7iY7I7NEf1alYbYkUIjQ==
X-Received: by 2002:a17:906:f59f:b0:b40:cfe9:ed2c with SMTP id
 a640c23a62f3a-b6d700613a8mr1017088266b.64.1761563640175; 
 Mon, 27 Oct 2025 04:14:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM5QX7q+ulmwr25IwswirGQJy8OMcID1rEEuQvZTUQ/p5vsFN8TPgYvpCoC3nOmLXfz83gsw==
X-Received: by 2002:a17:906:f59f:b0:b40:cfe9:ed2c with SMTP id
 a640c23a62f3a-b6d700613a8mr1017085966b.64.1761563639732; 
 Mon, 27 Oct 2025 04:13:59 -0700 (PDT)
Received: from ?IPv6:2001:16b8:3d68:200:6e75:6a50:1d0f:8f29?
 ([2001:16b8:3d68:200:6e75:6a50:1d0f:8f29])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d853f97f7sm725914266b.51.2025.10.27.04.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:13:59 -0700 (PDT)
Message-ID: <537bdebf2112a080ae92526ecfa41d63668d90a3.camel@redhat.com>
Subject: Re: [RFC PATCH 3/3] drm/sched: Prevent adding dependencies to an
 armed job
From: Philipp Stanner <pstanner@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: jiangshanlai@gmail.com, tj@kernel.org, simona.vetter@ffwll.ch, 
 christian.koenig@amd.com, dakr@kernel.org
Date: Mon, 27 Oct 2025 12:13:58 +0100
In-Reply-To: <20251021213952.746900-4-matthew.brost@intel.com>
References: <20251021213952.746900-1-matthew.brost@intel.com>
 <20251021213952.746900-4-matthew.brost@intel.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ctki6CZgCVUl53LG0f1sTb6NFnKDpPd6GKTEI0N0pvc_1761563640
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

I've got a kernel.org addr by now by the way

On Tue, 2025-10-21 at 14:39 -0700, Matthew Brost wrote:
> According to the DMA scheduler documentation, once a job is armed, it
> must be pushed. Drivers should avoid calling the failing code path that
> attempts to add dependencies after a job has been armed.
>=20

Why is that a "failing code path"?

The issue with adding callbacks is that adding them to an already
signaled fence is a bad idea. I'm not sure if it's illegal, though.
dma_fence_add_cb() merely returns an error then, but the driver could
in priniciple then execute its cb code itself.

And even if we agree that this is a hard rule that must be followed,
then drm_sched_job_arm() *might* not be the right place, because just
because a job is armed doesn't mean that its fence is about to get
signaled. drm_sched_entity_push_job() would be the critical place.


>  This change
> enforces that rule.
>=20
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 7 ++++++-
> =C2=A01 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 676484dd3ea3..436cb2844161 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -873,7 +873,8 @@ EXPORT_SYMBOL(drm_sched_job_arm);
> =C2=A0 * @job: scheduler job to add the dependencies to
> =C2=A0 * @fence: the dma_fence to add to the list of dependencies.
> =C2=A0 *
> - * Note that @fence is consumed in both the success and error cases.
> + * Note that @fence is consumed in both the success and error cases. Thi=
s
> + * function cannot be called if the job is armed.
> =C2=A0 *
> =C2=A0 * Returns:
> =C2=A0 * 0 on success, or an error on failing to expand the array.
> @@ -886,6 +887,10 @@ int drm_sched_job_add_dependency(struct drm_sched_jo=
b *job,
> =C2=A0=09u32 id =3D 0;
> =C2=A0=09int ret;
> =C2=A0
> +=09/* Do not allow additional dependencies when job is armed */
> +=09if (WARN_ON_ONCE(job->sched))

One would probably want an 'armed' boolean for that. At the very least
one wants to document in the struct's docstring that job->sched has
this semantic meaning. Otherwise it's only obvious for people who have
been hacking on the scheduler for years.


By the way I think that we use WARN_ON*() too much in DRM. It generates
difficult to read, non-descriptive error messages compared to
dev_warn() and similar helpers, and it's often a bit overkill. I would
only use it when there is no other choice, such as in an interrupt-
handler or widely used void func() where you cannot simply add a return
code.


P.

> +=09=09return -EINVAL;


> +
> =C2=A0=09if (!fence)
> =C2=A0=09=09return 0;
> =C2=A0

