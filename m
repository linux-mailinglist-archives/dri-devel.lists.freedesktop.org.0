Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BA88B0267
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 08:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F0E10F7F1;
	Wed, 24 Apr 2024 06:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="tgVqusFl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4CB11386D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1713941326;
 bh=MCbQ8rAHzB39hXl89cji/rkdiQatKGWYGWSwFnCGjP8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tgVqusFlVX5FZN6PlqVOsyQikYjC5hrQ2VCM/5ibvt0MptDvKLWSUx88lPTk+4Fqd
 mgKxcWC0X/Z2DxjMjROS7TGnZyJPW1jYvvwbNyeUXGnad8k1VAmpfi3U+1kUlfGwer
 oQ8w8BczM2vICB9TWN93JmFWjELosDlTP4TKMpOGRYx+gQlY8RyCzBU+33WdU1Qwou
 CfAZzuNv3BYxePp19MmEn2d9ICl13ZpHkLM01CkGRN30jmDjq+ra2e+Pv2+Cv8Eteh
 sBvwMDC4om7n41mdMVzw00Wa5Uoy/7Sf7WNd56fY096lMXtSFRXyx+EHzwnczLg+cJ
 Nwb1BuNR8tmHg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 12529378212B;
 Wed, 24 Apr 2024 06:48:46 +0000 (UTC)
Date: Wed, 24 Apr 2024 08:48:43 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] drm/panthor: introduce job cycle and timestamp
 accounting
Message-ID: <20240424084843.57f095df@collabora.com>
In-Reply-To: <20240423213240.91412-2-adrian.larumbe@collabora.com>
References: <20240423213240.91412-1-adrian.larumbe@collabora.com>
 <20240423213240.91412-2-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Tue, 23 Apr 2024 22:32:34 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Enable calculations of job submission times in clock cycles and wall
> time. This is done by expanding the boilerplate command stream when runni=
ng
> a job to include instructions that compute said times right before an aft=
er
> a user CS.
>=20
> Those numbers are stored in the queue's group's sync objects BO, right
> after them. Because the queues in a group might have a different number of
> slots, one must keep track of the overall slot tally when reckoning the
> offset of a queue's time sample structs, one for each slot.
>=20
> NUM_INSTRS_PER_SLOT had to be increased to 32 because of adding new FW
> instructions for storing and subtracting the cycle counter and timestamp
> register, and it must always remain a power of two.
>=20
> This commit is done in preparation for enabling DRM fdinfo support in the
> Panthor driver, which depends on the numbers calculated herein.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 158 ++++++++++++++++++++----
>  1 file changed, 134 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/pa=
nthor/panthor_sched.c
> index b3a51a6de523..320dfa0388ba 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -93,6 +93,9 @@
>  #define MIN_CSGS				3
>  #define MAX_CSG_PRIO				0xf
> =20
> +#define NUM_INSTRS_PER_SLOT			32
> +#define SLOTSIZE				(NUM_INSTRS_PER_SLOT * sizeof(u64))

Given everyone agreed on the profiling sysfs knob for Panfrost, I'm
tempted to make the profiling optional here as well, so we can save
space on the CS ring buffers when profiling is disabled. This means
adjusting the 'credits' parameter we pass to drm_sched_job_init()
accordingly, with one credit counting for an instruction (or a block of
16 instructions to keep things naturally cache-line aligned). You'll
also need to change the 'credit_limit' passed to drm_sched_init().
> =20

