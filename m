Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BA57AB822
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 19:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693E110E6B7;
	Fri, 22 Sep 2023 17:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532BB10E6B7;
 Fri, 22 Sep 2023 17:50:14 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38MHKlot017535; Fri, 22 Sep 2023 17:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Tq6gJJYKIaOR288NhHGipRUExs1TJ3M3G1f6vr3gs7Q=;
 b=l0Y0qgLJaJOsjU3zSDtYSahlztNYDtgEoMnCKSDcRh3/0OXX2hDi429f0czi5vjWlfb+
 Hl65x3gq8GxRgmqeQhdBDsg3zj3jLVVR3mJNaaxUKesX6VM99QezrNpAGsfjmtd4g3V7
 5OOJpW7aho/tL5OQyOZ+gkNcdRM1InLlWdpJ8DGTqAVSueK/7LKr2+utN4VXwueqjDWV
 5THLkxGFY39R18qt7M8sLrXGJ0hrbyzbcrcO85msuIgSiEzEAEaVthQRcRkY6MOjLpze
 uPeOkt/PRCQvk7sxUjsdLlqrTMM5hotdv+nVtDxk6DKX6RqWbUP5E+vuw4UrMX76gotV dQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t9f8b038p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Sep 2023 17:49:35 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38MHnYM2010168
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Sep 2023 17:49:34 GMT
Received: from [10.110.112.217] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 22 Sep
 2023 10:49:33 -0700
Message-ID: <752176d8-23f4-4689-8bf4-db27f153fd39@quicinc.com>
Date: Fri, 22 Sep 2023 10:49:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Freedreno] [PATCH RFC v6 07/10] drm/atomic: Loosen FB atomic
 checks
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
 <20230828-solid-fill-v6-7-a820efcce852@quicinc.com>
 <20230829112230.7106a8bf@eldfell>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20230829112230.7106a8bf@eldfell>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: uf7t3up0j0GwKZ7poXrDXC5KIWUYWgH1
X-Proofpoint-ORIG-GUID: uf7t3up0j0GwKZ7poXrDXC5KIWUYWgH1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_15,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309220154
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
Cc: freedreno@lists.freedesktop.org, sebastian.wick@redhat.com,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Maxime
 Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org, Sean
 Paul <sean@poorly.run>, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/29/2023 1:22 AM, Pekka Paalanen wrote:
> On Mon, 28 Aug 2023 17:05:13 -0700
> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> 
>> Loosen the requirements for atomic and legacy commit so that, in cases
>> where pixel_source != FB, the commit can still go through.
>>
>> This includes adding framebuffer NULL checks in other areas to account for
>> FB being NULL when non-FB pixel sources are enabled.
>>
>> To disable a plane, the pixel_source must be NONE or the FB must be NULL
>> if pixel_source == FB.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/drm_atomic.c        | 20 +++++++++++---------
>>   drivers/gpu/drm/drm_atomic_helper.c | 36 ++++++++++++++++++++----------------
>>   include/drm/drm_atomic_helper.h     |  4 ++--
>>   include/drm/drm_plane.h             | 29 +++++++++++++++++++++++++++++
>>   4 files changed, 62 insertions(+), 27 deletions(-)
> 
> ...
> 
>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>> index a58f84b6bd5e..4c5b7bcdb25c 100644
>> --- a/include/drm/drm_plane.h
>> +++ b/include/drm/drm_plane.h
>> @@ -992,6 +992,35 @@ static inline struct drm_plane *drm_plane_find(struct drm_device *dev,
>>   #define drm_for_each_plane(plane, dev) \
>>   	list_for_each_entry(plane, &(dev)->mode_config.plane_list, head)
>>   
>> +/**
>> + * drm_plane_solid_fill_enabled - Check if solid fill is enabled on plane
>> + * @state: plane state
>> + *
>> + * Returns:
>> + * Whether the plane has been assigned a solid_fill_blob
>> + */
>> +static inline bool drm_plane_solid_fill_enabled(struct drm_plane_state *state)
>> +{
>> +	if (!state)
>> +		return false;
>> +	return state->pixel_source == DRM_PLANE_PIXEL_SOURCE_SOLID_FILL && state->solid_fill_blob;
>> +}
>> +
>> +static inline bool drm_plane_has_visible_data(const struct drm_plane_state *state)
>> +{
>> +	switch (state->pixel_source) {
>> +	case DRM_PLANE_PIXEL_SOURCE_NONE:
>> +		return false;
>> +	case DRM_PLANE_PIXEL_SOURCE_SOLID_FILL:
>> +		return state->solid_fill_blob != NULL;
> 
> This reminds me, new UAPI docs did not say what the requirements are for
> choosing solid fill pixel source. Is the atomic commit rejected if
> pixel source is solid fill, but solid_fill property has no blob?

Hi Pekka,

Yes, if pixel_source is solid_fill and the solid_fill property blob 
isn't set, the atomic commit should throw an error.

Will document this in the UAPI.

Thanks,

Jessica Zhang

> 
> This should be doc'd.
> 
> 
> Thanks,
> pq
> 
>> +	case DRM_PLANE_PIXEL_SOURCE_FB:
>> +	default:
>> +		WARN_ON(state->pixel_source != DRM_PLANE_PIXEL_SOURCE_FB);
>> +	}
>> +
>> +	return state->fb != NULL;
>> +}
>> +
>>   bool drm_any_plane_has_format(struct drm_device *dev,
>>   			      u32 format, u64 modifier);
>>   
>>
> 
