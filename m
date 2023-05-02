Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 017686F3E44
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 09:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F65D10E31F;
	Tue,  2 May 2023 07:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320BD10E05A;
 Tue,  2 May 2023 00:57:43 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3420tPn7031461; Tue, 2 May 2023 00:57:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=7ehpikn4NWTdHIl7tTrunut0iJfkiKvbaUmhFlLfRgU=;
 b=blW84pih0SknBhzaB+sN/6bmOIACIc/kSQAPqUUFR1NO4PrtUpN/OC+ZApU0LIwZBLq8
 ya8aHVrDfjbq4u4Rby7VKL6FZn7wubiTG+ivD6ji5pTNQ+C7Lr6Aedpsf0LMgtXPIiuO
 ExRdYwJzALcbEqyZeV+JGL3Ydkbb3Gm2KUDXfLynvYtq+4qZeyPIQRtiTeajEQ5ijfPz
 n26josj1PSkhpX/qogpzpfuMQCevS8FxB2Na6ZNdRi7RCf1F4h3mhdsw2x6FRiV0awed
 LAsx25sgAo+fg4q/L2lKqYy6r7eClBW2xcIv72TaTsmQYTjPXbA5XnDtUNy1AuQDDheD 1A== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qajdp0nfj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 May 2023 00:57:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3420valL018414
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 2 May 2023 00:57:36 GMT
Received: from [10.134.71.70] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 1 May 2023
 17:57:35 -0700
Message-ID: <f108e588-6671-ad4e-35b3-7771efab97ce@quicinc.com>
Date: Mon, 1 May 2023 17:56:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Freedreno] [PATCH 3/9] drm/msm/dpu: fix the condition for (not)
 applying QoS to CURSOR SSPP
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>
References: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
 <20230430205710.3188230-4-dmitry.baryshkov@linaro.org>
From: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
In-Reply-To: <20230430205710.3188230-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: CML9iQSyYva20UYWseQTeUZgMY78gnOi
X-Proofpoint-ORIG-GUID: CML9iQSyYva20UYWseQTeUZgMY78gnOi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-01_16,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305020005
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
> The function dpu_plane_sspp_update_pipe() contains code to skip enabling
> the QoS and OT limitis for CURSOR pipes. However all DPU since sdm845
> repurpose DMA SSPP for the cursor planes because they lack the real
> CURSOR SSPP. Fix the condition to actually check that the plane is
> CURSOR or not.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 43d9fbc0c687..36f6eb71fef8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1124,7 +1124,8 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
>   	_dpu_plane_set_qos_lut(plane, pipe, fmt, pipe_cfg);
>   	_dpu_plane_set_danger_lut(plane, pipe, fmt);
>   
> -	if (plane->type != DRM_PLANE_TYPE_CURSOR) {
> +	if (pipe->sspp->idx == SSPP_CURSOR0 ||
> +	    pipe->sspp->idx == SSPP_CURSOR1) {
Isn't this differ from the current sequence: The existing sequence 
programs QOS for all the non-cursor SSPP's. This patch programs QOS only 
for CURSOR SSPP's.

If DMA SSPP's are used for cursor planes, we should ideally remove this 
check.

Jeykumar S.
>   		_dpu_plane_set_qos_ctrl(plane, pipe, true, DPU_PLANE_QOS_PANIC_CTRL);
>   		_dpu_plane_set_ot_limit(plane, pipe, pipe_cfg, frame_rate);
>   	}
