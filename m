Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 665C987B2FC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 21:42:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C1110EFB6;
	Wed, 13 Mar 2024 20:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="WcINpUrh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2CD10EFB6;
 Wed, 13 Mar 2024 20:42:01 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42DKY4Wn029229; Wed, 13 Mar 2024 20:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=jGDGyPpCYBzr/XWv3ffRnHbJkeG0JATe4aKM18IYXF8=; b=Wc
 INpUrhi/9QixN9atA58u/nHIFyNcgX+bEvZbVEAU2MiLMK+8xKphfjUIioruECdk
 dyVnzQaQSleS481Ns3mfbF5W16BhQF6dcl+g5jVSQDpbkpmkqVQm6YAD6o4IHA3R
 CjfWTScHe2Rq5cRI3vONE+rBvMF9Znwn8wVnE4rH6ZQVEEeNYT2WosA0wsA6v/1M
 3YT7hHTz05Dc+MUSIc7+TUgA112cVRty6fPkPfjrAcIS6KutJBbzZoWUdW5+xDG7
 E2+ZKq0AApseA21pkEQkQHD2Oa5wbzdD/Vuntyzmxz9g256P3vm6OLQ68bo89d03
 Q/hucLfUV8AXonv17qAQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wuc1m96u8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Mar 2024 20:41:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42DKfMoh007691
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Mar 2024 20:41:22 GMT
Received: from [10.110.70.168] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Mar
 2024 13:41:18 -0700
Message-ID: <d6ac0328-3d3d-75bc-09b9-ed0190a6a8c5@quicinc.com>
Date: Wed, 13 Mar 2024 13:41:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] drm/msm/dp: Avoid a long timeout for AUX transfer if
 nothing connected
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Guenter Roeck <groeck@chromium.org>,
 "Kuogee Hsieh" <quic_khsieh@quicinc.com>, Marijn Suijten
 <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>, Tanmay Shah
 <tanmay@codeaurora.org>, Vinod Polimera <quic_vpolimer@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240313001345.2623074-1-dianders@chromium.org>
 <20240312171305.1.I16aff881c9fe82b5e0fc06ca312da017aa7b5b3e@changeid>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240312171305.1.I16aff881c9fe82b5e0fc06ca312da017aa7b5b3e@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: cGfVRyVlxK486AZoWFi746EbC71fHezU
X-Proofpoint-GUID: cGfVRyVlxK486AZoWFi746EbC71fHezU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_09,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 clxscore=1011
 adultscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403130159
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



On 3/12/2024 5:13 PM, Douglas Anderson wrote:
> As documented in the description of the transfer() function of
> "struct drm_dp_aux", the transfer() function can be called at any time
> regardless of the state of the DP port. Specifically if the kernel has
> the DP AUX character device enabled and userspace accesses
> "/dev/drm_dp_auxN" directly then the AUX transfer function will be
> called regardless of whether a DP device is connected.
> 

I do see

"
* Also note that this callback can be called no matter the
* state @dev is in and also no matter what state the panel is
* in. It's expected:
"

I understand about the host state that we need to allow the transfers by 
powering on if the host was off.

But I wonder why we should allow the transfer if the sink is not 
connected because it will anyway timeout.

Does it make sense to have get_hpd_status() from the aux dev and not 
issue the transfers if the sink was not connected?

This is more of questioning the intent of drm_dp_helpers to allow 
transfers without checking the sink status.

> For eDP panels we have a special rule where we wait (with a 5 second
> timeout) for HPD to go high. This rule was important before all panels
> drivers were converted to call wait_hpd_asserted() and actually can be
> removed in a future commit.
> 
> For external DP devices we never checked for HPD. That means that
> trying to access the DP AUX character device (AKA `hexdump -C
> /dev/drm_dp_auxN`) would very, very slowly timeout. Specifically on my
> system:
>    $ time hexdump -C /dev/drm_dp_aux0
>    hexdump: /dev/drm_dp_aux0: Connection timed out
> 
>    real    0m8.200s
> 

IIUC, we want to timeout faster by not bailing out if not connected right?


> Let's add a check for HPD to avoid the slow timeout. This matches
> what, for instance, the intel_dp_aux_xfer() function does when it
> calls intel_tc_port_connected_locked(). That call has a document by it
> explaining that it's important to avoid the long timeouts.
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>   drivers/gpu/drm/msm/dp/dp_aux.c     |  8 +++++++-
>   drivers/gpu/drm/msm/dp/dp_catalog.c | 10 ++++++++++
>   drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
>   3 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 03f4951c49f4..de0b0eabced9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -307,7 +307,8 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>   	 * turned on the panel and then tried to do an AUX transfer. The panel
>   	 * driver has no way of knowing when the panel is ready, so it's up
>   	 * to us to wait. For DP we never get into this situation so let's
> -	 * avoid ever doing the extra long wait for DP.
> +	 * avoid ever doing the extra long wait for DP and just query HPD
> +	 * directly.
>   	 */
>   	if (aux->is_edp) {
>   		ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
> @@ -315,6 +316,11 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>   			DRM_DEBUG_DP("Panel not ready for aux transactions\n");
>   			goto exit;
>   		}
> +	} else {
> +		if (!dp_catalog_aux_is_hpd_connected(aux->catalog)) {
> +			ret = -ENXIO;
> +			goto exit;
> +		}
>   	}
>   
>   	dp_aux_update_offset_and_segment(aux, msg);
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 5142aeb705a4..93e2d413a1e7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -266,6 +266,16 @@ int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog)
>   				2000, 500000);
>   }
>   
> +bool dp_catalog_aux_is_hpd_connected(struct dp_catalog *dp_catalog)
> +{
> +	struct dp_catalog_private *catalog = container_of(dp_catalog,
> +				struct dp_catalog_private, dp_catalog);
> +
> +	/* poll for hpd connected status every 2ms and timeout after 500ms */
> +	return readl(catalog->io->dp_controller.aux.base + REG_DP_DP_HPD_INT_STATUS) &
> +	       DP_DP_HPD_STATE_STATUS_CONNECTED;
> +}

This method of checking HPD status works for devices which use internal 
HPD block to control the HPD (like sc7180/sc7280) but not for devices 
where HPD is controlled outside the MSM DP controller like sc8280xp, 
sc835-/sm8450 etc etc which use pmic_glink and DP driver only receives 
the hpd status using the dp_bridge_hpd_notify() callback.

If we want to make this generic, we have to do something like:

dp_hpd_unplug_handle() notifies the dp_aux.c module that status is 
disconncted and we should bail out

dp_hpd_plug_handle() notifies dp_aux.c module that status is connected 
again and we allow the aux transfers.

> +
>   static void dump_regs(void __iomem *base, int len)
>   {
>   	int i;
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 38786e855b51..1694040c530f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -86,6 +86,7 @@ void dp_catalog_aux_reset(struct dp_catalog *dp_catalog);
>   void dp_catalog_aux_enable(struct dp_catalog *dp_catalog, bool enable);
>   void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog);
>   int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog);
> +bool dp_catalog_aux_is_hpd_connected(struct dp_catalog *dp_catalog);
>   u32 dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog);
>   
>   /* DP Controller APIs */
