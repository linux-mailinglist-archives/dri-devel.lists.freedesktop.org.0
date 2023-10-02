Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2F67B5D4F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 00:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203EA10E09D;
	Mon,  2 Oct 2023 22:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAEB010E09D;
 Mon,  2 Oct 2023 22:49:00 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 392McLfV020644; Mon, 2 Oct 2023 22:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=QuE+ci5Op5Lu2yLu0g5n/bSr1mhaEnGGKvAkXjRhft4=;
 b=o+FwZkH/3sW5sgqUZGExA07azHan69V1EbnpDjXntS5Xs/lfto4kvdTp50T5g/Kkdl5s
 ipc2uHKFB73Hs1TlyKTKjGb/ko6awfudISzs6LuVbdXc28iS3BZXBQ1DcYYku8OfELQP
 UK31qm08HMTNVMMhsj/aS2oOsxuKqmvmyWJX0A6cEqKevVaXHiHAPE+UJfqDgM/M70wB
 9ZKZ6AnXolfcEYIDEOoRJVkCSu6uGXYtk2cBsfmsMKaPRfSUt+fqNW87LYvihvvZ2RCa
 xSV2ZE4nutLhaSMqY8UBlGWAZcSx5BF7JkGfy9eo2QDG9srNsxtAeMbrtf/xNRFwSycO qA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3te9cmn5dt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Oct 2023 22:48:44 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 392MmhXW020703
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 2 Oct 2023 22:48:43 GMT
Received: from [10.110.36.217] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 2 Oct
 2023 15:48:42 -0700
Message-ID: <f55ae4d0-f051-9bce-e571-11613cae2465@quicinc.com>
Date: Mon, 2 Oct 2023 15:48:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 5/8] drm/msm/dp: incorporate pm_runtime framework into
 DP driver
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1695848028-18023-1-git-send-email-quic_khsieh@quicinc.com>
 <1695848028-18023-6-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpptTDQVO189OcXqJw+VN+1EkgaQd6TJwcGpGxdYTR1vhQ@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJpptTDQVO189OcXqJw+VN+1EkgaQd6TJwcGpGxdYTR1vhQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: i0bRSOs3EZGmdvbu4FpmT4jdaHs-SKbW
X-Proofpoint-ORIG-GUID: i0bRSOs3EZGmdvbu4FpmT4jdaHs-SKbW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-02_15,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310020176
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


On 9/27/2023 2:41 PM, Dmitry Baryshkov wrote:
> On Wed, 27 Sept 2023 at 23:54, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>> Currently DP driver is executed independent of PM runtime framework.
>> This lead to msm edp panel can not be detected by edp_panel driver at
>> generic_edp_panel_probe() due to aux dpcd read failed at msm edp driver.
> eDP, AUX, DPCD. leads. not being detected, s/at/during.
>
> Also there is no msm eDP driver.
>
>> Incorporating pm runtime framework into DP driver so that both power and
> Incorporate. PM
>
>> clocks to enable/disable host controller fits with PM runtime mechanism.
> Ugh?
>
>> Once pm runtime framework is incorporated into DP driver, wake up device
> waking
>
>> from power up path is not necessary. Hence remove it.
>> Since DP is part of user interface, we choice to use autosuspend feature
>> with timer of one second. pm runtime suspends is prevented from happening
>> until timer expired.
> No, this is not the right reason to use autosuspend. Please use normal
> suspend unless there is a performance regression caused by the
> suspend/resume paths.
>
>> Changes in v4:
>> -- reworded commit text to explain why pm_framework is required for edp panel
>> -- reworded commit text to explain autosuspend is choiced
>> -- delete EV_POWER_PM_GET and PM_EV_POWER_PUT from changes #3
>> -- delete dp_display_pm_get() and dp_display_pm_Put() from changes #3
>> -- return value from pm_runtime_resume_and_get() directly
>> -- check return value of devm_pm_runtime_enable()
>> -- delete pm_runtime_xxx from dp_display_remove()
>> -- drop dp_display_host_init() from EV_HPD_INIT_SETUP
>>
>> Changes in v3:
>> -- incorporate removing pm_runtime_xx() from dp_pwer.c to this patch
>> -- use pm_runtime_resume_and_get() instead of pm_runtime_get()
>> -- error checking pm_runtime_resume_and_get() return value
>> -- add EV_POWER_PM_GET and PM_EV_POWER_PUT to handle HPD_GPIO case
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> Reported-by: kernel test robot <lkp@intel.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_aux.c     |  6 +++
>>   drivers/gpu/drm/msm/dp/dp_display.c | 95 +++++++++++++++++++++++++++----------
>>   drivers/gpu/drm/msm/dp/dp_power.c   | 16 -------
>>   drivers/gpu/drm/msm/dp/dp_power.h   | 11 -----
>>   4 files changed, 77 insertions(+), 51 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
>> index 8e3b677..22eb774 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
>> @@ -291,6 +291,10 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>>                  return -EINVAL;
>>          }
>>
>> +       ret = pm_runtime_resume_and_get(dp_aux->dev);
>> +       if (ret)
>> +               return  ret;
>> +
>>          mutex_lock(&aux->mutex);
>>          if (!aux->initted) {
>>                  ret = -EIO;
>> @@ -364,6 +368,8 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>>
>>   exit:
>>          mutex_unlock(&aux->mutex);
>> +       pm_runtime_mark_last_busy(dp_aux->dev);
>> +       pm_runtime_put_autosuspend(dp_aux->dev);
>>
>>          return ret;
>>   }
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 3ef141c..bfb4692 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -276,8 +276,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
>>          dp->dp_display.drm_dev = drm;
>>          priv->dp[dp->id] = &dp->dp_display;
>>
>> -
>> -
> Is this also a part of pm_runtime support? No, it is not.
>
>>          dp->drm_dev = drm;
>>          dp->aux->drm_dev = drm;
>>          rc = dp_aux_register(dp->aux);
>> @@ -286,7 +284,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
>>                  goto end;
>>          }
>>
>> -
> And this. If you want to clean up stray empty lines, please split that
> to a separate patch.
>
>>          rc = dp_register_audio_driver(dev, dp->audio);
>>          if (rc) {
>>                  DRM_ERROR("Audio registration Dp failed\n");
>> @@ -310,15 +307,10 @@ static void dp_display_unbind(struct device *dev, struct device *master,
>>          struct dp_display_private *dp = dev_get_dp_display_private(dev);
>>          struct msm_drm_private *priv = dev_get_drvdata(master);
>>
>> -       /* disable all HPD interrupts */
>> -       if (dp->core_initialized)
>> -               dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
>> -
>>          kthread_stop(dp->ev_tsk);
>>
>>          of_dp_aux_depopulate_bus(dp->aux);
>>
>> -       dp_power_client_deinit(dp->power);
>>          dp_unregister_audio_driver(dev, dp->audio);
>>          dp_aux_unregister(dp->aux);
>>          dp->drm_dev = NULL;
>> @@ -460,6 +452,16 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
>>   static int dp_display_usbpd_configure_cb(struct device *dev)
>>   {
>>          struct dp_display_private *dp = dev_get_dp_display_private(dev);
>> +       int ret;
>> +
>> +       if (!dp->dp_display.internal_hpd) {
> I'd say, drop the condition here.
>
>> +               /* hpd through gpio */
> Why? !internal_hpd means any possible way of delivering an HPD event.
> For example, via the USB-C TCPM.
>
>> +               ret = pm_runtime_resume_and_get(&dp->pdev->dev);
> Which function contains corresponding pm_runtime_put()?
>
>> +               if (ret) {
>> +                       DRM_ERROR("failed to start power\n");
> failed to resume
>
>> +                       return ret;
>> +               }
>> +       }
>>
>>          dp_display_host_phy_init(dp);
>>
>> @@ -1086,7 +1088,6 @@ static int hpd_event_thread(void *data)
>>
>>                  switch (todo->event_id) {
>>                  case EV_HPD_INIT_SETUP:
>> -                       dp_display_host_init(dp_priv);
>>                          break;
>>                  case EV_HPD_PLUG_INT:
>>                          dp_hpd_plug_handle(dp_priv, todo->data);
>> @@ -1263,6 +1264,13 @@ static int dp_display_probe(struct platform_device *pdev)
>>
>>          platform_set_drvdata(pdev, &dp->dp_display);
>>
>> +       rc = devm_pm_runtime_enable(&pdev->dev);
>> +       if (rc)
>> +               return rc;
> Missing submodules deinit.
>
>> +
>> +       pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
>> +       pm_runtime_use_autosuspend(&pdev->dev);
>> +
>>          rc = dp_display_request_irq(dp);
>>          if (rc)
>>                  return rc;
>> @@ -1285,6 +1293,34 @@ static int dp_display_remove(struct platform_device *pdev)
>>
>>          platform_set_drvdata(pdev, NULL);
>>
>> +       dp_display_deinit_sub_modules(dp);
> There is already a call to dp_display_deinit_sub_modules() in
> dp_display_remove().
>> +
>> +       return 0;
>> +}
>> +
>> +static int dp_pm_runtime_suspend(struct device *dev)
>> +{
>> +       struct dp_display_private *dp = dev_get_dp_display_private(dev);
>> +
>> +       if (dp->dp_display.is_edp) {
>> +               dp_display_host_phy_exit(dp);
>> +               dp_catalog_ctrl_hpd_disable(dp->catalog);
>> +       }
> I don't see where this code was removed.

this code block is adapted from dp_pm_suspend().

dp_pm_suspend() will be removed at "add 
pm_runtime_force_suspend()/resume()" patch.

>
>> +       dp_display_host_deinit(dp);
>> +
>> +       return 0;
>> +}
>> +
>> +static int dp_pm_runtime_resume(struct device *dev)
>> +{
>> +       struct dp_display_private *dp = dev_get_dp_display_private(dev);
>> +
>> +       dp_display_host_init(dp);
>> +       if (dp->dp_display.is_edp) {
>> +               dp_catalog_ctrl_hpd_enable(dp->catalog);
>> +               dp_display_host_phy_init(dp);
>> +       }
>> +
>>          return 0;
>>   }
>>
>> @@ -1389,6 +1425,7 @@ static int dp_pm_suspend(struct device *dev)
>>   }
>>
>>   static const struct dev_pm_ops dp_pm_ops = {
>> +       SET_RUNTIME_PM_OPS(dp_pm_runtime_suspend, dp_pm_runtime_resume, NULL)
>>          .suspend = dp_pm_suspend,
>>          .resume =  dp_pm_resume,
>>   };
>> @@ -1473,10 +1510,6 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>>          aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
>>
>>          if (aux_bus && dp->is_edp) {
>> -               dp_display_host_init(dp_priv);
>> -               dp_catalog_ctrl_hpd_enable(dp_priv->catalog);
>> -               dp_display_host_phy_init(dp_priv);
>> -
>>                  /*
>>                   * The code below assumes that the panel will finish probing
>>                   * by the time devm_of_dp_aux_populate_ep_devices() returns.
>> @@ -1578,6 +1611,11 @@ void dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>>                  dp_hpd_plug_handle(dp_display, 0);
>>
>>          mutex_lock(&dp_display->event_mutex);
>> +       if (pm_runtime_resume_and_get(&dp_display->pdev->dev)) {
>> +               DRM_ERROR("failed to start power\n");
> failed to resume.
>
>> +               mutex_unlock(&dp_display->event_mutex);
>> +               return;
>> +       }
>>
>>          state = dp_display->hpd_state;
>>          if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) {
>> @@ -1642,10 +1680,9 @@ void dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>>          mutex_lock(&dp_display->event_mutex);
>>
>>          state = dp_display->hpd_state;
>> -       if (state != ST_DISCONNECT_PENDING && state != ST_CONNECTED) {
>> -               mutex_unlock(&dp_display->event_mutex);
>> -               return;
>> -       }
>> +       if (state != ST_DISCONNECT_PENDING && state != ST_CONNECTED)
>> +               drm_dbg_dp(dp->drm_dev, "type=%d wrong hpd_state=%d\n",
>> +                          dp->connector_type, state);
>>
>>          dp_display_disable(dp_display);
>>
>> @@ -1658,6 +1695,9 @@ void dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>>          }
>>
>>          drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
>> +
>> +       pm_runtime_mark_last_busy(&dp_display->pdev->dev);
>> +       pm_runtime_put_autosuspend(&dp_display->pdev->dev);
>>          mutex_unlock(&dp_display->event_mutex);
>>   }
>>
>> @@ -1697,6 +1737,12 @@ void dp_bridge_hpd_enable(struct drm_bridge *bridge)
>>          struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
>>
>>          mutex_lock(&dp->event_mutex);
>> +       if (pm_runtime_resume_and_get(&dp->pdev->dev)) {
>> +               DRM_ERROR("failed to start power\n");
>> +               mutex_unlock(&dp->event_mutex);
>> +               return;
>> +       }
>> +
>>          dp_catalog_ctrl_hpd_enable(dp->catalog);
>>
>>          /* enable HDP interrupts */
>> @@ -1718,6 +1764,9 @@ void dp_bridge_hpd_disable(struct drm_bridge *bridge)
>>          dp_catalog_ctrl_hpd_disable(dp->catalog);
>>
>>          dp_display->internal_hpd = false;
>> +
>> +       pm_runtime_mark_last_busy(&dp->pdev->dev);
>> +       pm_runtime_put_autosuspend(&dp->pdev->dev);
>>          mutex_unlock(&dp->event_mutex);
>>   }
>>
>> @@ -1732,13 +1781,11 @@ void dp_bridge_hpd_notify(struct drm_bridge *bridge,
>>          if (dp_display->internal_hpd)
>>                  return;
>>
>> -       if (!dp->core_initialized) {
>> -               drm_dbg_dp(dp->drm_dev, "not initialized\n");
>> -               return;
>> -       }
>> -
>> -       if (!dp_display->link_ready && status == connector_status_connected)
>> +       /* hpd through gpio */
> Lack of the comment might be better than the incorrect comment.
>
>> +       if (!dp_display->link_ready && status == connector_status_connected) {
>> +               dp->hpd_state = ST_DISCONNECTED;
> Is this also a part of pm_runtime support?

yes, this is for hpd_internal == false case.

The hpd_state need to be at init state.

>
>>                  dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
>> -       else if (dp_display->link_ready && status == connector_status_disconnected)
>> +       } else if (dp_display->link_ready && status == connector_status_disconnected) {
>>                  dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
>> +       }
>>   }
>> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
>> index 5cb84ca..863c766 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_power.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
>> @@ -152,20 +152,9 @@ int dp_power_client_init(struct dp_power *dp_power)
>>
>>          power = container_of(dp_power, struct dp_power_private, dp_power);
>>
>> -       pm_runtime_enable(power->dev);
>> -
>>          return dp_power_clk_init(power);
>>   }
>>
>> -void dp_power_client_deinit(struct dp_power *dp_power)
>> -{
>> -       struct dp_power_private *power;
>> -
>> -       power = container_of(dp_power, struct dp_power_private, dp_power);
>> -
>> -       pm_runtime_disable(power->dev);
>> -}
>> -
>>   int dp_power_init(struct dp_power *dp_power)
>>   {
>>          int rc = 0;
>> @@ -173,11 +162,7 @@ int dp_power_init(struct dp_power *dp_power)
>>
>>          power = container_of(dp_power, struct dp_power_private, dp_power);
>>
>> -       pm_runtime_get_sync(power->dev);
>> -
>>          rc = dp_power_clk_enable(dp_power, DP_CORE_PM, true);
>> -       if (rc)
>> -               pm_runtime_put_sync(power->dev);
>>
>>          return rc;
>>   }
>> @@ -189,7 +174,6 @@ int dp_power_deinit(struct dp_power *dp_power)
>>          power = container_of(dp_power, struct dp_power_private, dp_power);
>>
>>          dp_power_clk_enable(dp_power, DP_CORE_PM, false);
>> -       pm_runtime_put_sync(power->dev);
>>          return 0;
>>   }
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_power.h b/drivers/gpu/drm/msm/dp/dp_power.h
>> index a3dec20..55ada51 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_power.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_power.h
>> @@ -81,17 +81,6 @@ int dp_power_clk_enable(struct dp_power *power, enum dp_pm_type pm_type,
>>   int dp_power_client_init(struct dp_power *power);
>>
>>   /**
>> - * dp_power_clinet_deinit() - de-initialize clock and regulator modules
>> - *
>> - * @power: instance of power module
>> - * return: 0 for success, error for failure.
>> - *
>> - * This API will de-initialize the DisplayPort's clocks and regulator
>> - * modules.
>> - */
>> -void dp_power_client_deinit(struct dp_power *power);
>> -
>> -/**
>>    * dp_power_get() - configure and get the DisplayPort power module data
>>    *
>>    * @parser: instance of parser module
>> --
>> 2.7.4
>>
>
