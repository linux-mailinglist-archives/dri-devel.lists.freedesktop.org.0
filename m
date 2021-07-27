Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 948573D7497
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 13:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F316E867;
	Tue, 27 Jul 2021 11:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7AE6E85E;
 Tue, 27 Jul 2021 11:51:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbrezillon) with ESMTPSA id 21CF11F43020
Date: Tue, 27 Jul 2021 13:51:10 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v4 00/18] drm/sched dependency tracking and dma-resv fixes
Message-ID: <20210727135110.420edb3d@collabora.com>
In-Reply-To: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 12 Jul 2021 19:53:34 +0200
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> Hi all,
> 
> Quick new version since the previous one was a bit too broken:
> - dropped the bug-on patch to avoid breaking amdgpu's gpu reset failure
>   games
> - another attempt at splitting job_init/arm, hopefully we're getting
>   there.
> 
> Note that Christian has brought up a bikeshed on the new functions to add
> dependencies to drm_sched_jobs. I'm happy to repaint, if there's some kind
> of consensus on what it should be.
> 
> Testing and review very much welcome, as usual.
> 
> Cheers, Daniel
> 
> Daniel Vetter (18):
>   drm/sched: Split drm_sched_job_init
>   drm/sched: Barriers are needed for entity->last_scheduled
>   drm/sched: Add dependency tracking
>   drm/sched: drop entity parameter from drm_sched_push_job
>   drm/sched: improve docs around drm_sched_entity

Patches 1, 3, 4 and 5 are

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

>   drm/panfrost: use scheduler dependency tracking
>   drm/lima: use scheduler dependency tracking
>   drm/v3d: Move drm_sched_job_init to v3d_job_init
>   drm/v3d: Use scheduler dependency handling
>   drm/etnaviv: Use scheduler dependency handling
>   drm/gem: Delete gem array fencing helpers
>   drm/sched: Don't store self-dependencies
>   drm/sched: Check locking in drm_sched_job_await_implicit
>   drm/msm: Don't break exclusive fence ordering
>   drm/etnaviv: Don't break exclusive fence ordering
>   drm/i915: delete exclude argument from i915_sw_fence_await_reservation
>   drm/i915: Don't break exclusive fence ordering
>   dma-resv: Give the docs a do-over
> 
>  Documentation/gpu/drm-mm.rst                  |   3 +
>  drivers/dma-buf/dma-resv.c                    |  24 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   4 +-
>  drivers/gpu/drm/drm_gem.c                     |  96 ---------
>  drivers/gpu/drm/etnaviv/etnaviv_gem.h         |   5 +-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |  64 +++---
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c       |  65 +-----
>  drivers/gpu/drm/etnaviv/etnaviv_sched.h       |   3 +-
>  drivers/gpu/drm/i915/display/intel_display.c  |   4 +-
>  drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |   2 +-
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   8 +-
>  drivers/gpu/drm/i915/i915_sw_fence.c          |   6 +-
>  drivers/gpu/drm/i915/i915_sw_fence.h          |   1 -
>  drivers/gpu/drm/lima/lima_gem.c               |   7 +-
>  drivers/gpu/drm/lima/lima_sched.c             |  28 +--
>  drivers/gpu/drm/lima/lima_sched.h             |   6 +-
>  drivers/gpu/drm/msm/msm_gem_submit.c          |   3 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |  16 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c       |  39 +---
>  drivers/gpu/drm/panfrost/panfrost_job.h       |   5 +-
>  drivers/gpu/drm/scheduler/sched_entity.c      | 140 +++++++------
>  drivers/gpu/drm/scheduler/sched_fence.c       |  19 +-
>  drivers/gpu/drm/scheduler/sched_main.c        | 181 +++++++++++++++--
>  drivers/gpu/drm/v3d/v3d_drv.h                 |   6 +-
>  drivers/gpu/drm/v3d/v3d_gem.c                 | 115 +++++------
>  drivers/gpu/drm/v3d/v3d_sched.c               |  44 +----
>  include/drm/drm_gem.h                         |   5 -
>  include/drm/gpu_scheduler.h                   | 186 ++++++++++++++----
>  include/linux/dma-buf.h                       |   7 +
>  include/linux/dma-resv.h                      | 104 +++++++++-
>  31 files changed, 672 insertions(+), 528 deletions(-)
> 

