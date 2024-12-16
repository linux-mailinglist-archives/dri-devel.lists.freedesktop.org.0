Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8096C9F3A16
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 20:44:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C8110E78D;
	Mon, 16 Dec 2024 19:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="mqexwAv7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B46810E788;
 Mon, 16 Dec 2024 19:44:48 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGIwdKQ010436;
 Mon, 16 Dec 2024 19:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QoKedy9nYKtdTeo3ZbXuPAijYEnVjQxjDUwben+Uc8A=; b=mqexwAv76Z5Urklf
 Pp+5j1FIk30/a+184RGWP8p3xYpASLLI3Efz/nTk9ywkbXKNaKDUIMNFJZ2aNg+d
 e2eeRzvz6dRgOrq2JWhegdx95y5tiXJCRamY2AMudjCXEAJ2iljfAIk2qJFPl2xd
 eXQL467v4oVTWgqOyCn8QGBxxmJrCgnkPZu+AwkZ+gg5HNZWc/jgHDIfsAXHcZhU
 JYCz9BEHb9+WkxTsa6UsHFzrVjBQhUpCTvPf683D6ek7biTDFyW7prdNI0WsIwN/
 39SKj0MgKunZoEgnRBqMd2GBe+Ruhp78MW1ts5WxsXDpCWWOYuouE7/QDoYq191Y
 2foSzg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jsy70389-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2024 19:44:42 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGJifra029261
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2024 19:44:41 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 11:44:41 -0800
Message-ID: <42947ffb-5fd0-42dc-9f9e-6c90f0810258@quicinc.com>
Date: Mon, 16 Dec 2024 11:44:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/22] drm: Add valid clones check
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard
 <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, <quic_ebharadw@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-2-7849f900e863@quicinc.com>
 <20240925-hasty-bald-caribou-eedbf5@houat>
 <80d08449-71de-4a7f-8b2a-8af565d8d701@quicinc.com>
 <54188c68-41c7-4a42-9eca-67363b30217a@quicinc.com>
 <Z2A4uahCHuOz45Fc@phenom.ffwll.local>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <Z2A4uahCHuOz45Fc@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: MNXQyAJ-coX4yR_R4aLjrCNCaShb2gUT
X-Proofpoint-GUID: MNXQyAJ-coX4yR_R4aLjrCNCaShb2gUT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160162
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



On 12/16/2024 6:27 AM, Simona Vetter wrote:
> On Sun, Dec 15, 2024 at 06:19:08PM -0800, Abhinav Kumar wrote:
>> Hi Maxime
>>
>> Gentle reminder on this one.
>>
>> We are looking for some advice on how to go about KUnit for this static
>> function.
>>
>> Please help with our question below.
>>
>> Thanks
>>
>> Abhinav
>>
>> On 12/6/2024 4:48 PM, Jessica Zhang wrote:
>>>
>>>
>>> On 9/25/2024 12:23 AM, Maxime Ripard wrote:
>>>> On Tue, Sep 24, 2024 at 03:59:18PM GMT, Jessica Zhang wrote:
>>>>> Check that all encoders attached to a given CRTC are valid
>>>>> possible_clones of each other.
>>>>>
>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>> ---
>>>>>    drivers/gpu/drm/drm_atomic_helper.c | 23 +++++++++++++++++++++++
>>>>>    1 file changed, 23 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c
>>>>> b/drivers/gpu/drm/drm_atomic_helper.c
>>>>> index 43cdf39019a4..cc4001804fdc 100644
>>>>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>>>>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>>>>> @@ -574,6 +574,25 @@ mode_valid(struct drm_atomic_state *state)
>>>>>        return 0;
>>>>>    }
>>>>> +static int drm_atomic_check_valid_clones(struct
>>>>> drm_atomic_state *state,
>>>>> +                     struct drm_crtc *crtc)
>>>>> +{
>>>>> +    struct drm_encoder *drm_enc;
>>>>> +    struct drm_crtc_state *crtc_state =
>>>>> drm_atomic_get_new_crtc_state(state,
>>>>> +                                      crtc);
>>>>> +
>>>>> +    drm_for_each_encoder_mask(drm_enc, crtc->dev,
>>>>> crtc_state->encoder_mask) {
>>>>> +        if ((crtc_state->encoder_mask & drm_enc->possible_clones) !=
>>>>> +            crtc_state->encoder_mask) {
>>>>> +            DRM_DEBUG("crtc%d failed valid clone check for mask
>>>>> 0x%x\n",
>>>>> +                  crtc->base.id, crtc_state->encoder_mask);
>>>>> +            return -EINVAL;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>>    /**
>>>>>     * drm_atomic_helper_check_modeset - validate state object for
>>>>> modeset changes
>>>>>     * @dev: DRM device
>>>>> @@ -745,6 +764,10 @@ drm_atomic_helper_check_modeset(struct
>>>>> drm_device *dev,
>>>>>            ret = drm_atomic_add_affected_planes(state, crtc);
>>>>>            if (ret != 0)
>>>>>                return ret;
>>>>> +
>>>>> +        ret = drm_atomic_check_valid_clones(state, crtc);
>>>>> +        if (ret != 0)
>>>>> +            return ret;
>>>>>        }
>>>>
>>>> Pretty much the same comment, we should have kunit tests for this.
>>>
>>> Hey Maxime,
>>>
>>> I'm working on the kunit test for this and had a question on the design
>>> for the unit test:
>>>
>>> Since this is a static helper that returns a pretty common error code,
>>> how would you recommend going about making sure that
>>> `drm_atomic_check_valid_clones()` specifically is returning the error
>>> (and not a different part of check_modeset) when testing the
>>> check_valid_clones() failure path?
> 
> So the usual way to test very specific things of a big function is to
> first setup a driver and atomic request which does pass all checks. And
> then do a minimal change which does not pass anymore.
> 
> So what you could do here is have 3 connectors 1 crtc, but only the first
> two connectors can be cloned. Then do an atomic request with those two
> connectors and the crtc. Then the 2nd request is with one of the
> connectors replaced with the 3rd one (so it's still a clone config, but
> not an invalid one), then have a failure.
> 
> Note: I didn't check all the details, I might be getting something wrong
> here, but the idea should work.

Hey Sima,

Ack, FWIW this describes something very similar to my planned test cases 
(my current kunit tests 3 cases -- valid clone, invalid clone, and no 
clones). Will post the changes later today if there's no major 
objections to this.

Thanks,

Jessica Zhang

> 
> Cheers, Sima
> 
>>>
>>> Thanks,
>>>
>>> Jessica Zhang
>>>
>>>>
>>>> Maxime
>>>
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

