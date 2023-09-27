Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DF57AFC20
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 09:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FBC10E3B1;
	Wed, 27 Sep 2023 07:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871BE10E399;
 Wed, 27 Sep 2023 07:33:36 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 626846607324;
 Wed, 27 Sep 2023 08:33:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695800014;
 bh=juDUK3jJUc4wubW8k3FIzeLI9eMgHeRSXCAudoYytV0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gT4IOxdPFEVROkTE64vxjdRfdXWQ07CFIzhLO5TyHTvK0+Ipog0orAYSqhyLqvXMb
 W1XdYopm4rYER6Wt7RveDCkkIs4lHJBH2K6WmV6X8/gAVlpJaT4GajhUe/ZzQEw9AQ
 PeLpQYizMjllHvGJn7kifbN8gWZknO0jp2ZeqOR8GyNMUqlblKtHhiTbxgMtyv4iyZ
 ckyS3Z0zi+e7kTt1fXYWFj/s6KcNsPJL8U0b6/thWiV14FmFSMfOzTPnho5D4NG3Ix
 H6i0bbZ/kSIfzeY2Qrw3KXBugQvKsXpAuBaUgwBT5k8ONHMesDCEK91Q1D4wtRxXVA
 gOm0FoMXYHW1g==
Date: Wed, 27 Sep 2023 09:33:31 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v4 00/10] DRM scheduler changes for Xe
Message-ID: <20230927093331.0a416646@collabora.com>
In-Reply-To: <20230919050155.2647172-1-matthew.brost@intel.com>
References: <20230919050155.2647172-1-matthew.brost@intel.com>
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
 luben.tuikov@amd.com, dakr@redhat.com, donald.robson@imgtec.com,
 lina@asahilina.net, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 Sep 2023 22:01:45 -0700
Matthew Brost <matthew.brost@intel.com> wrote:

> As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
> have been asked to merge our common DRM scheduler patches first.
> 
> This a continuation of a RFC [3] with all comments addressed, ready for
> a full review, and hopefully in state which can merged in the near
> future. More details of this series can found in the cover letter of the
> RFC [3].
> 
> These changes have been tested with the Xe driver.
> 
> v2:
>  - Break run job, free job, and process message in own work items
>  - This might break other drivers as run job and free job now can run in
>    parallel, can fix up if needed
> 
> v3:
>  - Include missing patch 'drm/sched: Add drm_sched_submit_* helpers'
>  - Fix issue with setting timestamp to early
>  - Don't dequeue jobs for single entity after calling entity fini
>  - Flush pending jobs on entity fini
>  - Add documentation for entity teardown
>  - Add Matthew Brost to maintainers of DRM scheduler
> 
> v4:
>  - Drop message interface
>  - Drop 'Flush pending jobs on entity fini'
>  - Drop 'Add documentation for entity teardown'
>  - Address all feedback
> 
> Matt
> 
> Matthew Brost (10):
>   drm/sched: Add drm_sched_submit_* helpers
>   drm/sched: Convert drm scheduler to use a work queue rather than
>     kthread
>   drm/sched: Move schedule policy to scheduler
>   drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
>   drm/sched: Split free_job into own work item
>   drm/sched: Add drm_sched_start_timeout_unlocked helper
>   drm/sched: Start submission before TDR in drm_sched_start
>   drm/sched: Submit job before starting TDR
>   drm/sched: Add helper to queue TDR immediately for current and future
>     jobs
>   drm/sched: Update maintainers of GPU scheduler

Tested-by: Boris Brezillon <boris.brezillon@collabora.com>

> 
>  MAINTAINERS                                   |   1 +
>  .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  15 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  15 +-
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c       |   5 +-
>  drivers/gpu/drm/lima/lima_sched.c             |   5 +-
>  drivers/gpu/drm/msm/adreno/adreno_device.c    |   6 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.c          |   5 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c       |   5 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c       |   5 +-
>  drivers/gpu/drm/scheduler/sched_entity.c      |  85 ++-
>  drivers/gpu/drm/scheduler/sched_fence.c       |   2 +-
>  drivers/gpu/drm/scheduler/sched_main.c        | 491 ++++++++++++------
>  drivers/gpu/drm/v3d/v3d_sched.c               |  25 +-
>  include/drm/gpu_scheduler.h                   |  48 +-
>  15 files changed, 495 insertions(+), 220 deletions(-)
> 

