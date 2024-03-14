Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C0F87C526
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 23:32:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC5410E20E;
	Thu, 14 Mar 2024 22:32:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="lIVMO9vp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8469F10E20E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 22:32:32 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42EMTXbL031216; Thu, 14 Mar 2024 22:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=xXmOIatxQkgeH0JVMzaUkHFvtLBrY6AwQXmd7Zq9mJc=; b=lI
 VMO9vpcT57ZfiDeOAchKOx+K//SS8L/EOI+sYJLmUiLFqRIVekpBi7WysZI/nNg7
 W5mJNyupDVeo3LLtjOsIXtaMVhaMyArK/rih9ONqXIixmnpWu41i+FFroSYfuxGG
 JZ4nlZmqsYBAvts2Jby96m9X3DfJPstiaOtRKxpyeO4xHDeOKThlI7uPSE8ev+Ee
 hkoqRYRbhmNQhzYPnxeGZZVjw/r5GuFyGr2JdwBEqOj75ExAfvjxx+bBU7nlDknw
 zSdft17ZRTTAdptTbXT8iBj7BqzmcOwnTtjk/Q5XC/EUdzk/OMEYj8CVDS0PHQqf
 gKlEJ7NvNYDZbeT/0m0g==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wv9yq80d5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Mar 2024 22:32:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42EMWLk2018704
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Mar 2024 22:32:21 GMT
Received: from [10.110.97.122] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 14 Mar
 2024 15:32:20 -0700
Message-ID: <098d8dda-75fe-45b8-ad36-a21ed44c4555@quicinc.com>
Date: Thu, 14 Mar 2024 15:32:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: atna33xc20: Fix unbalanced regulator in the
 case HPD doesn't assert
To: <dianders@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, Sam
 Ravnborg <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240313-homestarpanel-regulator-v1-1-b8e3a336da12@chromium.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240313-homestarpanel-regulator-v1-1-b8e3a336da12@chromium.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: o0F9G-x63Byz-ivtQ01d98rMZ7Qd31e3
X-Proofpoint-GUID: o0F9G-x63Byz-ivtQ01d98rMZ7Qd31e3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_13,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403140173
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



On 3/13/2024 2:12 PM, Douglas Anderson via B4 Relay wrote:
> From: Douglas Anderson <dianders@chromium.org>
> 
> When the atna33xc20 driver was first written the resume code never
> returned an error. If there was a problem waiting for HPD it just
> printed a warning and moved on. This changed in response to review
> feedback [1] on a future patch but I accidentally didn't account for
> rolling back the regulator enable in the error cases. Do so now.
> 
> [1] https://lore.kernel.org/all/5f3cf3a6-1cc2-63e4-f76b-4ee686764705@linaro.org/
> 
> Fixes: 3b5765df375c ("drm/panel: atna33xc20: Take advantage of wait_hpd_asserted() in struct drm_dp_aux")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>   drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 22 +++++++++++++---------
>   1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> index 76c2a8f6718c..9c336c71562b 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> @@ -109,19 +109,17 @@ static int atana33xc20_resume(struct device *dev)
>   		if (hpd_asserted < 0)
>   			ret = hpd_asserted;
>   
> -		if (ret)
> +		if (ret) {
>   			dev_warn(dev, "Error waiting for HPD GPIO: %d\n", ret);
> -
> -		return ret;
> -	}
> -
> -	if (p->aux->wait_hpd_asserted) {
> +			goto error;
> +		}
> +	} else if (p->aux->wait_hpd_asserted) {

Hi Doug,

Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

>   		ret = p->aux->wait_hpd_asserted(p->aux, HPD_MAX_US);
>   
> -		if (ret)
> +		if (ret) {
>   			dev_warn(dev, "Controller error waiting for HPD: %d\n", ret);
> -
> -		return ret;
> +			goto error;
> +		}
>   	}
>   
>   	/*
> @@ -133,6 +131,12 @@ static int atana33xc20_resume(struct device *dev)
>   	 * right times.
>   	 */
>   	return 0;
> +
> +error:
> +	drm_dp_dpcd_set_powered(p->aux, false);
> +	regulator_disable(p->supply);
> +
> +	return ret;
>   }
>   
>   static int atana33xc20_disable(struct drm_panel *panel)
> 
> ---
> base-commit: b33651a5c98dbd5a919219d8c129d0674ef74299
> change-id: 20240311-homestarpanel-regulator-f4b890ff4b7c
> 
> Best regards,
> -- 
> Douglas Anderson <dianders@chromium.org>
> 
