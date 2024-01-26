Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B58983E527
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 23:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B26810FF42;
	Fri, 26 Jan 2024 22:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B96610FF40;
 Fri, 26 Jan 2024 22:19:53 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40QLZ2tJ012653; Fri, 26 Jan 2024 22:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=ReOgMzSAJJLVYBzHVGwZo9ygciS6OjYZll3/JunpGU8=; b=dU
 fuz6O4bSEdpEEsU6pnijpn9AuTd/Po6PrZ26pZBcYd5H4XTKxZVAAlZp5ddMw/JN
 ZhffQ9Z3my3tN8YzIeSGG0qOjIPkNxsZTo9pDauvJbrfw7Abw28YSLvR52yDvh+P
 JpnhGWQm8F6TxOplhj+xdo2ZKSx3XQu+LfWyAsSAdXqxnc5u7wLNCEeIOuEKg81h
 YLVi0eRTmoa4cg0vhOXFyNI1nvevUZ8kDXVS5vFXbXqb3c9cS/4ev5q9bLdfDhrK
 mFfZev3b6UkGN6qb6/xxbd5JT28537r8fdDuf2u4UuN1YQZUmBx6PrW1Wl+Frs3w
 0Ku09yr8uAvcSFRV+Hqg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvgy8gj2d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 22:19:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QMJk2v001394
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 22:19:46 GMT
Received: from [10.110.48.234] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 14:19:45 -0800
Message-ID: <2ee64275-6cb9-a969-8d28-f2b36481da6e@quicinc.com>
Date: Fri, 26 Jan 2024 14:19:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND v3 03/15] drm/msm/dp: parse DT from dp_parser_get
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd
 <swboyd@chromium.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
 <20240126-dp-power-parser-cleanup-v3-3-098d5f581dd3@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-3-098d5f581dd3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: urLB6pBTfKIWy_oi5j3e1RcbCG8eW0s6
X-Proofpoint-ORIG-GUID: urLB6pBTfKIWy_oi5j3e1RcbCG8eW0s6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 mlxscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401260163
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/26/2024 10:26 AM, Dmitry Baryshkov wrote:
> It makes little sense to split the submodule get and actual DT parsing.
> Call dp_parser_parse() directly from dp_parser_get(), so that the parser
> data is fully initialised once it is returned to the caller.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 6 ------
>   drivers/gpu/drm/msm/dp/dp_parser.c  | 8 +++++++-
>   drivers/gpu/drm/msm/dp/dp_parser.h  | 3 ---
>   3 files changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d37d599aec27..67b48f0a6c83 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1266,12 +1266,6 @@ static int dp_display_probe(struct platform_device *pdev)
>   		return -EPROBE_DEFER;
>   	}
>   
> -	rc = dp->parser->parse(dp->parser);
> -	if (rc) {
> -		DRM_ERROR("device tree parsing failed\n");
> -		goto err;
> -	}
> -
>   	rc = dp_power_client_init(dp->power);
>   	if (rc) {
>   		DRM_ERROR("Power client create failed\n");
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index 7032dcc8842b..2d9d126c119b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -315,13 +315,19 @@ static int dp_parser_parse(struct dp_parser *parser)
>   struct dp_parser *dp_parser_get(struct platform_device *pdev)
>   {
>   	struct dp_parser *parser;
> +	int ret;
>   
>   	parser = devm_kzalloc(&pdev->dev, sizeof(*parser), GFP_KERNEL);
>   	if (!parser)
>   		return ERR_PTR(-ENOMEM);
>   
> -	parser->parse = dp_parser_parse;
>   	parser->pdev = pdev;
>   
> +	ret = dp_parser_parse(parser);
> +	if (ret) {
> +		dev_err(&pdev->dev, "device tree parsing failed\n");
> +		return ERR_PTR(ret);
> +	}
> +
>   	return parser;
>   }
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index 90a2cdbbe344..4ccc432b4142 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -67,7 +67,6 @@ struct dss_module_power {
>    *
>    * @pdev: platform data of the client
>    * @mp: gpio, regulator and clock related data
> - * @parse: function to be called by client to parse device tree.
>    */
>   struct dp_parser {
>   	struct platform_device *pdev;
> @@ -76,8 +75,6 @@ struct dp_parser {
>   	u32 max_dp_lanes;
>   	u32 max_dp_link_rate;
>   	struct drm_bridge *next_bridge;
> -
> -	int (*parse)(struct dp_parser *parser);
>   };
>   
>   /**
>
