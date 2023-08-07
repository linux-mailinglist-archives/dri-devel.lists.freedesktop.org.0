Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6655772B30
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEC810E2E1;
	Mon,  7 Aug 2023 16:39:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E271D10E2DE;
 Mon,  7 Aug 2023 16:39:21 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 377FApLo031331; Mon, 7 Aug 2023 16:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=pEmL8EA32jpYep6/aDPvNMia/cr4WbfitZtWhJkKZXY=;
 b=K6Ucd77N/E2gGeYt3OxZX6FFqF17iR90gdwUlC1vtG23Sh4M89hKJKGxyvFarEH+TdW6
 Z9Ts1FqfcbuJrl8c0/44/VeCezB6rZIyPF1dt3Kwt72vgi6adqvQYYinIFh3BlkLiLRf
 N/sYRg2f6DqSTnzZ736ncXoKov+3RkCrIRHksTiuMYstXCormt8nokr5R2AJMtf/+0qa
 YwFgUvEaCtu2xXcMy4RLm9RQ1KEBLJEA7qumcuXQUjhBqfUd1xTfFihCRi71ISZES6PG
 GL1P8XzzmqSTZxtJRA1PYhCLNe5zQkqS4aLYVESqMYgXi+G2WIL7i2MWZp24aA6T36Ne Wg== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s9deem0vr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Aug 2023 16:39:03 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 377Gd26B028311
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 7 Aug 2023 16:39:02 GMT
Received: from [10.71.109.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 7 Aug
 2023 09:39:01 -0700
Message-ID: <d278785e-be67-cfa2-ead2-a0003c430569@quicinc.com>
Date: Mon, 7 Aug 2023 09:39:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v5 04/10] drm/atomic: Add pixel source to plane state
 dump
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
 <20230728-solid-fill-v5-4-053dbefa909c@quicinc.com>
 <de6abbcf-9c0d-f51e-b140-938f2c537f74@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <de6abbcf-9c0d-f51e-b140-938f2c537f74@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: qSiixsqYXp7fJuFONrzsE-9mYXfv1nE4
X-Proofpoint-ORIG-GUID: qSiixsqYXp7fJuFONrzsE-9mYXfv1nE4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_17,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 mlxlogscore=787
 mlxscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308070153
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
Cc: sebastian.wick@redhat.com, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ppaalanen@gmail.com, laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/28/2023 5:04 PM, Dmitry Baryshkov wrote:
> On 28/07/2023 20:02, Jessica Zhang wrote:
>> Add pixel source to the atomic plane state dump
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/drm_atomic.c        |  1 +
>>   drivers/gpu/drm/drm_crtc_internal.h |  2 ++
>>   drivers/gpu/drm/drm_plane.c         | 12 ++++++++++++
>>   3 files changed, 15 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
>> index b4c6ffc438da..c38014abc590 100644
>> --- a/drivers/gpu/drm/drm_atomic.c
>> +++ b/drivers/gpu/drm/drm_atomic.c
>> @@ -713,6 +713,7 @@ static void drm_atomic_plane_print_state(struct 
>> drm_printer *p,
>>       drm_printf(p, "plane[%u]: %s\n", plane->base.id, plane->name);
>>       drm_printf(p, "\tcrtc=%s\n", state->crtc ? state->crtc->name : 
>> "(null)");
>> +    drm_printf(p, "\tpixel-source=%s\n", 
>> drm_plane_get_pixel_source_name(state->pixel_source));
>>       drm_printf(p, "\tfb=%u\n", state->fb ? state->fb->base.id : 0);
>>       if (state->fb)
>>           drm_framebuffer_print_info(p, 2, state->fb);
>> diff --git a/drivers/gpu/drm/drm_crtc_internal.h 
>> b/drivers/gpu/drm/drm_crtc_internal.h
>> index 501a10edd0e1..75b59ec9f1be 100644
>> --- a/drivers/gpu/drm/drm_crtc_internal.h
>> +++ b/drivers/gpu/drm/drm_crtc_internal.h
>> @@ -38,6 +38,7 @@ enum drm_color_encoding;
>>   enum drm_color_range;
>>   enum drm_connector_force;
>>   enum drm_mode_status;
>> +enum drm_plane_pixel_source;
>>   struct drm_atomic_state;
>>   struct drm_bridge;
>> @@ -267,6 +268,7 @@ int drm_plane_check_pixel_format(struct drm_plane 
>> *plane,
>>                    u32 format, u64 modifier);
>>   struct drm_mode_rect *
>>   __drm_plane_get_damage_clips(const struct drm_plane_state *state);
>> +const char *drm_plane_get_pixel_source_name(enum 
>> drm_plane_pixel_source pixel_source);
>>   /* drm_bridge.c */
>>   void drm_bridge_detach(struct drm_bridge *bridge);
>> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
>> index f342cf15412b..4188b3491625 100644
>> --- a/drivers/gpu/drm/drm_plane.c
>> +++ b/drivers/gpu/drm/drm_plane.c
>> @@ -1487,6 +1487,18 @@ __drm_plane_get_damage_clips(const struct 
>> drm_plane_state *state)
>>                       state->fb_damage_clips->data : NULL);
>>   }
>> +const char *drm_plane_get_pixel_source_name(enum 
>> drm_plane_pixel_source pixel_source)
>> +{
>> +    switch(pixel_source) {
>> +    case DRM_PLANE_PIXEL_SOURCE_NONE:
>> +        return "NONE";
>> +    case DRM_PLANE_PIXEL_SOURCE_FB:
>> +        return "fb";
>> +    default:
>> +        return "";
>> +    }
>> +}
> 
> Please use DRM_ENUM_NAME_FN instead.

Hi Dmitry,

Acked.

Thanks,

Jessica Zhang

> 
>> +
>>   /**
>>    * drm_plane_get_damage_clips - Returns damage clips.
>>    * @state: Plane state.
>>
> 
> -- 
> With best wishes
> Dmitry
> 
