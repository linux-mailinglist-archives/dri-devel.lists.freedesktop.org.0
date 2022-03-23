Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ECC4E5A24
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 21:48:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8813110E14B;
	Wed, 23 Mar 2022 20:48:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490BF10E12E;
 Wed, 23 Mar 2022 20:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648068484; x=1679604484;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=E1vhygVA4qeeFtZLSu+ZjL2N5CUIKWh3kN26nSiUzHE=;
 b=dz74PTXugfMZACW3eFE1Lr2NiAl1SRywLJJfWr5apj/HttA5eiODpk62
 Qt0aronW/JFZiWe3mZBa/oLsqwanKxN6wlOEHGhTbFo+iRAHBHxX+c6gS
 28QtoF7vvbKk7v6hTUuskxw4Pga7Sd3glUcmh07P4dkdClYBdU/CGXsPg g=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 23 Mar 2022 13:48:03 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 13:48:03 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 23 Mar 2022 13:48:03 -0700
Received: from [10.110.52.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 23 Mar
 2022 13:48:02 -0700
Message-ID: <33760858-1934-bad3-82bb-49654e3272b9@quicinc.com>
Date: Wed, 23 Mar 2022 13:48:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 0/3] drm/msm/dp: simplify dp_connector_get_modes()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Kuogee Hsieh <quic_khsieh@quicinc.com>, "Sankeerth
 Billakanti" <quic_sbillaka@quicinc.com>
References: <20220323103546.1772673-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220323103546.1772673-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/23/2022 3:35 AM, Dmitry Baryshkov wrote:
> As noted by Ville Syrjälä [1] the dp_connector_get_modes() has weird
> on-stack interim copy of the mode. When reviewing the mentioned patch I
> noticed that the rest of the code in dp_connector_get_modes() is weird,
> unused since September of 2020 and can be removed. This series removes
> dead weird code leaving dp_connector_get_modes() simple enough.
> 
> [1] https://lore.kernel.org/linux-arm-msm/20220218100403.7028-11-ville.syrjala@linux.intel.com/
For the series,
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> *** BLURB HERE ***
> 
> Dmitry Baryshkov (3):
>    drm/msm/dp: drop dp_mode argument from dp_panel_get_modes()
>    drm/msm/dp: simplify dp_connector_get_modes()
>    drm/msm/dp: remove max_pclk_khz field from dp_panel/dp_display
> 
>   drivers/gpu/drm/msm/dp/dp_debug.c   |  2 --
>   drivers/gpu/drm/msm/dp/dp_display.c | 11 +++-------
>   drivers/gpu/drm/msm/dp/dp_display.h |  5 +----
>   drivers/gpu/drm/msm/dp/dp_drm.c     | 33 ++---------------------------
>   drivers/gpu/drm/msm/dp/dp_panel.c   |  2 +-
>   drivers/gpu/drm/msm/dp/dp_panel.h   |  3 +--
>   6 files changed, 8 insertions(+), 48 deletions(-)
> 
