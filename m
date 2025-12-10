Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB589CB1FDA
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 06:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB34010E661;
	Wed, 10 Dec 2025 05:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BF1puDc+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E2A10E661
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 05:37:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3E932409CA;
 Wed, 10 Dec 2025 05:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 472B5C16AAE;
 Wed, 10 Dec 2025 05:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765345022;
 bh=+wQ+gw8hCUT03MI7NN0wONX2ee8B4yfATkYb8sW1uu4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BF1puDc+kqajFBH8hAZxXMRflfIathhdGTz51CeDChoOL6ATfTt10iSaHRm3w7G0Y
 MRnBALUHR5zw6ygS3BxyyvUfaydM2KXGlaCET8qLtNDPSBN++X6uVU98Ebptn0GH2/
 hdGVvU9G8pQa/TN6G1jqDXttI0uAE57IjkgNDeKSDSOaQi6j+XzkgXyL7kkUccWHt0
 38gAozk2JGdkCUEU1rvmlEY9H6+3tV8ByvGHqBA4jF6bl3ZUcC+5wmVk2iHBVeOl+A
 qXrw5Hm56kEAY2Z3FUfha7j1I7cSHzCBspxQgt+LgEZcFH8875O30QSvDYKCTART3R
 AlDcJq0qPdC+Q==
Message-ID: <e62a3c30-162d-4ba4-bfed-4bb98d9ebfba@kernel.org>
Date: Tue, 9 Dec 2025 23:37:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Fix cu_idx being cleared by memset()
 during command setup
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251209211639.1636888-1-lizhi.hou@amd.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20251209211639.1636888-1-lizhi.hou@amd.com>
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



On 12/9/2025 3:16 PM, Lizhi Hou wrote:
> For one command type, cu_idx is assigned before calling memset() on the
> command structure. This results in cu_idx being overwritten, causing the
> firmware to receive an incomplete or invalid command and leading to
> unexpected command failures.
> 
> Fix this by moving the memset() call before initializing cu_idx so that
> all fields are populated in the correct order.
> 
> Fixes: 71829d7f2f70 ("accel/amdxdna: Use MSG_OP_CHAIN_EXEC_NPU when supported")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   drivers/accel/amdxdna/aie2_message.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index a75156800467..03b75757a6e6 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -652,6 +652,7 @@ aie2_cmdlist_fill_npu_cf(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *siz
>   	u32 cmd_len;
>   	void *cmd;
>   
> +	memset(npu_slot, 0, sizeof(*npu_slot));
>   	cmd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
>   	if (*size < sizeof(*npu_slot) + cmd_len)
>   		return -EINVAL;
> @@ -660,7 +661,6 @@ aie2_cmdlist_fill_npu_cf(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *siz
>   	if (npu_slot->cu_idx == INVALID_CU_IDX)
>   		return -EINVAL;
>   
> -	memset(npu_slot, 0, sizeof(*npu_slot));
>   	npu_slot->type = EXEC_NPU_TYPE_NON_ELF;
>   	npu_slot->arg_cnt = cmd_len / sizeof(u32);
>   	memcpy(npu_slot->args, cmd, cmd_len);
> @@ -677,6 +677,7 @@ aie2_cmdlist_fill_npu_dpu(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *si
>   	u32 cmd_len;
>   	u32 arg_sz;
>   
> +	memset(npu_slot, 0, sizeof(*npu_slot));
>   	sn = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
>   	arg_sz = cmd_len - sizeof(*sn);
>   	if (cmd_len < sizeof(*sn) || arg_sz > MAX_NPU_ARGS_SIZE)
> @@ -689,7 +690,6 @@ aie2_cmdlist_fill_npu_dpu(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *si
>   	if (npu_slot->cu_idx == INVALID_CU_IDX)
>   		return -EINVAL;
>   
> -	memset(npu_slot, 0, sizeof(*npu_slot));
>   	npu_slot->type = EXEC_NPU_TYPE_PARTIAL_ELF;
>   	npu_slot->inst_buf_addr = sn->buffer;
>   	npu_slot->inst_size = sn->buffer_size;
> @@ -709,6 +709,7 @@ aie2_cmdlist_fill_npu_preempt(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t
>   	u32 cmd_len;
>   	u32 arg_sz;
>   
> +	memset(npu_slot, 0, sizeof(*npu_slot));
>   	pd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
>   	arg_sz = cmd_len - sizeof(*pd);
>   	if (cmd_len < sizeof(*pd) || arg_sz > MAX_NPU_ARGS_SIZE)
> @@ -721,7 +722,6 @@ aie2_cmdlist_fill_npu_preempt(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t
>   	if (npu_slot->cu_idx == INVALID_CU_IDX)
>   		return -EINVAL;
>   
> -	memset(npu_slot, 0, sizeof(*npu_slot));
>   	npu_slot->type = EXEC_NPU_TYPE_PREEMPT;
>   	npu_slot->inst_buf_addr = pd->inst_buf;
>   	npu_slot->save_buf_addr = pd->save_buf;
> @@ -745,6 +745,7 @@ aie2_cmdlist_fill_npu_elf(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *si
>   	u32 cmd_len;
>   	u32 arg_sz;
>   
> +	memset(npu_slot, 0, sizeof(*npu_slot));
>   	pd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
>   	arg_sz = cmd_len - sizeof(*pd);
>   	if (cmd_len < sizeof(*pd) || arg_sz > MAX_NPU_ARGS_SIZE)
> @@ -753,7 +754,6 @@ aie2_cmdlist_fill_npu_elf(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *si
>   	if (*size < sizeof(*npu_slot) + arg_sz)
>   		return -EINVAL;
>   
> -	memset(npu_slot, 0, sizeof(*npu_slot));
>   	npu_slot->type = EXEC_NPU_TYPE_ELF;
>   	npu_slot->inst_buf_addr = pd->inst_buf;
>   	npu_slot->save_buf_addr = pd->save_buf;

