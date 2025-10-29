Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A711C1D081
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 20:38:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74EA810E220;
	Wed, 29 Oct 2025 19:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="npKUKx/4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CDC10E220
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 19:38:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BE6C34028E;
 Wed, 29 Oct 2025 19:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11495C4CEF7;
 Wed, 29 Oct 2025 19:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761766732;
 bh=R89zVkSXHPeEUzwsnlWJmQ0tSs3mFYIilk13mLGeMZo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=npKUKx/40kHFfIyiGGiN9esDR0joALFg6IPbwTKB+YgR8go0U/syXNZtR95dqdIhK
 Sy0GX5OTR5wIeNXtYLiSBbUd2fdM37drGoVvDZ7sWNmGGPCjG0mUbjSeiMbRxuJk1B
 2/YfHJKk8m5DT3WfRfVxVITQIuWotsvQOajWFg7dN8HbrMdUsi/0PImFboWeG57dr5
 Wt4O76Yx+WXL+8LbtjorsjvWSlzLxK+WsNpJuuqOG+YyoUvU3qIlgSlHzgVb2dKHsH
 XSX0p6OTLZGno3QrChv3R2jOt1vIDrwDx3twlI4G8PSTYWwH+0VOQUCPyEykNuNQrB
 wOEpADb4Tmrlg==
Message-ID: <8324911f-ff49-457c-9021-a860d2d4c0c7@kernel.org>
Date: Wed, 29 Oct 2025 14:38:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] accel/amdxdna: Fix incorrect command state for timed
 out job
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251029193423.2430463-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20251029193423.2430463-1-lizhi.hou@amd.com>
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

On 10/29/25 2:34 PM, Lizhi Hou wrote:
> When a command times out, mark it as ERT_CMD_STATE_TIMEOUT. Any other
> commands that are canceled due to this timeout should be marked as
> ERT_CMD_STATE_ABORT.
> 
> Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
>   drivers/accel/amdxdna/aie2_ctx.c    | 15 +++++++++++++--
>   drivers/accel/amdxdna/amdxdna_ctx.h |  1 +
>   2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index c6c473c78352..289a2aaf4cae 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -204,10 +204,13 @@ aie2_sched_resp_handler(void *handle, void __iomem *data, size_t size)
>   
>   	cmd_abo = job->cmd_bo;
>   
> -	if (unlikely(!data))
> +	if (unlikely(job->job_timeout)) {
> +		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_TIMEOUT);
> +		ret = -EINVAL;
>   		goto out;
> +	}
>   
> -	if (unlikely(size != sizeof(u32))) {
> +	if (unlikely(!data) || unlikely(size != sizeof(u32))) {
>   		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
>   		ret = -EINVAL;
>   		goto out;
> @@ -258,6 +261,13 @@ aie2_sched_cmdlist_resp_handler(void *handle, void __iomem *data, size_t size)
>   	int ret = 0;
>   
>   	cmd_abo = job->cmd_bo;
> +
> +	if (unlikely(job->job_timeout)) {
> +		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_TIMEOUT);
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
>   	if (unlikely(!data) || unlikely(size != sizeof(u32) * 3)) {
>   		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
>   		ret = -EINVAL;
> @@ -370,6 +380,7 @@ aie2_sched_job_timedout(struct drm_sched_job *sched_job)
>   
>   	xdna = hwctx->client->xdna;
>   	trace_xdna_job(sched_job, hwctx->name, "job timedout", job->seq);
> +	job->job_timeout = true;
>   	mutex_lock(&xdna->dev_lock);
>   	aie2_hwctx_stop(xdna, hwctx, sched_job);
>   
> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
> index cbe60efbe60b..919c654dfea6 100644
> --- a/drivers/accel/amdxdna/amdxdna_ctx.h
> +++ b/drivers/accel/amdxdna/amdxdna_ctx.h
> @@ -116,6 +116,7 @@ struct amdxdna_sched_job {
>   	/* user can wait on this fence */
>   	struct dma_fence	*out_fence;
>   	bool			job_done;
> +	bool			job_timeout;
>   	u64			seq;
>   	struct amdxdna_drv_cmd	*drv_cmd;
>   	struct amdxdna_gem_obj	*cmd_bo;

