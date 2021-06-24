Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 058A43B31A6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 16:42:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259AE6EB31;
	Thu, 24 Jun 2021 14:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C856EB31
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 14:42:40 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1lwQYw-0007Da-NG; Thu, 24 Jun 2021 16:42:38 +0200
Message-ID: <7a3097c9be015a6aea1a700f5e955dc1e55aec84.camel@pengutronix.de>
Subject: Re: [PATCH 10/11] drm/scheduler: Don't store self-dependencies
From: Lucas Stach <l.stach@pengutronix.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Date: Thu, 24 Jun 2021 16:42:37 +0200
In-Reply-To: <20210624140025.438303-11-daniel.vetter@ffwll.ch>
References: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
 <20210624140025.438303-11-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Jack Zhang <Jack.Zhang1@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, dem 24.06.2021 um 16:00 +0200 schrieb Daniel Vetter:
> This is essentially part of drm_sched_dependency_optimized(), which
> only amdgpu seems to make use of. Use it a bit more.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Jack Zhang <Jack.Zhang1@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 370c336d383f..c31d7cf7df74 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -649,6 +649,13 @@ int drm_sched_job_await_fence(struct drm_sched_job *job,
>  	if (!fence)
>  		return 0;
>  
> +	/* if it's a fence from us it's guaranteed to be earlier */
> +	if (fence->context == job->entity->fence_context ||
> +	    fence->context == job->entity->fence_context + 1) {
> +		dma_fence_put(fence);
> +		return 0;
> +	}
> +
>  	/* Deduplicate if we already depend on a fence from the same context.
>  	 * This lets the size of the array of deps scale with the number of
>  	 * engines involved, rather than the number of BOs.


