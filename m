Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BB188061A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 21:35:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BDA10E490;
	Tue, 19 Mar 2024 20:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="MYxzzy7u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F3610E145;
 Tue, 19 Mar 2024 20:35:00 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42JJj5Y9010713; Tue, 19 Mar 2024 20:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=usQ6jbnrewpRP0Qjs4jmCLe5S1U4HXDY6hDzpNWtgPE=; b=MY
 xzzy7uLMOGwc180+6q/ICzvTIWDaseatd+NSOhIxhptD5WXX/h91Z8dRShZmhu0B
 FOgfq5FdeD4Au9TR1gJkxueDQcTEdjfGts2vyBoIbymfws+mZVLyEt1kZaL3H5GA
 iZ6wWE5WGs/5dlA1QkpNFIdoDE2m13xuSYYjU241wRubGkse2c8GvMx/TY5hx2LY
 FOAAIUbPJjnJ2SPjfFvifvF+7fKh0gnhSyxP5EVFTc9Sw1qucfceDZgZ8l2oo4lY
 L2TPslfu02v/0PNh3OmbfIqPpN7jiNiPvnD+cUgeBllX2YlAQ90HWE4Vxi1DWaDw
 CuzdSZvB8bJcyYGieH7g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wyfqbga9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Mar 2024 20:34:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42JKYrNu029122
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Mar 2024 20:34:53 GMT
Received: from [10.110.10.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 19 Mar
 2024 13:34:50 -0700
Message-ID: <ebf0ca9b-6e9d-4387-8628-a6ccaca11215@quicinc.com>
Date: Tue, 19 Mar 2024 13:34:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 3/5] drm/msm/dpu: handle perf mode in
 _dpu_core_perf_crtc_update_bus()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
 <20240314-dpu-perf-rework-v3-3-79fa4e065574@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240314-dpu-perf-rework-v3-3-79fa4e065574@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: RHBF-A0sE4wBvxocV4QB7QzCfnYyGIi0
X-Proofpoint-GUID: RHBF-A0sE4wBvxocV4QB7QzCfnYyGIi0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-19_08,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 clxscore=1015 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403190159
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



On 3/13/2024 6:10 PM, Dmitry Baryshkov wrote:
> Move perf mode handling for the bandwidth to
> _dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
> and then aggregating known values.
> 
> Note, this changes the fix_core_ab_vote. Previously it would be
> multiplied per the CRTC number, now it will be used directly for
> interconnect voting.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 39 +++++++++++++--------------
>   1 file changed, 19 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 87b892069526..ff2942a6a678 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -118,21 +118,9 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
>   		return;
>   	}
>   
> -	memset(perf, 0, sizeof(struct dpu_core_perf_params));
> -
> -	if (core_perf->perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> -		perf->bw_ctl = 0;
> -		perf->max_per_pipe_ib = 0;
> -		perf->core_clk_rate = 0;
> -	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
> -		perf->bw_ctl = core_perf->fix_core_ab_vote;
> -		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
> -		perf->core_clk_rate = core_perf->fix_core_clk_rate;
> -	} else {
> -		perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> -		perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> -		perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> -	}
> +	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> +	perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> +	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
>   
>   	DRM_DEBUG_ATOMIC(
>   		"crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
> @@ -233,18 +221,29 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
>   {
>   	struct dpu_core_perf_params perf = { 0 };
>   	int i, ret = 0;
> -	u64 avg_bw;
> +	u32 avg_bw;
> +	u32 peak_bw;
>   
>   	if (!kms->num_paths)
>   		return 0;
>   
> -	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> +	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> +		avg_bw = 0;
> +		peak_bw = 0;
> +	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
> +		avg_bw = kms->perf.fix_core_ab_vote;
> +		peak_bw = kms->perf.fix_core_ib_vote;
> +	} else {
> +		dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);

Where is this function dpu_core_perf_aggregate() defined? I dont see it 
in msm-next

> +
> +		avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> +		peak_bw = perf.max_per_pipe_ib;
> +	}
>   
> -	avg_bw = perf.bw_ctl;
> -	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
> +	avg_bw /= kms->num_paths;
>   
>   	for (i = 0; i < kms->num_paths; i++)
> -		icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
> +		icc_set_bw(kms->path[i], avg_bw, peak_bw);
>   
>   	return ret;
>   }
> 
