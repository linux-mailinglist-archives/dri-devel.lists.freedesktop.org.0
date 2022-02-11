Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2A74B2E44
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 21:13:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D3C10EB5C;
	Fri, 11 Feb 2022 20:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EFEF10EB5B;
 Fri, 11 Feb 2022 20:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644610410; x=1676146410;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=X6Kr/4OZO4ERbvN7+C8TVcR8Fvw6LASOBv5GjLwTfg4=;
 b=TKtU7AdSYsUAO1YoOEXDTSvwo3HFFM2l74ptbAUIjJpB/1/ntkoRqS+Q
 uLeZ9Xm0dJLMRrIMqvE/5aklJi3NH7dzIhHCOayIwEaMaP04xGIOBin1f
 amKTEbk4ZhscjrEynsYHZWasWBsV8MBy8I75BfoNpI7oguqE58roudRXb w=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 11 Feb 2022 12:13:29 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 12:13:29 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 11 Feb 2022 12:13:29 -0800
Received: from [10.38.246.233] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Fri, 11 Feb
 2022 12:13:26 -0800
Message-ID: <d4f50a93-2d6d-f940-6871-236226a30893@quicinc.com>
Date: Fri, 11 Feb 2022 12:13:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/dsi: move DSI host powerup to
 modeset time
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20211207222901.988484-1-dmitry.baryshkov@linaro.org>
 <20211207222901.988484-2-dmitry.baryshkov@linaro.org>
 <9fc8d452-7541-cbc5-57ca-96d1e480150c@quicinc.com>
 <CAA8EJpp_re=UYYpuY90FiFJjARcFr+sZoR_WtJ9ETU40Dc_wig@mail.gmail.com>
 <b3338d40-5f54-2577-60a9-afa3a34173f1@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <b3338d40-5f54-2577-60a9-afa3a34173f1@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/11/2022 11:37 AM, Dmitry Baryshkov wrote:
> On 18/01/2022 23:03, Dmitry Baryshkov wrote:
>> On Tue, 18 Jan 2022 at 22:29, Abhinav Kumar 
>> <quic_abhinavk@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 12/7/2021 2:29 PM, Dmitry Baryshkov wrote:
>>>> The DSI subsystem does not fully fall into the pre-enable/enable system
>>>> of callbacks, since typically DSI device bridge drivers expect to be
>>>> able to communicate with DSI devices at the pre-enable() callback. The
>>>> reason is that for some DSI hosts enabling the video stream would
>>>> prevent other drivers from sending DSI commands. For example see the
>>>> panel-bridge driver, which does drm_panel_prepare() from the
>>>> pre_enable() callback (which would be called before our pre_enable()
>>>> callback, resulting in panel preparation failures as the link is not 
>>>> yet
>>>> ready).
>>>>
>>>> Therewere several attempts to solve this issue, but currently the best
>>>> approach is to power up the DSI link from the mode_set() callback,
>>>> allowing next bridge/panel to use DSI transfers in the pre_enable()
>>>> time. Follow this approach.
>>>>
>>> Change looks okay. As per the programming guideline, we should set the
>>> VIDEO_MODE_EN register in the DSI controller followed by enabling the
>>> timing engine which will still happen even now because we will do it in
>>> modeset instead of the pre_enable().
>>> But, this can potentially increase the delay between VIDEO_MODE_EN
>>> and TIMING_ENGINE_EN. I dont see anything in the programming guide
>>> against this but since this is a change from the original flow, I would
>>> like to do one test before acking this. Can you please try adding a huge
>>> delay like 200-300ms between VIDEO_MODE_EN and timing engine enable to
>>> make sure there are no issues? You can do that here:
>>
>>
>> Fine, I'll do the test as the time permits.
> 
> I did the tests, the display pipeline works as expected.
> 
> Let's get this in, it allows using other DSI-controlled bridges.

Alright, sounds good,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
>>
>>>
>>> int msm_dsi_host_enable(struct mipi_dsi_host *host)
>>> {
>>>       struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>>>
>>>       dsi_op_mode_config(msm_host,
>>>           !!(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO), true);
>>>
>>>       msleep(300);
>>> }
>>>
>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/msm/dsi/dsi_manager.c | 43 
>>>> +++++++++++++++++++--------
>>>>    1 file changed, 31 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c 
>>>> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>>> index 681ca74fe410..497719efb9e9 100644
>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>>> @@ -336,13 +336,12 @@ dsi_mgr_connector_best_encoder(struct 
>>>> drm_connector *connector)
>>>>        return msm_dsi_get_encoder(msm_dsi);
>>>>    }
>>>>
>>>> -static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>>>> +static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
>>>>    {
>>>>        int id = dsi_mgr_bridge_get_id(bridge);
>>>>        struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>>>        struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
>>>>        struct mipi_dsi_host *host = msm_dsi->host;
>>>> -     struct drm_panel *panel = msm_dsi->panel;
>>>>        struct msm_dsi_phy_shared_timings phy_shared_timings[DSI_MAX];
>>>>        bool is_bonded_dsi = IS_BONDED_DSI();
>>>>        int ret;
>>>> @@ -383,6 +382,34 @@ static void dsi_mgr_bridge_pre_enable(struct 
>>>> drm_bridge *bridge)
>>>>        if (is_bonded_dsi && msm_dsi1)
>>>>                msm_dsi_host_enable_irq(msm_dsi1->host);
>>>>
>>>> +     return;
>>>> +
>>>> +host1_on_fail:
>>>> +     msm_dsi_host_power_off(host);
>>>> +host_on_fail:
>>>> +     dsi_mgr_phy_disable(id);
>>>> +phy_en_fail:
>>>> +     return;
>>>> +}
>>>> +
>>>> +static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
>>>> +{
>>>> +     int id = dsi_mgr_bridge_get_id(bridge);
>>>> +     struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>>> +     struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
>>>> +     struct mipi_dsi_host *host = msm_dsi->host;
>>>> +     struct drm_panel *panel = msm_dsi->panel;
>>>> +     bool is_bonded_dsi = IS_BONDED_DSI();
>>>> +     int ret;
>>>> +
>>>> +     DBG("id=%d", id);
>>>> +     if (!msm_dsi_device_connected(msm_dsi))
>>>> +             return;
>>>> +
>>>> +     /* Do nothing with the host if it is slave-DSI in case of 
>>>> bonded DSI */
>>>> +     if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
>>>> +             return;
>>>> +
>>>>        /* Always call panel functions once, because even for dual 
>>>> panels,
>>>>         * there is only one drm_panel instance.
>>>>         */
>>>> @@ -417,17 +444,7 @@ static void dsi_mgr_bridge_pre_enable(struct 
>>>> drm_bridge *bridge)
>>>>        if (panel)
>>>>                drm_panel_unprepare(panel);
>>>>    panel_prep_fail:
>>>> -     msm_dsi_host_disable_irq(host);
>>>> -     if (is_bonded_dsi && msm_dsi1)
>>>> -             msm_dsi_host_disable_irq(msm_dsi1->host);
>>>>
>>>> -     if (is_bonded_dsi && msm_dsi1)
>>>> -             msm_dsi_host_power_off(msm_dsi1->host);
>>>> -host1_on_fail:
>>>> -     msm_dsi_host_power_off(host);
>>>> -host_on_fail:
>>>> -     dsi_mgr_phy_disable(id);
>>>> -phy_en_fail:
>>>>        return;
>>>>    }
>>>>
>>>> @@ -573,6 +590,8 @@ static void dsi_mgr_bridge_mode_set(struct 
>>>> drm_bridge *bridge,
>>>>        msm_dsi_host_set_display_mode(host, adjusted_mode);
>>>>        if (is_bonded_dsi && other_dsi)
>>>>                msm_dsi_host_set_display_mode(other_dsi->host, 
>>>> adjusted_mode);
>>>> +
>>>> +     dsi_mgr_bridge_power_on(bridge);
>>>>    }
>>>>
>>>>    static const struct drm_connector_funcs dsi_mgr_connector_funcs = {
>>
>>
>>
> 
> 
