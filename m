Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E796A2D2A5
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 02:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C6F10E24D;
	Sat,  8 Feb 2025 01:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ZBCveahe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A7610E24D;
 Sat,  8 Feb 2025 01:31:34 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51811px7016565;
 Sat, 8 Feb 2025 01:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kOMW8RTIO3pAab3P0zq0c0WZFk8FEg7wDem0H2F5bMQ=; b=ZBCveaheBEIB1yx+
 +e8siaQMZdqA0HK716C5buXUWQnYvfWaDITtHyFSlj5Q2xpPEyjuCY8wzKckEjT1
 hLwdCttW7trcSmZWyfDo0gi6u0G3R0XXC+RSt9oR6ha0exv6CfOV3USqqZTmOWIv
 7qA6Q3JEtDO7ADIa1GwWEdJk2vUS5gOHu9FC4rgDNPqHSZvJQ67xVIZN1uD9wK2g
 q3aScdYlb/6pBSOetR7TdQ9Io7A/uhMXfy64Ca/15CNU1dIP0XfbuW2JWZttcIH1
 TM4i8ElqqdgjOwnMc8qRXRkTxU0tXgHQOKj1poBgfkSXoc3307OGjoqubjU3VV+0
 V8ZgEA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nw8cg1aj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 08 Feb 2025 01:31:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5181VMlE032072
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 8 Feb 2025 01:31:22 GMT
Received: from [10.110.94.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Feb 2025
 17:31:21 -0800
Message-ID: <9c35f577-2124-4f80-a5d3-542b47ed6825@quicinc.com>
Date: Fri, 7 Feb 2025 17:31:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/7] drm/msm/hdmi: also send the SPD and HDMI Vendor
 Specific InfoFrames
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Simona Vetter <simona@ffwll.ch>, Simona
 Vetter <simona.vetter@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
 <20250208-bridge-hdmi-connector-v7-6-0c3837f00258@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250208-bridge-hdmi-connector-v7-6-0c3837f00258@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: a0_OQfXAb4jRESBvnIWZvvBaHnDzGYTB
X-Proofpoint-ORIG-GUID: a0_OQfXAb4jRESBvnIWZvvBaHnDzGYTB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_11,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 mlxscore=0 clxscore=1015 phishscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502080009
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



On 2/7/2025 4:27 PM, Dmitry Baryshkov wrote:
> Extend the driver to send SPD and HDMI Vendor Specific InfoFrames.
> 
> While the HDMI block has special block to send HVS InfoFrame, use
> GENERIC0 block instead. VENSPEC_INFO registers pack frame data in a way
> that requires manual repacking in the driver, while GENERIC0 doesn't
> have such format requirements. The msm-4.4 kernel uses GENERIC0 to send
> HDR InfoFrame which we do not at this point anyway.
> 

True that GENERIC_0/1 packets can be used for any infoframe. But because 
we have so many of them, thats why when there are dedicated registers 
for some of them, we use them to save the GENERIC0 ones for others.

Lets take a case where we want to send HVSIF, SPD and HDR together for 
the same frame, then we run out as there are no HDR specific infoframe 
registers we can use. Is the expectation that we will migrate to 
VENSPEC_INFO regs for HVSIF when we add HDR support?

Also from a validation standpoint, I guess to really validate this 
change you need an analyzer which decodes the HVSIF. So was this mostly 
sanity tested at this pointed to make sure that the sink just comes up?

> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 93 ++++++++++++++++++++++++++++++++++
>   1 file changed, 93 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> index 15ab0858105328c2f774ec1f79423614bbbaeb41..aee75eee3d4244cd95e44df46d65b8e3e53de735 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -69,6 +69,8 @@ static void power_off(struct drm_bridge *bridge)
>   }
>   
>   #define AVI_IFRAME_LINE_NUMBER 1
> +#define SPD_IFRAME_LINE_NUMBER 1
> +#define VENSPEC_IFRAME_LINE_NUMBER 3
>   
>   static int msm_hdmi_config_avi_infoframe(struct hdmi *hdmi,
>   					 const u8 *buffer, size_t len)
> @@ -142,6 +144,74 @@ static int msm_hdmi_config_audio_infoframe(struct hdmi *hdmi,
>   	return 0;
>   }
>   
> +static int msm_hdmi_config_spd_infoframe(struct hdmi *hdmi,
> +					 const u8 *buffer, size_t len)
> +{
> +	u32 buf[7] = {};
> +	u32 val;
> +	int i;
> +
> +	if (len != HDMI_INFOFRAME_SIZE(SPD) || len - 3 > sizeof(buf)) {
> +		DRM_DEV_ERROR(&hdmi->pdev->dev,
> +			"failed to configure SPD infoframe\n");
> +		return -EINVAL;
> +	}
> +
> +	/* checksum gets written together with the body of the frame */
> +	hdmi_write(hdmi, REG_HDMI_GENERIC1_HDR,
> +		   buffer[0] |
> +		   buffer[1] << 8 |
> +		   buffer[2] << 16);
> +
> +	memcpy(buf, &buffer[3], len - 3);
> +
> +	for (i = 0; i < ARRAY_SIZE(buf); i++)
> +		hdmi_write(hdmi, REG_HDMI_GENERIC1(i), buf[i]);
> +
> +	val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
> +	val |= HDMI_GEN_PKT_CTRL_GENERIC1_SEND |
> +		 HDMI_GEN_PKT_CTRL_GENERIC1_CONT |
> +		 HDMI_GEN_PKT_CTRL_GENERIC1_LINE(SPD_IFRAME_LINE_NUMBER);
> +	hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
> +
> +	return 0;
> +}
> +
> +static int msm_hdmi_config_hdmi_infoframe(struct hdmi *hdmi,
> +					  const u8 *buffer, size_t len)

msm_hdmi_config_hvsif_infoframe() to be more clear?

> +{
> +	u32 buf[7] = {};
> +	u32 val;
> +	int i;
> +
> +	if (len < HDMI_INFOFRAME_HEADER_SIZE + HDMI_VENDOR_INFOFRAME_SIZE ||
> +	    len - 3 > sizeof(buf)) {
> +		DRM_DEV_ERROR(&hdmi->pdev->dev,
> +			"failed to configure HDMI infoframe\n");
> +		return -EINVAL;
> +	}
> +
> +	/* checksum gets written together with the body of the frame */
> +	hdmi_write(hdmi, REG_HDMI_GENERIC0_HDR,
> +		   buffer[0] |
> +		   buffer[1] << 8 |
> +		   buffer[2] << 16);
> +
> +	memcpy(buf, &buffer[3], len - 3);
> +
> +	for (i = 0; i < ARRAY_SIZE(buf); i++)
> +		hdmi_write(hdmi, REG_HDMI_GENERIC0(i), buf[i]);
> +
> +	val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
> +	val |= HDMI_GEN_PKT_CTRL_GENERIC0_SEND |
> +		 HDMI_GEN_PKT_CTRL_GENERIC0_CONT |
> +		 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE |
> +		 HDMI_GEN_PKT_CTRL_GENERIC0_LINE(VENSPEC_IFRAME_LINE_NUMBER);
> +	hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
> +
> +	return 0;
> +}
> +
>   static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
>   					   enum hdmi_infoframe_type type)
>   {
> @@ -176,6 +246,25 @@ static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
>   
>   		break;
>   
> +	case HDMI_INFOFRAME_TYPE_SPD:
> +		val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
> +		val &= ~(HDMI_GEN_PKT_CTRL_GENERIC1_SEND |
> +			 HDMI_GEN_PKT_CTRL_GENERIC1_CONT |
> +			 HDMI_GEN_PKT_CTRL_GENERIC1_LINE__MASK);
> +		hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
> +
> +		break;
> +
> +	case HDMI_INFOFRAME_TYPE_VENDOR:
> +		val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
> +		val &= ~(HDMI_GEN_PKT_CTRL_GENERIC0_SEND |
> +			 HDMI_GEN_PKT_CTRL_GENERIC0_CONT |
> +			 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE |
> +			 HDMI_GEN_PKT_CTRL_GENERIC0_LINE__MASK);
> +		hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
> +
> +		break;
> +
>   	default:
>   		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
>   	}
> @@ -197,6 +286,10 @@ static int msm_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
>   		return msm_hdmi_config_avi_infoframe(hdmi, buffer, len);
>   	case HDMI_INFOFRAME_TYPE_AUDIO:
>   		return msm_hdmi_config_audio_infoframe(hdmi, buffer, len);
> +	case HDMI_INFOFRAME_TYPE_SPD:
> +		return msm_hdmi_config_spd_infoframe(hdmi, buffer, len);
> +	case HDMI_INFOFRAME_TYPE_VENDOR:
> +		return msm_hdmi_config_hdmi_infoframe(hdmi, buffer, len);
>   	default:
>   		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
>   		return 0;
> 

