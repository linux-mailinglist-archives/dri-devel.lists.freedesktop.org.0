Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC28FA2B381
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 21:43:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D28C10E946;
	Thu,  6 Feb 2025 20:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="C2oL3sCM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED8110E948;
 Thu,  6 Feb 2025 20:43:06 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516E57UU015247;
 Thu, 6 Feb 2025 20:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VOS1t+7zQCjgLpQI16tbYkeg5M4/gUoycEPmZCoPtg4=; b=C2oL3sCML5Mp372Q
 tsh2a4etcxDp6ud4iDGUoIpaB2m36EsQw193s1xh5BkfT+fPilGN9+sDQG4jRCka
 WlrlzP/YjOMJT+Lov5+E1dl9iXV6MvlrP4lcgz33FwMSVxniQnKI5whhjw6/FkJW
 /v41owjV2yNxLAskYFN/Ohd69kicAEA/VgrcWEdrcWEl5UUzTcsLjxta+11d/1K6
 N4KU8UHU3b4Wbtvbqv1BPuvlV1qqfRlcAE+gh5hXiGpauQRpSEnxKJHhxm3EYC+7
 k45OblkFROdcUBT6IUguD5WZB++uJbdRMVCjBc6PRA4qUbKVUlw1lMW3GQMvz+vw
 jBU1KQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mxhbryu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Feb 2025 20:42:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 516KgpMw009163
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 6 Feb 2025 20:42:51 GMT
Received: from [10.71.110.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Feb 2025
 12:42:07 -0800
Message-ID: <1b98265e-8766-4504-b374-f7af8203c926@quicinc.com>
Date: Thu, 6 Feb 2025 12:41:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] drm/msm/hdmi: program HDMI timings during
 atomic_pre_enable
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Simona Vetter <simona@ffwll.ch>, Simona
 Vetter <simona.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
 <20250124-bridge-hdmi-connector-v6-2-1592632327f7@linaro.org>
 <7fbfc7d5-f6bb-4f99-914a-f91bb7d153fd@quicinc.com>
 <na7jgb5leqbugi6a6xkfz3nl6mp7li4oevfevhjmo5y4v7eot6@fsmfv52u2rtz>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <na7jgb5leqbugi6a6xkfz3nl6mp7li4oevfevhjmo5y4v7eot6@fsmfv52u2rtz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: eoBIM9uswIRdOCIYAwxjd8U7b03cxVB5
X-Proofpoint-GUID: eoBIM9uswIRdOCIYAwxjd8U7b03cxVB5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_06,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502060164
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



On 2/3/2025 4:59 PM, Dmitry Baryshkov wrote:
> On Mon, Feb 03, 2025 at 11:34:00AM -0800, Abhinav Kumar wrote:
>>
>>
>> On 1/24/2025 1:47 PM, Dmitry Baryshkov wrote:
>>> The mode_set callback is deprecated, it doesn't get the
>>> drm_bridge_state, just mode-related argumetns. Also Abhinav pointed out
>>> that HDMI timings should be programmed after setting up HDMI PHY and
>>> PLL. Rework the code to program HDMI timings at the end of
>>> atomic_pre_enable().
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 23 +++++++++++++++--------
>>>    1 file changed, 15 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
>>> index d839c71091dcdc3b020fcbba8d698d58ee7fc749..d5ab1f74c0e6f47dc59872c016104e9a84d85e9e 100644
>>> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
>>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
>>> @@ -126,15 +126,26 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
>>>    	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
>>>    }
>>> +static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
>>> +					       const struct drm_display_mode *mode);
>>>    static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>>>    					      struct drm_bridge_state *old_bridge_state)
>>>    {
>>> +	struct drm_atomic_state *state = old_bridge_state->base.state;
>>>    	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
>>>    	struct hdmi *hdmi = hdmi_bridge->hdmi;
>>>    	struct hdmi_phy *phy = hdmi->phy;
>>> +	struct drm_encoder *encoder = bridge->encoder;
>>> +	struct drm_connector *connector;
>>> +	struct drm_connector_state *conn_state;
>>> +	struct drm_crtc_state *crtc_state;
>>>    	DBG("power up");
>>> +	connector = drm_atomic_get_new_connector_for_encoder(state, encoder);
>>> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
>>> +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
>>> +
>>>    	if (!hdmi->power_on) {
>>>    		msm_hdmi_phy_resource_enable(phy);
>>>    		msm_hdmi_power_on(bridge);
>>> @@ -151,6 +162,8 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>>>    	if (hdmi->hdcp_ctrl)
>>>    		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
>>> +
>>> +	msm_hdmi_bridge_atomic_set_timings(hdmi, &crtc_state->adjusted_mode);
>>>    }
>>
>> This addresses my comment about setting up the HDMI timing registers before
>> setting up the timing engine registers.
>>
>> But prior to this change, mode_set was doing the same thing as
>> msm_hdmi_bridge_atomic_set_timings() which means
>> msm_hdmi_bridge_atomic_set_timings() should be called at the beginning of
>> pre_enable()?
>>
>> The controller is enabled in msm_hdmi_set_mode(). So this should be done
>> before that.
> 
> In [1] you provided the following order:
> 
> 1) setup HDMI PHY and PLL
> 2) setup HDMI video path correctly (HDMI timing registers)
> 3) setup timing generator to match the HDMI video in (2)
> 4) Enable timing engine
> 
> This means htat msm_hdmi_bridge_atomic_set_timings() should come at the
> end of msm_hdmi_bridge_atomic_pre_enable(), not in the beginning /
> middle of it.
> 
> [1] https://lore.kernel.org/dri-devel/8dd4a43e-d83c-1f36-21ff-61e13ff751e7@quicinc.com/
> 

Sequence given is correct and is exactly what is given in the docs. What 
is somewhat not clear in the docs is the location of the enable of the 
HDMI controller. This is not there in the above 4 steps. I am referring 
to the enable bit being programmed in msm_hdmi_set_mode(). Ideally till 
we enable the timing engine, it should be okay but what I wanted to do 
was to keep the msm_hdmi_set_mode() as the last call in this function 
that way we program everything and then enable the controller.

This can be done in either way, move it to the beginning of the function 
or move it right before msm_hdmi_set_mode(). I had suggested beginning 
because thats how it was when things were still in mode_set.



> 
>>
>>>    static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
>>> @@ -177,17 +190,12 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
>>>    	}
>>>    }
>>> -static void msm_hdmi_bridge_mode_set(struct drm_bridge *bridge,
>>> -		 const struct drm_display_mode *mode,
>>> -		 const struct drm_display_mode *adjusted_mode)
>>> +static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
>>> +					       const struct drm_display_mode *mode)
>>>    {
>>> -	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
>>> -	struct hdmi *hdmi = hdmi_bridge->hdmi;
>>>    	int hstart, hend, vstart, vend;
>>>    	uint32_t frame_ctrl;
>>> -	mode = adjusted_mode;
>>> -
>>>    	hdmi->pixclock = mode->clock * 1000;
>>>    	hstart = mode->htotal - mode->hsync_start;
>>> @@ -306,7 +314,6 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
>>>    	.atomic_reset = drm_atomic_helper_bridge_reset,
>>>    	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
>>>    	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
>>> -	.mode_set = msm_hdmi_bridge_mode_set,
>>>    	.mode_valid = msm_hdmi_bridge_mode_valid,
>>>    	.edid_read = msm_hdmi_bridge_edid_read,
>>>    	.detect = msm_hdmi_bridge_detect,
>>>
> 
