Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D54B096C53F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 19:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D617D10E815;
	Wed,  4 Sep 2024 17:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="FsEHOjWC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4EB10E815
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 17:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cpresAn3JJDMDIjQ/jKtWP1bUeBkGCYiL49pfIxDEvI=; b=FsEHOjWCogN6nm1HBg/0fghDLC
 TYy/TC86ZSwvUVJfzf6VG4Zg1kft5PEnaBbnx3/o5pgWEphygPiMRMDb0g/8/dWdEtoLb3518ykjp
 lUSsSx71B41kLQkOzRg8iwjxp/6lqai4N8URu9FjxanIWRLoNp2Eeug4prLYmjIUn8mMCP7858512
 ovLMwExr3e9yBsd0w4WQquWknP7W60k3q9c79m3uEA9xU9usJQ3lq+BDscVATKjv12FmhRAeFks/I
 2EvGP0e1UbNRSr2C4SG3NwcWJhjUHeDu5qe21yLQGZUVkymMmuJ6quWOBJWDCSvXAMb3lSNqMJZja
 M18Ou6sw==;
Received: from cust-west-lon-46-193-226-34.cust.wifirst.net ([46.193.226.34]
 helo=[10.10.9.21]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1slthE-009blP-QX; Wed, 04 Sep 2024 19:21:32 +0200
Message-ID: <289c4578dc8861cebae8292861be6dd42272c100.camel@igalia.com>
Subject: Re: [PATCH v5 02/10] drm/v3d: Flush the MMU before we supply more
 memory to the binner
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Tvrtko Ursulin <tursulin@igalia.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Date: Wed, 04 Sep 2024 19:21:30 +0200
In-Reply-To: <20240829130954.2439316-3-mcanal@igalia.com>
References: <20240829130954.2439316-1-mcanal@igalia.com>
 <20240829130954.2439316-3-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
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

Thanks!

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

El jue, 29-08-2024 a las 10:05 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> We must ensure that the MMU is flushed before we supply more memory
> to
> the binner, otherwise we might end up with invalid MMU accesses by
> the
> GPU.
>=20
> Fixes: 57692c94dcbe ("drm/v3d: Introduce a new DRM driver for
> Broadcom V3D V3.x+")
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.h | 1 +
> =C2=A0drivers/gpu/drm/v3d/v3d_irq.c | 2 ++
> =C2=A0drivers/gpu/drm/v3d/v3d_mmu.c | 2 +-
> =C2=A03 files changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h
> b/drivers/gpu/drm/v3d/v3d_drv.h
> index cf4b23369dc4..75b4725d49c7 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -553,6 +553,7 @@ void v3d_irq_disable(struct v3d_dev *v3d);
> =C2=A0void v3d_irq_reset(struct v3d_dev *v3d);
> =C2=A0
> =C2=A0/* v3d_mmu.c */
> +int v3d_mmu_flush_all(struct v3d_dev *v3d);
> =C2=A0int v3d_mmu_set_page_table(struct v3d_dev *v3d);
> =C2=A0void v3d_mmu_insert_ptes(struct v3d_bo *bo);
> =C2=A0void v3d_mmu_remove_ptes(struct v3d_bo *bo);
> diff --git a/drivers/gpu/drm/v3d/v3d_irq.c
> b/drivers/gpu/drm/v3d/v3d_irq.c
> index d469bda52c1a..20bf33702c3c 100644
> --- a/drivers/gpu/drm/v3d/v3d_irq.c
> +++ b/drivers/gpu/drm/v3d/v3d_irq.c
> @@ -70,6 +70,8 @@ v3d_overflow_mem_work(struct work_struct *work)
> =C2=A0	list_add_tail(&bo->unref_head, &v3d->bin_job->render-
> >unref_list);
> =C2=A0	spin_unlock_irqrestore(&v3d->job_lock, irqflags);
> =C2=A0
> +	v3d_mmu_flush_all(v3d);
> +
> =C2=A0	V3D_CORE_WRITE(0, V3D_PTB_BPOA, bo->node.start <<
> V3D_MMU_PAGE_SHIFT);
> =C2=A0	V3D_CORE_WRITE(0, V3D_PTB_BPOS, obj->size);
> =C2=A0
> diff --git a/drivers/gpu/drm/v3d/v3d_mmu.c
> b/drivers/gpu/drm/v3d/v3d_mmu.c
> index 06bb44c7f35d..3b7694ee7536 100644
> --- a/drivers/gpu/drm/v3d/v3d_mmu.c
> +++ b/drivers/gpu/drm/v3d/v3d_mmu.c
> @@ -28,7 +28,7 @@
> =C2=A0#define V3D_PTE_WRITEABLE BIT(29)
> =C2=A0#define V3D_PTE_VALID BIT(28)
> =C2=A0
> -static int v3d_mmu_flush_all(struct v3d_dev *v3d)
> +int v3d_mmu_flush_all(struct v3d_dev *v3d)
> =C2=A0{
> =C2=A0	int ret;
> =C2=A0

