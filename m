Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B2C9867C4
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 22:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3477610E71F;
	Wed, 25 Sep 2024 20:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="pvlEHb9X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E31B10E161;
 Wed, 25 Sep 2024 20:47:19 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48PH5Mdb021527;
 Wed, 25 Sep 2024 20:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ilg5tfgVnEPmPCjHj4egV6TXzDXzT2qIKba21pN5eZU=; b=pvlEHb9XNTAnKW8D
 Fy+9+TNGHv8Zapn/YcB7/1YX9qC/dlPEezBZ+1CahoTkfk+QOi/2ot729qRpXp0L
 TAdozfw8ZtLg/VrpvUmuFMgqNfRVYx0JaBYK8IqSVTwp6MTLWm0qBJlSegM4Ei7n
 foCWwuTtl5DUJfhlUgXU4eRVGRZXE1u3dPdEeKJsErhBRsHrMbDDIhSTirt1PtEj
 BuD71uQxbia2z67yeiq3S2WIsxFNucZ+7lJ24HWJCecsxsHxhX2eA1s6HoO4fpy3
 NfHQjHEn/r6xIrSqqFzAO4Sf7A+rW4/NoafHt+xw6RyfS/vU7GZRcLJ+9SmJ6ZoF
 z6RCVg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqakn11f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Sep 2024 20:47:13 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48PKlCWd030319
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Sep 2024 20:47:12 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Sep
 2024 13:47:11 -0700
Message-ID: <5a0be97f-a8a5-40dc-a2fa-b3c79c104915@quicinc.com>
Date: Wed, 25 Sep 2024 13:47:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/22] drm: add clone mode check for CRTC
To: Jani Nikula <jani.nikula@linux.intel.com>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-1-7849f900e863@quicinc.com>
 <87bk0c40f1.fsf@intel.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <87bk0c40f1.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 9LRX0bmY2EJ0EHZhzSF9BBTzRPmaP3wO
X-Proofpoint-GUID: 9LRX0bmY2EJ0EHZhzSF9BBTzRPmaP3wO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250147
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



On 9/25/2024 1:12 AM, Jani Nikula wrote:
> On Tue, 24 Sep 2024, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>> Add helper to check if the given CRTC state is in clone mode
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   include/drm/drm_crtc.h | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
>> index 8b48a1974da3..ecb93e2c4afc 100644
>> --- a/include/drm/drm_crtc.h
>> +++ b/include/drm/drm_crtc.h
>> @@ -1323,5 +1323,12 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
>>   
>>   int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
>>   					    unsigned int supported_filters);
>> +static inline bool drm_crtc_in_clone_mode(struct drm_crtc_state *crtc_state)
>> +{
>> +	if (!crtc_state)
>> +		return false;
>> +
>> +	return hweight32(crtc_state->encoder_mask) > 1;
>> +}
> 
> What's the benefit of this being static inline?
> 
> You're implicitly depending on hweight32() being available, basically
> <linux/bitops.h> being included. Maybe it already is, but it's the
> accumulation of small and innocent looking things like this that then
> explode the header dependencies, and make them harder to reduce.

Hi Jani,

Good point, I'll move the implementation to drm_crtc.c.

Thanks,

Jessica Zhang

> 
> BR,
> Jani.
> 
>>   
>>   #endif /* __DRM_CRTC_H__ */
> 
> -- 
> Jani Nikula, Intel

