Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E607A55AA
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 00:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6021610E354;
	Mon, 18 Sep 2023 22:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6776410E34F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 22:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695075556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SLkFt0WcZ6RXdaNFLWO3tvzhrPsMNj6vdbQGFMg75Sk=;
 b=RFKeCdDKzG4a1JgnWaO20IwKTAFoRo717DenDvENc217/oNlWIULQtvGr2Y70uxeYQeTmz
 tNMbXqwyVz8jGktGB8xJMGQmmx8nSo4XQe2HgD8Tsk4KsgKT+TNx/u3PMwWp8ox9Bp33wv
 sDnnj5Oty+qfvqeeJri4F3a1eJeixR0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-rrTioGp_PzGw-cRnIVS_jQ-1; Mon, 18 Sep 2023 18:19:15 -0400
X-MC-Unique: rrTioGp_PzGw-cRnIVS_jQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6564b4f78dfso18903016d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 15:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695075555; x=1695680355;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZSoEALyFQ5Hgu/o72FnEqXupIq+EGY1EoFTQth+rByc=;
 b=TPaDa580qMFCjwmsqXw3lSIeRApr7LtvgTSl1qMAiSGlJJlebI8KD0EaOIBGXnA3dy
 L2UEBWjxpbqi+hcLHhYFAxQlMqiI9PlLzbUZTD2frefE6imM97KcnuBGmvBNiEYDtsXv
 3glIpaHeMI2rEyU71A5XbUhdT4UCJm8qLzZGjeqpHH8B9NGlnttZIzj2zj2t2znYYx7U
 vXVJUWNxMAhcrXAsiq0yTenlydDkdoQUaGDEN0zRNRPyGdeQC89nTPxjRdCOieiR0c7f
 XogFUp9Pqzvh9nIUI3AdcuOmrMQArh1DmcsZ9s/bAT3Orhc9ZuGkyF/aRrfFeflDLhcV
 s+PQ==
X-Gm-Message-State: AOJu0Yx3awGz0VjzVu+2Q1nK1IrQtUCPpIcX0c6XCj5mI3ezfYCvqQa8
 +Zumc2gOQiWUCecY2bve9TZcByPJ+w5wSE8w70cKPFi4vrDItRmwEDg+O5JldgP9DovdJLm6uik
 LIdgi7tPc+TaMJTGRths5geb97c8l
X-Received: by 2002:a0c:f706:0:b0:658:4cae:b432 with SMTP id
 w6-20020a0cf706000000b006584caeb432mr577320qvn.5.1695075554943; 
 Mon, 18 Sep 2023 15:19:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHw55jWZldbWm4cxdzBsvpvm0KyWAYpbNaOxMH9SThTxodmZg49xyqFG4ZvCELj6jzbeb7oQ==
X-Received: by 2002:a0c:f706:0:b0:658:4cae:b432 with SMTP id
 w6-20020a0cf706000000b006584caeb432mr577308qvn.5.1695075554630; 
 Mon, 18 Sep 2023 15:19:14 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a0cf492000000b006585069e894sm116021qvm.109.2023.09.18.15.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 15:19:13 -0700 (PDT)
Message-ID: <c938aabcd97eb6b118ed853799a30c729ec3eafa.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: sched: fix leaking memory of timedout job
From: Lyude Paul <lyude@redhat.com>
To: Danilo Krummrich <dakr@redhat.com>, nouveau@lists.freedesktop.org
Date: Mon, 18 Sep 2023 18:19:13 -0400
In-Reply-To: <20230916162835.5719-1-dakr@redhat.com>
References: <20230916162835.5719-1-dakr@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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
Cc: dri-devel@lists.freedesktop.org, kherbst@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

BTW - Would you like me to review work like this? I'm totally happy to do
that, although I'm not terribly familiar with these parts of nouveau/drm (b=
ut
I'm always willing to learn, and would like to know more about these areas
anyway :)

=E2=80=A6if the answer is yes, this patch looks fine to me so far - I guess=
 the one
question I have that might have an obvious answer - how are jobs without an
job->ops->timeout callback cleaned up?

On Sat, 2023-09-16 at 18:28 +0200, Danilo Krummrich wrote:
> Always stop and re-start the scheduler in order to let the scheduler
> free up the timedout job in case it got signaled. In case of exec jobs
> the job type specific callback will take care to signal all fences and
> tear down the channel.
>=20
> Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_exec.c  |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c | 12 +++++++++---
>  2 files changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nou=
veau/nouveau_exec.c
> index 9c031d15fe0b..49d83ac9e036 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_exec.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
> @@ -185,7 +185,7 @@ nouveau_exec_job_timeout(struct nouveau_job *job)
> =20
>  =09nouveau_sched_entity_fini(job->entity);
> =20
> -=09return DRM_GPU_SCHED_STAT_ENODEV;
> +=09return DRM_GPU_SCHED_STAT_NOMINAL;
>  }
> =20
>  static struct nouveau_job_ops nouveau_exec_job_ops =3D {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/no=
uveau/nouveau_sched.c
> index 88217185e0f3..3b7ea5221226 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -375,14 +375,20 @@ nouveau_sched_run_job(struct drm_sched_job *sched_j=
ob)
>  static enum drm_gpu_sched_stat
>  nouveau_sched_timedout_job(struct drm_sched_job *sched_job)
>  {
> +=09struct drm_gpu_scheduler *sched =3D sched_job->sched;
>  =09struct nouveau_job *job =3D to_nouveau_job(sched_job);
> +=09enum drm_gpu_sched_stat stat =3D DRM_GPU_SCHED_STAT_NOMINAL;
> =20
> -=09NV_PRINTK(warn, job->cli, "Job timed out.\n");
> +=09drm_sched_stop(sched, sched_job);
> =20
>  =09if (job->ops->timeout)
> -=09=09return job->ops->timeout(job);
> +=09=09stat =3D job->ops->timeout(job);
> +=09else
> +=09=09NV_PRINTK(warn, job->cli, "Generic job timeout.\n");
> +
> +=09drm_sched_start(sched, true);
> =20
> -=09return DRM_GPU_SCHED_STAT_ENODEV;
> +=09return stat;
>  }
> =20
>  static void

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

