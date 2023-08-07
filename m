Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8E1772B47
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1632E10E2E6;
	Mon,  7 Aug 2023 16:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F60A10E2F7;
 Mon,  7 Aug 2023 16:40:17 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 377AtCiw002788; Mon, 7 Aug 2023 16:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=YTG8pqiDjx54HGbJdnw/kFNLmHr+UKhKaxMpHQBP+xs=;
 b=B/VSqB/J8LEWkylDUhPxaIIsRvZzXx111pf+V++ZUADzLbpkGiO6+AE2h5R1OUn4XQej
 WAwC040/QwmLYfviJMnzlDkheEPTtzzW5zZQZbCrNlpD9AnkYSEFEzz9YfX5CvXjjNG+
 7ZqvXwy/I11BsdGFibnk4r4C/kHZaJRqbFMQYTxna8kaPNThBE5d6QCgylI63bt83Go/
 VE4QhUPYvq37i5hg5vaML5BTftOv/XSRrnHQgXQrkROqutywmQdpvE+R/1igGZRnpSBW
 6gArJ/LYP/mWLdNa5tfe5VpwrqoxeJdeOpekBW3Em7ECdbnIRiyAyqDbkDl0ogck7ACZ zQ== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3saxbbrtm2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Aug 2023 16:39:52 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 377Gdqgh003908
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 7 Aug 2023 16:39:52 GMT
Received: from [10.71.109.168] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 7 Aug
 2023 09:39:51 -0700
Message-ID: <c4310b07-6a0c-c22b-1f30-eb6042bc4e97@quicinc.com>
Date: Mon, 7 Aug 2023 09:39:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v5 05/10] drm/atomic: Add solid fill data to plane
 state dump
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230728-solid-fill-v5-0-053dbefa909c@quicinc.com>
 <20230728-solid-fill-v5-5-053dbefa909c@quicinc.com>
 <b3407550-164c-b148-461d-a353eb1ee398@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <b3407550-164c-b148-461d-a353eb1ee398@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 3_RV642YJD0XAaI07BJ518HtWRRI-VwO
X-Proofpoint-GUID: 3_RV642YJD0XAaI07BJ518HtWRRI-VwO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_18,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308070154
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



On 7/28/2023 5:05 PM, Dmitry Baryshkov wrote:
> On 28/07/2023 20:02, Jessica Zhang wrote:
>> Add solid_fill property data to the atomic plane state dump.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/drm_atomic.c |  4 ++++
>>   drivers/gpu/drm/drm_plane.c  | 10 ++++++++++
>>   include/drm/drm_plane.h      |  3 +++
>>   3 files changed, 17 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
>> index c38014abc590..1ee7d08041bc 100644
>> --- a/drivers/gpu/drm/drm_atomic.c
>> +++ b/drivers/gpu/drm/drm_atomic.c
>> @@ -717,6 +717,10 @@ static void drm_atomic_plane_print_state(struct 
>> drm_printer *p,
>>       drm_printf(p, "\tfb=%u\n", state->fb ? state->fb->base.id : 0);
>>       if (state->fb)
>>           drm_framebuffer_print_info(p, 2, state->fb);
>> +    drm_printf(p, "\tsolid_fill=%u\n",
>> +            state->solid_fill_blob ? state->solid_fill_blob->base.id 
>> : 0);
>> +    if (state->solid_fill_blob)
>> +        drm_plane_solid_fill_print_info(p, 2, state);
>>       drm_printf(p, "\tcrtc-pos=" DRM_RECT_FMT "\n", 
>> DRM_RECT_ARG(&dest));
>>       drm_printf(p, "\tsrc-pos=" DRM_RECT_FP_FMT "\n", 
>> DRM_RECT_FP_ARG(&src));
>>       drm_printf(p, "\trotation=%x\n", state->rotation);
>> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
>> index 4188b3491625..009d3ebd9b39 100644
>> --- a/drivers/gpu/drm/drm_plane.c
>> +++ b/drivers/gpu/drm/drm_plane.c
>> @@ -1494,11 +1494,21 @@ const char 
>> *drm_plane_get_pixel_source_name(enum drm_plane_pixel_source pixel_so
>>           return "NONE";
>>       case DRM_PLANE_PIXEL_SOURCE_FB:
>>           return "fb";
>> +    case DRM_PLANE_PIXEL_SOURCE_SOLID_FILL:
>> +        return "solid_fill";
>>       default:
>>           return "";
>>       }
>>   }
> 
> This chunk should be a part of the previous commit. Or dropped 
> completely once DRM_ENUM_NAME_FN is used.
> 
> The rest LGTM.

Hi Dmitry,

Sounds good -- will drop this.

Thanks,

Jessica Zhang

> 
>> +void drm_plane_solid_fill_print_info(struct drm_printer *p, unsigned 
>> int indent,
>> +                     const struct drm_plane_state *state)
>> +{
>> +    drm_printf_indent(p, indent, "r=0x%x\n", state->solid_fill.r);
>> +    drm_printf_indent(p, indent, "g=0x%x\n", state->solid_fill.g);
>> +    drm_printf_indent(p, indent, "b=0x%x\n", state->solid_fill.b);
>> +}
>> +
>>   /**
>>    * drm_plane_get_damage_clips - Returns damage clips.
>>    * @state: Plane state.
>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>> index 234fee3d5a95..303f01f0588c 100644
>> --- a/include/drm/drm_plane.h
>> +++ b/include/drm/drm_plane.h
>> @@ -1000,6 +1000,9 @@ drm_plane_get_damage_clips_count(const struct 
>> drm_plane_state *state);
>>   struct drm_mode_rect *
>>   drm_plane_get_damage_clips(const struct drm_plane_state *state);
>> +void drm_plane_solid_fill_print_info(struct drm_printer *p, unsigned 
>> int indent,
>> +                     const struct drm_plane_state *state);
>> +
>>   int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
>>                            unsigned int supported_filters);
>>
> 
> -- 
> With best wishes
> Dmitry
> 
