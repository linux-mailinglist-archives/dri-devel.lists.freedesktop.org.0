Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DA1672E4E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 02:35:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F3D10E888;
	Thu, 19 Jan 2023 01:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F9710E886;
 Thu, 19 Jan 2023 01:35:36 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30INe4Tt019340; Thu, 19 Jan 2023 01:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/Megnh6qkn56rNwroVxfYKp3P6rY7MnGlZ9f9G1ZvAM=;
 b=k7INm12K09KI2WFVkODnaem9zFQbhkPhPK4N9MtuQHzp3L74YLJ4/UfgLNJaewZx8ckW
 U/matt5JRPewXnBmMej1szNZyfxJioxFwdEjfUOjbTjRvY6ViFl1Q9AUIMZ2xlmhvRdy
 KqIrqnMze3PEU+R44Rm8FBFahgwKGUa2ZF7mmk19xpUTnLmXzzbQivoEfJALgl+BZuVs
 QsTvbROJGXKmNPC5CY0hNJi5kP9Gy5pxW6FWNZyQUodkUyc+X4VYM5s6SGufl53V0zG4
 kydvlxWGjqRy97coE9zdoF2cj+0tvMkoWuPXIgYIYxoC6lmr72MOeXK5/m/L+FVUIigy Jw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n5ws6ks59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Jan 2023 01:35:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30J1ZXsa008712
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Jan 2023 01:35:33 GMT
Received: from [10.110.108.90] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 18 Jan
 2023 17:35:32 -0800
Message-ID: <9f701feb-3d16-8e78-871c-17b352b2d448@quicinc.com>
Date: Wed, 18 Jan 2023 17:35:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3] drm/msm/dpu: Reapply CTM if modeset is needed
Content-Language: en-US
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 <freedreno@lists.freedesktop.org>
References: <20230118233848.611-1-quic_jesszhan@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230118233848.611-1-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: C3VyQzeeaxmjJ_8OH7HUI0sCbICwV5ad
X-Proofpoint-ORIG-GUID: C3VyQzeeaxmjJ_8OH7HUI0sCbICwV5ad
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_05,2023-01-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 mlxlogscore=998 clxscore=1015 lowpriorityscore=0 mlxscore=0
 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301190008
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
Cc: quic_kalyant@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/18/2023 3:38 PM, Jessica Zhang wrote:
> Add a !drm_atomic_crtc_needs_modeset() check to
> _dpu_crtc_setup_cp_blocks() so that CTM is reapplied if the LM/DSPP
> blocks were reallocated during modeset or after a suspend/resume.
> 
> Changes in V2:
> - Fixed commit message
> 
> Changes in V3:
> - Added mention of suspend/resume case back to commit message
> 
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/23
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 13ce321283ff..aa120a230222 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -748,7 +748,7 @@ static void _dpu_crtc_setup_cp_blocks(struct drm_crtc *crtc)
>   	int i;
>   
>   
> -	if (!state->color_mgmt_changed)
> +	if (!state->color_mgmt_changed && !drm_atomic_crtc_needs_modeset(state))
>   		return;
>   
>   	for (i = 0; i < cstate->num_mixers; i++) {
