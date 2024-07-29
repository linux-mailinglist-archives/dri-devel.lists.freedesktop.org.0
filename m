Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D8093FD53
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 20:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291A110E403;
	Mon, 29 Jul 2024 18:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="B44W4GFB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8A710E070;
 Mon, 29 Jul 2024 18:29:16 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46TAGfaP021303;
 Mon, 29 Jul 2024 18:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Q4xBxrNsmEAnm8o61Q0nTWB+09MMOMxU3VqKq1UCigc=; b=B44W4GFBRX1gQdt5
 BXvw88OpcbG/fcoDDJ4UDJt4uDsCS+eSiOxOLJno8BegDEZMCse478Es322o5fkl
 U8ud4B25NilYn9OofPk0cF7gkK00/d/B6ftiqEj8jBZDkU1Kr/UsrlIJCoICOsv5
 wgiX/H7UOLcpZzlUFklhynEbP9eBUTeQl72fX7EOqFP+O7Q/Erxa1hQ3dWefBk/4
 OeOXg/o/cTk+FP2/geLPYmRUK/8kUaR8xkNuAlHWq4cAvKUqexlACsf/4M0aDQ5M
 0jcQrChlbSTnjsZGSDfVjcUPpeds2RZsV9fMKb2pr/i/qxViFd+DIIXEuav/XPrr
 Oat90A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mrfxn5gx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jul 2024 18:28:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46TISiOo006559
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jul 2024 18:28:44 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 11:28:44 -0700
Message-ID: <8fa86c0c-183b-4787-9525-38dfe6bcecc6@quicinc.com>
Date: Mon, 29 Jul 2024 11:28:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: fix the max supported bpp logic
To: Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 "David Airlie" <airlied@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Guenter Roeck <groeck@chromium.org>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Tanmay Shah <tanmay@codeaurora.org>, Vara Reddy <quic_varar@quicinc.com>,
 <freedreno@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
 <neil.armstrong@linaro.org>, <abel.vesa@linaro.org>,
 <quic_khsieh@quicinc.com>, Rob Clark <robdclark@chromium.org>, "Chandan
 Uddaraju" <chandanu@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240725220320.130916-1-quic_abhinavk@quicinc.com>
 <CAE-0n50mBEX98HH+5BurM-uRyzrxcPXFJ7yLg__hFJHfYjm67Q@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAE-0n50mBEX98HH+5BurM-uRyzrxcPXFJ7yLg__hFJHfYjm67Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: dYymbe-59TNSP4-xzxgpWlPlCA8jceAr
X-Proofpoint-ORIG-GUID: dYymbe-59TNSP4-xzxgpWlPlCA8jceAr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_16,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 bulkscore=0 phishscore=0 clxscore=1015 mlxscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290124
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

Hi Stephen

On 7/26/2024 5:24 PM, Stephen Boyd wrote:
> Quoting Abhinav Kumar (2024-07-25 15:03:19)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
>> index a916b5f3b317..56ce5e4008f8 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>> @@ -423,8 +424,10 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel)
>>                                  drm_mode->clock);
>>          drm_dbg_dp(panel->drm_dev, "bpp = %d\n", dp_panel->dp_mode.bpp);
>>
>> -       dp_panel->dp_mode.bpp = max_t(u32, 18,
>> -                               min_t(u32, dp_panel->dp_mode.bpp, 30));
>> +       max_supported_bpp = dp_panel_get_mode_bpp(dp_panel, dp_panel->dp_mode.bpp,
>> +                                                 dp_panel->dp_mode.drm_mode.clock);
>> +       dp_panel->dp_mode.bpp = max_t(u32, 18, max_supported_bpp);
> 
> Is the max_t() usage still required once 'max_supported_bpp' is also a
> u32? Also, what is 18? Shouldn't that be some sort of define so we know
> what it represents?
> 
> Or maybe none of that is required? From what I can tell,
> dp_panel_get_mode_bpp() calls dp_panel_get_supported_bpp() which will
> essentially clamp the bpp range between 18 and 30, unless
> dp_panel->dp_mode.bpp is between 30 and 18 but not divisible by 6, e.g.
> 29. Perhaps this patch can be included and the max_t above dropped.
> 
> ---8<--
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c
> b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 07db8f37cd06..5cd7c138afd3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -90,22 +90,22 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
>   static u32 dp_panel_get_supported_bpp(struct dp_panel *dp_panel,
>   		u32 mode_edid_bpp, u32 mode_pclk_khz)
>   {
> -	struct dp_link_info *link_info;
> +	const struct dp_link_info *link_info;
>   	const u32 max_supported_bpp = 30, min_supported_bpp = 18;
> -	u32 bpp = 0, data_rate_khz = 0;
> +	u32 bpp, data_rate_khz;
> 
>   	bpp = min_t(u32, mode_edid_bpp, max_supported_bpp);
> 
>   	link_info = &dp_panel->link_info;
>   	data_rate_khz = link_info->num_lanes * link_info->rate * 8;
> 
> -	while (bpp > min_supported_bpp) {
> +	do {
>   		if (mode_pclk_khz * bpp <= data_rate_khz)
> -			break;
> +			return bpp;
>   		bpp -= 6;
> -	}
> +	} while (bpp > min_supported_bpp);
> 
> -	return bpp;
> +	return min_supported_bpp;
>   }
> 

Thanks for the feedback.

Your change looks valid. We can use this and drop the max_t usage.

Let me push this with your Suggested-by credits.

>   static int dp_panel_update_modes(struct drm_connector *connector,
