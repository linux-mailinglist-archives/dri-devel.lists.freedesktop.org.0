Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F893880588
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 20:38:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499AA10EAC0;
	Tue, 19 Mar 2024 19:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="oyDOyx9E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D27A10E145;
 Tue, 19 Mar 2024 19:38:14 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42JHGjYH030216; Tue, 19 Mar 2024 19:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=OtR7HIxuiihWCpcnaPxCR5sKik8HMX3DkwylFBWcFZk=; b=oy
 DOyx9E/1FF2GxPEx/ZtGxA3f2T9QVz97yNpD0654y7atGvwb0GPPrdJAbZf9m9eY
 LM4heSSv7CPbL8bc2anRDa4oxlZ0bcxcudaTlbtUJQeSJUOnV+faqqwGT2nwlo92
 zHYax4QK9UtSCTDiZBFIbpRWjbkBW39sGnik8eCqmzGZ7QhATuGkfrZUTl3Hrzq3
 PGHzgRiYp6i5Jx4PBi93VkR/fEDvg/IOqZ7U0ey9Ltn1QwnRKTT2qU3YMr7Pm0+o
 D9ORssKv/CtHDpt7JU9zy4SXB6ZAbp9F5JuUgcfFb2+WoDBP6LIkT7I22TAwARKe
 qByJeQWXdJ1lFCOk6ilQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wy94tsapn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Mar 2024 19:38:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42JJc9r9026527
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Mar 2024 19:38:09 GMT
Received: from [10.110.10.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 19 Mar
 2024 12:38:06 -0700
Message-ID: <eb8a78e0-5202-861c-a4cd-2d1366ff3423@quicinc.com>
Date: Tue, 19 Mar 2024 12:38:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/5] drm/msm/dpu: core_perf: extract bandwidth
 aggregation function
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
 <20240314-dpu-perf-rework-v3-2-79fa4e065574@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240314-dpu-perf-rework-v3-2-79fa4e065574@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FlLccESTJRpMBBZVM3rfqT_jeyAZ_3Rm
X-Proofpoint-ORIG-GUID: FlLccESTJRpMBBZVM3rfqT_jeyAZ_3Rm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-19_08,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 spamscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403190149
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
> In preparation to refactoring the dpu_core_perf debugfs interface,
> extract the bandwidth aggregation function from
> _dpu_core_perf_crtc_update_bus().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 45 +++++++++++++++------------
>   1 file changed, 25 insertions(+), 20 deletions(-)
> 

no need of core_perf : in the subject line.

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 68fae048a9a8..87b892069526 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -204,36 +204,41 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
>   	return 0;
>   }
>   
> -static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> -		struct drm_crtc *crtc)
> +static void dpu_core_perf_aggregate(struct drm_device *ddev,
> +				    enum dpu_crtc_client_type curr_client_type,
> +				    struct dpu_core_perf_params *perf)
>   {
> -	struct dpu_core_perf_params perf = { 0 };
> -	enum dpu_crtc_client_type curr_client_type
> -					= dpu_crtc_get_client_type(crtc);
> -	struct drm_crtc *tmp_crtc;
>   	struct dpu_crtc_state *dpu_cstate;
> -	int i, ret = 0;
> -	u64 avg_bw;
> -
> -	if (!kms->num_paths)
> -		return 0;
> +	struct drm_crtc *tmp_crtc;
>   
> -	drm_for_each_crtc(tmp_crtc, crtc->dev) {
> +	drm_for_each_crtc(tmp_crtc, ddev) {
>   		if (tmp_crtc->enabled &&
> -			curr_client_type ==
> -				dpu_crtc_get_client_type(tmp_crtc)) {
> +		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
>   			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
>   
> -			perf.max_per_pipe_ib = max(perf.max_per_pipe_ib,
> -					dpu_cstate->new_perf.max_per_pipe_ib);
> +			perf->max_per_pipe_ib = max(perf->max_per_pipe_ib,
> +						    dpu_cstate->new_perf.max_per_pipe_ib);
>   
> -			perf.bw_ctl += dpu_cstate->new_perf.bw_ctl;
> +			perf->bw_ctl += dpu_cstate->new_perf.bw_ctl;
>   
> -			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu paths:%d\n",
> -				  tmp_crtc->base.id,
> -				  dpu_cstate->new_perf.bw_ctl, kms->num_paths);
> +			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu\n",
> +					 tmp_crtc->base.id,
> +					 dpu_cstate->new_perf.bw_ctl);
>   		}
>   	}
> +}
> +
> +static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> +		struct drm_crtc *crtc)
> +{

since you have fixed some of the formatting inside the function, do you 
also want to align struct drm_crtc *crtc with the opening braces?

With that fixed,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


> +	struct dpu_core_perf_params perf = { 0 };
> +	int i, ret = 0;
> +	u64 avg_bw;
> +
> +	if (!kms->num_paths)
> +		return 0;
> +
> +	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
>   
>   	avg_bw = perf.bw_ctl;
>   	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
> 
