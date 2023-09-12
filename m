Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D936479C82C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 09:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0DE10E39E;
	Tue, 12 Sep 2023 07:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543BA10E39C;
 Tue, 12 Sep 2023 07:29:58 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 592926607315;
 Tue, 12 Sep 2023 08:29:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694503796;
 bh=DpKolNldcgJlfpHVvzfjM78q4A9TJEYoCEe0si/xC2Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=B1GMdcIWRuoxHfGwTXDOxDPJHTGuP3GU0g5LEB3y2EsNZOEAVFylHPwM0gL5vUrzO
 PTOJ6sIz3PORk486fk0+tru10BS5lzAt2TxI++7Hmf0Zgg8BbHVHhgcjenJ19KEBvk
 xFBvcpcbbzPDb8g2aVvUStjh7SIDr3M/0+L14N8TXAvIJVSBqbVQc19xFhafzXNbUP
 NeByBzjSJQ8u5d2pTFIhS7n0kB+X90+foJTMl0KBnA4LQz6cup1gKJcufxT7+oL94w
 +snnLNzBo7IvjMZYXjkIFtShQct//eei/yP/3pxQZqjPKJRfYgs2b+bszWooHUbBnv
 xjrI/EhGe/ZLA==
Date: Tue, 12 Sep 2023 09:29:53 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v3 02/13] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
Message-ID: <20230912092953.36a7cdf1@collabora.com>
In-Reply-To: <20230912021615.2086698-3-matthew.brost@intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-3-matthew.brost@intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 luben.tuikov@amd.com, donald.robson@imgtec.com, lina@asahilina.net,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Sep 2023 19:16:04 -0700
Matthew Brost <matthew.brost@intel.com> wrote:

> @@ -1071,6 +1063,7 @@ static int drm_sched_main(void *param)
>   *
>   * @sched: scheduler instance
>   * @ops: backend operations for this scheduler
> + * @submit_wq: workqueue to use for submission. If NULL, the system_wq is used
>   * @hw_submission: number of hw submissions that can be in flight
>   * @hang_limit: number of times to allow a job to hang before dropping it
>   * @timeout: timeout value in jiffies for the scheduler
> @@ -1084,14 +1077,16 @@ static int drm_sched_main(void *param)
>   */
>  int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		   const struct drm_sched_backend_ops *ops,
> +		   struct workqueue_struct *submit_wq,
>  		   unsigned hw_submission, unsigned hang_limit,
>  		   long timeout, struct workqueue_struct *timeout_wq,
>  		   atomic_t *score, const char *name, struct device *dev)
>  {
> -	int i, ret;
> +	int i;
>  	sched->ops = ops;
>  	sched->hw_submission_limit = hw_submission;
>  	sched->name = name;
> +	sched->submit_wq = submit_wq ? : system_wq;

My understanding is that the new design is based on the idea of
splitting the drm_sched_main function into work items that can be
scheduled independently so users/drivers can insert their own
steps/works without requiring changes to drm_sched. This approach is
relying on the properties of ordered workqueues (1 work executed at a
time, FIFO behavior) to guarantee that these steps are still executed
in order, and one at a time.

Given what you're trying to achieve I think we should create an ordered
workqueue instead of using the system_wq when submit_wq is NULL,
otherwise you lose this ordering/serialization guarantee which both
the dedicated kthread and ordered wq provide. It will probably work for
most drivers, but might lead to subtle/hard to spot ordering issues.

>  	sched->timeout = timeout;
>  	sched->timeout_wq = timeout_wq ? : system_wq;
>  	sched->hang_limit = hang_limit;
> @@ -1100,23 +1095,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
>  		drm_sched_rq_init(sched, &sched->sched_rq[i]);
>  
> -	init_waitqueue_head(&sched->wake_up_worker);
>  	init_waitqueue_head(&sched->job_scheduled);
>  	INIT_LIST_HEAD(&sched->pending_list);
>  	spin_lock_init(&sched->job_list_lock);
>  	atomic_set(&sched->hw_rq_count, 0);
>  	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> +	INIT_WORK(&sched->work_submit, drm_sched_main);
>  	atomic_set(&sched->_score, 0);
>  	atomic64_set(&sched->job_id_count, 0);
> -
> -	/* Each scheduler will run on a seperate kernel thread */
> -	sched->thread = kthread_run(drm_sched_main, sched, sched->name);
> -	if (IS_ERR(sched->thread)) {
> -		ret = PTR_ERR(sched->thread);
> -		sched->thread = NULL;
> -		DRM_DEV_ERROR(sched->dev, "Failed to create scheduler for %s.\n", name);
> -		return ret;
> -	}
> +	sched->pause_submit = false;
>  
>  	sched->ready = true;
>  	return 0;
