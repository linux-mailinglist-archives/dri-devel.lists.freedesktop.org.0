Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD13D68876C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 20:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A31BC10E232;
	Thu,  2 Feb 2023 19:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CFC910E60F;
 Thu,  2 Feb 2023 19:15:37 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 312JB93R025696; Thu, 2 Feb 2023 19:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=NA/RyXOFq/lOI6tMvxihXgsxsl6HJr4+IdpCQf33P9M=;
 b=L01je2HfFUJ0MdD1DXNdU9iYXmBjshBWoyzL553YLc9LurezFRK2/jtQOHGg1rpYHlFs
 +X3BTeQyXmFmsTsBxFYqi5AUwgXdtOrHWVDTIK5rYBICdcgPuridzq0M5h2xm4rmw+pq
 4oXTFpP6IlvDYSpCBiK5AJRIhjzSDdveITR211Tc/A9SGD5TBUqxNoD6x7CS7xo7w2Vv
 ViJhAkDOp7mJiFkh1Ro9iJgsvH/wGj3DfyNOoMpmSqHQ67gf9OpqMUXgcx4shlx7G/ih
 CHZQSqGK0kVxKXmvdyV1fTbh1DlSboJzFic8Syeqg9j6Ygb2QjzpCXA228YM2YF86aDM 5A== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nfqt3kbtd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Feb 2023 19:15:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 312JFTtX016894
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 2 Feb 2023 19:15:29 GMT
Received: from [10.110.114.165] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 2 Feb 2023
 11:15:29 -0800
Message-ID: <2de00884-fcc3-7658-811f-9844dea6f5e7@quicinc.com>
Date: Thu, 2 Feb 2023 11:15:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 11/27] drm/msm/dpu: move stride programming to
 dpu_hw_sspp_setup_sourceaddress
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-12-dmitry.baryshkov@linaro.org>
 <8a9ae8b1-dc2b-896e-353d-bb237fa0663e@quicinc.com>
 <CAA8EJpooKAiZfJqz3nYsHbJfNkqxGikNb7U5P3907+nUwoLiNA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpooKAiZfJqz3nYsHbJfNkqxGikNb7U5P3907+nUwoLiNA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: M2Axyb96ArPESOGOTuIHAAaKwD9Z_9b_
X-Proofpoint-GUID: M2Axyb96ArPESOGOTuIHAAaKwD9Z_9b_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_12,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302020172
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



On 2/2/2023 10:55 AM, Dmitry Baryshkov wrote:
> Hi Abhinav,
> 
> On Thu, 2 Feb 2023 at 20:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
>>> Move stride programming to dpu_hw_sspp_setup_sourceaddress(), so that
>>> dpu_hw_sspp_setup_rects() programs only source and destination
>>> rectangles.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> Sorry but once again, I dont see a response to my comment
>>
>> https://patchwork.freedesktop.org/patch/473166/?series=99909&rev=1#comment_875313
>>
>> So let me repeat that here:
>>
>> "This separation is logically correct, but there is another codepath
>> using this.
>>
>> _dpu_plane_color_fill() calls pdpu->pipe_hw->ops.setup_rects.
>>
>> So for solid fill, I presume that stride getting programmed is 0 as
>> there is no buffer to fetch from.
> 
> Could you please verify with the HW team what should be the correct
> stride programming for the solid fill? I'll have to check what is
> being programmed ATM.
> 

Sure, I can check but in the _dpu_plane_color_fill() method the 
pipe_cfg->layout is not filled up so it should be a 0 stride.

>>
>> But with this separation, we will miss re-programming stride and it will
>> remain at the old value even for solid fil cases?
>>
>> You might want to add setup_sourceaddress call there? But that wont make
>> sense either because for solid fill there is nothing to fetch from.
>>
>> Perhaps, another op for stride programming then?
>> "
>>
>> Also, this is the second patch in the series where the previous comments
>> were not resolved/responded to.
>>
>> Hope that this was not just another rebase without looking at the prior
>> comments.
> 
> I might have missed some of the comments during the rebase, please
> excuse me. There was no intent to ignore them.
> 

Ack.

> 
>>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 57 +++++++++++----------
>>>    1 file changed, 29 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>> index 176cd6dc9a69..2bd39c13d54d 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>> @@ -447,7 +447,7 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
>>>    {
>>>        struct dpu_hw_sspp *ctx = pipe->sspp;
>>>        struct dpu_hw_blk_reg_map *c;
>>> -     u32 src_size, src_xy, dst_size, dst_xy, ystride0, ystride1;
>>> +     u32 src_size, src_xy, dst_size, dst_xy;
>>>        u32 src_size_off, src_xy_off, out_size_off, out_xy_off;
>>>        u32 idx;
>>>
>>> @@ -478,44 +478,18 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
>>>        dst_size = (drm_rect_height(&cfg->dst_rect) << 16) |
>>>                drm_rect_width(&cfg->dst_rect);
>>>
>>> -     if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
>>> -             ystride0 = (cfg->layout.plane_pitch[0]) |
>>> -                     (cfg->layout.plane_pitch[1] << 16);
>>> -             ystride1 = (cfg->layout.plane_pitch[2]) |
>>> -                     (cfg->layout.plane_pitch[3] << 16);
>>> -     } else {
>>> -             ystride0 = DPU_REG_READ(c, SSPP_SRC_YSTRIDE0 + idx);
>>> -             ystride1 = DPU_REG_READ(c, SSPP_SRC_YSTRIDE1 + idx);
>>> -
>>> -             if (pipe->multirect_index == DPU_SSPP_RECT_0) {
>>> -                     ystride0 = (ystride0 & 0xFFFF0000) |
>>> -                             (cfg->layout.plane_pitch[0] & 0x0000FFFF);
>>> -                     ystride1 = (ystride1 & 0xFFFF0000)|
>>> -                             (cfg->layout.plane_pitch[2] & 0x0000FFFF);
>>> -             } else {
>>> -                     ystride0 = (ystride0 & 0x0000FFFF) |
>>> -                             ((cfg->layout.plane_pitch[0] << 16) &
>>> -                              0xFFFF0000);
>>> -                     ystride1 = (ystride1 & 0x0000FFFF) |
>>> -                             ((cfg->layout.plane_pitch[2] << 16) &
>>> -                              0xFFFF0000);
>>> -             }
>>> -     }
>>> -
>>>        /* rectangle register programming */
>>>        DPU_REG_WRITE(c, src_size_off + idx, src_size);
>>>        DPU_REG_WRITE(c, src_xy_off + idx, src_xy);
>>>        DPU_REG_WRITE(c, out_size_off + idx, dst_size);
>>>        DPU_REG_WRITE(c, out_xy_off + idx, dst_xy);
>>> -
>>> -     DPU_REG_WRITE(c, SSPP_SRC_YSTRIDE0 + idx, ystride0);
>>> -     DPU_REG_WRITE(c, SSPP_SRC_YSTRIDE1 + idx, ystride1);
>>>    }
>>>
>>>    static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
>>>                struct dpu_hw_pipe_cfg *cfg)
>>>    {
>>>        struct dpu_hw_sspp *ctx = pipe->sspp;
>>> +     u32 ystride0, ystride1;
>>>        int i;
>>>        u32 idx;
>>>
>>> @@ -537,6 +511,33 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
>>>                DPU_REG_WRITE(&ctx->hw, SSPP_SRC3_ADDR + idx,
>>>                                cfg->layout.plane_addr[2]);
>>>        }
>>> +
>>> +     if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
>>> +             ystride0 = (cfg->layout.plane_pitch[0]) |
>>> +                     (cfg->layout.plane_pitch[1] << 16);
>>> +             ystride1 = (cfg->layout.plane_pitch[2]) |
>>> +                     (cfg->layout.plane_pitch[3] << 16);
>>> +     } else {
>>> +             ystride0 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE0 + idx);
>>> +             ystride1 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE1 + idx);
>>> +
>>> +             if (pipe->multirect_index == DPU_SSPP_RECT_0) {
>>> +                     ystride0 = (ystride0 & 0xFFFF0000) |
>>> +                             (cfg->layout.plane_pitch[0] & 0x0000FFFF);
>>> +                     ystride1 = (ystride1 & 0xFFFF0000)|
>>> +                             (cfg->layout.plane_pitch[2] & 0x0000FFFF);
>>> +             } else {
>>> +                     ystride0 = (ystride0 & 0x0000FFFF) |
>>> +                             ((cfg->layout.plane_pitch[0] << 16) &
>>> +                              0xFFFF0000);
>>> +                     ystride1 = (ystride1 & 0x0000FFFF) |
>>> +                             ((cfg->layout.plane_pitch[2] << 16) &
>>> +                              0xFFFF0000);
>>> +             }
>>> +     }
>>> +
>>> +     DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE0 + idx, ystride0);
>>> +     DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE1 + idx, ystride1);
>>>    }
>>>
>>>    static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
> 
> 
> 
