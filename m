Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A934EC31D03
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 16:22:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684BD10E627;
	Tue,  4 Nov 2025 15:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tEEeNnVC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC05810E627
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 15:22:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7EF2441923;
 Tue,  4 Nov 2025 15:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9891C4CEF7;
 Tue,  4 Nov 2025 15:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762269767;
 bh=27SuaKpaPZKd5XsEVGamE+pD9+NPtMUdRKnisMJj5K4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tEEeNnVC4FaxssJ6mxYd/su+6STKA0Qkk0r9nOUsxgTPpVWku8jIQNn/V+QsNOWA0
 mcmWHx2eEWKoDifVrxZ/IMQ4ZcvBbQb0TzZmProEU80snz1xIt7519653nat67LSje
 v4NDkxl1Djnjqp+Vl0pNvzGkJPMOrKX9wjGQroFcAtAHcs2lhb+U7hi/Tmt0cipbNT
 O6UcVzHEat0K5C4x8L5quo/iZokx9yNH/d7BXG3qcqlSDAwIP9uM6aLfJUdnI/i+gL
 SpoIJUilr7S7f05g7w8c8FukCAseI+FR2ma7qkJo5rMZviWhAH56XgU7C0FANlm6i5
 e6ii0V/Tz7nLg==
Message-ID: <66e33b64-e8d7-4fe3-a72b-059a11061b21@kernel.org>
Date: Tue, 4 Nov 2025 09:22:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] accel/amdxdna: Add IOCTL parameter for telemetry data
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251104062546.833771-1-lizhi.hou@amd.com>
 <20251104062546.833771-3-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20251104062546.833771-3-lizhi.hou@amd.com>
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

On 11/4/25 12:25 AM, Lizhi Hou wrote:
> Extend DRM_IOCTL_AMDXDNA_GET_INFO to include additional parameters
> that allow collection of telemetry data.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
>   drivers/accel/amdxdna/aie2_message.c          | 56 ++++++++++++--
>   drivers/accel/amdxdna/aie2_msg_priv.h         | 25 ++++++-
>   drivers/accel/amdxdna/aie2_pci.c              | 73 +++++++++++++++++++
>   drivers/accel/amdxdna/aie2_pci.h              |  3 +
>   .../accel/amdxdna/amdxdna_mailbox_helper.h    |  6 +-
>   drivers/accel/amdxdna/amdxdna_pci_drv.c       |  3 +-
>   include/uapi/drm/amdxdna_accel.h              | 17 +++++
>   7 files changed, 173 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index 39214253d804..69cdce9ff208 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -47,7 +47,7 @@ static int aie2_send_mgmt_msg_wait(struct amdxdna_dev_hdl *ndev,
>   		ndev->mgmt_chann = NULL;
>   	}
>   
> -	if (!ret && *hdl->data != AIE2_STATUS_SUCCESS) {
> +	if (!ret && *hdl->status != AIE2_STATUS_SUCCESS) {
>   		XDNA_ERR(xdna, "command opcode 0x%x failed, status 0x%x",
>   			 msg->opcode, *hdl->data);
>   		ret = -EINVAL;
> @@ -336,11 +336,6 @@ int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
>   		goto fail;
>   	}
>   
> -	if (resp.status != AIE2_STATUS_SUCCESS) {
> -		XDNA_ERR(xdna, "Query NPU status failed, status 0x%x", resp.status);
> -		ret = -EINVAL;
> -		goto fail;
> -	}
>   	XDNA_DBG(xdna, "Query NPU status completed");
>   
>   	if (size < resp.size) {
> @@ -362,6 +357,55 @@ int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
>   	return ret;
>   }
>   
> +int aie2_query_telemetry(struct amdxdna_dev_hdl *ndev,
> +			 char __user *buf, u32 size,
> +			 struct amdxdna_drm_query_telemetry_header *header)
> +{
> +	DECLARE_AIE2_MSG(get_telemetry, MSG_OP_GET_TELEMETRY);
> +	struct amdxdna_dev *xdna = ndev->xdna;
> +	dma_addr_t dma_addr;
> +	u8 *addr;
> +	int ret;
> +
> +	if (header->type >= MAX_TELEMETRY_TYPE)
> +		return -EINVAL;
> +
> +	addr = dma_alloc_noncoherent(xdna->ddev.dev, size, &dma_addr,
> +				     DMA_FROM_DEVICE, GFP_KERNEL);
> +	if (!addr)
> +		return -ENOMEM;
> +
> +	req.buf_addr = dma_addr;
> +	req.buf_size = size;
> +	req.type = header->type;
> +
> +	drm_clflush_virt_range(addr, size); /* device can access */
> +	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
> +	if (ret) {
> +		XDNA_ERR(xdna, "Query telemetry failed, status %d", ret);
> +		goto free_buf;
> +	}
> +
> +	if (size < resp.size) {
> +		ret = -EINVAL;
> +		XDNA_ERR(xdna, "Bad buffer size. Available: %u. Needs: %u", size, resp.size);
> +		goto free_buf;
> +	}
> +
> +	if (copy_to_user(buf, addr, resp.size)) {
> +		ret = -EFAULT;
> +		XDNA_ERR(xdna, "Failed to copy telemetry to user space");
> +		goto free_buf;
> +	}
> +
> +	header->major = resp.major;
> +	header->minor = resp.minor;
> +
> +free_buf:
> +	dma_free_noncoherent(xdna->ddev.dev, size, addr, dma_addr, DMA_FROM_DEVICE);
> +	return ret;
> +}
> +
>   int aie2_register_asyn_event_msg(struct amdxdna_dev_hdl *ndev, dma_addr_t addr, u32 size,
>   				 void *handle, int (*cb)(void*, void __iomem *, size_t))
>   {
> diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h b/drivers/accel/amdxdna/aie2_msg_priv.h
> index 945140011763..947daa63f064 100644
> --- a/drivers/accel/amdxdna/aie2_msg_priv.h
> +++ b/drivers/accel/amdxdna/aie2_msg_priv.h
> @@ -9,7 +9,8 @@
>   enum aie2_msg_opcode {
>   	MSG_OP_CREATE_CONTEXT              = 0x2,
>   	MSG_OP_DESTROY_CONTEXT             = 0x3,
> -	MSG_OP_SYNC_BO			   = 0x7,
> +	MSG_OP_GET_TELEMETRY               = 0x4,
> +	MSG_OP_SYNC_BO                     = 0x7,
>   	MSG_OP_EXECUTE_BUFFER_CF           = 0xC,
>   	MSG_OP_QUERY_COL_STATUS            = 0xD,
>   	MSG_OP_QUERY_AIE_TILE_INFO         = 0xE,
> @@ -137,6 +138,28 @@ struct destroy_ctx_resp {
>   	enum aie2_msg_status	status;
>   } __packed;
>   
> +enum telemetry_type {
> +	TELEMETRY_TYPE_DISABLED,
> +	TELEMETRY_TYPE_HEALTH,
> +	TELEMETRY_TYPE_ERROR_INFO,
> +	TELEMETRY_TYPE_PROFILING,
> +	TELEMETRY_TYPE_DEBUG,
> +	MAX_TELEMETRY_TYPE
> +};
> +
> +struct get_telemetry_req {
> +	enum telemetry_type	type;
> +	__u64	buf_addr;
> +	__u32	buf_size;
> +} __packed;
> +
> +struct get_telemetry_resp {
> +	__u32	major;
> +	__u32	minor;
> +	__u32	size;
> +	enum aie2_msg_status	status;
> +} __packed;
> +
>   struct execute_buffer_req {
>   	__u32	cu_idx;
>   	__u32	payload[19];
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index 396dc6e06007..d7ccbdaf47f5 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -862,6 +862,76 @@ static int aie2_query_resource_info(struct amdxdna_client *client,
>   	return 0;
>   }
>   
> +static int aie2_fill_hwctx_map(struct amdxdna_hwctx *hwctx, void *arg)
> +{
> +	struct amdxdna_dev *xdna = hwctx->client->xdna;
> +	u32 *map = arg;
> +
> +	if (hwctx->fw_ctx_id >= xdna->dev_handle->priv->hwctx_limit) {
> +		XDNA_ERR(xdna, "Invalid fw ctx id %d/%d ", hwctx->fw_ctx_id,
> +			 xdna->dev_handle->priv->hwctx_limit);
> +		return -EINVAL;
> +	}
> +
> +	map[hwctx->fw_ctx_id] = hwctx->id;
> +	return 0;
> +}
> +
> +static int aie2_get_telemetry(struct amdxdna_client *client,
> +			      struct amdxdna_drm_get_info *args)
> +{
> +	struct amdxdna_drm_query_telemetry_header *header __free(kfree) = NULL;
> +	u32 telemetry_data_sz, header_sz, elem_num;
> +	struct amdxdna_dev *xdna = client->xdna;
> +	struct amdxdna_client *tmp_client;
> +	int ret;
> +
> +	elem_num = xdna->dev_handle->priv->hwctx_limit;
> +	header_sz = struct_size(header, map, elem_num);
> +	if (args->buffer_size <= header_sz) {
> +		XDNA_ERR(xdna, "Invalid buffer size");
> +		return -EINVAL;
> +	}
> +
> +	telemetry_data_sz = args->buffer_size - header_sz;
> +	if (telemetry_data_sz > SZ_4M) {
> +		XDNA_ERR(xdna, "Buffer size is too big, %d", telemetry_data_sz);
> +		return -EINVAL;
> +	}
> +
> +	header = kzalloc(header_sz, GFP_KERNEL);
> +	if (!header)
> +		return -ENOMEM;
> +
> +	if (copy_from_user(header, u64_to_user_ptr(args->buffer), sizeof(*header))) {
> +		XDNA_ERR(xdna, "Failed to copy telemetry header from user");
> +		return -EFAULT;
> +	}
> +
> +	header->map_num_elements = elem_num;
> +	list_for_each_entry(tmp_client, &xdna->client_list, node) {
> +		ret = amdxdna_hwctx_walk(tmp_client, &header->map,
> +					 aie2_fill_hwctx_map);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = aie2_query_telemetry(xdna->dev_handle,
> +				   u64_to_user_ptr(args->buffer + header_sz),
> +				   telemetry_data_sz, header);
> +	if (ret) {
> +		XDNA_ERR(xdna, "Query telemetry failed ret %d", ret);
> +		return ret;
> +	}
> +
> +	if (copy_to_user(u64_to_user_ptr(args->buffer), header, header_sz)) {
> +		XDNA_ERR(xdna, "Copy header failed");
> +		return -EFAULT;
> +	}
> +
> +	return 0;
> +}
> +
>   static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_info *args)
>   {
>   	struct amdxdna_dev *xdna = client->xdna;
> @@ -896,6 +966,9 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
>   	case DRM_AMDXDNA_GET_POWER_MODE:
>   		ret = aie2_get_power_mode(client, args);
>   		break;
> +	case DRM_AMDXDNA_QUERY_TELEMETRY:
> +		ret = aie2_get_telemetry(client, args);
> +		break;
>   	case DRM_AMDXDNA_QUERY_RESOURCE_INFO:
>   		ret = aie2_query_resource_info(client, args);
>   		break;
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index a79f4f71ff6b..9793cd1e0c55 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -305,6 +305,9 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
>   int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx);
>   int aie2_map_host_buf(struct amdxdna_dev_hdl *ndev, u32 context_id, u64 addr, u64 size);
>   int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf, u32 size, u32 *cols_filled);
> +int aie2_query_telemetry(struct amdxdna_dev_hdl *ndev,
> +			 char __user *buf, u32 size,
> +			 struct amdxdna_drm_query_telemetry_header *header);
>   int aie2_register_asyn_event_msg(struct amdxdna_dev_hdl *ndev, dma_addr_t addr, u32 size,
>   				 void *handle, int (*cb)(void*, void __iomem *, size_t));
>   int aie2_config_cu(struct amdxdna_hwctx *hwctx,
> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox_helper.h b/drivers/accel/amdxdna/amdxdna_mailbox_helper.h
> index 710ff8873d61..556c712cad0a 100644
> --- a/drivers/accel/amdxdna/amdxdna_mailbox_helper.h
> +++ b/drivers/accel/amdxdna/amdxdna_mailbox_helper.h
> @@ -16,16 +16,18 @@ struct xdna_notify {
>   	u32			*data;
>   	size_t			size;
>   	int			error;
> +	u32			*status;
>   };
>   
> -#define DECLARE_XDNA_MSG_COMMON(name, op, status)			\
> +#define DECLARE_XDNA_MSG_COMMON(name, op, s)				\
>   	struct name##_req	req = { 0 };				\
> -	struct name##_resp	resp = { status	};			\
> +	struct name##_resp	resp = { .status = s };			\
>   	struct xdna_notify	hdl = {					\
>   		.error = 0,						\
>   		.data = (u32 *)&resp,					\
>   		.size = sizeof(resp),					\
>   		.comp = COMPLETION_INITIALIZER_ONSTACK(hdl.comp),	\
> +		.status = (u32 *)&resp.status,				\
>   	};								\
>   	struct xdna_mailbox_msg msg = {					\
>   		.send_data = (u8 *)&req,				\
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index af943a603ad1..7590265d4485 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -30,9 +30,10 @@ MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
>    * 0.2: Support getting last error hardware error
>    * 0.3: Support firmware debug buffer
>    * 0.4: Support getting resource information
> + * 0.5: Support getting telemetry data
>    */
>   #define AMDXDNA_DRIVER_MAJOR		0
> -#define AMDXDNA_DRIVER_MINOR		4
> +#define AMDXDNA_DRIVER_MINOR		5
>   
>   /*
>    * Bind the driver base on (vendor_id, device_id) pair and later use the
> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
> index 8b679c38d308..8ad254bc35a5 100644
> --- a/include/uapi/drm/amdxdna_accel.h
> +++ b/include/uapi/drm/amdxdna_accel.h
> @@ -442,6 +442,7 @@ enum amdxdna_drm_get_param {
>   	DRM_AMDXDNA_QUERY_HW_CONTEXTS,
>   	DRM_AMDXDNA_QUERY_FIRMWARE_VERSION = 8,
>   	DRM_AMDXDNA_GET_POWER_MODE,
> +	DRM_AMDXDNA_QUERY_TELEMETRY,
>   	DRM_AMDXDNA_QUERY_RESOURCE_INFO = 12,
>   };
>   
> @@ -461,6 +462,22 @@ struct amdxdna_drm_get_resource_info {
>   	__u64 npu_task_curr;
>   };
>   
> +/**
> + * struct amdxdna_drm_query_telemetry_header - Telemetry data header
> + */
> +struct amdxdna_drm_query_telemetry_header {
> +	/** @major: Firmware telemetry interface major version number */
> +	__u32 major;
> +	/** @minor: Firmware telemetry interface minor version number */
> +	__u32 minor;
> +	/** @type: Telemetry query type */
> +	__u32 type;
> +	/** @map_num_elements: Total number of elements in the map table */
> +	__u32 map_num_elements;
> +	/** @map: Element map */
> +	__u32 map[];
> +};
> +
>   /**
>    * struct amdxdna_drm_get_info - Get some information from the AIE hardware.
>    * @param: Value in enum amdxdna_drm_get_param. Specifies the structure passed in the buffer.

