Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA11A5EE39
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 09:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B82110E804;
	Thu, 13 Mar 2025 08:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="OStm+eJx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B612C10E804
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 08:41:20 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ZD1Dq63N9z9tD1;
 Thu, 13 Mar 2025 09:41:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1741855275; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m0s9BXoOXwlavaR7+igiPKZFuNZEvjYPYrMoR9PJJ9U=;
 b=OStm+eJxJOT29Vjs9GNAVvClQl4ZrJ22/0/f3Ja9wWMbjT9yVJaJbTK6wsNYfKATILNJZZ
 7APXc+TcCsKMT9bwiTIbs+ChmSaHo4CXt64G7pLc4jb5qcAvc2ZO2cEH9JsCeQpuqHeFGY
 YPJLcM51YL5PAmsaC7kmVp/eeltE8IRBr4H4rANlaV3P+SjWJlGRlcdBS0X2oCdWKKYjo0
 2S6XPkqX8nQnISiSVykbX0yq1Ajz7yQRTxB8AzCmC/sfUtD1rUuaESEwUPBqkRvkX/fONW
 6ztu+gLeXzss5rmkVTOS2+asSDtLFcfEc29Rj3spsIjBJ3bxOWi73le8l1FoHw==
Message-ID: <91a06e390d6b526bd9e9ba37cb478d337a2294dd.camel@mailbox.org>
Subject: Re: [PATCH V4] drm/sched: Fix fence reference count leak
From: Philipp Stanner <phasta@mailbox.org>
To: Qianyi Liu <liuqianyi125@gmail.com>, airlied@gmail.com, 
 ckoenig.leichtzumerken@gmail.com, dakr@kernel.org, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, matthew.brost@intel.com,
 mripard@kernel.org,  phasta@kernel.org, tzimmermann@suse.de
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
Date: Thu, 13 Mar 2025 09:41:11 +0100
In-Reply-To: <20250311060251.4041101-1-liuqianyi125@gmail.com>
References: <20250311060251.4041101-1-liuqianyi125@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: q1q4tsbu5owia83jckezz1ppzj9i6pga
X-MBO-RS-ID: 1b049b0e8507b5db404
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

On Tue, 2025-03-11 at 14:02 +0800, Qianyi Liu wrote:
> From: qianyi liu <liuqianyi125@gmail.com>
>=20
> The last_scheduled fence leaks when an entity is being killed and
> adding
> the cleanup callback fails.
>=20
> Decrement the reference count of prev when dma_fence_add_callback()
> fails, ensuring proper balance.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 2fdb8a8f07c2 ("drm/scheduler: rework entity flush, kill and
> fini")
> Signed-off-by: qianyi liu <liuqianyi125@gmail.com>

Applied to drm-misc-fixes, thank you.

P.

> ---
> v3 -> v4: Improve commit message and add code comments (Philipp)
> v2 -> v3: Rework commit message (Markus)
> v1 -> v2: Added 'Fixes:' tag and clarified commit message (Philipp
> and Matthew)
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 11 +++++++++--
> =C2=A01 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> b/drivers/gpu/drm/scheduler/sched_entity.c
> index 69bcf0e99d57..da00572d7d42 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -259,9 +259,16 @@ static void drm_sched_entity_kill(struct
> drm_sched_entity *entity)
> =C2=A0		struct drm_sched_fence *s_fence =3D job->s_fence;
> =C2=A0
> =C2=A0		dma_fence_get(&s_fence->finished);
> -		if (!prev || dma_fence_add_callback(prev, &job-
> >finish_cb,
> -					=C2=A0=C2=A0
> drm_sched_entity_kill_jobs_cb))
> +		if (!prev ||
> +		=C2=A0=C2=A0=C2=A0 dma_fence_add_callback(prev, &job->finish_cb,
> +					=C2=A0=C2=A0
> drm_sched_entity_kill_jobs_cb)) {
> +			/*
> +			 * Adding callback above failed.
> +			 * dma_fence_put() checks for NULL.
> +			 */
> +			dma_fence_put(prev);
> =C2=A0			drm_sched_entity_kill_jobs_cb(NULL, &job-
> >finish_cb);
> +		}
> =C2=A0
> =C2=A0		prev =3D &s_fence->finished;
> =C2=A0	}

