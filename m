Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 840DF9CDE30
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 13:23:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65AB110E2BC;
	Fri, 15 Nov 2024 12:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7C40610E2BC
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 12:23:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 868771476;
 Fri, 15 Nov 2024 04:23:49 -0800 (PST)
Received: from [10.57.67.79] (unknown [10.57.67.79])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E32A73F6A8;
 Fri, 15 Nov 2024 04:23:13 -0800 (PST)
Message-ID: <ac489a34-08c6-4454-9e94-16a0bb3d18ad@arm.com>
Date: Fri, 15 Nov 2024 12:23:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] drm/sched: store the drm client_id in
 drm_sched_fence
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com, ltuikov89@gmail.com,
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 rostedt@goodmis.org, l.stach@pengutronix.de, matt.coster@imgtec.com,
 frank.binns@imgtec.com, yuq825@gmail.com, robdclark@gmail.com,
 kherbst@redhat.com, lyude@redhat.com, boris.brezillon@collabora.com,
 mwen@igalia.com, mcanal@igalia.com, thomas.hellstrom@linux.intel.com,
 tvrtko.ursulin@igalia.com
References: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
 <20241114100113.150647-3-pierre-eric.pelloux-prayer@amd.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241114100113.150647-3-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/11/2024 10:01, Pierre-Eric Pelloux-Prayer wrote:
> This will be used in a later commit to trace the drm client_id in
> some of the gpu_scheduler trace events.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c   |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c       |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c      |  8 +++++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.h      |  3 ++-
>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  2 +-
>  drivers/gpu/drm/imagination/pvr_job.c        |  2 +-
>  drivers/gpu/drm/imagination/pvr_queue.c      |  5 +++--
>  drivers/gpu/drm/imagination/pvr_queue.h      |  2 +-
>  drivers/gpu/drm/lima/lima_gem.c              |  2 +-
>  drivers/gpu/drm/lima/lima_sched.c            |  6 ++++--
>  drivers/gpu/drm/lima/lima_sched.h            |  3 ++-
>  drivers/gpu/drm/msm/msm_gem_submit.c         |  8 +++++---
>  drivers/gpu/drm/nouveau/nouveau_sched.c      |  3 ++-
>  drivers/gpu/drm/panfrost/panfrost_drv.c      |  2 +-
>  drivers/gpu/drm/scheduler/sched_fence.c      |  4 +++-
>  drivers/gpu/drm/scheduler/sched_main.c       |  6 ++++--
>  drivers/gpu/drm/v3d/v3d_submit.c             |  2 +-
>  drivers/gpu/drm/xe/xe_sched_job.c            |  3 ++-
>  include/drm/gpu_scheduler.h                  | 12 ++++++++++--
>  19 files changed, 51 insertions(+), 27 deletions(-)

panthor appears to be missing from this list and it has two calls to
drm_sched_job_init().

I haven't checked if there any others missing.

Steve

