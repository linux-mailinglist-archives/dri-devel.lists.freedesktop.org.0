Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FE5B7DF6F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83D710E14F;
	Wed, 17 Sep 2025 11:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ZNtOOSYb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E16910E14F
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 11:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IvTANeoOXCBXAhd6PMjVeNeTVwMOAQX5WsS9B21As3k=; b=ZNtOOSYbptcCUntYMp3awzVmZb
 syujtdauFTj7zc5CduXRlXRZp5wmUeN1ZfyFHkzznNtReL1Wpxij+P+1S0jK0PHquSxC3crN6F5ob
 aAdhA/lqEwa9Gi0bNUGcor67WeUl1SQ7QTQ78vMAAMkljoJVxvD6iTi9/7oC32HTEsdIzzfMUQQFy
 ffqPW4UBrgtque5H+5RZW4mmBwblm64LgvlMmkA70C0Fua2rudsWFUakSJEmjRGbycjBZQsybm8l3
 FqOWVLSry7KhsPLJDSQ6ciL24T3U16DlHbMAIK/Y0D+90Ec/hVUV83Q76seN1/LM5xCntnaupEUsg
 vV7whVfQ==;
Received: from [159.147.19.227] (helo=[192.168.0.17])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uyqF2-00Cfv3-Dp; Wed, 17 Sep 2025 13:22:28 +0200
Message-ID: <f333a10a69bb740b82d55dff34c4f637cc7aa82d.camel@igalia.com>
Subject: Re: [PATCH] drm/v3d: create a dedicated lock for dma fence
From: Iago Toral <itoral@igalia.com>
To: Melissa Wen <mwen@igalia.com>, mcanal@igalia.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Date: Wed, 17 Sep 2025 13:22:17 +0200
In-Reply-To: <20250916172022.2779837-1-mwen@igalia.com>
References: <20250916172022.2779837-1-mwen@igalia.com>
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

Thanks Melissa!

Acked-by: Iago Toral Quiroga <itoral@igalia.com>

El mar, 16-09-2025 a las 14:18 -0300, Melissa Wen escribi=C3=B3:
> Don't mix dma fence lock with the active_job lock. The issue was
> uncovered when PREEMPT_RT on.
>=20
> Link: https://github.com/raspberrypi/linux/issues/7035
> Fixes: fa6a20c87470 ("drm/v3d: Address race-condition between per-fd
> GPU stats and fd release")
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.h=C2=A0=C2=A0 | 1 +
> =C2=A0drivers/gpu/drm/v3d/v3d_fence.c | 2 +-
> =C2=A0drivers/gpu/drm/v3d/v3d_gem.c=C2=A0=C2=A0 | 1 +
> =C2=A03 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h
> b/drivers/gpu/drm/v3d/v3d_drv.h
> index 0317f3d7452a..b1c41af87e17 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -62,6 +62,7 @@ struct v3d_queue_state {
> =C2=A0	/* Currently active job for this queue */
> =C2=A0	struct v3d_job *active_job;
> =C2=A0	spinlock_t queue_lock;
> +	spinlock_t fence_lock;
> =C2=A0};
> =C2=A0
> =C2=A0/* Performance monitor object. The perform lifetime is controlled b=
y
> userspace
> diff --git a/drivers/gpu/drm/v3d/v3d_fence.c
> b/drivers/gpu/drm/v3d/v3d_fence.c
> index 8f8471adae34..c82500a1df73 100644
> --- a/drivers/gpu/drm/v3d/v3d_fence.c
> +++ b/drivers/gpu/drm/v3d/v3d_fence.c
> @@ -15,7 +15,7 @@ struct dma_fence *v3d_fence_create(struct v3d_dev
> *v3d, enum v3d_queue q)
> =C2=A0	fence->dev =3D &v3d->drm;
> =C2=A0	fence->queue =3D q;
> =C2=A0	fence->seqno =3D ++queue->emit_seqno;
> -	dma_fence_init(&fence->base, &v3d_fence_ops, &queue-
> >queue_lock,
> +	dma_fence_init(&fence->base, &v3d_fence_ops, &queue-
> >fence_lock,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 queue->fence_context, fence-=
>seqno);
> =C2=A0
> =C2=A0	return &fence->base;
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c
> b/drivers/gpu/drm/v3d/v3d_gem.c
> index c77d90aa9b82..bb110d35f749 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -273,6 +273,7 @@ v3d_gem_init(struct drm_device *dev)
> =C2=A0		seqcount_init(&queue->stats.lock);
> =C2=A0
> =C2=A0		spin_lock_init(&queue->queue_lock);
> +		spin_lock_init(&queue->fence_lock);
> =C2=A0	}
> =C2=A0
> =C2=A0	spin_lock_init(&v3d->mm_lock);

