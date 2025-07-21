Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5528CB0BCC2
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 08:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A38010E259;
	Mon, 21 Jul 2025 06:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="I0nOAeGz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF4D10E48F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 06:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NdvLfkkGBjZm0b5b6FIzS2hH6p0WgirRS6OItPXP3Mk=; b=I0nOAeGze5satY0gBGngOmVfvn
 cF9LmYBQ7qZF+DajmnkYt4iCKkh01jTbY5HhtPMdQlmgJL4h0CovfDJChZEHF2f/Qe+JiBrVhAyWW
 LU2qQ1jg8qcyuOJdIjaDBxURUW5MI/O0rjeW674lIpYgg7nbDFmnjPfQSBL5bI9qV1jXL1M1TeT5J
 PoXetBUh4AEmSwtS8IlnyOLLFhenvZ37W6g7ZT3qtvcoHxq5zyFC1RGqD/BM44F3MmnmMTOR1SmjG
 iLs2wPfTozEABwP9lUdplm009M9sYJD2OF9iFq4ELqAz3US1lk06KOZr8oCAb9T8D6LBNufkry2vc
 bozSAp+Q==;
Received: from [159.147.180.92] (helo=[192.168.0.17])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1udkAP-001ar3-32; Mon, 21 Jul 2025 08:38:29 +0200
Message-ID: <2eb2618a80e78dc62f2ebd8835d76812597c602d.camel@igalia.com>
Subject: Re: [PATCH 0/6] drm/v3d: General job locking improvements +
 race-condition fixes
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
Date: Mon, 21 Jul 2025 08:38:18 +0200
In-Reply-To: <20250719-v3d-queue-lock-v1-0-bcc61210f1e5@igalia.com>
References: <20250719-v3d-queue-lock-v1-0-bcc61210f1e5@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
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

Thanks Ma=C3=ADra, series is:

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

Iago

El s=C3=A1b, 19-07-2025 a las 10:24 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> This patch series was initially motivated by a race condition
> (exposed
> in PATCH 4/6) where we lacked synchronization for `job->file` access.
> This led to use-after-free issues when a file descriptor was closed
> while a job was still running.
>=20
> However, beyond fixing this specific race, the series introduces
> broader improvements to active job management and locking. While
> PATCH
> 1/6, 2/6, and 5/6 are primarily code refactors, PATCH 3/6 brings a
> significant change to the locking scheme. Previously, all queues
> shared
> the same spinlock, which caused unnecessary contention during high
> GPU
> usage across different queues. PATCH 3/6 allows queues to operate
> more
> independently.
>=20
> Finally, PATCH 6/6 addresses a similar race condition to PATCH 4/6,
> but
> this time, on the per-file descriptor reset counter.
>=20
> Best Regards,
> - Ma=C3=ADra
>=20
> ---
> Ma=C3=ADra Canal (6):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/v3d: Store a pointer to `struct v3d_fi=
le_priv` inside each
> job
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/v3d: Store the active job inside the q=
ueue's state
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/v3d: Replace a global spinlock with a =
per-queue spinlock
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/v3d: Address race-condition between pe=
r-fd GPU stats and fd
> release
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/v3d: Synchronous operations can't time=
out
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/v3d: Protect per-fd reset counter agai=
nst fd release
>=20
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.c=C2=A0=C2=A0=C2=A0 | 14 ++++++-
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.h=C2=A0=C2=A0=C2=A0 | 22 ++++-------
> =C2=A0drivers/gpu/drm/v3d/v3d_fence.c=C2=A0 | 11 +++---
> =C2=A0drivers/gpu/drm/v3d/v3d_gem.c=C2=A0=C2=A0=C2=A0 | 10 ++---
> =C2=A0drivers/gpu/drm/v3d/v3d_irq.c=C2=A0=C2=A0=C2=A0 | 68 +++++++++++++-=
----------------
> --
> =C2=A0drivers/gpu/drm/v3d/v3d_sched.c=C2=A0 | 85 +++++++++++++++++++++++-=
------
> ----------
> =C2=A0drivers/gpu/drm/v3d/v3d_submit.c |=C2=A0 2 +-
> =C2=A07 files changed, 108 insertions(+), 104 deletions(-)
> ---
> base-commit: ca2a6abdaee43808034cdb218428d2ed85fd3db8
> change-id: 20250718-v3d-queue-lock-59babfb548bc
>=20
>=20

