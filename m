Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E89FBC5821
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 17:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96F110E849;
	Wed,  8 Oct 2025 15:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TTG5irjh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8478E10E85F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 15:03:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 346FC40475;
 Wed,  8 Oct 2025 15:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1CEC4CEE7;
 Wed,  8 Oct 2025 15:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759935825;
 bh=bTO4eQ7sdiDVbau4hRFaoBOduo/himBoHKTVgRQAWak=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TTG5irjh+c4NlBzW0xbWfcvnyEKO0TJm56Yz86sy8os96eeiooHK92V+nCVCArA6X
 Dn2weJ4Eoc0N90LHBkKRcTcAJsm7j8KMhPLa6ecA3ct45Ryjf81KATSX+bzkC8V9tC
 TeWD+o1Sw4WBJRVDQ3r2eOnp4ofxz3y2zwxJNNqrUEPHe3Z/eIxA4q79peKPkGmKfs
 RHyWAionzRgxxvjLCWTKkS37xlB0Sgil6Xs4+cNI9SKeXRp/AZ06LrGxputlxp8903
 auY8MdTBIm5QIjGTZd7nc8ep11Dfn8YdvFdK+Gho6Eyrr+UYYo2VNtmOWlNLsKLztd
 RCSQ87tbkweMw==
Message-ID: <bb0e5610-2c59-4d74-9585-d9238e7143d6@kernel.org>
Date: Wed, 8 Oct 2025 10:03:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/amdxdna: Resume power for creating and destroying
 hardware context
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251008045324.4171807-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20251008045324.4171807-1-lizhi.hou@amd.com>
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

On 10/7/25 11:53 PM, Lizhi Hou wrote:
> When the hardware is powered down by auto-suspend, creating or destroying
> a hardware context without resuming power will fail.
> Call amdxdna_pm_resume_get() before requesting the hardware to create or
> destroy a hardware context.
> 
> Fixes: 063db451832b ("accel/amdxdna: Enhance runtime power management")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> ---
>   drivers/accel/amdxdna/aie2_ctx.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 691fdb3b008f..ab4d66f1325d 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -610,10 +610,14 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>   		goto free_entity;
>   	}
>   
> +	ret = amdxdna_pm_resume_get(xdna);
> +	if (ret)
> +		goto free_col_list;
> +
>   	ret = aie2_alloc_resource(hwctx);
>   	if (ret) {
>   		XDNA_ERR(xdna, "Alloc hw resource failed, ret %d", ret);
> -		goto free_col_list;
> +		goto suspend_put;
>   	}
>   
>   	ret = aie2_map_host_buf(xdna->dev_handle, hwctx->fw_ctx_id,
> @@ -628,6 +632,7 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>   		XDNA_ERR(xdna, "Create syncobj failed, ret %d", ret);
>   		goto release_resource;
>   	}
> +	amdxdna_pm_suspend_put(xdna);
>   
>   	hwctx->status = HWCTX_STAT_INIT;
>   	ndev = xdna->dev_handle;
> @@ -640,6 +645,8 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>   
>   release_resource:
>   	aie2_release_resource(hwctx);
> +suspend_put:
> +	amdxdna_pm_suspend_put(xdna);
>   free_col_list:
>   	kfree(hwctx->col_list);
>   free_entity:

