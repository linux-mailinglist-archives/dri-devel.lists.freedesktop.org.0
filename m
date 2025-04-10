Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E99E3A83B11
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 09:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31FED10E797;
	Thu, 10 Apr 2025 07:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IgA0sRk1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 075A510E797
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 07:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744270070; x=1775806070;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TwnvfPt/TL+i31Vomhoucp1/M91C0a/vc29S/00fXTs=;
 b=IgA0sRk11IT8KHxe71Duk0ZW1SvZ8whq9S8rsb64MfiIu2F15P6UHDQc
 7ayrSISeBsXLnPFtbL08hztn39LfmCDYmWrUYfavLezdiJQSmPM0HMzh5
 3j4CHz86XrLYXldtaJfqHSFsTI3zs5q2avYsR42xDHXWOeBK59NeJDTQf
 GmRoV+BuNQG59mFWxUY5Ee9Y0UmZnZVCsK7WEzVAi0KDniymCNmeGiE+G
 qJiIR4cFVQbkP23ZBHX0mxdFvgVzDyggqgtIylOm9Ys/otM9aJVcguwKK
 JLCzo6jNRWrbp+sYDcs+ZLgbqZMLICnS6BSUkTORSMHQfaCy2qgd8JcWl A==;
X-CSE-ConnectionGUID: J/Gba1XWQ06pUtcogyJCcA==
X-CSE-MsgGUID: pGZhzWq5QDiV2jowUDFK7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="55950943"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="55950943"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 00:27:50 -0700
X-CSE-ConnectionGUID: uLAbzCWFTR2MgxS462ZAPA==
X-CSE-MsgGUID: X3mVDlMwTL+3vFhQcO4wsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="151997812"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.245.121.109])
 ([10.245.121.109])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 00:27:47 -0700
Message-ID: <c55d3198-0fcc-4104-936d-f1ffd140ae14@linux.intel.com>
Date: Thu, 10 Apr 2025 09:27:21 +0200
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
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <20250409210013.10854-1-lizhi.hou@amd.com>
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

On 4/9/2025 11:00 PM, Lizhi Hou wrote:

> When multiple ERT_START_NPU commands are combined in one buffer, the
> buffer size calculation is incorrect. Also, the condition to make sure
> the buffer size is not beyond 4K is also fixed.
>
> Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_message.c  |  6 +++---
>   drivers/accel/amdxdna/aie2_msg_priv.h | 10 ++++------
>   2 files changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index bf4219e32cc1..82412eec9a4b 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -525,7 +525,7 @@ aie2_cmdlist_fill_one_slot_cf(void *cmd_buf, u32 offset,
>   	if (!payload)
>   		return -EINVAL;
>   
> -	if (!slot_cf_has_space(offset, payload_len))
> +	if (!slot_has_space(*buf, offset, payload_len))
>   		return -ENOSPC;
>   
>   	buf->cu_idx = cu_idx;
> @@ -558,7 +558,7 @@ aie2_cmdlist_fill_one_slot_dpu(void *cmd_buf, u32 offset,
>   	if (payload_len < sizeof(*sn) || arg_sz > MAX_DPU_ARGS_SIZE)
>   		return -EINVAL;
>   
> -	if (!slot_dpu_has_space(offset, arg_sz))
> +	if (!slot_has_space(*buf, offset, arg_sz))
>   		return -ENOSPC;
>   
>   	buf->inst_buf_addr = sn->buffer;
> @@ -569,7 +569,7 @@ aie2_cmdlist_fill_one_slot_dpu(void *cmd_buf, u32 offset,
>   	memcpy(buf->args, sn->prop_args, arg_sz);
>   
>   	/* Accurate buf size to hint firmware to do necessary copy */
> -	*size += sizeof(*buf) + arg_sz;
> +	*size = sizeof(*buf) + arg_sz;
>   	return 0;
>   }
>   
> diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h b/drivers/accel/amdxdna/aie2_msg_priv.h
> index 4e02e744b470..6df9065b13f6 100644
> --- a/drivers/accel/amdxdna/aie2_msg_priv.h
> +++ b/drivers/accel/amdxdna/aie2_msg_priv.h
> @@ -319,18 +319,16 @@ struct async_event_msg_resp {
>   } __packed;
>   
>   #define MAX_CHAIN_CMDBUF_SIZE SZ_4K
> -#define slot_cf_has_space(offset, payload_size) \
> -	(MAX_CHAIN_CMDBUF_SIZE - ((offset) + (payload_size)) > \
> -	 offsetof(struct cmd_chain_slot_execbuf_cf, args[0]))

Could this macro be rewritten as static inline function?
That would provide additional typecheck.

> +#define slot_has_space(slot, offset, payload_size)		\
> +	(MAX_CHAIN_CMDBUF_SIZE >= (offset) + (payload_size) +	\
> +	 sizeof(typeof(slot)))
> +
>   struct cmd_chain_slot_execbuf_cf {
>   	__u32 cu_idx;
>   	__u32 arg_cnt;
>   	__u32 args[] __counted_by(arg_cnt);
>   };
>   
> -#define slot_dpu_has_space(offset, payload_size) \
> -	(MAX_CHAIN_CMDBUF_SIZE - ((offset) + (payload_size)) > \
> -	 offsetof(struct cmd_chain_slot_dpu, args[0]))
>   struct cmd_chain_slot_dpu {
>   	__u64 inst_buf_addr;
>   	__u32 inst_size;

Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

Best regards,
Maciej
