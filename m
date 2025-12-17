Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAB7CC929E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 18:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FCC10E00E;
	Wed, 17 Dec 2025 17:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bvN5sCeX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A42610E00E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 17:59:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A7B0A44289;
 Wed, 17 Dec 2025 17:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB368C4CEFB;
 Wed, 17 Dec 2025 17:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765994371;
 bh=wALtr2tcbQhqQcGVuTwW3Z/U09IJXVcKgjs3CxqF6kU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bvN5sCeXaxUsMGuNik4UF4MNEtmnyc320c0QHwm9OZWqi/+9H35Sl/BF0wxb7kP36
 kSiSSWR2xMqbAWifgNZ1dXn4F0UQPRUqZVijkAOWOvdh5vEBBzB90wEtQ8i7uPqNy/
 YWxCveQf8qu3kq6PFkG+YijhBDlkA+xUwrBxYIp8pgzPE4DsZuu7ovvStJgY4upPzj
 HV4ne2SW4lvKXv1Fina4oLWFvvhfO3rvBLmtgCb25DdEC5c2nRmJE/uMugizdG2qfb
 WS+w+WiS82KQzKgJVvmjcRZuIfnMBPZcMiQtyDeGEWXd2JgzTuykP34yw6IEvtULlZ
 zfK5pfH6x22ww==
Message-ID: <ef6e71e2-ee6f-49d8-981b-97ba2fe13e92@kernel.org>
Date: Wed, 17 Dec 2025 11:59:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Enable hardware context priority
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251217171719.2139025-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20251217171719.2139025-1-lizhi.hou@amd.com>
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

On 12/17/25 11:17 AM, Lizhi Hou wrote:
> Newer firmware supports hardware context priority. Set the priority based
> on application input.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

This change itself is fine, but while reviewing it I did have a question 
to ask.

I notice that NPU2, NPU4, NPU5 and NPU6 all use npu4_fw_feature_table. 
Is this feature really present in F/W for NPU2 devices too?  Or it's 
really only NPU4 and later feature?

IE I just wonder if it's a non-obvious problem that npu2 device should 
have it's own fw feature table rather than re-use NPU4's.  NPU1 has it's 
own feature table.

> ---
>   drivers/accel/amdxdna/aie2_message.c  | 23 ++++++++++++++++++++++-
>   drivers/accel/amdxdna/aie2_msg_priv.h |  5 +++++
>   include/uapi/drm/amdxdna_accel.h      |  8 ++++++++
>   3 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index e77a353cadc5..051f4ceaabae 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -205,6 +205,27 @@ static int aie2_destroy_context_req(struct amdxdna_dev_hdl *ndev, u32 id)
>   
>   	return ret;
>   }
> +
> +static u32 aie2_get_context_priority(struct amdxdna_dev_hdl *ndev,
> +				     struct amdxdna_hwctx *hwctx)
> +{
> +	if (!AIE2_FEATURE_ON(ndev, AIE2_PREEMPT))
> +		return PRIORITY_HIGH;
> +
> +	switch (hwctx->qos.priority) {
> +	case AMDXDNA_QOS_REALTIME_PRIORITY:
> +		return PRIORITY_REALTIME;
> +	case AMDXDNA_QOS_HIGH_PRIORITY:
> +		return PRIORITY_HIGH;
> +	case AMDXDNA_QOS_NORMAL_PRIORITY:
> +		return PRIORITY_NORMAL;
> +	case AMDXDNA_QOS_LOW_PRIORITY:
> +		return PRIORITY_LOW;
> +	default:
> +		return PRIORITY_HIGH;
> +	}
> +}
> +
>   int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx)
>   {
>   	DECLARE_AIE2_MSG(create_ctx, MSG_OP_CREATE_CONTEXT);
> @@ -221,7 +242,7 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
>   	req.num_unused_col = hwctx->num_unused_col;
>   	req.num_cq_pairs_requested = 1;
>   	req.pasid = hwctx->client->pasid;
> -	req.context_priority = 2;
> +	req.context_priority = aie2_get_context_priority(ndev, hwctx);
>   
>   	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
>   	if (ret)
> diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h b/drivers/accel/amdxdna/aie2_msg_priv.h
> index cc912b7899ce..728ef56f7f0a 100644
> --- a/drivers/accel/amdxdna/aie2_msg_priv.h
> +++ b/drivers/accel/amdxdna/aie2_msg_priv.h
> @@ -108,6 +108,11 @@ struct cq_pair {
>   	struct cq_info i2x_q;
>   };
>   
> +#define PRIORITY_REALTIME	1
> +#define PRIORITY_HIGH		2
> +#define PRIORITY_NORMAL		3
> +#define PRIORITY_LOW		4
> +
>   struct create_ctx_req {
>   	__u32	aie_type;
>   	__u8	start_col;
> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
> index 62c917fd4f7b..9c44db2b3dcd 100644
> --- a/include/uapi/drm/amdxdna_accel.h
> +++ b/include/uapi/drm/amdxdna_accel.h
> @@ -19,6 +19,14 @@ extern "C" {
>   #define AMDXDNA_INVALID_BO_HANDLE	0
>   #define AMDXDNA_INVALID_FENCE_HANDLE	0
>   
> +/*
> + * Define hardware context priority
> + */
> +#define AMDXDNA_QOS_REALTIME_PRIORITY	0x100
> +#define AMDXDNA_QOS_HIGH_PRIORITY	0x180
> +#define AMDXDNA_QOS_NORMAL_PRIORITY	0x200
> +#define AMDXDNA_QOS_LOW_PRIORITY	0x280
> +
>   enum amdxdna_device_type {
>   	AMDXDNA_DEV_TYPE_UNKNOWN = -1,
>   	AMDXDNA_DEV_TYPE_KMQ,

