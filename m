Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C99397381
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 14:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE7A6EA47;
	Tue,  1 Jun 2021 12:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1696EA47
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 12:48:22 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 151Clde2004573; Tue, 1 Jun 2021 14:48:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=z1+Wnvit74uNghN0bCNQj3HecsTBaLmiImgMis/YHwU=;
 b=m6qN6D0NZd1nY03SCvG9oPy643X1C31egKw8bmra2oATxq+McoF7xMx2fOlta7uFfA2h
 PJFzo40m6sYSPuNf8l3wa5gp5AlmfObcpWO4M2D8DwzIaCgsqAnDvk/SpeH5beTUNtnP
 1SQXU3hREOMkH8J1vIcpHxu8yPpC4/CHdbtzJwRA1M6zcQ0Ot1eNSGPxg8udNQIhGE0W
 txycQaNThTJrCMgPeGH4MSCrIAOdVsX2t6lgoJYueHn1luimRFtraLnEDfvDvbFzSGZf
 RpZEGF6XCbR9VGrjjC47fcx0bd6USzk8vuuGB+tIdput8Zwts+gVBUNz7g6VxbcevsWt HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38wjdg0xth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 14:48:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3C7BC10002A;
 Tue,  1 Jun 2021 14:48:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2565322176F;
 Tue,  1 Jun 2021 14:48:12 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 1 Jun
 2021 14:48:11 +0200
Subject: Re: [PATCH 3/4] clk: stm32: Fix stm32f429's ltdc driver hang in set
 clock rate
To: <dillon.minfei@gmail.com>, <pierre-yves.mordret@foss.st.com>,
 <alain.volmat@foss.st.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <mturquette@baylibre.com>
References: <1620990152-19255-1-git-send-email-dillon.minfei@gmail.com>
 <1620990152-19255-4-git-send-email-dillon.minfei@gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <6ecedc1d-3b80-0eba-a5f0-8feb3eae16cf@foss.st.com>
Date: Tue, 1 Jun 2021 14:48:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1620990152-19255-4-git-send-email-dillon.minfei@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-01_06:2021-05-31,
 2021-06-01 signatures=0
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
Cc: sboyd@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dillon

On 5/14/21 1:02 PM, dillon.minfei@gmail.com wrote:
> From: Dillon Min <dillon.minfei@gmail.com>
> 
> This is due to misuse ‘PLL_VCO_SAI' and'PLL_SAI' in clk-stm32f4.c
> 'PLL_SAI' is 2, 'PLL_VCO_SAI' is 7(defined in
> include/dt-bindings/clock/stm32fx-clock.h).
> 
> 'post_div' point to 'post_div_data[]', 'post_div->pll_num'
> is PLL_I2S or PLL_SAI.
> 
> 'clks[PLL_VCO_SAI]' has valid 'struct clk_hw* ' return
> from stm32f4_rcc_register_pll() but, at line 1777 of
> driver/clk/clk-stm32f4.c, use the 'clks[post_div->pll_num]',
> equal to 'clks[PLL_SAI]', this is invalid array member at that time.
> 
> Fixes: 517633ef630e ("clk: stm32f4: Add post divisor for I2S & SAI PLLs")
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Link: https://lore.kernel.org/linux-arm-kernel/1590564453-24499-6-git-send-email-dillon.minfei@gmail.com/
> ---
>  drivers/clk/clk-stm32f4.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
> index 18117ce5ff85..42ca2dd86aea 100644
> --- a/drivers/clk/clk-stm32f4.c
> +++ b/drivers/clk/clk-stm32f4.c
> @@ -557,13 +557,13 @@ static const struct clk_div_table post_divr_table[] = {
>  
>  #define MAX_POST_DIV 3
>  static const struct stm32f4_pll_post_div_data  post_div_data[MAX_POST_DIV] = {
> -	{ CLK_I2SQ_PDIV, PLL_I2S, "plli2s-q-div", "plli2s-q",
> +	{ CLK_I2SQ_PDIV, PLL_VCO_I2S, "plli2s-q-div", "plli2s-q",
>  		CLK_SET_RATE_PARENT, STM32F4_RCC_DCKCFGR, 0, 5, 0, NULL},
>  
> -	{ CLK_SAIQ_PDIV, PLL_SAI, "pllsai-q-div", "pllsai-q",
> +	{ CLK_SAIQ_PDIV, PLL_VCO_SAI, "pllsai-q-div", "pllsai-q",
>  		CLK_SET_RATE_PARENT, STM32F4_RCC_DCKCFGR, 8, 5, 0, NULL },
>  
> -	{ NO_IDX, PLL_SAI, "pllsai-r-div", "pllsai-r", CLK_SET_RATE_PARENT,
> +	{ NO_IDX, PLL_VCO_SAI, "pllsai-r-div", "pllsai-r", CLK_SET_RATE_PARENT,
>  		STM32F4_RCC_DCKCFGR, 16, 2, 0, post_divr_table },
>  };
>  
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
