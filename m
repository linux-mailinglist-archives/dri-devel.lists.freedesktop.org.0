Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BED354C925
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 14:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BF410E650;
	Wed, 15 Jun 2022 12:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6052310E63C;
 Wed, 15 Jun 2022 12:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655297560; x=1686833560;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=d4YTN2oJ2wEg9km7RqOmzcHYPAYIj901Sf+UmvzSgSM=;
 b=ECPB/jcMXPWjRlaW9DgxJL/CtMgboofVvdx2Xu5N8AeGlC7zP4Ym+373
 LkaIRtvYndtUBB1ezsPiwleZ862QkeHiASclv9hR5MdFZT7aVN9rTgDaO
 54owQQJiQnykEG0WsV1nLys059zgJjWTl4GlYmRZCEu9dxsIcit6GXb9T
 oJK5lS/wtkmSZ1KP500/sljScLdB3LmDq56ZKUn0YcYR6YdgcEwC+H7Ce
 U25cEjEfltskv3ltdjnbfYlDTbPGV12ZMO7l9aQKCEoGScmRGbUmLqSWz
 WhhfqCWIzt6pDwOAOn0H8u0ng9cRYSliU/W6sgw8lbS65raCiDSRKW0nd Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="267638923"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="267638923"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 05:52:27 -0700
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="911641796"
Received: from nhanraha-mobl1.ger.corp.intel.com (HELO [10.213.196.47])
 ([10.213.196.47])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 05:52:23 -0700
Message-ID: <fb37c48c-a7a4-2b23-e12e-7e5e194f33ce@linux.intel.com>
Date: Wed, 15 Jun 2022 13:52:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 2/2] drm/msm: Expose client engine utilization via
 fdinfo
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220609174213.2265938-1-robdclark@gmail.com>
 <20220609174213.2265938-2-robdclark@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220609174213.2265938-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Chris Healy <cphealy@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 09/06/2022 18:42, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Similar to AMD commit
> 874442541133 ("drm/amdgpu: Add show_fdinfo() interface"), using the
> infrastructure added in previous patches, we add basic client info
> and GPU engine utilisation for msm.
> 
> Example output:
> 
> 	# cat /proc/`pgrep glmark2`/fdinfo/6
> 	pos:	0
> 	flags:	02400002
> 	mnt_id:	21
> 	ino:	162
> 	drm-driver:	msm
> 	drm-client-id:	7
> 	drm-engine-gpu:	1734371319 ns
> 	drm-cycles-gpu:	1153645024
> 	drm-maxfreq-gpu:	800000000 Hz
> 
> See also: https://patchwork.freedesktop.org/patch/468505/
> 
> v2: Add dev-maxfreq-$engine and update drm-usage-stats.rst
> v3: spelling and compiler warning
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   Documentation/gpu/drm-usage-stats.rst | 21 +++++++++++++++++++++
>   drivers/gpu/drm/msm/msm_drv.c         | 19 ++++++++++++++++++-
>   drivers/gpu/drm/msm/msm_gpu.c         | 21 +++++++++++++++++++--
>   drivers/gpu/drm/msm/msm_gpu.h         | 19 +++++++++++++++++++
>   4 files changed, 77 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index 6c9f166a8d6f..92c5117368d7 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -105,6 +105,27 @@ object belong to this client, in the respective memory region.
>   Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
>   indicating kibi- or mebi-bytes.
>   
> +- drm-cycles-<str> <uint>
> +
> +Engine identifier string must be the same as the one specified in the
> +drm-engine-<str> tag and shall contain the number of busy cycles for the given
> +engine.
> +
> +Values are not required to be constantly monotonic if it makes the driver
> +implementation easier, but are required to catch up with the previously reported
> +larger value within a reasonable period. Upon observing a value lower than what
> +was previously read, userspace is expected to stay with that larger previous
> +value until a monotonic update is seen.
> +
> +- drm-maxfreq-<str> <uint> [Hz|MHz|KHz]

Kilo should be lowercase, I *think*. Simplify and only document Hz?

> +
> +Engine identifier string must be the same as the one specified in the
> +drm-engine-<str> tag and shall contain the maximum frequency for the given
> +engine.  Taken together with drm-cycles-<str>, this can be used to calculate
> +percentage utilization of the engine, whereas drm-engine-<str> only reflects
> +time active without considering what frequency the engine is operating as a
> +percentage of it's maximum frequency.

Slipped my mind to reply to v3..

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

> +
>   ===============================
>   Driver specific implementations
>   ===============================
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 14ab9a627d8b..57a66093e671 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -948,7 +948,24 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
>   	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
>   };
>   
> -DEFINE_DRM_GEM_FOPS(fops);
> +static void msm_fop_show_fdinfo(struct seq_file *m, struct file *f)
> +{
> +	struct drm_file *file = f->private_data;
> +	struct drm_device *dev = file->minor->dev;
> +	struct msm_drm_private *priv = dev->dev_private;
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	if (!priv->gpu)
> +		return;
> +
> +	msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, &p);
> +}
> +
> +static const struct file_operations fops = {
> +	.owner = THIS_MODULE,
> +	DRM_GEM_FOPS,
> +	.show_fdinfo = msm_fop_show_fdinfo,
> +};
>   
>   static const struct drm_driver msm_driver = {
>   	.driver_features    = DRIVER_GEM |
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 244511f85044..f99292eaf529 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -4,6 +4,8 @@
>    * Author: Rob Clark <robdclark@gmail.com>
>    */
>   
> +#include "drm/drm_drv.h"
> +
>   #include "msm_gpu.h"
>   #include "msm_gem.h"
>   #include "msm_mmu.h"
> @@ -146,6 +148,16 @@ int msm_gpu_pm_suspend(struct msm_gpu *gpu)
>   	return 0;
>   }
>   
> +void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_file_private *ctx,
> +			 struct drm_printer *p)
> +{
> +	drm_printf(p, "drm-driver:\t%s\n", gpu->dev->driver->name);
> +	drm_printf(p, "drm-client-id:\t%u\n", ctx->seqno);
> +	drm_printf(p, "drm-engine-gpu:\t%llu ns\n", ctx->elapsed_ns);
> +	drm_printf(p, "drm-cycles-gpu:\t%llu\n", ctx->cycles);
> +	drm_printf(p, "drm-maxfreq-gpu:\t%u Hz\n", gpu->fast_rate);
> +}
> +
>   int msm_gpu_hw_init(struct msm_gpu *gpu)
>   {
>   	int ret;
> @@ -652,7 +664,7 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>   {
>   	int index = submit->seqno % MSM_GPU_SUBMIT_STATS_COUNT;
>   	volatile struct msm_gpu_submit_stats *stats;
> -	u64 elapsed, clock = 0;
> +	u64 elapsed, clock = 0, cycles;
>   	unsigned long flags;
>   
>   	stats = &ring->memptrs->stats[index];
> @@ -660,12 +672,17 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>   	elapsed = (stats->alwayson_end - stats->alwayson_start) * 10000;
>   	do_div(elapsed, 192);
>   
> +	cycles = stats->cpcycles_end - stats->cpcycles_start;
> +
>   	/* Calculate the clock frequency from the number of CP cycles */
>   	if (elapsed) {
> -		clock = (stats->cpcycles_end - stats->cpcycles_start) * 1000;
> +		clock = cycles * 1000;
>   		do_div(clock, elapsed);
>   	}
>   
> +	submit->queue->ctx->elapsed_ns += elapsed;
> +	submit->queue->ctx->cycles     += cycles;
> +
>   	trace_msm_gpu_submit_retired(submit, elapsed, clock,
>   		stats->alwayson_start, stats->alwayson_end);
>   
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 6def00883046..4911943ba53b 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -361,6 +361,22 @@ struct msm_file_private {
>   	/** cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE */
>   	char *cmdline;
>   
> +	/**
> +	 * elapsed:
> +	 *
> +	 * The total (cumulative) elapsed time GPU was busy with rendering
> +	 * from this context in ns.
> +	 */
> +	uint64_t elapsed_ns;
> +
> +	/**
> +	 * cycles:
> +	 *
> +	 * The total (cumulative) GPU cycles elapsed attributed to this
> +	 * context.
> +	 */
> +	uint64_t cycles;
> +
>   	/**
>   	 * entities:
>   	 *
> @@ -544,6 +560,9 @@ static inline void gpu_write64(struct msm_gpu *gpu, u32 lo, u32 hi, u64 val)
>   int msm_gpu_pm_suspend(struct msm_gpu *gpu);
>   int msm_gpu_pm_resume(struct msm_gpu *gpu);
>   
> +void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_file_private *ctx,
> +			 struct drm_printer *p);
> +
>   int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx);
>   struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_file_private *ctx,
>   		u32 id);
