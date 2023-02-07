Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 809E568CB56
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 01:43:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A536710E2CB;
	Tue,  7 Feb 2023 00:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5569110E1B8;
 Tue,  7 Feb 2023 00:43:02 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3170AoVd031401; Tue, 7 Feb 2023 00:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=2GVduidvXJPWtS/HXgEfLkB8MgKylonFbkoRzpPt9yI=;
 b=Fz3npc2hjza7WVES2DQfjALhRteytQXAe/U2NGsyWFVPl5cL7cQovb2/NMt4vc7zjRsL
 Fxj0aLUTvZ0czFnNR7smIAx65OPUSJg45tUaQ+pF7UerGD1Hw/+nCnGJWwh7lceg6Sxz
 Q2SAiyP4pQ4S3Ykl+ilKdDnNMgXYwyR+blR+6/7EvIU9brl42ROzQD76zCSGmShg0rUC
 NGYGF8qohyNJ6KOXtxy6Lg6quI5groj39h1RT0Tk4Y4vg3XLrGlnnz5w1keDuJm2lT3H
 UnV21DI5ygt0jgctbZrYfmwBK0xum5uuX7abLECKQJyYSQkhpGv5Apw0ZV/lw44Di8Q5 lQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nhfkacxk9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 00:42:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3170gtDr017110
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 7 Feb 2023 00:42:55 GMT
Received: from [10.110.44.26] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 16:42:55 -0800
Message-ID: <40e92d5b-8799-0b92-3985-480c260c99b3@quicinc.com>
Date: Mon, 6 Feb 2023 16:42:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 21/27] drm/msm/dpu: simplify dpu_plane_validate_src()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-22-dmitry.baryshkov@linaro.org>
 <502f2c4b-193d-07ca-3b73-8fe7a608e736@quicinc.com>
 <d55bb351-bf0d-e8ae-8473-3903ad9419c0@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <d55bb351-bf0d-e8ae-8473-3903ad9419c0@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: yRpEuBag1DWKVi0UQh4tdusPTUlXhGvm
X-Proofpoint-GUID: yRpEuBag1DWKVi0UQh4tdusPTUlXhGvm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070005
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/6/2023 4:27 PM, Dmitry Baryshkov wrote:
> On 07/02/2023 00:40, Abhinav Kumar wrote:
>>
>>
>> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>>> Since the driver uses clipped src coordinates, there is no need to check
>>> against the fb coordinates. Remove corresponding checks and inline
>>> dpu_plane_validate_src().
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> Can you please explain how the clipping in 
>> drm_atomic_helper_check_plane_state() can allow us to remove checking 
>> the fb co-ordinates?
>>
>> The clipping is done using the mode parameters.
>>
>> So lets say the FB being used is smaller than the source buffer by an 
>> incorrect usermode setting.
>>
>> Then the src sspp shall try to fetch the full image of src rectangle 
>> size from a FB which isnt that big leading to a fault.
> 
> This case is checked by the drm_atomic_plane_check().
> 
>>
>> How does the clipping avoid such a case?
> 
> clipping itself does not. However using clipped coordinates from 
> plane_state->src ensures that they already were validated against the FB 
> dimensions. I'll see if I can change the commit message to make it more 
> obvious.
> 

Ah okay, yeah the commit text confused me a bit to look at the clipping 
code in drm_atomic_helper_check_plane_state().

Yes, please change it to point to the helper which addresses this.

>>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 30 ++++++++---------------
>>>   1 file changed, 10 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> index ecf5402ab61a..0986e740b978 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> @@ -894,25 +894,6 @@ static void dpu_plane_cleanup_fb(struct 
>>> drm_plane *plane,
>>>                   old_pstate->needs_dirtyfb);
>>>   }
>>> -static bool dpu_plane_validate_src(struct drm_rect *src,
>>> -                   struct drm_rect *fb_rect,
>>> -                   uint32_t min_src_size)
>>> -{
>>> -    /* Ensure fb size is supported */
>>> -    if (drm_rect_width(fb_rect) > MAX_IMG_WIDTH ||
>>> -        drm_rect_height(fb_rect) > MAX_IMG_HEIGHT)
>>> -        return false;
>>> -
>>> -    /* Ensure src rect is above the minimum size */
>>> -    if (drm_rect_width(src) < min_src_size ||
>>> -        drm_rect_height(src) < min_src_size)
>>> -        return false;
>>> -
>>> -    /* Ensure src is fully encapsulated in fb */
>>> -    return drm_rect_intersect(fb_rect, src) &&
>>> -        drm_rect_equals(fb_rect, src);
>>> -}
>>> -
>>>   static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
>>>                           const struct dpu_sspp_sub_blks *sblk,
>>>                           struct drm_rect src, const struct 
>>> dpu_format *fmt)
>>> @@ -998,6 +979,14 @@ static int dpu_plane_atomic_check(struct 
>>> drm_plane *plane,
>>>       fb_rect.x2 = new_plane_state->fb->width;
>>>       fb_rect.y2 = new_plane_state->fb->height;
>>> +    /* Ensure fb size is supported */
>>> +    if (drm_rect_width(&fb_rect) > MAX_IMG_WIDTH ||
>>> +        drm_rect_height(&fb_rect) > MAX_IMG_HEIGHT) {
>>> +        DPU_DEBUG_PLANE(pdpu, "invalid framebuffer " DRM_RECT_FMT "\n",
>>> +                DRM_RECT_ARG(&fb_rect));
>>> +        return -E2BIG;
>>> +    }
>>> +
>>>       max_linewidth = pdpu->catalog->caps->max_linewidth;
>>>       fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
>>> @@ -1012,7 +1001,8 @@ static int dpu_plane_atomic_check(struct 
>>> drm_plane *plane,
>>>           return -EINVAL;
>>>       /* check src bounds */
>>> -    } else if (!dpu_plane_validate_src(&pipe_cfg->src_rect, 
>>> &fb_rect, min_src_size)) {
>>> +    } else if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
>>> +           drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
>>>           DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
>>>                   DRM_RECT_ARG(&pipe_cfg->src_rect));
>>>           return -E2BIG;
> 
