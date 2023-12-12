Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F67A80DFCB
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 01:03:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D5B10E37D;
	Tue, 12 Dec 2023 00:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97A810E37D;
 Tue, 12 Dec 2023 00:03:52 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BBNExlU021932; Tue, 12 Dec 2023 00:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=8+aoUWwRFGx+Bep22UTwcFwfOM48DorZUP+7hA8Ky6I=; b=QE
 NlaL0hqWO26W1MML/L09w33vOBsolZTrSdhqAMvuvTNwHCHFl52RrwW/AgUAWqef
 eWLwLP+1hxrrGO5qFDUN2Doz3MK/kD17wkDCEExpqm6NRbayL54DQzuWfuICw13u
 1EvWE6XR2CCF+pTPmLp0vWdMqEwg4ClpKcKwH1cpQEQn2FTg1Pn71BBqPztgf74X
 TCkbVAmOo2zlgsRqoWfS4I1FcaTnh3fWZy+2ilwcNPzPqGJ9VhB6CEHZJZBsWjUZ
 sKVUZDfDIjOvhkiP9eS9Os2zhc2zR/ChgJJo8e14jTNWaK95wlzX6GIj8wA49gCj
 B8j8O6CWJtsMPlRFlCGA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uxaawg8gr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 00:03:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BC03hDm004360
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Dec 2023 00:03:44 GMT
Received: from [10.110.92.163] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 11 Dec
 2023 16:03:42 -0800
Message-ID: <baf2ebe7-7895-9249-8487-a7c7e61a67c6@quicinc.com>
Date: Mon, 11 Dec 2023 16:03:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] drm/msm/dpu: improve DSC allocation
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1702319923-24518-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpqAch3Qhq_nfecA06d9fk1jUMD1Dx0ZgNGrom6BrwFo5A@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJpqAch3Qhq_nfecA06d9fk1jUMD1Dx0ZgNGrom6BrwFo5A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: xLazhS4F138MOW8zl24T1Ex00NFYAMt2
X-Proofpoint-GUID: xLazhS4F138MOW8zl24T1Ex00NFYAMt2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=907 mlxscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312110197
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
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/11/2023 1:30 PM, Dmitry Baryshkov wrote:
> On Mon, 11 Dec 2023 at 20:38, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>> A DCE (Display Compression Engine) contains two DSC hard slice
>> encoders. Each DCE start with even DSC encoder index followed by
> "starts". But it will not be correct. The DCE doesn't start with the
> DSC encoder. DCE consists of two DSC encoders, one has an odd index
> and another one has an even index.
>
>> an odd DSC encoder index. Each encoder can work independently.
>> But Only two DSC encoders from same DCE can be paired to work
> only
>
>> together to support merge mode. In addition, the DSC with even
> There are different merge modes. Here you are talking about the DSC merge mode.
>
>> index have to mapping to even pingpong index and DSC with odd
> PINGPONG (end everywhere else).
>
> have to be mapped, should be used, etc.
>
>> index have to mapping to odd pingpong index at its data path.
>> This patch improve DSC allocation mechanism with consideration
> improves
>
>> of above factors.
> of these factors.
>
>> Changes in V3:
>> -- add dpu_rm_pingpong_dsc_check()
>> -- for pair allocation use i += 2 at for loop
>>
>> Changes in V2:
>>      -- split _dpu_rm_reserve_dsc() into _dpu_rm_reserve_dsc_single() and
>>         _dpu_rm_reserve_dsc_pair()
>>
>> Fixes: f2803ee91a41 ("drm/msm/disp/dpu1: Add DSC support in RM")
> This tag is incorrect. The patch should be split into two pieces. One
> which fixes DSC allocation for DSC 1.1 encoders, where there were no
> DCE blocks, another one which adds proper handling for DCE.
> Unless the paired allocation requirement also applies to pre-DCE DSC
> encoders. But in that case the commit message doesn't make any sense.
>
> I checked 4.x Qualcomm kernels. None of them contained any of these
> restrictions for DSC blocks. Only the displaypack targeting 4.19
> kernel got these changes. But it predates DCE pairs support.

as I said earlier the rule of odd/even pp-index map to odd/even 
dsc-index is there since dsc v1.1.

I think current code (including down stream code) works by luck to not 
encounter a configuration with two independence paths, one with single 
dsc and the other one use two dsc to support dsc merge mode.

this patch is the fix to enforce this rule for both dsc v1.1 and v1.2 
and I will rework commit message yo have better description.


>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 171 ++++++++++++++++++++++++++++++---
>>   1 file changed, 155 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> index 17ecf23..43598ee 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> @@ -470,33 +470,172 @@ static int _dpu_rm_reserve_ctls(
>>          return 0;
>>   }
>>
>> -static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
>> +static int _dpu_rm_pingpong_dsc_check(int dsc_idx,
>> +                                     uint32_t enc_id,
>> +                                     uint32_t *pp_to_enc_id,
>> +                                     int pp_max,
>> +                                     bool pair)
>> +{
>> +       int pp_idx;
>> +
>> +       /*
>> +        * find the pingpong index which had been reserved
>> +        * previously at layer mixer allocation
> during
>
>> +        */
>> +       for (pp_idx = 0; pp_idx < pp_max; pp_idx++) {
>> +               if (pp_to_enc_id[pp_idx] == enc_id)
>> +                       break;
>> +       }
>> +
>> +       /*
>> +        * dsc even index must map to pingpong even index
> DSC with even index.
> be mapped or correspond
>
>
>> +        * dsc odd index must map to pingpong odd index
>> +        */
>> +       if ((dsc_idx & 0x01) != (pp_idx & 0x01))
>> +               return -ENAVAIL;
>> +
>> +       if (pair) {
>> +               /*
>> +                * delete pp_idx so that same pp_id can not be paired with
>> +                * next dsc_id
>> +                */
>> +               pp_to_enc_id[pp_idx] = 0xffff;
>> +       }
> Ugh. "Non tangere circulos meos". Move this deletion away from this function.
>
>> +
>> +       return 0;
>> +
>> +}
>> +
>> +static int _dpu_rm_reserve_dsc_single(struct dpu_rm *rm,
>>                                 struct dpu_global_state *global_state,
>> -                              struct drm_encoder *enc,
>> +                              uint32_t enc_id,
>>                                 const struct msm_display_topology *top)
>>   {
>> -       int num_dsc = top->num_dsc;
>> -       int i;
>> +       int num_dsc = 0;
>> +       int i, ret;
>> +       int dsc_id[DSC_MAX - DSC_0];
>> +       uint32_t *pp_enc_id = global_state->pingpong_to_enc_id;
>> +       int pp_max = PINGPONG_MAX - PINGPONG_0;
>>
>> -       /* check if DSC required are allocated or not */
>> -       for (i = 0; i < num_dsc; i++) {
>> -               if (!rm->dsc_blks[i]) {
>> -                       DPU_ERROR("DSC %d does not exist\n", i);
>> -                       return -EIO;
>> -               }
>> +       memset(dsc_id, 0, sizeof(dsc_id));
>>
>> -               if (global_state->dsc_to_enc_id[i]) {
>> -                       DPU_ERROR("DSC %d is already allocated\n", i);
>> -                       return -EIO;
>> -               }
>> +       for (i = 0; i < ARRAY_SIZE(rm->dsc_blks) && num_dsc >= top->num_dsc; i++) {
> Wait. num_dsc >= top->num_dsc? num_dsc starts with 0, so this loop
> will never be executed?
>
>> +               if (!rm->dsc_blks[i])
>> +                       continue;
>> +
>> +               if (global_state->dsc_to_enc_id[i])     /* used */
> No. Use reserved_by_other instead of inventing your own conditions.
>
>> +                       continue;
>> +
>> +               ret = _dpu_rm_pingpong_dsc_check(i, enc_id, pp_enc_id, pp_max, false);
>> +               if (!ret)
>> +                       dsc_id[num_dsc++] = DSC_0 + i;  /* found, start from DSC_0 */
> The comment is incorrect. Why do we start from DSC_0? Or what starts from DSC_0?
>
>>          }
>>
>> -       for (i = 0; i < num_dsc; i++)
>> -               global_state->dsc_to_enc_id[i] = enc->base.id;
>> +       if (num_dsc < top->num_dsc) {
>> +               DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
>> +                                               num_dsc, top->num_dsc);
>> +               return -ENAVAIL;
>> +       }
>> +
>> +       /* allocate dsc */
>> +       for (i = 0; i < top->num_dsc; i++) {
>> +               int id;
>> +
>> +               id = dsc_id[i];
>> +               if (id >= DSC_0)
>> +                       global_state->dsc_to_enc_id[id - DSC_0] = enc_id;
> Can we fill dsc_to_enc_id directly, without interim arrays?
>
>> +       }
>>
>>          return 0;
>>   }
>>
>> +static int _dpu_rm_reserve_dsc_pair(struct dpu_rm *rm,
>> +                              struct dpu_global_state *global_state,
>> +                              uint32_t enc_id,
>> +                              const struct msm_display_topology *top)
>> +{
>> +       int num_dsc = 0;
>> +       int i, ret;
>> +       int dsc_id[DSC_MAX - DSC_0];
>> +       uint32_t pp_to_enc_id[PINGPONG_MAX - PINGPONG_0];
>> +       uint32_t *dsc_enc_id = global_state->dsc_to_enc_id;
>> +       int pp_max = PINGPONG_MAX - PINGPONG_0;
>> +
>> +       memset(dsc_id, 0, sizeof(dsc_id));
>> +
>> +       /* only start from even dsc index */
>> +       for (i = 0; i < ARRAY_SIZE(rm->dsc_blks) && num_dsc >= top->num_dsc; i += 2) {
>> +               if (!rm->dsc_blks[i] || !rm->dsc_blks[i + 1])
>> +                       continue;
>> +
>> +               /* consective dsc index to be paired */
> consecutive
>
>> +               if (dsc_enc_id[i] || dsc_enc_id[i + 1]) /* used */
>> +                       continue;
> reserved_by_other
>
>> +
>> +               /* fill working copy with pingpong list */
>> +               memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id, sizeof(pp_to_enc_id));
>> +
>> +               ret = _dpu_rm_pingpong_dsc_check(i, enc_id, pp_to_enc_id, pp_max, true);
>> +               if (ret)
>> +                       continue;
>> +
>> +               ret = _dpu_rm_pingpong_dsc_check(i + 1, enc_id, pp_to_enc_id, pp_max, true);
> In the comment several lines below you wrote that num_dsc can be '4'.
> In such case the loop will be executed at least twice. And during the
> second iteration of the loop we are going to get the same PP indices
> as we got during the first one, even though we should have got third
> and fourth PP indices.
>
>> +               if (ret)
>> +                       continue;
>> +
>> +               /* pair found, start from DSC_0 */
> The comment is incorrect.
>
>> +               dsc_id[num_dsc++] = DSC_0 + i;
>> +               dsc_id[num_dsc++] = DSC_0 + i + 1;
>> +       }
>> +
>> +       if (num_dsc < top->num_dsc) {
>> +               DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
>> +                                               num_dsc, top->num_dsc);
>> +               return -ENAVAIL;
>> +       }
>> +
>> +       /* allocate dsc */
>> +       for (i = 0; i < top->num_dsc; i++) {
>> +               int id;
>> +
>> +               id = dsc_id[i];
>> +               if (id >= DSC_0)
>> +                       global_state->dsc_to_enc_id[id - DSC_0] = enc_id;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
>> +                              struct dpu_global_state *global_state,
>> +                              struct drm_encoder *enc,
>> +                              const struct msm_display_topology *top)
>> +{
>> +       uint32_t enc_id = enc->base.id;
>> +
>> +       if (!top->num_dsc || !top->num_intf)
>> +               return 0;
>> +
>> +       /*
>> +        * Truth:
>> +        * 1) every layer mixer only connects to one pingpong
>> +        * 2) no pingpong split -- which is two layer mixers shared one pingpong
>> +        * 3) each DSC engine contains two dsc encoders
>> +        *    -- index(0,1), index (2,3),... etc
>> +        * 4) dsc pair can only happens with same DSC engine
>> +        * 5) odd pingpong connect to odd dsc
>> +        * 6) even pingpong connect to even dsc
>> +        * 7) pair: encoder +--> pp_idx_0 --> dsc_idx_0
>> +                           +--> pp_idx_1 --> dsc_idx_1
>> +        */
>> +
>> +       /* num_dsc should be either 1, 2 or 4 */
>> +       if (top->num_dsc > top->num_intf)       /* merge mode */
>> +               return _dpu_rm_reserve_dsc_pair(rm, global_state, enc_id, top);
>> +       else
>> +               return _dpu_rm_reserve_dsc_single(rm, global_state, enc_id, top);
> So, can we get num_dsc = 2 and still use _dpu_rm_reserve_dsc_single()?
>
>> +}
>> +
>>   static int _dpu_rm_make_reservation(
>>                  struct dpu_rm *rm,
>>                  struct dpu_global_state *global_state,
>> --
>> 2.7.4
>>
>
