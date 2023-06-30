Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECC87441AD
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 19:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD95610E0A4;
	Fri, 30 Jun 2023 17:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D3410E0A4;
 Fri, 30 Jun 2023 17:59:52 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35UEP36x010953; Fri, 30 Jun 2023 17:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=f7EqXuo9+U0LlvJWLejMJultiA8XpJiCKMpiyEuU1GU=;
 b=Fe4q+MtC7Xuw3CEy7UA1uLCMlTX1fVPPansQ8pD/uJ3j4Q0X7ZEyexp4KinwgWYCelSJ
 Uapp4eW07h9vgLNxLh/uDv7h7zsWB2rSWXgkaSMEonyR1JDqafkBRuAjc2jFW/2Q5iT7
 Mb+babbs1r58pDiTe8F7Jd9veDxTCAaW9PhWmqlkmUe1wGLsTo3v4KuL+a4wmoBbAmbd
 PTxUqlwxq+UdNGLWdgLG0yghHsx4mJxsm8GBYoSSZe6JfxrAfDrwTdr/A6JavBDlBzNB
 pNa/aLM/T3YixG37WTbtkKNcuDJiygMJok60J1q2IHoZDjyGJ3eaFo24uX9pnILqRPhZ aQ== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rhxdm8v1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jun 2023 17:59:34 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35UHxDKS021574
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jun 2023 17:59:13 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 30 Jun
 2023 10:59:12 -0700
Message-ID: <559b81a3-c4a5-9e18-57bd-e5af74db99c8@quicinc.com>
Date: Fri, 30 Jun 2023 10:59:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH RFC v4 3/7] drm/atomic: Move framebuffer checks to helper
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-3-f4ec0caa742d@quicinc.com>
 <49be4c4c-8143-a3bf-ddbd-364a2be81e4f@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <49be4c4c-8143-a3bf-ddbd-364a2be81e4f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 6oKPsg-2lqq5DL34Q3IVZkKBgkG2nVMf
X-Proofpoint-ORIG-GUID: 6oKPsg-2lqq5DL34Q3IVZkKBgkG2nVMf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_10,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=954 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306300156
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



On 6/29/2023 5:43 PM, Dmitry Baryshkov wrote:
> On 30/06/2023 03:25, Jessica Zhang wrote:
>> Currently framebuffer checks happen directly in
>> drm_atomic_plane_check(). Move these checks into their own helper
>> method.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/drm_atomic.c | 130 
>> ++++++++++++++++++++++++-------------------
>>   1 file changed, 74 insertions(+), 56 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
>> index b4c6ffc438da..404b984d2d9f 100644
>> --- a/drivers/gpu/drm/drm_atomic.c
>> +++ b/drivers/gpu/drm/drm_atomic.c
>> @@ -580,6 +580,76 @@ plane_switching_crtc(const struct drm_plane_state 
>> *old_plane_state,
>>       return true;
>>   }
>> +static int drm_atomic_check_fb(const struct drm_plane_state *state)
>> +{
>> +    struct drm_plane *plane = state->plane;
>> +    const struct drm_framebuffer *fb = state->fb;
>> +    struct drm_mode_rect *clips;
>> +
>> +    uint32_t num_clips;
>> +    unsigned int fb_width, fb_height;
>> +    int ret;
>> +
>> +    /* Check whether this plane supports the fb pixel format. */
>> +    ret = drm_plane_check_pixel_format(plane, fb->format->format,
>> +                       fb->modifier);
>> +
>> +    if (ret) {
>> +        drm_dbg_atomic(plane->dev,
>> +                   "[PLANE:%d:%s] invalid pixel format %p4cc, 
>> modifier 0x%llx\n",
>> +                   plane->base.id, plane->name,
>> +                   &fb->format->format, fb->modifier);
>> +        return ret;
>> +    }
>> +
>> +    fb_width = fb->width << 16;
>> +    fb_height = fb->height << 16;
>> +
>> +    /* Make sure source coordinates are inside the fb. */
>> +    if (state->src_w > fb_width ||
>> +        state->src_x > fb_width - state->src_w ||
>> +        state->src_h > fb_height ||
>> +        state->src_y > fb_height - state->src_h) {
>> +        drm_dbg_atomic(plane->dev,
>> +                   "[PLANE:%d:%s] invalid source coordinates "
>> +                   "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
>> +                   plane->base.id, plane->name,
>> +                   state->src_w >> 16,
>> +                   ((state->src_w & 0xffff) * 15625) >> 10,
>> +                   state->src_h >> 16,
>> +                   ((state->src_h & 0xffff) * 15625) >> 10,
>> +                   state->src_x >> 16,
>> +                   ((state->src_x & 0xffff) * 15625) >> 10,
>> +                   state->src_y >> 16,
>> +                   ((state->src_y & 0xffff) * 15625) >> 10,
>> +                   fb->width, fb->height);
>> +        return -ENOSPC;
>> +    }
>> +
>> +    clips = __drm_plane_get_damage_clips(state);
>> +    num_clips = drm_plane_get_damage_clips_count(state);
>> +
>> +    /* Make sure damage clips are valid and inside the fb. */
>> +    while (num_clips > 0) {
>> +        if (clips->x1 >= clips->x2 ||
>> +            clips->y1 >= clips->y2 ||
>> +            clips->x1 < 0 ||
>> +            clips->y1 < 0 ||
>> +            clips->x2 > fb_width ||
>> +            clips->y2 > fb_height) {
>> +            drm_dbg_atomic(plane->dev,
>> +                       "[PLANE:%d:%s] invalid damage clip %d %d %d 
>> %d\n",
>> +                       plane->base.id, plane->name, clips->x1,
>> +                       clips->y1, clips->x2, clips->y2);
>> +            return -EINVAL;
>> +        }
>> +        clips++;
>> +        num_clips--;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   /**
>>    * drm_atomic_plane_check - check plane state
>>    * @old_plane_state: old plane state to check
>> @@ -596,9 +666,6 @@ static int drm_atomic_plane_check(const struct 
>> drm_plane_state *old_plane_state,
>>       struct drm_plane *plane = new_plane_state->plane;
>>       struct drm_crtc *crtc = new_plane_state->crtc;
>>       const struct drm_framebuffer *fb = new_plane_state->fb;
>> -    unsigned int fb_width, fb_height;
>> -    struct drm_mode_rect *clips;
>> -    uint32_t num_clips;
>>       int ret;
>>       /* either *both* CRTC and FB must be set, or neither */
>> @@ -625,17 +692,6 @@ static int drm_atomic_plane_check(const struct 
>> drm_plane_state *old_plane_state,
>>           return -EINVAL;
>>       }
>> -    /* Check whether this plane supports the fb pixel format. */
>> -    ret = drm_plane_check_pixel_format(plane, fb->format->format,
>> -                       fb->modifier);
>> -    if (ret) {
>> -        drm_dbg_atomic(plane->dev,
>> -                   "[PLANE:%d:%s] invalid pixel format %p4cc, 
>> modifier 0x%llx\n",
>> -                   plane->base.id, plane->name,
>> -                   &fb->format->format, fb->modifier);
>> -        return ret;
>> -    }
>> -
>>       /* Give drivers some help against integer overflows */
>>       if (new_plane_state->crtc_w > INT_MAX ||
>>           new_plane_state->crtc_x > INT_MAX - (int32_t) 
>> new_plane_state->crtc_w ||
>> @@ -649,49 +705,11 @@ static int drm_atomic_plane_check(const struct 
>> drm_plane_state *old_plane_state,
>>           return -ERANGE;
>>       }
>> -    fb_width = fb->width << 16;
>> -    fb_height = fb->height << 16;
>> -    /* Make sure source coordinates are inside the fb. */
>> -    if (new_plane_state->src_w > fb_width ||
>> -        new_plane_state->src_x > fb_width - new_plane_state->src_w ||
>> -        new_plane_state->src_h > fb_height ||
>> -        new_plane_state->src_y > fb_height - new_plane_state->src_h) {
>> -        drm_dbg_atomic(plane->dev,
>> -                   "[PLANE:%d:%s] invalid source coordinates "
>> -                   "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
>> -                   plane->base.id, plane->name,
>> -                   new_plane_state->src_w >> 16,
>> -                   ((new_plane_state->src_w & 0xffff) * 15625) >> 10,
>> -                   new_plane_state->src_h >> 16,
>> -                   ((new_plane_state->src_h & 0xffff) * 15625) >> 10,
>> -                   new_plane_state->src_x >> 16,
>> -                   ((new_plane_state->src_x & 0xffff) * 15625) >> 10,
>> -                   new_plane_state->src_y >> 16,
>> -                   ((new_plane_state->src_y & 0xffff) * 15625) >> 10,
>> -                   fb->width, fb->height);
>> -        return -ENOSPC;
>> -    }
>> -
>> -    clips = __drm_plane_get_damage_clips(new_plane_state);
>> -    num_clips = drm_plane_get_damage_clips_count(new_plane_state);
>> -
>> -    /* Make sure damage clips are valid and inside the fb. */
>> -    while (num_clips > 0) {
>> -        if (clips->x1 >= clips->x2 ||
>> -            clips->y1 >= clips->y2 ||
>> -            clips->x1 < 0 ||
>> -            clips->y1 < 0 ||
>> -            clips->x2 > fb_width ||
>> -            clips->y2 > fb_height) {
>> -            drm_dbg_atomic(plane->dev,
>> -                       "[PLANE:%d:%s] invalid damage clip %d %d %d 
>> %d\n",
>> -                       plane->base.id, plane->name, clips->x1,
>> -                       clips->y1, clips->x2, clips->y2);
>> -            return -EINVAL;
>> -        }
>> -        clips++;
>> -        num_clips--;
>> +    if (fb) {
> 
> This doesn't only move code, but also changes semantics, making the 
> checks optional if no FB is provided. Consider moving the condition to 
> the next patch. Otherwise LGTM.

Hi Dmitry,

Sounds good.

Thanks,

Jessica Zhang

> 
>> +        ret = drm_atomic_check_fb(new_plane_state);
>> +        if (ret)
>> +            return ret;
>>       }
>>       if (plane_switching_crtc(old_plane_state, new_plane_state)) {
>>
> 
> -- 
> With best wishes
> Dmitry
> 
