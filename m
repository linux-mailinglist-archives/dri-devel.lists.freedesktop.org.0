Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5629159F6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 00:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05E410E279;
	Mon, 24 Jun 2024 22:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="OXeHd1ip";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D4610E1F3;
 Mon, 24 Jun 2024 22:39:39 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45OHlW5U008969;
 Mon, 24 Jun 2024 22:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gckfGlMYuYnbR8RAyruOxvuX9UaymnP8Tgn3DVWINCA=; b=OXeHd1ipuJNmSaoL
 5zthFPOga/pl5nKyPEdIdu8lnoYQsCIj5wZhR4xxTCBA4Lyd41pXka5DcIpbDGN5
 pZXQXQ++PzQTp01sFvVzeQ3dlupqDupg58lUI7IUQOcQPSwQSi2IDnmUe3O5U9UQ
 QuxfxGiKhYUk0SWIyV467uSCsoYMuA8e5j2cXwQrbd4sDx4m1eU5nwAk8L1eUQsp
 hwWcCwYhPVQpEK1G1ZbR9MsLHTYCPxaqaVZ85cxv/WOOZVDAeN7HHUB82a9HJWYg
 FlbjVY1RTwszcK3NykTJYNE6YklR8iIgDwRQAVdeQTKOYuxj9ek1pSH5vAhdqLxZ
 S7D6CA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqcecwwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jun 2024 22:39:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45OMdMej025279
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jun 2024 22:39:22 GMT
Received: from [10.110.106.13] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Jun
 2024 15:39:21 -0700
Message-ID: <99ff549c-f5c4-dc9c-42f3-396dc3d29d6b@quicinc.com>
Date: Mon, 24 Jun 2024 15:39:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] drm/connector: automatically set immutable flag
 for max_bpc property
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Petri Latvala <adrinael@adrinael.net>, Kamil
 Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240623-drm-bridge-connector-fix-hdmi-reset-v2-0-8590d44912ce@linaro.org>
 <20240623-drm-bridge-connector-fix-hdmi-reset-v2-2-8590d44912ce@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240623-drm-bridge-connector-fix-hdmi-reset-v2-2-8590d44912ce@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: HI8gNzKyRqLtvy82URy1NYj525oXg_qI
X-Proofpoint-ORIG-GUID: HI8gNzKyRqLtvy82URy1NYj525oXg_qI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_19,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011
 mlxscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406240181
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

+ IGT dev

On 6/22/2024 10:40 PM, Dmitry Baryshkov wrote:
> With the introduction of the HDMI Connector framework the driver might
> end up creating the max_bpc property with min = max = 8. IGT insists
> that such properties carry the 'immutable' flag. Automatically set the
> flag if the driver asks for the max_bpc property with min == max.
> 

This change does not look right to me.

I wonder why we need this check because DRM_MODE_PROP_IMMUTABLE means 
that as per the doc, userspace cannot change the property.

          * DRM_MODE_PROP_IMMUTABLE
          *     Set for properties whose values cannot be changed by
          *     userspace. The kernel is allowed to update the value of 
these
          *     properties. This is generally used to expose probe state to
          *     userspace, e.g. the EDID, or the connector path property 
on DP
          *     MST sinks. Kernel can update the value of an immutable 
property
          *     by calling drm_object_property_set_value().
          */

Here we are allowing userspace to change max_bpc


drm_atomic_connector_set_property()
{
	**********

         } else if (property == connector->max_bpc_property) {
                 state->max_requested_bpc = val;

	**********
}

I believe you are referring to this IGT check right?

https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_properties.c#L428

I think we should fix IGT in this case unless there is some reason we 
are missing. Because just because it has the same min and max does not 
mean its immutable by the doc of the IMMUTABLE flag.


> Fixes: aadb3e16b8f3 ("drm/connector: hdmi: Add output BPC to the connector state")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/drm_connector.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index ab6ab7ff7ea8..33847fd63628 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2610,7 +2610,12 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
>   
>   	prop = connector->max_bpc_property;
>   	if (!prop) {
> -		prop = drm_property_create_range(dev, 0, "max bpc", min, max);
> +		u32 flags = 0;
> +
> +		if (min == max)
> +			flags |= DRM_MODE_PROP_IMMUTABLE;
> +
> +		prop = drm_property_create_range(dev, flags, "max bpc", min, max);
>   		if (!prop)
>   			return -ENOMEM;
>   
> 
