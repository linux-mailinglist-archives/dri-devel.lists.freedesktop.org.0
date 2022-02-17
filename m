Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 788DE4B94FD
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 01:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0CB10E6BE;
	Thu, 17 Feb 2022 00:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082A610E6BE;
 Thu, 17 Feb 2022 00:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645057618; x=1676593618;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=y05geqmrQ9ZeRXmFPhxCXjZFV0vZVQsVvgL7YGLNM/8=;
 b=JzSsDLBVZh08sQAbOssc0+FD+b0ptZLHxEqQLMavRHAP1xH8Deill46X
 CJgehYSkcrEX5srv+mkJOQ7BoZlXh8TxSvb9uK1mbCjE0sCMwWy3vMau3
 BS7RxY/LbvBmfIyQYvm3LEInUSCCfQHtouc11xZLLL652yYCWh1/div5k 0=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 16 Feb 2022 16:26:57 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 16:26:57 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 16 Feb 2022 16:26:56 -0800
Received: from [10.111.174.92] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Wed, 16 Feb
 2022 16:26:54 -0800
Message-ID: <7ddea5fb-bf7d-3531-31fa-ef24b3e4b2f3@quicinc.com>
Date: Wed, 16 Feb 2022 16:26:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] drm/msm/dsi/phy: fix 7nm v4.0 settings for C-PHY mode
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220217000837.435340-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220217000837.435340-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/16/2022 4:08 PM, Dmitry Baryshkov wrote:
> The dsi_7nm_phy_enable() disagrees with downstream for
> glbl_str_swi_cal_sel_ctrl and glbl_hstx_str_ctrl_0 values. Update
> programmed settings to match downstream driver. To remove the
> possibility for such errors in future drop less_than_1500_mhz
> assignment and specify settings explicitly.
> 
> Fixes: 5ac178381d26 ("drm/msm/dsi: support CPHY mode for 7nm pll/phy")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Yes, this matches what we have downstream
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 22 ++++++++++++++--------
>   1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 36eb6109cb88..6e506feb111f 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -864,20 +864,26 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>   	/* Alter PHY configurations if data rate less than 1.5GHZ*/
>   	less_than_1500_mhz = (clk_req->bitclk_rate <= 1500000000);
>   
> -	/* For C-PHY, no low power settings for lower clk rate */
> -	if (phy->cphy_mode)
> -		less_than_1500_mhz = false;
> -
>   	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
>   		vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
> -		glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x00;
> -		glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x39 :  0x3c;
> +		if (phy->cphy_mode) {
> +			glbl_rescode_top_ctrl = 0x00;
> +			glbl_rescode_bot_ctrl = 0x3c;
> +		} else {
> +			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x00;
> +			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x39 :  0x3c;
> +		}
>   		glbl_str_swi_cal_sel_ctrl = 0x00;
>   		glbl_hstx_str_ctrl_0 = 0x88;
>   	} else {
>   		vreg_ctrl_0 = less_than_1500_mhz ? 0x5B : 0x59;
> -		glbl_str_swi_cal_sel_ctrl = less_than_1500_mhz ? 0x03 : 0x00;
> -		glbl_hstx_str_ctrl_0 = less_than_1500_mhz ? 0x66 : 0x88;
> +		if (phy->cphy_mode) {
> +			glbl_str_swi_cal_sel_ctrl = 0x03;
> +			glbl_hstx_str_ctrl_0 = 0x66;
> +		} else {
> +			glbl_str_swi_cal_sel_ctrl = less_than_1500_mhz ? 0x03 : 0x00;
> +			glbl_hstx_str_ctrl_0 = less_than_1500_mhz ? 0x66 : 0x88;
> +		}
>   		glbl_rescode_top_ctrl = 0x03;
>   		glbl_rescode_bot_ctrl = 0x3c;
>   	}
