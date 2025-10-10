Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30905BCC3CF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 10:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729B010EB81;
	Fri, 10 Oct 2025 08:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="hGwVthLK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F1910EB81;
 Fri, 10 Oct 2025 08:55:54 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cjgZH2FvSz9t43;
 Fri, 10 Oct 2025 10:55:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1760086551; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5xBcnfiSOpAMqNmpYqmXifDKuohFDIBDa3tlkXh4mfQ=;
 b=hGwVthLKr24AsNSI1N08Wq7aOjS312DKKxadaF0RbyBLhl4UQ9PUjTb/QIwJ5M86Kxacyq
 qPxiGT7lkq5V1sqoV4HYeojKfgInF2wsMC4RPZJQ2Ahk46NAnPo4+h2vrdY/R/BP5HiyG1
 BeEZ+9wxVsLz2ZkcwnZG3eOeudocRsLLgScl/hB3GfSxB/tt5aQdJ3X0b6/f3I02gvQI3U
 o9fqkPS0yB6y44fbmuGNLLRPSxlhHyvNHpIrWVqP7Gg1ABmDSTZ02aiTRKwC8W6XoFuM1r
 AJ19pjc0LqBhO1f7wiN6ICGZMYzkX6r9Nb74jAjgnz/ru/brZouVXnrn0Ve7Iw==
Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of phasta@mailbox.org designates
 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=phasta@mailbox.org
Message-ID: <c6fab1fd60d1230b70b4c2bb4d37cdf20ab31f22.camel@mailbox.org>
Subject: Re: [PATCH 01/28] drm/sched: Reverse drm_sched_rq_init arguments
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Fri, 10 Oct 2025 10:55:42 +0200
In-Reply-To: <20251008085359.52404-2-tvrtko.ursulin@igalia.com>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
 <20251008085359.52404-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: f76ccc24270e53fe939
X-MBO-RS-META: qihqzqcra69jbpek3bm865z1p5zeiqot
X-Rspamd-Queue-Id: 4cjgZH2FvSz9t43
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

On Wed, 2025-10-08 at 09:53 +0100, Tvrtko Ursulin wrote:
> Helper operates on the run queue so lets make that the primary argument.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 8 ++++----
> =C2=A01 file changed, 4 insertions(+), 4 deletions(-)

That's a new patch from the RFC, isn't it?

And it's a general code improvement that is not related to CFS. I think
I mentioned it a few times already that a series is easier to review
and workflows are simplified if generic-improvement patches are
branched out and sent separately.

I thought you had agreed with that?

P.

>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 46119aacb809..8b8c55b25762 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -174,13 +174,13 @@ void drm_sched_rq_update_fifo_locked(struct drm_sch=
ed_entity *entity,
> =C2=A0/**
> =C2=A0 * drm_sched_rq_init - initialize a given run queue struct
> =C2=A0 *
> + * @rq: scheduler run queue
> =C2=A0 * @sched: scheduler instance to associate with this run queue
> - * @rq: scheduler run queue
> =C2=A0 *
> =C2=A0 * Initializes a scheduler runqueue.
> =C2=A0 */
> -static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq)
> +static void drm_sched_rq_init(struct drm_sched_rq *rq,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpu_scheduler *sched)
> =C2=A0{
> =C2=A0	spin_lock_init(&rq->lock);
> =C2=A0	INIT_LIST_HEAD(&rq->entities);
> @@ -1353,7 +1353,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,=
 const struct drm_sched_init_
> =C2=A0		sched->sched_rq[i] =3D kzalloc(sizeof(*sched->sched_rq[i]), GFP_K=
ERNEL);
> =C2=A0		if (!sched->sched_rq[i])
> =C2=A0			goto Out_unroll;
> -		drm_sched_rq_init(sched, sched->sched_rq[i]);
> +		drm_sched_rq_init(sched->sched_rq[i], sched);
> =C2=A0	}
> =C2=A0
> =C2=A0	init_waitqueue_head(&sched->job_scheduled);

