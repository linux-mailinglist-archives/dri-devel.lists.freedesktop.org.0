Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C737B6FAB
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 19:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E309510E304;
	Tue,  3 Oct 2023 17:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F08E10E013;
 Tue,  3 Oct 2023 17:25:11 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 393H7oRR005038; Tue, 3 Oct 2023 17:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ccZZHBINvKRglVotQHLxIkXLICZDXeFhlcScJlmx1ho=;
 b=ha6kIWFd6uDUNE6TFpXlVc+DWqUBzFCCVtaB49BPg++iQEKXKRvZ7yBGskxFg7L0oy1I
 2US5WJApwmYdUtdqNvfOJoOKwhFJxCeVeExnCcKQnQzK/zB17p0gDSwjOsOinRToZRRl
 tzcsr++JYaqFpKiH5ndr2kQsrYf5wiD2S74K/6GAaikTgGlXXJi1dIMVyx8JbpFDFcYW
 +W4jjUSXpma+yQ4k25cAzl5jh7p7gmfOTehZgcwiyma7oJVNbdinohuMiXvIyqkwfDIt
 gyIS52lajvGNTiWnw+1+Zch5+7Lidt03ryh1StAyRbCEEwL++cRSwSJK++dSudxqMUvO Jw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tec2epr19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Oct 2023 17:25:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 393HP4Rn012900
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 3 Oct 2023 17:25:04 GMT
Received: from [10.110.36.217] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 3 Oct
 2023 10:25:01 -0700
Message-ID: <2d8d4354-6dbb-e810-6efb-ca6b31f71b45@quicinc.com>
Date: Tue, 3 Oct 2023 10:25:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 8/8] drm/msm/dp: move of_dp_aux_populate_bus() to eDP
 probe()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1695848028-18023-1-git-send-email-quic_khsieh@quicinc.com>
 <1695848028-18023-9-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJprfjt7w+3YJAieBabuMso=-obRXss7-9Jrif23WmOJw5w@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJprfjt7w+3YJAieBabuMso=-obRXss7-9Jrif23WmOJw5w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: PZS0XwnQzerWinOmsPQH8rJ1kTlfQ0Ql
X-Proofpoint-ORIG-GUID: PZS0XwnQzerWinOmsPQH8rJ1kTlfQ0Ql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-03_15,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310030132
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


On 9/27/2023 2:57 PM, Dmitry Baryshkov wrote:
> On Wed, 27 Sept 2023 at 23:54, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>> Currently eDP population is done at msm_dp_modeset_init() which happen
>> at binding time. Move eDP population to be done at display probe time
>> so that probe deferral cases can be handled effectively.
>> wait_for_hpd_asserted callback is added during drm_dp_aux_init()
>> to ensure eDP's HPD is up before proceeding eDP population.
>>
>> Changes in v4:
>> -- delete duplicate initialize code to dp_aux before drm_dp_aux_register()
>> -- delete of_get_child_by_name(dev->of_node, "aux-bus") and inline the function
>> -- not initialize rc = 0
>>
>> Changes in v3:
>> -- add done_probing callback into devm_of_dp_aux_populate_bus()
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_aux.c     | 34 ++++++++++++++----
>>   drivers/gpu/drm/msm/dp/dp_display.c | 69 ++++++++++++++++++-------------------
>>   2 files changed, 60 insertions(+), 43 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
>> index 22eb774..425b5c5 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
>> @@ -480,7 +480,6 @@ void dp_aux_deinit(struct drm_dp_aux *dp_aux)
>>
>>   int dp_aux_register(struct drm_dp_aux *dp_aux)
>>   {
>> -       struct dp_aux_private *aux;
>>          int ret;
>>
>>          if (!dp_aux) {
>> @@ -488,12 +487,7 @@ int dp_aux_register(struct drm_dp_aux *dp_aux)
>>                  return -EINVAL;
>>          }
>>
>> -       aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
>> -
>> -       aux->dp_aux.name = "dpu_dp_aux";
>> -       aux->dp_aux.dev = aux->dev;
>> -       aux->dp_aux.transfer = dp_aux_transfer;
>> -       ret = drm_dp_aux_register(&aux->dp_aux);
>> +       ret = drm_dp_aux_register(dp_aux);
>>          if (ret) {
>>                  DRM_ERROR("%s: failed to register drm aux: %d\n", __func__,
>>                                  ret);
>> @@ -508,6 +502,21 @@ void dp_aux_unregister(struct drm_dp_aux *dp_aux)
>>          drm_dp_aux_unregister(dp_aux);
>>   }
>>
>> +static int dp_wait_hpd_asserted(struct drm_dp_aux *dp_aux,
>> +                                unsigned long wait_us)
>> +{
>> +       int ret;
>> +       struct dp_aux_private *aux;
>> +
>> +       aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
>> +
>> +       pm_runtime_get_sync(aux->dev);
>> +       ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
>> +       pm_runtime_put_sync(aux->dev);
> Ok, so here you have used put_sync instead of autosuspend. Can we have
> some uniformity? (I'd prefer to see put_sync or just put everywhere)


my point is,

since display is user interface,

if there has any inputs before timer expire then there is no reason to 
execute  pm_runtime_suspend().

otherwise pm_runtime_suspend() should be executed.

Therefore I used autosuspend  at aux_transfer() an 
ddp_bridge_atomic_post_disable().

here is not related to user interface so that i use put_sysn() directly.

is my point make sense?

  or should I drop all autosuspend and replace them with put_sync()?


>
>> +
>> +       return ret;
>> +}
>> +
>>   struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
>>                                bool is_edp)
>>   {
>> @@ -531,6 +540,17 @@ struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
>>          aux->catalog = catalog;
>>          aux->retry_cnt = 0;
>>
>> +       /*
>> +        * Use the drm_dp_aux_init() to use the aux adapter
>> +        * before registering aux with the DRM device so that
>> +        * msm edp panel can be detected by generic_dep_panel_probe().
> eDP, AUX, generic_edp_panel_probe().
>
>> +        */
>> +       aux->dp_aux.name = "dpu_dp_aux";
>> +       aux->dp_aux.dev = dev;
>> +       aux->dp_aux.transfer = dp_aux_transfer;
>> +       aux->dp_aux.wait_hpd_asserted = dp_wait_hpd_asserted;
>> +       drm_dp_aux_init(&aux->dp_aux);
>> +
>>          return &aux->dp_aux;
>>   }
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 711d262..9a2b403 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1203,6 +1203,28 @@ static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pde
>>          return NULL;
>>   }
>>
>> +static int dp_auxbus_done_probe(struct drm_dp_aux *aux)
>> +{
>> +       int rc;
>> +
>> +       rc = component_add(aux->dev, &dp_display_comp_ops);
>> +       if (rc)
>> +               DRM_ERROR("eDP component add failed, rc=%d\n", rc);
> drop.
>
>> +
>> +       return rc;
>> +}
>> +
>> +static inline int dp_display_auxbus_population(struct dp_display_private *dp)
> It's not `population`. It is just `populate`.
>
> Also please inline this function.
>
>
>> +{
>> +       int ret;
>> +
>> +       ret = devm_of_dp_aux_populate_bus(dp->aux, dp_auxbus_done_probe);
>> +       if (ret == -ENODEV)
>> +               DRM_ERROR("aux-bus not found\n");
>> +
>> +       return ret;
>> +}
>> +
>>   static int dp_display_probe(struct platform_device *pdev)
>>   {
>>          int rc = 0;
>> @@ -1271,10 +1293,16 @@ static int dp_display_probe(struct platform_device *pdev)
>>          if (rc)
>>                  return rc;
>>
>> -       rc = component_add(&pdev->dev, &dp_display_comp_ops);
>> -       if (rc) {
>> -               DRM_ERROR("component add failed, rc=%d\n", rc);
>> -               dp_display_deinit_sub_modules(dp);
>> +       if (dp->dp_display.is_edp) {
>> +               rc = dp_display_auxbus_population(dp);
>> +               if (rc)
>> +                       DRM_ERROR("eDP auxbus population failed, rc=%d\n", rc);
>> +       } else {
>> +               rc = component_add(&pdev->dev, &dp_display_comp_ops);
>> +               if (rc) {
>> +                       DRM_ERROR("component add failed, rc=%d\n", rc);
>> +                       dp_display_deinit_sub_modules(dp);
>> +               }
>>          }
>>
>>          return rc;
>> @@ -1285,8 +1313,6 @@ static int dp_display_remove(struct platform_device *pdev)
>>          struct dp_display_private *dp = dev_get_dp_display_private(&pdev->dev);
>>
>>          component_del(&pdev->dev, &dp_display_comp_ops);
>> -       dp_display_deinit_sub_modules(dp);
>> -
>>          platform_set_drvdata(pdev, NULL);
>>
>>          dp_display_deinit_sub_modules(dp);
>> @@ -1385,29 +1411,8 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>>   {
>>          int rc;
>>          struct dp_display_private *dp_priv;
>> -       struct device_node *aux_bus;
>> -       struct device *dev;
>>
>>          dp_priv = container_of(dp, struct dp_display_private, dp_display);
>> -       dev = &dp_priv->pdev->dev;
>> -       aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
>> -
>> -       if (aux_bus && dp->is_edp) {
>> -               /*
>> -                * The code below assumes that the panel will finish probing
>> -                * by the time devm_of_dp_aux_populate_ep_devices() returns.
>> -                * This isn't a great assumption since it will fail if the
>> -                * panel driver is probed asynchronously but is the best we
>> -                * can do without a bigger driver reorganization.
>> -                */
>> -               rc = of_dp_aux_populate_bus(dp_priv->aux, NULL);
>> -               of_node_put(aux_bus);
>> -               if (rc)
>> -                       goto error;
>> -       } else if (dp->is_edp) {
>> -               DRM_ERROR("eDP aux_bus not found\n");
>> -               return -ENODEV;
>> -       }
>>
>>          /*
>>           * External bridges are mandatory for eDP interfaces: one has to
>> @@ -1420,17 +1425,9 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>>          if (!dp->is_edp && rc == -ENODEV)
>>                  return 0;
>>
>> -       if (!rc) {
>> +       if (!rc)
>>                  dp->next_bridge = dp_priv->parser->next_bridge;
>> -               return 0;
>> -       }
>>
>> -error:
>> -       if (dp->is_edp) {
>> -               of_dp_aux_depopulate_bus(dp_priv->aux);
>> -               dp_display_host_phy_exit(dp_priv);
>> -               dp_display_host_deinit(dp_priv);
>> -       }
>>          return rc;
>>   }
>>
>> --
>> 2.7.4
>>
>
