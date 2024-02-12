Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 891D5851C8C
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 19:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75F310ECA9;
	Mon, 12 Feb 2024 18:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="CvW6vnKF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8E710ECA9;
 Mon, 12 Feb 2024 18:13:24 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41CEN78A017259; Mon, 12 Feb 2024 18:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=8fMSWkohrLhzk6hUjl0V+iX0dTpGP3PTsM+7snqdgZE=; b=Cv
 W6vnKFhZjv7V57UW2M1SzbatE8S21Kho/3IWY7HGhaYVTL11/1MQ/CigHZG0WF6p
 x2jzw2LvmN43ae56TaMtgixKyn8FMeM/S7LiaApC+g1g9u4ijtOFuEHU6+hgRDiw
 AsYD75RNBadv6R67hjOk0HFX3s79DnpU524lcKnIH0EOYGXpkytIOTzVjLe4GCsd
 lRfcLpY15e9xDMRVLY0IXxRlNr8KmT7N1aqoX4a8ipD1Kze/iBSOMzDr7pANZbd8
 XZuA12Uzpx7vNDYWFJx6YJ4YPMudt1ZYVVrM9adzP4c+NmKYGJxWR7JQyx+a0ZP3
 sy+Zays4iUJT27+wmHug==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w7gvjh5up-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Feb 2024 18:13:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41CIDKwi003119
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Feb 2024 18:13:20 GMT
Received: from [10.71.111.96] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 12 Feb
 2024 10:13:19 -0800
Message-ID: <5ec59412-3061-3e48-2d1f-be1166614b94@quicinc.com>
Date: Mon, 12 Feb 2024 10:13:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 15/19] drm/msm/dp: enable SDP and SDE periph flush
 update
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
CC: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
 <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-16-quic_parellan@quicinc.com>
 <CAA8EJpqq+H1gdy2pJo0Up=5w0mYTPRu2_1swEBNfyAMXztQanA@mail.gmail.com>
 <1664d096-d258-72fc-8352-7d088000fcc1@quicinc.com>
 <CAA8EJpqE6BEvo1wwKMuSmR4a=VkGzRAuPk_Yw_imeYtTag+Hpg@mail.gmail.com>
 <2ca5624e-1cf4-9712-f8d8-6a609d95cad2@quicinc.com>
 <CAA8EJpo2UBX_N6FA2oQkkvE2AgQCfc0iETDLK1-MN87410NE_w@mail.gmail.com>
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <CAA8EJpo2UBX_N6FA2oQkkvE2AgQCfc0iETDLK1-MN87410NE_w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: KNWOMvWcYuisBfNLCXuDmJiPLVeOurI_
X-Proofpoint-ORIG-GUID: KNWOMvWcYuisBfNLCXuDmJiPLVeOurI_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_15,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=416 adultscore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402120139
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


On 2/10/2024 10:15 PM, Dmitry Baryshkov wrote:
> On Sun, 11 Feb 2024 at 06:12, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>> On 2/10/2024 2:11 PM, Dmitry Baryshkov wrote:
>>> On Sat, 10 Feb 2024 at 23:49, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>> On 2/10/2024 2:16 AM, Dmitry Baryshkov wrote:
>>>>> On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>>>>>> DP controller can be setup to operate in either SDP update flush mode or
>>>>>> peripheral flush mode based on the DP controller hardware version.
>>>>>>
>>>>>> Starting in DP v1.2, the hardware documents require the use of
>>>>>> peripheral flush mode for SDP packets such as PPS OR VSC SDP packets.
>>>>>>
>>>>>> In-line with this guidance, lets program the DP controller to use
>>>>>> peripheral flush mode starting DP v1.2
>>>>>>
>>>>>> Changes in v2:
>>>>>>            - Use the original dp_catalog_hw_revision() function to
>>>>>>              correctly check the DP HW version
>>>>>>
>>>>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/msm/dp/dp_catalog.c | 17 +++++++++++++++++
>>>>>>     drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
>>>>>>     drivers/gpu/drm/msm/dp/dp_ctrl.c    |  1 +
>>>>>>     drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
>>>>>>     4 files changed, 21 insertions(+)
>>>>>>
>>>> <Snip>
>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
>>>>>> index 2983756c125cd..6ac66532b47a4 100644
>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
>>>>>> @@ -102,6 +102,8 @@
>>>>>>     #define DP_MAINLINK_CTRL_ENABLE                        (0x00000001)
>>>>>>     #define DP_MAINLINK_CTRL_RESET                 (0x00000002)
>>>>>>     #define DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER   (0x00000010)
>>>>>> +#define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP      (0x00800000)
>>>>>> +#define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE       (0x01800000)
>>>>> Just one bit here, please.
>>>>>
>>>> hmm .... so the periph flush bits are 24:23 and we need a value of 3 to
>>>> select peripheral flush which translates to 0x01800000.
>>>>
>>>> How do you suggest to break this up?
>>> Then FIELD_PREP(something_mask, 3). Otherwise it is too easy to
>>> consider it to be DP_MAINLINK_FLUSH_MODE_UPDATE_SDP | BIT(24)
>>>
>> Sure, FIELD_PREP() works. I was confused when you said one bit :)
> I was also confused, as I wrote, thus I thought that there are one-bit
> values in this reg.


Ack, will change

-Paloma

>
>>>>>>     #define DP_MAINLINK_FB_BOUNDARY_SEL            (0x02000000)
>>>>>>
>>>>>>     #define REG_DP_STATE_CTRL                      (0x00000004)
>>>>>> --
>>>>>> 2.39.2
>>>>>>
>>>>>
>>>
>>>
>
>
