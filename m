Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C5080A9BC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 17:50:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C83110E15B;
	Fri,  8 Dec 2023 16:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1962010EAC9;
 Fri,  8 Dec 2023 16:50:24 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B8Ghibg013101; Fri, 8 Dec 2023 16:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=d7iaiuLnTs1nTerRivXfsPIu2c4lLoqHhnJU4Qwcqx0=;
 b=JMRR/+EvFWStI5Rl+13oe9fZUwwrTxIFcOx6Z0VeOwc9Y1yIOO0MPa54eq5MEMPYFHDs
 HgU+a+edGcrmWLbVhVBfecqsoCFPXI1mQFm3rguJaO7H/to1n9DbarkgCB1Fd1Zb8zGl
 co9+PZN7LIWxb6wtNbhdqn0AiER9z/eY4dMPo1xXKfIMX7gpI5QlpUsLnv6zF5WPQj+6
 WFMGKBC+LnZiMAIs32cgvbMddYS3/MuyddYcdeWzL9K9u9sECX8Cse3LKSZ7nxyORvnx
 KRCyJdkU5ISxLYbrv7RFp1DNpLYM56YGlTDciIgurTq9HRwyHoAFD2IKmxr34YTietco qQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uux1998d5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Dec 2023 16:50:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B8GoKsH027427
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 8 Dec 2023 16:50:20 GMT
Received: from [10.110.30.94] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 8 Dec
 2023 08:50:17 -0800
Message-ID: <0484fef8-872d-a5cd-cafa-307b93487d2c@quicinc.com>
Date: Fri, 8 Dec 2023 08:50:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 14/16] drm/msm/dpu: reserve cdm blocks for writeback in
 case of YUV output
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-15-quic_abhinavk@quicinc.com>
 <CAA8EJpo4XVMJ7RqsZZ6Eh_PjoPeWiMmAW3P1a4dkZ_EHqz7GkQ@mail.gmail.com>
 <188e0168-a45b-6e38-ac49-8b0fd41e9110@quicinc.com>
 <CAA8EJpoVfuybVPddKy2Sn-YsovkbiWmoNa48jKjdpKg4HiJaAg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpoVfuybVPddKy2Sn-YsovkbiWmoNa48jKjdpKg4HiJaAg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _7QgQ0c9S1qlfJbGyQvnj8KrZNxY3_dJ
X-Proofpoint-ORIG-GUID: _7QgQ0c9S1qlfJbGyQvnj8KrZNxY3_dJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_11,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080139
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/8/2023 8:38 AM, Dmitry Baryshkov wrote:
> On Fri, 8 Dec 2023 at 18:34, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 12/8/2023 3:54 AM, Dmitry Baryshkov wrote:
>>> On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>> Reserve CDM blocks for writeback if the format of the output fb
>>>> is YUV. At the moment, the reservation is done only for writeback
>>>> but can easily be extended by relaxing the checks once other
>>>> interfaces are ready to output YUV.
>>>>
>>>> changes in v2:
>>>>           - use needs_cdm from topology struct
>>>>           - drop fb related checks from atomic_mode_set()
>>>
>>> It looks like this should be squashed with the patch 11. The 'unbind
>>> CDM' doesn't really make sense without this patch. We need to allocate
>>> it first,  before touching it.
>>>
>>
>> The way I was thinking was that patch just completes the
>> dpu_encoder_phys_cleanup() and yes it was intentionally kept ahead
>> because that will not kick in till hw_cdm is assigned.
>>
>> Then, this patch only handles reserving/assignment of hw_cdm when needed.
>>
>> That was the motivation behind this split.
> 
> It leaves a leaf code that is not used at all. There is no need to
> cleanup anything if it was not allocated. Please remove the split and
> squash it with allocation.
> 

Ack. No concerns with squashing them.

>>
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 27 +++++++++++++++++++++
>>>>    1 file changed, 27 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> index 862912727925..a576e3e62429 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> @@ -16,6 +16,7 @@
>>>>    #include <drm/drm_crtc.h>
>>>>    #include <drm/drm_file.h>
>>>>    #include <drm/drm_probe_helper.h>
>>>> +#include <drm/drm_framebuffer.h>
>>>>
>>>>    #include "msm_drv.h"
>>>>    #include "dpu_kms.h"
>>>> @@ -583,6 +584,7 @@ static int dpu_encoder_virt_atomic_check(
>>>>           struct drm_display_mode *adj_mode;
>>>>           struct msm_display_topology topology;
>>>>           struct dpu_global_state *global_state;
>>>> +       struct drm_framebuffer *fb;
>>>>           struct drm_dsc_config *dsc;
>>>>           int i = 0;
>>>>           int ret = 0;
>>>> @@ -623,6 +625,22 @@ static int dpu_encoder_virt_atomic_check(
>>>>
>>>>           topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
>>>>
>>>> +       /*
>>>> +        * Use CDM only for writeback at the moment as other interfaces cannot handle it.
>>>> +        * if writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
>>>> +        * earlier.
>>>> +        */
>>>> +       if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
>>>> +               fb = conn_state->writeback_job->fb;
>>>> +
>>>> +               if (fb && DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(fb))))
>>>> +                       topology.needs_cdm = true;
>>>> +               if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
>>>> +                       crtc_state->mode_changed = true;
>>>> +               else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
>>>> +                       crtc_state->mode_changed = true;
>>>> +       }
>>>> +
>>>>           /*
>>>>            * Release and Allocate resources on every modeset
>>>>            * Dont allocate when active is false.
>>>> @@ -1063,6 +1081,15 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>>>
>>>>           dpu_enc->dsc_mask = dsc_mask;
>>>>
>>>> +       if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
>>>> +               struct dpu_hw_blk *hw_cdm = NULL;
>>>> +
>>>> +               dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>>>> +                                             drm_enc->base.id, DPU_HW_BLK_CDM,
>>>> +                                             &hw_cdm, 1);
>>>> +               dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
>>>> +       }
>>>> +
>>>>           cstate = to_dpu_crtc_state(crtc_state);
>>>>
>>>>           for (i = 0; i < num_lm; i++) {
>>>> --
>>>> 2.40.1
>>>>
>>>
>>>
>>> --
>>> With best wishes
>>>
>>> Dmitry
> 
> 
> 
