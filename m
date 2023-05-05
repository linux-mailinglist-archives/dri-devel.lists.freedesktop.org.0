Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4679A6F9137
	for <lists+dri-devel@lfdr.de>; Sat,  6 May 2023 12:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE5610E261;
	Sat,  6 May 2023 10:33:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D3510E642;
 Fri,  5 May 2023 17:17:23 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 345DHNpP028651; Fri, 5 May 2023 17:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+tfNxl4sHXy8APxxb/hs4tkABtSLSct7/vvevyPSjiA=;
 b=VYHkhcftadQDU54owG0StUDRL8JV2fM5qWktbZkzNPu3m1LzR7x7U4bK66Do0d+MRF6y
 DMAN+q5wi1rrbn4RtZVxWuI2eqye04RBTXGq72Yj/pjZKrFCINGxBJmC1eNoLGl8mL3G
 TaIjTMYb6l515kQBrZ8KAGS2CcJS9vSkGhFbTqTzSKSVGNMf15xBskIG4nnQLt1G6Ycc
 U8Ob0FpSqwhnq2OoUF46Wg/QuxVOiyTihFBGBrElW4Mu99WfA42IG6eujD/YbYaqZLdX
 5kE6CSylOLhgbLJQRdg/w9ktsOoOOyFNEsloAsAAtpsQdHaWiHI4bS9mBmqf+x36ssZx /w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qctfq1m47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 May 2023 17:17:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 345HHF2v011660
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 5 May 2023 17:17:15 GMT
Received: from [10.110.37.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 5 May 2023
 10:17:14 -0700
Message-ID: <1fc007e9-eb10-9d0d-7b0f-abe262837fbf@quicinc.com>
Date: Fri, 5 May 2023 10:17:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Freedreno] [PATCH v2 2/9] drm/msm/dpu: simplify CDP programming
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>
References: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
 <20230502150533.3672840-3-dmitry.baryshkov@linaro.org>
From: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
In-Reply-To: <20230502150533.3672840-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: QbG6tH-mxLpxaJxvzIbxEwu-B9W22PL9
X-Proofpoint-ORIG-GUID: QbG6tH-mxLpxaJxvzIbxEwu-B9W22PL9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_23,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011
 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050142
X-Mailman-Approved-At: Sat, 06 May 2023 10:33:25 +0000
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



On 5/2/2023 8:05 AM, Dmitry Baryshkov wrote:
> Get rid of intermediatory configuration structure and defines. Pass the
> format and the enablement bit directly to the new helper. The
> WB_CDP_CNTL register ignores BIT(2), so we can write it for both SSPP
> and WB CDP settings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 17 ++++-----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 17 ++++-----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   | 14 ++++---------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   | 21 +++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   | 19 +++--------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     | 19 ++++-------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h     | 11 ++--------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 16 +++-----------
>   8 files changed, 45 insertions(+), 89 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index bac4aa807b4b..e7b65f6f53d6 100644
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
> @@ -163,18 +162,10 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
>   		hw_wb->ops.setup_outformat(hw_wb, wb_cfg);
>   
>   	if (hw_wb->ops.setup_cdp) {
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
> +		const struct dpu_perf_cfg *perf = phys_enc->dpu_kms->catalog->perf;
> +
> +		hw_wb->ops.setup_cdp(hw_wb, wb_cfg->dest.format,
> +				     perf->cdp_cfg[DPU_PERF_CDP_USAGE_NRT].wr_enable);
>   	}
>   
>   	if (hw_wb->ops.setup_outaddress)
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
> index 14b5cfe30611..3b210320ea62 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1116,20 +1116,10 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
>   		pipe->sspp->ops.setup_format(pipe, fmt, src_flags);
>   
>   		if (pipe->sspp->ops.setup_cdp) {
> -			struct dpu_hw_cdp_cfg cdp_cfg;
> +			const struct dpu_perf_cfg *perf = pdpu->catalog->perf;
>   
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
> +			pipe->sspp->ops.setup_cdp(pipe, fmt,
> +						  perf->cdp_cfg[DPU_PERF_CDP_USAGE_RT].rd_enable);
>   		}
>   	}
>   
Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
