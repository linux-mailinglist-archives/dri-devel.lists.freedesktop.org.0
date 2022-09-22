Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 232575E6C0D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 21:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F085C10E0FB;
	Thu, 22 Sep 2022 19:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B781510E0F9;
 Thu, 22 Sep 2022 19:51:51 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28MJSdiU008780;
 Thu, 22 Sep 2022 19:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=MeoXkz9mJl2AQmTSrUtOL5D8P9mX9ccoJPSYpxHElW8=;
 b=Fcf156UgEckpsu/QPBn5R+oSuwFFAJOEtoJXYmYRt4S0ohaZwOG4psErIf0BmKoiug72
 93P5Jdfu61Dicwrk1T7v1NkfuAXDmsdbqt4QBaOJvduyt1ctHU3TSkhTZtE4Amo1pDBA
 vem5Qnyam+Ao1+K1tJOIynOtAYd35xzD5TnnASGN3UfwgvgjA3vERjUQSbnZxK1JY8DE
 9Txc93KRbnLp07raiGYZBdPWWGlGR9g4A76Jcf0hjioDaWncQMqoqJ4JFBHzE4P3eMCJ
 oytl/OkirpFCfELLeFNyRB4S1cdgE8W1wEzNLGxICvCgZaFvZjUdlWL/8teUxltpzc0n DQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jrdnmjpwh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Sep 2022 19:51:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28MJpW3C023827
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Sep 2022 19:51:32 GMT
Received: from [10.110.101.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 22 Sep
 2022 12:51:30 -0700
Message-ID: <71bb7201-b308-46ac-dd1d-3452b0682b21@quicinc.com>
Date: Thu, 22 Sep 2022 12:51:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [Freedreno] [PATCH v2 02/10] drm/msm/dp: fix memory corruption
 with too many bridges
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Douglas Anderson
 <dianders@chromium.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Rob Clark" <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220913085320.8577-1-johan+linaro@kernel.org>
 <20220913085320.8577-3-johan+linaro@kernel.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20220913085320.8577-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: pU-2E6eRyuaABlIsxVu02wOy7by2xgII
X-Proofpoint-GUID: pU-2E6eRyuaABlIsxVu02wOy7by2xgII
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-22_14,2022-09-22_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209220129
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
Cc: Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Steev Klimaszewski <steev@kali.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 stable@vger.kernel.org, freedreno@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/13/2022 1:53 AM, Johan Hovold wrote:
> Add the missing sanity check on the bridge counter to avoid corrupting
> data beyond the fixed-sized bridge array in case there are ever more
> than eight bridges.
>
> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
> Cc: stable@vger.kernel.org	# 5.17
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 3e284fed8d30..fbe950edaefe 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1604,6 +1604,12 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   		return -EINVAL;
>   
>   	priv = dev->dev_private;
> +
> +	if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
> +		DRM_DEV_ERROR(dev->dev, "too many bridges\n");
> +		return -ENOSPC;
> +	}
> +
>   	dp_display->drm_dev = dev;
>   
>   	dp_priv = container_of(dp_display, struct dp_display_private, dp_display);
