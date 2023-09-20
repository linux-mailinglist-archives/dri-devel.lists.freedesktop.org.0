Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7994A7A8F9A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 00:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E8110E54B;
	Wed, 20 Sep 2023 22:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9C610E54B;
 Wed, 20 Sep 2023 22:46:49 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38KMeDKk018555; Wed, 20 Sep 2023 22:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=5PP8wcWR6zQGvHtfw/aZdhlV+JUGqGnfQeq1CUzqJSk=;
 b=KVTla2pkmguc5LVPmLVEcEQgCM6Ba/R12qw6GdyQqzNVvXSBv0kdbcJEbGTWpdR/EBYL
 aLgbecj+WFubL+qlylaiwbfhUh4fE4QTanR0BhUralLlp25R2GBBKG/0ewOoxfK5MTku
 Pf3eD4DxRMmgziwFybsAK44dTZ+qob9Jnxb+4oaKLxKYrZdsShIuoo5Ckmzu6B4gQtLw
 02gz/iRaGR+l+m27VTKO6w8f1lqIZ8DH6LViZE1oJy8qT30oX1k0GKdyjyfhZfAJYRFa
 Ko++KNnkTPwubZAwsqVB7/LtmX8xkRNdkJnFrcnjmuEo5qw/uYNx84yOQZ8GYTw6S957 yw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t875108vt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Sep 2023 22:46:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38KMkYu5009887
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Sep 2023 22:46:34 GMT
Received: from [10.110.124.221] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 20 Sep
 2023 15:46:33 -0700
Message-ID: <febc4aaf-c36c-b683-d1c5-403279bd980a@quicinc.com>
Date: Wed, 20 Sep 2023 15:46:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 4/7] drm/msm/dp: incorporate pm_runtime framework into
 DP driver
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1694813901-26952-1-git-send-email-quic_khsieh@quicinc.com>
 <1694813901-26952-5-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJprxf5RBfuiJVJsfnb7buC9Mbxr=U7VSaPRc1+OMJcBFZg@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJprxf5RBfuiJVJsfnb7buC9Mbxr=U7VSaPRc1+OMJcBFZg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: qDOVYOYykcjUf6zvDv-kWTRk6dxufKPf
X-Proofpoint-ORIG-GUID: qDOVYOYykcjUf6zvDv-kWTRk6dxufKPf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-20_11,2023-09-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 phishscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309200191
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


On 9/15/2023 6:07 PM, Dmitry Baryshkov wrote:
> On Sat, 16 Sept 2023 at 00:38, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>> Currently DP driver is executed independent of PM runtime framework.
>> This lead DP driver incompatible with others. Incorporating pm runtime
> Why is it incompatible? Which others are mentioned here?
>
>> framework into DP driver so that both power and clocks to enable/disable
>> host controller fits with PM runtime mechanism. Once pm runtime framework
>> is incorporated into DP driver, wake up device from power up path is not
>> necessary. Hence remove it. Both EV_POWER_PM_GET and EV_POWER_PM_PUT events
>> are introduced to perform pm runtime control for the HPD GPIO routing to a
>> display-connector case.
>>
>> Changes in v3:
>> -- incorporate removing pm_runtime_xx() from dp_pwer.c to this patch
>> -- use pm_runtime_resume_and_get() instead of pm_runtime_get()
>> -- error checking pm_runtime_resume_and_get() return value
>> -- add EV_POWER_PM_GET and PM_EV_POWER_PUT to handle HPD_GPIO case
> Previous changelog?
>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_aux.c     |   5 ++
>>   drivers/gpu/drm/msm/dp/dp_display.c | 114 +++++++++++++++++++++++++++---------
>>   drivers/gpu/drm/msm/dp/dp_power.c   |   9 ---
>>   3 files changed, 90 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
>> index 8e3b677..8fa93c5 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
>> @@ -291,6 +291,9 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>>                  return -EINVAL;
>>          }
>>
>> +       if (pm_runtime_resume_and_get(dp_aux->dev))
>> +               return  -EINVAL;
> Please propagate error values instead of reinventing them.
>
>> +
>>          mutex_lock(&aux->mutex);
>>          if (!aux->initted) {
>>                  ret = -EIO;
>> @@ -364,6 +367,8 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>>
>>   exit:
>>          mutex_unlock(&aux->mutex);
>> +       pm_runtime_mark_last_busy(dp_aux->dev);
>> +       pm_runtime_put_autosuspend(dp_aux->dev);
> What is the reason for using autosuspend? Such design decisions should
> be described in the commit message.
>
>>          return ret;
>>   }
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 59f9d85..e7af7f7 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -60,6 +60,8 @@ enum {
>>          EV_IRQ_HPD_INT,
>>          EV_HPD_UNPLUG_INT,
>>          EV_USER_NOTIFICATION,
>> +       EV_POWER_PM_GET,
>> +       EV_POWER_PM_PUT,
>>   };
>>
>>   #define EVENT_TIMEOUT  (HZ/10) /* 100ms */
>> @@ -276,13 +278,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
>>          dp->dp_display.drm_dev = drm;
>>          priv->dp[dp->id] = &dp->dp_display;
>>
>> -       rc = dp->parser->parse(dp->parser);
>> -       if (rc) {
>> -               DRM_ERROR("device tree parsing failed\n");
>> -               goto end;
>> -       }
>> -
>> -
>>          dp->drm_dev = drm;
>>          dp->aux->drm_dev = drm;
>>          rc = dp_aux_register(dp->aux);
>> @@ -291,12 +286,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
>>                  goto end;
>>          }
>>
>> -       rc = dp_power_client_init(dp->power);
>> -       if (rc) {
>> -               DRM_ERROR("Power client create failed\n");
>> -               goto end;
>> -       }
>> -
>>          rc = dp_register_audio_driver(dev, dp->audio);
>>          if (rc) {
>>                  DRM_ERROR("Audio registration Dp failed\n");
>> @@ -320,10 +309,6 @@ static void dp_display_unbind(struct device *dev, struct device *master,
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
>> @@ -467,6 +452,18 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
>>          dp->core_initialized = false;
>>   }
>>
>> +static void dp_display_pm_get(struct dp_display_private *dp)
>> +{
>> +       if (pm_runtime_resume_and_get(&dp->pdev->dev))
>> +               DRM_ERROR("failed to start power\n");
>> +}
> Huge NAK here. This means that the error is completely ignored (other
> than being dumped to the log). This is a short path to Sync error and
> other kinds of reboot.
>
>> +
>> +static void dp_display_pm_put(struct dp_display_private *dp)
>> +{
>> +       pm_runtime_mark_last_busy(&dp->pdev->dev);
>> +       pm_runtime_put_autosuspend(&dp->pdev->dev);
>> +}
>> +
>>   static int dp_display_usbpd_configure_cb(struct device *dev)
>>   {
>>          struct dp_display_private *dp = dev_get_dp_display_private(dev);
>> @@ -1096,7 +1093,6 @@ static int hpd_event_thread(void *data)
>>
>>                  switch (todo->event_id) {
>>                  case EV_HPD_INIT_SETUP:
>> -                       dp_display_host_init(dp_priv);
>>                          break;
>>                  case EV_HPD_PLUG_INT:
>>                          dp_hpd_plug_handle(dp_priv, todo->data);
>> @@ -1111,6 +1107,12 @@ static int hpd_event_thread(void *data)
>>                          dp_display_send_hpd_notification(dp_priv,
>>                                                  todo->data);
>>                          break;
>> +               case EV_POWER_PM_GET:
>> +                       dp_display_pm_get(dp_priv);
>> +                       break;
>> +               case EV_POWER_PM_PUT:
>> +                       dp_display_pm_put(dp_priv);
>> +                       break;
> No. runtime_get / runtime_put are not HPD events. They should be
> executed directly from the place where the drivers needs the device to
> be powered up.
>
>>                  default:
>>                          break;
>>                  }
>> @@ -1251,6 +1253,18 @@ static int dp_display_probe(struct platform_device *pdev)
>>                  return -EPROBE_DEFER;
>>          }
>>
>> +       rc = dp->parser->parse(dp->parser);
>> +       if (rc) {
>> +               DRM_ERROR("device tree parsing failed\n");
>> +               return -EPROBE_DEFER;
>> +       }
>> +
>> +       rc = dp_power_client_init(dp->power);
>> +       if (rc) {
>> +               DRM_ERROR("Power client create failed\n");
>> +               return -EPROBE_DEFER;
>> +       }
> Why? This moves resource allocation to the probe function, which is
> irrelevant to the pm_runtime code. If this is required, you can move
> these changes to a separate patch.
>
>> +
>>          /* setup event q */
>>          mutex_init(&dp->event_mutex);
>>          init_waitqueue_head(&dp->event_q);
>> @@ -1263,6 +1277,10 @@ static int dp_display_probe(struct platform_device *pdev)
>>
>>          platform_set_drvdata(pdev, &dp->dp_display);
>>
>> +       devm_pm_runtime_enable(&pdev->dev);
> error code handling?
>
>> +       pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
>> +       pm_runtime_use_autosuspend(&pdev->dev);
>> +
>>          rc = dp_display_request_irq(dp);
>>          if (rc)
>>                  return rc;
>> @@ -1285,6 +1303,36 @@ static int dp_display_remove(struct platform_device *pdev)
>>
>>          platform_set_drvdata(pdev, NULL);
>>
>> +       pm_runtime_put_sync_suspend(&pdev->dev);
> Why? Who is holding the pm count here?
>
>> +       pm_runtime_dont_use_autosuspend(&pdev->dev);
>> +       pm_runtime_disable(&pdev->dev);
> Why do you need _disable if you have a devm_pm_runtime_enable()? Not
> to mention that pm_runtime_disable_action() already has a call to
> pm_runtime_dont_use_autosuspend()
>
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
>> @@ -1389,6 +1437,7 @@ static int dp_pm_suspend(struct device *dev)
>>   }
>>
>>   static const struct dev_pm_ops dp_pm_ops = {
>> +       SET_RUNTIME_PM_OPS(dp_pm_runtime_suspend, dp_pm_runtime_resume, NULL)
>>          .suspend = dp_pm_suspend,
>>          .resume =  dp_pm_resume,
>>   };
>> @@ -1473,10 +1522,6 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
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
>> @@ -1578,6 +1623,11 @@ void dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>>                  dp_hpd_plug_handle(dp_display, 0);
>>
>>          mutex_lock(&dp_display->event_mutex);
>> +       if (pm_runtime_resume_and_get(&dp_display->pdev->dev)) {
>> +               DRM_ERROR("failed to start power\n");
>> +               mutex_unlock(&dp_display->event_mutex);
>> +               return;
>> +       }
>>
>>          state = dp_display->hpd_state;
>>          if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) {
>> @@ -1658,6 +1708,8 @@ void dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>>          }
>>
>>          drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
>> +
>> +       pm_runtime_put_sync(&dp_display->pdev->dev);
> So, no autosuspend now?
>
> Also, I think we can get an unbalanced runtime status, as there is no
> guarantee that atomic_enable / atomic_disable will be paired. Please
> correct me if I'm wrong.

  I always assume atomic_enable / atomic_disable should be paired.
Otherwise nothing will work.
Could you please give me example what situations they are not paired?

> And also there is a possible return earlier in this function. The
> driver will leak the runtime status again.
>
>>          mutex_unlock(&dp_display->event_mutex);
>>   }
>>
>> @@ -1697,6 +1749,9 @@ void dp_bridge_hpd_enable(struct drm_bridge *bridge)
>>          struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
>>
>>          mutex_lock(&dp->event_mutex);
>> +       if (pm_runtime_resume_and_get(&dp->pdev->dev))
>> +               DRM_ERROR("failed to start power\n");
> Return?
>
>> +
>>          dp_catalog_ctrl_hpd_enable(dp->catalog);
>>
>>          /* enable HDP interrupts */
>> @@ -1718,6 +1773,9 @@ void dp_bridge_hpd_disable(struct drm_bridge *bridge)
>>          dp_catalog_ctrl_hpd_disable(dp->catalog);
>>
>>          dp_display->internal_hpd = false;
>> +
>> +       pm_runtime_mark_last_busy(&dp->pdev->dev);
>> +       pm_runtime_put_autosuspend(&dp->pdev->dev);
>>          mutex_unlock(&dp->event_mutex);
>>   }
>>
>> @@ -1732,13 +1790,11 @@ void dp_bridge_hpd_notify(struct drm_bridge *bridge,
>>          if (dp_display->internal_hpd)
>>                  return;
>>
>> -       if (!dp->core_initialized) {
>> -               drm_dbg_dp(dp->drm_dev, "not initialized\n");
>> -               return;
>> -       }
>> -
>> -       if (!dp_display->link_ready && status == connector_status_connected)
>> +       if (!dp_display->link_ready && status == connector_status_connected) {
>> +               dp_add_event(dp, EV_POWER_PM_GET, 0, 0);
> Why? What for?
>
>>                  dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
>> -       else if (dp_display->link_ready && status == connector_status_disconnected)
>> +       } else if (dp_display->link_ready && status == connector_status_disconnected) {
>>                  dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
>> +               dp_add_event(dp, EV_POWER_PM_PUT, 0, 0);
>> +       }
>>   }
>> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
>> index 5cb84ca..ed2f62a 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_power.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
>> @@ -152,8 +152,6 @@ int dp_power_client_init(struct dp_power *dp_power)
>>
>>          power = container_of(dp_power, struct dp_power_private, dp_power);
>>
>> -       pm_runtime_enable(power->dev);
>> -
>>          return dp_power_clk_init(power);
>>   }
>>
>> @@ -162,8 +160,6 @@ void dp_power_client_deinit(struct dp_power *dp_power)
>>          struct dp_power_private *power;
>>
>>          power = container_of(dp_power, struct dp_power_private, dp_power);
>> -
>> -       pm_runtime_disable(power->dev);
>>   }
>>
>>   int dp_power_init(struct dp_power *dp_power)
>> @@ -173,11 +169,7 @@ int dp_power_init(struct dp_power *dp_power)
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
>> @@ -189,7 +181,6 @@ int dp_power_deinit(struct dp_power *dp_power)
>>          power = container_of(dp_power, struct dp_power_private, dp_power);
>>
>>          dp_power_clk_enable(dp_power, DP_CORE_PM, false);
>> -       pm_runtime_put_sync(power->dev);
>>          return 0;
>>   }
>>
>> --
>> 2.7.4
>>
>
