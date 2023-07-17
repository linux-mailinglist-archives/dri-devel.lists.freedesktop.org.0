Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B72A9756F07
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 23:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C00A10E14E;
	Mon, 17 Jul 2023 21:39:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091C610E01F;
 Mon, 17 Jul 2023 21:39:22 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36HLOKPo008177; Mon, 17 Jul 2023 21:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+4plbTc90D++YLJzTRG1ZoFc7z0F4mkxD/R26Skqufc=;
 b=KAur8DRcUqjhu5TgUyzLCsBYheV5WT2EfhWY23EP+USCxTFW/dPqFIBRBIKLVlgGx9l7
 4DHNSiWyPWxPgIyW3/FLC8LNn3DEYTm9G0MX7Ef9POvPqP90+mb4jjdVlVfidVFh2ya7
 0ZhAnbSvsKRWIrqrX2XCnKqDlBWwf9crSNq68C2InWt2u0hTW8ZyLuezEhSwHU/nQjrS
 GxIOXX1cHQ6BvzonNmX0eI4Vd5XHCiBZZBF8J+PgM4V77Ft85wf8xZ/6yRm3KC1dc6zj
 WNk741ICavLmze93QBWl8N4XwBmQYUZyic7bEtHFbk9rDcMGlKFe5XlE7hXGafAoA14n nQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rw33mhjv7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jul 2023 21:39:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36HLdFk8023193
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jul 2023 21:39:15 GMT
Received: from [10.71.108.91] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 17 Jul
 2023 14:39:14 -0700
Message-ID: <db36d4c9-6863-f1ac-258f-4292f5e3700a@quicinc.com>
Date: Mon, 17 Jul 2023 14:39:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 2/5] drm/msm/dp: incorporate pm_runtime framework into
 DP driver
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <andersson@kernel.org>
References: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
 <1688773943-3887-3-git-send-email-quic_khsieh@quicinc.com>
 <c551f77f-804f-3e45-6b15-680c70b86d37@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <c551f77f-804f-3e45-6b15-680c70b86d37@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Ir9GxSWUGA_QzU90CRkk4eFe0OOUI4Or
X-Proofpoint-ORIG-GUID: Ir9GxSWUGA_QzU90CRkk4eFe0OOUI4Or
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_15,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307170195
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/7/2023 5:04 PM, Dmitry Baryshkov wrote:
> On 08/07/2023 02:52, Kuogee Hsieh wrote:
>> Incorporating pm runtime framework into DP driver so that power
>> and clock resource handling can be centralized allowing easier
>> control of these resources in preparation of registering aux bus
>> uring probe.
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_aux.c     |  3 ++
>>   drivers/gpu/drm/msm/dp/dp_display.c | 75 
>> +++++++++++++++++++++++++++++--------
>>   2 files changed, 63 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c 
>> b/drivers/gpu/drm/msm/dp/dp_aux.c
>> index 8e3b677..c592064 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
>> @@ -291,6 +291,7 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux 
>> *dp_aux,
>>           return -EINVAL;
>>       }
>>   +    pm_runtime_get_sync(dp_aux->dev);
>
> Let me quote the function's documentation:
> Consider using pm_runtime_resume_and_get() instead of it, especially 
> if its return value is checked by the caller, as this is likely to 
> result in cleaner code.
>
> So two notes concerning the whole patch:
> - error checking is missing
> - please use pm_runtime_resume_and_get() instead.
>
>>       mutex_lock(&aux->mutex);
>>       if (!aux->initted) {
>>           ret = -EIO;
>> @@ -364,6 +365,8 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux 
>> *dp_aux,
>>     exit:
>>       mutex_unlock(&aux->mutex);
>> +    pm_runtime_mark_last_busy(dp_aux->dev);
>> +    pm_runtime_put_autosuspend(dp_aux->dev);
>>         return ret;
>>   }
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 76f1395..2c5706a 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -309,6 +309,10 @@ static int dp_display_bind(struct device *dev, 
>> struct device *master,
>>           goto end;
>>       }
>>   +    pm_runtime_enable(dev);
>
> devm_pm_runtime_enable() removes need for a cleanup.
>
>> +    pm_runtime_set_autosuspend_delay(dev, 1000);
>> +    pm_runtime_use_autosuspend(dev);
>
> Why do you want to use autosuspend here?
>
>> +
>>       return 0;
>>   end:
>>       return rc;
>> @@ -320,9 +324,8 @@ static void dp_display_unbind(struct device *dev, 
>> struct device *master,
>>       struct dp_display_private *dp = dev_get_dp_display_private(dev);
>>       struct msm_drm_private *priv = dev_get_drvdata(master);
>>   -    /* disable all HPD interrupts */
>> -    if (dp->core_initialized)
>> -        dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, 
>> false);
>> +    pm_runtime_dont_use_autosuspend(dev);
>> +    pm_runtime_disable(dev);
>>         kthread_stop(dp->ev_tsk);
>>   @@ -466,10 +469,12 @@ static void dp_display_host_init(struct 
>> dp_display_private *dp)
>>           dp->dp_display.connector_type, dp->core_initialized,
>>           dp->phy_initialized);
>>   -    dp_power_init(dp->power);
>> -    dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
>> -    dp_aux_init(dp->aux);
>> -    dp->core_initialized = true;
>> +    if (!dp->core_initialized) {
>> +        dp_power_init(dp->power);
>> +        dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
>> +        dp_aux_init(dp->aux);
>> +        dp->core_initialized = true;
>> +    }
>
> Is this relevant to PM runtime? I don't think so.
>
>>   }
>>     static void dp_display_host_deinit(struct dp_display_private *dp)
>> @@ -478,10 +483,12 @@ static void dp_display_host_deinit(struct 
>> dp_display_private *dp)
>>           dp->dp_display.connector_type, dp->core_initialized,
>>           dp->phy_initialized);
>>   -    dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
>> -    dp_aux_deinit(dp->aux);
>> -    dp_power_deinit(dp->power);
>> -    dp->core_initialized = false;
>> +    if (dp->core_initialized) {
>> +        dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
>> +        dp_aux_deinit(dp->aux);
>> +        dp_power_deinit(dp->power);
>> +        dp->core_initialized = false;
>> +    }
>>   }
>>     static int dp_display_usbpd_configure_cb(struct device *dev)
>> @@ -1304,6 +1311,39 @@ static int dp_display_remove(struct 
>> platform_device *pdev)
>>       dp_display_deinit_sub_modules(dp);
>>         platform_set_drvdata(pdev, NULL);
>> +    pm_runtime_put_sync_suspend(&pdev->dev);
>> +
>> +    return 0;
>> +}
>> +
>> +static int dp_pm_runtime_suspend(struct device *dev)
>> +{
>> +    struct platform_device *pdev = to_platform_device(dev);
>> +    struct msm_dp *dp_display = platform_get_drvdata(pdev);
>> +    struct dp_display_private *dp;
>> +
>> +    dp = container_of(dp_display, struct dp_display_private, 
>> dp_display);
>> +
>> +    dp_display_host_phy_exit(dp);
>> +    dp_catalog_ctrl_hpd_enable(dp->catalog);
>
> What? NO!
>
>> +    dp_display_host_deinit(dp);
>> +
>> +    return 0;
>> +}
>> +
>> +static int dp_pm_runtime_resume(struct device *dev)
>> +{
>> +    struct platform_device *pdev = to_platform_device(dev);
>> +    struct msm_dp *dp_display = platform_get_drvdata(pdev);
>> +    struct dp_display_private *dp;
>> +
>> +    dp = container_of(dp_display, struct dp_display_private, 
>> dp_display);
>> +
>> +    dp_display_host_init(dp);
>> +    if (dp_display->is_edp) {
>> +        dp_catalog_ctrl_hpd_enable(dp->catalog);
>> +        dp_display_host_phy_init(dp);
>> +    }
>>         return 0;
>>   }
>> @@ -1409,6 +1449,7 @@ static int dp_pm_suspend(struct device *dev)
>>   }
>>     static const struct dev_pm_ops dp_pm_ops = {
>> +    SET_RUNTIME_PM_OPS(dp_pm_runtime_suspend, dp_pm_runtime_resume, 
>> NULL)
>>       .suspend = dp_pm_suspend,
>>       .resume =  dp_pm_resume,
>
> With the runtime PM in place, can we change suspend/resume to use 
> pm_runtime_force_suspend() and pm_runtime_force_resume() ?
>
>
>>   };
>> @@ -1493,10 +1534,6 @@ static int dp_display_get_next_bridge(struct 
>> msm_dp *dp)
>>       aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
>>         if (aux_bus && dp->is_edp) {
>> -        dp_display_host_init(dp_priv);
>> -        dp_catalog_ctrl_hpd_enable(dp_priv->catalog);
>> -        dp_display_host_phy_init(dp_priv);
>
> Are you going to populate the AUX bus (which can cause AUX bus access) 
> without waking up the device?

no,  pm_runtime_get_sync() will be called inside 
generic_edp_panel_probe() which will trigger dp_pm_runtime_resume() be 
called to wake up device (initialize dp host) before retrieve

panel_id from edp panel through aux bus.

>
>> -
>>           /*
>>            * The code below assumes that the panel will finish probing
>>            * by the time devm_of_dp_aux_populate_ep_devices() returns.
>> @@ -1604,6 +1641,7 @@ void dp_bridge_atomic_enable(struct drm_bridge 
>> *drm_bridge,
>>           dp_hpd_plug_handle(dp_display, 0);
>
> Nearly the same question. Resume device before accessing registers.
>
>> mutex_lock(&dp_display->event_mutex);
>> +    pm_runtime_get_sync(&dp_display->pdev->dev);
>>         state = dp_display->hpd_state;
>>       if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) {
>> @@ -1684,6 +1722,8 @@ void dp_bridge_atomic_post_disable(struct 
>> drm_bridge *drm_bridge,
>>       }
>>         drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
>> +
>> +    pm_runtime_put_sync(&dp_display->pdev->dev);
>>       mutex_unlock(&dp_display->event_mutex);
>>   }
>>   @@ -1723,6 +1763,8 @@ void dp_bridge_hpd_enable(struct drm_bridge 
>> *bridge)
>>       struct dp_display_private *dp = container_of(dp_display, struct 
>> dp_display_private, dp_display);
>>         mutex_lock(&dp->event_mutex);
>> +    pm_runtime_get_sync(&dp->pdev->dev);
>> +
>>       dp_catalog_ctrl_hpd_enable(dp->catalog);
>>         /* enable HDP interrupts */
>> @@ -1744,6 +1786,9 @@ void dp_bridge_hpd_disable(struct drm_bridge 
>> *bridge)
>>       dp_catalog_ctrl_hpd_disable(dp->catalog);
>>         dp_display->internal_hpd = false;
>> +
>> +    pm_runtime_mark_last_busy(&dp->pdev->dev);
>> +    pm_runtime_put_autosuspend(&dp->pdev->dev);
>>       mutex_unlock(&dp->event_mutex);
>>   }
>
