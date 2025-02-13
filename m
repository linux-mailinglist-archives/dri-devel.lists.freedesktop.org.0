Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E708A334F9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 02:51:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E5A10E37A;
	Thu, 13 Feb 2025 01:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="o8dBWt+P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0EBB10E379;
 Thu, 13 Feb 2025 01:51:26 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CC0tpk010369;
 Thu, 13 Feb 2025 01:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3RrZzmUxHHLNiwmSBc6F03gaN3NGBJVAFD86s91Ywkc=; b=o8dBWt+PDDIM70HK
 TkjewlcXP16lYl3eJITecig+zLoCQacFF7Ygb0o+PAhguk6fMGtUhjUYQ88uuK2H
 S6ekHu/M9Hoye3s0mJKS9c4qEzwnD2qdRmLPt/aDcgHUdqzVmlR3hHXMMG4c2s5u
 gkJfdcMAGz0e+apXZn4TE7vbb60a82mmoDCjvsphQpLtM5jqB//H2YP+5d8I6F40
 sYMF40SzkhPqtEcIzfcyFPfZeu5HEkQ+Id3Sr/BE65bQ42Tkq2ACPJOO/Hn3urOX
 82koA/jE4cA25Fs3I5XkoWhwqeo/KW7KGcY2fqd9vSDe88l9U8ZmV0NSGHEEK1z7
 n+qMJw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qcs5hm71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Feb 2025 01:51:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51D1pDbb001781
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Feb 2025 01:51:13 GMT
Received: from [10.71.110.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Feb
 2025 17:51:12 -0800
Message-ID: <eb0e478f-87c8-4d1d-a491-d0b1120d60b7@quicinc.com>
Date: Wed, 12 Feb 2025 17:51:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/dpu: Fix uninitialized variable
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>
CC: Ethan Carter Edwards <ethan@ethancedwards.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-hardening@vger.kernel.org>
References: <20250209-dpu-v2-1-114dfd4ebefd@ethancedwards.com>
 <8e40c1bf-6da7-46b1-925c-53d1fa25f3ce@quicinc.com>
 <zj7sqsg3ruev4akl5paedsg65qyh53iddqvssrye2pjtfofs3q@u4g3kevpl2jn>
 <nllxmdfk4wwm2bbrg5jc4tt7la65rwqdtt4tqjp36j6dr4hgmx@ukszi5llldup>
 <22c97d77-5983-429b-ba0b-ce821a717a0e@quicinc.com>
Content-Language: en-US
In-Reply-To: <22c97d77-5983-429b-ba0b-ce821a717a0e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 2IV3np8f94ir8rTqzL9pcxLh27P2A1Wp
X-Proofpoint-GUID: 2IV3np8f94ir8rTqzL9pcxLh27P2A1Wp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_08,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502130012
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



On 2/11/2025 4:19 PM, Abhinav Kumar wrote:
> 
> 
> On 2/11/2025 4:13 PM, Dmitry Baryshkov wrote:
>> On Tue, Feb 11, 2025 at 10:23:54AM +0100, Marijn Suijten wrote:
>>> On 2025-02-10 14:14:14, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 2/9/2025 7:51 PM, Ethan Carter Edwards wrote:
>>>>> There is a possibility for an uninitialized *ret* variable to be
>>>>> returned in some code paths.
>>>>>
>>>>> Fix this by initializing *ret* to 0.
>>>>>
>>>>> Addresses-Coverity-ID: 1642546 ("Uninitialized scalar variable")
>>>>> Fixes: 774bcfb731765d ("drm/msm/dpu: add support for virtual planes")
>>>>> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
>>>>> ---
>>>>> Changes in v2:
>>>>> - Return explicit 0 when no error occurs
>>>>> - Add hardening mailing lists
>>>>> - Link to v1: https://lore.kernel.org/r/20250209-dpu- 
>>>>> v1-1-0db666884f70@ethancedwards.com
>>>>> ---
>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 7 +++----
>>>>>    1 file changed, 3 insertions(+), 4 deletions(-)
>>>>>
>>>>
>>>> Thanks for your patch, this was addressed with
>>>>
>>>> https://patchwork.freedesktop.org/patch/631567/ but since this is 
>>>> better
>>>> I am fine with this, will pick this one up
>>>
>>> The `return 0;` in this patch should certainly fix this issue 
>>> entirely and we
>>> don't need to inline the `int ret` for that, which I think is against 
>>> mixed
>>> declaration rules anyway?
>>>
>>> As far as I understand that's what Dmitry suggested in v1, but he r- 
>>> b'd it in
>>> this form.  Dmitry, was that intended?
>>
>> I think it should be fine, if the gcc doesn't warn against it.
>>
> 
> Let me test out the compilation while applying and see if it throws any 
> errors. If it does, will report here and we can go with the other patch.
> 

On my end, compilation looks fine, so will pickup this version.

Thanks

Abhinav
>>>
>>> - Marijn
>>>
>>>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>
>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/ 
>>>>> gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>> index 
>>>>> 098abc2c0003cde90ce6219c97ee18fa055a92a5..af3e541f60c303eb5212524e877129359b5ca98c 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>> @@ -1164,7 +1164,6 @@ int dpu_assign_plane_resources(struct 
>>>>> dpu_global_state *global_state,
>>>>>                       unsigned int num_planes)
>>>>>    {
>>>>>        unsigned int i;
>>>>> -    int ret;
>>>>>        for (i = 0; i < num_planes; i++) {
>>>>>            struct drm_plane_state *plane_state = states[i];
>>>>> @@ -1173,13 +1172,13 @@ int dpu_assign_plane_resources(struct 
>>>>> dpu_global_state *global_state,
>>>>>                !plane_state->visible)
>>>>>                continue;
>>>>> -        ret = dpu_plane_virtual_assign_resources(crtc, global_state,
>>>>> +        int ret = dpu_plane_virtual_assign_resources(crtc, 
>>>>> global_state,
>>>>>                                 state, plane_state);
>>>>>            if (ret)
>>>>> -            break;
>>>>> +            return ret;
>>>>>        }
>>>>> -    return ret;
>>>>> +    return 0;
>>>>>    }
>>>>>    static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct 
>>>>> dpu_sw_pipe *pipe)
>>>>>
>>>>> ---
>>>>> base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
>>>>> change-id: 20250209-dpu-c3fac78fc617
>>>>>
>>>>> Best regards,
>>>>
>>
> 

