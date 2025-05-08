Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E251AB0561
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 23:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770E610E21D;
	Thu,  8 May 2025 21:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ad+p4Q0V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A880910E21B;
 Thu,  8 May 2025 21:30:44 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548DGABX016832;
 Thu, 8 May 2025 21:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RD4CF6NmUfveOeZbPzTR3fagQtEkyvh8kENIJEz0KbY=; b=ad+p4Q0VaSypXeAo
 CZSHXuraAid0E5jzCqjsvciDVqyTLRMBZ8wbEghiMYLIPH3TEHuB1b6GyFd1aWNN
 FxUyrj//uhBNRu5DZ6TCo5r14geeOQTNLFa8PyPfWZdXUVf0cWwjRx50Ys5XmEV1
 XEb/LwaIwdzCZDk4Eo+ba8JY4mHw240VOurDjS37aObLXu222T3jSwB8h4cePzjN
 CVPfLZNQj1TE1wZ6pqUgb/4XiToc5BOvJogxiAoNgyZvux0PjvD+DNC4P3ff64uP
 2L48cO+EIwYozirp8JiByKN5bvEO2StasrEHopai7Zg+vJIzAvQY1v9OoT816hwe
 GKhaKA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp8tkx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 May 2025 21:30:36 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 548LUZWN001649
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 8 May 2025 21:30:35 GMT
Received: from [10.71.109.79] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 May 2025
 14:30:35 -0700
Message-ID: <7ec6f0d8-971d-4607-82ad-9489ce2d352e@quicinc.com>
Date: Thu, 8 May 2025 14:30:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 14/14] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
To: Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <lumag@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
 <20250506-quad-pipe-upstream-v9-14-f7b273a8cc80@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250506-quad-pipe-upstream-v9-14-f7b273a8cc80@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Nfpx24jjqpgAizwo5PpdImZJ9z9dKxLv
X-Proofpoint-ORIG-GUID: Nfpx24jjqpgAizwo5PpdImZJ9z9dKxLv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE5NCBTYWx0ZWRfX8jk7SQXcntR6
 +rtFl+rIM/ATMww4jSszY3EEdlQQDXrIE8MkTOknX2JYzn5zdxlFINRG3SoaIP+lZ0RVfbMLdw3
 ofORujZPNaUI+EdiwIa7Au9s4I6KKJm5F3OFz5nTiiENMT79DzNIA0dwU7tnJArlu2B2bjgBPRZ
 J/3bvgGnkTla7d8lOWUul3/TvG1zAJyHwNjVDObf/BOZCswvDknIWk9i+SPoQOkJeYZitFdzpt5
 Gd5H1HAeeRelK9r5ckSbanH1Ud1JMA9ZDDNRYWgxFzg2RK0/5g5fsk/fB/wqy1l2EicB9AWngZk
 HoqsFnVGi0+hsEevoTfDcOJYxMiH2bEQpqx9+HFtlrxOPth8ceT5o/SsR2Tv+vJ2YeqDA8wcMyH
 qWEhn0mE0wHEHEUFnagF4+Z2RTRKV6kSSEGlX/brT0kbkn6NN/kcaXFiFwMaaxPdiNo5z/JP
X-Authority-Analysis: v=2.4 cv=e/4GSbp/ c=1 sm=1 tr=0 ts=681d227c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=L95mz036j096roKjO1sA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_06,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080194
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



On 5/6/2025 8:47 AM, Jun Nie wrote:
> To support high-resolution cases that exceed the width limitation of
> a pair of SSPPs, or scenarios that surpass the maximum MDP clock rate,
> additional pipes are necessary to enable parallel data processing
> within the SSPP width constraints and MDP clock rate.
> 
> Request 4 mixers and 4 DSCs for high-resolution cases where both DSC
> and dual interfaces are enabled. More use cases can be incorporated
> later if quad-pipe capabilities are required.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 27 +++++++++++++++++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 28 ++++++++----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
>   6 files changed, 35 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index a56d68de219910a827830293e8ff24f4cdee74e4..f22ca13b35e778fed3e6e02c581ef689a5544cfb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -200,7 +200,7 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc,
>   		struct dpu_crtc_state *crtc_state)
>   {
>   	struct dpu_crtc_mixer *m;
> -	u32 crcs[CRTC_DUAL_MIXERS];
> +	u32 crcs[CRTC_QUAD_MIXERS];
>   
>   	int rc = 0;
>   	int i;
> @@ -1296,6 +1296,7 @@ static struct msm_display_topology dpu_crtc_get_topology(
>   	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>   	struct msm_display_topology topology = {0};
>   	struct drm_encoder *drm_enc;
> +	u32 num_rt_intf;
>   
>   	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
>   		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
> @@ -1309,11 +1310,14 @@ static struct msm_display_topology dpu_crtc_get_topology(
>   	 * Dual display
>   	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
>   	 *
> +	 * If DSC is enabled, try to use 4:4:2 topology if there is enough
> +	 * resource. Otherwise, use 2:2:2 topology.
> +	 *
>   	 * Single display
>   	 * 1 LM, 1 INTF
>   	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
>   	 *
> -	 * If DSC is enabled, use 2 LMs for 2:2:1 topology
> +	 * If DSC is enabled, use 2:2:1 topology
>   	 *
>   	 * Add dspps to the reservation requirements if ctm is requested
>   	 *
> @@ -1325,14 +1329,23 @@ static struct msm_display_topology dpu_crtc_get_topology(
>   	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
>   	 */
>   
> -	if (topology.num_intf == 2 && !topology.cwb_enabled)
> -		topology.num_lm = 2;
> -	else if (topology.num_dsc == 2)
> +	num_rt_intf = topology.num_intf;
> +	if (topology.cwb_enabled)
> +		num_rt_intf--;
> +
> +	if (topology.num_dsc) {
> +		if (dpu_kms->catalog->dsc_count >= num_rt_intf * 2)
> +			topology.num_dsc = num_rt_intf * 2;
> +		else
> +			topology.num_dsc = num_rt_intf;
> +		topology.num_lm = topology.num_dsc;
> +	} else if (num_rt_intf == 2) {
>   		topology.num_lm = 2;
> -	else if (dpu_kms->catalog->caps->has_3d_merge)
> +	} else if (dpu_kms->catalog->caps->has_3d_merge) {
>   		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
> -	else
> +	} else {
>   		topology.num_lm = 1;
> +	}
>   
>   	if (crtc_state->ctm)
>   		topology.num_dspp = topology.num_lm;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index 6eaba5696e8e6bd1246a9895c4c8714ca6589b10..455073c7025b0bcb970d8817f197d9bcacc6dca5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -210,7 +210,7 @@ struct dpu_crtc_state {
>   
>   	bool bw_control;
>   	bool bw_split_vote;
> -	struct drm_rect lm_bounds[CRTC_DUAL_MIXERS];
> +	struct drm_rect lm_bounds[CRTC_QUAD_MIXERS];
>   
>   	uint64_t input_fence_timeout_ns;
>   
> @@ -218,10 +218,10 @@ struct dpu_crtc_state {
>   
>   	/* HW Resources reserved for the crtc */
>   	u32 num_mixers;
> -	struct dpu_crtc_mixer mixers[CRTC_DUAL_MIXERS];
> +	struct dpu_crtc_mixer mixers[CRTC_QUAD_MIXERS];
>   
>   	u32 num_ctls;
> -	struct dpu_hw_ctl *hw_ctls[CRTC_DUAL_MIXERS];
> +	struct dpu_hw_ctl *hw_ctls[CRTC_QUAD_MIXERS];
>   
>   	enum dpu_crtc_crc_source crc_source;
>   	int crc_frame_skip_count;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index a125a477404fdafee6495f6d3778160f14a01a96..bbb0873a891879722f2b02767fc48b7406de70f8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -55,7 +55,7 @@
>   #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
>   	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
>   
> -#define MAX_CHANNELS_PER_ENC 2
> +#define MAX_CHANNELS_PER_ENC 4
>   #define MAX_CWB_PER_ENC 2
>   
>   #define IDLE_SHORT_TIMEOUT	1
> @@ -675,22 +675,12 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
>   
>   	dsc = dpu_encoder_get_dsc_config(drm_enc);
>   
> -	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
> -	if (dsc) {
> -		/*
> -		 * Use 2 DSC encoders, 2 layer mixers and 1 or 2 interfaces
> -		 * when Display Stream Compression (DSC) is enabled,
> -		 * and when enough DSC blocks are available.
> -		 * This is power-optimal and can drive up to (including) 4k
> -		 * screens.
> -		 */
> -		WARN(topology->num_intf > 2,
> -		     "DSC topology cannot support more than 2 interfaces\n");
> -		if (topology->num_intf >= 2 || dpu_kms->catalog->dsc_count >= 2)
> -			topology->num_dsc = 2;
> -		else
> -			topology->num_dsc = 1;
> -	}
> +	/*
> +	 * Set DSC number as 1 to mark the enabled status, will be adjusted
> +	 * in dpu_crtc_get_topology()
> +	 */
> +	if (dsc)
> +		topology->num_dsc = 1;
>   
>   	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
>   	if (!connector)
> @@ -2176,8 +2166,8 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
>   	struct dpu_hw_mixer_cfg mixer;
>   	int i, num_lm;
>   	struct dpu_global_state *global_state;
> -	struct dpu_hw_blk *hw_lm[2];
> -	struct dpu_hw_mixer *hw_mixer[2];
> +	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> +	struct dpu_hw_mixer *hw_mixer[MAX_CHANNELS_PER_ENC];
>   	struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
>   
>   	memset(&mixer, 0, sizeof(mixer));
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 61b22d9494546885db609efa156222792af73d2a..09395d7910ac87c035b65cf476350bf6c9619612 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -302,7 +302,7 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
>   
>   	/* Use merge_3d unless DSC MERGE topology is used */
>   	if (phys_enc->split_role == ENC_ROLE_SOLO &&
> -	    dpu_cstate->num_mixers == CRTC_DUAL_MIXERS &&
> +	    (dpu_cstate->num_mixers != 1) &&
>   	    !dpu_encoder_use_dsc_merge(phys_enc->parent))
>   		return BLEND_3D_H_ROW_INT;
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 4cea19e1a20380c56ae014f2d33a6884a72e0ca0..77a7a5375d545483edb316e8428df12212191362 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -24,7 +24,7 @@
>   #define DPU_MAX_IMG_WIDTH 0x3fff
>   #define DPU_MAX_IMG_HEIGHT 0x3fff
>   
> -#define CRTC_DUAL_MIXERS	2
> +#define CRTC_QUAD_MIXERS	4
>   
>   #define MAX_XIN_COUNT 16
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 7c74221380b2c05225c9f82ed6d33765042aec78..94f117e36af83602e5254ebcf5f28de36fd79886 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -34,7 +34,7 @@
>   #define DPU_MAX_PLANES			4
>   #endif
>   
> -#define STAGES_PER_PLANE		1
> +#define STAGES_PER_PLANE		2
>   #define PIPES_PER_STAGE			2
>   #define PIPES_PER_PLANE			(PIPES_PER_STAGE * STAGES_PER_PLANE)
>   #ifndef DPU_MAX_DE_CURVES
> 

