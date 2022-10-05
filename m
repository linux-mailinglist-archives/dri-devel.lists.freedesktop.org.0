Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2685F57A1
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 17:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0B410E6BA;
	Wed,  5 Oct 2022 15:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBCF610E6B9;
 Wed,  5 Oct 2022 15:33:43 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 295FJqlL024692;
 Wed, 5 Oct 2022 15:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=pPShslKtDcKhs1DoTYJVYGFbNVdIcHpNSP0dfUz/3A8=;
 b=mXc4KJbAIO9TtcijhW8xIamKhychlbpTMNu1hYKl/31zzfzWSEuGDvAL9qCy2IjNGwkE
 BGluuU7NGFoaKzn0neGMWjAreWbGEAhxG0++gZdMxrBOf8PVJsFIxqxAq4aEYaBHSaxT
 +r4x0cbEhhQGiCkmnyBoZ8z7uygdwIDmKe7s1zCmeL9wkQW9M5IpesQ3XIUI0TqlFQGr
 eZ1HVZ32sO8YKdN076eAn555E+e1GHqIPBPn/+ZrpgvdoU57NREd85y8co9f4jbuNXcc
 yNUZtbZ1MwYg7ybtvL4WpNXvTaI6b0ZYNeGAysaSZJKseI//B5VBTZ8L2HRg7wcHQqII 3Q== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k0escug7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Oct 2022 15:33:30 +0000
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 295FUnTr024827; 
 Wed, 5 Oct 2022 15:33:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 3jxemkprsq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Oct 2022 15:33:29 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 295FXTYv026781;
 Wed, 5 Oct 2022 15:33:29 GMT
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 295FXSI3026779
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Oct 2022 15:33:29 +0000
Received: from [10.38.242.178] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 5 Oct 2022
 08:33:24 -0700
Message-ID: <57732804-9eb1-2f92-f2cd-0ae66f3e28cd@quicinc.com>
Date: Wed, 5 Oct 2022 08:33:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 5/5] drm/dsc: Prevent negative BPG offsets from shadowing
 adjacent bitfields
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 <phone-devel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sean Paul
 <sean@poorly.run>, Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez
 Canillas <javierm@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Douglas Anderson <dianders@chromium.org>, Vladimir Lypak
 <vladimir.lypak@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 Lyude Paul <lyude@redhat.com>
References: <20221001190807.358691-1-marijn.suijten@somainline.org>
 <20221001190807.358691-6-marijn.suijten@somainline.org>
 <55d7e20b-79cd-ece6-b643-8b542beb7474@quicinc.com>
 <20221004215745.zdfvulqx4exlujgk@SoMainline.org>
 <1a5ed43e-914e-079d-96bf-c9e3912a9473@quicinc.com>
 <20221004223940.stfsyvubx7ecd3a3@SoMainline.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221004223940.stfsyvubx7ecd3a3@SoMainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: WzHDpl8xPPlxpi_KbQxVYE88nZlVV2UB
X-Proofpoint-ORIG-GUID: WzHDpl8xPPlxpi_KbQxVYE88nZlVV2UB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-05_03,2022-10-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210050097
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



On 10/4/2022 3:39 PM, Marijn Suijten wrote:
> On 2022-10-04 15:31:10, Abhinav Kumar wrote:
>>
>>
>> On 10/4/2022 2:57 PM, Marijn Suijten wrote:
>>> [..]
>>> Alas, as explained in the cover letter I opted to perform the masking in
>>> the PPS packing code as the DSC block code also reads these values, and
>>> would suddenly write 6-bit intead of 8-bit values to the
>>> DSC_RANGE_BPG_OFFSET registers.  Quick testing on the mentioned sdm845
>>> platform shows no regressions, but I'm not sure if that's safe to rely
>>> on?
>>
>> I looked up the MDP_DSC_0_RANGE_BPG_OFFSET_* registers.
>> They take only a 6-bit value according to the SW documentation ( bits 5:0 )
>>
>> It was always expecting only a 6-bit value and not 8.
>>
>> So this change is safe.
> 
> Ack, I think that implies I should make this change and move the masks
> to the DSI driver?

hmm .... downstream seems to have the & just before the reg write

https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/DISPLAY.LA.2.0.r1-08000-WAIPIO.0/msm/sde/sde_hw_dsc_1_2.c#L310

But yes, we can move this to the dsi calculation to match what others 
are doing. I am fine with that.

> 
>>>> If you want to move to helper, other drivers need to be changed too to
>>>> remove duplicate & 0x3f.
>>>
>>> Sure, we only have to confirm whether those drivers also read back the
>>> value(s) in rc_range_params, and expect / allow this to be 8 instead of
>>> 6 bits.
>>>
>>>> FWIW, this too has already been fixed in the latest downstream driver too.
>>>
>>> What is this supposed to mean?  Is there a downstream DPU project that
>>> has pending patches needing to be upstreamed?  Or is the downstream SDE,
>>> techpack/display, or whatever it is called nowadays, slowly using more
>>> DRM structs like drm_dsc_config and this drm_dsc_pps_payload_pack()
>>> helper function as pointed out in an earlier mail?
>>>
>>
>> No, what I meant was, the version of downstream driver based on which
>> the upstream DSC was made seems to be an older version. Downstream
>> drivers keep getting updated and we always keep trying to align with
>> upstream structs.
>>
>> This is true not just for DSC but even other blocks.
>>
>> So as part of that effort, we started using struct drm_dsc_config . That
>> change was made on newer chipsets. But the downstream SW on sdm845 based
>> on which the DSC was upstreamed seems like didnt have that. Hence all
>> this redundant math happened.
>>
>> So this comment was more of a explanation about why this issue happened
>> even though latest downstream didnt have this issue.
> 
> Thanks, I understood most of that but wasn't aware these exact "issues"
> were also addressed downstream (by i.e. also using the upstream
> structs).
> 

Even I wasnt. When I was reviewing this series, it seemed like a valid 
change so I checked the latest downstream code like i always do to see 
whether and how this is handled and found that these issues were 
addressed there so thought i would update that here.

>>> Offtopic: are SDE and DPU growing closer together, hopefully achieving
>>> feature parity allowing the SDE project to be dropped in favour of a
>>> fully upstreamed DPU driver for day-one out-of-the-box mainline support
>>> for new SoCs (as long as work is published and on its way upstream)?
>>>
>>
>> There is still a lot of gap between SDE and DPU drivers at this point.
>> We keep trying to upstream as many features as possible to minimize the
>> gap but there is still a lot of work to do.
> 
> Glad to hear, but that sounds like a very hard to close gap unless
> downstream "just works on DPU" instead of having parallel development on
> two "competing" drivers for the exact same hardware.
> 
Its not really parallel development OR competing drivers.
The design of these features downstream (not just DSC but many others) 
is quite different because some of the downstream designs wont get 
accepted upstream as its tightly coupled with our 
compositor/device-tree. Thats where we are slowly trying to implement 
these in an upstream compatible way.

BTW, that being said. Its not always the case that every issue seen 
upstream has already been fixed downstream. In fact, on some occasions 
we found something fixed in upstream in a better way and ported them 
downstream too.

Thanks

Abhinav
> - Marijn
