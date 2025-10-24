Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AF0C07A2C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 20:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0764D10E21F;
	Fri, 24 Oct 2025 18:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lAL7h7QP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D7710E21F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 18:06:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D17A94071B;
 Fri, 24 Oct 2025 18:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F87C4CEF1;
 Fri, 24 Oct 2025 18:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761329214;
 bh=bpc9EJB0C6+gnjPk37f7XRoPAqWZqra/0c76+xPUqjc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lAL7h7QPJP25WTUwcxLqpvdq14E7rmzjdOXlQE7mD1KUmmCyroRSMXmhUpIolFKDe
 /cdwxgi+NWuiUpVmod45hHJ4qSfC6V3Mio07b0eKF8XXM+kfe284zyd8XiGymwx+oG
 GeMUdz4NU9+TYS4JsM8gT96YOzxwqkqwgD4Iyll0wDVP8zlilIb3WAFrNRNUhFE/jV
 0SrL8OeDqIc6Zv1qguUpWhuBojtbhw39xIMbqZE/CAULlxDqOU5/uK3R8FydZZMmj8
 nVa7772DvbCV54LRxP0RuaXra9M3Mfa5HjXKu9OBU2LDWZLZWYmUpq6UsfhIS+p0uu
 IHYMts4WkshcA==
Message-ID: <69e9de18-4553-474d-b7b0-d3ff3c2efbc5@kernel.org>
Date: Fri, 24 Oct 2025 13:06:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/amdxdna: Fix incorrect return value in
 aie2_hwctx_sync_debug_bo()
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com,
 dan.carpenter@linaro.org, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251024162608.1544842-1-lizhi.hou@amd.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20251024162608.1544842-1-lizhi.hou@amd.com>
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



On 10/24/2025 11:26 AM, Lizhi Hou wrote:
> When the driver issues the SYNC_DEBUG_BO command, it currently returns 0
> even if the firmware fails to execute the command. Update the driver to
> return -EINVAL in this case to properly indicate the failure.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/dri-devel/aPsadTBXunUSBByV@stanley.mountain/
> Fixes: 7ea046838021 ("accel/amdxdna: Support firmware debug buffer")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
>   drivers/accel/amdxdna/aie2_ctx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 63450b7773ac..c6c473c78352 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -879,7 +879,7 @@ int aie2_hwctx_sync_debug_bo(struct amdxdna_hwctx *hwctx, u32 debug_bo_hdl)
>   	aie2_cmd_wait(hwctx, seq);
>   	if (cmd.result) {
>   		XDNA_ERR(xdna, "Response failure 0x%x", cmd.result);
> -		return ret;
> +		return -EINVAL;
>   	}
>   
>   	return 0;

