Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BEAB002B2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 14:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E3710E8D6;
	Thu, 10 Jul 2025 12:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="q3GiOvBz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF68810E8C8;
 Thu, 10 Jul 2025 12:58:14 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bdFJM2n5Sz9sx4;
 Thu, 10 Jul 2025 14:58:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1752152291; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XUdTgSu/zHvFvHHBAYxFI7WNZhlx1N0C5aZ+BZgA/hg=;
 b=q3GiOvBzyHujBbSJyAfbiklhFM/WL6aD01vbIbLLVfn3xsMoDfFurOVoZidipbO6tdQSCm
 +jp+NwxFcqSX0dn491UeCiC85OkRiX6DRkUGbRyykenUQnIOAm0ZXo3fOR+ll//rzXmAbh
 7uZMY6GrfjZxxJ+E8dEhNHds3xsFBvNz1okgpTa9fVoO0TbEpLL6miqPva47X12iZiQ2d2
 iH8wNIwu8RjH9obhhxlvnS8hZNHfJTweC3qsF01o52IugnS9sKwBK0Z7iTYc92c3dCHQ8/
 t4IE0FtScpgYTbTcHgYBuJ8Pj9tAxDWccbazxeLl/GDe3PrX1hOpy5z8gQINEA==
Message-ID: <bec98a82435d7f448dff219a2238b15b6b3eb754.camel@mailbox.org>
Subject: Re: [PATCH v4 1/8] drm/panfrost: Fix scheduler workqueue bug
From: Philipp Stanner <phasta@mailbox.org>
To: Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matthew
 Brost <matthew.brost@intel.com>,  Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>,  Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 stable@vger.kernel.org
Date: Thu, 10 Jul 2025 14:58:05 +0200
In-Reply-To: <20250710125412.128476-3-phasta@kernel.org>
References: <20250710125412.128476-2-phasta@kernel.org>
 <20250710125412.128476-3-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 836fbb2b50af0e52d75
X-MBO-RS-META: q7ni9ki5c4orx1jns8zppxa9ufa6zses
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

On Thu, 2025-07-10 at 14:54 +0200, Philipp Stanner wrote:
> When the GPU scheduler was ported to using a struct for its
> initialization parameters, it was overlooked that panfrost creates a
> distinct workqueue for timeout handling.
>=20
> The pointer to this new workqueue is not initialized to the struct,
> resulting in NULL being passed to the scheduler, which then uses the
> system_wq for timeout handling.
>=20
> Set the correct workqueue to the init args struct.
>=20
> Cc: stable@vger.kernel.org=C2=A0# 6.15+
> Fixes: 796a9f55a8d1 ("drm/sched: Use struct for drm_sched_init()
> params")
> Reported-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Closes:
> https://lore.kernel.org/dri-devel/b5d0921c-7cbf-4d55-aa47-c35cd7861c02@ig=
alia.com/
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---

aaaarrrgh, how did that one get here!

Ignore that. Will not be merged through this series.


P.

> =C2=A0drivers/gpu/drm/panfrost/panfrost_job.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c
> b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 5657106c2f7d..15e2d505550f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -841,7 +841,6 @@ int panfrost_job_init(struct panfrost_device
> *pfdev)
> =C2=A0		.num_rqs =3D DRM_SCHED_PRIORITY_COUNT,
> =C2=A0		.credit_limit =3D 2,
> =C2=A0		.timeout =3D msecs_to_jiffies(JOB_TIMEOUT_MS),
> -		.timeout_wq =3D pfdev->reset.wq,
> =C2=A0		.name =3D "pan_js",
> =C2=A0		.dev =3D pfdev->dev,
> =C2=A0	};
> @@ -879,6 +878,7 @@ int panfrost_job_init(struct panfrost_device
> *pfdev)
> =C2=A0	pfdev->reset.wq =3D alloc_ordered_workqueue("panfrost-reset",
> 0);
> =C2=A0	if (!pfdev->reset.wq)
> =C2=A0		return -ENOMEM;
> +	args.timeout_wq =3D pfdev->reset.wq;
> =C2=A0
> =C2=A0	for (j =3D 0; j < NUM_JOB_SLOTS; j++) {
> =C2=A0		js->queue[j].fence_context =3D
> dma_fence_context_alloc(1);

