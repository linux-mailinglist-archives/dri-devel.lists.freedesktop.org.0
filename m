Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B3D7D915C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 10:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9472210E140;
	Fri, 27 Oct 2023 08:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B239E10E140
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 08:25:22 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 83E6166072FC;
 Fri, 27 Oct 2023 09:25:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698395121;
 bh=pwSE8EySk274RE11EYBjl8fVybeDlHkijimBPoX3cjA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IWAlPYFeBQ7DoPJeMmsiL1pjhb2Lgk7i5Q/XZ13JyZhfayXGrnrvNveK4Pr6Ab3gT
 aSGTs6JoGHIEn6cC31nST/oVcKdK+q09LeY+3blChLsUn7QBtPlVA63z8ud7M8cm3N
 uLuIxuD9L71GCnXhXrX8k8HIVpbujOzTCqV5/Y9G5KjcC/5MCh1w4no1ipgYDak4Sz
 U6ImevqRFMao63ITp4MP8Zy5a4Kth8xWzMerfOmug9SXBUbzpUuKKaA62nwwZO6fg9
 f8+Q/av2Kf+/BuKnV3LqAMH6L8zDpaLE+bEcy9GzkT5uyuO7auNMY+upOxidOCKunE
 40yemLwyFNK5A==
Date: Fri, 27 Oct 2023 10:25:16 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v3] drm/sched: implement dynamic job-flow
 control
Message-ID: <20231027102516.0e4b00ef@collabora.com>
In-Reply-To: <20231026161431.5934-1-dakr@redhat.com>
References: <20231026161431.5934-1-dakr@redhat.com>
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
Cc: matthew.brost@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, faith@gfxstrand.net, luben.tuikov@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

On Thu, 26 Oct 2023 18:13:00 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> Currently, job flow control is implemented simply by limiting the number
> of jobs in flight. Therefore, a scheduler is initialized with a credit
> limit that corresponds to the number of jobs which can be sent to the
> hardware.
> 
> This implies that for each job, drivers need to account for the maximum
> job size possible in order to not overflow the ring buffer.
> 
> However, there are drivers, such as Nouveau, where the job size has a
> rather large range. For such drivers it can easily happen that job
> submissions not even filling the ring by 1% can block subsequent
> submissions, which, in the worst case, can lead to the ring run dry.
> 
> In order to overcome this issue, allow for tracking the actual job size
> instead of the number of jobs. Therefore, add a field to track a job's
> credit count, which represents the number of credits a job contributes
> to the scheduler's credit limit.
> 
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
> Changes in V2:
> ==============
>   - fixed up influence on scheduling fairness due to consideration of a job's
>     size
>     - If we reach a ready entity in drm_sched_select_entity() but can't actually
>       queue a job from it due to size limitations, just give up and go to sleep
>       until woken up due to a pending job finishing, rather than continue to try
>       other entities.
>   - added a callback to dynamically update a job's credits (Boris)

This callback seems controversial. I'd suggest dropping it, so the
patch can be merged.

Regards,

Boris

>   - renamed 'units' to 'credits'
>   - fixed commit message and comments as requested by Luben
> 
> Changes in V3:
> ==============
>   - rebased onto V7 of the "DRM scheduler changes for Xe" series by Matt
>   - move up drm_sched_can_queue() instead of adding a forward declaration
>     (Boris)
>   - add a drm_sched_available_credits() helper (Boris)
>   - adjust control flow in drm_sched_rq_select_entity_fifo() to Luben's proposal
>   - re-phrase a few comments and fix a typo (Luben)
>   - change naming of all structures credit fields and function parameters to the
>     following scheme
>     - drm_sched_job::credits
>     - drm_gpu_scheduler::credit_limit
>     - drm_gpu_scheduler::credit_count
>     - drm_sched_init(..., u32 credit_limit, ...)
>     - drm_sched_job_init(..., u32 credits, ...)
>   - add proper documentation for the scheduler's job-flow control mechanism
