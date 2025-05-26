Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE68BAC3A9A
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 09:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520C410E281;
	Mon, 26 May 2025 07:28:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="F6JMfla+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E0C10E281;
 Mon, 26 May 2025 07:28:08 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4b5S6D3MjDz9tGG;
 Mon, 26 May 2025 09:28:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1748244484; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t+PP4Plw8YwjEd3E7MEZ2WoSmcrHpE9uM+UXA5tZCsk=;
 b=F6JMfla+lq5G2O/GuSEHrUsxxiigCJzJVUNwy10tK81mFVBuNtZkJYDj47G0HnyPWJleq+
 FhoeXocP5UAYo5F1G+59gWf8BCUvh8FPLjZDEXzAiZr1MizK+15I8gEH6VtiGKLQlECmze
 vj+ai6hi1GT0fyieWrlec2PXtHDWCtNKk3PUKy2xvM2aZqEX4lHuG68+9uGt41s0Ef7G+O
 Th+zGMiNTBVsZvadPCTNXkQaBivfaghNkcw6uPyTnoYTTx/jvrtTY1PIuNrSQC9VgsZDr1
 gbNvGDhLobuj6I+lnTrYH5gMmbmIjuzbtmpRyhrhvV35CDvlUdeu7w5GUL96HQ==
Message-ID: <a3ef761d7ba3544798e04547ca882cc1ef4c5899.camel@mailbox.org>
Subject: Re: [PATCH 1/4] drm/sched: optimize drm_sched_job_add_dependency
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 tursulin@ursulin.net, dakr@kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Mon, 26 May 2025 09:28:02 +0200
In-Reply-To: <20250523125643.7540-2-christian.koenig@amd.com>
References: <20250523125643.7540-1-christian.koenig@amd.com>
 <20250523125643.7540-2-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: aaf401ca1eeb0e2a718
X-MBO-RS-META: jynbu3h71e81ndq36xodrw6kstbp4mke
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

On Fri, 2025-05-23 at 14:56 +0200, Christian K=C3=B6nig wrote:
> It turned out that we can actually massively optimize here.
>=20
> The previous code was horrible inefficient since it constantly
> released
> and re-acquired the lock of the xarray and started each iteration
> from the
> base of the array to avoid concurrent modification which in our case
> doesn't exist.
>=20
> Additional to that the xas_find() and xas_store() functions are
> explicitly
> made in a way so that you can efficiently check entries and if you
> don't
> find a match store a new one at the end or replace existing ones.
>=20
> So use xas_for_each()/xa_store() instead of xa_for_each()/xa_alloc().
> It's a bit more code, but should be much faster in the end.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 29 ++++++++++++++++++-----=
-
> --
> =C2=A01 file changed, 20 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index f7118497e47a..cf200b1b643e 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -871,10 +871,8 @@ EXPORT_SYMBOL(drm_sched_job_arm);
> =C2=A0int drm_sched_job_add_dependency(struct drm_sched_job *job,
> =C2=A0				 struct dma_fence *fence)
> =C2=A0{
> +	XA_STATE(xas, &job->dependencies, 0);
> =C2=A0	struct dma_fence *entry;
> -	unsigned long index;
> -	u32 id =3D 0;
> -	int ret;
> =C2=A0
> =C2=A0	if (!fence)
> =C2=A0		return 0;
> @@ -883,24 +881,37 @@ int drm_sched_job_add_dependency(struct
> drm_sched_job *job,
> =C2=A0	 * This lets the size of the array of deps scale with the
> number of
> =C2=A0	 * engines involved, rather than the number of BOs.
> =C2=A0	 */
> -	xa_for_each(&job->dependencies, index, entry) {
> +	xa_lock(&job->dependencies);
> +	xas_for_each(&xas, entry, ULONG_MAX) {
> =C2=A0		if (entry->context !=3D fence->context)
> =C2=A0			continue;
> =C2=A0
> =C2=A0		if (dma_fence_is_later(fence, entry)) {
> =C2=A0			dma_fence_put(entry);
> -			xa_store(&job->dependencies, index, fence,
> GFP_KERNEL);
> +			xas_store(&xas, fence);
> =C2=A0		} else {
> =C2=A0			dma_fence_put(fence);
> =C2=A0		}
> -		return 0;
> +		xa_unlock(&job->dependencies);
> +		return xas_error(&xas);
> =C2=A0	}
> =C2=A0
> -	ret =3D xa_alloc(&job->dependencies, &id, fence, xa_limit_32b,
> GFP_KERNEL);
> -	if (ret !=3D 0)
> +retry:
> +	entry =3D xas_store(&xas, fence);
> +	xa_unlock(&job->dependencies);
> +
> +	/* There shouldn't be any concurrent add, so no need to loop
> again */

Should we maybe add it to the function documentation that this must not
be called concurrently?

Looks to me as if the current version were already broken if someone
does that. So maybe is also OK to just leave it as is.


P.


> +	if (xas_nomem(&xas, GFP_KERNEL)) {
> +		xa_lock(&job->dependencies);
> +		goto retry;
> +	}
> +
> +	if (xas_error(&xas))
> =C2=A0		dma_fence_put(fence);
> +	else
> +		WARN_ON(entry);
> =C2=A0
> -	return ret;
> +	return xas_error(&xas);
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_sched_job_add_dependency);
> =C2=A0

