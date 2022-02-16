Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B89274B91BB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 20:49:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D31710E446;
	Wed, 16 Feb 2022 19:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59A010E220;
 Wed, 16 Feb 2022 19:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645040952; x=1676576952;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uttn9/DySER6QLvzk9CdFYOB7YGwLWPHJwLCb82MXjs=;
 b=AC5PfQO4IIqbqKJhGtPuV9vZXX/r6rAgjVWQI48sg1EHBBvnSgOyj8dn
 xuO6dgPW5bSnp+QquTFYvs+AtmCWeQIHv1ZxuKUZluLFOZ2wRxYLedOmU
 3Yw5nEJ27Qp2WHK/275cfeKHKVZL1C2jIi2Rxfko7rgsHjdV4Vhk2Hp7Y c=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 16 Feb 2022 11:49:11 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 11:49:11 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 16 Feb 2022 11:49:10 -0800
Received: from [10.111.168.21] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Wed, 16 Feb
 2022 11:49:08 -0800
Message-ID: <a65a62ab-427f-3a5a-b633-2c457f797dab@quicinc.com>
Date: Wed, 16 Feb 2022 11:49:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [REPOST PATCH v4 04/13] drm/msm/disp/dpu1: Add support for DSC in
 pingpong block
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-5-vkoul@kernel.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220210103423.271016-5-vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/10/2022 2:34 AM, Vinod Koul wrote:
> In SDM845, DSC can be enabled by writing to pingpong block registers, so
> add support for DSC in hw_pp
> 
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>

For the sake of uniformity, please use

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 32 +++++++++++++++++++
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 14 ++++++++
>   2 files changed, 46 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 55766c97c4c8..47c6ab6caf95 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -28,6 +28,9 @@
>   #define PP_FBC_MODE                     0x034
>   #define PP_FBC_BUDGET_CTL               0x038
>   #define PP_FBC_LOSSY_MODE               0x03C
> +#define PP_DSC_MODE                     0x0a0
> +#define PP_DCE_DATA_IN_SWAP             0x0ac
> +#define PP_DCE_DATA_OUT_SWAP            0x0c8
>   
>   #define PP_DITHER_EN			0x000
>   #define PP_DITHER_BITDEPTH		0x004
> @@ -245,6 +248,32 @@ static u32 dpu_hw_pp_get_line_count(struct dpu_hw_pingpong *pp)
>   	return line;
>   }
>   
> +static int dpu_hw_pp_dsc_enable(struct dpu_hw_pingpong *pp)
> +{
> +	struct dpu_hw_blk_reg_map *c = &pp->hw;
> +
> +	DPU_REG_WRITE(c, PP_DSC_MODE, 1);
> +	return 0;
> +}
> +
> +static void dpu_hw_pp_dsc_disable(struct dpu_hw_pingpong *pp)
> +{
> +	struct dpu_hw_blk_reg_map *c = &pp->hw;
> +
> +	DPU_REG_WRITE(c, PP_DSC_MODE, 0);
> +}
> +
> +static int dpu_hw_pp_setup_dsc(struct dpu_hw_pingpong *pp)
> +{
> +	struct dpu_hw_blk_reg_map *pp_c = &pp->hw;
> +	int data;
> +
> +	data = DPU_REG_READ(pp_c, PP_DCE_DATA_OUT_SWAP);
> +	data |= BIT(18); /* endian flip */
> +	DPU_REG_WRITE(pp_c, PP_DCE_DATA_OUT_SWAP, data);
> +	return 0;
> +}
> +
>   static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
>   				unsigned long features)
>   {
> @@ -256,6 +285,9 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
>   	c->ops.get_autorefresh = dpu_hw_pp_get_autorefresh_config;
>   	c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
>   	c->ops.get_line_count = dpu_hw_pp_get_line_count;
> +	c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> +	c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> +	c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
>   
>   	if (test_bit(DPU_PINGPONG_DITHER, &features))
>   		c->ops.setup_dither = dpu_hw_pp_setup_dither;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> index 89d08a715c16..12758468d9ca 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> @@ -124,6 +124,20 @@ struct dpu_hw_pingpong_ops {
>   	 */
>   	void (*setup_dither)(struct dpu_hw_pingpong *pp,
>   			struct dpu_hw_dither_cfg *cfg);
> +	/**
> +	 * Enable DSC
> +	 */
> +	int (*enable_dsc)(struct dpu_hw_pingpong *pp);
> +
> +	/**
> +	 * Disable DSC
> +	 */
> +	void (*disable_dsc)(struct dpu_hw_pingpong *pp);
> +
> +	/**
> +	 * Setup DSC
> +	 */
> +	int (*setup_dsc)(struct dpu_hw_pingpong *pp);
>   };
>   
>   struct dpu_hw_merge_3d;
