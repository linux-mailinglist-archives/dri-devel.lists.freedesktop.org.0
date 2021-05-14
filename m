Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B99438134E
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 23:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820996E4B7;
	Fri, 14 May 2021 21:43:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE946E4B7;
 Fri, 14 May 2021 21:43:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCDDD613BE;
 Fri, 14 May 2021 21:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621028627;
 bh=nFTNUf+AC7R9gxTMKt09zZHN/guSnHnnI1FujB9AH4U=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=L5RmQoLBbE2UEZsWCu0+0kvKidJh63T2v+p4gRnylG1h77+uBj98JrmJ5TkypzhVy
 ym3enc5S4inHywFlfxoakfpUsohLOWdp5vgubY44DNDQv8Gz72ZA5BkciujmfCn2PM
 bSs1QuUo9kS/jXsXeT5VUGJxIzoe7mPoo9sF+0i+RCBfD67A9rVgqDIf5aQcpcZw6s
 UtbcpNHZC6EBsGCSlCL333Bh60VpglUptmCKnwQxHQZPghAboe+V5Tmy+67WUYSm/V
 cAzEQD6W3u6P7fR4yXU45kodJY2vQBRm1/6VHFWqq5wnVLyhiCqoaAXHFPU3u3cEGu
 ZZlDxSAG2TCUQ==
Subject: Re: [PATCH] drm/msm/dsi: fix 32-bit clang warning
To: Arnd Bergmann <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210514213032.575161-1-arnd@kernel.org>
From: Nathan Chancellor <nathan@kernel.org>
Message-ID: <58a35b85-eb0e-bc02-29be-0cae46bd75b8@kernel.org>
Date: Fri, 14 May 2021 14:43:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210514213032.575161-1-arnd@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jonathan Marek <jonathan@marek.ca>,
 linux-arm-msm@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 clang-built-linux@googlegroups.com, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/14/2021 2:30 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang is a little overzealous with warning about a constant conversion
> in an untaken branch of a ternary expression:
> 
> drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c:975:48: error: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 5000000000 to 705032704 [-Werror,-Wconstant-conversion]
>          .max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000UL : ULONG_MAX,
>                                                        ^~~~~~~~~~~~
> 
> Rewrite this to use a preprocessor conditional instead to avoid the
> warning.
> 
> Fixes: 076437c9e360 ("drm/msm/dsi: move min/max PLL rate to phy config")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> As found with another patch, using __builtin_choose_expr() would
> likely also work here, but doesn't seem any more readable.
> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index e76ce40a12ab..accd6b4eb7c2 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -972,7 +972,11 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
>   		.restore_pll_state = dsi_7nm_pll_restore_state,
>   	},
>   	.min_pll_rate = 600000000UL,
> -	.max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : ULONG_MAX,
> +#ifdef CONFIG_64BIT
> +	.max_pll_rate = 5000000000UL,
> +#else
> +	.max_pll_rate = ULONG_MAX,
> +#endif
>   	.io_start = { 0xae94400, 0xae96400 },
>   	.num_dsi_phy = 2,
>   	.quirks = DSI_PHY_7NM_QUIRK_V4_1,
> 

