Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE18909052
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 18:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDFFD10EDE1;
	Fri, 14 Jun 2024 16:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="H/7C8rvu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2EFD10EDE1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 16:33:55 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E9Pxtb032691;
 Fri, 14 Jun 2024 16:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 88n0evhYwd7ZhUmWzomMcXdbspkQkQ2cljNdnrf60qk=; b=H/7C8rvu2XQjrklv
 +SnntuQIc2Plx50u0ozj9S5eD8zR3ZcD88/onuPi/Rz5Pbr8oufDWO177a+YOHm2
 eE1L+4U3ewMSv23LL36FvvAYT5S1dIncmuoXDOYHDIy9Wu6c83vEkduJoo/Qp0GY
 E8sN5CpPBskkB7mV0llapGM7DhngDvtwFYoVXFnqJ0Veow9OZt37S25oONd1lUJa
 A44/ssTVI13aS3hi3rIpTNFHJfliBRoUXYpsFADHEA+kYHbyG/eW/JKE1M6XGCHZ
 zFjzqPfYO90qZprhI6sC5RSx+LfHRM+2cJnYcBdo/qmU33lq/jiH82WqVslcAN3t
 72tQ/w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yr6q2tb1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jun 2024 16:33:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45EGXZRs018205
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jun 2024 16:33:35 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 14 Jun
 2024 09:33:34 -0700
Message-ID: <60d07232-7203-f03f-5e5a-b48f56f377bd@quicinc.com>
Date: Fri, 14 Jun 2024 10:33:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 8/9] accel/rocket: Add job submission IOCTL
Content-Language: en-US
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Joerg Roedel <joro@8bytes.org>, Will
 Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
CC: <iommu@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
 <20240612-6-10-rocket-v1-8-060e48eea250@tomeuvizoso.net>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240612-6-10-rocket-v1-8-060e48eea250@tomeuvizoso.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: zqKGzl0XCrQin-nnNMfWoXZtAlV12YYL
X-Proofpoint-ORIG-GUID: zqKGzl0XCrQin-nnNMfWoXZtAlV12YYL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-14_14,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406140112
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

On 6/12/2024 7:53 AM, Tomeu Vizoso wrote:
> Using the DRM GPU scheduler infrastructure, with a scheduler for each
> core.
> 
> Userspace can decide for a series of tasks to be executed sequentially
> in the same core, so SRAM locality can be taken advantage of.
> 
> The job submission code was intially based on Panfrost.

intially -> initially

> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>   drivers/accel/rocket/Makefile        |   3 +-
>   drivers/accel/rocket/rocket_core.c   |   6 +
>   drivers/accel/rocket/rocket_core.h   |  16 +
>   drivers/accel/rocket/rocket_device.c |   2 +
>   drivers/accel/rocket/rocket_device.h |   2 +
>   drivers/accel/rocket/rocket_drv.c    |  15 +
>   drivers/accel/rocket/rocket_drv.h    |   3 +
>   drivers/accel/rocket/rocket_job.c    | 708 +++++++++++++++++++++++++++++++++++
>   drivers/accel/rocket/rocket_job.h    |  49 +++
>   include/uapi/drm/rocket_accel.h      |  55 +++
>   10 files changed, 858 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/rocket/Makefile b/drivers/accel/rocket/Makefile
> index 875cac2243d9..4d59036af8d9 100644
> --- a/drivers/accel/rocket/Makefile
> +++ b/drivers/accel/rocket/Makefile
> @@ -6,4 +6,5 @@ rocket-y := \
>   	rocket_core.o \
>   	rocket_device.o \
>   	rocket_drv.o \
> -	rocket_gem.o
> +	rocket_gem.o \
> +	rocket_job.o
> diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
> index d6680b00fb2f..2b2d8be38f0a 100644
> --- a/drivers/accel/rocket/rocket_core.c
> +++ b/drivers/accel/rocket/rocket_core.c
> @@ -11,6 +11,7 @@
>   
>   #include "rocket_core.h"
>   #include "rocket_device.h"
> +#include "rocket_job.h"
>   #include "rocket_registers.h"
>   
>   static int rocket_clk_init(struct rocket_core *core)
> @@ -122,6 +123,10 @@ int rocket_core_init(struct rocket_core *core)
>   		goto out_pm_domain;
>   	}
>   
> +	err = rocket_job_init(core);
> +	if (err)
> +		goto out_pm_domain;
> +
>   	version = rocket_read(core, REG_PC_VERSION) + (rocket_read(core, REG_PC_VERSION_NUM) & 0xffff);
>   	dev_info(rdev->dev, "Rockchip NPU core %d version: %d\n", core->index, version);
>   
> @@ -134,6 +139,7 @@ int rocket_core_init(struct rocket_core *core)
>   
>   void rocket_core_fini(struct rocket_core *core)
>   {
> +	rocket_job_fini(core);
>   	rocket_pmdomain_fini(core);
>   }
>   
> diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
> index e5d4c848c9f4..e6401960a9b2 100644
> --- a/drivers/accel/rocket/rocket_core.h
> +++ b/drivers/accel/rocket/rocket_core.h
> @@ -8,6 +8,8 @@
>   #include <asm/io.h>
>   #include <asm-generic/io.h>
>   
> +#include <drm/gpu_scheduler.h>

What about includes for workqueue or atomic?


> +static struct dma_fence *rocket_job_run(struct drm_sched_job *sched_job)
> +{
> +	struct rocket_job *job = to_rocket_job(sched_job);
> +	struct rocket_device *rdev = job->rdev;
> +	struct rocket_core *core = sched_to_core(rdev, sched_job->sched);
> +	struct dma_fence *fence = NULL;
> +	int ret;
> +
> +	if (unlikely(job->base.s_fence->finished.error))
> +		return NULL;
> +
> +	/* Nothing to execute: can happen if the job has finished while
> +	 * we were resetting the GPU.
> +	 */

Not the correct comment style

> +	if (job->next_task_idx == job->task_count)
> +		return NULL;
> +
> +	fence = rocket_fence_create(core);
> +	if (IS_ERR(fence))
> +		return fence;
> +
> +	if (job->done_fence)
> +		dma_fence_put(job->done_fence);
> +	job->done_fence = dma_fence_get(fence);
> +
> +	ret = pm_runtime_get_sync(rdev->dev);
> +	if (ret < 0)
> +		return fence;
> +
> +	spin_lock(&core->job_lock);
> +
> +	core->in_flight_job = job;
> +	rocket_job_hw_submit(core, job);
> +
> +	spin_unlock(&core->job_lock);
> +
> +	return fence;
> +}
> +
> +static void rocket_job_handle_done(struct rocket_core *core,
> +				   struct rocket_job *job)
> +{
> +	if (job->next_task_idx < job->task_count) {
> +		rocket_job_hw_submit(core, job);
> +		return;
> +	}
> +
> +	core->in_flight_job = NULL;
> +	dma_fence_signal_locked(job->done_fence);
> +	pm_runtime_put_autosuspend(core->dev->dev);
> +}
> +
> +static void rocket_job_handle_irq(struct rocket_core *core)
> +{
> +	uint32_t status, raw_status;
> +
> +	pm_runtime_mark_last_busy(core->dev->dev);
> +
> +	status = rocket_read(core, REG_PC_INTERRUPT_STATUS);
> +	raw_status = rocket_read(core, REG_PC_INTERRUPT_RAW_STATUS);
> +
> +	rocket_write(core, REG_PC_OPERATION_ENABLE, 0x0);
> +	rocket_write(core, REG_PC_INTERRUPT_CLEAR, 0x1ffff);
> +
> +	spin_lock(&core->job_lock);
> +
> +	if (core->in_flight_job)
> +		rocket_job_handle_done(core, core->in_flight_job);
> +
> +	spin_unlock(&core->job_lock);
> +}
> +
> +static void
> +rocket_reset(struct rocket_core *core, struct drm_sched_job *bad)
> +{
> +	struct rocket_device *rdev = core->dev;
> +	bool cookie;
> +
> +	if (!atomic_read(&core->reset.pending))
> +		return;
> +
> +	/* Stop the scheduler.

Not the correct comment style

> +	 *
> +	 * FIXME: We temporarily get out of the dma_fence_signalling section
> +	 * because the cleanup path generate lockdep splats when taking locks
> +	 * to release job resources. We should rework the code to follow this
> +	 * pattern:
> +	 *
> +	 *	try_lock
> +	 *	if (locked)
> +	 *		release
> +	 *	else
> +	 *		schedule_work_to_release_later
> +	 */
> +	drm_sched_stop(&core->sched, bad);
> +
> +	cookie = dma_fence_begin_signalling();
> +
> +	if (bad)
> +		drm_sched_increase_karma(bad);
> +
> +	/* Mask job interrupts and synchronize to make sure we won't be
> +	 * interrupted during our reset.
> +	 */

Not the correct comment style, again.  This is the last time I'm going 
to mention it.


> diff --git a/drivers/accel/rocket/rocket_job.h b/drivers/accel/rocket/rocket_job.h
> new file mode 100644
> index 000000000000..0c3c90e47d39
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_job.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright 2024 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +
> +#ifndef __ROCKET_JOB_H__
> +#define __ROCKET_JOB_H__
> +
> +#include <drm/gpu_scheduler.h>
> +#include <drm/drm_drv.h>

Alphabetical order


> diff --git a/include/uapi/drm/rocket_accel.h b/include/uapi/drm/rocket_accel.h
> index 8338726a83c3..888c9413e4cd 100644
> --- a/include/uapi/drm/rocket_accel.h
> +++ b/include/uapi/drm/rocket_accel.h
> @@ -12,8 +12,10 @@ extern "C" {
>   #endif
>   
>   #define DRM_ROCKET_CREATE_BO			0x00
> +#define DRM_ROCKET_SUBMIT			0x01
>   
>   #define DRM_IOCTL_ROCKET_CREATE_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_ROCKET_CREATE_BO, struct drm_rocket_create_bo)
> +#define DRM_IOCTL_ROCKET_SUBMIT			DRM_IOW(DRM_COMMAND_BASE + DRM_ROCKET_SUBMIT, struct drm_rocket_submit)
>   
>   /**
>    * struct drm_rocket_create_bo - ioctl argument for creating Rocket BOs.
> @@ -36,6 +38,59 @@ struct drm_rocket_create_bo {
>   	__u64 offset;
>   };
>   
> +/**
> + * struct drm_rocket_task - A task to be run on the NPU
> + *
> + * A task is the smallest unit of work that can be run on the NPU.
> + */
> +struct drm_rocket_task {
> +       /** DMA address to NPU mapping of register command buffer */
> +       __u64 regcmd;
> +
> +       /** Number of commands in the register command buffer */
> +       __u32 regcmd_count;
> +};
> +
> +/**
> + * struct drm_rocket_job - A job to be run on the NPU
> + *
> + * The kernel will schedule the execution of this job taking into account its
> + * dependencies with other jobs. All tasks in the same job will be executed
> + * sequentially on the same core, to benefit from memory residency in SRAM.
> + */
> +struct drm_rocket_job {
> +       /** Pointer to an array of struct drm_rocket_task. */
> +       __u64 tasks;
> +
> +       /** Number of tasks passed in. */
> +       __u32 task_count;
> +
> +       /** Pointer to a u32 array of the BOs that are read by the job. */
> +       __u64 in_bo_handles;
> +
> +       /** Number of input BO handles passed in (size is that times 4). */
> +       __u32 in_bo_handle_count;
> +
> +       /** Pointer to a u32 array of the BOs that are written to by the job. */
> +       __u64 out_bo_handles;
> +
> +       /** Number of output BO handles passed in (size is that times 4). */
> +       __u32 out_bo_handle_count;
> +};

I feels like the mixing of 32-bit and 64-bit fields violates the 
guidelines on defining ioctls due to implicit padding that might or 
might not be present.

> +
> +/**
> + * struct drm_rocket_submit - ioctl argument for submitting commands to the NPU.
> + *
> + * The kernel will schedule the execution of these jobs in dependency order.
> + */
> +struct drm_rocket_submit {
> +       /** Pointer to an array of struct drm_rocket_job. */
> +       __u64 jobs;
> +
> +       /** Number of jobs passed in. */
> +       __u32 job_count;
> +};
> +
>   #if defined(__cplusplus)
>   }
>   #endif
> 

