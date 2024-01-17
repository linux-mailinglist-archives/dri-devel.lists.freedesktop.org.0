Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD9A830CE6
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 19:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CB210E7D5;
	Wed, 17 Jan 2024 18:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2661910E7C5;
 Wed, 17 Jan 2024 18:46:11 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40HHqT8I011550; Wed, 17 Jan 2024 18:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=QAa9+s5XEvNyRusQ57/6vNextUIrxSqChDyDt1tffJU=; b=Z0
 DAsCUjrS8aLlOUPxgwBa1KQDNsYzHJDRcEta8VdjmKUT8HFsJEzKmNbAXQPIfDOc
 XM/9ZH4THycynpSl4OtW9Uu5P62BFO2cccDMULpdlgamU5DS1FfP6sqDpIOeu7aW
 cF9LA2xUxaVUxXVUIEwWPOn+DSvpF1oMmA15+q19d9zg3hv7K+UuySfXmqVHkJ7x
 iCBNHBG2VTVrwuO0Dz08lza9i6F2ERGzqOaSBNvMxMOYD0t9pSFge/VX8bU5j+mP
 4o+o0a4mFB021sbENZBsnt8gKJylEK51MKC3pNJGdlDh7KtGg6g5uTGTWnBWZkQi
 HflROsAlvCcQwvDfIP6Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vpa1esk5c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jan 2024 18:46:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40HIk4UZ009127
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jan 2024 18:46:04 GMT
Received: from [10.110.28.75] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 17 Jan
 2024 10:46:02 -0800
Message-ID: <20384cb9-8cd0-7f57-667a-27079cade833@quicinc.com>
Date: Wed, 17 Jan 2024 10:46:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] drm/msm/dp: correct configure Colorimetry Indicator
 Field at MISC0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1705514068-22394-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpqO+SWYcCtH1hOVow18ZTbJ=qh0D68CEP1sGObdd3=ciA@mail.gmail.com>
 <33f9d97d-f0fb-96d7-eea9-c43c3a5a162e@quicinc.com>
 <CAA8EJppWuUrjzmssh79JT3B4uDcc_WnKGhJoCNiG8NTw9xD6wg@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJppWuUrjzmssh79JT3B4uDcc_WnKGhJoCNiG8NTw9xD6wg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: MgbDm2R87KEftknQGjKssVE9mDp-Kqkk
X-Proofpoint-ORIG-GUID: MgbDm2R87KEftknQGjKssVE9mDp-Kqkk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-17_11,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401170133
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
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, airlied@gmail.com,
 andersson@kernel.org, dri-devel@lists.freedesktop.org, dianders@chromium.org,
 vkoul@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com, swboyd@chromium.org,
 sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/17/2024 10:40 AM, Dmitry Baryshkov wrote:
> On Wed, 17 Jan 2024 at 20:29, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>
>> On 1/17/2024 10:12 AM, Dmitry Baryshkov wrote:
>>> On Wed, 17 Jan 2024 at 19:54, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>>> MSA MISC0 bit 1 to 7 contains Colorimetry Indicator Field. At
>>>> current implementation, at DP_TEST_DYNAMIC_RANGE_CEA case the
>>> In the current implementation, in the ... case
>>>
>>>> Colorimetry Indicator Field is mistakenly left shifted one extra
>>>> bit.
>>> This doesn't make sense. You say that the value is mistakenly shifted,
>>> but the shift is still in place in dp_catalog_ctrl_config_misc().
>> The problem is at
>>
>>    link->dp_link.test_video.test_dyn_range =   (bp &
>> DP_TEST_DYNAMIC_RANGE_CEA);   <== this from reading dpcd directly where
>> ==> DP_TEST_DYNAMIC_RANGE_CEA  is   (1 << 3)
>>
>> within dp_catalog_ctrl_config_misc(), cc will be left shift one more bit.
>> so that cc is totally is left shifted 4 bits (bit 4).
>>
>> at misc0, it should be bit 3 set only for CEA_RGB.
> Yes. But your patch doesn't fix the shift (which is correct). You
> patch fixes the value being written to that field.
ok, i will rewording the commit test
>
>>>> This patch return correct value of colorimetry at
>>>> dp_link_get_colorimetry_config() to fix this problem.
>>> See Documentation/process/submitting-patches.rst#_describe_changes
>>>
>>>> Changes in V2:
>>>> -- drop retrieving colorimetry from colorspace
>>>> -- drop dr = link->dp_link.test_video.test_dyn_range assignment
>>>>
>>>> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_link.c | 11 ++++++-----
>>>>    drivers/gpu/drm/msm/dp/dp_link.h |  3 +++
>>>>    2 files changed, 9 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
>>>> index 98427d4..2e1bdaf 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_link.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
>>>> @@ -1082,7 +1082,7 @@ int dp_link_process_request(struct dp_link *dp_link)
>>>>
>>>>    int dp_link_get_colorimetry_config(struct dp_link *dp_link)
>>>>    {
>>>> -       u32 cc;
>>>> +       u32 cc = DP_MISC0_LEGACY_RGB;
>>>>           struct dp_link_private *link;
>>>>
>>>>           if (!dp_link) {
>>>> @@ -1096,10 +1096,11 @@ int dp_link_get_colorimetry_config(struct dp_link *dp_link)
>>>>            * Unless a video pattern CTS test is ongoing, use RGB_VESA
>>>>            * Only RGB_VESA and RGB_CEA supported for now
>>>>            */
>>>> -       if (dp_link_is_video_pattern_requested(link))
>>>> -               cc = link->dp_link.test_video.test_dyn_range;
>>>> -       else
>>>> -               cc = DP_TEST_DYNAMIC_RANGE_VESA;
>>>> +       if (dp_link_is_video_pattern_requested(link)) {
>>>> +               if (link->dp_link.test_video.test_dyn_range &
>>>> +                                       DP_TEST_DYNAMIC_RANGE_CEA)
>>>> +                       cc = DP_MISC0_CEA_RGB;
>>>> +       }
>>>>
>>>>           return cc;
>>>>    }
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
>>>> index 9dd4dd9..fe8f716 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_link.h
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_link.h
>>>> @@ -12,6 +12,9 @@
>>>>    #define DP_TEST_BIT_DEPTH_UNKNOWN 0xFFFFFFFF
>>>>    #define DP_LINK_CAP_ENHANCED_FRAMING (1 << 0)
>>>>
>>>> +#define DP_MISC0_LEGACY_RGB            0
>>>> +#define DP_MISC0_CEA_RGB               0x04
>>> These should go to dp_reg.h and should start with DP_MISC0_COLORIMETRY_CFG
>>>
>>>> +
>>>>    struct dp_link_info {
>>>>           unsigned char revision;
>>>>           unsigned int rate;
>>>> --
>>>> 2.7.4
>>>>
>
>
