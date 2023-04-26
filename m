Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C89236EFB0E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 21:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C4A10EA16;
	Wed, 26 Apr 2023 19:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E191010EA2B;
 Wed, 26 Apr 2023 19:24:48 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33QIWFAT031383; Wed, 26 Apr 2023 19:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=bMPlUTTK+YJToya8Km84+AXYSHsYWFx2eSlN8eMnxWU=;
 b=pUR4Xu+i9TXD/bEmY54HKaibuGumPf8Uk4vYl9L1URUcloAQopTxWzLICXee6ee1eDq7
 3eHsOeBrGVilBrl08hatyoqXOt4r2HKyctUTI2lf/hLCbWgyOY+4JvgwqswuGuSczuFd
 cJINjGq90os4jtjjQhXmBrJ8WuYfmCYBkvQHyOxUfaoH0XN9gEi37dQqfA2oYtZvcFhx
 X8tx4/Iasf8CuL7P0DBV2xIgq94jK73zlzjbXOlxaZbGrgPUjtQ4ar1ld1B6BbPOBg9N
 3VMWjGle7Ni1ZT5U5ZVDvbQkaQncevjZ0EgGSaTwJRGNfVDQqa7p4xU0h10aR9iDOYfr 7w== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q79am02wd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 19:24:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33QJOjrK001537
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Apr 2023 19:24:45 GMT
Received: from [10.110.124.105] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 26 Apr
 2023 12:24:44 -0700
Message-ID: <0c778d69-71e5-8839-7836-c9e4d8bba621@quicinc.com>
Date: Wed, 26 Apr 2023 12:24:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/4] drm/msm/dpu: remove DPU_DSPP_GC handling in dspp flush
Content-Language: en-US
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, Sean Paul
 <sean@poorly.run>, "David Airlie" <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>
References: <20230426192035.5088-1-quic_abhinavk@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230426192035.5088-1-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: nQXM4TsF4Wykifg0CruUjC0hvh9Srk1B
X-Proofpoint-ORIG-GUID: nQXM4TsF4Wykifg0CruUjC0hvh9Srk1B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-26_10,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=774
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260172
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
Cc: quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 marijn.suijten@somainline.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry for the spam, this should have been v2, I have fixed that and 
resent this series.

On 4/26/2023 12:20 PM, Abhinav Kumar wrote:
> Gamma correction blocks (GC) are not used today so lets remove
> the usage of DPU_DSPP_GC in the dspp flush to make it easier
> to remove GC from the catalog.
> 
> We can add this back when GC is properly supported in DPU with
> one of the standard DRM properties.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Link: https://lore.kernel.org/r/20230421224721.12738-1-quic_abhinavk@quicinc.com
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index bbdc95ce374a..57adaebab563 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -336,9 +336,6 @@ static void dpu_hw_ctl_update_pending_flush_dspp_sub_blocks(
>   	case DPU_DSPP_PCC:
>   		ctx->pending_dspp_flush_mask[dspp - DSPP_0] |= BIT(4);
>   		break;
> -	case DPU_DSPP_GC:
> -		ctx->pending_dspp_flush_mask[dspp - DSPP_0] |= BIT(5);
> -		break;
>   	default:
>   		return;
>   	}
