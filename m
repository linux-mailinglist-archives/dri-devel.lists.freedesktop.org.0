Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANcwNM/moWmUwwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 19:47:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D8A1BC2BB
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 19:47:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9616110EBE5;
	Fri, 27 Feb 2026 18:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LyVZilXT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3404610E126
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 18:47:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3F9F8407D5;
 Fri, 27 Feb 2026 18:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F26AC116C6;
 Fri, 27 Feb 2026 18:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772218057;
 bh=QDmmkCh4XcSNhkdZkdVrxLFrczXRsrS/UJX0ZG7rM+0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LyVZilXTEXrpWzpV0i/W25N80ipyCZtamE7Dt2WVQBxTJAqKDgSh4F7a+K+oQquNf
 bbl94G/ANIpkRRlvwTn5lQXAQXJSz/SK1YcwLROPvLpY51AkJIP4Me2LB6p/IRmagp
 AI5ycBvG2s8nMHb+wU2/hfK10lU4aE9fJFkf6O0fGnAuz+fe5i81A0CXhJzDIvZjcU
 viw3LKbSvSaPM/LBTITKpEmj1zL6OAl5ydrOrC964xHmsc4AMjriAb1RyFWQTn9LE4
 32P006AHLVDPVNoyACzez0H85vQniu+0y8x68d4qwTAG9uDBqN+f1Qq0id9DhRTDT1
 JhmdTzAAXc6+g==
Message-ID: <1af07b22-65c8-46cd-b055-fa6f61b33b16@kernel.org>
Date: Fri, 27 Feb 2026 12:47:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 9/9] accel/amdxdna: Fill invalid payload for failed
 command
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20260227004841.3080241-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260227004841.3080241-1-lizhi.hou@amd.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[superm1@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email]
X-Rspamd-Queue-Id: 18D8A1BC2BB
X-Rspamd-Action: no action

The title is 9/9, but I didn't get copied on 0 through 8.  Was that just 
a mistake when you made the patch you sent out one patch instead of 9?

On 2/26/26 6:48 PM, Lizhi Hou wrote:
> Newer userspace applications may read the payload of a failed command
> to obtain detailed error information. However, the driver and old firmware
> versions may not support returning advanced error information.
> In this case, initialize the command payload with an invalid value so
> userspace can detect that no detailed error information is available.
> 
> Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

Would it also make sense to also detect the firmware version and 
indicate in the logs, IOCTL or a sysfs the feature is available for user 
space to detect?

Nonetheless, this approach is scalable.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> ---
>   drivers/accel/amdxdna/aie2_ctx.c    | 23 ++++++++---------------
>   drivers/accel/amdxdna/amdxdna_ctx.c | 27 +++++++++++++++++++++++++++
>   drivers/accel/amdxdna/amdxdna_ctx.h |  3 +++
>   3 files changed, 38 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 622ddbf7fb6f..eb4c9d919885 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -186,13 +186,13 @@ aie2_sched_resp_handler(void *handle, void __iomem *data, size_t size)
>   	cmd_abo = job->cmd_bo;
>   
>   	if (unlikely(job->job_timeout)) {
> -		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_TIMEOUT);
> +		amdxdna_cmd_set_error(cmd_abo, job, 0, ERT_CMD_STATE_TIMEOUT);
>   		ret = -EINVAL;
>   		goto out;
>   	}
>   
>   	if (unlikely(!data) || unlikely(size != sizeof(u32))) {
> -		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
> +		amdxdna_cmd_set_error(cmd_abo, job, 0, ERT_CMD_STATE_ABORT);
>   		ret = -EINVAL;
>   		goto out;
>   	}
> @@ -202,7 +202,7 @@ aie2_sched_resp_handler(void *handle, void __iomem *data, size_t size)
>   	if (status == AIE2_STATUS_SUCCESS)
>   		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_COMPLETED);
>   	else
> -		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ERROR);
> +		amdxdna_cmd_set_error(cmd_abo, job, 0, ERT_CMD_STATE_ERROR);
>   
>   out:
>   	aie2_sched_notify(job);
> @@ -244,13 +244,13 @@ aie2_sched_cmdlist_resp_handler(void *handle, void __iomem *data, size_t size)
>   	cmd_abo = job->cmd_bo;
>   
>   	if (unlikely(job->job_timeout)) {
> -		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_TIMEOUT);
> +		amdxdna_cmd_set_error(cmd_abo, job, 0, ERT_CMD_STATE_TIMEOUT);
>   		ret = -EINVAL;
>   		goto out;
>   	}
>   
>   	if (unlikely(!data) || unlikely(size != sizeof(u32) * 3)) {
> -		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
> +		amdxdna_cmd_set_error(cmd_abo, job, 0, ERT_CMD_STATE_ABORT);
>   		ret = -EINVAL;
>   		goto out;
>   	}
> @@ -270,19 +270,12 @@ aie2_sched_cmdlist_resp_handler(void *handle, void __iomem *data, size_t size)
>   		 fail_cmd_idx, fail_cmd_status);
>   
>   	if (fail_cmd_status == AIE2_STATUS_SUCCESS) {
> -		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
> +		amdxdna_cmd_set_error(cmd_abo, job, fail_cmd_idx, ERT_CMD_STATE_ABORT);
>   		ret = -EINVAL;
> -		goto out;
> +	} else {
> +		amdxdna_cmd_set_error(cmd_abo, job, fail_cmd_idx, ERT_CMD_STATE_ERROR);
>   	}
> -	amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ERROR);
>   
> -	if (amdxdna_cmd_get_op(cmd_abo) == ERT_CMD_CHAIN) {
> -		struct amdxdna_cmd_chain *cc = amdxdna_cmd_get_payload(cmd_abo, NULL);
> -
> -		cc->error_index = fail_cmd_idx;
> -		if (cc->error_index >= cc->command_count)
> -			cc->error_index = 0;
> -	}
>   out:
>   	aie2_sched_notify(job);
>   	return ret;
> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
> index db3aa26fb55f..405d2c62789d 100644
> --- a/drivers/accel/amdxdna/amdxdna_ctx.c
> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
> @@ -132,6 +132,33 @@ u32 amdxdna_cmd_get_cu_idx(struct amdxdna_gem_obj *abo)
>   	return INVALID_CU_IDX;
>   }
>   
> +int amdxdna_cmd_set_error(struct amdxdna_gem_obj *abo,
> +			  struct amdxdna_sched_job *job, u32 cmd_idx,
> +			  enum ert_cmd_state error_state)
> +{
> +	struct amdxdna_client *client = job->hwctx->client;
> +	struct amdxdna_cmd *cmd = abo->mem.kva;
> +	struct amdxdna_cmd_chain *cc = NULL;
> +
> +	cmd->header &= ~AMDXDNA_CMD_STATE;
> +	cmd->header |= FIELD_PREP(AMDXDNA_CMD_STATE, error_state);
> +
> +	if (amdxdna_cmd_get_op(abo) == ERT_CMD_CHAIN) {
> +		cc = amdxdna_cmd_get_payload(abo, NULL);
> +		cc->error_index = (cmd_idx < cc->command_count) ? cmd_idx : 0;
> +		abo = amdxdna_gem_get_obj(client, cc->data[0], AMDXDNA_BO_CMD);
> +		if (!abo)
> +			return -EINVAL;
> +		cmd = abo->mem.kva;
> +	}
> +
> +	memset(cmd->data, 0xff, abo->mem.size - sizeof(*cmd));
> +	if (cc)
> +		amdxdna_gem_put_obj(abo);
> +
> +	return 0;
> +}
> +
>   /*
>    * This should be called in close() and remove(). DO NOT call in other syscalls.
>    * This guarantee that when hwctx and resources will be released, if user
> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
> index 16c85f08f03c..fbdf9d000871 100644
> --- a/drivers/accel/amdxdna/amdxdna_ctx.h
> +++ b/drivers/accel/amdxdna/amdxdna_ctx.h
> @@ -167,6 +167,9 @@ amdxdna_cmd_get_state(struct amdxdna_gem_obj *abo)
>   
>   void *amdxdna_cmd_get_payload(struct amdxdna_gem_obj *abo, u32 *size);
>   u32 amdxdna_cmd_get_cu_idx(struct amdxdna_gem_obj *abo);
> +int amdxdna_cmd_set_error(struct amdxdna_gem_obj *abo,
> +			  struct amdxdna_sched_job *job, u32 cmd_idx,
> +			  enum ert_cmd_state error_state);
>   
>   void amdxdna_sched_job_cleanup(struct amdxdna_sched_job *job);
>   void amdxdna_hwctx_remove_all(struct amdxdna_client *client);

