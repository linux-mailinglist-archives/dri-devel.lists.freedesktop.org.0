Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E97B29AB0A0
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 16:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45ED410E32E;
	Tue, 22 Oct 2024 14:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="V8pUQZae";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5B810E32E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 14:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729606654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UxXiD/WnK0CenFn5QOiZGmygWuwmKRykKVSh4xEXqyE=;
 b=V8pUQZaeMsxuwf5H+ML/d6TkFhg7xQBBoAs5ylgN5r1Zmba4Nc2yoEHWuT/dOTWHPiP/4E
 BJenxZRt5XnKe0KTXyS8A8C8pWctNwnhcvFaufcqkSOj36LX0CCx07lrq939/rMUyGG5Un
 8937Enprd5Tq5LLBiYO3c8QTqy5fNeI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-t9rS5yOYPUOO1HgjWR99mg-1; Tue, 22 Oct 2024 10:17:32 -0400
X-MC-Unique: t9rS5yOYPUOO1HgjWR99mg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4315f48bd70so35903365e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 07:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729606651; x=1730211451;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pOSKzau6wT6H5CR33wgPlaWELuBkpIiBFWNd8iU2Uq0=;
 b=KKPkQhhETJRItEWTkbMXMh3NU2L/uRw6wr8LE3RfotVz6iwLIz4DSLsBvy05d3paD7
 sr6HmxXNzMkitdUVhpdualbPFD1tbEhNOKZplNiPTgs5DDdt1unsyW+wxm+GezG6ysC2
 b7Pe8kI3psXDCM1k2GMtGxPebNQu8e6Beioxg4qTxERCFyPgyJvdtJL9cdEWcrRsi0dM
 Lm7v9Q7EqnCI/UPgaRBkd5sREh39x8JYjM6S/RXRxFyP+khgGu1BhSmQulL29fPnOFWJ
 RV+BxIO3NPp/MuV/MadSsZJEnnMjdyERFJ3voUEXLWG1kMA8TEUj4kz8RaAvKz97n1+y
 s81g==
X-Gm-Message-State: AOJu0YxRhG5oYhcJTtmrqJkiUkUCbHthM37FoIuoYD8VcPxmnsoOJeRz
 GKCagURBiaagz6NWgYGTT7/FFtwDg4NBPE6+sgvWhTVOCdun8l3IqArZ6GN8CNG0aWSPpJLjfac
 TsnXdyayQlMl7UNYEg7vwf74aMA6biOf3+DembZZODsYB0gI2UcZcyiLHPb1nsb5g0g==
X-Received: by 2002:a05:600c:4b87:b0:431:60ec:7a96 with SMTP id
 5b1f17b1804b1-4317caf63a8mr24446045e9.25.1729606651181; 
 Tue, 22 Oct 2024 07:17:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+xo1gjEvuI+Ausdm7pGly7HL146lUmzfMU8cpapJtOkDb5H6qFcaWCH8lO6ZrnrTK3WSAoA==
X-Received: by 2002:a05:600c:4b87:b0:431:60ec:7a96 with SMTP id
 5b1f17b1804b1-4317caf63a8mr24445825e9.25.1729606650814; 
 Tue, 22 Oct 2024 07:17:30 -0700 (PDT)
Received: from dhcp-64-16.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0b93ea6sm6777545f8f.84.2024.10.22.07.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 07:17:30 -0700 (PDT)
Message-ID: <3b7b2e9f324d3a40f290392f56569154a3d6395f.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/sched: memset() 'job' in drm_sched_job_init()
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Luben
 Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 22 Oct 2024 16:17:29 +0200
In-Reply-To: <9c1f72ea-06d9-4615-b2f8-d98a0aa78aa1@amd.com>
References: <20241021105028.19794-2-pstanner@redhat.com>
 <9c1f72ea-06d9-4615-b2f8-d98a0aa78aa1@amd.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2024-10-21 at 15:05 +0200, Christian K=C3=B6nig wrote:
> Am 21.10.24 um 12:50 schrieb Philipp Stanner:
> > drm_sched_job_init() has no control over how users allocate struct
> > drm_sched_job. Unfortunately, the function can also not set some
> > struct
> > members such as job->sched.
> >=20
> > This could theoretically lead to UB by users dereferencing the
> > struct's
> > pointer members too early.
> >=20
> > It is easier to debug such issues if these pointers are initialized
> > to
> > NULL, so dereferencing them causes a NULL pointer exception.
> > Accordingly, drm_sched_entity_init() does precisely that and
> > initializes
> > its struct with memset().
> >=20
> > Initialize parameter "job" to 0 in drm_sched_job_init().
> >=20
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > ---
> > No changes in v2.
> >=20
> > +CC Christian and Tvrtko in this thread.
> > Would be cool if someone can do a review.
> > ---
> > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c | 8 ++++++++
> > =C2=A0 1 file changed, 8 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index dab8cca79eb7..2e0e5a9577d1 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -796,6 +796,14 @@ int drm_sched_job_init(struct drm_sched_job
> > *job,
> > =C2=A0=C2=A0=09=09return -EINVAL;
> > =C2=A0=C2=A0=09}
> > =C2=A0=20
> > +=09/*
> > +=09 * We don't know for sure how the user has allocated.
> > Thus, zero the
> > +=09 * struct so that unallowed (i.e., too early) usage of
> > pointers that
> > +=09 * this function does not set is guaranteed to lead to a
> > NULL pointer
> > +=09 * exception instead of UB.
> > +=09 */
> > +=09memset(job, 0, sizeof(*job));
> > +
>=20
> Maybe just implicitly set the sched pointer to NULL here?
>=20
> On the other hand compilers these days are really good at optimizing=20
> that away anyway, so feel free to add Reviewed-by: Christian K=C3=B6nig=
=20
> <christian.koenig@amd.com> to the series as is as well.

(I had performance-tested it with several million jobs and couldn't
detect a performance regression that was measurable)

Applied #1 to drm-misc-next, thanks.

Regarding patch #2, I just noticed that it violates the docstring
style. I therefore hereby reject my own patch and will resubmit it in a
cleaner form ^^'

P.

>=20
> Regards,
> Christian.
>=20
> > =C2=A0=C2=A0=09job->entity =3D entity;
> > =C2=A0=C2=A0=09job->credits =3D credits;
> > =C2=A0=C2=A0=09job->s_fence =3D drm_sched_fence_alloc(entity, owner);
>=20

