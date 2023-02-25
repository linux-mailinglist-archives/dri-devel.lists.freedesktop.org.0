Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C06C36A25C5
	for <lists+dri-devel@lfdr.de>; Sat, 25 Feb 2023 01:37:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA5A10EE0D;
	Sat, 25 Feb 2023 00:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E34210EDE7;
 Sat, 25 Feb 2023 00:36:57 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31P0QVHd032234; Sat, 25 Feb 2023 00:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=DH8XUo1wfrsST3Y5skMmkcChZYkiX39vQsitKaeRFMI=;
 b=SZTutDF6u/8Ng/ZIgi0DZmT/TUh/LVcQnr/KtFPqJeaQ80/6zFxZsULNkuy64zYHr5yP
 7Wf5ZHtpH5PF4hYzHwBXBJoLVPUiMzt1efJZpAkrjQeoZ6TxlsG8RjQJrbVrAxfb2BpQ
 N1+WSWUc/Jh6oLK9pWX4pI6Oq5lNiXicWcbXMsgaRggn6PVcYI7cYx8TbC/orb3uy4t9
 1i3qSNdwCLKKNdIcXYpLyhK1q4+GQt3qbTZ9U6lxwZhdD4LMmEHfj2bG2O5jKlA42bQX
 PbDuSKq+Czy0CmP7eCg+JqW5awXi2cwhn+8FEWza6Wxpcc6nvf1H+fOgOYXvUdN8OYrC rw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nxwb7ss7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 25 Feb 2023 00:36:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31P0an1d017815
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 25 Feb 2023 00:36:49 GMT
Received: from [10.110.89.76] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 24 Feb
 2023 16:36:47 -0800
Message-ID: <f0dfba42-4674-3748-bf5d-39f6e1745f67@quicinc.com>
Date: Fri, 24 Feb 2023 16:36:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH 1/2] drm/msm/dpu: add dsc helper functions
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1677267647-28672-1-git-send-email-quic_khsieh@quicinc.com>
 <1677267647-28672-2-git-send-email-quic_khsieh@quicinc.com>
 <42b3c193-8897-cfe9-1cae-2f9a66f7983a@linaro.org>
 <741be2a3-0208-2f40-eedf-d439c4e6795b@quicinc.com>
 <F8A4FC18-C64E-4011-BC08-18EB3B95A357@linaro.org>
 <d5ee8233-66c8-9b88-417c-6cf9cc5c84fe@quicinc.com>
 <CAA8EJpro5Q-2ZpnDJt40UhFX7Zp9oBhrto=FDOERzCDR2BDPvQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpro5Q-2ZpnDJt40UhFX7Zp9oBhrto=FDOERzCDR2BDPvQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: xgZfQM1bSOPNTPNPPrunkcCEdrBrQapC
X-Proofpoint-ORIG-GUID: xgZfQM1bSOPNTPNPPrunkcCEdrBrQapC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_18,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 spamscore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302250000
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, andersson@kernel.org,
 freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, marijn.suijten@somainline.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/24/2023 3:53 PM, Dmitry Baryshkov wrote:
> On Sat, 25 Feb 2023 at 00:26, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>> On 2/24/2023 1:36 PM, Dmitry Baryshkov wrote:
>>> 24 февраля 2023 г. 23:23:03 GMT+02:00, Abhinav Kumar <quic_abhinavk@quicinc.com> пишет:
>>>> On 2/24/2023 1:13 PM, Dmitry Baryshkov wrote:
>>>>> On 24/02/2023 21:40, Kuogee Hsieh wrote:
>>>>>> Add DSC helper functions based on DSC configuration profiles to produce
>>>>>> DSC related runtime parameters through both table look up and runtime
>>>>>> calculation to support DSC on DPU.
>>>>>>
>>>>>> There are 6 different DSC configuration profiles are supported currently.
>>>>>> DSC configuration profiles are differiented by 5 keys, DSC version (V1.1),
>>>>>> chroma (444/422/420), colorspace (RGB/YUV), bpc(8/10),
>>>>>> bpp (6/7/7.5/8/9/10/12/15) and SCR (0/1).
>>>>>>
>>>>>> Only DSC version V1.1 added and V1.2 will be added later.
>>>>>
>>>>> These helpers should go to drivers/gpu/drm/display/drm_dsc_helper.c
>>>>> Also please check that they can be used for i915 or for amdgpu (ideally for both of them).
>>>>>
>>>>
>>>> No, it cannot. So each DSC encoder parameter is calculated based on the HW core which is being used.
>>>>
>>>> They all get packed to the same DSC structure which is the struct drm_dsc_config but the way the parameters are computed is specific to the HW.
>>>>
>>>> This DPU file helper still uses the drm_dsc_helper's drm_dsc_compute_rc_parameters() like all other vendors do but the parameters themselves are very HW specific and belong to each vendor's dir.
>>>>
>>>> This is not unique to MSM.
>>>>
>>>> Lets take a few other examples:
>>>>
>>>> AMD: https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c#L165
>>>>
>>>> i915: https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/i915/display/intel_vdsc.c#L379
>>>
>>> I checked several values here. Intel driver defines more bpc/bpp combinations, but the ones which are defined in intel_vdsc and in this patch seem to match. If there are major differences there, please point me to the exact case.
>>>
>>> I remember that AMD driver might have different values.
>>>
>>
>> Some values in the rc_params table do match. But the rc_buf_thresh[] doesnt.
> 
> Because later they do:
> 
> vdsc_cfg->rc_buf_thresh[i] = rc_buf_thresh[i] >> 6;
> 
>>
>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/i915/display/intel_vdsc.c#L40
>>
>> Vs
>>
>> +static u16 dpu_dsc_rc_buf_thresh[DSC_NUM_BUF_RANGES - 1] = {
>> +               0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54,
>> +               0x62, 0x69, 0x70, 0x77, 0x79, 0x7b, 0x7d, 0x7e
>> +};
> 
> I'd prefer to have 896, 1792, etc. here, as those values come from the
> standard. As it's done in the Intel driver.
> 

Got it, thanks

>> I dont know the AMD calculation very well to say that moving this to the
>> helper is going to help.
> 
> Those calculations correspond (more or less) at the first glance to
> what intel does for their newer generations. I think that's not our
> problem for now.
> 

Well, we have to figure out if each value matches and if each of them 
come from the spec for us and i915 and from which section. So it is 
unfortunately our problem.

>>
>> Also, i think its too risky to change other drivers to use whatever math
>> we put in the drm_dsc_helper to compute thr RC params because their code
>> might be computing and using this tables differently.
>>
>> Its too much ownership for MSM developers to move this to drm_dsc_helper
>> and own that as it might cause breakage of basic DSC even if some values
>> are repeated.
> 
> It's time to stop thinking about ownership and start thinking about
> shared code. We already have two instances of DSC tables. I don't
> think having a third instance, which is a subset of an existing
> dataset, would be beneficial to anybody.
> AMD has complicated code which supports half-bit bpp and calculates
> some of the parameters. But sharing data with the i915 driver is
> straightforward.
> 

Sorry, but I would like to get an ack from i915 folks if this is going
to be useful to them if we move this to helper because we have to look 
at every table. Not just one.

Also, this is just 1.1, we will add more tables for 1.2. So we will have 
to end up changing both 1.1 and 1.2 tables as they are different for QC.

So if you look at the DSC spec from where these tables have come it says

"Common Recommended Rate Control-Related Parameter Values"

Its Recommended but its NOT mandated by the spec to follow every value 
to the dot. I have confirmed this point with more folks.

So, if someone from i915 this is useful and safe to move their code to 
the tables, we can try it.

>> I would prefer to keep it in the msm code but in a top level directory
>> so that we dont have to make DSI dependent on DPU.
> 
> I haven't changed my opinion. Please move relevant i915's code to
> helpers, verify data against standards and reuse it.
> 



>>>> All vendors compute the values differently and eventually call drm_dsc_compute_rc_parameters()
>>>>
>>>>> I didn't check the tables against the standard (or against the current source code), will do that later.
> 
