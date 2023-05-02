Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A17946F3E47
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 09:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D2910E3C4;
	Tue,  2 May 2023 07:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEE310E00C;
 Tue,  2 May 2023 01:02:39 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34211I0a022051; Tue, 2 May 2023 01:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=89kbiv2bNb+AEXODXoOijDbsoBhq8xca6Fkxioowz0Y=;
 b=D/wv1Q6ayE6OjJIS1w0xXb/0g9tiVJ7pt6toHmDWRGi0VFfxi0hnz20cFrz0gPUTqjV3
 AJSdWPdUr+ruOPFtKALkcrZ71kO308YgBU84+T6nJ5+R4lSDKzNFt9QvgXLJyV9btM6Y
 jGRKinTFLENOAk/2f8L7srk05d5BQqeSmrXqLC23Kd7H4+DJR+vAraXRjGthRM43FBEn
 fSe1Dfbt2Ghx6b01V1UkEVb2msnpeQghXZgDy8YwNI4iez1ZSmeH5PYdCCn2GvJkni/q
 2wDaRFFmIaHf19bief8mrEqFwGK3mE8zFz+Cwr6CeTmm7eH0ZAE1KTk/nYCYjqFPp+k3 3A== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q8ufc502w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 01:02:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34212TxH024744
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 2 May 2023 01:02:29 GMT
Received: from [10.134.71.70] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 1 May 2023
 18:02:28 -0700
Message-ID: <3c5bfc58-6ce4-1a32-5b3f-8bc4eef31037@quicinc.com>
Date: Mon, 1 May 2023 18:02:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Freedreno] [PATCH 2/9] drm/msm/dpu: simplify CDP programming
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>
References: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
 <20230430205710.3188230-3-dmitry.baryshkov@linaro.org>
From: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
In-Reply-To: <20230430205710.3188230-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: V9nsWOZsjhxu5vOZRUB1pX23S4a-UWGP
X-Proofpoint-GUID: V9nsWOZsjhxu5vOZRUB1pX23S4a-UWGP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-01_16,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305020006
X-Mailman-Approved-At: Tue, 02 May 2023 07:15:23 +0000
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn
 Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/30/2023 1:57 PM, Dmitry Baryshkov wrote:
> Get rid of intermediatory configuration structure and defines. Pass the
> format and the enablement bit directly to the new helper. The
> WB_CDP_CNTL register ignores BIT(2), so we can write it for both SSPP
> and WB CDP settings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 19 ++++-------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 17 ++++-----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   | 14 ++++---------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   | 21 +++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   | 19 +++--------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     | 19 ++++-------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h     | 11 ++--------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 20 ++++--------------
>   8 files changed, 46 insertions(+), 94 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index bac4aa807b4b..120141f1e5c5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -140,7 +140,6 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
>   	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
>   	struct dpu_hw_wb *hw_wb;
>   	struct dpu_hw_wb_cfg *wb_cfg;
> -	struct dpu_hw_cdp_cfg cdp_cfg;
>   
>   	if (!phys_enc || !phys_enc->dpu_kms || !phys_enc->dpu_kms->catalog) {
>   		DPU_ERROR("invalid encoder\n");
> @@ -162,20 +161,10 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
>   	if (hw_wb->ops.setup_outformat)
>   		hw_wb->ops.setup_outformat(hw_wb, wb_cfg);
>   
> -	if (hw_wb->ops.setup_cdp) {
> -		memset(&cdp_cfg, 0, sizeof(struct dpu_hw_cdp_cfg));
> -
> -		cdp_cfg.enable = phys_enc->dpu_kms->catalog->perf->cdp_cfg
> -				[DPU_PERF_CDP_USAGE_NRT].wr_enable;
> -		cdp_cfg.ubwc_meta_enable =
> -				DPU_FORMAT_IS_UBWC(wb_cfg->dest.format);
> -		cdp_cfg.tile_amortize_enable =
> -				DPU_FORMAT_IS_UBWC(wb_cfg->dest.format) ||
> -				DPU_FORMAT_IS_TILE(wb_cfg->dest.format);
> -		cdp_cfg.preload_ahead = DPU_WB_CDP_PRELOAD_AHEAD_64;
> -
> -		hw_wb->ops.setup_cdp(hw_wb, &cdp_cfg);
> -	}
> +	if (hw_wb->ops.setup_cdp)
> +		hw_wb->ops.setup_cdp(hw_wb, wb_cfg->dest.format,
> +				     phys_enc->dpu_kms->catalog->perf->cdp_cfg
> +				     [DPU_PERF_CDP_USAGE_NRT].wr_enable);
Too many indirections. Consider adding a temp variable.
>   
>   	if (hw_wb->ops.setup_outaddress)
>   		hw_wb->ops.setup_outaddress(hw_wb, wb_cfg);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 1bf717290dab..731199030336 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -592,13 +592,13 @@ static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
>   }
>   
>   static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
> -		struct dpu_hw_cdp_cfg *cfg)
> +				  const struct dpu_format *fmt,
> +				  bool enable)
>   {
>   	struct dpu_hw_sspp *ctx = pipe->sspp;
> -	u32 cdp_cntl = 0;
>   	u32 cdp_cntl_offset = 0;
>   
> -	if (!ctx || !cfg)
> +	if (!ctx)
>   		return;
>   
>   	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
> @@ -607,16 +607,7 @@ static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
>   	else
>   		cdp_cntl_offset = SSPP_CDP_CNTL_REC1;
>   
> -	if (cfg->enable)
> -		cdp_cntl |= BIT(0);
> -	if (cfg->ubwc_meta_enable)
> -		cdp_cntl |= BIT(1);
> -	if (cfg->tile_amortize_enable)
> -		cdp_cntl |= BIT(2);
> -	if (cfg->preload_ahead == DPU_SSPP_CDP_PRELOAD_AHEAD_64)
> -		cdp_cntl |= BIT(3);
> -
> -	DPU_REG_WRITE(&ctx->hw, cdp_cntl_offset, cdp_cntl);
> +	dpu_setup_cdp(&ctx->hw, cdp_cntl_offset, fmt, enable);
>   }
>   
>   static void _setup_layer_ops(struct dpu_hw_sspp *c,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index 7a8d11ba618d..86bf4b2cda77 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -177,14 +177,6 @@ struct dpu_hw_pipe_qos_cfg {
>   	bool danger_safe_en;
>   };
>   
> -/**
> - * enum CDP preload ahead address size
> - */
> -enum {
> -	DPU_SSPP_CDP_PRELOAD_AHEAD_32,
> -	DPU_SSPP_CDP_PRELOAD_AHEAD_64
> -};
> -
>   /**
>    * struct dpu_hw_pipe_ts_cfg - traffic shaper configuration
>    * @size: size to prefill in bytes, or zero to disable
> @@ -331,10 +323,12 @@ struct dpu_hw_sspp_ops {
>   	/**
>   	 * setup_cdp - setup client driven prefetch
>   	 * @pipe: Pointer to software pipe context
> -	 * @cfg: Pointer to cdp configuration
> +	 * @fmt: format used by the sw pipe
> +	 * @enable: whether the CDP should be enabled for this pipe
>   	 */
>   	void (*setup_cdp)(struct dpu_sw_pipe *pipe,
> -			  struct dpu_hw_cdp_cfg *cfg);
> +			  const struct dpu_format *fmt,
> +			  bool enable);
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> index 8062228eada6..95d20b9a3f2f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
> @@ -494,3 +494,24 @@ int dpu_hw_collect_misr(struct dpu_hw_blk_reg_map *c,
>   
>   	return 0;
>   }
> +
> +#define CDP_ENABLE		BIT(0)
> +#define CDP_UBWC_META_ENABLE	BIT(1)
> +#define CDP_TILE_AMORTIZE_ENABLE BIT(2)
> +#define CDP_PRELOAD_AHEAD_64	BIT(3)
> +
> +void dpu_setup_cdp(struct dpu_hw_blk_reg_map *c, u32 offset,
> +		   const struct dpu_format *fmt, bool enable)
> +{
> +	u32 cdp_cntl = CDP_PRELOAD_AHEAD_64;
> +
> +	if (enable)
> +		cdp_cntl |= CDP_ENABLE;
> +	if (DPU_FORMAT_IS_UBWC(fmt))
> +		cdp_cntl |= CDP_UBWC_META_ENABLE;
> +	if (DPU_FORMAT_IS_UBWC(fmt) ||
> +	    DPU_FORMAT_IS_TILE(fmt))
> +		cdp_cntl |= CDP_TILE_AMORTIZE_ENABLE;
> +
> +	DPU_REG_WRITE(c, offset, cdp_cntl);
> +}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> index 27f4c39e35ab..dc6e3b795aef 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> @@ -305,22 +305,6 @@ struct dpu_drm_scaler_v2 {
>   	struct dpu_drm_de_v1 de;
>   };
>   
> -/**
> - * struct dpu_hw_cdp_cfg : CDP configuration
> - * @enable: true to enable CDP
> - * @ubwc_meta_enable: true to enable ubwc metadata preload
> - * @tile_amortize_enable: true to enable amortization control for tile format
> - * @preload_ahead: number of request to preload ahead
> - *	DPU_*_CDP_PRELOAD_AHEAD_32,
> - *	DPU_*_CDP_PRELOAD_AHEAD_64
> - */
> -struct dpu_hw_cdp_cfg {
> -	bool enable;
> -	bool ubwc_meta_enable;
> -	bool tile_amortize_enable;
> -	u32 preload_ahead;
> -};
> -
>   u32 *dpu_hw_util_get_log_mask_ptr(void);
>   
>   void dpu_reg_write(struct dpu_hw_blk_reg_map *c,
> @@ -346,6 +330,9 @@ void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map  *c,
>   		u32 csc_reg_off,
>   		const struct dpu_csc_cfg *data, bool csc10);
>   
> +void dpu_setup_cdp(struct dpu_hw_blk_reg_map *c, u32 offset,
> +		   const struct dpu_format *fmt, bool enable);
> +
>   u64 _dpu_hw_get_qos_lut(const struct dpu_qos_lut_tbl *tbl,
>   		u32 total_fl);
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> index 4834866d72fd..a6de4b82a188 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> @@ -164,24 +164,13 @@ static void dpu_hw_wb_setup_qos_lut(struct dpu_hw_wb *ctx,
>   }
>   
>   static void dpu_hw_wb_setup_cdp(struct dpu_hw_wb *ctx,
> -		struct dpu_hw_cdp_cfg *cfg)
> +				const struct dpu_format *fmt,
> +				bool enable)
>   {
> -	struct dpu_hw_blk_reg_map *c;
> -	u32 cdp_cntl = 0;
> -
> -	if (!ctx || !cfg)
> +	if (!ctx)
>   		return;
>   
> -	c = &ctx->hw;
> -
> -	if (cfg->enable)
> -		cdp_cntl |= BIT(0);
> -	if (cfg->ubwc_meta_enable)
> -		cdp_cntl |= BIT(1);
> -	if (cfg->preload_ahead == DPU_WB_CDP_PRELOAD_AHEAD_64)
> -		cdp_cntl |= BIT(3);
> -
> -	DPU_REG_WRITE(c, WB_CDP_CNTL, cdp_cntl);
> +	dpu_setup_cdp(&ctx->hw, WB_CDP_CNTL, fmt, enable);
>   }
>   
>   static void dpu_hw_wb_bind_pingpong_blk(
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
> index e4f85409c624..ab3541856258 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
> @@ -21,14 +21,6 @@ struct dpu_hw_wb_cfg {
>   	struct drm_rect crop;
>   };
>   
> -/**
> - * enum CDP preload ahead address size
> - */
> -enum {
> -	DPU_WB_CDP_PRELOAD_AHEAD_32,
> -	DPU_WB_CDP_PRELOAD_AHEAD_64
> -};
> -
>   /**
>    * struct dpu_hw_wb_qos_cfg : Writeback pipe QoS configuration
>    * @danger_lut: LUT for generate danger level based on fill level
> @@ -67,7 +59,8 @@ struct dpu_hw_wb_ops {
>   			struct dpu_hw_wb_qos_cfg *cfg);
>   
>   	void (*setup_cdp)(struct dpu_hw_wb *ctx,
> -			struct dpu_hw_cdp_cfg *cfg);
> +			  const struct dpu_format *fmt,
> +			  bool enable);
>   
>   	void (*bind_pingpong_blk)(struct dpu_hw_wb *ctx,
>   			bool enable, const enum dpu_pingpong pp);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 14b5cfe30611..43d9fbc0c687 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1115,22 +1115,10 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
>   		/* update format */
>   		pipe->sspp->ops.setup_format(pipe, fmt, src_flags);
>   
> -		if (pipe->sspp->ops.setup_cdp) {
> -			struct dpu_hw_cdp_cfg cdp_cfg;
> -
> -			memset(&cdp_cfg, 0, sizeof(struct dpu_hw_cdp_cfg));
> -
> -			cdp_cfg.enable = pdpu->catalog->perf->cdp_cfg
> -					[DPU_PERF_CDP_USAGE_RT].rd_enable;
> -			cdp_cfg.ubwc_meta_enable =
> -					DPU_FORMAT_IS_UBWC(fmt);
> -			cdp_cfg.tile_amortize_enable =
> -					DPU_FORMAT_IS_UBWC(fmt) ||
> -					DPU_FORMAT_IS_TILE(fmt);
> -			cdp_cfg.preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
> -
> -			pipe->sspp->ops.setup_cdp(pipe, &cdp_cfg);
> -		}
> +		if (pipe->sspp->ops.setup_cdp)
> +			pipe->sspp->ops.setup_cdp(pipe, fmt,
> +						  pdpu->catalog->perf->cdp_cfg
> +						  [DPU_PERF_CDP_USAGE_RT].rd_enable);
>   	}
>   
>   	_dpu_plane_set_qos_lut(plane, pipe, fmt, pipe_cfg);
