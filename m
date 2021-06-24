Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 766B33B3162
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 16:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06E96EC09;
	Thu, 24 Jun 2021 14:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3DC5F6EC09;
 Thu, 24 Jun 2021 14:32:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6223CED1;
 Thu, 24 Jun 2021 07:32:13 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9A8A3F718;
 Thu, 24 Jun 2021 07:32:07 -0700 (PDT)
Subject: Re: [PATCH 01/11] drm/sched: Split drm_sched_job_init
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
 <20210624140025.438303-2-daniel.vetter@ffwll.ch>
From: Steven Price <steven.price@arm.com>
Message-ID: <22cb9d54-bf8a-57d7-452d-565d4886cad0@arm.com>
Date: Thu, 24 Jun 2021 15:32:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624140025.438303-2-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
Cc: Adam Borowski <kilobyte@angband.pl>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sonny Jiang <sonny.jiang@amd.com>,
 Nirmoy Das <nirmoy.das@amd.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Lee Jones <lee.jones@linaro.org>, Jack Zhang <Jack.Zhang1@amd.com>,
 lima@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Dave Airlie <airlied@redhat.com>,
 Dennis Li <Dennis.Li@amd.com>, Chen Li <chenli@uniontech.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Kees Cook <keescook@chromium.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>, etnaviv@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Nick Terrell <terrelln@fb.com>,
 Deepak R Varma <mh12gx2825@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu <yuq825@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 linux-media@vger.kernel.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/06/2021 15:00, Daniel Vetter wrote:
> This is a very confusingly named function, because not just does it
> init an object, it arms it and provides a point of no return for
> pushing a job into the scheduler. It would be nice if that's a bit
> clearer in the interface.
> 
> But the real reason is that I want to push the dependency tracking
> helpers into the scheduler code, and that means drm_sched_job_init
> must be called a lot earlier, without arming the job.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: Qiang Yu <yuq825@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Adam Borowski <kilobyte@angband.pl>
> Cc: Nick Terrell <terrelln@fb.com>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Paul Menzel <pmenzel@molgen.mpg.de>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Nirmoy Das <nirmoy.das@amd.com>
> Cc: Deepak R Varma <mh12gx2825@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Kevin Wang <kevin1.wang@amd.com>
> Cc: Chen Li <chenli@uniontech.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: "Marek Olšák" <marek.olsak@amd.com>
> Cc: Dennis Li <Dennis.Li@amd.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Cc: Sonny Jiang <sonny.jiang@amd.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Tian Tao <tiantao6@hisilicon.com>
> Cc: Jack Zhang <Jack.Zhang1@amd.com>
> Cc: etnaviv@lists.freedesktop.org
> Cc: lima@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>  .gitignore                               |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 ++
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 ++
>  drivers/gpu/drm/lima/lima_sched.c        |  2 ++
>  drivers/gpu/drm/panfrost/panfrost_job.c  |  2 ++
>  drivers/gpu/drm/scheduler/sched_entity.c |  6 +++---
>  drivers/gpu/drm/scheduler/sched_fence.c  | 15 ++++++++++-----
>  drivers/gpu/drm/scheduler/sched_main.c   | 23 ++++++++++++++++++++++-
>  include/drm/gpu_scheduler.h              |  6 +++++-
>  10 files changed, 51 insertions(+), 10 deletions(-)
> 
> diff --git a/.gitignore b/.gitignore
> index 7afd412dadd2..52433a930299 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -66,6 +66,7 @@ modules.order
>  /modules.builtin
>  /modules.builtin.modinfo
>  /modules.nsdeps
> +*.builtin

I don't think this belongs in this patch!

[...]
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index beb62c8fc851..1e950534b9b0 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -244,6 +244,8 @@ int panfrost_job_push(struct panfrost_job *job)
>  		goto unlock;
>  	}
>  
> +	drm_sched_job_arm(&job->base);
> +
>  	job->render_done_fence = dma_fence_get(&job->base.s_fence->finished);
>  
>  	ret = panfrost_acquire_object_fences(job->bos, job->bo_count,

Acked-by: Steven Price <steven.price@arm.com>
