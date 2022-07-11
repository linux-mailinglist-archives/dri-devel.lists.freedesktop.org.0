Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D72157094D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2539039F;
	Mon, 11 Jul 2022 17:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBD690358;
 Mon, 11 Jul 2022 17:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657561296; x=1689097296;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DyoA2eblJxwdVzFlegoGgd92UZ1QkjDQHz2zspQgff4=;
 b=JHpcTvuEKZnwZ/Gy+Ea24DLbffQj9NCBOPAj38UV9hAfALJSwndV330R
 U9NOts+RU1c9JFMn/ewgWoDynuFWNkw6xkF44kAlZT5sacCPTUx4JKwIo
 sj1+oEaRVkhny3ZtQQogZ2QvyagBDg8reLlqsopG848YsT7bcOe4i3eN5 Y=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 11 Jul 2022 10:41:35 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2022 10:41:35 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 11 Jul 2022 10:41:34 -0700
Received: from [10.38.245.206] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 11 Jul
 2022 10:41:31 -0700
Message-ID: <05880166-7ca2-4438-4511-4fb86d45f0d9@quicinc.com>
Date: Mon, 11 Jul 2022 10:41:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 1/4] drm/mipi-dsi: pass DSC data through the struct
 mipi_dsi_device
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220711094320.368062-1-dmitry.baryshkov@linaro.org>
 <20220711094320.368062-2-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220711094320.368062-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/11/2022 2:43 AM, Dmitry Baryshkov wrote:
> The commit 0f40ba48de3b ("drm/msm/dsi: Pass DSC params to drm_panel")
> added a pointer to the DSC data to the struct drm_panel. However DSC
> support is not limited to the DSI panels. MIPI DSI bridges can also
> consume DSC command streams. Thus add struct drm_dsc_config pointer to
> the struct mipi_dsi_device.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Agreed, DSC params are not limited to a drm_panel. From that standpoint, 
this change seems logical to me, hence

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
>   include/drm/drm_mipi_dsi.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 91a164bdd8f3..bb20bc27ce87 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -179,6 +179,7 @@ struct mipi_dsi_device_info {
>    * @lp_rate: maximum lane frequency for low power mode in hertz, this should
>    * be set to the real limits of the hardware, zero is only accepted for
>    * legacy drivers
> + * @dsc: panel/bridge DSC pps payload to be sent
>    */
>   struct mipi_dsi_device {
>   	struct mipi_dsi_host *host;
> @@ -191,6 +192,7 @@ struct mipi_dsi_device {
>   	unsigned long mode_flags;
>   	unsigned long hs_rate;
>   	unsigned long lp_rate;
> +	struct drm_dsc_config *dsc;
>   };
>   
>   #define MIPI_DSI_MODULE_PREFIX "mipi-dsi:"
