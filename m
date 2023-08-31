Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D48078F3F7
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 22:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA10110E6E2;
	Thu, 31 Aug 2023 20:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E53C10E6E1;
 Thu, 31 Aug 2023 20:29:38 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37VJ6RGV025940; Thu, 31 Aug 2023 20:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=E3rJXvML2k8v6wMqCuNjOBAaLHx8ZfP6NfxRNqr87JY=;
 b=MiX+yBZNeKUB5Yhq2TvXeAfEhrepqM9czB2ZNV6GvsFdbf0AzvSPQNUxGq9aPOAmPuNy
 7odxn+gdqyDb1ktdDOI5Ln5W++IPrjZuuIP8eD8mbtavggC1YV5+lv254fOo0buvxUfB
 LoD7olzoWeiajrGwPNvi0Vx4QQSXjyErsXwBwwgptoG0Fd9ZMLyvH6DAhmxzs9eXyugK
 WrfuEdB0rqEnqhYOGyasmGCcAbDWqC2BnnVtceUsKH7DxuVTrli7S0UNeLo5zRfs98+G
 6m11mbyhewAQO5Lqs1Vr1Ya4zQGC6Nz/q6Mb4VrxiqjJctHX7UhEiWM7z5zBcxbHMrka wQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3stj37ahmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Aug 2023 20:29:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37VKTR8H007202
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Aug 2023 20:29:27 GMT
Received: from [10.71.108.94] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 31 Aug
 2023 13:29:26 -0700
Message-ID: <18c05ac4-ade1-990f-1ea3-2bd437b1e428@quicinc.com>
Date: Thu, 31 Aug 2023 13:29:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 6/7] drm/msm/dp: Inline dp_link_parse_sink_count()
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20230829184735.2841739-1-swboyd@chromium.org>
 <20230829184735.2841739-7-swboyd@chromium.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20230829184735.2841739-7-swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: lE5jQdUBkWXFD8TED1u9FCw4GGj3c5ol
X-Proofpoint-ORIG-GUID: lE5jQdUBkWXFD8TED1u9FCw4GGj3c5ol
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-31_18,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308310183
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
> The function dp_link_parse_sink_count() is really just
> drm_dp_read_sink_count(). It debug prints out the bit for content
> protection (DP_SINK_CP_READY), but that is not useful beyond debug
> because 'link->dp_link.sink_count' is overwritten to only contain the
> sink_count in this same function. Just use drm_dp_read_sink_count() in
> the one place this function is called to simplify.
>
> Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_link.c | 38 +++-----------------------------
>   1 file changed, 3 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index 42427129acea..94a37914a47f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -712,49 +712,17 @@ static int dp_link_parse_request(struct dp_link_private *link)
>   	return ret;
>   }
>   
> -/**
> - * dp_link_parse_sink_count() - parses the sink count
> - * @dp_link: pointer to link module data
> - *
> - * Parses the DPCD to check if there is an update to the sink count
> - * (Byte 0x200), and whether all the sink devices connected have Content
> - * Protection enabled.
> - */
> -static int dp_link_parse_sink_count(struct dp_link *dp_link)
> -{
> -	ssize_t rlen;
> -	bool cp_ready;
> -
> -	struct dp_link_private *link = container_of(dp_link,
> -			struct dp_link_private, dp_link);
> -
> -	rlen = drm_dp_dpcd_readb(link->aux, DP_SINK_COUNT,
> -				 &link->dp_link.sink_count);
> -	if (rlen < 0) {
> -		DRM_ERROR("sink count read failed. rlen=%zd\n", rlen);
> -		return rlen;
> -	}
> -
> -	cp_ready = link->dp_link.sink_count & DP_SINK_CP_READY;
> -
> -	link->dp_link.sink_count =
> -		DP_GET_SINK_COUNT(link->dp_link.sink_count);
> -
> -	drm_dbg_dp(link->drm_dev, "sink_count = 0x%x, cp_ready = 0x%x\n",
> -				link->dp_link.sink_count, cp_ready);
> -	return 0;
> -}
> -
>   static int dp_link_parse_sink_status_field(struct dp_link_private *link)
>   {
> -	int len = 0;
> +	int len;
>   
>   	link->prev_sink_count = link->dp_link.sink_count;
> -	len = dp_link_parse_sink_count(&link->dp_link);
> +	len = drm_dp_read_sink_count(link->aux);
>   	if (len < 0) {
>   		DRM_ERROR("DP parse sink count failed\n");
>   		return len;
>   	}
> +	link->dp_link.sink_count = len;
>   
>   	len = drm_dp_dpcd_read_link_status(link->aux,
>   		link->link_status);
