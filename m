Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 988429E7D9C
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2024 01:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E4410E1FD;
	Sat,  7 Dec 2024 00:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="OpS0FShT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BD610E1FD;
 Sat,  7 Dec 2024 00:49:02 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B70JxQX023369;
 Sat, 7 Dec 2024 00:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AK74VPG6A9e2QYgKpR9cQJBVCOoLg7G7LnluO38hQd4=; b=OpS0FShTGFm0IoR/
 6a64wEG/tISKcsQYtnmqcQQVyFbhRSZDPkh+D/Y/UUzcqL80PTLKhKl8xgDUbbLF
 6vxADF+2/CztOaUPLELPJC7FbWbf3YbZJKsJRl6sqNUJWcA9mL63+EZdIJ6VN2CN
 2gvvpwsbsDCC/+5T7IBMsra+cFIpRPrdRDMGGV9pPEHIndEjzugHM3ZG1dOwUnsh
 ybHwv5y77qP0o6htqAFDlfP0geOckmGewnGz+/s87BK1aeutBU8840IYzan04gPG
 DsQb+Ogelkz0Fn6rED2K54b2J0t/lboOiY1uzy833azMCB/tQOHZlEztvbtA1S8L
 Fepf9A==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cbqn019d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 07 Dec 2024 00:48:45 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B70miY1011072
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 7 Dec 2024 00:48:44 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Dec 2024
 16:48:44 -0800
Message-ID: <80d08449-71de-4a7f-8b2a-8af565d8d701@quicinc.com>
Date: Fri, 6 Dec 2024 16:48:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/22] drm: Add valid clones check
To: Maxime Ripard <mripard@kernel.org>
CC: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, <quic_ebharadw@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-2-7849f900e863@quicinc.com>
 <20240925-hasty-bald-caribou-eedbf5@houat>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240925-hasty-bald-caribou-eedbf5@houat>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: -zKcDFja7cx9ZYMB7kSujIe0CKHcr77J
X-Proofpoint-GUID: -zKcDFja7cx9ZYMB7kSujIe0CKHcr77J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412070003
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



On 9/25/2024 12:23 AM, Maxime Ripard wrote:
> On Tue, Sep 24, 2024 at 03:59:18PM GMT, Jessica Zhang wrote:
>> Check that all encoders attached to a given CRTC are valid
>> possible_clones of each other.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/drm_atomic_helper.c | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
>> index 43cdf39019a4..cc4001804fdc 100644
>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>> @@ -574,6 +574,25 @@ mode_valid(struct drm_atomic_state *state)
>>   	return 0;
>>   }
>>   
>> +static int drm_atomic_check_valid_clones(struct drm_atomic_state *state,
>> +					 struct drm_crtc *crtc)
>> +{
>> +	struct drm_encoder *drm_enc;
>> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
>> +									  crtc);
>> +
>> +	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
>> +		if ((crtc_state->encoder_mask & drm_enc->possible_clones) !=
>> +		    crtc_state->encoder_mask) {
>> +			DRM_DEBUG("crtc%d failed valid clone check for mask 0x%x\n",
>> +				  crtc->base.id, crtc_state->encoder_mask);
>> +			return -EINVAL;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   /**
>>    * drm_atomic_helper_check_modeset - validate state object for modeset changes
>>    * @dev: DRM device
>> @@ -745,6 +764,10 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>>   		ret = drm_atomic_add_affected_planes(state, crtc);
>>   		if (ret != 0)
>>   			return ret;
>> +
>> +		ret = drm_atomic_check_valid_clones(state, crtc);
>> +		if (ret != 0)
>> +			return ret;
>>   	}
> 
> Pretty much the same comment, we should have kunit tests for this.

Hey Maxime,

I'm working on the kunit test for this and had a question on the design 
for the unit test:

Since this is a static helper that returns a pretty common error code, 
how would you recommend going about making sure that 
`drm_atomic_check_valid_clones()` specifically is returning the error 
(and not a different part of check_modeset) when testing the 
check_valid_clones() failure path?

Thanks,

Jessica Zhang

> 
> Maxime

