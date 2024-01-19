Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 962EA833024
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 22:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A559B10EA75;
	Fri, 19 Jan 2024 21:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E58410EA6F;
 Fri, 19 Jan 2024 21:14:35 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40JKWD0f015662; Fri, 19 Jan 2024 21:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=fvgTxVkd+Z5XZe4ztJT64BSinsdPYrbSQr8zLxqqp/U=; b=JA
 ST1eFucviZwPVZp/O6NUhPw83871G1zfjenBaqOE9MThgNeadIih3yiwyFgn+hxK
 bBONCtVoDJdStLxc3RdGgAl3sT6n1YrdgYUmZQOoz9fJQf73FIRkIJY8rnudGD4I
 F7/RbzoZ5rjfCh0i3/1O173Fwa8BaFK94XRQ/7y8Yb6CVNH/BzcPm9dsRcFdMsg+
 1y0kT6BZe7YiudFgHhNKiqfKe5Am3AUvd6PUeRt5DafwvwA5oSgVZK202W8bpqoa
 e5UMmEz9imP5wWPQbkLKbBLzT1fDDPvBpH3vgxOa3AKmGJSpRMYsJCnte//jL6mE
 ttLf59SiEk4t7iQKK8VQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vqh2k9yk8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jan 2024 21:14:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40JLEKlF002914
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jan 2024 21:14:20 GMT
Received: from [10.110.79.9] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 19 Jan
 2024 13:14:19 -0800
Message-ID: <b5f571c6-dcf6-c416-ca86-fdbd0514676b@quicinc.com>
Date: Fri, 19 Jan 2024 13:14:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 13/14] drm/msm/dp: move next_bridge handling to dp_display
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
References: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
 <20231229225650.912751-14-dmitry.baryshkov@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20231229225650.912751-14-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ebDywD6xpQtIxcUFQjz-zBZhVgy458IN
X-Proofpoint-ORIG-GUID: ebDywD6xpQtIxcUFQjz-zBZhVgy458IN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_12,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 clxscore=1011 impostorscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401190128
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dmitry,

I am testing this patch serial with msm-next branch.

This patch cause system crash during booting up for me.

Is this patch work for you?

On 12/29/2023 2:56 PM, Dmitry Baryshkov wrote:
> Remove two levels of indirection and fetch next bridge directly in
> dp_display_probe_tail().
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 42 +++++++++--------------------
>   drivers/gpu/drm/msm/dp/dp_parser.c  | 14 ----------
>   drivers/gpu/drm/msm/dp/dp_parser.h  | 14 ----------
>   3 files changed, 13 insertions(+), 57 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 4de0857c31ce..923df47efcc9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1195,16 +1195,24 @@ static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pde
>   	return NULL;
>   }
>   
> -static int dp_display_get_next_bridge(struct msm_dp *dp);
> -
>   static int dp_display_probe_tail(struct device *dev)
>   {
>   	struct msm_dp *dp = dev_get_drvdata(dev);
>   	int ret;
>   
> -	ret = dp_display_get_next_bridge(dp);
> -	if (ret)
> -		return ret;
> +	/*
> +	 * External bridges are mandatory for eDP interfaces: one has to
> +	 * provide at least an eDP panel (which gets wrapped into panel-bridge).
> +	 *
> +	 * For DisplayPort interfaces external bridges are optional, so
> +	 * silently ignore an error if one is not present (-ENODEV).
> +	 */
> +	dp->next_bridge = devm_drm_of_get_bridge(&dp->pdev->dev, dp->pdev->dev.of_node, 1, 0);
> +	if (IS_ERR(dp->next_bridge)) {
> +		ret = PTR_ERR(dp->next_bridge);
> +		if (dp->is_edp || ret != -ENODEV)
> +			return ret;
> +	}
>   
>   	ret = component_add(dev, &dp_display_comp_ops);
>   	if (ret)
> @@ -1397,30 +1405,6 @@ void dp_display_debugfs_init(struct msm_dp *dp_display, struct dentry *root, boo
>   	}
>   }
>   
> -static int dp_display_get_next_bridge(struct msm_dp *dp)
> -{
> -	int rc;
> -	struct dp_display_private *dp_priv;
> -
> -	dp_priv = container_of(dp, struct dp_display_private, dp_display);
> -
> -	/*
> -	 * External bridges are mandatory for eDP interfaces: one has to
> -	 * provide at least an eDP panel (which gets wrapped into panel-bridge).
> -	 *
> -	 * For DisplayPort interfaces external bridges are optional, so
> -	 * silently ignore an error if one is not present (-ENODEV).
> -	 */
> -	rc = devm_dp_parser_find_next_bridge(&dp->pdev->dev, dp_priv->parser);
> -	if (!dp->is_edp && rc == -ENODEV)
> -		return 0;
> -
> -	if (!rc)
> -		dp->next_bridge = dp_priv->parser->next_bridge;
> -
> -	return rc;
> -}
> -
>   int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   			struct drm_encoder *encoder)
>   {
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index aa135d5cedbd..f95ab3c5c72c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -24,20 +24,6 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
>   	return 0;
>   }
>   
> -int devm_dp_parser_find_next_bridge(struct device *dev, struct dp_parser *parser)
> -{
> -	struct platform_device *pdev = parser->pdev;
> -	struct drm_bridge *bridge;
> -
> -	bridge = devm_drm_of_get_bridge(dev, pdev->dev.of_node, 1, 0);
> -	if (IS_ERR(bridge))
> -		return PTR_ERR(bridge);
> -
> -	parser->next_bridge = bridge;
> -
> -	return 0;
> -}
> -
>   static int dp_parser_parse(struct dp_parser *parser)
>   {
>   	int rc = 0;
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index bc56e0e8c446..2b39b1c394ae 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -22,7 +22,6 @@
>   struct dp_parser {
>   	struct platform_device *pdev;
>   	struct phy *phy;
> -	struct drm_bridge *next_bridge;
>   };
>   
>   /**
> @@ -38,17 +37,4 @@ struct dp_parser {
>    */
>   struct dp_parser *dp_parser_get(struct platform_device *pdev);
>   
> -/**
> - * devm_dp_parser_find_next_bridge() - find an additional bridge to DP
> - *
> - * @dev: device to tie bridge lifetime to
> - * @parser: dp_parser data from client
> - *
> - * This function is used to find any additional bridge attached to
> - * the DP controller. The eDP interface requires a panel bridge.
> - *
> - * Return: 0 if able to get the bridge, otherwise negative errno for failure.
> - */
> -int devm_dp_parser_find_next_bridge(struct device *dev, struct dp_parser *parser);
> -
>   #endif
