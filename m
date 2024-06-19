Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0610A90F8E0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 00:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D089210E333;
	Wed, 19 Jun 2024 22:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="WcOdWZC8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402AC10E2A2;
 Wed, 19 Jun 2024 22:14:06 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45JM1NLA018044;
 Wed, 19 Jun 2024 22:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QIFn3Xoez+vVFtDCzfSSjjbDTISbYPN0JdBGZLJk//8=; b=WcOdWZC8qtI3TZZ+
 w2TlqJ4IZKoo7ZZXXQjY1WYoZIy1cq+lsrpgAsQH+ixEwW2ma1Hwgmd3gBAP3tyE
 sPXKQzHSRT4PQqzAkqeOBjPHJDClktc4LbqJI7CahRQOpY/39dmtv7e1UL3/ZlMr
 mYb272lBe3OLOcw0uC9tvjv7Ik9UmZoug6Gatv091fI3mPiWKdry8A6aIKu9g4d9
 lSRjbnc6lxFhIe3z0dexku2VTnz2yodpQpmk84MlEUXGFuVgB67sA8uzIXd5hCMA
 4W8eizQm2PWNeKhLx9h00Q+c8PdPrT9LaPEacElNteOgCt424C/DUMmjD1zb3mQZ
 jLJjnw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yv7jeg178-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jun 2024 22:14:03 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45JME22v005400
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jun 2024 22:14:02 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Jun
 2024 15:14:02 -0700
Message-ID: <0d240c5d-665e-40d8-91fb-9b9aad3b172a@quicinc.com>
Date: Wed, 19 Jun 2024 15:14:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/14] drm/msm/hdmi: wire in hpd_enable/hpd_disable
 bridge ops
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
 <20240522-fd-hdmi-hpd-v2-14-c30bdb7c5c7e@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-14-c30bdb7c5c7e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: F45jFT8YKhGLgLPu63CFFicuUPPPSP5B
X-Proofpoint-ORIG-GUID: F45jFT8YKhGLgLPu63CFFicuUPPPSP5B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=964
 clxscore=1015 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406190168
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



On 5/22/2024 3:51 AM, Dmitry Baryshkov wrote:
> The HDMI driver already has msm_hdmi_hpd_enable() and
> msm_hdmi_hpd_disable() functions. Wire them into the
> msm_hdmi_bridge_funcs, so that HPD  can be enabled and disabled
> dynamically rather than always having HPD events generation enabled.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/hdmi/hdmi.c        |  9 ---------
>   drivers/gpu/drm/msm/hdmi/hdmi.h        |  4 ++--
>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  3 +++
>   drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 12 ++++++------
>   4 files changed, 11 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 2890196857f8..06adcf4a6544 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -202,12 +202,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>   		goto fail;
>   	}
>   
> -	ret = msm_hdmi_hpd_enable(hdmi->bridge);
> -	if (ret < 0) {
> -		DRM_DEV_ERROR(&hdmi->pdev->dev, "failed to enable HPD: %d\n", ret);
> -		goto fail;
> -	}
> -
>   	return 0;
>   
>   fail:
> @@ -377,9 +371,6 @@ static void msm_hdmi_unbind(struct device *dev, struct device *master,
>   		if (priv->hdmi->audio_pdev)
>   			platform_device_unregister(priv->hdmi->audio_pdev);
>   
> -		if (priv->hdmi->bridge)
> -			msm_hdmi_hpd_disable(priv->hdmi);
> -
>   		msm_hdmi_destroy(priv->hdmi);
>   		priv->hdmi = NULL;
>   	}
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
> index 7f0ca5252018..c6519e6f7f2c 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.h
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
> @@ -219,8 +219,8 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi);
>   void msm_hdmi_hpd_irq(struct drm_bridge *bridge);
>   enum drm_connector_status msm_hdmi_bridge_detect(
>   		struct drm_bridge *bridge);
> -int msm_hdmi_hpd_enable(struct drm_bridge *bridge);
> -void msm_hdmi_hpd_disable(struct hdmi *hdmi);
> +void msm_hdmi_hpd_enable(struct drm_bridge *bridge);
> +void msm_hdmi_hpd_disable(struct drm_bridge *bridge);
>   
>   /*
>    * i2c adapter for ddc:
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> index 104107ed47d0..41722b2e6b44 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -300,6 +300,9 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
>   	.mode_valid = msm_hdmi_bridge_mode_valid,
>   	.edid_read = msm_hdmi_bridge_edid_read,
>   	.detect = msm_hdmi_bridge_detect,
> +
> +	.hpd_enable = msm_hdmi_hpd_enable,
> +	.hpd_disable = msm_hdmi_hpd_disable,
>   };
>   
>   static void
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
> index cb89e9e2c6ea..04d00b6f36fd 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
> @@ -60,7 +60,7 @@ static void msm_hdmi_phy_reset(struct hdmi *hdmi)
>   	}
>   }
>   
> -int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
> +void msm_hdmi_hpd_enable(struct drm_bridge *bridge)
>   {
>   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
>   	struct hdmi *hdmi = hdmi_bridge->hdmi;
> @@ -70,8 +70,8 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
>   	unsigned long flags;
>   
>   	ret = pm_runtime_resume_and_get(dev);
> -	if (ret)
> -		return ret;
> +	if (WARN_ON(ret))
> +		return;
>   
>   	mutex_lock(&hdmi->state_mutex);
>   	msm_hdmi_set_mode(hdmi, false);
> @@ -99,12 +99,12 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
>   	hdmi_write(hdmi, REG_HDMI_HPD_CTRL,
>   			HDMI_HPD_CTRL_ENABLE | hpd_ctrl);
>   	spin_unlock_irqrestore(&hdmi->reg_lock, flags);
> -
> -	return 0;
>   }
>   
> -void msm_hdmi_hpd_disable(struct hdmi *hdmi)
> +void msm_hdmi_hpd_disable(struct drm_bridge *bridge)
>   {
> +	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> +	struct hdmi *hdmi = hdmi_bridge->hdmi;
>   	struct device *dev = &hdmi->pdev->dev;
>   
>   	/* Disable HPD interrupt */
> 
> -- 
> 2.39.2
> 
