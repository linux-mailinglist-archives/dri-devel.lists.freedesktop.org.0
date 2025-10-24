Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 076F0C07A3A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 20:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5530110E21C;
	Fri, 24 Oct 2025 18:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LQ145hsb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE8410E21C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 18:07:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 335B660359;
 Fri, 24 Oct 2025 18:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDFF0C4CEF1;
 Fri, 24 Oct 2025 18:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761329249;
 bh=bmggU36ceoDEHjQnL5JWPPaxZ1V+czGHvRvHOw8ejC8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LQ145hsbWkZ5clP50TqC6FZRD74+evtYypkoQrbs/4Wx0G5GZQSMwuimTjPnAlPo+
 8R/PA0Jz1l9URmHlAI6FU4AQwLcqzeFJwg5GaMQCmTtvN9vKW14C0l/zO8H47SIC5v
 We2TCT8EJfbEXnrUsuDhzK0oYTCHfo6wQifaY7tuWJLfngyPxLo/3fqNHn/pjgpR+w
 CfSFKgQWeJA0v1DmabXH1lYjtRimVVqBtzceQpBDk+2rb4p4aw3VraXB9b0j9Q8KI6
 XGcDQL5EO1IVHPoApDLpvrt2+64SeYfRtTRn7Co4ymPXHSJKSKLSLxN3pKgbIEBWGd
 fmcpPxj6DH0aQ==
Message-ID: <ab69ff44-14a5-4f65-a026-c08d9931c2c1@kernel.org>
Date: Fri, 24 Oct 2025 13:07:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/amdxdna: Fix uninitialized return value
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251024165503.1548131-1-lizhi.hou@amd.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20251024165503.1548131-1-lizhi.hou@amd.com>
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



On 10/24/2025 11:55 AM, Lizhi Hou wrote:
> In aie2_get_hwctx_status() and aie2_query_ctx_status_array(), the
> functions could return an uninitialized value in some cases. Update them
> to always return 0. The amount of valid results is indicated by the
> returned buffer_size, element_size, and num_element fields.
> 
> Fixes: 2f509fe6a42c ("accel/amdxdna: Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
>   drivers/accel/amdxdna/aie2_pci.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index f48045318dc0..f1a8112b080f 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -822,7 +822,7 @@ static int aie2_get_hwctx_status(struct amdxdna_client *client,
>   	}
>   
>   	args->buffer_size -= (u32)(array_args.buffer - args->buffer);
> -	return ret;
> +	return 0;
>   }
>   
>   static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_info *args)
> @@ -904,7 +904,7 @@ static int aie2_query_ctx_status_array(struct amdxdna_client *client,
>   	args->num_element = (u32)((array_args.buffer - args->buffer) /
>   				  args->element_size);
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static int aie2_get_array(struct amdxdna_client *client,

