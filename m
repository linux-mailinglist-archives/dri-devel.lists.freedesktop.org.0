Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 300989534E9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 16:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71C110E44D;
	Thu, 15 Aug 2024 14:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0421710E44D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 14:31:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A07D216F3;
 Thu, 15 Aug 2024 07:32:07 -0700 (PDT)
Received: from [10.1.36.19] (e122027.cambridge.arm.com [10.1.36.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7DF63F58B;
 Thu, 15 Aug 2024 07:31:39 -0700 (PDT)
Message-ID: <f89178c5-81f6-460c-8bb8-56ba83461f8e@arm.com>
Date: Thu, 15 Aug 2024 15:31:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/panfrost: Add cycle counter job requirement
To: Mary Guillemard <mary.guillemard@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240814112121.61137-2-mary.guillemard@collabora.com>
 <20240814112121.61137-4-mary.guillemard@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240814112121.61137-4-mary.guillemard@collabora.com>
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

On 14/08/2024 12:21, Mary Guillemard wrote:
> Extend the uAPI with a new job requirement flag for cycle
> counters. This requirement is used by userland to indicate that a job
> requires cycle counters or system timestamp to be propagated. (for use
> with write value timestamp jobs)
> 
> We cannot enable cycle counters unconditionally as this would result in
> an increase of GPU power consumption. As a result, they should be left
> off unless required by the application.
> 
> If a job requires cycle counters or system timestamps propagation, we
> must enable cycle counting before issuing a job and disable it right
> after the job completes.
> 
> Since this extends the uAPI and because userland needs a way to advertise
> features like VK_KHR_shader_clock conditionally, we bumps the driver
> minor version.
> 
> v2:
> - Rework commit message
> - Squash uAPI changes and implementation in this commit
> - Simplify changes based on Steven Price comments
> 
> Signed-off-by: Mary Guillemard <mary.guillemard@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,
Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c |  8 +++++--
>  drivers/gpu/drm/panfrost/panfrost_job.c | 28 +++++++++++++++----------
>  include/uapi/drm/panfrost_drm.h         |  1 +
>  3 files changed, 24 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 83696d06d697..07a09f32c32e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -25,6 +25,8 @@
>  #include "panfrost_gpu.h"
>  #include "panfrost_perfcnt.h"
>  
> +#define JOB_REQUIREMENTS (PANFROST_JD_REQ_FS | PANFROST_JD_REQ_CYCLE_COUNT)
> +
>  static bool unstable_ioctls;
>  module_param_unsafe(unstable_ioctls, bool, 0600);
>  
> @@ -280,7 +282,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>  	if (!args->jc)
>  		return -EINVAL;
>  
> -	if (args->requirements && args->requirements != PANFROST_JD_REQ_FS)
> +	if (args->requirements & ~JOB_REQUIREMENTS)
>  		return -EINVAL;
>  
>  	if (args->out_sync > 0) {
> @@ -619,6 +621,8 @@ static const struct file_operations panfrost_drm_driver_fops = {
>   * - 1.0 - initial interface
>   * - 1.1 - adds HEAP and NOEXEC flags for CREATE_BO
>   * - 1.2 - adds AFBC_FEATURES query
> + * - 1.3 - adds JD_REQ_CYCLE_COUNT job requirement for SUBMIT
> + *       - adds SYSTEM_TIMESTAMP and SYSTEM_TIMESTAMP_FREQUENCY queries
>   */
>  static const struct drm_driver panfrost_drm_driver = {
>  	.driver_features	= DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,
> @@ -632,7 +636,7 @@ static const struct drm_driver panfrost_drm_driver = {
>  	.desc			= "panfrost DRM",
>  	.date			= "20180908",
>  	.major			= 1,
> -	.minor			= 2,
> +	.minor			= 3,
>  
>  	.gem_create_object	= panfrost_gem_create_object,
>  	.gem_prime_import_sg_table = panfrost_gem_prime_import_sg_table,
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index df49d37d0e7e..e5e62ee356ef 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -159,16 +159,17 @@ panfrost_dequeue_job(struct panfrost_device *pfdev, int slot)
>  	struct panfrost_job *job = pfdev->jobs[slot][0];
>  
>  	WARN_ON(!job);
> -	if (job->is_profiled) {
> -		if (job->engine_usage) {
> -			job->engine_usage->elapsed_ns[slot] +=
> -				ktime_to_ns(ktime_sub(ktime_get(), job->start_time));
> -			job->engine_usage->cycles[slot] +=
> -				panfrost_cycle_counter_read(pfdev) - job->start_cycles;
> -		}
> -		panfrost_cycle_counter_put(job->pfdev);
> +
> +	if (job->is_profiled && job->engine_usage) {
> +		job->engine_usage->elapsed_ns[slot] +=
> +			ktime_to_ns(ktime_sub(ktime_get(), job->start_time));
> +		job->engine_usage->cycles[slot] +=
> +			panfrost_cycle_counter_read(pfdev) - job->start_cycles;
>  	}
>  
> +	if (job->requirements & PANFROST_JD_REQ_CYCLE_COUNT || job->is_profiled)
> +		panfrost_cycle_counter_put(pfdev);
> +
>  	pfdev->jobs[slot][0] = pfdev->jobs[slot][1];
>  	pfdev->jobs[slot][1] = NULL;
>  
> @@ -243,9 +244,13 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>  	subslot = panfrost_enqueue_job(pfdev, js, job);
>  	/* Don't queue the job if a reset is in progress */
>  	if (!atomic_read(&pfdev->reset.pending)) {
> -		if (pfdev->profile_mode) {
> +		job->is_profiled = pfdev->profile_mode;
> +
> +		if (job->requirements & PANFROST_JD_REQ_CYCLE_COUNT ||
> +		    job->is_profiled)
>  			panfrost_cycle_counter_get(pfdev);
> -			job->is_profiled = true;
> +
> +		if (job->is_profiled) {
>  			job->start_time = ktime_get();
>  			job->start_cycles = panfrost_cycle_counter_read(pfdev);
>  		}
> @@ -693,7 +698,8 @@ panfrost_reset(struct panfrost_device *pfdev,
>  	spin_lock(&pfdev->js->job_lock);
>  	for (i = 0; i < NUM_JOB_SLOTS; i++) {
>  		for (j = 0; j < ARRAY_SIZE(pfdev->jobs[0]) && pfdev->jobs[i][j]; j++) {
> -			if (pfdev->jobs[i][j]->is_profiled)
> +			if (pfdev->jobs[i][j]->requirements & PANFROST_JD_REQ_CYCLE_COUNT ||
> +				pfdev->jobs[i][j]->is_profiled)
>  				panfrost_cycle_counter_put(pfdev->jobs[i][j]->pfdev);
>  			pm_runtime_put_noidle(pfdev->dev);
>  			panfrost_devfreq_record_idle(&pfdev->pfdevfreq);
> diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
> index 52b050e2b660..568724be6628 100644
> --- a/include/uapi/drm/panfrost_drm.h
> +++ b/include/uapi/drm/panfrost_drm.h
> @@ -40,6 +40,7 @@ extern "C" {
>  #define DRM_IOCTL_PANFROST_PERFCNT_DUMP		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_PERFCNT_DUMP, struct drm_panfrost_perfcnt_dump)
>  
>  #define PANFROST_JD_REQ_FS (1 << 0)
> +#define PANFROST_JD_REQ_CYCLE_COUNT (1 << 1)
>  /**
>   * struct drm_panfrost_submit - ioctl argument for submitting commands to the 3D
>   * engine.

