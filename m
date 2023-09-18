Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A767A53C0
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 22:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B91210E303;
	Mon, 18 Sep 2023 20:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09CA10E302;
 Mon, 18 Sep 2023 20:16:33 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38IJdVsM020599; Mon, 18 Sep 2023 20:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=m9ycPkoqh3F+kHpg0TZyKjSV6+fgyQLXKdhx826xOxg=;
 b=XR8jDin4k0rlT0vPG5CAMyTFoXHpVaNaLqJL0mQmbjuxN9ZVgSzyzv2FGeF0G5cUzkdz
 BJ0B8TA6Dt3VvAFle3EtYBRNyC0KvM/e02mseHK4vra1DVaC6Zup75Jdg6YkmIOT/C4j
 P7/R0xnToi/QJPaLe9bMstfJ3Oqz1WcDRgK51O+o3W1wFFLlnuZlk0U6UOIHmfTq+ZLo
 DEuNAHtsGKiOahuAlrLgVH3E5fSy+Qh5NWNrDppnPOJMQrfR+lumJ8cu5xkqevX9xSlB
 xaWP8O8I65JBK4nGLoMd9AVLMTWc24kADcDQ50gqRagnhxUX4FlPbRBaMsSwlUfco56X RQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t6qf6gx82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Sep 2023 20:16:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38IKGHm9024910
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Sep 2023 20:16:17 GMT
Received: from [10.71.109.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 18 Sep
 2023 13:16:16 -0700
Message-ID: <f855b3db-2754-5f66-9fc2-061a517814ef@quicinc.com>
Date: Mon, 18 Sep 2023 13:16:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/7] drm/msm/dp: use drm_bridge_hpd_notify() to report
 HPD status changes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1694813901-26952-1-git-send-email-quic_khsieh@quicinc.com>
 <1694813901-26952-4-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJprG8HuhDHV9k5_4+vkejnYmwmg61isZXT7EsBCbGP0pJA@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJprG8HuhDHV9k5_4+vkejnYmwmg61isZXT7EsBCbGP0pJA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FSoKitydHwGDgxHFMPdmw9NlfXjdQMtr
X-Proofpoint-ORIG-GUID: FSoKitydHwGDgxHFMPdmw9NlfXjdQMtr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-18_09,2023-09-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309180177
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


On 9/15/2023 5:41 PM, Dmitry Baryshkov wrote:
> On Sat, 16 Sept 2023 at 00:38, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>> Currently DP driver use drm_helper_hpd_irq_event(), bypassing drm bridge
>> framework, to report HPD status changes to user space frame work.
>> Replace it with drm_bridge_hpd_notify() since DP driver is part of drm
>> bridge.
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Also see the comment below.
>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 20 ++------------------
>>   1 file changed, 2 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 18d16c7..59f9d85 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -356,26 +356,10 @@ static bool dp_display_is_sink_count_zero(struct dp_display_private *dp)
>>                  (dp->link->sink_count == 0);
>>   }
>>
>> -static void dp_display_send_hpd_event(struct msm_dp *dp_display)
>> -{
>> -       struct dp_display_private *dp;
>> -       struct drm_connector *connector;
>> -
>> -       dp = container_of(dp_display, struct dp_display_private, dp_display);
>> -
>> -       connector = dp->dp_display.connector;
>> -       drm_helper_hpd_irq_event(connector->dev);
>> -}
>> -
>>   static int dp_display_send_hpd_notification(struct dp_display_private *dp,
>>                                              bool hpd)
>>   {
>> -       if ((hpd && dp->dp_display.link_ready) ||
>> -                       (!hpd && !dp->dp_display.link_ready)) {
>> -               drm_dbg_dp(dp->drm_dev, "HPD already %s\n",
>> -                               (hpd ? "on" : "off"));
>> -               return 0;
>> -       }
>> +       struct drm_bridge *bridge = dp->dp_display.bridge;
>>
>>          /* reset video pattern flag on disconnect */
>>          if (!hpd)
> Note, this part (resetting the video_test and setting of is_connected)
> should be moved to the dp_bridge_hpd_notify() too. Please ignore this
> comment if this is handled later in the series.

I think keep them here is better since eDP does not populate hpd_enable, 
hpd_disable and hpd_notify at edp_bridge_ops at drm_bridge_attach().

Keep them here will work for both eDP and DP.


>
>
>> @@ -385,7 +369,7 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
>>
>>          drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
>>                          dp->dp_display.connector_type, hpd);
>> -       dp_display_send_hpd_event(&dp->dp_display);
>> +       drm_bridge_hpd_notify(bridge, dp->dp_display.link_ready);
>>
>>          return 0;
>>   }
>> --
>> 2.7.4
>>
>
