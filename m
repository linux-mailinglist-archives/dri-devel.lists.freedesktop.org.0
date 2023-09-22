Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 425097ABC23
	for <lists+dri-devel@lfdr.de>; Sat, 23 Sep 2023 01:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868DE10E70D;
	Fri, 22 Sep 2023 23:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3C410E720;
 Fri, 22 Sep 2023 23:03:27 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38MMOiM1009053; Fri, 22 Sep 2023 23:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=4FWnjfTUwLDhTdM8E7W9GOoGO7Th99GujB8c2w0lai4=;
 b=IYcQ/rfrbWiUBQMtwif+AcTEz99gK3Rj339YLSRt/bL2dfJqfK/5Kc067sod4sYhexPk
 MHw7HkZODMtnK92KgqK9sqaBdyi1P/i3j7ZmXCLwrLeMWtKckF1QGkMOuV1nOrLKvZQQ
 Jspuitx94QDyznoEHB17WT+xEAYyBEjnPu7XiYtuQmLaXgUHu3T6TYgTcvrOAlo7k39s
 Fn9AGIhbVX2SYuDppMWh7y91S4H9tFcuermq13PBxPS3P66OUCvvDrVO1MaCutTVfjYW
 FhOmr6R19ITyTBU0LMc+epW/hr9TLsCx7qBJMBHiz2e5Ge37rzzCm7iUcl3+0KUI8iVC 5g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t9cq3s85u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Sep 2023 23:03:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38MN36Cm007060
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Sep 2023 23:03:06 GMT
Received: from [10.110.46.220] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 22 Sep
 2023 16:03:04 -0700
Message-ID: <1c82a0a6-d85f-9800-bdc4-2a4892b4239b@quicinc.com>
Date: Fri, 22 Sep 2023 16:02:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/7] drm/msm/dp: tie dp_display_irq_handler() with dp
 driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1694813901-26952-1-git-send-email-quic_khsieh@quicinc.com>
 <1694813901-26952-2-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJprRFYMF-6yxcL75rftfii0kt7hmg_+TeOMJw+BRyDYdeg@mail.gmail.com>
Content-Language: en-US
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJprRFYMF-6yxcL75rftfii0kt7hmg_+TeOMJw+BRyDYdeg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: fgRZ9UUsYCfUmguX4vV3LDvHAahEoaSI
X-Proofpoint-ORIG-GUID: fgRZ9UUsYCfUmguX4vV3LDvHAahEoaSI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_19,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2309220197
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


On 9/15/2023 5:29 PM, Dmitry Baryshkov wrote:
> On Sat, 16 Sept 2023 at 00:38, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>> Currently the dp_display_irq_handler() is executed at msm_dp_modeset_init()
>> which ties irq registration to the DPU device's life cycle, while depending on
>> resources that are released as the DP device is torn down. Move register DP
>> driver irq handler at dp_display_probe() to have dp_display_irq_handler()
>> is tied with DP device.
>>
>> Changes in v3:
>> -- move calling dp_display_irq_handler() to probe
> Was there a changelog for the previous reivions? What is the
> difference between v1 and v2?
>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 35 +++++++++++++----------------------
>>   drivers/gpu/drm/msm/dp/dp_display.h |  1 -
>>   2 files changed, 13 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 76f1395..c217430 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1193,30 +1193,23 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
>>          return ret;
>>   }
>>
>> -int dp_display_request_irq(struct msm_dp *dp_display)
>> +static int dp_display_request_irq(struct dp_display_private *dp)
>>   {
>>          int rc = 0;
>> -       struct dp_display_private *dp;
>> -
>> -       if (!dp_display) {
>> -               DRM_ERROR("invalid input\n");
>> -               return -EINVAL;
>> -       }
>> -
>> -       dp = container_of(dp_display, struct dp_display_private, dp_display);
>> +       struct device *dev = &dp->pdev->dev;
>>
>> -       dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
>>          if (!dp->irq) {
> What is the point in this check?
>
>> -               DRM_ERROR("failed to get irq\n");
>> -               return -EINVAL;
>> +               dp->irq = platform_get_irq(dp->pdev, 0);
>> +               if (!dp->irq) {
>> +                       DRM_ERROR("failed to get irq\n");
>> +                       return -EINVAL;
>> +               }
>>          }
>>
>> -       rc = devm_request_irq(dp_display->drm_dev->dev, dp->irq,
>> -                       dp_display_irq_handler,
>> +       rc = devm_request_irq(dev, dp->irq, dp_display_irq_handler,
>>                          IRQF_TRIGGER_HIGH, "dp_display_isr", dp);
>>          if (rc < 0) {
>> -               DRM_ERROR("failed to request IRQ%u: %d\n",
>> -                               dp->irq, rc);
>> +               DRM_ERROR("failed to request IRQ%u: %d\n", dp->irq, rc);
>>                  return rc;
>>          }
>>
>> @@ -1287,6 +1280,10 @@ static int dp_display_probe(struct platform_device *pdev)
>>
>>          platform_set_drvdata(pdev, &dp->dp_display);
>>
>> +       rc = dp_display_request_irq(dp);
>> +       if (rc)
>> +               return rc;
> This way the IRQ ends up being enabled in _probe. Are we ready to
> handle it here? Is the DP device fully setup at this moment?

The irq is enabled here.

but DP driver hpd hardware block has not yet be enabled. this means no 
irq will be delivered.

  .hpd_enable() will call pm_runtime_resume_and_get() and 
dp_catalog_ctrl_hpd_enable().

after .hpd_enable() irq will be delivered and handled properly.



>> +
>>          rc = component_add(&pdev->dev, &dp_display_comp_ops);
>>          if (rc) {
>>                  DRM_ERROR("component add failed, rc=%d\n", rc);
>> @@ -1549,12 +1546,6 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>>
>>          dp_priv = container_of(dp_display, struct dp_display_private, dp_display);
>>
>> -       ret = dp_display_request_irq(dp_display);
>> -       if (ret) {
>> -               DRM_ERROR("request_irq failed, ret=%d\n", ret);
>> -               return ret;
>> -       }
>> -
>>          ret = dp_display_get_next_bridge(dp_display);
>>          if (ret)
>>                  return ret;
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
>> index 1e9415a..b3c08de 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>> @@ -35,7 +35,6 @@ struct msm_dp {
>>   int dp_display_set_plugged_cb(struct msm_dp *dp_display,
>>                  hdmi_codec_plugged_cb fn, struct device *codec_dev);
>>   int dp_display_get_modes(struct msm_dp *dp_display);
>> -int dp_display_request_irq(struct msm_dp *dp_display);
>>   bool dp_display_check_video_test(struct msm_dp *dp_display);
>>   int dp_display_get_test_bpp(struct msm_dp *dp_display);
>>   void dp_display_signal_audio_start(struct msm_dp *dp_display);
>> --
>> 2.7.4
>>
>
