Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7C78740F1
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 20:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A18F10F469;
	Wed,  6 Mar 2024 19:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="MLNhtBTQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56ED10E794;
 Wed,  6 Mar 2024 19:59:29 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 426HIj9w021874; Wed, 6 Mar 2024 19:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=FxSCqNkOlUPk6LBkYUvvtaKJialC+MoBYO1YjFspR4M=; b=ML
 NhtBTQNDYXb5SHgVwQEJ20g8s9MdkOzXFnS9qsRN7PaAT0q9SFmMGZjMmsZg4uE3
 ZxBKfhbY7RW6lIUYouZCp0JcZBGh3QHDv9OM98cKKJm5XqwsFuLF6QSUOGDELkZ8
 /01j6LsJ1plrVOPjxdvpGofD7waPM1he4S+FPap2E7MF1OvQoF03OK0ryXAEnbkb
 YcWGIgbKvXjmV7wQRVtdxyLL1ptVPOxHGnAAh3mJoDr6xwmnCkZv5UeZnH81EDza
 gXhQVR8pVFXr/g0BiOcm+//6Ks4Pi4ZZ54V4D6lpVbTdE859/OsQc8G9MCaM96wV
 BMXx7Y1HclgAjtnKDMcg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wpgwmt0f1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Mar 2024 19:59:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 426JxP3F001294
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 6 Mar 2024 19:59:25 GMT
Received: from [10.110.71.131] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 6 Mar
 2024 11:59:22 -0800
Message-ID: <2295092e-355b-4ebf-f630-14623cf7d9a3@quicinc.com>
Date: Wed, 6 Mar 2024 11:59:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH] drm/msm/dp: move link_ready out of HPD event thread
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>, "Sean
 Paul" <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 "David Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <swboyd@chromium.org>,
 <quic_jesszhan@quicinc.com>, <quic_parellan@quicinc.com>,
 <quic_khsieh@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20240306195031.490994-1-quic_abhinavk@quicinc.com>
 <CAA8EJpq=5=L5RdVZRkf=e2wyjQufnSzEC+=19FjCCF9S6SSEJA@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpq=5=L5RdVZRkf=e2wyjQufnSzEC+=19FjCCF9S6SSEJA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: kvbPXLaDfSMPl1sm0abBT5tD8kuQB0z9
X-Proofpoint-ORIG-GUID: kvbPXLaDfSMPl1sm0abBT5tD8kuQB0z9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_12,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403060161
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/6/2024 11:52 AM, Dmitry Baryshkov wrote:
> On Wed, 6 Mar 2024 at 21:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> There are cases where the userspace might still send another
>> frame after the HPD disconnect causing a modeset cycle after
>> a disconnect. This messes the internal state machine of MSM DP driver
>> and can lead to a crash as there can be an imbalance between
>> bridge_disable() and bridge_enable().
>>
>> This was also previously reported on [1] for which [2] was posted
>> and helped resolve the issue by rejecting commits if the DP is not
>> in connected state.
>>
>> The change resolved the bug but there can also be another race condition.
>> If hpd_event_thread does not pick up the EV_USER_NOTIFICATION and process it
>> link_ready will also not be set to false allowing the frame to sneak in.
>>
>> Lets move setting link_ready outside of hpd_event_thread() processing to
>> eliminate a window of race condition.
>>
>> [1] : https://gitlab.freedesktop.org/drm/msm/-/issues/17
>> [2] : https://lore.kernel.org/all/1664408211-25314-1-git-send-email-quic_khsieh@quicinc.com/
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 068d44eeaa07..e00092904ccc 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -345,8 +345,6 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
>>                                                           dp->panel->downstream_ports);
>>          }
>>
>> -       dp->dp_display.link_ready = hpd;
>> -
>>          drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
>>                          dp->dp_display.connector_type, hpd);
>>          drm_bridge_hpd_notify(bridge, dp->dp_display.link_ready);
>> @@ -399,6 +397,8 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
>>                  goto end;
>>          }
>>
>> +       dp->dp_display.link_ready = true;
> 
> Do we need any kind of locking now?
> 

hmm ... correct me if I have missed any flows but I think all paths 
where we will set link_ready are already protected by event_mutex?

>> +
>>          dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
>>
>>   end:
>> @@ -466,6 +466,8 @@ static int dp_display_notify_disconnect(struct device *dev)
>>   {
>>          struct dp_display_private *dp = dev_get_dp_display_private(dev);
>>
>> +       dp->dp_display.link_ready = false;
>> +
>>          dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
>>
>>          return 0;
>> @@ -487,6 +489,7 @@ static int dp_display_handle_port_status_changed(struct dp_display_private *dp)
>>                  drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
>>                  if (dp->hpd_state != ST_DISCONNECTED) {
>>                          dp->hpd_state = ST_DISCONNECT_PENDING;
>> +                       dp->dp_display.link_ready = false;
>>                          dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
>>                  }
>>          } else {
>> --
>> 2.34.1
>>
> 
> 
