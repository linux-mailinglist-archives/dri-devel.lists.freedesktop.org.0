Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE8F767A1E
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 02:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D865E10E7B7;
	Sat, 29 Jul 2023 00:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B4810E7B7;
 Sat, 29 Jul 2023 00:49:49 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36SNPmPh004179; Sat, 29 Jul 2023 00:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=L0qAJAZUF2TZuxT3ixsbyFq8VsBf1MHwL1g3Gwf7Ogg=;
 b=G3Ke45nX8+kLqxuJhaJssJmAypQOm/VsPY/TjjGloQaxbxnKH5Vgstbb8TNwwC9vEG4V
 PKxplWDnrWK+fRdBsycLK0U/jSBHlDlZPLOon/ZT4npOHi8Cx0ie/L5Z8slqGLIXqizw
 6C6Ygb+bTPxi4WSo6K66nFvKkvcpHoNwS9PnMPesZEE4sueFH7LVM4D47UHJrM1NolJk
 21jUbKiwJYbtqb+F7+Cd3ugbG3KSGtIEZCDnEK2EUX6Zu23fxl7cN7/vn0U5/hCctpAt
 AmXyxKWNr+hve2ej/9Y35Fa4KUqY1m5TAQR69kifJnd/84nniBE3S5DCdUpECarJsjPV Lg== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s4j0g0qj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Jul 2023 00:49:44 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36T0nhfB010721
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Jul 2023 00:49:43 GMT
Received: from [10.110.51.188] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 28 Jul
 2023 17:49:41 -0700
Message-ID: <40e6772a-ddda-8d81-f01d-8c5524d40077@quicinc.com>
Date: Fri, 28 Jul 2023 17:49:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/13] drm/msm/dpu: use drmm-managed allocation for
 dpu_plane
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>
References: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
 <20230707231251.3849701-10-dmitry.baryshkov@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230707231251.3849701-10-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: TyxjSAlo2pp9t27wAssTIKaUoSdoOwM6
X-Proofpoint-ORIG-GUID: TyxjSAlo2pp9t27wAssTIKaUoSdoOwM6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307290005
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/7/2023 4:12 PM, Dmitry Baryshkov wrote:
> Change struct dpu_plane allocation to use drmm_universal_plane_alloc().
> This removes the need to perform any actions on plane destruction.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 46 +++++------------------
>   1 file changed, 10 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index f114efee1b57..9d9e1cbf0dd7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1170,20 +1170,6 @@ static void dpu_plane_atomic_update(struct drm_plane *plane,
>   	}
>   }
>   
> -static void dpu_plane_destroy(struct drm_plane *plane)
> -{
> -	struct dpu_plane *pdpu = plane ? to_dpu_plane(plane) : NULL;
> -
> -	DPU_DEBUG_PLANE(pdpu, "\n");
> -
> -	if (pdpu) {
> -		/* this will destroy the states as well */
> -		drm_plane_cleanup(plane);
> -
> -		kfree(pdpu);
> -	}
> -}
> -
>   static void dpu_plane_destroy_state(struct drm_plane *plane,
>   		struct drm_plane_state *state)
>   {
> @@ -1353,7 +1339,6 @@ static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
>   static const struct drm_plane_funcs dpu_plane_funcs = {
>   		.update_plane = drm_atomic_helper_update_plane,
>   		.disable_plane = drm_atomic_helper_disable_plane,
> -		.destroy = dpu_plane_destroy,
>   		.reset = dpu_plane_reset,
>   		.atomic_duplicate_state = dpu_plane_duplicate_state,
>   		.atomic_destroy_state = dpu_plane_destroy_state,
> @@ -1381,35 +1366,28 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>   	struct dpu_hw_sspp *pipe_hw;
>   	uint32_t num_formats;
>   	uint32_t supported_rotations;
> -	int ret = -EINVAL;
> -
> -	/* create and zero local structure */
> -	pdpu = kzalloc(sizeof(*pdpu), GFP_KERNEL);
> -	if (!pdpu) {
> -		DPU_ERROR("[%u]failed to allocate local plane struct\n", pipe);
> -		ret = -ENOMEM;
> -		return ERR_PTR(ret);
> -	}
> -
> -	/* cache local stuff for later */
> -	plane = &pdpu->base;
> -	pdpu->pipe = pipe;
> +	int ret;
>   
>   	/* initialize underlying h/w driver */
>   	pipe_hw = dpu_rm_get_sspp(&kms->rm, pipe);
>   	if (!pipe_hw || !pipe_hw->cap || !pipe_hw->cap->sblk) {
>   		DPU_ERROR("[%u]SSPP is invalid\n", pipe);
> -		goto clean_plane;
> +		return ERR_PTR(-EINVAL);
>   	}
>   
>   	format_list = pipe_hw->cap->sblk->format_list;
>   	num_formats = pipe_hw->cap->sblk->num_formats;
>   
> -	ret = drm_universal_plane_init(dev, plane, 0xff, &dpu_plane_funcs,
> +	pdpu = drmm_universal_plane_alloc(dev, struct dpu_plane, base,
> +				0xff, &dpu_plane_funcs,
>   				format_list, num_formats,
>   				supported_format_modifiers, type, NULL);
> -	if (ret)
> -		goto clean_plane;
> +	if (IS_ERR(pdpu))
> +		return ERR_CAST(pdpu);
> +
> +	/* cache local stuff for later */
> +	plane = &pdpu->base;
> +	pdpu->pipe = pipe;
>   
>   	pdpu->catalog = kms->catalog;
>   
> @@ -1439,8 +1417,4 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>   	DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
>   					pipe, plane->base.id);
>   	return plane;
> -
> -clean_plane:
> -	kfree(pdpu);
> -	return ERR_PTR(ret);
>   }
> -- 
> 2.39.2
> 
