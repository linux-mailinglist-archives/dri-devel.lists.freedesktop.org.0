Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F4964F401
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 23:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5883410E640;
	Fri, 16 Dec 2022 22:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3BE10E05A;
 Fri, 16 Dec 2022 22:21:17 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BGLBKfu007097; Fri, 16 Dec 2022 22:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=mN/CGGq9StXrPQ0xsghpwXjueW4uWopbH2Ftcek2z8w=;
 b=pqCJ1FgTaoG3V0igT4TNiD6Dr2SgRgJW6cKYbmqyyqsop6Q0z9wTZaFqc7uiyRb2uYE2
 koWYK/vyNBA0oVHHOgEJw3NJpUN1JT2wHANs61AvA7Z7heVNg2tnIwJJ6+HjF5q5QszA
 1dgoQnIVZDKg/Z42tGRSbDdRcRSgYRh4OOAJGTgYBmpfuRTYJUQ5nvCmM13Re1Qqzt9P
 ck65xawj+kfnI7i7NpygOQDFt3elbgpMIHyAvrMDPZC24nKPZ8k+JWBf9y+cvDRZu0Ca
 nUnouDWB9suthNTNgepy8A4t1axRQJsqZb/TXS06MUafHyASQf2BKSUIUNrYF5ABYrZv 2w== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mgvecrvma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Dec 2022 22:21:02 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BGMKsip027202
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Dec 2022 22:20:54 GMT
Received: from [10.110.127.101] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 16 Dec
 2022 14:20:52 -0800
Message-ID: <8f33c1d0-a2ca-dc49-1884-01541ad83d49@quicinc.com>
Date: Fri, 16 Dec 2022 14:20:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH 3/6] drm/msm/dpu1: Wire up DSC mask for active CTL
 configuration
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, <phone-devel@vger.kernel.org>, Rob Clark
 <robdclark@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Stephen Boyd" <swboyd@chromium.org>,
 Bjorn Andersson <andersson@kernel.org>, "Jessica
 Zhang" <quic_jesszhan@quicinc.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 "Jani Nikula" <jani.nikula@intel.com>,
 sunliming <sunliming@kylinos.cn>, "Sam Ravnborg" <sam@ravnborg.org>,
 Haowen Bai <baihaowen@meizu.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, "Vinod
 Polimera" <quic_vpolimer@quicinc.com>, Douglas Anderson
 <dianders@chromium.org>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20221213232207.113607-1-marijn.suijten@somainline.org>
 <20221213232207.113607-4-marijn.suijten@somainline.org>
 <184d22f1-7ed1-4a67-1c25-9fafeb94db83@linaro.org>
 <20221214193026.dv2fuubysctcvlkg@SoMainline.org>
 <658da2cf-1e1a-af27-b085-edf0887b8dae@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <658da2cf-1e1a-af27-b085-edf0887b8dae@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: DLSY3xawfJ9w3pOWd6BhsQ2MqOK1jXCZ
X-Proofpoint-ORIG-GUID: DLSY3xawfJ9w3pOWd6BhsQ2MqOK1jXCZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-16_14,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212160199
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/14/2022 5:08 PM, Dmitry Baryshkov wrote:
> On 14/12/2022 21:30, Marijn Suijten wrote:
>> On 2022-12-14 20:43:29, Dmitry Baryshkov wrote:
>>> On 14/12/2022 01:22, Marijn Suijten wrote:
>>>> Active CTLs have to configure what DSC block(s) have to be enabled, and
>>>> what DSC block(s) have to be flushed; this value was initialized to 
>>>> zero
>>>> resulting in the necessary register writes to never happen (or would
>>>> write zero otherwise).  This seems to have gotten lost in the DSC 
>>>> v4->v5
>>>> series while refactoring how the combination with merge_3d was handled.
>>>>
>>>> Fixes: 58dca9810749 ("drm/msm/disp/dpu1: Add support for DSC in 
>>>> encoder")
>>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 1 +
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 1 +
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c  | 2 ++
>>>>    3 files changed, 4 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>>> index ae28b2b93e69..35791f93c33d 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>>> @@ -61,6 +61,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>>>>        intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
>>>>        intf_cfg.stream_sel = cmd_enc->stream_sel;
>>>>        intf_cfg.mode_3d = 
>>>> dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>>>> +    intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
>>>>        ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
>>>>        /* setup which pp blk will connect to this intf */
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>> index 0f71e8fe7be7..9ee3a7306a5f 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>> @@ -274,6 +274,7 @@ static void 
>>>> dpu_encoder_phys_vid_setup_timing_engine(
>>>>        intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_VID;
>>>>        intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>>>>        intf_cfg.mode_3d = 
>>>> dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>>>> +    intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
>>>>        if (phys_enc->hw_pp->merge_3d)
>>>>            intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>>> index 7cbcef6efe17..92ddf9995b37 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>>> @@ -209,6 +209,7 @@ static void dpu_encoder_phys_wb_setup_cdp(struct 
>>>> dpu_encoder_phys *phys_enc)
>>>>            intf_cfg.intf = DPU_NONE;
>>>>            intf_cfg.wb = hw_wb->idx;
>>>> +        intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
>>>
>>> We usually don't have DSC with the writeback, don't we?
>>
>> I am unsure so ended up adding them in writeback regardless.  Downstream
>> uses a separate callback to process intf_cfg.dsc instead of going
>> through setup_intf_cfg().
>>
>> To prevent these from being missed again (in the case of copy&paste),
>> how about instead having some function that sets up intf_cfg with these
>> default values from a phys_enc?  That way most of this remains oblivious
>> to the caller.
> 
> I'm not sure this is possible. E.g. intf_cfg.dsc should not be set for 
> the WB.
> 

Although this change is harmless because 
dpu_encoder_helper_get_dsc(phys_enc) will not return a valid DSC mask 
for the WB encoder, hence the setup_intf_cfg will just skip the DSC 
programming, I also agree that we can skip setting the intf_cfg.dsc for 
the writeback encoder in this patch.

>>
>> On the same note, that callback on non-DPU_CTL_ACTIVE_CFG hardware
>> doesn't use the intf_cfg.dsc member anyway, but it was again added to
>> keep the blocks somewhat consistent (in case it ever becomes used?).
>>
>>>>            if (mode_3d && hw_pp && hw_pp->merge_3d)
>>>>                intf_cfg.merge_3d = hw_pp->merge_3d->idx;
>>>> @@ -230,6 +231,7 @@ static void dpu_encoder_phys_wb_setup_cdp(struct 
>>>> dpu_encoder_phys *phys_enc)
>>>>            intf_cfg.wb = hw_wb->idx;
>>>>            intf_cfg.mode_3d =
>>>>                dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>>>> +        intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);
>>>>            phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, 
>>>> &intf_cfg);
>>>>        }
>>>>    }
>>
>> - Marijn
> 
