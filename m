Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E1451DC97
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 17:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184C210E192;
	Fri,  6 May 2022 15:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F1B10E192
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 15:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651852335; x=1683388335;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wcCqtZEPwF4j+NJY+GsjG63IidZrMrfgVo1P2Q6mh+Q=;
 b=COvmO0mKAn4g/RwdmbqkXG5mJAAwDG5f1TlSQNNnPGIC3FybtGLrttiE
 UPjQFpVyj9qoA8nfTwwot82z/XEFZ6adB/utMWIVSAmBHGesT56TS5p4P
 fqtGZfIqgSiTr58riAEz9DBWn1UjVzIt263t/11hLWhGPH04rpUishrNb M=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 06 May 2022 08:52:13 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 08:52:12 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 6 May 2022 08:52:12 -0700
Received: from [10.111.168.240] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 6 May 2022
 08:52:10 -0700
Message-ID: <df0fd0ea-96db-ec4c-2271-280bd8bcdf79@quicinc.com>
Date: Fri, 6 May 2022 08:52:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 -next] drm/display: Fix build error without CONFIG_OF
Content-Language: en-US
To: YueHaibing <yuehaibing@huawei.com>, <airlied@linux.ie>, <daniel@ffwll.ch>, 
 <tzimmermann@suse.de>, <dmitry.baryshkov@linaro.org>
References: <20220506123246.21788-1-yuehaibing@huawei.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220506123246.21788-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/6/2022 5:32 AM, YueHaibing wrote:
> While CONFIG_OF is n but COMPILE_TEST is y, we got this:
> 
> WARNING: unmet direct dependencies detected for DRM_DP_AUX_BUS
>    Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && OF [=n]
>    Selected by [y]:
>    - DRM_MSM [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARCH_QCOM || SOC_IMX5 || COMPILE_TEST [=y]) && COMMON_CLK [=y] && IOMMU_SUPPORT [=y] && (QCOM_OCMEM [=n] || QCOM_OCMEM [=n]=n) && (QCOM_LLCC [=y] || QCOM_LLCC [=y]=n) && (QCOM_COMMAND_DB [=n] || QCOM_COMMAND_DB [=n]=n)
> 
> Make DRM_DP_AUX_BUS depends on OF || COMPILE_TEST to fix this warning.
> 
> Fixes: f5d01644921b ("drm/msm: select DRM_DP_AUX_BUS for the AUX bus support")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> v2: fix this in DRM_DP_AUX_BUS dependencies
> ---
>   drivers/gpu/drm/display/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
> index 1b6e6af37546..09712b88a5b8 100644
> --- a/drivers/gpu/drm/display/Kconfig
> +++ b/drivers/gpu/drm/display/Kconfig
> @@ -3,7 +3,7 @@
>   config DRM_DP_AUX_BUS
>   	tristate
>   	depends on DRM
> -	depends on OF
> +	depends on OF || COMPILE_TEST
>   
>   config DRM_DISPLAY_HELPER
>   	tristate
