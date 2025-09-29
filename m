Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C65B5BA938B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 14:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7930310E235;
	Mon, 29 Sep 2025 12:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CY2gN9t/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0865610E235
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 12:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759149776; x=1790685776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vYQHs5wcW60oZ2pNRor1RkVy6BNwi154wGS6m9mIkHU=;
 b=CY2gN9t/8br1S2SFLM76VUcgm16JAlG4fX4Ju0QUh5eqCTfGwDASA5Zh
 7vMAYrVF98CN4nPuAqKFJUNsJP+rjxaFP+QS0F9xTn/ijFarRDYTiodB5
 5c/POi4tU+lPjI9clooqQcmCLIwzQIy4D643G6jRMr/wbOldP+LYhR+tL
 ODwJ5r9WS+NGExc/smQqbr8/gUURt5U6/CkmQdyE8YY2In2MXGFV7sXFu
 kR6ZCueP+QwIKKCMeHc/eWRY6/KkOkAkdhfD0qbKYI9E5AqPgdGOgjrNN
 YFzYB8uxnKWX6ASEJ+8A4lwnc6jgrF2GyZ9hWPuCYcP/flqnsO6N7th8O w==;
X-CSE-ConnectionGUID: phvB/PUhQQ6tqYvdmSPAIQ==
X-CSE-MsgGUID: 6umD/ID7RdaJzcDQBl4Deg==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61435301"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="61435301"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 05:42:56 -0700
X-CSE-ConnectionGUID: 5Z/QNayySKubcWY41EBqXw==
X-CSE-MsgGUID: O61Zn5DmQn6/M1mSazHo5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="215378071"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.245.221])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 05:42:53 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH] drm/vgem-fence: Fix potential deadlock on release
Date: Mon, 29 Sep 2025 14:42:51 +0200
Message-ID: <4655664.8F6SAcFxjW@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <2b562fa8-6312-4464-8c8d-26d13fbad673@amd.com>
References: <20250926152628.2165080-2-janusz.krzysztofik@linux.intel.com>
 <2b562fa8-6312-4464-8c8d-26d13fbad673@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Hi Christian,

Thank you for looking at it and providing your R-b.

On Sunday, 28 September 2025 16:00:57 CEST Christian K=C3=B6nig wrote:
> On 26.09.25 17:26, Janusz Krzysztofik wrote:
> > A timer that expires a vgem fence automatically in 10 seconds is now
> > released with timer_delete_sync() from fence->ops.release() called on l=
ast
> > dma_fence_put().  In some scenarios, it can run in IRQ context, which is
> > not safe unless TIMER_IRQSAFE is used.  One potentially risky scenario =
was
> > demonstrated in Intel DRM CI trybot, BAT run on machine bat-adlp-6, whi=
le
> > working on new IGT subtests syncobj_timeline@stress-* as user space
> > replacements of some problematic test cases of a dma-fence-chain selfte=
st
=2E..
> > Make the timer IRQ safe.
> >=20
> > [1] https://patchwork.freedesktop.org/series/154987/#rev2
> >=20
> > Fixes: 4077798484459 ("drm/vgem: Attach sw fences to exported vGEM dma-=
buf (ioctl)")
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>=20
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>=20
> We should also consider to lower the timeout massively. This needs to be =
in the range of 100m-1s to not cause the same trouble as the sw_sync framew=
ork.

Assuming you are referring to potential hard lockups observed in sw_sync ba=
sed=20
version of the exercise, which piece of kernel code you would expect to loo=
p=20
for too long with interrupts disabled due to the vgem fences auto expiry=20
timeout of 10s?

>=20
> 10seconds is just way to long for that.

Do you think DRM objects can't be busy for that long in real life?  What ab=
out=20
long running GPU compute tasks?

Thanks,
Janusz


>=20
> Regards,
> Christian.
>=20
> > ---
> >  drivers/gpu/drm/vgem/vgem_fence.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/v=
gem_fence.c
> > index fd76730fd38c0..07db319c3d7f9 100644
> > --- a/drivers/gpu/drm/vgem/vgem_fence.c
> > +++ b/drivers/gpu/drm/vgem/vgem_fence.c
> > @@ -79,7 +79,7 @@ static struct dma_fence *vgem_fence_create(struct vge=
m_file *vfile,
> >  	dma_fence_init(&fence->base, &vgem_fence_ops, &fence->lock,
> >  		       dma_fence_context_alloc(1), 1);
> > =20
> > -	timer_setup(&fence->timer, vgem_fence_timeout, 0);
> > +	timer_setup(&fence->timer, vgem_fence_timeout, TIMER_IRQSAFE);
> > =20
> >  	/* We force the fence to expire within 10s to prevent driver hangs */
> >  	mod_timer(&fence->timer, jiffies + VGEM_FENCE_TIMEOUT);
>=20
>=20




