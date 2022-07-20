Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC1C57BB2E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 18:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1D5112953;
	Wed, 20 Jul 2022 16:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1390 seconds by postgrey-1.36 at gabe;
 Wed, 20 Jul 2022 16:16:29 UTC
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BF312B2E8;
 Wed, 20 Jul 2022 16:16:29 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26KEneff004381;
 Wed, 20 Jul 2022 15:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=j2gzFu/wt6aBTiGBmAPpcDslvY+HafzuYx4BhFQDEvg=;
 b=LkmZi8kYWI2MAf+Q/Ud38DlQkU+oGbkaDbGaTxCf4BpAWJsShy30LBeA8uaK3bEXZ1BK
 5EEYYzzUddKzmxyWmOXHMY4cP2wv8yCkvw6hh+jmjCk0IR2sYkfnxBb7U+Efd/Vv0ct8
 awHLoD9bZ6HhuowIzDBJaLIpJUNWONlsa+zZdluj+FgWvwkUhH6YtI1VL6x2IlfjLByG
 nSGhqQ3k/4UvB7f9gkJCODKVYGPV6ZgwntiCh2AQlZ68aEEoeSEYtnrUhCns3rLjalFf
 nfcC+Ip9GtNmHfRjE64+laxc/AAL7vmiI8y5MQtk6FO8XYiXGifZh+QDLQOvKJBYJ7Sa qg== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hdrfjm52b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jul 2022 15:53:14 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 26KFrEXU015977
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jul 2022 15:53:14 GMT
Received: from [10.71.108.121] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 20 Jul
 2022 08:53:13 -0700
Message-ID: <d7e303f8-e566-ccbf-be24-b12dd9764bbd@quicinc.com>
Date: Wed, 20 Jul 2022 08:53:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.1
Subject: Re: [PATCH] drm/msm/dpu: populate wb or intf before reset_intf_cfg
Content-Language: en-US
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 <freedreno@lists.freedesktop.org>
References: <1657912468-17254-1-git-send-email-quic_abhinavk@quicinc.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <1657912468-17254-1-git-send-email-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Rf8sUwLxk3N-Pi4NeKT3zXc8sJlVvNwO
X-Proofpoint-ORIG-GUID: Rf8sUwLxk3N-Pi4NeKT3zXc8sJlVvNwO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_10,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=983 suspectscore=0
 clxscore=1011 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207200065
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
Cc: dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/15/2022 12:14 PM, Abhinav Kumar wrote:
> dpu_encoder_helper_phys_cleanup() was not populating neither
> wb or intf to the intf_cfg before calling the reset_intf_cfg().
> 
> This causes the reset of the active bits of wb/intf to be
> skipped which is incorrect.
> 
> Fix this by populating the relevant wb or intf indices correctly.
> 
> Fixes: ae4d721ce100 ("drm/msm/dpu: add an API to reset the encoder related hw blocks")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # Trogdor (SC8170)

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index c682d4e02d1b..52a626117f70 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2061,6 +2061,12 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>   
>   	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>   	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
> +
> +	if (phys_enc->hw_intf)
> +		intf_cfg.intf = phys_enc->hw_intf->idx;
> +	if (phys_enc->hw_wb)
> +		intf_cfg.wb = phys_enc->hw_wb->idx;
> +
>   	if (phys_enc->hw_pp->merge_3d)
>   		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
>   
> -- 
> 2.7.4
> 
