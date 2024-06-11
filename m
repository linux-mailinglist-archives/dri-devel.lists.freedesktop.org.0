Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 463EF904105
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 18:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407EB10E064;
	Tue, 11 Jun 2024 16:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="SPKC9XXl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7544810E064
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 16:18:28 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BA7vJR016951;
 Tue, 11 Jun 2024 16:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NbIGTfkXL7QFDB2dDvLKDcIZZq590Hs4Si1rtkYPMcA=; b=SPKC9XXlebuNa6in
 pO1bOsxvDBh70f/1o7lUDSwFXcl/1p20DsN+FdUgiCwgZrmGeNJIZxiSYzhHwNB5
 zaqTS2LhCjc14tdZF4LP6K/2z5fdMuNkQmac4AbJKeoMm1GaF3jRJQ+BYRpryOPb
 OEO8mnGmy6NRW5UDrtDqJz3/Wz6uCxAuYwF9+qI+yOigvbWeeR6sH98cG2EowQhB
 2l9E5gGuKj+3uw+rGjpk1LWeCWJ7G2cBSuHMZoxpFe331PRUhARu5Ekju9k4bCzG
 4FfJ4dTm8wzeJzcm6oKAGZ3vQV8c8CetlJnivV1i320hQG75VZd+5Q5rjlogIN46
 tjytwA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypmjas08h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jun 2024 16:18:21 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45BGIKIv024411
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jun 2024 16:18:20 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Jun
 2024 09:18:20 -0700
Message-ID: <b1ce756e-c9c0-49bd-b5f4-e6db79dc8f1d@quicinc.com>
Date: Tue, 11 Jun 2024 09:18:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panel : himax-hx83102: fix incorrect argument to
 mipi_dsi_msleep
Content-Language: en-US
To: Tejas Vipin <tejasvipin76@gmail.com>, <neil.armstrong@linaro.org>
CC: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <1b7c19ec-536f-4f28-a68f-b03c1b51b99b@gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <1b7c19ec-536f-4f28-a68f-b03c1b51b99b@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 7dwBttWeolFO5AeyFJd4qyLAd8mRFZXA
X-Proofpoint-ORIG-GUID: 7dwBttWeolFO5AeyFJd4qyLAd8mRFZXA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_09,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 clxscore=1011 mlxscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110115
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



On 6/11/2024 7:05 AM, Tejas Vipin wrote:
> mipi_dsi_msleep expects struct mipi_dsi_multi_context to be passed as a
> value and not as a reference.
> 
> Fixes: a2ab7cb169da ("drm/panel: himax-hx83102: use wrapped MIPI DCS functions")
> 
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>

Hi Tejas,

(for future reference, you don't need an extra newline between the Fixes 
and Signed-off-by tags)

LGTM,

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> ---
> 
> Changes in v2:
>      - Add Fixes tag
> 
> v1: https://lore.kernel.org/all/d9f4546f-c2f9-456d-ba75-85cc195dd9b8@gmail.com/
> 
> ---
>   drivers/gpu/drm/panel/panel-himax-hx83102.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> index 6009a3fe1b8f..ab00fd92cce0 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> @@ -479,7 +479,7 @@ static int hx83102_disable(struct drm_panel *panel)
>   	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>   	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>   
> -	mipi_dsi_msleep(&dsi_ctx, 150);
> +	mipi_dsi_msleep(dsi_ctx, 150);
>   
>   	return dsi_ctx.accum_err;
>   }
> -- 
> 2.45.2
> 
