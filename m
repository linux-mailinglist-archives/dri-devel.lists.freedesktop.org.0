Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AC69159DF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 00:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0DF10E031;
	Mon, 24 Jun 2024 22:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="jIOnvVIY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17AFF10E031;
 Mon, 24 Jun 2024 22:28:53 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45OIfuJU031942;
 Mon, 24 Jun 2024 22:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qQGNPMjXxj/37KqwhG1qLhggf6rNJ+AAGcm+KDdlV4Q=; b=jIOnvVIYtn7X4612
 phzE/Qo802Riq4WQQPNtrsqVpeJ6SfCU9ZZwL5ZWvgndFImhaqYKB2O8lDsJGFUq
 FUPkkD3+Z13I6tNhSD86bikfgE8g7TqaGHErCfUF1Vgsne9YnyHCM449rDz+GwAI
 G0e0m1kPkZFyVxVM4cjoM2M+KjRXa3a40MPaRBKeEaErCDipG1o71RY/shbn0gEI
 69sYiyu7J/JdgVaogF5TNSIqNqOqvQu9oBBdhvlYPPpOmgsG/OeS3lxMTxPlO0zv
 OoQUXFixUvUuQ+NVsZROSQFGSNqQloCmKMPhh3yV6bTSYUGOBhKAdOyAXxy9qKtf
 jppqUQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywppv4s7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jun 2024 22:28:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45OMSdb2022764
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jun 2024 22:28:39 GMT
Received: from [10.110.106.13] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Jun
 2024 15:28:38 -0700
Message-ID: <45c25e4b-d64d-549f-6711-7b753d24e2f9@quicinc.com>
Date: Mon, 24 Jun 2024 15:28:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] drm/bridge-connector: reset the HDMI connector
 state
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
CC: Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240623-drm-bridge-connector-fix-hdmi-reset-v2-0-8590d44912ce@linaro.org>
 <20240623-drm-bridge-connector-fix-hdmi-reset-v2-1-8590d44912ce@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240623-drm-bridge-connector-fix-hdmi-reset-v2-1-8590d44912ce@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Igwf34iY7-uHXXA9X1Wot4KaNxhQCbk3
X-Proofpoint-ORIG-GUID: Igwf34iY7-uHXXA9X1Wot4KaNxhQCbk3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_19,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 mlxlogscore=999 mlxscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406240180
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



On 6/22/2024 10:40 PM, Dmitry Baryshkov wrote:
> On HDMI connectors which use drm_bridge_connector and DRM_BRIDGE_OP_HDMI
> IGT chokes on the max_bpc property in several kms_properties tests due
> to the the drm_bridge_connector failing to reset HDMI-related
> properties.
> 
> Call __drm_atomic_helper_connector_hdmi_reset() if there is a
> the drm_bridge_connector has bridge_hdmi.
> 
> Note, the __drm_atomic_helper_connector_hdmi_reset() is moved to
> drm_atomic_state_helper.c because drm_bridge_connector.c can not depend
> on DRM_DISPLAY_HDMI_STATE_HELPER. At the same time it is impossible to
> call this function from HDMI bridges, there is is no function that
> corresponds to the drm_connector_funcs::reset().
> 
> Fixes: 6b4468b0c6ba ("drm/bridge-connector: implement glue code for HDMI connector")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/display/drm_hdmi_state_helper.c | 21 ---------------------
>   drivers/gpu/drm/drm_atomic_state_helper.c       | 21 +++++++++++++++++++++
>   drivers/gpu/drm/drm_bridge_connector.c          | 13 ++++++++++++-
>   include/drm/display/drm_hdmi_state_helper.h     |  3 ---
>   include/drm/drm_atomic_state_helper.h           |  2 ++
>   5 files changed, 35 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> index 2dab3ad8ce64..67f39857b0b4 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -8,27 +8,6 @@
>   #include <drm/display/drm_hdmi_helper.h>
>   #include <drm/display/drm_hdmi_state_helper.h>
>   
> -/**
> - * __drm_atomic_helper_connector_hdmi_reset() - Initializes all HDMI @drm_connector_state resources
> - * @connector: DRM connector
> - * @new_conn_state: connector state to reset
> - *
> - * Initializes all HDMI resources from a @drm_connector_state without
> - * actually allocating it. This is useful for HDMI drivers, in
> - * combination with __drm_atomic_helper_connector_reset() or
> - * drm_atomic_helper_connector_reset().
> - */
> -void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
> -					      struct drm_connector_state *new_conn_state)
> -{
> -	unsigned int max_bpc = connector->max_bpc;
> -
> -	new_conn_state->max_bpc = max_bpc;
> -	new_conn_state->max_requested_bpc = max_bpc;
> -	new_conn_state->hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
> -}
> -EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
> -
>   static const struct drm_display_mode *
>   connector_state_get_mode(const struct drm_connector_state *conn_state)
>   {
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 519228eb1095..1518ada81b45 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -478,6 +478,27 @@ void drm_atomic_helper_connector_reset(struct drm_connector *connector)
>   }
>   EXPORT_SYMBOL(drm_atomic_helper_connector_reset);
>   
> +/**
> + * __drm_atomic_helper_connector_hdmi_reset() - Initializes all HDMI @drm_connector_state resources
> + * @connector: DRM connector
> + * @new_conn_state: connector state to reset
> + *
> + * Initializes all HDMI resources from a @drm_connector_state without
> + * actually allocating it. This is useful for HDMI drivers, in
> + * combination with __drm_atomic_helper_connector_reset() or
> + * drm_atomic_helper_connector_reset().
> + */
> +void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
> +					      struct drm_connector_state *new_conn_state)
> +{
> +	unsigned int max_bpc = connector->max_bpc;
> +
> +	new_conn_state->max_bpc = max_bpc;
> +	new_conn_state->max_requested_bpc = max_bpc;

I understand this is just code propagation but do we need a max_bpc 
local variable?

We can just do

new_conn_state->max_bpc = connector->max_bpc;
new_conn_state->max_requested_bpc = connector->max_bpc;

But apart from that nit, this LGTM.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
