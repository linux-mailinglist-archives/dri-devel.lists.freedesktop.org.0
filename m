Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7147453B0
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 03:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B83A10E012;
	Mon,  3 Jul 2023 01:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842FB10E012;
 Mon,  3 Jul 2023 01:49:39 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3631kNHW011271; Mon, 3 Jul 2023 01:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=AxhoZrH6As6Ngj36/Va9pBVl2Qi2+1KjllY18tcRUsU=;
 b=TSsIl6KF0glRghdJHc0GlEIDnUCA0Ge49HpOnsmGPDbKojdJ243210m+K+3Vpcnear0L
 jdiPVQ19vOsyoXnwaFyo6w1EU6vuU1PVIIgdwJ8CuxEJ6BPsxX4Y8cVLwKOA2pZhR1uH
 kgZ9BIrarIlp5AFCowA5ntvDI6GzXJwxgFZRcmM7kB8iP5drvZNscH7l06jF4hk1GvKo
 tP+UsUiTPOXH2wfz198nRgL34dfKG1uG5YCGjrT0L/iKL4m8IT5yW7eKanzv2V/Rp2pr
 RjfNFBJkEM0udtCHe4eXTpH+phpGATtXmI7SeAGefHPSKeMU43MoQvBLbjYWwqJiK0VG PQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rjbrd2t67-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jul 2023 01:49:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3631nWTp010041
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 3 Jul 2023 01:49:32 GMT
Received: from [10.110.68.253] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Sun, 2 Jul 2023
 18:49:32 -0700
Message-ID: <551a072f-b0fd-6f7f-6ab3-6178bf4b9521@quicinc.com>
Date: Sun, 2 Jul 2023 18:49:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 03/19] drm/msm/dpu: simplify peer LM handling
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
 <20230619212519.875673-4-dmitry.baryshkov@linaro.org>
 <9a5d6276-1bbd-ec65-90b0-8625671dbbae@quicinc.com>
 <CAA8EJpr3nJRmUfgLauYoZQP79gmcXHTyOrH1quTX9h_3Uns9DA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpr3nJRmUfgLauYoZQP79gmcXHTyOrH1quTX9h_3Uns9DA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: BzzZrgcKKKZXDbqwt_r7VYFiS19lb-w4
X-Proofpoint-ORIG-GUID: BzzZrgcKKKZXDbqwt_r7VYFiS19lb-w4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-03_01,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307030014
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/2/2023 6:36 PM, Dmitry Baryshkov wrote:
> On Mon, 3 Jul 2023 at 04:34, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 6/19/2023 2:25 PM, Dmitry Baryshkov wrote:
>>> For each LM there is at max 1 peer LM which can be driven by the same
>>> CTL, so there no need to have a mask instead of just an ID of the peer
>>> LM.
>>>
>>
>> The change is ok but the wording seems incorrect. Are you implying that
>> only LM0 and LM1 can be used for CTL0 and so-on? Because thats how this
>> is implying.
>>
>> So any LM can be used with any CTL. Its just that each LM has only one
>> peer. No need to mention anything about CTL.
> 
> Please correct me if I am wrong, with pre-active CTL, each CTL could
> drive any single LM or a fixed LM pair. That's what was meant here.
> Would it be better if I rephrase the commit message in this way?
> 

hmmm, even that could be misleading. Quad LM can be possible in newer 
chipsets.

Thats why I am hesitant to bring CTL into the mix. The binding is 
between LMs and not LM and CTL.

>>
>>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>>> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  2 +-
>>>    .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  4 +--
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 34 +++++++------------
>>>    3 files changed, 15 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> index 0de507d4d7b7..30fb5b1f3966 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> @@ -394,7 +394,7 @@ static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK("8", 1);
>>>        .features = _fmask, \
>>>        .sblk = _sblk, \
>>>        .pingpong = _pp, \
>>> -     .lm_pair_mask = (1 << _lmpair), \
>>> +     .lm_pair = _lmpair, \
>>>        .dspp = _dspp \
>>>        }
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> index b860784ade72..b07caa4b867e 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> @@ -554,14 +554,14 @@ struct dpu_sspp_cfg {
>>>     * @features           bit mask identifying sub-blocks/features
>>>     * @sblk:              LM Sub-blocks information
>>>     * @pingpong:          ID of connected PingPong, PINGPONG_NONE if unsupported
>>> - * @lm_pair_mask:      Bitmask of LMs that can be controlled by same CTL
>>> + * @lm_pair:           ID of LM that can be controlled by same CTL
>>>     */
>>>    struct dpu_lm_cfg {
>>>        DPU_HW_BLK_INFO;
>>>        const struct dpu_lm_sub_blks *sblk;
>>>        u32 pingpong;
>>>        u32 dspp;
>>> -     unsigned long lm_pair_mask;
>>> +     unsigned long lm_pair;
>>>    };
>>>
>>>    /**
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>> index 471842bbb950..e333f4eeafc1 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>> @@ -253,28 +253,19 @@ static bool _dpu_rm_needs_split_display(const struct msm_display_topology *top)
>>>    }
>>>
>>>    /**
>>> - * _dpu_rm_check_lm_peer - check if a mixer is a peer of the primary
>>> + * _dpu_rm_get_lm_peer - get the id of a mixer which is a peer of the primary
>>>     * @rm: dpu resource manager handle
>>>     * @primary_idx: index of primary mixer in rm->mixer_blks[]
>>> - * @peer_idx: index of other mixer in rm->mixer_blks[]
>>> - * Return: true if rm->mixer_blks[peer_idx] is a peer of
>>> - *          rm->mixer_blks[primary_idx]
>>>     */
>>> -static bool _dpu_rm_check_lm_peer(struct dpu_rm *rm, int primary_idx,
>>> -             int peer_idx)
>>> +static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
>>>    {
>>>        const struct dpu_lm_cfg *prim_lm_cfg;
>>> -     const struct dpu_lm_cfg *peer_cfg;
>>>
>>>        prim_lm_cfg = to_dpu_hw_mixer(rm->mixer_blks[primary_idx])->cap;
>>> -     peer_cfg = to_dpu_hw_mixer(rm->mixer_blks[peer_idx])->cap;
>>>
>>> -     if (!test_bit(peer_cfg->id, &prim_lm_cfg->lm_pair_mask)) {
>>> -             DPU_DEBUG("lm %d not peer of lm %d\n", peer_cfg->id,
>>> -                             peer_cfg->id);
>>> -             return false;
>>> -     }
>>> -     return true;
>>> +     if (prim_lm_cfg->lm_pair >= LM_0 && prim_lm_cfg->lm_pair < LM_MAX)
>>> +             return prim_lm_cfg->lm_pair - LM_0;
>>> +     return -EINVAL;
>>>    }
>>>
>>>    /**
>>> @@ -351,7 +342,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>>>        int lm_idx[MAX_BLOCKS];
>>>        int pp_idx[MAX_BLOCKS];
>>>        int dspp_idx[MAX_BLOCKS] = {0};
>>> -     int i, j, lm_count = 0;
>>> +     int i, lm_count = 0;
>>>
>>>        if (!reqs->topology.num_lm) {
>>>                DPU_ERROR("invalid number of lm: %d\n", reqs->topology.num_lm);
>>> @@ -376,16 +367,15 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>>>                ++lm_count;
>>>
>>>                /* Valid primary mixer found, find matching peers */
>>> -             for (j = i + 1; j < ARRAY_SIZE(rm->mixer_blks) &&
>>> -                             lm_count < reqs->topology.num_lm; j++) {
>>> -                     if (!rm->mixer_blks[j])
>>> +             if (lm_count < reqs->topology.num_lm) {
>>> +                     int j = _dpu_rm_get_lm_peer(rm, i);
>>> +
>>> +                     /* ignore the peer if there is an error or if the peer was already processed */
>>> +                     if (j < 0 || j < i)
>>>                                continue;
>>>
>>> -                     if (!_dpu_rm_check_lm_peer(rm, i, j)) {
>>> -                             DPU_DEBUG("lm %d not peer of lm %d\n", LM_0 + j,
>>> -                                             LM_0 + i);
>>> +                     if (!rm->mixer_blks[j])
>>>                                continue;
>>> -                     }
>>>
>>>                        if (!_dpu_rm_check_lm_and_get_connected_blks(rm,
>>>                                        global_state, enc_id, j,
> 
> 
> 
