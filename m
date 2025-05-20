Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A16ABD16F
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 10:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DD410E502;
	Tue, 20 May 2025 08:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xku0W8NC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85A810E506
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 08:05:49 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-442f5b3c710so41942565e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 01:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747728348; x=1748333148; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=LW4SBb8OdXfVHCDYjECI0HT6Bc340yiVBy2FcDLH3TI=;
 b=xku0W8NCgNOkFH3yVYCTgBrMvXg8Zk7Hy0QeZdAiyOUmS7Orfuo0dqk1PP6f3/7kdW
 EA2bn4TTeB58SlPLqZnmyY2rKSHqnIrkEhgdRJS5D1voK2WXRSUr1v8SqxfZyhgbdBfx
 RvIXWjcE1eCWD5NdIutzRI7B+Yew1PTHYdlYbgLQaJZqeyUm1bNpG4pa2UiKjhcj1/fo
 crLSaNhhqW020MIhheeXCJE3/FN0Nh/elPRYvWUCixqnvMWj8jpDDG45bO1v0uu6Gl0A
 LkGpMgzsKEmod6bwbYJjzyYH2H7Ep/0zQE5MGiDCf17Rh6zLyUrrcn28IEFt0GTIzBBW
 4JYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747728348; x=1748333148;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LW4SBb8OdXfVHCDYjECI0HT6Bc340yiVBy2FcDLH3TI=;
 b=b5530K+xMtIfvZgzer7KhPBK8khcTeVrGKjt0WJasEf3LVX5L+vzVBjng0eQKUtb/K
 YQ1oTlxYiIHf6NmpliDfNoAxqPlPJQr2EwsN0tjOqlyxZIhUy9dNAzDJsyWmc1hpmGKe
 OfOr1in8QYkuzt2sj6GeW6H8qt1bZHzTEHf6RjZHAVeLs9ccWiHw5dsWnd+AeTQnjMG+
 zneLmlP4JFh4Z+nd1DcQNX+w2jXVmupGrukmE+oZCWXIENBk+g+Y6ueyblXDiDSp2E8b
 hEWuqy9U2WlvqnuMo0S+VT4zjjTnpllyelpkTdUVGacdtfBJoCmTPWgSxF5hQNn5hRwD
 wqRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcfEY8S5A+zFgOmfNQaIgYAN0OdoFY+loGqgJFRDYxkguvASIDQOrbEmdFwO71Kkgnd3dmG/7ozMM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRIwk37X3z1zK6vwmLLkM2GYQ/IRtvMeVd2D6sZCnsJVCY5uWV
 oAyAvAgi3qJz8itjyjV/0NWiz4yQMlBp5nIYB5jPAyOQMeem/vexaDXrOUdYHCJJiys=
X-Gm-Gg: ASbGncv4lAipXFs52X+FDLEEpQ/ncbPHc0QeOZpdLbNgPqIXPxazb65StY6d5PJffv1
 fumm6iSCyXRr/4HI7QOMoyi8iwJA4ZzSwVK3omme70s46KMHkg8oSyNJTmcOXV0grhFBW3lmeIr
 WtNyF4JY+SkH9Y/Jg/FwoyNeBn8n2CbZOBZKaUwA2OfzukJHgsJRdb4BKbUtC5qhlxJNVUsHzGF
 q2V5HvkjMeL1gfOj8fnq06aAeBgayyo+NTvOI9tXzNJ6QBYQOv+tu0vNAqVlgt+44PzrHPCHkIe
 lxuN3juIrzZ/3U6wA1SUjz2Kmv1NTtoWcUUFpmzC/2/Uedb47wQyaVi5/EeUIVUaxNoJrfPIPsq
 C2B2gch430vyy2+eKSTkh19n3LQLX
X-Google-Smtp-Source: AGHT+IE7kWMfshowMacPc017b313QcFKe4fD0gGGNCCmPlmLikmttBbY7CVV+/dDiL/UigiKXTVs+A==
X-Received: by 2002:a05:600c:3d18:b0:43d:fa59:a685 with SMTP id
 5b1f17b1804b1-442fd672e0emr116929485e9.33.1747728348473; 
 Tue, 20 May 2025 01:05:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68?
 ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f6b2979fsm21442065e9.1.2025.05.20.01.05.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 01:05:48 -0700 (PDT)
Message-ID: <a48be7fd-ac34-4829-b423-ae7d62034b43@linaro.org>
Date: Tue, 20 May 2025 10:05:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 30/30] drm/msm/dpu: move features out of the
 DPU_HW_BLK_INFO
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-30-6c5e88e31383@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250519-dpu-drop-features-v4-30-6c5e88e31383@oss.qualcomm.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> As features bits are now unused by some of the hardware block
> configuration structures, remove the 'features' from the DPU_HW_BLK_INFO
> so that it doesn't get included into hw info structures by default and
> only include it when necessary.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h         | 17 +++++++----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c         |  5 ++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c         |  5 ++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c             |  4 ++--
>   6 files changed, 13 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> index a065f102ce592311376f1186add7a47dca7fd84f..26883f6b66b3e506d14eeb1c0bd64f556d19fef8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> @@ -20,7 +20,6 @@ static const struct dpu_caps sm6150_dpu_caps = {
>   static const struct dpu_mdp_cfg sm6150_mdp = {
>   	.name = "top_0",
>   	.base = 0x0, .len = 0x45c,
> -	.features = 0,
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>   		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
> index 2950245e7b3f5e38f3f501a7314bb97c66d05982..fbf50f279e6628cb0f92b0188e1fbdf156a899e2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
> @@ -22,7 +22,6 @@ static const struct dpu_caps sm6125_dpu_caps = {
>   static const struct dpu_mdp_cfg sm6125_mdp = {
>   	.name = "top_0",
>   	.base = 0x0, .len = 0x45c,
> -	.features = 0,
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>   		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index d51f6c5cdf62f3c00829167172ef6fd61f069986..47d82b83ac5378cb0001b3ea6605dc0f98aec5ef 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -154,14 +154,12 @@ enum {
>    * @id:                enum identifying this block
>    * @base:              register base offset to mdss
>    * @len:               length of hardware block
> - * @features           bit mask identifying sub-blocks/features
>    */
>   #define DPU_HW_BLK_INFO \
>   	char name[DPU_HW_BLK_NAME_LEN]; \
>   	u32 id; \
>   	u32 base; \
> -	u32 len; \
> -	unsigned long features
> +	u32 len
>   
>   /**
>    * struct dpu_scaler_blk: Scaler information
> @@ -376,7 +374,6 @@ struct dpu_clk_ctrl_reg {
>   /* struct dpu_mdp_cfg : MDP TOP-BLK instance info
>    * @id:                index identifying this block
>    * @base:              register base offset to mdss
> - * @features           bit mask identifying sub-blocks/features
>    * @clk_ctrls          clock control register definition
>    */
>   struct dpu_mdp_cfg {
> @@ -392,6 +389,7 @@ struct dpu_mdp_cfg {
>    */
>   struct dpu_ctl_cfg {
>   	DPU_HW_BLK_INFO;
> +	unsigned long features;
>   	unsigned int intr_start;
>   };
>   
> @@ -407,6 +405,7 @@ struct dpu_ctl_cfg {
>    */
>   struct dpu_sspp_cfg {
>   	DPU_HW_BLK_INFO;
> +	unsigned long features;
>   	const struct dpu_sspp_sub_blks *sblk;
>   	u32 xin_id;
>   	enum dpu_clk_ctrl_type clk_ctrl;
> @@ -424,6 +423,7 @@ struct dpu_sspp_cfg {
>    */
>   struct dpu_lm_cfg {
>   	DPU_HW_BLK_INFO;
> +	unsigned long features;
>   	const struct dpu_lm_sub_blks *sblk;
>   	u32 pingpong;
>   	u32 dspp;
> @@ -434,7 +434,6 @@ struct dpu_lm_cfg {
>    * struct dpu_dspp_cfg - information of DSPP blocks
>    * @id                 enum identifying this block
>    * @base               register offset of this block
> - * @features           bit mask identifying sub-blocks/features
>    *                     supported by this block
>    * @sblk               sub-blocks information
>    */
> @@ -447,7 +446,6 @@ struct dpu_dspp_cfg  {
>    * struct dpu_pingpong_cfg - information of PING-PONG blocks
>    * @id                 enum identifying this block
>    * @base               register offset of this block
> - * @features           bit mask identifying sub-blocks/features
>    * @intr_done:         index for PINGPONG done interrupt
>    * @intr_rdptr:        index for PINGPONG readpointer done interrupt
>    * @sblk               sub-blocks information
> @@ -464,8 +462,6 @@ struct dpu_pingpong_cfg  {
>    * struct dpu_merge_3d_cfg - information of DSPP blocks
>    * @id                 enum identifying this block
>    * @base               register offset of this block
> - * @features           bit mask identifying sub-blocks/features
> - *                     supported by this block
>    * @sblk               sub-blocks information
>    */
>   struct dpu_merge_3d_cfg  {
> @@ -483,6 +479,7 @@ struct dpu_merge_3d_cfg  {
>    */
>   struct dpu_dsc_cfg {
>   	DPU_HW_BLK_INFO;
> +	unsigned long features;
>   	const struct dpu_dsc_sub_blks *sblk;
>   };
>   
> @@ -490,7 +487,6 @@ struct dpu_dsc_cfg {
>    * struct dpu_intf_cfg - information of timing engine blocks
>    * @id                 enum identifying this block
>    * @base               register offset of this block
> - * @features           bit mask identifying sub-blocks/features
>    * @type:              Interface type(DSI, DP, HDMI)
>    * @controller_id:     Controller Instance ID in case of multiple of intf type
>    * @prog_fetch_lines_worst_case	Worst case latency num lines needed to prefetch
> @@ -521,6 +517,7 @@ struct dpu_intf_cfg  {
>    */
>   struct dpu_wb_cfg {
>   	DPU_HW_BLK_INFO;
> +	unsigned long features;
>   	u8 vbif_idx;
>   	u32 maxlinewidth;
>   	u32 xin_id;
> @@ -589,6 +586,7 @@ struct dpu_vbif_qos_tbl {
>    */
>   struct dpu_vbif_cfg {
>   	DPU_HW_BLK_INFO;
> +	unsigned long features;
>   	u32 default_ot_rd_limit;
>   	u32 default_ot_wr_limit;
>   	u32 xin_halt_timeout;
> @@ -606,7 +604,6 @@ struct dpu_vbif_cfg {
>    * @name               string name for debug purposes
>    * @id                 enum identifying this block
>    * @base               register offset of this block
> - * @features           bit mask identifying sub-blocks/features
>    */
>   struct dpu_cdm_cfg {
>   	DPU_HW_BLK_INFO;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
> index b9c433567262a954b7f02233f6670ee6a8476846..b3395e9c34a19363019ec0ccfb0c87943553b4c9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
> @@ -360,8 +360,7 @@ static void dpu_hw_dsc_bind_pingpong_blk_1_2(struct dpu_hw_dsc *hw_dsc,
>   	DPU_REG_WRITE(hw, sblk->ctl.base + DSC_CTL, mux_cfg);
>   }
>   
> -static void _setup_dcs_ops_1_2(struct dpu_hw_dsc_ops *ops,
> -			       const unsigned long features)
> +static void _setup_dcs_ops_1_2(struct dpu_hw_dsc_ops *ops)
>   {
>   	ops->dsc_disable = dpu_hw_dsc_disable_1_2;
>   	ops->dsc_config = dpu_hw_dsc_config_1_2;
> @@ -391,7 +390,7 @@ struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(struct drm_device *dev,
>   
>   	c->idx = cfg->id;
>   	c->caps = cfg;
> -	_setup_dcs_ops_1_2(&c->ops, c->caps->features);
> +	_setup_dcs_ops_1_2(&c->ops);
>   
>   	return c;
>   }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
> index 0b3325f9c8705999e1003e5c88872562e880229b..83b1dbecddd2b30402f47155fa2f9a148ead02c1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
> @@ -33,8 +33,7 @@ static void dpu_hw_merge_3d_setup_3d_mode(struct dpu_hw_merge_3d *merge_3d,
>   	}
>   }
>   
> -static void _setup_merge_3d_ops(struct dpu_hw_merge_3d *c,
> -				unsigned long features)
> +static void _setup_merge_3d_ops(struct dpu_hw_merge_3d *c)
>   {
>   	c->ops.setup_3d_mode = dpu_hw_merge_3d_setup_3d_mode;
>   };
> @@ -62,7 +61,7 @@ struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(struct drm_device *dev,
>   
>   	c->idx = cfg->id;
>   	c->caps = cfg;
> -	_setup_merge_3d_ops(c, c->caps->features);
> +	_setup_merge_3d_ops(c);
>   
>   	return c;
>   }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> index 5c811f0142d5e2a012d7e9b3a918818f22ec11cf..96dc10589bee6cf144eabaecf9f8ec5777431ac3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> @@ -264,7 +264,7 @@ static void dpu_hw_dp_phy_intf_sel(struct dpu_hw_mdp *mdp,
>   }
>   
>   static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
> -		unsigned long cap, const struct dpu_mdss_version *mdss_rev)
> +			   const struct dpu_mdss_version *mdss_rev)
>   {
>   	ops->setup_split_pipe = dpu_hw_setup_split_pipe;
>   	ops->setup_clk_force_ctrl = dpu_hw_setup_clk_force_ctrl;
> @@ -313,7 +313,7 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
>   	 * Assign ops
>   	 */
>   	mdp->caps = cfg;
> -	_setup_mdp_ops(&mdp->ops, mdp->caps->features, mdss_rev);
> +	_setup_mdp_ops(&mdp->ops, mdss_rev);
>   
>   	return mdp;
>   }
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
