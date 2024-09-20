Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A1F97D31F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 10:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D9510E2D9;
	Fri, 20 Sep 2024 08:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="INczOze5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3D610E2D9
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 08:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726822679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UI5quEqnxLL+TkxGK66Qse8qW4R9pe7wF//SWeQt4gA=;
 b=INczOze5AxKDepz+YslOi5b98tkqwslN0BKY0398lIJTD+MxBJXmUWjMPa075TZGidDJ9S
 QGKOy91wCftf6+F0kAyCWLnWcawb6f7SFy/MnuNQBxYHJ+cS3uYsUUZ+K+oaDTzmtiSxQ1
 Tf6zUUbi7k1EBs2OM1U+Th60/9kzP7s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-MUKkN0scP_Cu_QMfiFovJA-1; Fri, 20 Sep 2024 04:57:57 -0400
X-MC-Unique: MUKkN0scP_Cu_QMfiFovJA-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a8a9094c973so126996866b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 01:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726822676; x=1727427476;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FpPq/TfoZdyCV6ExFG0fgQxCKnTz4at1pdecECx/aDM=;
 b=bWOr0BUvOLmfMb8GqJbEdSa/RD6H5Z1D/JgEXi/cwwfi/8ioqgTnYRUbLT+xm//Nzg
 QwGtP6AXoT9rPc7TINTM7Ft9IxdjQJVDXZlV5cLWXQnoXZ4nOGhrZwtMFLM3pO98h0Ci
 aycN8HCCl5NgHWGwM0/KRiqBEaBApelgsV9Ok54hfanm/882qqbsE/ZMmHFjemclh8Gr
 kNRWYIq9fAUP8Iuhhsx/NK3hS/RyfzdpVlZfw6pnSo2rPR9ZWcTB6NQfAbXq+MQ09Tru
 ayZX4kseIbsl3oWTAd+0UsdFgTMha2h3YSYu5xmW1nOihvfbUSIzqnCXpfqgJ422Xco/
 g4tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMz6VU3BhH3orS+M+2H/9eBHxmJkTRO3gXfDpppXibTexNSU0gGu9ZdIAHiEqjrbIiQV0d1IzQD7E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0uTMRN1eTN0N2Sovk1tdB8HUF/C3CPLggbAyL7eC/hECIspbp
 zk57nolWzb+OZp9c3Lq6TY2vwki7JYn6/Xm3XtLCFptWyGLNoEPiZioKISZ2Nfdgdrpn0CCXpUo
 p9Z9nheVN0ZD/H6GjBL1pFa5/PSLvBWHWm726zbkYLMcDMUQ6mzoDQdj3d2b1qdAwJw==
X-Received: by 2002:a17:907:f1d1:b0:a8d:14e4:f94a with SMTP id
 a640c23a62f3a-a90d508b54dmr162819866b.38.1726822676494; 
 Fri, 20 Sep 2024 01:57:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZrDIbt0QkjjAfALcvK5Mc1kmCMO5qjxIzbdo0JBCxpUEcDaHmTqscSitCP4KWeV+umlnc0w==
X-Received: by 2002:a17:907:f1d1:b0:a8d:14e4:f94a with SMTP id
 a640c23a62f3a-a90d508b54dmr162817466b.38.1726822676061; 
 Fri, 20 Sep 2024 01:57:56 -0700 (PDT)
Received: from [10.137.4.45] ([83.68.141.146])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f4443sm813355866b.75.2024.09.20.01.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 01:57:55 -0700 (PDT)
Message-ID: <8a0e7e0b0d2ef05954240434759ca79f25328b73.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/sched: add WARN_ON and BUG_ON to drm_sched_fini
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 dakr@kernel.org, dri-devel@lists.freedesktop.org, ltuikov89@gmail.com
Date: Fri, 20 Sep 2024 10:57:52 +0200
In-Reply-To: <20240918133956.26557-1-christian.koenig@amd.com>
References: <20240918133956.26557-1-christian.koenig@amd.com>
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

On Wed, 2024-09-18 at 15:39 +0200, Christian K=C3=B6nig wrote:
> Tearing down the scheduler with jobs still on the pending list can
> lead to use after free issues. Add a warning if drivers try to
> destroy a scheduler which still has work pushed to the HW.

Did you have time yet to look into my proposed waitque-solution?

>=20
> When there are still entities with jobs the situation is even worse
> since the dma_fences for those jobs can never signal we can just
> choose between potentially locking up core memory management and
> random memory corruption. When drivers really mess it up that well
> let them run into a BUG_ON().
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 19 ++++++++++++++++++-
> =C2=A01 file changed, 18 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index f093616fe53c..8a46fab5cdc8 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1333,17 +1333,34 @@ void drm_sched_fini(struct drm_gpu_scheduler
> *sched)

I agree with Sima that it should first be documented in the function's
docstring what the user is expected to have done before calling the
function.

P.

> =C2=A0
> =C2=A0=09drm_sched_wqueue_stop(sched);
> =C2=A0
> +=09/*
> +=09 * Tearing down the scheduler wile there are still
> unprocessed jobs can
> +=09 * lead to use after free issues in the scheduler fence.
> +=09 */
> +=09WARN_ON(!list_empty(&sched->pending_list));
> +
> =C2=A0=09for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++)
> {
> =C2=A0=09=09struct drm_sched_rq *rq =3D sched->sched_rq[i];
> =C2=A0
> =C2=A0=09=09spin_lock(&rq->lock);
> -=09=09list_for_each_entry(s_entity, &rq->entities, list)
> +=09=09list_for_each_entry(s_entity, &rq->entities, list) {
> +=09=09=09/*
> +=09=09=09 * The justification for this BUG_ON() is
> that tearing
> +=09=09=09 * down the scheduler while jobs are pending
> leaves
> +=09=09=09 * dma_fences unsignaled. Since we have
> dependencies
> +=09=09=09 * from the core memory management to
> eventually signal
> +=09=09=09 * dma_fences this can trivially lead to a
> system wide
> +=09=09=09 * stop because of a locked up memory
> management.
> +=09=09=09 */
> +=09=09=09BUG_ON(spsc_queue_count(&s_entity-
> >job_queue));
> +
> =C2=A0=09=09=09/*
> =C2=A0=09=09=09 * Prevents reinsertion and marks job_queue
> as idle,
> =C2=A0=09=09=09 * it will removed from rq in
> drm_sched_entity_fini
> =C2=A0=09=09=09 * eventually
> =C2=A0=09=09=09 */
> =C2=A0=09=09=09s_entity->stopped =3D true;
> +=09=09}
> =C2=A0=09=09spin_unlock(&rq->lock);
> =C2=A0=09=09kfree(sched->sched_rq[i]);
> =C2=A0=09}

