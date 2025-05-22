Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D6CAC0BD2
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 14:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594B310E12D;
	Thu, 22 May 2025 12:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QMug1+j4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44EE10E12D;
 Thu, 22 May 2025 12:44:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DB1CDA4E607;
 Thu, 22 May 2025 12:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B69F0C4CEE4;
 Thu, 22 May 2025 12:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747917854;
 bh=Yz2UtYWagsYaY4eenVbgXf3j+TpwLLfD5UbOHYYkLHY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QMug1+j4WVW/bFSxZ/rczepIXSyBsMR5lldov6EkiJxyN74GeBMAtBrP+5UjORdCZ
 Y6LTM/GgBy86Tk0DmxeDjhSsL6z6wER5jJBXmmUXVJiptm46dJfnaNzE+UcPxG/RCd
 eXTmTJ/+jlvqWOxLRTkUhpp/nnhRxSN1VqD4ZI9OL5whAJA1yOUUXoQNlpxTX/xAS7
 R9hKl4o+yV2puLAWxbT1dn6FIiStrM1o0ixu4l+/esP5Hg9KpZ8svGdCS96lOjmVKY
 /utjd0IRngjXfSOvodkKfNLCaJcqVnm1rBdWRopfOAo9da3QHrEYlLMTYPMJ4QNxY/
 AcSDh2UJeGyuA==
Date: Thu, 22 May 2025 14:44:08 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: Re: [PATCH v3 1/5] drm/sched: Fix teardown leaks with waitqueue
Message-ID: <aC8cGPx_m8g2ApcV@pollux>
References: <20250522082742.148191-2-phasta@kernel.org>
 <20250522082742.148191-3-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522082742.148191-3-phasta@kernel.org>
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

On Thu, May 22, 2025 at 10:27:39AM +0200, Philipp Stanner wrote:
> +/**
> + * drm_sched_submission_and_timeout_stop - stop everything except for free_job
> + * @sched: scheduler instance
> + *
> + * Helper for tearing down the scheduler in drm_sched_fini().
> + */
> +static void
> +drm_sched_submission_and_timeout_stop(struct drm_gpu_scheduler *sched)
> +{
> +	WRITE_ONCE(sched->pause_submit, true);
> +	cancel_work_sync(&sched->work_run_job);
> +	cancel_delayed_work_sync(&sched->work_tdr);
> +}
> +
> +/**
> + * drm_sched_free_stop - stop free_job
> + * @sched: scheduler instance
> + *
> + * Helper for tearing down the scheduler in drm_sched_fini().
> + */
> +static void drm_sched_free_stop(struct drm_gpu_scheduler *sched)
> +{
> +	WRITE_ONCE(sched->pause_free, true);
> +	cancel_work_sync(&sched->work_free_job);
> +}
> +
> +/**
> + * drm_sched_no_jobs_pending - check whether jobs are pending
> + * @sched: scheduler instance
> + *
> + * Checks if jobs are pending for @sched.
> + *
> + * Return: true if jobs are pending, false otherwise.
> + */
> +static bool drm_sched_no_jobs_pending(struct drm_gpu_scheduler *sched)
> +{
> +	bool empty;
> +
> +	spin_lock(&sched->job_list_lock);
> +	empty = list_empty(&sched->pending_list);
> +	spin_unlock(&sched->job_list_lock);
> +
> +	return empty;
> +}

I understand that the way you use this function is correct, since you only call
it *after* drm_sched_submission_and_timeout_stop(), which means that no new
items can end up on the pending_list.

But if we look at this function without context, it's broken:

The documentation says "Return: true if jobs are pending, false otherwise.", but
you can't guarantee that, since a new job could be added to the pending_list
after spin_unlock().

Hence, providing this function is a footgun.

Instead, you should put this teardown sequence in a single function, where you
can control the external conditions, i.e. that
drm_sched_submission_and_timeout_stop() has been called.

Please also add a comment explaining why we can release the lock and still work
with the value returned by list_empty() in this case, i.e. because we guarantee
that the list item count converges against zero.

The other two helpers above, drm_sched_submission_and_timeout_stop() and
drm_sched_free_stop() should be fine to have.

> +/**
> + * drm_sched_cancel_jobs_and_wait - trigger freeing of all pending jobs
> + * @sched: scheduler instance
> + *
> + * Must only be called if &struct drm_sched_backend_ops.cancel_pending_fences is
> + * implemented.
> + *
> + * Instructs the driver to kill the fence context associated with this scheduler,
> + * thereby signaling all pending fences. This, in turn, will trigger
> + * &struct drm_sched_backend_ops.free_job to be called for all pending jobs.
> + * The function then blocks until all pending jobs have been freed.
> + */
> +static void drm_sched_cancel_jobs_and_wait(struct drm_gpu_scheduler *sched)
> +{
> +	sched->ops->cancel_pending_fences(sched);
> +	wait_event(sched->pending_list_waitque, drm_sched_no_jobs_pending(sched));
> +}

Same here, you can't have this as an isolated helper.
