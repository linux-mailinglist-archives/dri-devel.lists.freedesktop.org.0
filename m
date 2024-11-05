Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C71009BCE82
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 14:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5369610E5A7;
	Tue,  5 Nov 2024 13:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="SwR/5qUf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EE610E5A7
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 13:59:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BEC8240003;
 Tue,  5 Nov 2024 13:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730815186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qDL+EzhNna3m+AvNd8SqI7verykdqMGqAXzPsLQ5Qy8=;
 b=SwR/5qUfcUgG797iVB0A7kIjHIb5FSZdR6SFiu8UIr3kyBkH3FsgLs1jHjuJP2/nfj/RkZ
 PNTINkyM3CoHjmil5WDDI/Ac5UQKyBvVvi+ifI3612hN9TicbqDG9vw4HqHXrXwyT+WkYM
 529xQg/z8+4fb+nPMs60SM3jltwLdk8UwNp7O9HQpvYmaW19PzmaJIW+P/ceULadGKVgLl
 SRh3piU7gFii4xpgGJyPK9CJ5/hSSyL+0V+3AVSWdsdNzFMRKurzvhgAILnUlu/9g/T0YB
 VzP0zQDfZ9B7jICe9w7QPKpGOPcZ9KScGk9iRho0lNe5tks6AitHX2Q6A9n87g==
Date: Tue, 5 Nov 2024 14:59:44 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/vkms: avoid race-condition between flushing and
 destroying
Message-ID: <Zyok0NQpido1Wqya@louis-chauvet-laptop>
References: <20230729225008.30455-1-mairacanal@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230729225008.30455-1-mairacanal@riseup.net>
X-GND-Sasl: louis.chauvet@bootlin.com
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

On 29/07/23 - 19:49, Ma�ra Canal wrote:
> After we flush the workqueue at the commit tale, we need to make sure
> that no work is queued until we destroy the state. Currently, new work
> can be queued in the workqueue, even after the commit tale, as the
> vblank thread is still running.
> 
> Therefore, to avoid a race-condition that will lead to the trigger of a
> WARN_ON() at the function vkms_atomic_crtc_destroy_state(), add a mutex
> to protect the sections where the queue is manipulated.
> 
> This way we can make sure that no work will be added to the workqueue
> between flushing the queue (at the commit tail) and destroying the
> state.
> 
> Signed-off-by: Ma�ra Canal <mairacanal@riseup.net>

Hi Ma�ra,

Thanks for pointing to this patch, it does not apply on drm-misc-next, but 
it was simple to manually rebase (see [0]).

I think it should solve the issue, and the CI seems to agree.

But it seems to be imperfect, as it introduce a warning on mutex unlock 
imbalance [1] (not always reproducable). It is better than a kernel crash 
already.

Do you want/have time to continue this fix?

[0]:https://gitlab.freedesktop.org/louischauvet/kernel/-/commit/017210f48c809730296d1f562e615b666fdbcfdc
[1]:https://gitlab.freedesktop.org/louischauvet/kernel/-/jobs/66118565/viewer#L803

Thanks,
Louis Chauvet

> ---
>  drivers/gpu/drm/vkms/vkms_crtc.c | 10 +++++++++-
>  drivers/gpu/drm/vkms/vkms_drv.c  |  1 +
>  drivers/gpu/drm/vkms/vkms_drv.h  |  8 ++++++++
>  3 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 3c5ebf106b66..e5ec21a0da05 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -49,7 +49,9 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
>  		state->crc_pending = true;
>  		spin_unlock(&output->composer_lock);
> 
> +		mutex_lock(&state->queue_lock);
>  		ret = queue_work(output->composer_workq, &state->composer_work);
> +		mutex_unlock(&state->queue_lock);
>  		if (!ret)
>  			DRM_DEBUG_DRIVER("Composer worker already queued\n");
>  	}
> @@ -129,6 +131,7 @@ vkms_atomic_crtc_duplicate_state(struct drm_crtc *crtc)
> 
>  	__drm_atomic_helper_crtc_duplicate_state(crtc, &vkms_state->base);
> 
> +	mutex_init(&vkms_state->queue_lock);
>  	INIT_WORK(&vkms_state->composer_work, vkms_composer_worker);
> 
>  	return &vkms_state->base;
> @@ -142,6 +145,9 @@ static void vkms_atomic_crtc_destroy_state(struct drm_crtc *crtc,
>  	__drm_atomic_helper_crtc_destroy_state(state);
> 
>  	WARN_ON(work_pending(&vkms_state->composer_work));
> +	mutex_unlock(&vkms_state->queue_lock);
> +
> +	mutex_destroy(&vkms_state->queue_lock);
>  	kfree(vkms_state->active_planes);
>  	kfree(vkms_state);
>  }
> @@ -155,8 +161,10 @@ static void vkms_atomic_crtc_reset(struct drm_crtc *crtc)
>  		vkms_atomic_crtc_destroy_state(crtc, crtc->state);
> 
>  	__drm_atomic_helper_crtc_reset(crtc, &vkms_state->base);
> -	if (vkms_state)
> +	if (vkms_state) {
> +		mutex_init(&vkms_state->queue_lock);
>  		INIT_WORK(&vkms_state->composer_work, vkms_composer_worker);
> +	}
>  }
> 
>  static const struct drm_crtc_funcs vkms_crtc_funcs = {
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index dd0af086e7fa..9212686ca88a 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -84,6 +84,7 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
>  		struct vkms_crtc_state *vkms_state =
>  			to_vkms_crtc_state(old_crtc_state);
> 
> +		mutex_lock(&vkms_state->queue_lock);
>  		flush_work(&vkms_state->composer_work);
>  	}
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index c7ae6c2ba1df..83767692469a 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -89,6 +89,14 @@ struct vkms_crtc_state {
>  	struct vkms_writeback_job *active_writeback;
>  	struct vkms_color_lut gamma_lut;
> 
> +	/* protects the access to the workqueue
> +	 *
> +	 * we need to hold this lock between flushing the workqueue and
> +	 * destroying the state to avoid work to be queued by the worker
> +	 * thread
> +	 */
> +	struct mutex queue_lock;
> +
>  	/* below four are protected by vkms_output.composer_lock */
>  	bool crc_pending;
>  	bool wb_pending;
> --
> 2.41.0
> 
