Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EFF78F3EE
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 22:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248F010E6E0;
	Thu, 31 Aug 2023 20:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4088910E6DF;
 Thu, 31 Aug 2023 20:27:48 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37VIS0Ik003416; Thu, 31 Aug 2023 20:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=GXP+jhDXKMAqaOUKZaiBZKFzcVa0yWIXo30l4H9YS2Q=;
 b=hrQEbngyjUlNuFxLzCm1i+Uiq5COJy5rd7LvlklQIZhsk49kL9NAnutXcZgMUeN0Nugh
 alrSN64CHaGbSPHJQEAHv75nGk7ZLszogAcaN8Z8Yt5yiR+ihE8U2A76rn6pbVP/6vmv
 W7mOdC8pxPh3+AyVVuPrI34YV2942AU7C3u5Kg2Mjx53yHlxdmh22pnbiS7IeIKBGEte
 kMoYeotGxpXNrBxPoWiuRemZkyYgmdRbUNgMl3v6DcwrJQecBQ+up6Fp2MwPzeFldo4e
 1M4dMNFAgldsXSjma6o2kjMM1hd7dtDu+AIY/3NwB9p5W80R1dFLstQnggRWY5ttXg9k Dw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3str1nhrk9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Aug 2023 20:27:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37VKRjaY005495
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Aug 2023 20:27:45 GMT
Received: from [10.71.108.94] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 31 Aug
 2023 13:27:44 -0700
Message-ID: <90060999-a010-4cb2-cf64-5cc79aaee934@quicinc.com>
Date: Thu, 31 Aug 2023 13:27:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/7] drm/msm/dp: Use drm_dp_read_sink_count() helper
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20230829184735.2841739-1-swboyd@chromium.org>
 <20230829184735.2841739-3-swboyd@chromium.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20230829184735.2841739-3-swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: HDuwVVshUE6n56KuBqSqmzJkZVWV6n2B
X-Proofpoint-ORIG-GUID: HDuwVVshUE6n56KuBqSqmzJkZVWV6n2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-31_17,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308310181
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 patches@lists.linux.dev, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/29/2023 11:47 AM, Stephen Boyd wrote:
> Use the common function drm_dp_read_sink_count() instead of open-coding
> it. This shrinks the kernel text a tiny bit.
>
> Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_panel.c | 19 +++++++------------
>   1 file changed, 7 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 09d4f6c38ef8..a0523b18b9e9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -147,8 +147,8 @@ static int dp_panel_update_modes(struct drm_connector *connector,
>   int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>   	struct drm_connector *connector)
>   {
> -	int rc = 0, bw_code;
> -	int rlen, count;
> +	int rc, bw_code;
> +	int count;
>   	struct dp_panel_private *panel;
>   
>   	if (!dp_panel || !connector) {
> @@ -174,16 +174,11 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>   	}
>   
>   	if (dp_panel->dfp_present) {
> -		rlen = drm_dp_dpcd_read(panel->aux, DP_SINK_COUNT,
> -				&count, 1);
> -		if (rlen == 1) {
> -			count = DP_GET_SINK_COUNT(count);
> -			if (!count) {
> -				DRM_ERROR("no downstream ports connected\n");
> -				panel->link->sink_count = 0;
> -				rc = -ENOTCONN;
> -				goto end;
> -			}
> +		count = drm_dp_read_sink_count(panel->aux);
> +		if (!count) {
> +			DRM_ERROR("no downstream ports connected\n");
> +			panel->link->sink_count = 0;
> +			return -ENOTCONN;
>   		}
>   	}
>   
