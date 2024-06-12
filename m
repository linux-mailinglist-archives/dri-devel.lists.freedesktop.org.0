Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4279047E9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 02:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4433C10E0EF;
	Wed, 12 Jun 2024 00:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="IfYGIevV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB6110E0EF;
 Wed, 12 Jun 2024 00:04:56 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BFMqXH026070;
 Wed, 12 Jun 2024 00:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NzZWDUzEYH97W8rJBkKtxt30ULIZaPPxoWU3xHJZVyo=; b=IfYGIevVHM6Az9+q
 zwHoNsuJsck+6l4M7eBr7zBe5bsAdruuG9cVTS0F7VBGJ1Wss9y5TzafMBofz3Lp
 /FkgY82IJpIjMZ/dmCT4B/rh+HlBrifwQ41qs1W8wP6O524M9j3l6VyzMkz5lsKc
 XMQKsAFvmKkbWUwoxlZyBrrqM+pucVsRGrvNUtkYebm/S9Q1tXsRf3Z1X0ZWsqNX
 e2hVBXxpDWTt3gcufhm2vJ6ikFYgR6sSfJ3hLUKvOZDVEpYHmL/10BXEXjEFjyTu
 89UkOYmu8ocOye6BwW6sbyFh5Fy17ulBcakZx2V74pEzYQf4XpR+TlU9Z/7kJxY/
 efWrEg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yps5x919c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jun 2024 00:04:53 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45C04qM3016093
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jun 2024 00:04:52 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Jun
 2024 17:04:52 -0700
Message-ID: <6f51224a-a7cd-4774-827a-967a4f4b38ee@quicinc.com>
Date: Tue, 11 Jun 2024 17:04:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/14] drm/msm/hdmi: set infoframes on all pre_enable
 calls
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
 <20240522-fd-hdmi-hpd-v2-4-c30bdb7c5c7e@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-4-c30bdb7c5c7e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Cp7JDNilM0owFr5HiQ_J0I9CQx2em4ES
X-Proofpoint-ORIG-GUID: Cp7JDNilM0owFr5HiQ_J0I9CQx2em4ES
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_12,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406110164
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



On 5/22/2024 3:50 AM, Dmitry Baryshkov wrote:
> In consequent modeset calls, the atomic_pre_enable() will be called
> several times without calling atomic_post_disable() inbetween. Thus

Hi Dmitry,

Just wondering, where are you seeing multiple pre_enable() calls without 
a post_disable() happening?

IIRC, the msm commit_tail always calls commit_modeset_disables() before 
the commit_modeset_enables(). Also, doesn't the pre_enable() and 
post_disable() only happen once for bringing up/down the bridge?

Thanks,

Jessica Zhang

> iframes will not be updated for the next mode. Fix this by setting the
> iframe outside of the !power_on check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> index 3c6121c57b01..fb99328107dd 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -133,10 +133,11 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>   		msm_hdmi_phy_resource_enable(phy);
>   		msm_hdmi_power_on(bridge);
>   		hdmi->power_on = true;
> -		if (hdmi->hdmi_mode) {
> -			msm_hdmi_config_avi_infoframe(hdmi);
> -			msm_hdmi_audio_update(hdmi);
> -		}
> +	}
> +
> +	if (hdmi->hdmi_mode) {
> +		msm_hdmi_config_avi_infoframe(hdmi);
> +		msm_hdmi_audio_update(hdmi);
>   	}
>   
>   	msm_hdmi_phy_powerup(phy, hdmi->pixclock);
> 
> -- 
> 2.39.2
> 
