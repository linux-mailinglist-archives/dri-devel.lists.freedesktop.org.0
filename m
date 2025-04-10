Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1567CA83A8E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 09:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E708F10E35F;
	Thu, 10 Apr 2025 07:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mzzVly9U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DE910E35F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 07:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744269387; x=1775805387;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=R4kkkcVVHPzCslI6+XyVJA1Y1Bm2lhw2qswzN6HQ8vk=;
 b=mzzVly9U/bnb9BNFggVlP2+UWY7HhAD3sU01pWzN6NT1ejvbKRQlBizc
 j+VNUfKbZSy6mWZoEQgdn9njN01ZQZ1iDbpy+XGum1FVTnttcUXDswDhq
 65YLm5OIoIAVcv38Dd3hWePQWVfNRE278gVyeyBEZ/Xc8Nc08fY3Lj3Qx
 P1JERz1hua25VWBv76M3YZFQSMUo00Fv87BD1KCZUy6eKOPl6Zm1bfIgN
 Y+y5eMF6RUHa2EaXRyLvwrNYA/XwbZBH8hI6yUBN7r6Th9Xa9ex3/c5lx
 dIJmNjnoNqtERQdP4VlVJXfO1k6x+FnDo2n/lTr1gjVMMdDAomQWkHZTu g==;
X-CSE-ConnectionGUID: NO1Okq8URayT5KqohF8dQQ==
X-CSE-MsgGUID: C3a3GIE2Twe9XelJeWBDtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="49612965"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="49612965"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 00:16:27 -0700
X-CSE-ConnectionGUID: AmHfHo1fRUGdHcMQwo/88g==
X-CSE-MsgGUID: bnLX8qyeRGWb5DOIaJhyUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="133788870"
Received: from kwywiol-mobl1.ger.corp.intel.com (HELO [10.245.83.152])
 ([10.245.83.152])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 00:16:25 -0700
Message-ID: <2435f0f1-fef4-4c7c-8584-55d5480ca245@linux.intel.com>
Date: Thu, 10 Apr 2025 09:16:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Fix incorrect size of ERT_START_NPU
 commands
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
 sonal.santan@amd.com, king.tam@amd.com
References: <20250409210013.10854-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250409210013.10854-1-lizhi.hou@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 4/9/2025 11:00 PM, Lizhi Hou wrote:
> When multiple ERT_START_NPU commands are combined in one buffer, the
> buffer size calculation is incorrect. Also, the condition to make sure
> the buffer size is not beyond 4K is also fixed.
> 
> Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>  drivers/accel/amdxdna/aie2_message.c  |  6 +++---
>  drivers/accel/amdxdna/aie2_msg_priv.h | 10 ++++------
>  2 files changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index bf4219e32cc1..82412eec9a4b 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -525,7 +525,7 @@ aie2_cmdlist_fill_one_slot_cf(void *cmd_buf, u32 offset,
>  	if (!payload)
>  		return -EINVAL;
>  
> -	if (!slot_cf_has_space(offset, payload_len))
> +	if (!slot_has_space(*buf, offset, payload_len))
>  		return -ENOSPC;
>  
>  	buf->cu_idx = cu_idx;
> @@ -558,7 +558,7 @@ aie2_cmdlist_fill_one_slot_dpu(void *cmd_buf, u32 offset,
>  	if (payload_len < sizeof(*sn) || arg_sz > MAX_DPU_ARGS_SIZE)
>  		return -EINVAL;
>  
> -	if (!slot_dpu_has_space(offset, arg_sz))
> +	if (!slot_has_space(*buf, offset, arg_sz))
>  		return -ENOSPC;
>  
>  	buf->inst_buf_addr = sn->buffer;
> @@ -569,7 +569,7 @@ aie2_cmdlist_fill_one_slot_dpu(void *cmd_buf, u32 offset,
>  	memcpy(buf->args, sn->prop_args, arg_sz);
>  
>  	/* Accurate buf size to hint firmware to do necessary copy */
> -	*size += sizeof(*buf) + arg_sz;
> +	*size = sizeof(*buf) + arg_sz;
>  	return 0;
>  }
>  
> diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h b/drivers/accel/amdxdna/aie2_msg_priv.h
> index 4e02e744b470..6df9065b13f6 100644
> --- a/drivers/accel/amdxdna/aie2_msg_priv.h
> +++ b/drivers/accel/amdxdna/aie2_msg_priv.h
> @@ -319,18 +319,16 @@ struct async_event_msg_resp {
>  } __packed;
>  
>  #define MAX_CHAIN_CMDBUF_SIZE SZ_4K
> -#define slot_cf_has_space(offset, payload_size) \
> -	(MAX_CHAIN_CMDBUF_SIZE - ((offset) + (payload_size)) > \
> -	 offsetof(struct cmd_chain_slot_execbuf_cf, args[0]))
> +#define slot_has_space(slot, offset, payload_size)		\
> +	(MAX_CHAIN_CMDBUF_SIZE >= (offset) + (payload_size) +	\
> +	 sizeof(typeof(slot)))
> +
>  struct cmd_chain_slot_execbuf_cf {
>  	__u32 cu_idx;
>  	__u32 arg_cnt;
>  	__u32 args[] __counted_by(arg_cnt);
>  };
>  
> -#define slot_dpu_has_space(offset, payload_size) \
> -	(MAX_CHAIN_CMDBUF_SIZE - ((offset) + (payload_size)) > \
> -	 offsetof(struct cmd_chain_slot_dpu, args[0]))
>  struct cmd_chain_slot_dpu {
>  	__u64 inst_buf_addr;
>  	__u32 inst_size;

