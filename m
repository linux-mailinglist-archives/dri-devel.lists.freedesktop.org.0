Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6648D78F3EB
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 22:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630AE10E6DE;
	Thu, 31 Aug 2023 20:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD35B10E6D7;
 Thu, 31 Aug 2023 20:27:27 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37VKG0gX023003; Thu, 31 Aug 2023 20:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=yw8e1V8u2464ibmRn7uh1/kPRu9TFVtGLSd6q46WCKk=;
 b=lQCe33NWjNDhm5OBkZ9XiwDKfB/85nC+i2FU/EiIJBQ8o4Q/3BAfFrvKS8fTvMgNn7Gv
 zOiNmIbbocPlJLr+6ICD8nKrCmcwmgsvT5tc+5+RTqia1aXt/tVC/ZqTet6//fGDSD47
 PVUNdCiBXDtjPjomOlzNcB1FKD6Lb/dNRESmt0JSKgY5BVscYD4Y7AXv3qhoKrtYHxyo
 UXubUOnvRGc2hLonVzhaWR+ux/sm2N8/ajm6gyP3d6I9fIKGvQ4w/JcQUKhQ4PxFiUOT
 dta9lgT7Sv3570mw8GbXgK6CY7dQedFAW+KVrVr/WTUVcKUmTa+pkvWv5/obvH9zvJyH ng== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3st4p3ky1g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Aug 2023 20:27:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37VKRNwX005403
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Aug 2023 20:27:23 GMT
Received: from [10.71.108.94] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 31 Aug
 2023 13:27:22 -0700
Message-ID: <de6855ec-0122-034b-1b9a-7478681b4209@quicinc.com>
Date: Thu, 31 Aug 2023 13:27:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/7] drm/msm/dp: Replace open-coded drm_dp_read_dpcd_caps()
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20230829184735.2841739-1-swboyd@chromium.org>
 <20230829184735.2841739-2-swboyd@chromium.org>
Content-Language: en-US
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20230829184735.2841739-2-swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: UYkR2o3wmCOFfhGoLL0sfbyYjXkWrqd2
X-Proofpoint-GUID: UYkR2o3wmCOFfhGoLL0sfbyYjXkWrqd2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-31_17,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 mlxscore=0 clxscore=1011 suspectscore=0 mlxlogscore=902
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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
> This function duplicates the common function drm_dp_read_dpcd_caps().
> The array of DPCD registers filled in is one size larger than the
> function takes, but from what I can tell that extra byte was never used.
> Resize the array and use the common function to reduce the code here.
>
> Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_panel.c | 42 ++++---------------------------
>   drivers/gpu/drm/msm/dp/dp_panel.h |  4 +--
>   2 files changed, 6 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 42d52510ffd4..09d4f6c38ef8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -48,47 +48,15 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
>   	ssize_t rlen;
>   	struct dp_panel_private *panel;
>   	struct dp_link_info *link_info;
> -	u8 *dpcd, major = 0, minor = 0, temp;
> -	u32 offset = DP_DPCD_REV;
> +	u8 *dpcd, major, minor;
>   
> +	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
>   	dpcd = dp_panel->dpcd;
> +	rc = drm_dp_read_dpcd_caps(panel->aux, dpcd);
> +	if (rc)
> +		return rc;
>   
> -	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
>   	link_info = &dp_panel->link_info;
> -
> -	rlen = drm_dp_dpcd_read(panel->aux, offset,
> -			dpcd, (DP_RECEIVER_CAP_SIZE + 1));
> -	if (rlen < (DP_RECEIVER_CAP_SIZE + 1)) {
> -		DRM_ERROR("dpcd read failed, rlen=%zd\n", rlen);
> -		if (rlen == -ETIMEDOUT)
> -			rc = rlen;
> -		else
> -			rc = -EINVAL;
> -
> -		goto end;
> -	}
> -
> -	temp = dpcd[DP_TRAINING_AUX_RD_INTERVAL];
> -
> -	/* check for EXTENDED_RECEIVER_CAPABILITY_FIELD_PRESENT */
> -	if (temp & BIT(7)) {
> -		drm_dbg_dp(panel->drm_dev,
> -				"using EXTENDED_RECEIVER_CAPABILITY_FIELD\n");
> -		offset = DPRX_EXTENDED_DPCD_FIELD;
> -	}
> -
> -	rlen = drm_dp_dpcd_read(panel->aux, offset,
> -		dpcd, (DP_RECEIVER_CAP_SIZE + 1));
> -	if (rlen < (DP_RECEIVER_CAP_SIZE + 1)) {
> -		DRM_ERROR("dpcd read failed, rlen=%zd\n", rlen);
> -		if (rlen == -ETIMEDOUT)
> -			rc = rlen;
> -		else
> -			rc = -EINVAL;
> -
> -		goto end;
> -	}
> -
>   	link_info->revision = dpcd[DP_DPCD_REV];
>   	major = (link_info->revision >> 4) & 0x0f;
>   	minor = link_info->revision & 0x0f;
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index ed1030e17e1b..6d733480a62d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -13,8 +13,6 @@
>   
>   struct edid;
>   
> -#define DPRX_EXTENDED_DPCD_FIELD	0x2200
> -
>   #define DP_DOWNSTREAM_PORTS		4
>   #define DP_DOWNSTREAM_CAP_SIZE		4
>   
> @@ -40,7 +38,7 @@ struct dp_panel_psr {
>   
>   struct dp_panel {
>   	/* dpcd raw data */
> -	u8 dpcd[DP_RECEIVER_CAP_SIZE + 1];
> +	u8 dpcd[DP_RECEIVER_CAP_SIZE];
>   	u8 ds_cap_info[DP_DOWNSTREAM_PORTS * DP_DOWNSTREAM_CAP_SIZE];
>   	u32 ds_port_cnt;
>   	u32 dfp_present;
