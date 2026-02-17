Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNw7CcC5lGlmHQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 19:56:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8570D14F66F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 19:55:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BF110E281;
	Tue, 17 Feb 2026 18:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W22NpWKd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E00D10E281
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 18:55:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1DAB4444AD;
 Tue, 17 Feb 2026 18:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FEB4C2BC86;
 Tue, 17 Feb 2026 18:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771354556;
 bh=QhK2g8tqzLJSJiRA4xE5aFPe+bVdVRnzCI3pwb04wDY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=W22NpWKd1TbMuPEYySZ8yzibkDazuvYh1vQkwpL2AH0VI+Eec2moxorzDq7XjC7al
 YeinIWzvSYKUtoI5piOvnHse0n8c7sCsY6UbUakM4QbCicL1ts1QQgjrW7Y+7xE41I
 YX24SD1xEeg80K2g2FMDER4JeSlN+4fMg6gv4Se3SBZfnnBRIXdlGoZyXK5YU1k4sY
 76rVvh7QFYVXPpONHXqRReSCsO1MF6vgx4cOq4Rfjj6ZVhrlPd9cGdckDB+cGWrzMT
 uE+fLv+xklzcEm5S9IwbNbbwhDFAsgJWZk52EzDYo5grmN5PPPrni1f440pJGgBe4m
 jXnOd2jZMg0zQ==
Message-ID: <fefd7aaf-b2af-437d-9b51-f70d1b355a63@kernel.org>
Date: Tue, 17 Feb 2026 12:55:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Fix out-of-bounds memset in command
 slot handling
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20260217185415.1781908-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260217185415.1781908-1-lizhi.hou@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[superm1@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 8570D14F66F
X-Rspamd-Action: no action

On 2/17/26 12:54 PM, Lizhi Hou wrote:
> The remaining space in a command slot may be smaller than the size of
> the command header. Clearing the command header with memset() before
> verifying the available slot space can result in an out-of-bounds write
> and memory corruption.
> 
> Fix this by moving the memset() call after the size validation.
> 
> Fixes: 3d32eb7a5ecf ("accel/amdxdna: Fix cu_idx being cleared by memset() during command setup")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   drivers/accel/amdxdna/aie2_message.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index 7d7dcfeaf794..8fbbc3280468 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -694,11 +694,11 @@ aie2_cmdlist_fill_npu_cf(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *siz
>   	u32 cmd_len;
>   	void *cmd;
>   
> -	memset(npu_slot, 0, sizeof(*npu_slot));
>   	cmd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
>   	if (*size < sizeof(*npu_slot) + cmd_len)
>   		return -EINVAL;
>   
> +	memset(npu_slot, 0, sizeof(*npu_slot));
>   	npu_slot->cu_idx = amdxdna_cmd_get_cu_idx(cmd_bo);
>   	if (npu_slot->cu_idx == INVALID_CU_IDX)
>   		return -EINVAL;
> @@ -719,7 +719,6 @@ aie2_cmdlist_fill_npu_dpu(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *si
>   	u32 cmd_len;
>   	u32 arg_sz;
>   
> -	memset(npu_slot, 0, sizeof(*npu_slot));
>   	sn = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
>   	arg_sz = cmd_len - sizeof(*sn);
>   	if (cmd_len < sizeof(*sn) || arg_sz > MAX_NPU_ARGS_SIZE)
> @@ -728,6 +727,7 @@ aie2_cmdlist_fill_npu_dpu(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *si
>   	if (*size < sizeof(*npu_slot) + arg_sz)
>   		return -EINVAL;
>   
> +	memset(npu_slot, 0, sizeof(*npu_slot));
>   	npu_slot->cu_idx = amdxdna_cmd_get_cu_idx(cmd_bo);
>   	if (npu_slot->cu_idx == INVALID_CU_IDX)
>   		return -EINVAL;
> @@ -751,7 +751,6 @@ aie2_cmdlist_fill_npu_preempt(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t
>   	u32 cmd_len;
>   	u32 arg_sz;
>   
> -	memset(npu_slot, 0, sizeof(*npu_slot));
>   	pd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
>   	arg_sz = cmd_len - sizeof(*pd);
>   	if (cmd_len < sizeof(*pd) || arg_sz > MAX_NPU_ARGS_SIZE)
> @@ -760,6 +759,7 @@ aie2_cmdlist_fill_npu_preempt(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t
>   	if (*size < sizeof(*npu_slot) + arg_sz)
>   		return -EINVAL;
>   
> +	memset(npu_slot, 0, sizeof(*npu_slot));
>   	npu_slot->cu_idx = amdxdna_cmd_get_cu_idx(cmd_bo);
>   	if (npu_slot->cu_idx == INVALID_CU_IDX)
>   		return -EINVAL;
> @@ -787,7 +787,6 @@ aie2_cmdlist_fill_npu_elf(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *si
>   	u32 cmd_len;
>   	u32 arg_sz;
>   
> -	memset(npu_slot, 0, sizeof(*npu_slot));
>   	pd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
>   	arg_sz = cmd_len - sizeof(*pd);
>   	if (cmd_len < sizeof(*pd) || arg_sz > MAX_NPU_ARGS_SIZE)
> @@ -796,6 +795,7 @@ aie2_cmdlist_fill_npu_elf(struct amdxdna_gem_obj *cmd_bo, void *slot, size_t *si
>   	if (*size < sizeof(*npu_slot) + arg_sz)
>   		return -EINVAL;
>   
> +	memset(npu_slot, 0, sizeof(*npu_slot));
>   	npu_slot->type = EXEC_NPU_TYPE_ELF;
>   	npu_slot->inst_buf_addr = pd->inst_buf;
>   	npu_slot->save_buf_addr = pd->save_buf;

