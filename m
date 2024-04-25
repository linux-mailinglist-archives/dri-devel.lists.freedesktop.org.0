Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 409988B1FDD
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 13:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F75811A32D;
	Thu, 25 Apr 2024 11:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="wqSf963o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C57511A32D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 11:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714043110;
 bh=4Z3XPuB1s2i1MXyhmokW9zflWf+9x9qlhqIHtejcXlI=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=wqSf963oTxocniWIfQb9xr5+hNr3f214r/pY/mJeZAe2dFbLpAcgrLgl6tMDSrDFK
 yVcNOiaWSQvRMWjUQdXbsa/vFQfva1s9LXhLHh+hoEJONeGWzP/rbJlvPmUXJsAWD1
 IQv6x0lkwmViikcJhJL9zgKQIhtItf4NGAOZM5LPeRhVLUUh7chDRNWzDuSw+VYyQa
 SZWLh85s2uQ73NzlaeJ7Q/jqz/czI/8VMES7UqxwuNdwNwF7MzO8tytPzhorMJSUXM
 H2o3P6LMHi21UOQRMfHLPenRPoDTyXtWWSUMFfNGs4NYoHll0nTDIbb/Tj7RVcekAs
 UjBh+Cmr5aWAg==
Received: from [100.68.132.31] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: kusma)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 08B2A3782153;
 Thu, 25 Apr 2024 11:05:09 +0000 (UTC)
Message-ID: <4d29d6caf7bbc936707784a5ebbf497319c1c299.camel@collabora.com>
Subject: Re: [PATCH] drm/panthor: Kill the faulty_slots variable in
 panthor_sched_suspend()
From: Erik Faye-Lund <erik.faye-lund@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 =?ISO-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
Date: Thu, 25 Apr 2024 13:04:53 +0200
In-Reply-To: <20240425103920.826458-1-boris.brezillon@collabora.com>
References: <20240425103920.826458-1-boris.brezillon@collabora.com>
Autocrypt: addr=erik.faye-lund@collabora.com; prefer-encrypt=mutual;
 keydata=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
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
MIME-Version: 1.0
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

On Thu, 2024-04-25 at 12:39 +0200, Boris Brezillon wrote:
> We can use upd_ctx.timedout_mask directly, and the faulty_slots
> update
> in the flush_caches_failed situation is never used.
>=20
> Suggested-by: Suggested-by: Steven Price <steven.price@arm.com>

Whoops? :)

> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> =C2=A0drivers/gpu/drm/panthor/panthor_sched.c | 10 +++-------
> =C2=A01 file changed, 3 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c
> b/drivers/gpu/drm/panthor/panthor_sched.c
> index fad4678ca4c8..fed28c16d5d1 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2584,8 +2584,8 @@ void panthor_sched_suspend(struct
> panthor_device *ptdev)
> =C2=A0{
> =C2=A0	struct panthor_scheduler *sched =3D ptdev->scheduler;
> =C2=A0	struct panthor_csg_slots_upd_ctx upd_ctx;
> -	u32 suspended_slots, faulty_slots;
> =C2=A0	struct panthor_group *group;
> +	u32 suspended_slots;
> =C2=A0	u32 i;
> =C2=A0
> =C2=A0	mutex_lock(&sched->lock);
> @@ -2605,10 +2605,9 @@ void panthor_sched_suspend(struct
> panthor_device *ptdev)
> =C2=A0
> =C2=A0	csgs_upd_ctx_apply_locked(ptdev, &upd_ctx);
> =C2=A0	suspended_slots &=3D ~upd_ctx.timedout_mask;
> -	faulty_slots =3D upd_ctx.timedout_mask;
> =C2=A0
> -	if (faulty_slots) {
> -		u32 slot_mask =3D faulty_slots;
> +	if (upd_ctx.timedout_mask) {
> +		u32 slot_mask =3D upd_ctx.timedout_mask;
> =C2=A0
> =C2=A0		drm_err(&ptdev->base, "CSG suspend failed,
> escalating to termination");
> =C2=A0		csgs_upd_ctx_init(&upd_ctx);
> @@ -2659,9 +2658,6 @@ void panthor_sched_suspend(struct
> panthor_device *ptdev)
> =C2=A0
> =C2=A0			slot_mask &=3D ~BIT(csg_id);
> =C2=A0		}
> -
> -		if (flush_caches_failed)
> -			faulty_slots |=3D suspended_slots;
> =C2=A0	}
> =C2=A0
> =C2=A0	for (i =3D 0; i < sched->csg_slot_count; i++) {

