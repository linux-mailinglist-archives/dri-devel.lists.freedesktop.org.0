Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF683956AB
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 10:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031FF6E86D;
	Mon, 31 May 2021 08:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE596E87D
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 08:09:16 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622448557; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ngphtltYbiQKtxDI7jWMqer9BxRcg0aDjDo5g/4WJk0=;
 b=MlNVWB8MPpHGALOrrizplrQzTZdtm5dFjVAbv9y/NGXJ6cIplRiB1H3y/Pdeu/hckX9HW/DB
 uesfux2OE0d2epR6biKL9Bi9ia/KCxsYJOm6FX4hX/ruzRbwCKmAi4+oV6TezQXCpmgMmo/5
 qp0Gfyrr/chTGQkQ346HRnDOm2g=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60b499a7ea2aacd7297b4534 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 31 May 2021 08:09:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 839A6C43145; Mon, 31 May 2021 08:09:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from [192.168.1.105] (unknown [117.210.184.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 931DFC4338A;
 Mon, 31 May 2021 08:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 931DFC4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH v2 4/8] drm/msm/a6xx: update/fix CP_PROTECT initialization
To: Jonathan Marek <jonathan@marek.ca>, freedreno@lists.freedesktop.org
References: <20210513171431.18632-1-jonathan@marek.ca>
 <20210513171431.18632-5-jonathan@marek.ca>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <71d2a36c-1a83-9735-4063-e693ed0ca29c@codeaurora.org>
Date: Mon, 31 May 2021 13:39:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210513171431.18632-5-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/13/2021 10:43 PM, Jonathan Marek wrote:
> Update CP_PROTECT register programming based on downstream.
> 
> A6XX_PROTECT_RW is renamed to A6XX_PROTECT_NORDWR to make things aligned
> and also be more clear about what it does.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 143 +++++++++++++++++++-------
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h |   2 +-
>   2 files changed, 109 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 45a6a0fce7d7..909e3ff08f89 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -462,6 +462,113 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>   	gpu_write(gpu, REG_A6XX_RBBM_CLOCK_CNTL, state ? clock_cntl_on : 0);
>   }
>   
> +/* For a615, a616, a618, A619, a630, a640 and a680 */
> +static const u32 a6xx_protect[] = {
> +	A6XX_PROTECT_RDONLY(0x00000, 0x04ff),
> +	A6XX_PROTECT_RDONLY(0x00501, 0x0005),
> +	A6XX_PROTECT_RDONLY(0x0050b, 0x02f4),
> +	A6XX_PROTECT_NORDWR(0x0050e, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x00510, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x00534, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x00800, 0x0082),
> +	A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
> +	A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
> +	A6XX_PROTECT_RDONLY(0x008d0, 0x00bc),
> +	A6XX_PROTECT_NORDWR(0x00900, 0x004d),
> +	A6XX_PROTECT_NORDWR(0x0098d, 0x0272),
> +	A6XX_PROTECT_NORDWR(0x00e00, 0x0001),
> +	A6XX_PROTECT_NORDWR(0x00e03, 0x000c),
> +	A6XX_PROTECT_NORDWR(0x03c00, 0x00c3),
> +	A6XX_PROTECT_RDONLY(0x03cc4, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x08630, 0x01cf),
> +	A6XX_PROTECT_NORDWR(0x08e00, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x08e08, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x08e50, 0x001f),
> +	A6XX_PROTECT_NORDWR(0x09624, 0x01db),
> +	A6XX_PROTECT_NORDWR(0x09e70, 0x0001),
> +	A6XX_PROTECT_NORDWR(0x09e78, 0x0187),
> +	A6XX_PROTECT_NORDWR(0x0a630, 0x01cf),
> +	A6XX_PROTECT_NORDWR(0x0ae02, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x0ae50, 0x032f),
> +	A6XX_PROTECT_NORDWR(0x0b604, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x0be02, 0x0001),
> +	A6XX_PROTECT_NORDWR(0x0be20, 0x17df),
> +	A6XX_PROTECT_NORDWR(0x0f000, 0x0bff),
> +	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x11c00, 0x0000), /* note: infinite range */
> +};
> +
> +/* These are for a620 and a650 */
> +static const u32 a650_protect[] = {
> +	A6XX_PROTECT_RDONLY(0x00000, 0x04ff),
> +	A6XX_PROTECT_RDONLY(0x00501, 0x0005),
> +	A6XX_PROTECT_RDONLY(0x0050b, 0x02f4),
> +	A6XX_PROTECT_NORDWR(0x0050e, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x00510, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x00534, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x00800, 0x0082),
> +	A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
> +	A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
> +	A6XX_PROTECT_RDONLY(0x008d0, 0x00bc),
> +	A6XX_PROTECT_NORDWR(0x00900, 0x004d),
> +	A6XX_PROTECT_NORDWR(0x0098d, 0x0272),
> +	A6XX_PROTECT_NORDWR(0x00e00, 0x0001),
> +	A6XX_PROTECT_NORDWR(0x00e03, 0x000c),
> +	A6XX_PROTECT_NORDWR(0x03c00, 0x00c3),
> +	A6XX_PROTECT_RDONLY(0x03cc4, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x08630, 0x01cf),
> +	A6XX_PROTECT_NORDWR(0x08e00, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x08e08, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x08e50, 0x001f),
> +	A6XX_PROTECT_NORDWR(0x08e80, 0x027f),
> +	A6XX_PROTECT_NORDWR(0x09624, 0x01db),
> +	A6XX_PROTECT_NORDWR(0x09e60, 0x0011),
> +	A6XX_PROTECT_NORDWR(0x09e78, 0x0187),
> +	A6XX_PROTECT_NORDWR(0x0a630, 0x01cf),
> +	A6XX_PROTECT_NORDWR(0x0ae02, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x0ae50, 0x032f),
> +	A6XX_PROTECT_NORDWR(0x0b604, 0x0000),
> +	A6XX_PROTECT_NORDWR(0x0b608, 0x0007),
> +	A6XX_PROTECT_NORDWR(0x0be02, 0x0001),
> +	A6XX_PROTECT_NORDWR(0x0be20, 0x17df),
> +	A6XX_PROTECT_NORDWR(0x0f000, 0x0bff),
> +	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x18400, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x1a800, 0x1fff),
> +	A6XX_PROTECT_NORDWR(0x1f400, 0x0443),
> +	A6XX_PROTECT_RDONLY(0x1f844, 0x007b),
> +	A6XX_PROTECT_NORDWR(0x1f887, 0x001b),
> +	A6XX_PROTECT_NORDWR(0x1f8c0, 0x0000), /* note: infinite range */
> +};
> +
> +static void a6xx_set_cp_protect(struct msm_gpu *gpu)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	const u32 *regs = a6xx_protect;
> +	unsigned i, count = ARRAY_SIZE(a6xx_protect), count_max = 32;
> +
> +	BUILD_BUG_ON(ARRAY_SIZE(a6xx_protect) > 32);
> +	BUILD_BUG_ON(ARRAY_SIZE(a650_protect) > 48);
> +
> +	if (adreno_is_a650(adreno_gpu)) {
> +		regs = a650_protect;
> +		count = ARRAY_SIZE(a650_protect);
> +		count_max = 48;
> +	}
> +
> +	/*
> +	 * Enable access protection to privileged registers, fault on an access
> +	 * protect violation and select the last span to protect from the start
> +	 * address all the way to the end of the register address space
> +	 */
> +	gpu_write(gpu, REG_A6XX_CP_PROTECT_CNTL, BIT(0) | BIT(1) | BIT(3));
> +
> +	for (i = 0; i < count - 1; i++)
> +		gpu_write(gpu, REG_A6XX_CP_PROTECT(i), regs[i]);
> +	/* last CP_PROTECT to have "infinite" length on the last entry */
> +	gpu_write(gpu, REG_A6XX_CP_PROTECT(count_max - 1), regs[i]);
> +}
> +
>   static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>   {
>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> @@ -776,41 +883,7 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>   	}
>   
>   	/* Protect registers from the CP */
> -	gpu_write(gpu, REG_A6XX_CP_PROTECT_CNTL, 0x00000003);
> -
> -	gpu_write(gpu, REG_A6XX_CP_PROTECT(0),
> -		A6XX_PROTECT_RDONLY(0x600, 0x51));
> -	gpu_write(gpu, REG_A6XX_CP_PROTECT(1), A6XX_PROTECT_RW(0xae50, 0x2));
> -	gpu_write(gpu, REG_A6XX_CP_PROTECT(2), A6XX_PROTECT_RW(0x9624, 0x13));
> -	gpu_write(gpu, REG_A6XX_CP_PROTECT(3), A6XX_PROTECT_RW(0x8630, 0x8));
> -	gpu_write(gpu, REG_A6XX_CP_PROTECT(4), A6XX_PROTECT_RW(0x9e70, 0x1));
> -	gpu_write(gpu, REG_A6XX_CP_PROTECT(5), A6XX_PROTECT_RW(0x9e78, 0x187));
> -	gpu_write(gpu, REG_A6XX_CP_PROTECT(6), A6XX_PROTECT_RW(0xf000, 0x810));
> -	gpu_write(gpu, REG_A6XX_CP_PROTECT(7),
> -		A6XX_PROTECT_RDONLY(0xfc00, 0x3));
> -	gpu_write(gpu, REG_A6XX_CP_PROTECT(8), A6XX_PROTECT_RW(0x50e, 0x0));
> -	gpu_write(gpu, REG_A6XX_CP_PROTECT(9), A6XX_PROTECT_RDONLY(0x50f, 0x0));
> -	gpu_write(gpu, REG_A6XX_CP_PROTECT(10), A6XX_PROTECT_RW(0x510, 0x0));
> -	gpu_write(gpu, REG_A6XX_CP_PROTECT(11),
> -		A6XX_PROTECT_RDONLY(0x0, 0x4f9));
> -	gpu_write(gpu, REG_A6XX_CP_PROTECT(12),
> -		A6XX_PROTECT_RDONLY(0x501, 0xa));
> -	gpu_write(gpu, REG_A6XX_CP_PROTECT(13),
> -		A6XX_PROTECT_RDONLY(0x511, 0x44));
> -	gpu_write(gpu, REG_A6XX_CP_PROTECT(14), A6XX_PROTECT_RW(0xe00, 0xe));
> -	gpu_write(gpu, REG_A6XX_CP_PROTECT(15), A6XX_PROTECT_RW(0x8e00, 0x0));
> -	gpu_write(gpu, REG_A6XX_CP_PROTECT(16), A6XX_PROTECT_RW(0x8e50, 0xf));
> -	gpu_write(gpu, REG_A6XX_CP_PROTECT(17), A6XX_PROTECT_RW(0xbe02, 0x0));
> -	gpu_write(gpu, REG_A6XX_CP_PROTECT(18),
> -		A6XX_PROTECT_RW(0xbe20, 0x11f3));
> -	gpu_write(gpu, REG_A6XX_CP_PROTECT(19), A6XX_PROTECT_RW(0x800, 0x82));
> -	gpu_write(gpu, REG_A6XX_CP_PROTECT(20), A6XX_PROTECT_RW(0x8a0, 0x8));
> -	gpu_write(gpu, REG_A6XX_CP_PROTECT(21), A6XX_PROTECT_RW(0x8ab, 0x19));
> -	gpu_write(gpu, REG_A6XX_CP_PROTECT(22), A6XX_PROTECT_RW(0x900, 0x4d));
> -	gpu_write(gpu, REG_A6XX_CP_PROTECT(23), A6XX_PROTECT_RW(0x98d, 0x76));
> -	gpu_write(gpu, REG_A6XX_CP_PROTECT(24),
> -			A6XX_PROTECT_RDONLY(0x980, 0x4));
> -	gpu_write(gpu, REG_A6XX_CP_PROTECT(25), A6XX_PROTECT_RW(0xa630, 0x0));
> +	a6xx_set_cp_protect(gpu);
>   
>   	/* Enable expanded apriv for targets that support it */
>   	if (gpu->hw_apriv) {
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index ce0610c5256f..bb544dfe5737 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -44,7 +44,7 @@ struct a6xx_gpu {
>    * REG_CP_PROTECT_REG(n) - this will block both reads and writes for _len
>    * registers starting at _reg.
>    */
> -#define A6XX_PROTECT_RW(_reg, _len) \
> +#define A6XX_PROTECT_NORDWR(_reg, _len) \
>   	((1 << 31) | \
>   	(((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
>   
> 

Reviewed-by: Akhil P Oommen <akhilpo@codeaurora.org>

-Akhil
