Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDACA46800A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 23:54:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B36AA36D;
	Fri,  3 Dec 2021 22:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D7CAA367;
 Fri,  3 Dec 2021 22:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1638572042; x=1670108042;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=e4qZ64tdPXRrTX21Jx7vS5boXNuRbN7XPdFg7iiO9O4=;
 b=Uu1pLx3XUFqqMi5b8KgtB6oQXMTcCWt1wHOOzTjHzdlW2DZmOxp0HJHH
 fWhEVBox8FisyII77DJ5WdlSFAepLGH7FSkSOV/XwMqB4CQrP1GzW3zjY
 7MQx1VZ+3HxIXtp6N04P+4AGxOdVXKV/F1hJvNszlBlRU4cZeu0SIki34 c=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 03 Dec 2021 14:54:02 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 14:54:01 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 3 Dec 2021 14:54:01 -0800
Received: from [10.110.99.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Fri, 3 Dec 2021
 14:54:00 -0800
Message-ID: <7c686adc-4288-f29a-c82a-5decab8db703@quicinc.com>
Date: Fri, 3 Dec 2021 14:53:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v4] drm/msm/dp: do not initialize phy until plugin
 interrupt received
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <airlied@linux.ie>, <bjorn.andersson@linaro.org>, <daniel@ffwll.ch>,
 <dmitry.baryshkov@linaro.org>, <robdclark@gmail.com>, <sean@poorly.run>,
 <vkoul@kernel.org>
References: <1636493893-7600-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n51-=qTWfBVPFEmpEb7md6cg5O__bhydXTUb+=8dRqCuqg@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n51-=qTWfBVPFEmpEb7md6cg5O__bhydXTUb+=8dRqCuqg@mail.gmail.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/2/2021 6:41 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-11-09 13:38:13)
>> From: Kuogee Hsieh <khsieh@codeaurora.org>
>>
>> Current DP drivers have regulators, clocks, irq and phy are grouped
>> together within a function and executed not in a symmetric manner.
>> This increase difficulty of code maintenance and limited code scalability.
>> This patch divided the driver life cycle of operation into four states,
>> resume (including booting up), dongle plugin, dongle unplugged and suspend.
>> Regulators, core clocks and irq are grouped together and enabled at resume
>> (or booting up) so that the DP controller is armed and ready to receive HPD
>> plugin interrupts. HPD plugin interrupt is generated when a dongle plugs
>> into DUT (device under test). Once HPD plugin interrupt is received, DP
>> controller will initialize phy so that dpcd read/write will function and
>> following link training can be proceeded successfully. DP phy will be
>> disabled after main link is teared down at end of unplugged HPD interrupt
>> handle triggered by dongle unplugged out of DUT. Finally regulators, code
>> clocks and irq are disabled at corresponding suspension.
>>
>> Changes in V2:
>> -- removed unnecessary dp_ctrl NULL check
>> -- removed unnecessary phy init_count and power_count DRM_DEBUG_DP logs
>> -- remove flip parameter out of dp_ctrl_irq_enable()
>> -- add fixes tag
>>
>> Changes in V3:
>> -- call dp_display_host_phy_init() instead of dp_ctrl_phy_init() at
>>          dp_display_host_init() for eDP
>>
>> Changes in V4:
>> -- rewording commit text to match this commit changes
>>
>> Fixes: e91e3065a806 ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
> Can you please resend this based on the msm-next branch[1]? It doesn't
> apply now that other patches have been applied.
>
> [1] https://gitlab.freedesktop.org/drm/msm.git msm-next

Stephen, below patches  missed at msm-next branch. Are there merged soon?

1) WIP: drm/msm/dp: Detect the connector type based on reg property

2) WIP: handle no-hpd property in DP driver


>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 87 ++++++++++++++++---------------------
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  9 ++--
>>   drivers/gpu/drm/msm/dp/dp_display.c | 83 ++++++++++++++++++++++++++---------
>>   3 files changed, 105 insertions(+), 74 deletions(-)
>>
