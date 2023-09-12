Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E6F79CE45
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 12:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B4210E1D1;
	Tue, 12 Sep 2023 10:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB9510E063;
 Tue, 12 Sep 2023 10:28:33 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1E8F86607105;
 Tue, 12 Sep 2023 11:28:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694514511;
 bh=UgYPP9zQ5Fvg0GR8tIU560xJ4J0z+vDtAwq+1x/dvRU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cDT5h0F74yLt2n1zsk2B/kwJj1Kj7f56JOjG1Q4PqCNOr8wRuLx3odk+eJX7YZkKm
 7eO6VFs9OZHJSGpt5urAkRepVD9VMEU5WfPr96kQco7UzhX0MTMu+ip+O9W8z9mgXs
 3zFMRca5wkB9JMQYG0jBQyP6evFmSXfKLphQF7sNK5L+PzH4HAUopxwCpJBC7P5BTI
 8jxe+GeUnxO4TCnIfAvp57vL3asrmKUeabMJF3UI6KEt4TnEnvdx3g7lpkjPwZpT7N
 vnpRSIJPdYmJ04veCUk/M3eVp0y39DPLYmMWgMeqfNxRM6/btouvsB3jxfYcQIOCh4
 Bnd5wekOCSu0A==
Date: Tue, 12 Sep 2023 12:28:28 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v3 11/13] drm/sched: Waiting for pending jobs to
 complete in scheduler kill
Message-ID: <20230912122828.548f6365@collabora.com>
In-Reply-To: <20230912021615.2086698-12-matthew.brost@intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-12-matthew.brost@intel.com>
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

On Mon, 11 Sep 2023 19:16:13 -0700
Matthew Brost <matthew.brost@intel.com> wrote:

> +void drm_sched_add_pending_job(struct drm_sched_job *job, bool tail)
> +{
> +	struct drm_gpu_scheduler *sched = job->sched;
> +	struct drm_sched_entity *entity = job->entity;

drm_sched_entity_pop_job() sets job->entity to NULL [1], and I end with
a NULL deref in this function. I guess you have another patch in your
tree dropping this job->entity = NULL in drm_sched_entity_pop_job(),
but given this comment [1], it's probably not the right thing to do.

> +
> +	lockdep_assert_held(&sched->job_list_lock);
> +
> +	if (tail)
> +		list_add_tail(&job->list, &sched->pending_list);
> +	else
> +		list_add(&job->list, &sched->pending_list);
> +	if (!entity->pending_job_count++)
> +		reinit_completion(&entity->jobs_done);
> +}
> +EXPORT_SYMBOL(drm_sched_add_pending_job);

[1]https://elixir.bootlin.com/linux/v6.6-rc1/source/drivers/gpu/drm/scheduler/sched_entity.c#L497
