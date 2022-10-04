Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F115F4BEE
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 00:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F14B10E1F8;
	Tue,  4 Oct 2022 22:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FD910E0A8;
 Tue,  4 Oct 2022 22:31:22 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 294MRZED022237;
 Tue, 4 Oct 2022 22:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=UGLXDdeB7SNoXJnKYZwjp/y/7hp5GEoXOcW+DWQ4dwA=;
 b=nNrqmyFM7u3XqB9hwfVH4nNesu8JdNjgVDr3fNP16gxgroQHXE6nX8RoQZoG8Azx3Vwd
 QlQN1Bigkxnb1/NPkuZYPgvBGeJrdSyFvNQFp7s49zL3Gpm5cBQC6JLimT6U6pAKR6wB
 oB2zG9Nh48MDsR6aTPj49aN31M6cbGVfE7B0A7TDhfGyrKHpQwVbdJ56diXWrWrssYP3
 AMH06lJLu1LH5qH23q5oAuWK3YtKmqdJZ5eBL7MpAiDtHrI8qwrU6pIwHhzxbVmEwIm1
 8XeK8fn2bocFymesorrESTr3sOI+g23U1+5T/DoWoxzihI0M2o1mdrnVAv0SnaNVj0m+ sw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k0rf40j7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Oct 2022 22:31:16 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 294MUDuL010823; 
 Tue, 4 Oct 2022 22:31:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3jxemkmmu9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Oct 2022 22:31:15 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 294MVFv9011565;
 Tue, 4 Oct 2022 22:31:15 GMT
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 294MVF4r011564
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Oct 2022 22:31:15 +0000
Received: from [10.38.243.69] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 4 Oct 2022
 15:31:12 -0700
Message-ID: <1a5ed43e-914e-079d-96bf-c9e3912a9473@quicinc.com>
Date: Tue, 4 Oct 2022 15:31:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 5/5] drm/dsc: Prevent negative BPG offsets from shadowing
 adjacent bitfields
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 <phone-devel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sean Paul
 <sean@poorly.run>, Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez
 Canillas <javierm@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Douglas Anderson <dianders@chromium.org>, Vladimir Lypak
 <vladimir.lypak@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 Lyude Paul <lyude@redhat.com>
References: <20221001190807.358691-1-marijn.suijten@somainline.org>
 <20221001190807.358691-6-marijn.suijten@somainline.org>
 <55d7e20b-79cd-ece6-b643-8b542beb7474@quicinc.com>
 <20221004215745.zdfvulqx4exlujgk@SoMainline.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221004215745.zdfvulqx4exlujgk@SoMainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: wx_SAnp-_Tvfow-WM0yEoh2sQr1s_12h
X-Proofpoint-ORIG-GUID: wx_SAnp-_Tvfow-WM0yEoh2sQr1s_12h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_09,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210040145
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



On 10/4/2022 2:57 PM, Marijn Suijten wrote:
> On 2022-10-04 13:22:25, Abhinav Kumar wrote:
>>
>> On 10/1/2022 12:08 PM, Marijn Suijten wrote:
>>> msm's dsi_host specifies negative BPG offsets which fill the full 8 bits
>>> of a char thanks to two's complement: this however results in those bits
>>> bleeding into the next parameter when the field is only expected to
>>> contain 6-bit wide values.
>>> As a consequence random slices appear corrupted on-screen (tested on a
>>> Sony Tama Akatsuki device with sdm845).
>>>
>>> Use AND operators to limit all values that constitute the RC Range
>>> parameter fields to their expected size.
>>>
>>> Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>> ---
>>>    drivers/gpu/drm/display/drm_dsc_helper.c | 6 +++---
>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
>>> index c869c6e51e2b..2e7ef242685d 100644
>>> --- a/drivers/gpu/drm/display/drm_dsc_helper.c
>>> +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
>>> @@ -243,11 +243,11 @@ void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_payload,
>>>    	 */
>>>    	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
>>>    		pps_payload->rc_range_parameters[i] =
>>> -			cpu_to_be16((dsc_cfg->rc_range_params[i].range_min_qp <<
>>> +			cpu_to_be16(((dsc_cfg->rc_range_params[i].range_min_qp & 0x1f) <<
>>>    				     DSC_PPS_RC_RANGE_MINQP_SHIFT) |
>>> -				    (dsc_cfg->rc_range_params[i].range_max_qp <<
>>> +				    ((dsc_cfg->rc_range_params[i].range_max_qp & 0x1f) <<
>>>    				     DSC_PPS_RC_RANGE_MAXQP_SHIFT) |
>>> -				    (dsc_cfg->rc_range_params[i].range_bpg_offset));
>>> +				    (dsc_cfg->rc_range_params[i].range_bpg_offset & 0x3f));
>>>    	}
>>>    
>>
>> Looking at some examples of this for other vendors, they have managed to
>> limit the value to 6 bits in their drivers:
>>
>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/i915/display/intel_vdsc.c#L532
>>
>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/amd/display/dc/dsc/rc_calc_dpi.c#L87
>>
>> Perhaps, msm should do the same thing instead of the helper change.
> 
> Thanks, I should have done my due-diligence and look up how other
> drivers dealt with this, but wasn't immediately expecting negative
> values elsewhere.
> 
> Alas, as explained in the cover letter I opted to perform the masking in
> the PPS packing code as the DSC block code also reads these values, and
> would suddenly write 6-bit intead of 8-bit values to the
> DSC_RANGE_BPG_OFFSET registers.  Quick testing on the mentioned sdm845
> platform shows no regressions, but I'm not sure if that's safe to rely
> on?

I looked up the MDP_DSC_0_RANGE_BPG_OFFSET_* registers.
They take only a 6-bit value according to the SW documentation ( bits 5:0 )

It was always expecting only a 6-bit value and not 8.

So this change is safe.

> 
>> If you want to move to helper, other drivers need to be changed too to
>> remove duplicate & 0x3f.
> 
> Sure, we only have to confirm whether those drivers also read back the
> value(s) in rc_range_params, and expect / allow this to be 8 instead of
> 6 bits.
> 
>> FWIW, this too has already been fixed in the latest downstream driver too.
> 
> What is this supposed to mean?  Is there a downstream DPU project that
> has pending patches needing to be upstreamed?  Or is the downstream SDE,
> techpack/display, or whatever it is called nowadays, slowly using more
> DRM structs like drm_dsc_config and this drm_dsc_pps_payload_pack()
> helper function as pointed out in an earlier mail?
> 

No, what I meant was, the version of downstream driver based on which 
the upstream DSC was made seems to be an older version. Downstream 
drivers keep getting updated and we always keep trying to align with 
upstream structs.

This is true not just for DSC but even other blocks.

So as part of that effort, we started using struct drm_dsc_config . That 
change was made on newer chipsets. But the downstream SW on sdm845 based 
on which the DSC was upstreamed seems like didnt have that. Hence all 
this redundant math happened.

So this comment was more of a explanation about why this issue happened 
even though latest downstream didnt have this issue.

> Offtopic: are SDE and DPU growing closer together, hopefully achieving
> feature parity allowing the SDE project to be dropped in favour of a
> fully upstreamed DPU driver for day-one out-of-the-box mainline support
> for new SoCs (as long as work is published and on its way upstream)?
> 

There is still a lot of gap between SDE and DPU drivers at this point. 
We keep trying to upstream as many features as possible to minimize the 
gap but there is still a lot of work to do.


> - Marijn
