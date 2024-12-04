Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 715079E3214
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 04:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2602510EBAC;
	Wed,  4 Dec 2024 03:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="icfXCgcn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5274210EBAC;
 Wed,  4 Dec 2024 03:24:54 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3GefrG030963;
 Wed, 4 Dec 2024 03:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Yi546urIkz6lFveQDWq8wCs7jA2kcBqfdVl74TuXpJo=; b=icfXCgcn1wsLRbs9
 S7u+LYXzvVaPkHpLqNSDWcPg8U3J94LcuhinUTxjREHHu57GsPxQR/tt3U+c8TSo
 4qcosO5nuEuV5Xu6wg0ORopJI8SXYH+9evmV2+5w5GBHturuDnfBmFQlsS9DePg4
 J88e+TAopUUIBFSFGMwKQ9QAWypwuX5fxUcIGPZrZdV8vMzk6bIoEDQitWsR1GmJ
 uqLdmdz7nNhUDuTICPXsRRI0nUAoq6DCm5y6Di3FUbNU3GGRSQEMJ0sPkP1nbQIi
 9RcIZYHQlcgf9Xs0fcAKoOd693z2sl6dqVdlBFR86DDR6OeGS9YsPPUtysQFI5UX
 muriiw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439w90twg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Dec 2024 03:24:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B43OlZo008482
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 4 Dec 2024 03:24:47 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Dec 2024
 19:24:47 -0800
Message-ID: <58d28874-0fcc-42f4-831d-1f304f7d9d4f@quicinc.com>
Date: Tue, 3 Dec 2024 19:24:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/msm/dp: remove redundant ST_DISPLAY_OFF checks in
 msm_dp_bridge_atomic_enable()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, "Stephen Boyd" <swboyd@chromium.org>,
 Doug Anderson <dianders@chromium.org>, "Johan Hovold" <johan@kernel.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>
References: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
 <20241202-hpd_display_off-v1-2-8d0551847753@quicinc.com>
 <f6oh3kid5dfiqe7jy7j3d4gcv4evbtztzpgiygvzfsu6qlim2j@2vsulwcau6tr>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <f6oh3kid5dfiqe7jy7j3d4gcv4evbtztzpgiygvzfsu6qlim2j@2vsulwcau6tr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: LMYWga17l-beLuQplgpCkbSrnwK8c8tZ
X-Proofpoint-GUID: LMYWga17l-beLuQplgpCkbSrnwK8c8tZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040026
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



On 12/3/2024 5:53 AM, Dmitry Baryshkov wrote:
> On Mon, Dec 02, 2024 at 04:39:01PM -0800, Abhinav Kumar wrote:
>> The checks in msm_dp_display_prepare() for making sure that we are in
>> ST_DISPLAY_OFF OR ST_MAINLINK_READY seem redundant.
>>
>> DRM fwk shall not issue any commits if state is not ST_MAINLINK_READY as
>> msm_dp's atomic_check callback returns a failure if state is not ST_MAINLINK_READY.
> 
> Can the state change between atomic_check() and atomic_commit()?
> 

Good question.

I cannot deny that such a possibility does exist.

 From what I can see in the state machine today, the only possibility I 
can think of here is if a user very quickly removes the cable as soon as 
they connect the cable like so fast that the connect was not yet 
processed before disconnect.

Similarly, if an irq_hpd fires after atomic_check but before 
atomic_enable(), and moreover if we hit the sink_count == 0 case in 
msm_dp_display_handle_port_status_changed() during this irq_hpd,

In both these cases, then we will transition to ST_DISCONNECT_PENDING state.

Without this change, we would have bailed out in the 
ST_DISCONNECT_PENDING case.

But other than this, I cannot atleast think of a case where a different 
state transition can happen between atomic_check() and atomic_commit() 
because for other transitions, I think we should be still okay.

But this is purely based on theoretical observation and hypothesis.

Is it better to add a check to bail out in the DISCONNECT_PENDING case?

OR document this as "To-do: Need to bail out if DISCONNECT_PENDING" 
because even if I add this check, I dont know if can make sure this can 
be validated as the check could never hit.


>>
>> For the ST_DISPLAY_OFF check, its mainly to guard against a scenario that
>> there is an atomic_enable() without a prior atomic_disable() which once again
>> should not really happen.
>>
>> To simplify the code, get rid of these checks.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 6 ------
>>   1 file changed, 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 992184cc17e4..614fff09e5f2 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1513,12 +1513,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>>   		return;
>>   	}
>>   
>> -	state = msm_dp_display->hpd_state;
>> -	if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) {
>> -		mutex_unlock(&msm_dp_display->event_mutex);
>> -		return;
>> -	}
>> -
>>   	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
>>   	if (rc) {
>>   		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
>>
>> -- 
>> 2.34.1
>>
> 
