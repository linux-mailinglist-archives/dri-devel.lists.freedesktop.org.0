Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3B9811078
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 12:47:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EF710E77C;
	Wed, 13 Dec 2023 11:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E634710E77C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 11:47:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61FC6C15;
 Wed, 13 Dec 2023 03:48:20 -0800 (PST)
Received: from [10.57.86.164] (unknown [10.57.86.164])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A02563F738;
 Wed, 13 Dec 2023 03:47:31 -0800 (PST)
Message-ID: <d851e98e-3c51-4459-bbb3-3c917d567ab7@arm.com>
Date: Wed, 13 Dec 2023 11:47:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/14] drm/panthor: Add the driver frontend block
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-12-boris.brezillon@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20231204173313.2098733-12-boris.brezillon@collabora.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Grant Likely <grant.likely@linaro.org>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/12/2023 17:33, Boris Brezillon wrote:
> This is the last piece missing to expose the driver to the outside
> world.
> 
> This is basically a wrapper between the ioctls and the other logical
> blocks.
> 
> v3:
> - Add acks for the MIT/GPL2 relicensing
> - Fix 32-bit support
> - Account for panthor_vm and panthor_sched changes
> - Simplify the resv preparation/update logic
> - Use a linked list rather than xarray for list of signals.
> - Simplify panthor_get_uobj_array by returning the newly allocated
>   array.
> - Drop the "DOC" for job submission helpers and move the relevant
>   comments to panthor_ioctl_group_submit().
> - Add helpers sync_op_is_signal()/sync_op_is_wait().
> - Simplify return type of panthor_submit_ctx_add_sync_signal() and
>   panthor_submit_ctx_get_sync_signal().
> - Drop WARN_ON from panthor_submit_ctx_add_job().
> - Fix typos in comments.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Acked-by: Steven Price <steven.price@arm.com> # MIT+GPL2 relicensing,Arm
> Acked-by: Grant Likely <grant.likely@linaro.org> # MIT+GPL2 relicensing,Linaro
> Acked-by: Boris Brezillon <boris.brezillon@collabora.com> # MIT+GPL2 relicensing,Collabora

A typo and I think the cleanup in panthor_init() is backwards, but with
that fixed:

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 1454 +++++++++++++++++++++++++
>  1 file changed, 1454 insertions(+)
>  create mode 100644 drivers/gpu/drm/panthor/panthor_drv.c
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> new file mode 100644
> index 000000000000..9447a4e90018
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c

<snip>

> +
> +/**
> + * panthor_submit_ctx_push_jobs() - Push jobs to their scheduling entities.
> + * @ctx: Submit context.
> + * @upd_resvs: Callback used to update reservation objects that were previously
> + * preapred.

NIT: s/preapred/prepared/

> + */
> +static void
> +panthor_submit_ctx_push_jobs(struct panthor_submit_ctx *ctx,
> +			     void (*upd_resvs)(struct drm_exec *, struct drm_sched_job *))
> +{
> +	for (u32 i = 0; i < ctx->job_count; i++) {
> +		upd_resvs(&ctx->exec, ctx->jobs[i].job);
> +		drm_sched_entity_push_job(ctx->jobs[i].job);
> +
> +		/* Job is owned by the scheduler now. */
> +		ctx->jobs[i].job = NULL;
> +	}
> +
> +	panthor_submit_ctx_push_fences(ctx);
> +}
> +

<snip>

> +/*
> + * Workqueue used to cleanup stuff.
> + *
> + * We create a dedicated workqueue so we can drain on unplug and
> + * make sure all resources are freed before the module is unloaded.
> + */
> +struct workqueue_struct *panthor_cleanup_wq;
> +
> +static int __init panthor_init(void)
> +{
> +	int ret;
> +
> +	ret = panthor_mmu_pt_cache_init();
> +	if (ret)
> +		return ret;
> +
> +	panthor_cleanup_wq = alloc_workqueue("panthor-cleanup", WQ_UNBOUND, 0);
> +	if (!panthor_cleanup_wq) {
> +		pr_err("panthor: Failed to allocate the workqueues");
> +		ret = -ENOMEM;
> +		goto err_mmu_pt_cache_fini;
> +	}
> +
> +	ret = platform_driver_register(&panthor_driver);
> +	if (ret)
> +		goto err_destroy_cleanup_wq;

Here we skip the call to panthor_mmu_pt_cache_fini() which doesn't look
right. I think the cleanup below is just backwards.

Steve

> +
> +	return ret;
> +
> +err_mmu_pt_cache_fini:
> +	panthor_mmu_pt_cache_fini();
> +
> +err_destroy_cleanup_wq:
> +	destroy_workqueue(panthor_cleanup_wq);
> +	return ret;
> +}
> +module_init(panthor_init);
> +
> +static void __exit panthor_exit(void)
> +{
> +	platform_driver_unregister(&panthor_driver);
> +	destroy_workqueue(panthor_cleanup_wq);
> +	panthor_mmu_pt_cache_fini();
> +}
> +module_exit(panthor_exit);
> +
> +MODULE_AUTHOR("Panthor Project Developers");
> +MODULE_DESCRIPTION("Panthor DRM Driver");
> +MODULE_LICENSE("Dual MIT/GPL");

