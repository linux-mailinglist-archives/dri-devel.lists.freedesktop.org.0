Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B71C9B527F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 20:11:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080BB10E6E7;
	Tue, 29 Oct 2024 19:11:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="gicpirwV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F44810E6E6;
 Tue, 29 Oct 2024 19:11:54 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49T9F0g9030224;
 Tue, 29 Oct 2024 19:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hKZ1W2Q6Ohe+iy8lwWtdNha9VAS1B9CoWmDwCMc6Gzw=; b=gicpirwV9QfjKSpq
 VnmpXbUI82zGhk8W6ZephPNn8bQqzEb0DpGY6oDCX21NVa5q3Pd78abGe4xVBFwt
 PClS2/Xrxsms9MpU/8F9DVLB6/xZEqMJ0i25Uuk7/f01rVRWcS+uhCk0FA8f1WWw
 7sCJjds55VIGEDbiKvW5d99P5aVGgEarHyX/FyXRjnfFC8VHEKiG3Myu7owO7iXu
 HD97PQvZJSVEmkCbMkIlZCQLU5JaO6+DMLMhFChpo0NCGYq3DLEec+sAnrfYlACx
 WFx8X/XicBA3vQ7xbEP7KMC21AnTQB+7S+h039TKwGCFtfJiFP+EAj+7Q4xivcgw
 Q2/Szw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqcqsk4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2024 19:11:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49TJBm99010188
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2024 19:11:48 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Oct
 2024 12:11:47 -0700
Message-ID: <ee312695-e309-4d56-8d3f-0fbffd923177@quicinc.com>
Date: Tue, 29 Oct 2024 12:11:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Cast an operand to u64 to prevent potential
 overflow in _dpu_core_perf_calc_clk()
To: Gax-c <zichenxie0106@gmail.com>, <robdclark@gmail.com>,
 <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <quic_kalyant@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20241029162645.9060-1-zichenxie0106@gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241029162645.9060-1-zichenxie0106@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: R_KkRa4z2sVCGGIw-yhzmA2lpp1Vh2DJ
X-Proofpoint-GUID: R_KkRa4z2sVCGGIw-yhzmA2lpp1Vh2DJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 clxscore=1011 priorityscore=1501 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290144
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



On 10/29/2024 9:26 AM, Gax-c wrote:
> From: Zichen Xie <zichenxie0106@gmail.com>
> 
> There may be a potential integer overflow issue in
> _dpu_core_perf_calc_clk(). crtc_clk is defined as u64, while
> mode->vtotal, mode->hdisplay, and drm_mode_vrefresh(mode) are defined as
> a smaller data type. The result of the calculation will be limited to
> "int" in this case without correct casting. In screen with high
> resolution and high refresh rate, integer overflow may happen.
> So, we recommend adding an extra cast to prevent potential
> integer overflow.
> 

You could just say "cast crtc_clk calculation to u64 in 
_dpu_core_perf_calc_clk()" in the subject to be more specific about 
which operand you are referring to.


> Fixes: c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for display")
> Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 68fae048a9a8..260accc151d4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -80,7 +80,7 @@ static u64 _dpu_core_perf_calc_clk(const struct dpu_perf_cfg *perf_cfg,
>   
>   	mode = &state->adjusted_mode;
>   
> -	crtc_clk = mode->vtotal * mode->hdisplay * drm_mode_vrefresh(mode);
> +	crtc_clk = (u64)mode->vtotal * mode->hdisplay * drm_mode_vrefresh(mode);
>   
>   	drm_atomic_crtc_for_each_plane(plane, crtc) {
>   		pstate = to_dpu_plane_state(plane->state);

Change looks valid to me, so with the subject fixed a bit:

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


