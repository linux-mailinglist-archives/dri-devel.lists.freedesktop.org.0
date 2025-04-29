Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B030DAA3CE6
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 01:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CD310E46C;
	Tue, 29 Apr 2025 23:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="NM9pNT7t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2832410E538;
 Tue, 29 Apr 2025 23:48:17 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLaYKj020989;
 Tue, 29 Apr 2025 23:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oxUzzwgOdMjLzaUEsHCOAZMj5vXBisxuhB1rh5eePP8=; b=NM9pNT7tUZ3VrfPy
 nkirBQwdr9kTg1r8ntzz77GdJ/o0euXluUURgZ+EIVmLW/7rZXSKM4/2qRPSVXY/
 LHcm2wRtNsxR+3uc9wTKdwY5uto411Dbf7uPcFWIZJi/veFeUII1fAuTndlxgmZJ
 8BXw043HpeFUXqNHT7LwVV7k+U7FKoS8KRmHqfoqAJ2Vp/TuVwlcoZnntrYwEl4N
 nKTQdNLqVnMEU8RLP3y7zxyGaR5e6zn+Dyu7scMKn9c3K60Blw1oHe7w9cpcWMQQ
 tXARRzc4VqAtWc3BxiwkJkGkWV7foWdQFPT+FsGKwFMU9WZkvLesXT1OsRMfYeDt
 +qcVOw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u1r7e0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Apr 2025 23:48:12 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53TNmBfE006356
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Apr 2025 23:48:11 GMT
Received: from [10.134.71.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 16:48:10 -0700
Message-ID: <b744353c-ad03-4500-9659-cf74ff288a01@quicinc.com>
Date: Tue, 29 Apr 2025 16:48:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] drm/msm/dpu: pass master interface to CTL
 configuration
To: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>
References: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
 <20250307-dpu-active-ctl-v3-3-5d20655f10ca@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250307-dpu-active-ctl-v3-3-5d20655f10ca@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=G5AcE8k5 c=1 sm=1 tr=0 ts=6811653c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8
 a=tVI0ZWmoAAAA:8 a=COk6AnOGAAAA:8
 a=pM9NJlXElLjiyNQRogoA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDE3NiBTYWx0ZWRfXw9zFPWohdwU5
 AnYbY8+HcXA4pFfcS/nf9j89bvqgD0YVfKpECfsdBMo+7+VBkwZTX60ZQaiDUycytGkHhI/sLCJ
 AuFjvOP5/l4d7Qxv5VnvvINJTMweYPoOR/k4eEnIp6YqTGgWCEg+hBvULvPEtWmCI3DfzmKbOPk
 EMfNu+7yOhl/Q7BYZCAp+V3WY5a1ehwwi3+MNQrRoYYHIWDFRAVLfaLd6vLjNTTBOBKFdVTA8MU
 yUTTWVBPhsmYi3ZgKR+/OC/l3tN1ba5rGg3IpN9AHbBrILei1OQpiERYHH7MGinB5FEUkdr/Dnz
 8gQhImlSwzXCdzwrgpfcTOb96n1xLXEo8ytdEi2Qo99ONbDGeKq014+woIf6+6Jf9lKQ3rCpTxF
 M1/XF71FtQztCYHEpSsJnAzDD8gvlEk4d4rRO7gu/7U3tCjhSx7KXvkUGQTnUAhH8HROdttL
X-Proofpoint-GUID: xy3JhOGD3_KXcWNcSvOVls6D8--26v28
X-Proofpoint-ORIG-GUID: xy3JhOGD3_KXcWNcSvOVls6D8--26v28
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290176
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



On 3/6/2025 10:24 PM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Active controls require setup of the master interface. Pass the selected
> interface to CTL configuration.
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 ++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index da9994a79ca293ec0265680c438835742102db2a..a0ba55ab3c894c200225fe48ec6214ae4135d059 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -60,6 +60,8 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>   		return;
>   
>   	intf_cfg.intf = phys_enc->hw_intf->idx;
> +	if (phys_enc->split_role == ENC_ROLE_MASTER)
> +		intf_cfg.intf_master = phys_enc->hw_intf->idx;
>   	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
>   	intf_cfg.stream_sel = cmd_enc->stream_sel;
>   	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index abd6600046cb3a91bf88ca240fd9b9c306b0ea2e..232055473ba55998b79dd2e8c752c129bbffbff4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -298,6 +298,8 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>   	if (phys_enc->hw_cdm)
>   		intf_cfg.cdm = phys_enc->hw_cdm->idx;
>   	intf_cfg.intf = phys_enc->hw_intf->idx;
> +	if (phys_enc->split_role == ENC_ROLE_MASTER)
> +		intf_cfg.intf_master = phys_enc->hw_intf->idx;
>   	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_VID;
>   	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>   	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
> 

