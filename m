Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BDDA137B8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 11:21:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF65710E93F;
	Thu, 16 Jan 2025 10:21:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Puei3SMI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E5110E93A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 10:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737022895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FkI+kHQuIdgTjteVXi1iO+c/68zVjR4vOto/s1CsYHs=;
 b=Puei3SMIyttdL7U0ct+vOEugsADR/Li0l+v3KLLga3rLxGk3PmXH7GZcuJbaEYaLzVaBsA
 +H1P2lJDCrD39RTaQzxVNXjqyYW5jRZ3NBj2uPHTNuiII09nJzhZ9RlI0r4mSh8XlF21xa
 YbVhag53mtUHFic0K6wGrSF3tEri77k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-71QcOXe2MyyobbVAuAsIHA-1; Thu, 16 Jan 2025 05:21:34 -0500
X-MC-Unique: 71QcOXe2MyyobbVAuAsIHA-1
X-Mimecast-MFC-AGG-ID: 71QcOXe2MyyobbVAuAsIHA
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43673af80a6so4608685e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 02:21:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737022893; x=1737627693;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s0Atk1k5psc/MhNcC16NK0/VPvU/Uol+DZ7S5kp4zt8=;
 b=FBYNui0fCL5RhgyqLrWa8CjrFf5Mhc2ltM+zZIvl0YrQcO5Vn7NzjazA3ttWkWocN2
 zUYkQzitxoqogQPufXYkhaI8o+sOrDmk8wcWJjv4i9Dhw7G6g5/AH7ni/73UE44nOw3/
 WBTH9Rywiq/qLKicaQxMEGSIu3c+6RCTp/AmQ/pkHSJsSoMa1LhtikmiF/QJz1mXnTsl
 lfanBM4BuUXX4d4kwpWReVHFFbZLokYoejtE9poi2R9IcGKkfxLbQV/5nL1h2nqqjIT/
 ydVTZt59ofnOPMKJnfFFRYgmE/Ry9GDnkoYq9/JfUZg769mH9N8h3UKC95t6k+JEsx3s
 Mh4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxNIEgsFGGPziWVYloZ0B9/MLH9+ksm58LXAlijEmsqymU7LlIejZoVx87HC2RLGkvB24VB2FgYqs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+8dUpl+tKKGMBhfVIENcIXqo8Tdh93paDHTDxLI4OlvZ0GEgk
 bPhTn0/L9g4ce2poPU47S2G1aDlFqnDrLkeKOS5ZZql31jG8OfdMahgrpueGtq/1HSQ9+2aSb8D
 N4sRV0C29vSyCcxPTcUw/N+TO5IY+NEdSTKA1Lk7r6sVMeVzTplpkX/ntVrg5HTNcuQ==
X-Gm-Gg: ASbGncvy/UOjONWhE8EUvx/f+d6qYq0toqJmxAJLwBzc4kZhWs1VCKE689mCD0dRTOK
 AvjyasRr1yuyJMSq/C7EnnS+DZfLowMzpj0HP0BfOR2dWh3fUteQuNpVU/2qXmdTMLHlBIhqmNh
 4vf9noyVIVH+OTz3FX4HaUrUpgeXj8Hu+H5zdOZAsXWUybY6F2jOsMUNp0CZCuMKoX6tsDGZ7xG
 L3BrIBPy2HO1jGv2K8IbUQ7oik8wXXrKhDhgw7ivbVNn4fdqLya+66Cto+D0OfA1HH8fBPtlMIz
 TnxUckI=
X-Received: by 2002:a05:600c:348c:b0:435:14d:f61a with SMTP id
 5b1f17b1804b1-436e2707c4emr253039195e9.25.1737022892890; 
 Thu, 16 Jan 2025 02:21:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8B7eYT68cKugKFj7umaKTvHD+8sl57GHJ/otzn5ILf4VZT+7VpxyghTodAMdEiNMBo/iUog==
X-Received: by 2002:a05:600c:348c:b0:435:14d:f61a with SMTP id
 5b1f17b1804b1-436e2707c4emr253039005e9.25.1737022892550; 
 Thu, 16 Jan 2025 02:21:32 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c749a127sm54641705e9.7.2025.01.16.02.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 02:21:32 -0800 (PST)
Message-ID: <4e3302537cf45134590c91f8ee7022775057a1c2.camel@redhat.com>
Subject: Re: [PATCH] drm/sched: Remove weak paused submission checks
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@redhat.com>, Matthew
 Brost <matthew.brost@intel.com>
Date: Thu, 16 Jan 2025 11:21:31 +0100
In-Reply-To: <20250114105942.64832-1-tvrtko.ursulin@igalia.com>
References: <20250114105942.64832-1-tvrtko.ursulin@igalia.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6wsCZyghx6vwGupup7jd3ofnEG3lKkjjRpLaupXA8ec_1737022893
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

On Tue, 2025-01-14 at 10:59 +0000, Tvrtko Ursulin wrote:
> There is no need to check the boolean in the work item's prologues
> since
> the boolean can be set at any later time anyway.
>=20
> The helper which pauses submission sets it and synchronously cancels
> the
> work and helpers which queue the work check for the flag so all
> should be
> good.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Ah yes, good catch.

Applied to drm-misc-next, thanks.

> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>

btw. FYI Danilo and I preferably now use these addresses:
Danilo Krummrich <dakr@kernel.org>
Philipp Stanner <phasta@kernel.org>

Danilo's is already in the MAINTAINERS file, mine should follow soon.

Regards
P.

> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 6 ------
> =C2=A01 file changed, 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 57da84908752..2d3d71e053a6 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1166,9 +1166,6 @@ static void drm_sched_free_job_work(struct
> work_struct *w)
> =C2=A0=09=09container_of(w, struct drm_gpu_scheduler,
> work_free_job);
> =C2=A0=09struct drm_sched_job *job;
> =C2=A0
> -=09if (READ_ONCE(sched->pause_submit))
> -=09=09return;
> -
> =C2=A0=09job =3D drm_sched_get_finished_job(sched);
> =C2=A0=09if (job)
> =C2=A0=09=09sched->ops->free_job(job);
> @@ -1192,9 +1189,6 @@ static void drm_sched_run_job_work(struct
> work_struct *w)
> =C2=A0=09struct drm_sched_job *sched_job;
> =C2=A0=09int r;
> =C2=A0
> -=09if (READ_ONCE(sched->pause_submit))
> -=09=09return;
> -
> =C2=A0=09/* Find entity with a ready job */
> =C2=A0=09entity =3D drm_sched_select_entity(sched);
> =C2=A0=09if (!entity)

