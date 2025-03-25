Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C73DA6E98A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 07:20:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E489010E03F;
	Tue, 25 Mar 2025 06:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HusuE0FC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A4210E03F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 06:20:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 83FE45C5426;
 Tue, 25 Mar 2025 06:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD3DC4CEE8;
 Tue, 25 Mar 2025 06:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742883639;
 bh=yBy2dPyRG6iQ9kUCVBlrFmO6OAw3Hl3h0vvDuBwwmDk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HusuE0FC6hZhriOBvttAgG2perQO+CLfCcpYdHNmfD2i5tf+xZDQJT2LVSSxuK3Sn
 jEXGFp4Aq/7hDqyHfdsEbzOSlHn38iUD/N21MKcIJFaJzqBjNtIraxVUueyVJUtsYf
 mtxpLCabXZDDkiWBOHwgZWgGrPBbYT09RouK3BX4b1bQKjXvrUqXkam7tsbbz3oHkF
 7XFgTQEzf5jaQU3KI4CkBONMcz+WiDvclpVko58myTMg+G2IAS/Fttwfpe4ZHBaBY1
 kQsT2qJEci06/+9qQ6D8Fx7yhK8mkqT/axVCzJMl7Z+SHGz6D5OJXIQDhTP0wo2zm0
 e9+apC5GRLACQ==
Date: Tue, 25 Mar 2025 11:50:28 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org,
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v6 04/10] optee: sync secure world ABI headers
Message-ID: <Z-JLLHcrt1pwXe7J@sumit-X1>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-5-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305130634.1850178-5-jens.wiklander@linaro.org>
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

Hi Jens,

It has taken a bit of time for me to review this patch-set as I am
settling in my new role.

On Wed, Mar 05, 2025 at 02:04:10PM +0100, Jens Wiklander wrote:
> Update the header files describing the secure world ABI, both with and
> without FF-A. The ABI is extended to deal with restricted memory, but as
> usual backward compatible.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/optee/optee_ffa.h | 27 ++++++++++---
>  drivers/tee/optee/optee_msg.h | 65 ++++++++++++++++++++++++++++++--
>  drivers/tee/optee/optee_smc.h | 71 ++++++++++++++++++++++++++++++++++-
>  3 files changed, 154 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/tee/optee/optee_ffa.h b/drivers/tee/optee/optee_ffa.h
> index 257735ae5b56..7bd037200343 100644
> --- a/drivers/tee/optee/optee_ffa.h
> +++ b/drivers/tee/optee/optee_ffa.h
> @@ -81,7 +81,7 @@
>   *                   as the second MSG arg struct for
>   *                   OPTEE_FFA_YIELDING_CALL_WITH_ARG.
>   *        Bit[31:8]: Reserved (MBZ)
> - * w5:	  Bitfield of secure world capabilities OPTEE_FFA_SEC_CAP_* below,
> + * w5:	  Bitfield of OP-TEE capabilities OPTEE_FFA_SEC_CAP_*
>   * w6:	  The maximum secure world notification number
>   * w7:	  Not used (MBZ)
>   */
> @@ -94,6 +94,8 @@
>  #define OPTEE_FFA_SEC_CAP_ASYNC_NOTIF	BIT(1)
>  /* OP-TEE supports probing for RPMB device if needed */
>  #define OPTEE_FFA_SEC_CAP_RPMB_PROBE	BIT(2)
> +/* OP-TEE supports Restricted Memory for secure data path */
> +#define OPTEE_FFA_SEC_CAP_RSTMEM	BIT(3)
>  
>  #define OPTEE_FFA_EXCHANGE_CAPABILITIES OPTEE_FFA_BLOCKING_CALL(2)
>  
> @@ -108,7 +110,7 @@
>   *
>   * Return register usage:
>   * w3:    Error code, 0 on success
> - * w4-w7: Note used (MBZ)
> + * w4-w7: Not used (MBZ)
>   */
>  #define OPTEE_FFA_UNREGISTER_SHM	OPTEE_FFA_BLOCKING_CALL(3)
>  
> @@ -119,16 +121,31 @@
>   * Call register usage:
>   * w3:    Service ID, OPTEE_FFA_ENABLE_ASYNC_NOTIF
>   * w4:	  Notification value to request bottom half processing, should be
> - *	  less than OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE.
> + *	  less than OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE
>   * w5-w7: Not used (MBZ)
>   *
>   * Return register usage:
>   * w3:    Error code, 0 on success
> - * w4-w7: Note used (MBZ)
> + * w4-w7: Not used (MBZ)
>   */
>  #define OPTEE_FFA_ENABLE_ASYNC_NOTIF	OPTEE_FFA_BLOCKING_CALL(5)
>  
> -#define OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE 64
> +#define OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE	64
> +
> +/*
> + * Release Restricted memory
> + *
> + * Call register usage:
> + * w3:    Service ID, OPTEE_FFA_RECLAIM_RSTMEM
> + * w4:    Shared memory handle, lower bits
> + * w5:    Shared memory handle, higher bits
> + * w6-w7: Not used (MBZ)
> + *
> + * Return register usage:
> + * w3:    Error code, 0 on success
> + * w4-w7: Note used (MBZ)
> + */
> +#define OPTEE_FFA_RELEASE_RSTMEM	OPTEE_FFA_BLOCKING_CALL(8)
>  
>  /*
>   * Call with struct optee_msg_arg as argument in the supplied shared memory
> diff --git a/drivers/tee/optee/optee_msg.h b/drivers/tee/optee/optee_msg.h
> index e8840a82b983..1b558526e7d9 100644
> --- a/drivers/tee/optee/optee_msg.h
> +++ b/drivers/tee/optee/optee_msg.h
> @@ -133,13 +133,13 @@ struct optee_msg_param_rmem {
>  };
>  
>  /**
> - * struct optee_msg_param_fmem - ffa memory reference parameter
> + * struct optee_msg_param_fmem - FF-A memory reference parameter
>   * @offs_lower:	   Lower bits of offset into shared memory reference
>   * @offs_upper:	   Upper bits of offset into shared memory reference
>   * @internal_offs: Internal offset into the first page of shared memory
>   *		   reference
>   * @size:	   Size of the buffer
> - * @global_id:	   Global identifier of Shared memory
> + * @global_id:	   Global identifier of the shared memory
>   */
>  struct optee_msg_param_fmem {
>  	u32 offs_low;
> @@ -165,7 +165,7 @@ struct optee_msg_param_value {
>   * @attr:	attributes
>   * @tmem:	parameter by temporary memory reference
>   * @rmem:	parameter by registered memory reference
> - * @fmem:	parameter by ffa registered memory reference
> + * @fmem:	parameter by FF-A registered memory reference
>   * @value:	parameter by opaque value
>   * @octets:	parameter by octet string
>   *
> @@ -296,6 +296,18 @@ struct optee_msg_arg {
>   */
>  #define OPTEE_MSG_FUNCID_GET_OS_REVISION	0x0001
>  
> +/*
> + * Values used in OPTEE_MSG_CMD_LEND_RSTMEM below
> + * OPTEE_MSG_RSTMEM_RESERVED		Reserved
> + * OPTEE_MSG_RSTMEM_SECURE_VIDEO_PLAY	Secure Video Playback
> + * OPTEE_MSG_RSTMEM_TRUSTED_UI		Trused UI
> + * OPTEE_MSG_RSTMEM_SECURE_VIDEO_RECORD	Secure Video Recording
> + */
> +#define OPTEE_MSG_RSTMEM_RESERVED		0
> +#define OPTEE_MSG_RSTMEM_SECURE_VIDEO_PLAY	1
> +#define OPTEE_MSG_RSTMEM_TRUSTED_UI		2
> +#define OPTEE_MSG_RSTMEM_SECURE_VIDEO_RECORD	3
> +
>  /*
>   * Do a secure call with struct optee_msg_arg as argument
>   * The OPTEE_MSG_CMD_* below defines what goes in struct optee_msg_arg::cmd
> @@ -337,6 +349,49 @@ struct optee_msg_arg {
>   * OPTEE_MSG_CMD_STOP_ASYNC_NOTIF informs secure world that from now is
>   * normal world unable to process asynchronous notifications. Typically
>   * used when the driver is shut down.
> + *
> + * OPTEE_MSG_CMD_LEND_RSTMEM lends restricted memory. The passed normal
> + * physical memory is restricted from normal world access. The memory
> + * should be unmapped prior to this call since it becomes inaccessible
> + * during the request.
> + * Parameters are passed as:
> + * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_VALUE_INPUT
> + * [in] param[0].u.value.a		OPTEE_MSG_RSTMEM_* defined above
> + * [in] param[1].attr			OPTEE_MSG_ATTR_TYPE_TMEM_INPUT
> + * [in] param[1].u.tmem.buf_ptr		physical address
> + * [in] param[1].u.tmem.size		size
> + * [in] param[1].u.tmem.shm_ref		holds restricted memory reference
> + *
> + * OPTEE_MSG_CMD_RECLAIM_RSTMEM reclaims a previously lent restricted
> + * memory reference. The physical memory is accessible by the normal world
> + * after this function has return and can be mapped again. The information
> + * is passed as:
> + * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_VALUE_INPUT
> + * [in] param[0].u.value.a		holds restricted memory cookie
> + *
> + * OPTEE_MSG_CMD_GET_RSTMEM_CONFIG get configuration for a specific
> + * restricted memory use case. Parameters are passed as:
> + * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_VALUE_INOUT
> + * [in] param[0].value.a		OPTEE_MSG_RSTMEM_*
> + * [in] param[1].attr			OPTEE_MSG_ATTR_TYPE_{R,F}MEM_OUTPUT
> + * [in] param[1].u.{r,f}mem		Buffer or NULL
> + * [in] param[1].u.{r,f}mem.size	Provided size of buffer or 0 for query
> + * output for the restricted use case:
> + * [out] param[0].value.a		Minimal size of SDP memory
> + * [out] param[0].value.b		Required alignment of size and start of
> + *					restricted memory
> + * [out] param[1].{r,f}mem.size		Size of output data
> + * [out] param[1].{r,f}mem		If non-NULL, contains an array of
> + *					uint16_t holding endpoints that
> + *					must be included when lending
> + *					memory for this use case
> + *
> + * OPTEE_MSG_CMD_ASSIGN_RSTMEM assigns use-case to restricted memory
> + * previously lent using the FFA_LEND framework ABI. Parameters are passed
> + * as:
> + * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_VALUE_INPUT
> + * [in] param[0].u.value.a		holds restricted memory cookie
> + * [in] param[0].u.value.b		OPTEE_MSG_RSTMEM_* defined above
>   */
>  #define OPTEE_MSG_CMD_OPEN_SESSION	0
>  #define OPTEE_MSG_CMD_INVOKE_COMMAND	1
> @@ -346,6 +401,10 @@ struct optee_msg_arg {
>  #define OPTEE_MSG_CMD_UNREGISTER_SHM	5
>  #define OPTEE_MSG_CMD_DO_BOTTOM_HALF	6
>  #define OPTEE_MSG_CMD_STOP_ASYNC_NOTIF	7
> +#define OPTEE_MSG_CMD_LEND_RSTMEM	8
> +#define OPTEE_MSG_CMD_RECLAIM_RSTMEM	9
> +#define OPTEE_MSG_CMD_GET_RSTMEM_CONFIG	10
> +#define OPTEE_MSG_CMD_ASSIGN_RSTMEM	11
>  #define OPTEE_MSG_FUNCID_CALL_WITH_ARG	0x0004
>  
>  #endif /* _OPTEE_MSG_H */
> diff --git a/drivers/tee/optee/optee_smc.h b/drivers/tee/optee/optee_smc.h
> index 879426300821..abc379ce190c 100644
> --- a/drivers/tee/optee/optee_smc.h
> +++ b/drivers/tee/optee/optee_smc.h
> @@ -264,7 +264,6 @@ struct optee_smc_get_shm_config_result {
>  #define OPTEE_SMC_SEC_CAP_HAVE_RESERVED_SHM	BIT(0)
>  /* Secure world can communicate via previously unregistered shared memory */
>  #define OPTEE_SMC_SEC_CAP_UNREGISTERED_SHM	BIT(1)
> -
>  /*
>   * Secure world supports commands "register/unregister shared memory",
>   * secure world accepts command buffers located in any parts of non-secure RAM
> @@ -280,6 +279,10 @@ struct optee_smc_get_shm_config_result {
>  #define OPTEE_SMC_SEC_CAP_RPC_ARG		BIT(6)
>  /* Secure world supports probing for RPMB device if needed */
>  #define OPTEE_SMC_SEC_CAP_RPMB_PROBE		BIT(7)
> +/* Secure world supports Secure Data Path */
> +#define OPTEE_SMC_SEC_CAP_SDP			BIT(8)
> +/* Secure world supports dynamic restricted memory */
> +#define OPTEE_SMC_SEC_CAP_DYNAMIC_RSTMEM	BIT(9)
>  
>  #define OPTEE_SMC_FUNCID_EXCHANGE_CAPABILITIES	9
>  #define OPTEE_SMC_EXCHANGE_CAPABILITIES \
> @@ -451,6 +454,72 @@ struct optee_smc_disable_shm_cache_result {
>  
>  /* See OPTEE_SMC_CALL_WITH_REGD_ARG above */
>  #define OPTEE_SMC_FUNCID_CALL_WITH_REGD_ARG	19
> +/*
> + * Get Secure Data Path memory config
> + *
> + * Returns the Secure Data Path memory config.
> + *
> + * Call register usage:
> + * a0   SMC Function ID, OPTEE_SMC_GET_SDP_CONFIG
> + * a2-6	Not used, must be zero
> + * a7	Hypervisor Client ID register
> + *
> + * Have config return register usage:
> + * a0	OPTEE_SMC_RETURN_OK
> + * a1	Physical address of start of SDP memory
> + * a2	Size of SDP memory
> + * a3	Not used
> + * a4-7	Preserved
> + *
> + * Not available register usage:
> + * a0	OPTEE_SMC_RETURN_ENOTAVAIL
> + * a1-3 Not used
> + * a4-7	Preserved
> + */
> +#define OPTEE_SMC_FUNCID_GET_SDP_CONFIG		20

Let's have a consistent ABI naming here. I think RSTMEM is more generic
rather than SDP, so let's use same naming convention as we use for FF-A
ABI.

-Sumit

> +#define OPTEE_SMC_GET_SDP_CONFIG \
> +	OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_GET_SDP_CONFIG)
> +
> +struct optee_smc_get_sdp_config_result {
> +	unsigned long status;
> +	unsigned long start;
> +	unsigned long size;
> +	unsigned long flags;
> +};
> +
> +/*
> + * Get Secure Data Path dynamic memory config
> + *
> + * Returns the Secure Data Path dynamic memory config.
> + *
> + * Call register usage:
> + * a0	SMC Function ID, OPTEE_SMC_GET_DYN_SHM_CONFIG
> + * a2-6	Not used, must be zero
> + * a7	Hypervisor Client ID register
> + *
> + * Have config return register usage:
> + * a0	OPTEE_SMC_RETURN_OK
> + * a1	Minamal size of SDP memory
> + * a2	Required alignment of size and start of registered SDP memory
> + * a3	Not used
> + * a4-7	Preserved
> + *
> + * Not available register usage:
> + * a0	OPTEE_SMC_RETURN_ENOTAVAIL
> + * a1-3 Not used
> + * a4-7	Preserved
> + */
> +
> +#define OPTEE_SMC_FUNCID_GET_DYN_SDP_CONFIG	21
> +#define OPTEE_SMC_GET_DYN_SDP_CONFIG \
> +	OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_GET_DYN_SDP_CONFIG)
> +
> +struct optee_smc_get_dyn_sdp_config_result {
> +	unsigned long status;
> +	unsigned long size;
> +	unsigned long align;
> +	unsigned long flags;
> +};
>  
>  /*
>   * Resume from RPC (for example after processing a foreign interrupt)
> -- 
> 2.43.0
> 
