Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FFAB40DF0
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 21:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029BD10E034;
	Tue,  2 Sep 2025 19:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lPqQl38A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60EC10E034
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 19:36:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8112A440CE;
 Tue,  2 Sep 2025 19:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFEF9C4CEED;
 Tue,  2 Sep 2025 19:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756841771;
 bh=OWGMbnOMsLhobslV9fuuGOZdGb/bNHz7tP2p4NqInFg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lPqQl38AnJSJcaG/nLFLmlAs/HwHreuLRiPJAIDvwxtHe/95jNLHbSOqlS5VGBoQv
 rxhFuR5wbmUUe6fXzPcBWtX+3QvQOI9vkpNDswzmotWBGavgkNSwT2jkKC+RN46kir
 DvP5qKVANipunvHuwJgqb1nJnmw+n9LaFa6SZCLxi8SyHC1T3LGVS/E9Z3xZVPcvmB
 0CLKPBNDPASS/FkCDrumDX3w6QqlpkcpDJGg1LDK4A2jC9zSvzwZaTlRELDJR+y37a
 CEj11d9gxEdJFmJiQqkvja77gxJcLIo1155SDZXcvKViSMDCniE/gozpQweIP60362
 tky2SNp4gkaIQ==
Message-ID: <c6394a1e-5f89-41eb-b98e-e5b6fccba106@kernel.org>
Date: Tue, 2 Sep 2025 14:36:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] accel/amdxdna: Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, jacek.lawrynowicz@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com,
 maciej.falkowski@linux.intel.com
References: <20250902175034.2056708-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250902175034.2056708-1-lizhi.hou@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/2/2025 12:50 PM, Lizhi Hou wrote:
> Add interface for applications to get information array. The application
> provides a buffer pointer along with information type, maximum number of
> entries and maximum size of each entry. The buffer may also contain match
> conditions based on the information type. After the ioctl completes, the
> actual number of entries and entry size are returned.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> Link: https://lore.kernel.org/r/20250827203031.1512508-1-lizhi.hou@amd.com

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

One nit below, if no other feedback feel free to just incorporate it 
when committing.

> ---
>   drivers/accel/amdxdna/aie2_pci.c        | 116 ++++++++++++++++++------
>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  30 ++++++
>   drivers/accel/amdxdna/amdxdna_pci_drv.h |   1 +
>   include/uapi/drm/amdxdna_accel.h        | 111 +++++++++++++++++++++++
>   4 files changed, 232 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index 7a3449541107..87c425e3d2b9 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -785,11 +785,12 @@ static int aie2_get_clock_metadata(struct amdxdna_client *client,
>   
>   static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
>   {
> -	struct amdxdna_drm_query_hwctx *tmp __free(kfree) = NULL;
> -	struct amdxdna_drm_get_info *get_info_args = arg;
> -	struct amdxdna_drm_query_hwctx __user *buf;
> +	struct amdxdna_drm_hwctx_entry *tmp __free(kfree) = NULL;
> +	struct amdxdna_drm_get_array *array_args = arg;
> +	struct amdxdna_drm_hwctx_entry __user *buf;
> +	u32 size;
>   
> -	if (get_info_args->buffer_size < sizeof(*tmp))
> +	if (!array_args->num_element)
>   		return -EINVAL;
>   
>   	tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
> @@ -802,14 +803,23 @@ static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
>   	tmp->num_col = hwctx->num_col;
>   	tmp->command_submissions = hwctx->priv->seq;
>   	tmp->command_completions = hwctx->priv->completed;
> -
> -	buf = u64_to_user_ptr(get_info_args->buffer);
> -
> -	if (copy_to_user(buf, tmp, sizeof(*tmp)))
> +	tmp->pasid = hwctx->client->pasid;
> +	tmp->priority = hwctx->qos.priority;
> +	tmp->gops = hwctx->qos.gops;
> +	tmp->fps = hwctx->qos.fps;
> +	tmp->dma_bandwidth = hwctx->qos.dma_bandwidth;
> +	tmp->latency = hwctx->qos.latency;
> +	tmp->frame_exec_time = hwctx->qos.frame_exec_time;
> +	tmp->state = AMDXDNA_HWCTX_STATE_ACTIVE;
> +
> +	buf = u64_to_user_ptr(array_args->buffer);
> +	size = min(sizeof(*tmp), array_args->element_size);
> +
> +	if (copy_to_user(buf, tmp, size))
>   		return -EFAULT;
>   
> -	get_info_args->buffer += sizeof(*tmp);
> -	get_info_args->buffer_size -= sizeof(*tmp);
> +	array_args->buffer += size;
> +	array_args->num_element--;
>   
>   	return 0;
>   }
> @@ -817,23 +827,24 @@ static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
>   static int aie2_get_hwctx_status(struct amdxdna_client *client,
>   				 struct amdxdna_drm_get_info *args)
>   {
> +	struct amdxdna_drm_get_array array_args;
>   	struct amdxdna_dev *xdna = client->xdna;
> -	struct amdxdna_drm_get_info info_args;
>   	struct amdxdna_client *tmp_client;
>   	int ret;
>   
>   	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>   
> -	info_args.buffer = args->buffer;
> -	info_args.buffer_size = args->buffer_size;
> -
> +	array_args.element_size = sizeof(struct amdxdna_drm_query_hwctx);
> +	array_args.buffer = args->buffer;
> +	array_args.num_element = args->buffer_size / array_args.element_size;
>   	list_for_each_entry(tmp_client, &xdna->client_list, node) {
> -		ret = amdxdna_hwctx_walk(tmp_client, &info_args, aie2_hwctx_status_cb);
> +		ret = amdxdna_hwctx_walk(tmp_client, &array_args,
> +					 aie2_hwctx_status_cb);
>   		if (ret)
>   			break;
>   	}
>   
> -	args->buffer_size = (u32)(info_args.buffer - args->buffer);
> +	args->buffer_size -= (u32)(array_args.buffer - args->buffer);
>   	return ret;
>   }
>   
> @@ -877,6 +888,58 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
>   	return ret;
>   }
>   
> +static int aie2_query_ctx_status_array(struct amdxdna_client *client,
> +				       struct amdxdna_drm_get_array *args)
> +{
> +	struct amdxdna_drm_get_array array_args;
> +	struct amdxdna_dev *xdna = client->xdna;
> +	struct amdxdna_client *tmp_client;
> +	int ret;
> +
> +	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
> +
> +	array_args.element_size = min(args->element_size,
> +				      sizeof(struct amdxdna_drm_hwctx_entry));
> +	array_args.buffer = args->buffer;
> +	array_args.num_element = args->num_element * args->element_size /
> +				array_args.element_size;
> +	list_for_each_entry(tmp_client, &xdna->client_list, node) {
> +		ret = amdxdna_hwctx_walk(tmp_client, &array_args,
> +					 aie2_hwctx_status_cb);
> +		if (ret)
> +			break;
> +	}
> +
> +	args->element_size = array_args.element_size;
> +	args->num_element = (u32)((array_args.buffer - args->buffer) /
> +				  args->element_size);
> +
> +	return ret;
> +}
> +
> +static int aie2_get_array(struct amdxdna_client *client,
> +			  struct amdxdna_drm_get_array *args)
> +{
> +	struct amdxdna_dev *xdna = client->xdna;
> +	int ret, idx;
> +
> +	if (!drm_dev_enter(&xdna->ddev, &idx))
> +		return -ENODEV;
> +
> +	switch (args->param) {
> +	case DRM_AMDXDNA_HW_CONTEXT_ALL:
> +		ret = aie2_query_ctx_status_array(client, args);
> +		break;
> +	default:
> +		XDNA_ERR(xdna, "Not supported request parameter %u", args->param);
> +		ret = -EOPNOTSUPP;
> +	}
> +	XDNA_DBG(xdna, "Got param %d", args->param);
> +
> +	drm_dev_exit(idx);
> +	return ret;
> +}
> +
>   static int aie2_set_power_mode(struct amdxdna_client *client,
>   			       struct amdxdna_drm_set_state *args)
>   {
> @@ -926,15 +989,16 @@ static int aie2_set_state(struct amdxdna_client *client,
>   }
>   
>   const struct amdxdna_dev_ops aie2_ops = {
> -	.init           = aie2_init,
> -	.fini           = aie2_fini,
> -	.resume         = aie2_hw_resume,
> -	.suspend        = aie2_hw_suspend,
> -	.get_aie_info   = aie2_get_info,
> -	.set_aie_state	= aie2_set_state,
> -	.hwctx_init     = aie2_hwctx_init,
> -	.hwctx_fini     = aie2_hwctx_fini,
> -	.hwctx_config   = aie2_hwctx_config,
> -	.cmd_submit     = aie2_cmd_submit,
> +	.init = aie2_init,
> +	.fini = aie2_fini,
> +	.resume = aie2_hw_resume,
> +	.suspend = aie2_hw_suspend,
> +	.get_aie_info = aie2_get_info,
> +	.set_aie_state = aie2_set_state,
> +	.hwctx_init = aie2_hwctx_init,
> +	.hwctx_fini = aie2_hwctx_fini,
> +	.hwctx_config = aie2_hwctx_config,
> +	.cmd_submit = aie2_cmd_submit,
>   	.hmm_invalidate = aie2_hmm_invalidate,
> +	.get_array = aie2_get_array,
>   };
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index 8ef5e4f27f5e..0a1fd55e745e 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -26,6 +26,13 @@ MODULE_FIRMWARE("amdnpu/17f0_10/npu.sbin");
>   MODULE_FIRMWARE("amdnpu/17f0_11/npu.sbin");
>   MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
>   
> +/*
> + * 0.0: Initial version
> + * 0.1: Support getting all hardware contexts by DRM_IOCTL_AMDXDNA_GET_ARRAY
> + */
> +#define AMDXDNA_DRIVER_MAJOR		0
> +#define AMDXDNA_DRIVER_MINOR		1
> +
>   /*
>    * Bind the driver base on (vendor_id, device_id) pair and later use the
>    * (device_id, rev_id) pair as a key to select the devices. The devices with
> @@ -164,6 +171,26 @@ static int amdxdna_drm_get_info_ioctl(struct drm_device *dev, void *data, struct
>   	return ret;
>   }
>   
> +static int amdxdna_drm_get_array_ioctl(struct drm_device *dev, void *data,
> +				       struct drm_file *filp)
> +{
> +	struct amdxdna_client *client = filp->driver_priv;
> +	struct amdxdna_dev *xdna = to_xdna_dev(dev);
> +	struct amdxdna_drm_get_array *args = data;
> +	int ret;
> +
> +	if (!xdna->dev_info->ops->get_array)
> +		return -EOPNOTSUPP;
> +
> +	if (args->pad || !args->num_element || !args->element_size)
> +		return -EINVAL;
> +
> +	mutex_lock(&xdna->dev_lock);
> +	ret = xdna->dev_info->ops->get_array(client, args);
> +	mutex_unlock(&xdna->dev_lock);

This could be a

guard(mutex)(&xdna->dev_lock);

return xdna->dev_info->ops->get_array(client, args);

Which lets you drop the ret variable.

> +	return ret;
> +}
> +
>   static int amdxdna_drm_set_state_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>   {
>   	struct amdxdna_client *client = filp->driver_priv;
> @@ -195,6 +222,7 @@ static const struct drm_ioctl_desc amdxdna_drm_ioctls[] = {
>   	DRM_IOCTL_DEF_DRV(AMDXDNA_EXEC_CMD, amdxdna_drm_submit_cmd_ioctl, 0),
>   	/* AIE hardware */
>   	DRM_IOCTL_DEF_DRV(AMDXDNA_GET_INFO, amdxdna_drm_get_info_ioctl, 0),
> +	DRM_IOCTL_DEF_DRV(AMDXDNA_GET_ARRAY, amdxdna_drm_get_array_ioctl, 0),
>   	DRM_IOCTL_DEF_DRV(AMDXDNA_SET_STATE, amdxdna_drm_set_state_ioctl, DRM_ROOT_ONLY),
>   };
>   
> @@ -218,6 +246,8 @@ const struct drm_driver amdxdna_drm_drv = {
>   	.fops = &amdxdna_fops,
>   	.name = "amdxdna_accel_driver",
>   	.desc = "AMD XDNA DRM implementation",
> +	.major = AMDXDNA_DRIVER_MAJOR,
> +	.minor = AMDXDNA_DRIVER_MINOR,
>   	.open = amdxdna_drm_open,
>   	.postclose = amdxdna_drm_close,
>   	.ioctls = amdxdna_drm_ioctls,
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
> index b6b3b424d1d5..72d6696d49da 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
> @@ -58,6 +58,7 @@ struct amdxdna_dev_ops {
>   	int (*cmd_submit)(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
>   	int (*get_aie_info)(struct amdxdna_client *client, struct amdxdna_drm_get_info *args);
>   	int (*set_aie_state)(struct amdxdna_client *client, struct amdxdna_drm_set_state *args);
> +	int (*get_array)(struct amdxdna_client *client, struct amdxdna_drm_get_array *args);
>   };
>   
>   /*
> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
> index ce523e9ccc52..a1fb9785db77 100644
> --- a/include/uapi/drm/amdxdna_accel.h
> +++ b/include/uapi/drm/amdxdna_accel.h
> @@ -34,6 +34,7 @@ enum amdxdna_drm_ioctl_id {
>   	DRM_AMDXDNA_EXEC_CMD,
>   	DRM_AMDXDNA_GET_INFO,
>   	DRM_AMDXDNA_SET_STATE,
> +	DRM_AMDXDNA_GET_ARRAY = 10,
>   };
>   
>   /**
> @@ -455,6 +456,112 @@ struct amdxdna_drm_get_info {
>   	__u64 buffer; /* in/out */
>   };
>   
> +#define AMDXDNA_HWCTX_STATE_IDLE	0
> +#define AMDXDNA_HWCTX_STATE_ACTIVE	1
> +
> +/**
> + * struct amdxdna_drm_hwctx_entry - The hardware context array entry
> + */
> +struct amdxdna_drm_hwctx_entry {
> +	/** @context_id: Context ID. */
> +	__u32 context_id;
> +	/** @start_col: Start AIE array column assigned to context. */
> +	__u32 start_col;
> +	/** @num_col: Number of AIE array columns assigned to context. */
> +	__u32 num_col;
> +	/** @hwctx_id: The real hardware context id. */
> +	__u32 hwctx_id;
> +	/** @pid: ID of process which created this context. */
> +	__s64 pid;
> +	/** @command_submissions: Number of commands submitted. */
> +	__u64 command_submissions;
> +	/** @command_completions: Number of commands completed. */
> +	__u64 command_completions;
> +	/** @migrations: Number of times been migrated. */
> +	__u64 migrations;
> +	/** @preemptions: Number of times been preempted. */
> +	__u64 preemptions;
> +	/** @errors: Number of errors happened. */
> +	__u64 errors;
> +	/** @priority: Context priority. */
> +	__u64 priority;
> +	/** @heap_usage: Usage of device heap buffer. */
> +	__u64 heap_usage;
> +	/** @suspensions: Number of times been suspended. */
> +	__u64 suspensions;
> +	/**
> +	 * @state: Context state.
> +	 * %AMDXDNA_HWCTX_STATE_IDLE
> +	 * %AMDXDNA_HWCTX_STATE_ACTIVE
> +	 */
> +	__u32 state;
> +	/** @pasid: PASID been bound. */
> +	__u32 pasid;
> +	/** @gops: Giga operations per second. */
> +	__u32 gops;
> +	/** @fps: Frames per second. */
> +	__u32 fps;
> +	/** @dma_bandwidth: DMA bandwidth. */
> +	__u32 dma_bandwidth;
> +	/** @latency: Frame response latency. */
> +	__u32 latency;
> +	/** @frame_exec_time: Frame execution time. */
> +	__u32 frame_exec_time;
> +	/** @txn_op_idx: Index of last control code executed. */
> +	__u32 txn_op_idx;
> +	/** @ctx_pc: Program counter. */
> +	__u32 ctx_pc;
> +	/** @fatal_error_type: Fatal error type if context crashes. */
> +	__u32 fatal_error_type;
> +	/** @fatal_error_exception_type: Firmware exception type. */
> +	__u32 fatal_error_exception_type;
> +	/** @fatal_error_exception_pc: Firmware exception program counter. */
> +	__u32 fatal_error_exception_pc;
> +	/** @fatal_error_app_module: Exception module name. */
> +	__u32 fatal_error_app_module;
> +	/** @pad: Structure pad. */
> +	__u32 pad;
> +};
> +
> +#define DRM_AMDXDNA_HW_CONTEXT_ALL	0
> +
> +/**
> + * struct amdxdna_drm_get_array - Get information array.
> + */
> +struct amdxdna_drm_get_array {
> +	/**
> +	 * @param:
> +	 *
> +	 * Supported params:
> +	 *
> +	 * %DRM_AMDXDNA_HW_CONTEXT_ALL:
> +	 * Returns all created hardware contexts.
> +	 */
> +	__u32 param;
> +	/**
> +	 * @element_size:
> +	 *
> +	 * Specifies maximum element size and returns the actual element size.
> +	 */
> +	__u32 element_size;
> +	/**
> +	 * @num_element:
> +	 *
> +	 * Specifies maximum number of elements and returns the actual number
> +	 * of elements.
> +	 */
> +	__u32 num_element; /* in/out */
> +	/** @pad: MBZ */
> +	__u32 pad;
> +	/**
> +	 * @buffer:
> +	 *
> +	 * Specifies the match conditions and returns the matched information
> +	 * array.
> +	 */
> +	__u64 buffer;
> +};
> +
>   enum amdxdna_drm_set_param {
>   	DRM_AMDXDNA_SET_POWER_MODE,
>   	DRM_AMDXDNA_WRITE_AIE_MEM,
> @@ -519,6 +626,10 @@ struct amdxdna_drm_set_power_mode {
>   	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_SET_STATE, \
>   		 struct amdxdna_drm_set_state)
>   
> +#define DRM_IOCTL_AMDXDNA_GET_ARRAY \
> +	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_GET_ARRAY, \
> +		 struct amdxdna_drm_get_array)
> +
>   #if defined(__cplusplus)
>   } /* extern c end */
>   #endif

