Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EC7CC9635
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 20:15:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459D010E101;
	Wed, 17 Dec 2025 19:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ieoDb6rN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E17910E101
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 19:15:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 114DD6000A;
 Wed, 17 Dec 2025 19:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E91C4CEF5;
 Wed, 17 Dec 2025 19:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765998899;
 bh=IOOW73vIRtOOerAODsJ10s0vtDMqHArjumg7UhUu+P0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ieoDb6rNZqMxty8KgDxULEh7sAfMt5AsnCy834e8pz2zJVPNfQePyrgKAjp29qsUE
 wbzuHJXUkg1wG4ADewOFmlqi6IyaJF6KLlKT0pxtTGYzu27qKuXiUURbp0/Gtb3uKM
 GqpyMaNielJRw0v8mIdRHXKw5sqLquDUwgCcEBJ19CaB8W4ZHRgL7I7Hsg8ij7yvVR
 xzoiHWl6LmF4i6NQTKYh+GG7jNjrD0cobAt+umu67MfsCQ0b1fhA22kPiLxUekjZwb
 fhA9yHIRvfYpeDpRXchgpAMAyLIR35nlumcCl6qnL9kSZ0zuER1m36Mm6PZ1BLci7J
 kwYOcnqOyti6g==
Message-ID: <2f35a073-2184-4534-896a-b0d62871e12c@kernel.org>
Date: Wed, 17 Dec 2025 13:14:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] accel/amdxdna: Enable temporal sharing only mode
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251217191150.2145937-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20251217191150.2145937-1-lizhi.hou@amd.com>
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

On 12/17/25 1:11 PM, Lizhi Hou wrote:
> Newer firmware versions prefer temporal sharing only mode. In this mode,
> the driver no longer needs to manage AIE array column allocation. Instead,
> a new field, num_unused_col, is added to the hardware context creation
> request to specify how many columns will not be used by this hardware
> context.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

One minor whitespace comment below (just fix it while committing if no 
other feedback).

> ---
>   drivers/accel/amdxdna/aie2_ctx.c      | 18 +++++++++++++++---
>   drivers/accel/amdxdna/aie2_message.c  |  1 +
>   drivers/accel/amdxdna/aie2_msg_priv.h |  3 ++-
>   drivers/accel/amdxdna/aie2_pci.h      |  1 +
>   drivers/accel/amdxdna/amdxdna_ctx.h   |  1 +
>   drivers/accel/amdxdna/npu4_regs.c     |  1 +
>   6 files changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 42d876a427c5..f99233041397 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -468,6 +468,12 @@ static int aie2_alloc_resource(struct amdxdna_hwctx *hwctx)
>   	struct alloc_requests *xrs_req;
>   	int ret;
>   
> +	if (AIE2_FEATURE_ON(xdna->dev_handle, AIE2_TEMPORAL_ONLY)) {
> +		hwctx->num_unused_col = xdna->dev_handle->total_col - hwctx->num_col;
> +		hwctx->num_col = xdna->dev_handle->total_col;
> +		return aie2_create_context(xdna->dev_handle, hwctx);
> +	}
> +
>   	xrs_req = kzalloc(sizeof(*xrs_req), GFP_KERNEL);
>   	if (!xrs_req)
>   		return -ENOMEM;
> @@ -499,9 +505,15 @@ static void aie2_release_resource(struct amdxdna_hwctx *hwctx)
>   	struct amdxdna_dev *xdna = hwctx->client->xdna;
>   	int ret;
>   
> -	ret = xrs_release_resource(xdna->xrs_hdl, (uintptr_t)hwctx);
> -	if (ret)
> -		XDNA_ERR(xdna, "Release AIE resource failed, ret %d", ret);
> +	if (AIE2_FEATURE_ON(xdna->dev_handle, AIE2_TEMPORAL_ONLY)) {
> +		ret = aie2_destroy_context(xdna->dev_handle, hwctx);
> +		if (ret)
> +			XDNA_ERR(xdna, "Destroy  temporal only context failed, ret %d", ret);

too much whitespace inbetween destroy and temporal.

> +	} else {
> +		ret = xrs_release_resource(xdna->xrs_hdl, (uintptr_t)hwctx);
> +		if (ret)
> +			XDNA_ERR(xdna, "Release AIE resource failed, ret %d", ret);
> +	}
>   }
>   
>   static int aie2_ctx_syncobj_create(struct amdxdna_hwctx *hwctx)
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index 9ec973028221..e77a353cadc5 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -218,6 +218,7 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
>   	req.aie_type = 1;
>   	req.start_col = hwctx->start_col;
>   	req.num_col = hwctx->num_col;
> +	req.num_unused_col = hwctx->num_unused_col;
>   	req.num_cq_pairs_requested = 1;
>   	req.pasid = hwctx->client->pasid;
>   	req.context_priority = 2;
> diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h b/drivers/accel/amdxdna/aie2_msg_priv.h
> index 1c957a6298d3..cc912b7899ce 100644
> --- a/drivers/accel/amdxdna/aie2_msg_priv.h
> +++ b/drivers/accel/amdxdna/aie2_msg_priv.h
> @@ -112,7 +112,8 @@ struct create_ctx_req {
>   	__u32	aie_type;
>   	__u8	start_col;
>   	__u8	num_col;
> -	__u16	reserved;
> +	__u8    num_unused_col;
> +	__u8	reserved;
>   	__u8	num_cq_pairs_requested;
>   	__u8	reserved1;
>   	__u16	pasid;
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index c6b5cf4ae5c4..a929fa98a121 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -232,6 +232,7 @@ struct aie2_hw_ops {
>   enum aie2_fw_feature {
>   	AIE2_NPU_COMMAND,
>   	AIE2_PREEMPT,
> +	AIE2_TEMPORAL_ONLY,
>   	AIE2_FEATURE_MAX
>   };
>   
> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
> index b6151244d64f..b29449a92f60 100644
> --- a/drivers/accel/amdxdna/amdxdna_ctx.h
> +++ b/drivers/accel/amdxdna/amdxdna_ctx.h
> @@ -98,6 +98,7 @@ struct amdxdna_hwctx {
>   	u32				*col_list;
>   	u32				start_col;
>   	u32				num_col;
> +	u32				num_unused_col;
>   #define HWCTX_STAT_INIT  0
>   #define HWCTX_STAT_READY 1
>   #define HWCTX_STAT_STOP  2
> diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
> index 4ca21db70478..a62234fd266d 100644
> --- a/drivers/accel/amdxdna/npu4_regs.c
> +++ b/drivers/accel/amdxdna/npu4_regs.c
> @@ -90,6 +90,7 @@ const struct dpm_clk_freq npu4_dpm_clk_table[] = {
>   const struct aie2_fw_feature_tbl npu4_fw_feature_table[] = {
>   	{ .feature = AIE2_NPU_COMMAND, .min_minor = 15 },
>   	{ .feature = AIE2_PREEMPT, .min_minor = 12 },
> +	{ .feature = AIE2_TEMPORAL_ONLY, .min_minor = 12 },
>   	{ 0 }
>   };
>   

