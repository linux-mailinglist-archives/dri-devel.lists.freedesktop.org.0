Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC479787B2
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 20:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3990710ED6C;
	Fri, 13 Sep 2024 18:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dHWlAC08";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E1B10ED6C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 18:18:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 522B45C572B;
 Fri, 13 Sep 2024 18:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC182C4CEC0;
 Fri, 13 Sep 2024 18:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726251517;
 bh=HbiNcPk5QOKYwQlU2DOcnIYYD6j9FJIwflxJ5rbaxnc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dHWlAC08xQHiGnVx9lq3sIuhGq9uK5g4RFqACFDpRNaLjDxFzPuGZ7Fz/NczpdgOQ
 5j1Eqp4Gz/De5X5hHoJYr4LbG0bYZefSRYUcx53B7LSlvMlRVMy+If8THEqhqSS+Tm
 fh3jJ5X/lwq0Ss+EjtV7+68hYVzMSibORbBDmUAWr8yBdrfHNofurRV+/qxu6yAp5+
 2FZ1AVM5gZ+KIzmWJzRvhEN/gohLEIBF0sfNH0sG9fgx1L01QfYC5QPNDAyJumwMHv
 gWatB51LAbQiDNdbWDPdssbYD+ZwssYyZxPL/ndA57IKiMiwFATDJxfedLY49ndIFt
 7a22vcyzcjokA==
Date: Fri, 13 Sep 2024 20:18:29 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Asahi Lina <lina@asahilina.net>, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Danilo Krummrich <dakr@redhat.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/sched: Fix dynamic job-flow control race
Message-ID: <ZuSB9UzlHLKEnag3@pollux>
References: <20240913165326.8856-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913165326.8856-1-robdclark@gmail.com>
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

On Fri, Sep 13, 2024 at 09:53:25AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Fixes a race condition reported here: https://github.com/AsahiLinux/linux/issues/309#issuecomment-2238968609

Good catch! Please add a 'Closes' tag with this link.

> 
> The whole premise of lockless access to a single-producer-single-
> consumer queue is that there is just a single producer and single
> consumer.  That means we can't call drm_sched_can_queue() (which is
> about queueing more work to the hw, not to the spsc queue) from
> anywhere other than the consumer (wq).
> 
> This call in the producer is just an optimization to avoid scheduling
> the consuming worker if it cannot yet queue more work to the hw.  It
> is safe to drop this optimization to avoid the race condition.
> 
> Suggested-by: Asahi Lina <lina@asahilina.net>
> Fixes: a78422e9dff3 ("drm/sched: implement dynamic job-flow control")

You may want to explicitly CC stable.

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index ab53ab486fe6..1af1dbe757d5 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1020,8 +1020,7 @@ EXPORT_SYMBOL(drm_sched_job_cleanup);
>  void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
>  		      struct drm_sched_entity *entity)

Please also remove the entity parameter. For the other refactoring, I agree it
should be in a different patch.

With that,

Reviewed-by: Danilo Krummrich <dakr@kernel.org>

Thanks for fixing this.

- Danilo

>  {
> -	if (drm_sched_can_queue(sched, entity))
> -		drm_sched_run_job_queue(sched);
> +	drm_sched_run_job_queue(sched);
>  }
>  
>  /**
> -- 
> 2.46.0
> 
