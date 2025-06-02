Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1947AACB7FD
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 17:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2A010E55C;
	Mon,  2 Jun 2025 15:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Ds5aAgcJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA8810E558;
 Mon,  2 Jun 2025 15:34:05 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4b9yYk1jt6z9shl;
 Mon,  2 Jun 2025 17:34:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1748878442; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Awe1dhGUcwlwFptO9inKqI3/zNABpay/R4/pLVsmyo=;
 b=Ds5aAgcJ8EJJRaU39n2e8A+c7O2PKcwTNUlOxkrBaNM0oOiv47UtPEM6qsDp+nGtN6eSdG
 y/W2S02jag5AaEPGflZPTHhtde3qjXecJ3SOvevWK4xo8OvhGXAwkRfKTg1IxRxn7xFNZW
 JqMiwt7a5wKzU8Cc5Mq6tsDpJXeIG9rgwv26ZNp23kBwTkKK7/IcTgMPfqRqODV4F81ZMy
 QCygn6GH/A2CnUuzZl8CRJchuRJ1PNzKy/HlVzfHr8QwV8etgqbYQvJQhTAzYh1STvD9cp
 +v07SPM6GFlwMqRfpaYh0OQwR5q3p/Z5gy8gUqMNjXSVAgWIfc9PlGFfGg+nIQ==
Message-ID: <3cb4d2c9c5db4b459344ee1ff6ebdea77804ee4b.camel@mailbox.org>
Subject: Re: [PATCH] drm/etnaviv: Protect the scheduler's pending list with
 its lock
From: Philipp Stanner <phasta@mailbox.org>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Lucas Stach
 <l.stach@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Russell
 King <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <cgmeiner@igalia.com>,  Philipp Stanner <phasta@kernel.org>
Cc: dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org, 
 kernel-dev@igalia.com, stable@vger.kernel.org
Date: Mon, 02 Jun 2025 17:33:58 +0200
In-Reply-To: <20250602132240.93314-1-mcanal@igalia.com>
References: <20250602132240.93314-1-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: rho4fa8zrfi8ucdopgjd97j174pda5hb
X-MBO-RS-ID: 12d2fd6bc7dd542828a
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

On Mon, 2025-06-02 at 10:22 -0300, Ma=C3=ADra Canal wrote:
> Commit 704d3d60fec4 ("drm/etnaviv: don't block scheduler when GPU is
> still
> active") ensured that active jobs are returned to the pending list
> when
> extending the timeout. However, it didn't use the pending list's lock
> to
> manipulate the list, which causes a race condition as the scheduler's
> workqueues are running.
>=20
> Hold the lock while manipulating the scheduler's pending list to
> prevent
> a race.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 704d3d60fec4 ("drm/etnaviv: don't block scheduler when GPU is
> still active")

Could also contain a "Closes: " with the link to the appropriate
message from thread [1] from below.

You might also include "Reported-by: Philipp" since I technically first
described the problem. But no hard feelings on that

> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>

Reviewed-by: Philipp Stanner <phasta@kernel.org>

> ---
> Hi,
>=20
> I'm proposing this workaround patch to address the race-condition
> caused
> by manipulating the pending list without using its lock. Although I
> understand this isn't a complete solution (see [1]), it's not
> reasonable
> to backport the new DRM stat series [2] to the stable branches.
>=20
> Therefore, I believe the best solution is backporting this fix to the
> stable branches, which will fix the race and will keep adding the job
> back to the pending list (which will avoid most memory leaks).
>=20
> [1]
> https://lore.kernel.org/dri-devel/bcc0ed477f8a6f3bb06665b1756bcb98fb7af87=
1.camel@mailbox.org/
> [2]
> https://lore.kernel.org/dri-devel/20250530-sched-skip-reset-v2-0-c40a8d2d=
8daa@igalia.com/
>=20
> Best Regards,
> - Ma=C3=ADra
> ---
> =C2=A0drivers/gpu/drm/etnaviv/etnaviv_sched.c | 5 ++++-
> =C2=A01 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index 76a3a3e517d8..71e2e6b9d713 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -35,6 +35,7 @@ static enum drm_gpu_sched_stat
> etnaviv_sched_timedout_job(struct drm_sched_job
> =C2=A0							=C2=A0
> *sched_job)
> =C2=A0{
> =C2=A0	struct etnaviv_gem_submit *submit =3D
> to_etnaviv_submit(sched_job);
> +	struct drm_gpu_scheduler *sched =3D sched_job->sched;
> =C2=A0	struct etnaviv_gpu *gpu =3D submit->gpu;
> =C2=A0	u32 dma_addr, primid =3D 0;
> =C2=A0	int change;
> @@ -89,7 +90,9 @@ static enum drm_gpu_sched_stat
> etnaviv_sched_timedout_job(struct drm_sched_job
> =C2=A0	return DRM_GPU_SCHED_STAT_NOMINAL;
> =C2=A0
> =C2=A0out_no_timeout:
> -	list_add(&sched_job->list, &sched_job->sched->pending_list);
> +	spin_lock(&sched->job_list_lock);
> +	list_add(&sched_job->list, &sched->pending_list);
> +	spin_unlock(&sched->job_list_lock);
> =C2=A0	return DRM_GPU_SCHED_STAT_NOMINAL;
> =C2=A0}
> =C2=A0

