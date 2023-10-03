Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC267B7401
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 00:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A960610E31F;
	Tue,  3 Oct 2023 22:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67CF10E0AE;
 Tue,  3 Oct 2023 22:12:30 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 393LLTFi025895; Tue, 3 Oct 2023 22:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=p9dGClbRdGBaaBFAqcJijoCMl0wUPTdMM8f2ScgVCes=;
 b=KsR9dfqPsutE/EUoMVXJJMtVImRmhZB9VzwfpCUICwKjXe9uMvm9sA3zNYNg8xSLYq+H
 XNJH5jYUuvFxnrmSlermgLPKdcwehOjiI724jF80EcrsMwxGdBSoieyh3Upu65HOKyGN
 qJlVh+SvtoO2v8LonjhobYMl+R21EXe4uah8j8sWDyBLID0lZM/NZjhXylee7EgPjnqH
 qhG9kD8PTX2zXB+JOaB9kqxFJDEL3yYVk29C7UfTMjFQEQhs+UXMC2ApmeljP9T1mN0T
 F2mohXE5GIf68FyYzqBLdgWltHoSQbU5iyTGdgGsJlHVnbOGq8z9YjnueX6ls+daMXa0 oA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tghsjsf34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Oct 2023 22:12:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 393MCM66019799
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 3 Oct 2023 22:12:22 GMT
Received: from [10.110.36.217] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 3 Oct
 2023 15:12:20 -0700
Message-ID: <65740ce1-9645-cbae-3d5e-503c5f2ee4e8@quicinc.com>
Date: Tue, 3 Oct 2023 15:12:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 7/8] drm/msm/dp: add pm_runtime_force_suspend()/resume()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1695848028-18023-1-git-send-email-quic_khsieh@quicinc.com>
 <1695848028-18023-8-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpor3WEYmN=hQJQPFyjZGdr4j8F-XAB=2BDVRFCTNioEiA@mail.gmail.com>
 <e72ae247-459d-9f23-0583-ce6da1a30336@quicinc.com>
 <CAA8EJppGg4+Rrf+1HBYYgvFtGWU2xRTGK6tP6xMefFsv-vyEiQ@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJppGg4+Rrf+1HBYYgvFtGWU2xRTGK6tP6xMefFsv-vyEiQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2NLNyzYrx42MRlbwtfbxKdZ9Ob51TYce
X-Proofpoint-ORIG-GUID: 2NLNyzYrx42MRlbwtfbxKdZ9Ob51TYce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-03_18,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310030167
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/3/2023 10:53 AM, Dmitry Baryshkov wrote:
> On Tue, 3 Oct 2023 at 19:44, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>
>> On 9/27/2023 3:00 PM, Dmitry Baryshkov wrote:
>>> On Wed, 27 Sept 2023 at 23:54, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>>> After incorporated pm_runtime framework into eDP/DP driver, the
>>> incorporating
>>>
>>>
>>>> original dp_pm_suspend() to handle power off both DP phy and
>>>> controller during suspend and dp_pm_resume() to handle power on
>>>> both DP phy and controller during resume are not necessary since
>>>> those function are replaced by dp_pm_runtime_suspend() and
>>>> dp_pm_runtime_resume() through pm runtime framework.
>>>> Therefore add pm framework provides functions,
>>>> pm_runtime_force_suspend()/resume() to complete incorporating pm
>>>> runtime framework into DP driver.
>>>>
>>>> Changes in v4:
>>>> -- drop both dp_pm_prepare() and dp_pm_compete() from this change
>>>> -- delete ST_SUSPENDED state
>>>> -- rewording commit text to add more details regrading the purpose
>>>>      of this change
>>>>
>>>> Changes in v3:
>>>> -- replace dp_pm_suspend() with pm_runtime_force_suspend()
>>>> -- replace dp_pm_resume() with pm_runtime_force_resume()
>>>>
>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_display.c | 113 ++----------------------------------
>>>>    1 file changed, 5 insertions(+), 108 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index 9158a2c..711d262 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> @@ -49,7 +49,6 @@ enum {
>>>>           ST_CONNECTED,
>>>>           ST_DISCONNECT_PENDING,
>>>>           ST_DISPLAY_OFF,
>>>> -       ST_SUSPENDED,
>>>>    };
>>>>
>>>>    enum {
>>>> @@ -560,7 +559,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>>>>           drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
>>>>                           dp->dp_display.connector_type, state);
>>>>
>>>> -       if (state == ST_DISPLAY_OFF || state == ST_SUSPENDED) {
>>>> +       if (state == ST_DISPLAY_OFF) {
>>>>                   mutex_unlock(&dp->event_mutex);
>>>>                   return 0;
>>>>           }
>>>> @@ -674,7 +673,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
>>>>           drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
>>>>                           dp->dp_display.connector_type, state);
>>>>
>>>> -       if (state == ST_DISPLAY_OFF || state == ST_SUSPENDED) {
>>>> +       if (state == ST_DISPLAY_OFF) {
>>>>                   mutex_unlock(&dp->event_mutex);
>>>>                   return 0;
>>>>           }
>>>> @@ -1321,110 +1320,10 @@ static int dp_pm_runtime_resume(struct device *dev)
>>>>           return 0;
>>>>    }
>>>>
>>>> -static int dp_pm_resume(struct device *dev)
>>>> -{
>>>> -       struct platform_device *pdev = to_platform_device(dev);
>>>> -       struct msm_dp *dp_display = platform_get_drvdata(pdev);
>>>> -       struct dp_display_private *dp;
>>>> -       int sink_count = 0;
>>>> -
>>>> -       dp = container_of(dp_display, struct dp_display_private, dp_display);
>>>> -
>>>> -       mutex_lock(&dp->event_mutex);
>>>> -
>>>> -       drm_dbg_dp(dp->drm_dev,
>>>> -               "Before, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
>>>> -               dp->dp_display.connector_type, dp->core_initialized,
>>>> -               dp->phy_initialized, dp_display->power_on);
>>>> -
>>>> -       /* start from disconnected state */
>>>> -       dp->hpd_state = ST_DISCONNECTED;
>>>> -
>>>> -       /* turn on dp ctrl/phy */
>>>> -       dp_display_host_init(dp);
>>>> -
>>>> -       if (dp_display->is_edp)
>>>> -               dp_catalog_ctrl_hpd_enable(dp->catalog);
>>>> -
>>>> -       if (dp_catalog_link_is_connected(dp->catalog)) {
>>>> -               /*
>>>> -                * set sink to normal operation mode -- D0
>>>> -                * before dpcd read
>>>> -                */
>>>> -               dp_display_host_phy_init(dp);
>>>> -               dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>>>> -               sink_count = drm_dp_read_sink_count(dp->aux);
>>>> -               if (sink_count < 0)
>>>> -                       sink_count = 0;
>>>> -
>>>> -               dp_display_host_phy_exit(dp);
>>>> -       }
>>>> -
>>>> -       dp->link->sink_count = sink_count;
>>>> -       /*
>>>> -        * can not declared display is connected unless
>>>> -        * HDMI cable is plugged in and sink_count of
>>>> -        * dongle become 1
>>>> -        * also only signal audio when disconnected
>>>> -        */
>>>> -       if (dp->link->sink_count) {
>>>> -               dp->dp_display.link_ready = true;
>>>> -       } else {
>>>> -               dp->dp_display.link_ready = false;
>>>> -               dp_display_handle_plugged_change(dp_display, false);
>>>> -       }
>>>> -
>>>> -       drm_dbg_dp(dp->drm_dev,
>>>> -               "After, type=%d sink=%d conn=%d core_init=%d phy_init=%d power=%d\n",
>>>> -               dp->dp_display.connector_type, dp->link->sink_count,
>>>> -               dp->dp_display.link_ready, dp->core_initialized,
>>>> -               dp->phy_initialized, dp_display->power_on);
>>>> -
>>>> -       mutex_unlock(&dp->event_mutex);
>>>> -
>>>> -       return 0;
>>>> -}
>>>> -
>>>> -static int dp_pm_suspend(struct device *dev)
>>>> -{
>>>> -       struct platform_device *pdev = to_platform_device(dev);
>>>> -       struct msm_dp *dp_display = platform_get_drvdata(pdev);
>>>> -       struct dp_display_private *dp;
>>>> -
>>>> -       dp = container_of(dp_display, struct dp_display_private, dp_display);
>>>> -
>>>> -       mutex_lock(&dp->event_mutex);
>>>> -
>>>> -       drm_dbg_dp(dp->drm_dev,
>>>> -               "Before, type=%d core_inited=%d  phy_inited=%d power_on=%d\n",
>>>> -               dp->dp_display.connector_type, dp->core_initialized,
>>>> -               dp->phy_initialized, dp_display->power_on);
>>>> -
>>>> -       /* mainlink enabled */
>>>> -       if (dp_power_clk_status(dp->power, DP_CTRL_PM))
>>>> -               dp_ctrl_off_link_stream(dp->ctrl);
>>>> -
>>>> -       dp_display_host_phy_exit(dp);
>>> I was under the impression that dp_pm_runtime_suspend / _resume
>>> functions perform phy init/exit only in eDP cases. Can we really drop
>>> the main suspend/resume functions?
>> yes on eDP case since it is embedded.
> Let me ask the same question in a different way:
>
> dp_pm_suspend() / dp_pm_resume() functions contain several calls to DP
> functions. Why can we drop them now? Maybe they had to be dropped in
> one of the previous patches, when you have added proper runtime PM
> support?
>
> Could you please confirm that after each patch the DP driver is
> working, that there are no hidden dependencies between patches?

patch #5 ==>  drm/msm/dp: incorporate pm_runtime framework into DP driver

patch #6 ==> drm/msm/dp: delete EV_HPD_INIT_SETUP

patch #7 ==>  drm/msm/dp: add pm_runtime_force_suspend()/resume() <== 
both dp_pm_suspend() and dp_pm_resume() are dropped here


Patch #5 is this patch and dp_pm_suspend() and dp_pm_resume() still kept.

patch #7 drop both dp_pm_suspend() and dp_pm_resume().

In order to keep every patch work for  suspend/resume test, I drop 
dp_pm_susend() and dp_pm_resuem() at patch #7.

yes, i confirm each patch DP driver is working.


>
>> for external DP case, there are two steps
>>
>> step 1: enable DP controller's  hpd block and start waiting for hpd
>> interrupts at dp_display_hpd_enable()
The step number I mentioned here is for hpd_internal == true case.
> Step 1 should be optional. DP should be functional even if the
> .hpd_enable was not called. Have you tested this usecase?

yes, for hpd_internal == false, step #1 is not required.

however I do not have device to test it.

But i think it should work since  pm_runtime_resume_and_get() and 
pm_runtime_put_sync() to dp_hpd_plug_handle() and dp_hpd_unplug_handle() 
respectively.




>> step 2:  at plugin interrupts,  dp_display_host_phy_init()
>>
>> step 3: at unplug interrupt: dp_bridge_atomic_post_disable()
>> dp_display_host_phy_exi()
>>
>> at runtime, there is loop between step 2 and step 3
>>
>> step  4: disable DP controller's  hpd block
>>
>>>> -
>>>> -       /* host_init will be called at pm_resume */
>>>> -       dp_display_host_deinit(dp);
>>>> -
>>>> -       dp->hpd_state = ST_SUSPENDED;
>>>> -
>>>> -       drm_dbg_dp(dp->drm_dev,
>>>> -               "After, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
>>>> -               dp->dp_display.connector_type, dp->core_initialized,
>>>> -               dp->phy_initialized, dp_display->power_on);
>>>> -
>>>> -       mutex_unlock(&dp->event_mutex);
>>>> -
>>>> -       return 0;
>>>> -}
>>>> -
>>>>    static const struct dev_pm_ops dp_pm_ops = {
>>>>           SET_RUNTIME_PM_OPS(dp_pm_runtime_suspend, dp_pm_runtime_resume, NULL)
>>>> -       .suspend = dp_pm_suspend,
>>>> -       .resume =  dp_pm_resume,
>>>> +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>>>> +                                pm_runtime_force_resume)
>>>>    };
>>>>
>>>>    static struct platform_driver dp_display_driver = {
>>>> @@ -1658,9 +1557,6 @@ void dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>>>>
>>>>           dp_display = container_of(dp, struct dp_display_private, dp_display);
>>>>
>>>> -       if (dp->is_edp)
>>>> -               dp_hpd_unplug_handle(dp_display, 0);
>>> Why?
>> dp_hpd_unplug_handle() does not tear down phy.
>>
>> Therefore eDP does not need to call unplug handle.
> I don't fully understand your argument here. Could you please
> describe, why this function call was necessary beforehand and what is
> being changed now, so that it becomes unnecessary?

dp_hpd_unplug_handle() is not necessary for eDP from very beginning 
since dp_bridge_atomic_enable() do it all (tear down link and phy).

I think it was added long time ago mistakenly  just like to be 
compatible with external DP since external DP always have 
dp_hpd_unplug_handle() called from irq_handle().

i can restore it back if you insist it.


>>
>>
>>>> -
>>>>           mutex_lock(&dp_display->event_mutex);
>>>>
>>>>           state = dp_display->hpd_state;
>>>> @@ -1748,6 +1644,7 @@ void dp_bridge_hpd_disable(struct drm_bridge *bridge)
>>>>           dp_catalog_ctrl_hpd_disable(dp->catalog);
>>>>
>>>>           dp_display->internal_hpd = false;
>>>> +       dp->hpd_state = ST_DISCONNECTED;
>>> Why? We have only disabled sending of the HPD events. The dongle might
>>> still be connected.
>> dp_bridge_hpd_disable() disable dp controller hpd block (no more hpd
>> interrupt will be received).
>>
>> dp_bridge_hpd_disable() should happen after DP main link had been teared
>> down already.
> No, this assumption is incorrect. hpd_disable can happen at any point
> during runtime.
> It merely disables HPD interrupt generation, it has nothing to do with
> the DP block being enabled or not.
>
>> Therefore hpd_state need to be in default state so that next plugin
>> handle will be start with correct state.
>>
>>
>>>>           pm_runtime_mark_last_busy(&dp->pdev->dev);
>>>>           pm_runtime_put_autosuspend(&dp->pdev->dev);
>>>> --
>>>> 2.7.4
>>>>
>>> --
>>> With best wishes
>>>
>>> Dmitry
>
>
