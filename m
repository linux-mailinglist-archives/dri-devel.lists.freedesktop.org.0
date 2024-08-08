Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B26794BACF
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 12:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B470410E6BC;
	Thu,  8 Aug 2024 10:24:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7B84310E6BC
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 10:24:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0CE3FEC;
 Thu,  8 Aug 2024 03:24:26 -0700 (PDT)
Received: from [10.1.26.21] (e122027.cambridge.arm.com [10.1.26.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 415603F766;
 Thu,  8 Aug 2024 03:23:59 -0700 (PDT)
Message-ID: <97edac2e-3a4c-477f-aaa7-9ac66f1f4434@arm.com>
Date: Thu, 8 Aug 2024 11:23:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/panfrost: Handle JD_REQ_CYCLE_COUNT
To: Mary Guillemard <mary.guillemard@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240807160900.149154-1-mary.guillemard@collabora.com>
 <20240807160900.149154-4-mary.guillemard@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240807160900.149154-4-mary.guillemard@collabora.com>
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

On 07/08/2024 17:08, Mary Guillemard wrote:
> If a job requires cycle counters or system timestamps propagation, we
> must enable cycle counting before issuing a job and disable it right
> after the job completes.
> 
> Since this extends the uAPI and because userland needs a way to advertise
> features like VK_KHR_shader_clock conditionally, we bumps the driver
> minor version.
> 
> Signed-off-by: Mary Guillemard <mary.guillemard@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c |  8 ++++++--
>  drivers/gpu/drm/panfrost/panfrost_job.c | 10 ++++++++++
>  2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index d94c9bf5a7f9..fe983defdfdf 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -21,6 +21,8 @@
>  #include "panfrost_gpu.h"
>  #include "panfrost_perfcnt.h"
>  
> +#define JOB_REQUIREMENTS (PANFROST_JD_REQ_FS | PANFROST_JD_REQ_CYCLE_COUNT)
> +
>  static bool unstable_ioctls;
>  module_param_unsafe(unstable_ioctls, bool, 0600);
>  
> @@ -262,7 +264,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>  	if (!args->jc)
>  		return -EINVAL;
>  
> -	if (args->requirements && args->requirements != PANFROST_JD_REQ_FS)
> +	if (args->requirements && args->requirements & ~JOB_REQUIREMENTS)

I think this can be simplified to just:
if (args->requirements & ~JOB_REQUIREMENTS)

>  		return -EINVAL;
>  
>  	if (args->out_sync > 0) {
> @@ -601,6 +603,8 @@ static const struct file_operations panfrost_drm_driver_fops = {
>   * - 1.0 - initial interface
>   * - 1.1 - adds HEAP and NOEXEC flags for CREATE_BO
>   * - 1.2 - adds AFBC_FEATURES query
> + * - 1.3 - adds JD_REQ_CYCLE_COUNT job requirement for SUBMIT
> + *       - adds SYSTEM_TIMESTAMP and SYSTEM_TIMESTAMP_FREQUENCY queries

Obviously needs updating if the first patch is dropped.

>   */
>  static const struct drm_driver panfrost_drm_driver = {
>  	.driver_features	= DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,
> @@ -614,7 +618,7 @@ static const struct drm_driver panfrost_drm_driver = {
>  	.desc			= "panfrost DRM",
>  	.date			= "20180908",
>  	.major			= 1,
> -	.minor			= 2,
> +	.minor			= 3,
>  
>  	.gem_create_object	= panfrost_gem_create_object,
>  	.gem_prime_import_sg_table = panfrost_gem_prime_import_sg_table,
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index df49d37d0e7e..d8c215c0c672 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -159,6 +159,9 @@ panfrost_dequeue_job(struct panfrost_device *pfdev, int slot)
>  	struct panfrost_job *job = pfdev->jobs[slot][0];
>  
>  	WARN_ON(!job);
> +	if (job->requirements & PANFROST_JD_REQ_CYCLE_COUNT)
> +		panfrost_cycle_counter_put(pfdev);
> +
>  	if (job->is_profiled) {
>  		if (job->engine_usage) {
>  			job->engine_usage->elapsed_ns[slot] +=
> @@ -219,6 +222,9 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>  
>  	panfrost_job_write_affinity(pfdev, job->requirements, js);
>  
> +	if (job->requirements & PANFROST_JD_REQ_CYCLE_COUNT)
> +		panfrost_cycle_counter_get(pfdev);
> +
>  	/* start MMU, medium priority, cache clean/flush on end, clean/flush on
>  	 * start */
>  	cfg |= JS_CONFIG_THREAD_PRI(8) |
> @@ -693,8 +699,12 @@ panfrost_reset(struct panfrost_device *pfdev,
>  	spin_lock(&pfdev->js->job_lock);
>  	for (i = 0; i < NUM_JOB_SLOTS; i++) {
>  		for (j = 0; j < ARRAY_SIZE(pfdev->jobs[0]) && pfdev->jobs[i][j]; j++) {
> +			if (pfdev->jobs[i][j]->requirements & PANFROST_JD_REQ_CYCLE_COUNT)
> +				panfrost_cycle_counter_put(pfdev);
> +
>  			if (pfdev->jobs[i][j]->is_profiled)
>  				panfrost_cycle_counter_put(pfdev->jobs[i][j]->pfdev);
> +
>  			pm_runtime_put_noidle(pfdev->dev);
>  			panfrost_devfreq_record_idle(&pfdev->pfdevfreq);
>  		}

This looks correct, but it would be nice to combine the is_profiled and
REQ_CYCLE_COUNT paths. We end up with the odd situation of taking two
reference counts (per job) if global profiling is enabled and the flag
is specified.

To be honest it looks as if there could be a bit of a cleanup by
changing panfrost_reset() to use panfrost_dequeue_job(). I'm not sure
why it was written that way.

Steve

