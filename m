Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 296AA68E262
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 21:57:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DAD10E608;
	Tue,  7 Feb 2023 20:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E69310E5FD;
 Tue,  7 Feb 2023 20:57:50 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317KGtTn003284; Tue, 7 Feb 2023 20:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ZK1RabY+61l7FDo017GPhpwIFxio8+eRMbe/+KRPo8A=;
 b=pNL5wbGf4ugXqbyHpK1WzqCfXOPPFio8hh8BaWNET9PXvLSIO+yCtnVSLeRJN85TWeci
 /1/ynTq2+CnsJR2/AQgOx6TDxKvCk47wKXH8WpufWOc2+caMaPHsdGcxZlroymIkv0KS
 BjE9PoH5PrpZtLCYyto0JQba0Mv7Xb+ZnYlk1faE/isJy9QtG9DDqqmuBY9tTCR4avhJ
 1oKl6CYZiFKdQxpb4yHQ4qpTVC9a5IXnDwMSCWiqQEvufudUQzuJW8+vR6GzvFFGpFJx
 k8H2JeN+ye/10OUkQc9k2Nqm52VIAY/NEkQhuSihdPahghUXLAlOMWYQ7+qumlqDqLHM KQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nkga2t563-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 20:57:44 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 317KvdR8012433
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 7 Feb 2023 20:57:39 GMT
Received: from [10.110.44.26] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 7 Feb 2023
 12:57:10 -0800
Message-ID: <d908ff60-f0c9-7c20-da98-3be8db243ab9@quicinc.com>
Date: Tue, 7 Feb 2023 12:57:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 24/27] drm/msm/dpu: rework plane CSC setting
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-25-dmitry.baryshkov@linaro.org>
 <b4dbe036-81c4-e56f-12fb-75cb8bb59173@quicinc.com>
 <CAA8EJpqQJdrvx4KML1pFYwM1ogYYie6Wct+ueJYMBAYb2-k=xQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqQJdrvx4KML1pFYwM1ogYYie6Wct+ueJYMBAYb2-k=xQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: JzCwTaOdQHiD2LCteyFTNL9Qj2WkHZW0
X-Proofpoint-ORIG-GUID: JzCwTaOdQHiD2LCteyFTNL9Qj2WkHZW0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_13,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 adultscore=0 mlxlogscore=712 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070180
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/7/2023 12:44 PM, Dmitry Baryshkov wrote:
> On Tue, 7 Feb 2023 at 22:05, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>>> Rework the code flushing CSC settings for the plane. Separate out the
>>> pipe and pipe_cfg as a preparation for r_pipe support.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 45 +++++++++++++----------
>>>    1 file changed, 25 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> index e69499490d39..05047192cb37 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> @@ -576,29 +576,18 @@ static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
>>>        { 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
>>>    };
>>>
>>> -static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, const struct dpu_format *fmt)
>>> +static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_sw_pipe *pipe, const struct dpu_format *fmt)
>>>    {
>>> -     struct dpu_plane_state *pstate = to_dpu_plane_state(pdpu->base.state);
>>>        const struct dpu_csc_cfg *csc_ptr;
>>>
>>> -     if (!pdpu) {
>>> -             DPU_ERROR("invalid plane\n");
>>> -             return NULL;
>>> -     }
>>> -
>>>        if (!DPU_FORMAT_IS_YUV(fmt))
>>>                return NULL;
>>>
>>> -     if (BIT(DPU_SSPP_CSC_10BIT) & pstate->pipe.sspp->cap->features)
>>> +     if (BIT(DPU_SSPP_CSC_10BIT) & pipe->sspp->cap->features)
>>>                csc_ptr = &dpu_csc10_YUV2RGB_601L;
>>>        else
>>>                csc_ptr = &dpu_csc_YUV2RGB_601L;
>>>
>>> -     DPU_DEBUG_PLANE(pdpu, "using 0x%X 0x%X 0x%X...\n",
>>> -                     csc_ptr->csc_mv[0],
>>> -                     csc_ptr->csc_mv[1],
>>> -                     csc_ptr->csc_mv[2]);
>>> -
>>>        return csc_ptr;
>>>    }
>>>
>>> @@ -1049,6 +1038,27 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>>>        return 0;
>>>    }
>>>
>>> +static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe)
>>> +{
>>> +     const struct dpu_format *format = to_dpu_format(msm_framebuffer_format(pdpu->base.state->fb));
>>> +     const struct dpu_csc_cfg *csc_ptr;
>>> +
>>> +     if (!pipe->sspp || !pipe->sspp->ops.setup_csc)
>>> +             return;
>>> +
>>> +     csc_ptr = _dpu_plane_get_csc(pipe, format);
>>> +     if (!csc_ptr)
>>> +             return;
>>> +
>>> +     DPU_DEBUG_PLANE(pdpu, "using 0x%X 0x%X 0x%X...\n",
>>> +                     csc_ptr->csc_mv[0],
>>> +                     csc_ptr->csc_mv[1],
>>> +                     csc_ptr->csc_mv[2]);
>>> +
>>> +     pipe->sspp->ops.setup_csc(pipe->sspp, csc_ptr);
>>> +
>>> +}
>>> +
>>>    void dpu_plane_flush(struct drm_plane *plane)
>>>    {
>>>        struct dpu_plane *pdpu;
>>> @@ -1072,13 +1082,8 @@ void dpu_plane_flush(struct drm_plane *plane)
>>>        else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
>>>                /* force 100% alpha */
>>>                _dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
>>> -     else if (pstate->pipe.sspp && pstate->pipe.sspp->ops.setup_csc) {
>>> -             const struct dpu_format *fmt = to_dpu_format(msm_framebuffer_format(plane->state->fb));
>>> -             const struct dpu_csc_cfg *csc_ptr = _dpu_plane_get_csc(pdpu, fmt);
>>> -
>>> -             if (csc_ptr)
>>> -                     pstate->pipe.sspp->ops.setup_csc(pstate->pipe.sspp, csc_ptr);
>>> -     }
>>
>> Do we need to check for pipe being valid too (pstate->pipe) &&
>> (pstate->pipe.sspp) && pstate->pipe.sspp->ops.setup_csc) ?
>>
>> Before moving the pipe_hw/sw pipe to the state the code used to check
>> for pdpu->pipe_hw to be valid. Since dpu_plane_flush() can be called
>> from other files too , dont we need to check for (pstate->pipe)?
> 
> pstate->pipe is not a pointer, there is nothing to check.

Ah my bad. Only pipe.sspp is a pointer which you are already checking. 
In that case,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> 
>>
>>> +     else
>>> +             dpu_plane_flush_csc(pdpu, &pstate->pipe);
>>>
>>>        /* flag h/w flush complete */
>>>        if (plane->state)
> 
> 
> 
