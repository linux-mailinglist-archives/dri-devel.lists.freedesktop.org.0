Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C19AA81A596
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 17:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3EE910E5D7;
	Wed, 20 Dec 2023 16:49:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E723810E23B;
 Wed, 20 Dec 2023 16:49:07 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BKGe6XA026803; Wed, 20 Dec 2023 16:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=ZbFRKfQ8apHOhegnAQD1nmzIFGR465JSBOj3gnYHwtM=; b=Na
 gBxEGFhWLZDZ8bVq573pBUokR+i/OojEsme+jqQmtdTPivp6m1xv5khWF9CYwlX0
 atVGQpLuB7nW9sIw6cEFEhAIW066FgS/hipaRKUXHBlbSnBH1l4Rgk9bAtGtsnaG
 cAyRBu2Su/zY2fdO/mT2V+FX9z4vdSFIAL6o/u/pDnGM212RSncmQ4C4eDSbfEzh
 60J6bwRk10A16I+7KmCoeuDMAGud/5lnotaD2/tCrI9hYY9TzFHo5PD9ZB5JmO7T
 hgmQtL1LiuJ+9AL4aFjekoydExzQ245ryzpC/9L9fF2NqKmogzMEJ751rwfD57dh
 C5Kt7snbv24i9UTLBkCQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v37vxv940-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Dec 2023 16:49:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BKGmxDM001242
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Dec 2023 16:48:59 GMT
Received: from [10.110.111.239] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 20 Dec
 2023 08:48:57 -0800
Message-ID: <91628bd3-45ab-0e2b-2331-f3f1ea2232b4@quicinc.com>
Date: Wed, 20 Dec 2023 08:48:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6] drm/msm/dpu: improve DSC allocation
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1702580172-30606-1-git-send-email-quic_khsieh@quicinc.com>
 <a5ec8760-cdfe-b420-43c1-913b0095ba93@quicinc.com>
 <CAA8EJpoBiiTbc91E8hSK0seBOXAW++8V8yJzbGmCJJcXbZ3raQ@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJpoBiiTbc91E8hSK0seBOXAW++8V8yJzbGmCJJcXbZ3raQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Lja8mOxvgY7cajDk_jdUI6JXc2yWi9pv
X-Proofpoint-GUID: Lja8mOxvgY7cajDk_jdUI6JXc2yWi9pv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312200120
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, airlied@gmail.com,
 andersson@kernel.org, robdclark@gmail.com, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, vkoul@kernel.org, agross@kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com, swboyd@chromium.org,
 sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/19/2023 2:32 PM, Dmitry Baryshkov wrote:
> On Tue, 19 Dec 2023 at 18:18, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>> Hi Dmitry,
>>
>> Anymore comments from you?
> No, for some reason I missed this patch. Please excuse me.
>
>> On 12/14/2023 10:56 AM, Kuogee Hsieh wrote:
>>> At DSC V1.1 DCE (Display Compression Engine) contains a DSC encoder.
>>> However, at DSC V1.2 DCE consists of two DSC encoders, one has an odd
>>> index and another one has an even index. Each encoder can work
>>> independently. But only two DSC encoders from same DCE can be paired
>>> to work together to support DSC merge mode at DSC V1.2. For DSC V1.1
>>> two consecutive DSC encoders (start with even index) have to be paired
>>> to support DSC merge mode.  In addition, the DSC with even index have
>>> to be mapped to even PINGPONG index and DSC with odd index have to be
>>> mapped to odd PINGPONG index at its data path in regardless of DSC
>>> V1.1 or V1.2. This patch improves DSC allocation mechanism with
>>> consideration of those factors.
>>>
>>> Changes in V6:
>>> -- rename _dpu_rm_reserve_dsc_single to _dpu_rm_dsc_alloc
>>> -- rename _dpu_rm_reserve_dsc_pair to _dpu_rm_dsc_alloc_pair
>>> -- pass global_state to _dpu_rm_pingpong_next_index()
>>> -- remove pp_max
>>> -- fix for loop condition check at _dpu_rm_dsc_alloc()
>>>
>>> Changes in V5:
>>> -- delete dsc_id[]
>>> -- update to global_state->dsc_to_enc_id[] directly
>>> -- replace ndx with idx
>>> -- fix indentation at function declaration
>>> -- only one for loop at _dpu_rm_reserve_dsc_single()
>>>
>>> Changes in V4:
>>> -- rework commit message
>>> -- use reserved_by_other()
>>> -- add _dpu_rm_pingpong_next_index()
>>> -- revise _dpu_rm_pingpong_dsc_check()
>>>
>>> Changes in V3:
>>> -- add dpu_rm_pingpong_dsc_check()
>>> -- for pair allocation use i += 2 at for loop
>>>
>>> Changes in V2:
>>>       -- split _dpu_rm_reserve_dsc() into _dpu_rm_reserve_dsc_single() and
>>>          _dpu_rm_reserve_dsc_pair()
>>>
>>> Fixes: f2803ee91a41 ("drm/msm/disp/dpu1: Add DSC support in RM")
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 154 +++++++++++++++++++++++++++++----
>>>    1 file changed, 139 insertions(+), 15 deletions(-)
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> See below for minor nit.
>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>> index f9215643..0ce2a25 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>> @@ -461,29 +461,153 @@ static int _dpu_rm_reserve_ctls(
>>>        return 0;
>>>    }
>>>
>>> -static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
>>> -                            struct dpu_global_state *global_state,
>>> -                            struct drm_encoder *enc,
>>> -                            const struct msm_display_topology *top)
>>> +static int _dpu_rm_pingpong_next_index(struct dpu_global_state *global_state,
>>> +                                    int start,
> I'd still prefer to see `enum dpu_pingpong` as a parameter here
> instead of just an index, but this is just my taste.

Can you please elaborate more details (pseudo code)  for this?

i can add it at my next DP dsc patches.

>
>>> +                                    uint32_t enc_id)
>>>    {
>>> -     int num_dsc = top->num_dsc;
>>>        int i;
>>>
>>> -     /* check if DSC required are allocated or not */
>>> -     for (i = 0; i < num_dsc; i++) {
>>> -             if (!rm->dsc_blks[i]) {
>>> -                     DPU_ERROR("DSC %d does not exist\n", i);
>>> -                     return -EIO;
>>> +     for (i = start; i < (PINGPONG_MAX - PINGPONG_0); i++) {
>>> +             if (global_state->pingpong_to_enc_id[i] == enc_id)
>>> +                     return i;
>>> +     }
>>> +
>>> +     return -ENAVAIL;
>>> +}
>>> +
>>> +static int _dpu_rm_pingpong_dsc_check(int dsc_idx, int pp_idx)
>>> +{
>>> +     /*
>>> +      * DSC with even index must be used with the PINGPONG with even index
>>> +      * DSC with odd index must be used with the PINGPONG with odd index
>>> +      */
>>> +     if ((dsc_idx & 0x01) != (pp_idx & 0x01))
>>> +             return -ENAVAIL;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int _dpu_rm_dsc_alloc(struct dpu_rm *rm,
>>> +                          struct dpu_global_state *global_state,
>>> +                          uint32_t enc_id,
>>> +                          const struct msm_display_topology *top)
>>> +{
>>> +     int num_dsc = 0;
>>> +     int pp_idx = 0;
>>> +     int dsc_idx;
>>> +     int ret;
>>> +
>>> +     for (dsc_idx = 0; dsc_idx < ARRAY_SIZE(rm->dsc_blks) &&
>>> +          num_dsc < top->num_dsc; dsc_idx++) {
>>> +             if (!rm->dsc_blks[dsc_idx])
>>> +                     continue;
>>> +
>>> +             if (reserved_by_other(global_state->dsc_to_enc_id, dsc_idx, enc_id))
>>> +                     continue;
>>> +
>>> +             pp_idx = _dpu_rm_pingpong_next_index(global_state, pp_idx, enc_id);
>>> +             if (pp_idx < 0)
>>> +                     return -ENAVAIL;
>>> +
>>> +             ret = _dpu_rm_pingpong_dsc_check(dsc_idx, pp_idx);
>>> +             if (ret)
>>> +                     return -ENAVAIL;
>>> +
>>> +             global_state->dsc_to_enc_id[dsc_idx] = enc_id;
>>> +             num_dsc++;
>>> +             pp_idx++;
>>> +     }
>>> +
>>> +     if (num_dsc < top->num_dsc) {
>>> +             DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
>>> +                        num_dsc, top->num_dsc);
>>> +             return -ENAVAIL;
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int _dpu_rm_dsc_alloc_pair(struct dpu_rm *rm,
>>> +                               struct dpu_global_state *global_state,
>>> +                               uint32_t enc_id,
>>> +                               const struct msm_display_topology *top)
>>> +{
>>> +     int num_dsc = 0;
>>> +     int dsc_idx, pp_idx = 0;
>>> +     int ret;
>>> +
>>> +     /* only start from even dsc index */
>>> +     for (dsc_idx = 0; dsc_idx < ARRAY_SIZE(rm->dsc_blks) &&
>>> +          num_dsc < top->num_dsc; dsc_idx += 2) {
>>> +             if (!rm->dsc_blks[dsc_idx] ||
>>> +                 !rm->dsc_blks[dsc_idx + 1])
>>> +                     continue;
>>> +
>>> +             /* consective dsc index to be paired */
>>> +             if (reserved_by_other(global_state->dsc_to_enc_id, dsc_idx, enc_id) ||
>>> +                 reserved_by_other(global_state->dsc_to_enc_id, dsc_idx + 1, enc_id))
>>> +                     continue;
>>> +
>>> +             pp_idx = _dpu_rm_pingpong_next_index(global_state, pp_idx, enc_id);
>>> +             if (pp_idx < 0)
>>> +                     return -ENAVAIL;
>>> +
>>> +             ret = _dpu_rm_pingpong_dsc_check(dsc_idx, pp_idx);
>>> +             if (ret) {
>>> +                     pp_idx = 0;
>>> +                     continue;
>>>                }
>>>
>>> -             if (global_state->dsc_to_enc_id[i]) {
>>> -                     DPU_ERROR("DSC %d is already allocated\n", i);
>>> -                     return -EIO;
>>> +             pp_idx = _dpu_rm_pingpong_next_index(global_state, pp_idx + 1, enc_id);
>>> +             if (pp_idx < 0)
>>> +                     return -ENAVAIL;
>>> +
>>> +             ret = _dpu_rm_pingpong_dsc_check(dsc_idx + 1, pp_idx);
>>> +             if (ret) {
>>> +                     pp_idx = 0;
>>> +                     continue;
>>>                }
>>> +
>>> +             global_state->dsc_to_enc_id[dsc_idx] = enc_id;
>>> +             global_state->dsc_to_enc_id[dsc_idx + 1] = enc_id;
>>> +             num_dsc += 2;
>>> +             pp_idx++;       /* start for next pair */
>>>        }
>>>
>>> -     for (i = 0; i < num_dsc; i++)
>>> -             global_state->dsc_to_enc_id[i] = enc->base.id;
>>> +     if (num_dsc < top->num_dsc) {
>>> +             DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
>>> +                        num_dsc, top->num_dsc);
>>> +             return -ENAVAIL;
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
>>> +                            struct dpu_global_state *global_state,
>>> +                            struct drm_encoder *enc,
>>> +                            const struct msm_display_topology *top)
>>> +{
>>> +     uint32_t enc_id = enc->base.id;
>>> +
>>> +     if (!top->num_dsc || !top->num_intf)
>>> +             return 0;
>>> +
>>> +     /*
>>> +      * Facts:
>>> +      * 1) no pingpong split (two layer mixers shared one pingpong)
>>> +      * 2) DSC pair starts from even index, such as index(0,1), (2,3), etc
>>> +      * 3) even PINGPONG connects to even DSC
>>> +      * 4) odd PINGPONG connects to odd DSC
>>> +      * 5) pair: encoder +--> pp_idx_0 --> dsc_idx_0
>>> +      *                  +--> pp_idx_1 --> dsc_idx_1
>>> +      */
>>> +
>>> +     /* num_dsc should be either 1, 2 or 4 */
>>> +     if (top->num_dsc > top->num_intf)       /* merge mode */
>>> +             return _dpu_rm_dsc_alloc_pair(rm, global_state, enc_id, top);
>>> +     else
>>> +             return _dpu_rm_dsc_alloc(rm, global_state, enc_id, top);
>>>
>>>        return 0;
>>>    }
>
>
