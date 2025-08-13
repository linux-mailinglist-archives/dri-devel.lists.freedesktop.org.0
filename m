Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E05EBB249FB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 14:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E28510E70A;
	Wed, 13 Aug 2025 12:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="batDg6bZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B9A10E70A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 12:58:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DB044A57CDA;
 Wed, 13 Aug 2025 12:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D2BC4CEEB;
 Wed, 13 Aug 2025 12:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755089929;
 bh=RkV4BeWFbdxMx75LQHna92WI+HaPKkvSdiwARMtLxig=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=batDg6bZttXznkMLUheH+SDQRcG2HSzhJ8UNOxc1aKM5VzP9TCS5rjJlclqHJPLTC
 8PnkuJAd7ZumcpWcNGTCl72GoleiGzeiZcVEB4tk4GqoTLW4GwfSMwVca7JrEQIJZY
 RZMDXsA+D3ab7O9N6Ent0wYMiHTTevZ3yQ6DX3X5FTa2HnBYtArOT+s7wto06u0EGt
 jBkiPzJ72cZIkIW/cEGu0rgEbjANrdw2efoc656292Xr/XBLPiH0j1f8Fz9jPwEBIg
 E21HTdDGp5Q/FBX+QgyDazLvqUCGAWVbbtlGvu5XLmAewD3Y39TuiQsuNWzEm+3T3q
 gTVOG5Oa0mqEg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Aug 2025 14:58:45 +0200
Message-Id: <DC1BGCY1JPKJ.7BHDGBYZDYMZ@kernel.org>
Subject: Re: [PATCH v2] drm/sched: Document race condition in drm_sched_fini()
Cc: "Matthew Brost" <matthew.brost@intel.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "James
 Flowers" <bold.zone2373@fastmail.com>
To: "Philipp Stanner" <phasta@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250813085654.102504-2-phasta@kernel.org>
In-Reply-To: <20250813085654.102504-2-phasta@kernel.org>
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

On Wed Aug 13, 2025 at 10:56 AM CEST, Philipp Stanner wrote:
> In drm_sched_fini() all entities are marked as stopped - without taking
> the appropriate lock, because that would deadlock. That means that
> drm_sched_fini() and drm_sched_entity_push_job() can race against each
> other.
>
> This should most likely be fixed by establishing the rule that all
> entities associated with a scheduler must be torn down first. Then,
> however, the locking should be removed from drm_sched_fini() alltogether
> with an appropriate comment.
>
> Reported-by: James Flowers <bold.zone2373@fastmail.com>
> Link: https://lore.kernel.org/dri-devel/20250720235748.2798-1-bold.zone23=
73@fastmail.com/
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> Changes in v2:
>   - Fix typo.
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 5a550fd76bf0..46119aacb809 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1424,6 +1424,22 @@ void drm_sched_fini(struct drm_gpu_scheduler *sche=
d)
>  			 * Prevents reinsertion and marks job_queue as idle,
>  			 * it will be removed from the rq in drm_sched_entity_fini()
>  			 * eventually
> +			 *
> +			 * FIXME:
> +			 * This lacks the proper spin_lock(&s_entity->lock) and
> +			 * is, therefore, a race condition. Most notably, it
> +			 * can race with drm_sched_entity_push_job(). The lock
> +			 * cannot be taken here, however, because this would
> +			 * lead to lock inversion -> deadlock.
> +			 *
> +			 * The best solution probably is to enforce the life
> +			 * time rule of all entities having to be torn down
> +			 * before their scheduler. Then, however, locking could
> +			 * be dropped alltogether from this function.

"Enforce the rule" is correct, since factually it's there, as a dependency =
in
the code.

Do we know which drivers violate this lifetime rule?

@Christian: What about amdgpu (for which the below was added to begin with)=
?

> +			 * For now, this remains a potential race in all
> +			 * drivers that keep entities alive for longer than
> +			 * the scheduler.
>  			 */
>  			s_entity->stopped =3D true;
>  		spin_unlock(&rq->lock);
> --=20
> 2.49.0

